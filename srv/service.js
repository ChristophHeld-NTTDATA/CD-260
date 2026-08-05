module.exports = class OrderService extends cds.ApplicationService {
    init() {
        const {
            Product,
            BusinessPartner,
            SalesOrders
        } = this.entities;

        this.on('READ', Product, async (req) => {
            const pr = await cds.connect.to('API_PRODUCT_SRV');
            return pr.run(req.query);
        })
        this.on('READ', SalesOrders, async (req) => {
            const so = await cds.connect.to('API_SALES_ORDER_SRV');
            return so.run(req.query);
        })
        this.on('READ', BusinessPartner, async (req) => {
            const bp = await cds.connect.to('API_BUSINESS_PARTNER');
            return bp.run(req.query);
        })

        return super.init();
    }
};