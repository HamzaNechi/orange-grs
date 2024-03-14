package com.orange.orangegrs.services;

import com.orange.orangegrs.entities.InvoiceItems;
import com.orange.orangegrs.repositories.InvoiceItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InvoiceItemServiceImpl implements InvoiceItemService{

    @Autowired
    InvoiceItemRepository invoiceItemRepository;


    @Override
    public List<InvoiceItems> findInvoiceItemsBySiteId(int siteId) {
        return this.invoiceItemRepository.findInvoiceBySite(siteId);
    }

    @Override
    public List<InvoiceItems> getAllInvoices() {
        return this.invoiceItemRepository.findAll();
    }
}
