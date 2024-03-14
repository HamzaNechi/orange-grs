package com.orange.orangegrs.repositories;

import com.orange.orangegrs.entities.Site;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SiteRepository extends JpaRepository<Site, Long> {
    @Query("SELECT s FROM Site s WHERE s.siteCode LIKE CONCAT(:code, '%')")
    List<Site> findSitesByCode(String code);
}
