package com.orange.orangegrs.repositories;

import com.orange.orangegrs.entities.InvoiceItems;
import com.orange.orangegrs.entities.Site;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface InvoiceItemRepository extends JpaRepository<InvoiceItems, Long> {
    @Query("SELECT i FROM InvoiceItems i WHERE i.siteId= :siteId order by i.itemDate desc limit 6")
    List<InvoiceItems> findInvoiceBySite(int siteId);
}
