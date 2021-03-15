@AbapCatalog.sqlViewName: 'ZAKPPOPRIO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'PO Priority (Basic Interface view)'
define view ZI_AKP_POPriority
  as select from zakp_po_priority
{
      @ObjectModel.text.element: ['Text']
  key priority as Priority,
      @Semantics.text: true
      text     as Text
}
