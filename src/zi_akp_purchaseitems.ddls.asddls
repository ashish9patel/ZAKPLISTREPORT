@AbapCatalog.sqlViewName: 'ZAKPPURITEMS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase items(Basic Interface view)'

//@VDM.viewType: #BASIC

define view ZI_AKP_PurchaseItems
  as select from zakp_pur_item
  association [1]    to ZI_AKP_PurchaseDetails as _PurchaseHeader on $projection.PurchaseDoc = _PurchaseHeader.PurchaseDoc
  association [1..1] to I_Currency             as _Currency       on $projection.Currency = _Currency.Currency
  association [1..1] to I_UnitOfMeasure        as _UOM            on $projection.Unit = _UOM.UnitOfMeasure
{
  key purchase_doc     as PurchaseDoc,
      @ObjectModel.text.element: ['ShortText']
  key purchase_item    as PurchaseItem,
      @Semantics.text: true
      short_text       as ShortText,


      @Semantics.amount.currencyCode: 'Currency'
      price            as Price,
      @Semantics.currencyCode: true
      currency         as Currency,


      @Semantics.quantity.unitOfMeasure: 'Unit'
      quantity         as Quantity,
      @Semantics.unitOfMeasure: true
      unit             as Unit,


      ( price * quantity ) as TotalPrice, //do not do this kind of calculation @Basic interface view level.  (here doing for training ease)

        
      change_date_time as ChangeDateTime,

      _PurchaseHeader,
      _Currency,
      _UOM
}
