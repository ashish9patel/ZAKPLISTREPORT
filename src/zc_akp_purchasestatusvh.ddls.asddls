@AbapCatalog.sqlViewName: 'ZCPOSTATVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Value help for purchase status'

@Search.searchable: true
define view ZC_AKP_PurchaseStatusVH
  as select from ZI_AKP_POStatus
{
      @ObjectModel.text.element: ['Text']
      @EndUserText.label: 'PO Status code'
      
      @Search.defaultSearchElement: true
      @Search.ranking: #MEDIUM
  key Status,
      @Semantics.text: true
      @EndUserText.label: 'PO Status'
      
      @Search.defaultSearchElement: true
      @Search.ranking: #LOW
      @Search.fuzzinessThreshold: 0.7
      Text
}
