@AbapCatalog.sqlViewName: 'ZAKPPURDETTOT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Pur doc tot price(Comp. Interface Views)'

//@VDM.viewType: #COMPOSITE
define view ZI_AKP_PurchaseDetailsTotPrice
  as select from ZI_AKP_PurchaseDetails
{
  key PurchaseDoc,
      //@Semantics.amount.currencyCode: '_PurchaseItems.Currency'
      @Semantics.amount.currencyCode: 'Currency'
      sum( _PurchaseItems.TotalPrice ) as ItemTotalPrice,
      @Semantics.currencyCode: true
      _PurchaseItems.Currency as Currency,
      PoDesc,
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
group by
  PurchaseDoc,
  _PurchaseItems.Currency,
  PoDesc,
  PoStatus,
  PoPriority,
  Ccode,
  CreateBy,
  CreatedDateTime,
  ChangedDateTime;

  
  //1.39.50 strart from here in youtube da4
