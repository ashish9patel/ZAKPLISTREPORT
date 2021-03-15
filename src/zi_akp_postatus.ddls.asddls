@AbapCatalog.sqlViewName: 'ZAKPPOSTAT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'PO Status (Basic Interface view)'
define view ZI_AKP_POStatus
  as select from zakp_po_status
{
      @ObjectModel.text.element: ['Text']
  key status as Status,
      @Semantics.text: true
      text   as Text
}
