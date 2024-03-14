package com.orange.orangegrs.services;

import com.orange.orangegrs.entities.InvoiceItems;

import java.util.List;

public interface InvoiceItemService {
    List<InvoiceItems> findInvoiceItemsBySiteId(int siteId);

    List<InvoiceItems> getAllInvoices();
}
