package com.orange.orangegrs.controllers;

import com.orange.orangegrs.entities.InvoiceItems;
import com.orange.orangegrs.services.InvoiceItemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/invoices")
public class InvoiceItemController {

    @Autowired
    InvoiceItemService invoiceItemService;


    @GetMapping("/{siteId}")
    public List<InvoiceItems> getInvoicesBySite(@PathVariable String siteId){
        int sId = Integer.parseInt(siteId);
        return this.invoiceItemService.findInvoiceItemsBySiteId(sId);
    }
}
