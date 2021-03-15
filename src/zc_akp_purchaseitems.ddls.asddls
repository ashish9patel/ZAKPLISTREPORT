@AbapCatalog.sqlViewName: 'ZCAKPPURITEM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase items (Consumption view)'

//@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true
define view ZC_AKP_PurchaseItems as select from ZI_AKP_PurchaseItems {
    key PurchaseDoc,
    key PurchaseItem,
    ShortText,
    Price,
    Currency,
    Quantity,
    Unit,
    TotalPrice,
    ChangeDateTime,
    /* Associations */
    _Currency,
    _PurchaseHeader,
    _UOM
}
