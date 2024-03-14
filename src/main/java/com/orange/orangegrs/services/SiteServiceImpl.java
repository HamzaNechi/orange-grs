package com.orange.orangegrs.services;

import com.orange.orangegrs.entities.Site;
import com.orange.orangegrs.repositories.SiteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SiteServiceImpl implements SiteService{

    @Autowired
    SiteRepository siteRepository;


    @Override
    public List<Site> findAll() {
        return this.siteRepository.findAll();
    }

    @Override
    public List<Site> findBySiteCode(String code) {
        return siteRepository.findSitesByCode(code);
    }
}
