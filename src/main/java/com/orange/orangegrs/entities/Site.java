package com.orange.orangegrs.entities;

import jakarta.annotation.Nonnull;
import jakarta.annotation.Nullable;
import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Entity
@Getter
@Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
@Table(name = "Sites")
public class Site {

    @Id
    @Nonnull
    @Column( name = "SiteId")
    private int SiteId;

    @Nonnull
    @Column( name = "StatusId")
    private int StatusId;

    @Nonnull
    @Column( name = "ElecTypeId")
    private int ElecTypeId ;

    @Nullable
    @Column( name = "DirectionId")
    private Integer DirectionId;

    @Nullable
    @Column( name = "NetworkTypeId")
    private Integer NetworkTypeId;

    @Nullable
    @Column( name = "SiteCode")
    private String siteCode;

    @Nullable
    @Column( name = "SiteName")
    private String SiteName;

    @Nonnull
    @Column( name = "ElecMeterRef")
    private String ElecMeterRef;

    @Nullable
    @Temporal(TemporalType.DATE)
    @Column( name = "ElecDate")
    private Date ElecDate;


    @Nullable
    @Column( name = "Configuration")
    private String Configuration;

    @Nonnull
    @Column( name = "IsSharing")
    private byte IsSharing;

    @Nullable
    @Column( name = "EstimatedConsumption")
    private Long EstimatedConsumption;


    @Column( name = "MaxConsumption")
    @Nullable
    private Long MaxConsumption;
}
