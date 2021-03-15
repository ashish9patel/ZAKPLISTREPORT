@AbapCatalog.sqlViewName: 'ZAKPPODOC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Pur doc details(Basic Interface view)'

//@VDM.viewType: #BASIC

define view ZI_AKP_PurchaseDetails
  as select from zakp_pur_doc
  association [1..*] to ZI_AKP_PurchaseItems as _PurchaseItems    on $projection.PurchaseDoc = _PurchaseItems.PurchaseDoc
  association [1]    to ZI_AKP_POStatus      as _PurchaseStatus   on $projection.PoStatus = _PurchaseStatus.Status
  association [1]    to ZI_AKP_POPriority    as _PurchasePriority on $projection.PoPriority = _PurchasePriority.Priority
{

      @ObjectModel.text.element: ['PoDesc']
      @EndUserText.label: 'Pur. Doc '
  key purchase_doc      as PurchaseDoc,
      @Semantics.text: true
      po_desc           as PoDesc,
      @EndUserText.label: 'Pur. Status'
      po_status         as PoStatus,
      @EndUserText.label: 'Priority'
      po_priority       as PoPriority,
      
      ccode             as Ccode,
      create_by         as CreateBy,
      created_date_time as CreatedDateTime,
      changed_date_time as ChangedDateTime,

      _PurchaseItems,
      _PurchaseStatus,
      _PurchasePriority
}
