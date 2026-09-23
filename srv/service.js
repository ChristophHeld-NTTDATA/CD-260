module.exports = class OrderService extends cds.ApplicationService {
    init() {
        const {
            SalesOrders,
            SalesOrderNotes,
            FollowUpTasks
        } = this.entities;

        this.on('READ', SalesOrders, async (req) => {
            const so = await cds.connect.to('SALESORDER0001');
            return so.run(req.query);
        })

        this.on('createNote', async (req) => {
            const { salesOrder, note, category } = req.data;
            if (!salesOrder || !note) return req.error(400, 'salesOrder and note are required');

            const entry = { salesOrder, note };
            if (category) entry.category = category;

            return await this.create(SalesOrderNotes).entries(entry);
        })

        this.on('createFollowupTask', async (req) => {
            const { salesOrder, title, description, dueDate, priority } = req.data;
            if (!salesOrder || !title) return req.error(400, 'salesOrder and title are required');

            const entry = { salesOrder, title };
            if (description) entry.description = description;
            if (dueDate) entry.dueDate = dueDate;
            if (priority) entry.priority = priority;

            return await this.create(FollowUpTasks).entries(entry);
        })

        return super.init();
    }
};