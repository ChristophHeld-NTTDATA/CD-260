module.exports = class IceCreamService extends cds.ApplicationService {
    init() {
        const { Flavours, Orders } = this.entities;

        this.on('orderIceCream', async (req) => {
            const { flavour, customerName = 'Guest', scoops = 1 } = req.data;
            if (scoops < 1) return req.error(400, 'scoops must be at least 1');

            const found = await SELECT.one.from(Flavours).columns('name').where({ ID: flavour });
            if (!found) return req.error(404, `Flavour ${flavour} does not exist`);

            // Conditional update so two parallel orders cannot take the same scoops.
            const updated = await UPDATE(Flavours)
                .set({ stock: { '-=': scoops } })
                .where({ ID: flavour, stock: { '>=': scoops } });
            if (!updated) return req.error(409, `Not enough ${found.name} left`);

            const { maxID } = await SELECT.one.from(Orders).columns('max(ID) as maxID');
            const order = {
                ID: (maxID ?? 0) + 1,
                customerName,
                flavour_ID: flavour,
                scoops,
                orderDate: new Date().toISOString().slice(0, 10)
            };
            await INSERT.into(Orders).entries(order);
            return order;
        });

        return super.init();
    }
};
