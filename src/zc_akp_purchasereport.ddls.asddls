@AbapCatalog.sqlViewName: 'ZCAKPPURREP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase report (Consumption view)'

//@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true
@Search.searchable: true
define view ZC_AKP_PurchaseReport as select from  ZI_AKP_PurchaseDetailsTotPrice{
    key PurchaseDoc,
    ItemTotalPrice,
    Currency,
    @Search:{ defaultSearchElement: true, fuzzinessThreshold: 0.7, ranking: #HIGH }
    PoDesc,
    @Consumption.valueHelpDefinition: [{
        entity: {
            name: 'ZC_AKP_PurchaseStatusVH',
            element: 'Status'
        }
    }]
    @Search:{ defaultSearchElement: true, fuzzinessThreshold: 0.7, ranking: #MEDIUM }
    PoStatus,
    PoPriority,
    Ccode,
    CreateBy,
    CreatedDateTime,
    ChangedDateTime,
    
    /* Associations */
    _PurchaseItems,
    _PurchasePriority,
    _PurchaseStatus
}
