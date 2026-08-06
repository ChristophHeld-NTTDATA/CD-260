module.exports = class OrderService extends cds.ApplicationService {
    init() {
        const {
            Product,
            BusinessPartner,
            SalesOrders
        } = this.entities;

        this.on('READ', SalesOrders, async (req) => {
            const so = await cds.connect.to('SALESORDER0001');
            return so.run(req.query);
        })

        return super.init();
    }
};