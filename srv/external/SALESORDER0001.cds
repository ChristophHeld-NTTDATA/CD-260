/* checksum : 82dcd721cccb235f2a00865ca545fa68 */
@cds.external : true
@CodeList.CurrencyCodes.Url : '../../../../default/iwbep/common/0001/$metadata'
@CodeList.CurrencyCodes.CollectionPath : 'Currencies'
@CodeList.UnitsOfMeasure.Url : '../../../../default/iwbep/common/0001/$metadata'
@CodeList.UnitsOfMeasure.CollectionPath : 'UnitsOfMeasure'
@Common.ApplyMultiUnitBehaviorForSortingAndFiltering : true
@Capabilities.FilterFunctions : [
  'eq',
  'ne',
  'gt',
  'ge',
  'lt',
  'le',
  'and',
  'or',
  'contains',
  'startswith',
  'endswith',
  'any',
  'all'
]
@Capabilities.SupportedFormats : [ 'application/json', 'application/pdf' ]
@PDF.Features.DocumentDescriptionReference : '../../../../default/iwbep/common/0001/$metadata'
@PDF.Features.DocumentDescriptionCollection : 'MyDocumentDescriptions'
@PDF.Features.ArchiveFormat : true
@PDF.Features.Border : true
@PDF.Features.CoverPage : true
@PDF.Features.FitToPage : true
@PDF.Features.FontName : true
@PDF.Features.FontSize : true
@PDF.Features.HeaderFooter : true
@PDF.Features.IANATimezoneFormat : true
@PDF.Features.Margin : true
@PDF.Features.Padding : true
@PDF.Features.ResultSizeDefault : 20000
@PDF.Features.ResultSizeMaximum : 20000
@PDF.Features.Signature : true
@PDF.Features.TextDirectionLayout : true
@PDF.Features.Treeview : true
@PDF.Features.UploadToFileShare : true
@Capabilities.KeyAsSegmentSupported : true
@Capabilities.AsynchronousRequestsSupported : true
service SALESORDER0001 {
  @cds.external : true
  type SAP__Message {
    code : String not null;
    message : String not null;
    target : String;
    additionalTargets : many String not null;
    transition : Boolean not null;
    @odata.Type : 'Edm.Byte'
    numericSeverity : Integer not null;
    longtextUrl : String;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Sales Order Header'
  @Common.Messages : SAP__Messages
  @Capabilities.NavigationRestrictions.RestrictedProperties : [
    { NavigationProperty: _Item, InsertRestrictions: { Insertable: true } },
    {
      NavigationProperty: _Partner,
      InsertRestrictions: { Insertable: true }
    },
    {
      NavigationProperty: _PricingElement,
      InsertRestrictions: { Insertable: true },
      FilterRestrictions: { Filterable: false }
    },
    { NavigationProperty: _Text, InsertRestrictions: { Insertable: true } }
  ]
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.InsertRestrictions.RequiredProperties : [ 'SalesOrderType' ]
  @Capabilities.UpdateRestrictions.DeltaUpdateSupported : true
  @Capabilities.UpdateRestrictions.NonUpdatableProperties : [ 'SalesOrder', 'SalesOrderType' ]
  @Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Item', '_Partner', '_PricingElement', '_Text' ]
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  @Capabilities.DeepUpdateSupport.ContentIDSupported : true
  @Capabilities.DeleteRestrictions.Deletable : false
  @Core.OptimisticConcurrency : [ 'LastChangeDateTime' ]
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [ { Property: TotalNetAmount, AllowedExpressions: 'MultiValue' } ]
  entity SalesOrder {
    @Core.Immutable : true
    @Common.IsUpperCase : true
    @Common.Label : 'Sales Order'
    @Common.Heading : 'SO'
    key SalesOrder : String(10) not null;
    @Common.SAPObjectNodeTypeReference : 'SalesOrderType'
    @Core.Immutable : true
    @Common.IsUpperCase : true
    @Common.Label : 'Language key'
    @Common.QuickInfo : 'Language key for sales document type'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AUART_SPR'
    SalesOrderType : String(4) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Processing Type'
    @Common.Heading : 'P'
    @Common.QuickInfo : 'SD Document Processing Type'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VBKLT'
    SalesOrderProcessingType : String(1) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Sold-to Party'
    @Common.Heading : 'Sold-to'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KUNAG'
    SoldToParty : String(10) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Sales Organization'
    @Common.Heading : 'SOrg.'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VKORG'
    SalesOrganization : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Distribution Channel'
    @Common.Heading : 'DChl'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VTWEG'
    DistributionChannel : String(2) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'RefDistCh-Cust/Mat.'
    @Common.Heading : 'DCh-Cust/Mt'
    @Common.QuickInfo : 'Reference distrib.channel for cust.and material masters'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VTWKU'
    ReferenceDistributionChannel : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Division'
    @Common.Heading : 'Dv'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SPART'
    OrganizationDivision : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Sales Office'
    @Common.Heading : 'SOff.'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VKBUR'
    SalesOffice : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Sales Group'
    @Common.Heading : 'SGrp'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VKGRP'
    SalesGroup : String(3) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Sales District'
    @Common.Heading : 'SDst'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BZIRK'
    SalesDistrict : String(6) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Created By'
    @Common.QuickInfo : 'Name of Person Responsible for Creating the Object'
    CreatedByUser : String(12) not null;
    @Core.Computed : true
    @Common.Label : 'Created On'
    @Common.QuickInfo : 'Record Created On'
    CreationDate : Date;
    @Core.Computed : true
    @Common.Label : 'Created At'
    @Common.QuickInfo : 'Time at Which Record Was Created'
    CreationTime : Time not null;
    @odata.Precision : 7
    @odata.Type : 'Edm.DateTimeOffset'
    @Core.Computed : true
    @Common.Label : 'Last Changed On'
    @Common.QuickInfo : 'Last Changed Date Time'
    LastChangeDateTime : Timestamp;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Last Changed By'
    @Common.Heading : 'Changed By'
    @Common.QuickInfo : 'User Who Last Changed the Business Document'
    LastChangedByUser : String(12) not null;
    @Common.Label : 'Customer Reference'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BSTKD'
    PurchaseOrderByCustomer : String(35) not null;
    @Common.Label : 'Customer Reference'
    @Common.Heading : 'Ship-To Party''s Customer Reference'
    @Common.QuickInfo : 'Ship-to Party''s Customer Reference'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BSTKD_E'
    PurchaseOrderByShipToParty : String(35) not null;
    @Common.SAPObjectNodeTypeReference : 'PurchaseOrderTypeByCustomer'
    @Common.IsUpperCase : true
    @Common.Label : 'Purchase Order Type'
    @Common.Heading : 'POtyp'
    @Common.QuickInfo : 'Customer Purchase Order Type'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BSARK'
    CustomerPurchaseOrderType : String(4) not null;
    @Common.Label : 'Customer Ref. Date'
    @Common.Heading : 'CustRefDat'
    @Common.QuickInfo : 'Customer Reference Date'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BSTDK'
    CustomerPurchaseOrderDate : Date;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Solution Order'
    BusinessSolutionOrder : String(10) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Reference Document'
    @Common.Heading : 'Ref. Doc.'
    @Common.QuickInfo : 'Document Number of Reference Document'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VGBEL'
    ReferenceSDDocument : String(10) not null;
    @Core.Computed : true
    @Common.Label : 'Preceding Doc.Categ.'
    @Common.Heading : 'PrCat'
    @Common.QuickInfo : 'Document Category of Preceding SD Document'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VBTYPL_V'
    ReferenceSDDocumentCategory : String(4) not null;
    @Common.SAPObjectNodeTypeReference : 'SalesDocumentReason'
    @Common.IsUpperCase : true
    @Common.Label : 'Order Reason'
    @Common.Heading : 'OrdRs'
    @Common.QuickInfo : 'Order Reason (Reason for the Business Transaction)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AUGRU'
    SDDocumentReason : String(3) not null;
    @Common.Label : 'Document Date'
    @Common.Heading : 'Doc. Date'
    @Common.QuickInfo : 'Document Date (Date Received/Sent)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AUDAT'
    SalesOrderDate : Date;
    @Common.Label : 'Requested Delivery Date'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=REQD_DELIVERY_DATE'
    RequestedDeliveryDate : Date;
    @Common.Label : 'Pricing Date'
    @Common.Heading : 'Pricing Dt'
    @Common.QuickInfo : 'Date for Pricing and Exchange Rate'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PRSDT'
    PricingDate : Date;
    @Common.Label : 'Serv. Rendered Date'
    @Common.Heading : 'Serv.R.Dte'
    @Common.QuickInfo : 'Date on which services are rendered'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=FBUDA'
    ServicesRenderedDate : Date;
    @Common.Label : 'Billing Date'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=FKDAT'
    BillingDocumentDate : Date;
    @Core.Computed : true
    @Measures.ISOCurrency : TransactionCurrency
    @Common.Label : 'Net Value'
    @Common.QuickInfo : 'Net Value of the Sales Document in Document Currency'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=NETWR_AK'
    TotalNetAmount : Decimal(precision: 15) not null;
    @Common.SAPObjectNodeTypeReference : 'Currency'
    @Common.IsCurrency : true
    @Common.IsUpperCase : true
    @Common.Label : 'Document Currency'
    @Common.Heading : 'Crcy'
    @Common.QuickInfo : 'SD Document Currency'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=WAERK'
    TransactionCurrency : String(3) not null;
    @Common.SAPObjectNodeTypeReference : 'DeliveryDateTypeRule'
    @Common.IsUpperCase : true
    @Common.Label : 'Deliv Date Rule'
    @Common.Heading : 'DlvDteRule'
    @Common.QuickInfo : 'Delivery Date Rule'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SD_DELIVERY_DATE_TYPE_RULE'
    DeliveryDateTypeRule : String(1) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Shipping Conditions'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VSBED'
    ShippingCondition : String(2) not null;
    @Common.Label : 'Complete Delivery'
    @Common.Heading : 'CDl'
    @Common.QuickInfo : 'Complete Delivery Defined for Each Sales Order'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AUTLF'
    CompleteDeliveryIsDefined : Boolean not null;
    @Common.Label : 'Relevant for POD'
    @Common.Heading : 'POD-rel.'
    @Common.QuickInfo : 'Relevant for POD processing'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PODKZ'
    SlsDocIsRlvtForProofOfDeliv : Boolean not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Shipping Type'
    @Common.Heading : 'ST'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VSARTTR'
    ShippingType : String(2) not null;
    @Common.Label : 'Receiving Point'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=EMPST'
    ReceivingPoint : String(25) not null;
    @Common.SAPObjectNodeTypeReference : 'IncotermsClassification'
    @Common.IsUpperCase : true
    @Common.Label : 'Incoterms'
    @Common.Heading : 'IncoT'
    @Common.QuickInfo : 'Incoterms (Part 1)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=INCO1'
    IncotermsClassification : String(3) not null;
    @Common.SAPObjectNodeTypeReference : 'IncotermsVersion'
    @Common.IsUpperCase : true
    @Common.Label : 'Incoterms Version'
    @Common.Heading : 'IncoV'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=INCOV'
    IncotermsVersion : String(4) not null;
    @Common.Label : 'Incoterms Location 1'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=INCO2_L'
    IncotermsLocation1 : String(70) not null;
    @Common.Label : 'Incoterms Location 2'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=INCO3_L'
    IncotermsLocation2 : String(70) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Pricing Procedure'
    @Common.Heading : 'PriPr.'
    @Common.QuickInfo : 'Pricing Procedure in Pricing'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KALSMASD'
    SDPricingProcedure : String(6) not null;
    @Common.SAPObjectNodeTypeReference : 'CustomerPriceGroup'
    @Common.IsUpperCase : true
    @Common.Label : 'Customer Price Group'
    @Common.Heading : 'CPG'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KONDA'
    CustomerPriceGroup : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Price List Type'
    @Common.Heading : 'PL'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PLTYP'
    PriceListType : String(2) not null;
    @Common.Label : 'Fixed Value Date'
    @Common.Heading : 'FixValDate'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VALDT'
    FixedValueDate : Date;
    @Common.IsUpperCase : true
    @Common.Label : 'Tax Departure C/R'
    @Common.Heading : 'TDC'
    @Common.QuickInfo : 'Tax Departure Country/Region'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LANDTX'
    TaxDepartureCountry : String(3) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Tax Dest. Ctry/Reg.'
    @Common.Heading : 'TDC'
    @Common.QuickInfo : 'Tax Destination Country/Region'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LAND1TX'
    VATRegistrationCountry : String(3) not null;
    @Common.Label : 'EU Triangular Deal'
    @Common.QuickInfo : 'Indicator: Triangular Deal Within the EU'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=XEGDR'
    IsEUTriangularDeal : Boolean not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Terms of Payment'
    @Common.QuickInfo : 'Terms of Payment Key'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=DZTERM'
    CustomerPaymentTerms : String(4) not null;
    @Common.SAPObjectNodeTypeReference : 'PaymentMethod'
    @Common.IsUpperCase : true
    @Common.Label : 'Payment Method'
    @Common.Heading : 'PM'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SCHZW_BSEG'
    PaymentMethod : String(1) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'CCode to Be Billed'
    @Common.Heading : 'CCdB'
    @Common.QuickInfo : 'Company Code to Be Billed'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BUKRS_VF'
    BillingCompanyCode : String(4) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Controlling Area'
    @Common.Heading : 'COAr'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KOKRS'
    ControllingArea : String(4) not null;
    @Common.SAPObjectNodeTypeReference : 'CustomerAccountAssignmentGroup'
    @Common.IsUpperCase : true
    @Common.Label : 'Acct Assmt Grp Cust.'
    @Common.Heading : 'AAGC'
    @Common.QuickInfo : 'Account Assignment Group for Customer'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KTGRD'
    CustomerAccountAssignmentGroup : String(2) not null;
    @Common.Label : 'Assignment'
    @Common.QuickInfo : 'Assignment Number'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=ORDNR_V'
    AssignmentReference : String(18) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Reference'
    @Common.QuickInfo : 'Reference Document Number'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=XBLNR_V1'
    AccountingDocExternalReference : String(16) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Credit Account'
    @Common.Heading : 'Cred. Acct'
    @Common.QuickInfo : 'Customer''s Account Number with Credit Limit Reference'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KNKLI'
    CustomerCreditAccount : String(10) not null;
    @Common.SAPObjectNodeTypeReference : 'BillingBlockReason'
    @Common.IsUpperCase : true
    @Common.Label : 'Billing Block'
    @Common.Heading : 'BB'
    @Common.QuickInfo : 'Billing Block in SD Document'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=FAKSK'
    HeaderBillingBlockReason : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Delivery Block'
    @Common.Heading : 'DlBl'
    @Common.QuickInfo : 'Delivery Block (Document Header)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LIFSK'
    DeliveryBlockReason : String(2) not null;
    @Common.SAPObjectNodeTypeReference : 'SalesOrderApprovalReason'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Approval Request Reason'
    @Common.QuickInfo : 'Approval Request Reason ID'
    SalesOrderApprovalReason : String(4) not null;
    @Common.SAPObjectNodeTypeReference : 'CustomerGroup'
    @Common.IsUpperCase : true
    @Common.Label : 'Customer Group'
    @Common.Heading : 'CGrp'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KDGRP'
    CustomerGroup : String(2) not null;
    @Common.SAPObjectNodeTypeReference : 'AdditionalCustomerGroup1'
    @Common.IsUpperCase : true
    @Common.Label : 'Customer Group 1'
    @Common.Heading : 'Grp1'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KVGR1'
    AdditionalCustomerGroup1 : String(3) not null;
    @Common.SAPObjectNodeTypeReference : 'AdditionalCustomerGroup2'
    @Common.IsUpperCase : true
    @Common.Label : 'Customer Group 2'
    @Common.Heading : 'Grp2'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KVGR2'
    AdditionalCustomerGroup2 : String(3) not null;
    @Common.SAPObjectNodeTypeReference : 'AdditionalCustomerGroup3'
    @Common.IsUpperCase : true
    @Common.Label : 'Customer Group 3'
    @Common.Heading : 'Grp3'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KVGR3'
    AdditionalCustomerGroup3 : String(3) not null;
    @Common.SAPObjectNodeTypeReference : 'AdditionalCustomerGroup4'
    @Common.IsUpperCase : true
    @Common.Label : 'Customer Group 4'
    @Common.Heading : 'Grp4'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KVGR4'
    AdditionalCustomerGroup4 : String(3) not null;
    @Common.SAPObjectNodeTypeReference : 'AdditionalCustomerGroup5'
    @Common.IsUpperCase : true
    @Common.Label : 'Customer Group 5'
    @Common.Heading : 'Grp5'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KVGR5'
    AdditionalCustomerGroup5 : String(3) not null;
    @Common.SAPObjectNodeTypeReference : 'OverallSDProcessStatus'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Overall Status'
    @Common.Heading : 'OS'
    @Common.QuickInfo : 'Overall Processing Status (Header/All Items)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=GBSTK'
    OverallSDProcessStatus : String(1) not null;
    @Common.SAPObjectNodeTypeReference : 'SlsDocOvrlDeliveryBlockStatus'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Delivery Block Status'
    @Common.QuickInfo : 'Delivery Block Status (Item)'
    OverallDeliveryBlockStatus : String(1) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Billing Block Status'
    @Common.QuickInfo : 'Billing Block Status (All Items)'
    OverallBillingBlockStatus : String(1) not null;
    @Common.SAPObjectNodeTypeReference : 'SalesDocOverallDeliveryStatus'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Delivery Status'
    @Common.Heading : 'DS'
    @Common.QuickInfo : 'Delivery Status (All Items)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LFSTK'
    OverallDeliveryStatus : String(1) not null;
    @Common.SAPObjectNodeTypeReference : 'TotalCreditCheckStatus'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Credit Status'
    @Common.Heading : 'OvCS'
    @Common.QuickInfo : 'Overall Status of Credit Checks'
    TotalCreditCheckStatus : String(1) not null;
    @Common.SAPObjectNodeTypeReference : 'OverallSDDocumentRejectionSts'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Rejection Status'
    @Common.Heading : 'Rj'
    @Common.QuickInfo : 'Rejection Status (All Items)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=ABSTK'
    OverallSDDocumentRejectionSts : String(1) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Overall Block Status'
    @Common.Heading : 'OB'
    @Common.QuickInfo : 'Overall Block Status (Header)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SPSTG'
    TotalBlockStatus : String(1) not null;
    @Common.SAPObjectNodeTypeReference : 'SlsDocGenIncompletionStatus'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Incompletion Status (Header)'
    @Common.Heading : 'General Incompletion Status of Header'
    HdrGeneralIncompletionStatus : String(1) not null;
    @Common.SAPObjectNodeTypeReference : 'SlsDocOvrlItmGenIncompltnSts'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Incompletion Status (Items)'
    @Common.Heading : 'Overall Incompletion Status for All Itms'
    @Common.QuickInfo : 'Incompletion Status (All Items)'
    OvrlItmGeneralIncompletionSts : String(1) not null;
    @Common.SAPObjectNodeTypeReference : 'OverallSDDocReferenceStatus'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Reference Status'
    @Common.Heading : 'RS'
    @Common.QuickInfo : 'Reference Status (All Items)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=RFSTK'
    OverallSDDocReferenceStatus : String(1) not null;
    @Common.SAPObjectNodeTypeReference : 'SalesDocApprovalStatus'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Approval Status'
    @Common.QuickInfo : 'Document Approval Status'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SD_APM_APPROVAL_STATUS'
    SalesDocApprovalStatus : String(1) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Product Marketability Status'
    @Common.QuickInfo : 'Product Marketability Status (All Items)'
    OverallChmlCmplncStatus : String(1) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Dangerous Goods Status'
    @Common.QuickInfo : 'Dangerous Goods Status (All Items)'
    OverallDangerousGoodsStatus : String(1) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Safety Data Sheet Status'
    @Common.QuickInfo : 'Safety Data Sheet Status (All Items)'
    OverallSafetyDataSheetStatus : String(1) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Embargo Status'
    @Common.QuickInfo : 'Embargo Status (All Items)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=TDD_TOTAL_EMCST'
    OverallTrdCmplncEmbargoSts : String(1) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Screening Status'
    @Common.QuickInfo : 'Screening Status (All Items)'
    OvrlTrdCmplncSnctndListChkSts : String(1) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Legal Control Status'
    @Common.Heading : 'Legal Ctrl Sts'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=TDD_TOTAL_LCCST'
    OvrlTrdCmplncLegalCtrlChkSts : String(1) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Down Payment Status'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=DP_CLEAR_STA'
    SalesOrderDownPaymentStatus : String(1) not null;
    @Common.SAPObjectNodeTypeReference : 'OverallOrdReltdBillgStatus'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Order-Related Billing Status'
    @Common.QuickInfo : 'Order-Related Billing Status (All Items)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SDMD_ORDER_RELATED_BILLING_STS'
    OverallOrdReltdBillgStatus : String(1) not null;
    SAP__Messages : many SAP__Message not null;
    @Common.Composition : true
    _Item : Composition of many SalesOrderItem on _Item._SalesOrder = $self;
    @Common.Composition : true
    _Partner : Composition of many SalesOrderPartner on _Partner._SalesOrder = $self;
    @Common.Composition : true
    _PricingElement : Composition of many SalesOrderPricingElement on _PricingElement._SalesOrder = $self;
    @Common.Composition : true
    _Text : Composition of many SalesOrderText on _Text._SalesOrder = $self;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Sales Order Item'
  @Common.SemanticKey : [ 'SalesOrderItem', 'SalesOrder' ]
  @Common.Messages : SAP__Messages
  @Capabilities.NavigationRestrictions.RestrictedProperties : [
    {
      NavigationProperty: _ItemPartner,
      InsertRestrictions: { Insertable: true }
    },
    {
      NavigationProperty: _ItemPricingElement,
      InsertRestrictions: { Insertable: true },
      FilterRestrictions: { Filterable: false }
    },
    {
      NavigationProperty: _ItemText,
      InsertRestrictions: { Insertable: true }
    }
  ]
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.UpdateRestrictions.DeltaUpdateSupported : true
  @Capabilities.UpdateRestrictions.NonUpdatableProperties : [ 'SalesOrderItem' ]
  @Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [
    '_ItemPartner',
    '_ItemPricingElement',
    '_ItemText',
    '_SalesOrder',
    '_ScheduleLine'
  ]
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  @Capabilities.DeepUpdateSupport.ContentIDSupported : true
  @Capabilities.InsertRestrictions.Insertable : false
  @Core.OptimisticConcurrency : [ '_SalesOrder/LastChangeDateTime' ]
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
    {
      Property: ConfdDelivQtyInOrderQtyUnit,
      AllowedExpressions: 'MultiValue'
    },
    { Property: OrderQuantitySAPUnit, AllowedExpressions: 'MultiValue' },
    { Property: OrderQuantityISOUnit, AllowedExpressions: 'MultiValue' },
    { Property: RequestedQuantity, AllowedExpressions: 'MultiValue' },
    { Property: RequestedQuantitySAPUnit, AllowedExpressions: 'MultiValue' },
    { Property: RequestedQuantityISOUnit, AllowedExpressions: 'MultiValue' },
    { Property: ItemGrossWeight, AllowedExpressions: 'MultiValue' },
    { Property: ItemNetWeight, AllowedExpressions: 'MultiValue' },
    { Property: ItemWeightSAPUnit, AllowedExpressions: 'MultiValue' },
    { Property: ItemWeightISOUnit, AllowedExpressions: 'MultiValue' },
    { Property: ItemVolume, AllowedExpressions: 'MultiValue' },
    { Property: ItemVolumeSAPUnit, AllowedExpressions: 'MultiValue' },
    { Property: ItemVolumeISOUnit, AllowedExpressions: 'MultiValue' },
    { Property: NetAmount, AllowedExpressions: 'MultiValue' },
    { Property: TaxAmount, AllowedExpressions: 'MultiValue' }
  ]
  entity SalesOrderItem {
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Sales Order'
    @Common.Heading : 'SO'
    key SalesOrder : String(10) not null;
    @Core.Immutable : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Item'
    @Common.Heading : 'SO Item'
    @Common.QuickInfo : 'Sales Order Item'
    key SalesOrderItem : String(6) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Higher-Level Item'
    @Common.Heading : 'HgLvIt'
    @Common.QuickInfo : 'Higher-Level Item in Bill of Material Structures'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=UEPOS'
    HigherLevelItem : String(6);
    @Common.IsUpperCase : true
    @Common.Label : 'Item Category'
    @Common.Heading : 'ItCa'
    @Common.QuickInfo : 'Sales Document Item Category'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PSTYV'
    SalesOrderItemCategory : String(4) not null;
    @Common.Label : 'Item Description'
    @Common.QuickInfo : 'Short text for sales order item'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=ARKTX'
    SalesOrderItemText : String(40) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Product'
    @Common.QuickInfo : 'Product Number'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PRODUCTNUMBER'
    Product : String(40) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Material Entered'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=MATWA'
    OriginallyRequestedMaterial : String(40) not null;
    @Common.SAPObjectNodeTypeReference : 'ProductGroup'
    @Common.IsUpperCase : true
    @Common.Label : 'Product Group'
    @Common.Heading : 'Prd Group'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PRODUCTGROUP'
    ProductGroup : String(9) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Customer Material'
    @Common.Heading : 'Customer Material Number'
    @Common.QuickInfo : 'Material Number Used by Customer'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=MATNR_KU'
    MaterialByCustomer : String(35) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'EAN/UPC'
    @Common.QuickInfo : 'International Article Number (EAN/UPC)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=EAN11'
    InternationalArticleNumber : String(18) not null;
    @Common.Label : 'Customer Reference'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BSTKD'
    PurchaseOrderByCustomer : String(35) not null;
    @Core.Computed : true
    @Measures.Unit : OrderQuantitySAPUnit
    @Measures.UNECEUnit : OrderQuantityISOUnit
    @Common.Label : 'Confirmed Quantity'
    @Common.QuickInfo : 'Cumulative Confirmed Quantity in Sales Unit'
    ConfdDelivQtyInOrderQtyUnit : Decimal(15, 3) not null;
    @Common.IsUnit : true
    @Core.Computed : true
    @Common.Label : 'Sales Unit'
    @Common.Heading : 'SU'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VRKME'
    OrderQuantitySAPUnit : String(3) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'ISO Order Quantity'
    @Common.Heading : 'ISO Unit Code for Order Quantity'
    @Common.QuickInfo : 'ISO Unit Code for Order Quantity'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SD_ORD_QTY_ISOUNIT'
    OrderQuantityISOUnit : String(3) not null;
    @Measures.Unit : RequestedQuantitySAPUnit
    @Measures.UNECEUnit : RequestedQuantityISOUnit
    @Validation.Minimum : 0
    @Common.Label : 'Requested Quantity'
    @Common.Heading : 'Reqd Qty'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=REQD_QTY'
    RequestedQuantity : Decimal(15, 3) not null;
    @Common.IsUnit : true
    @Common.Label : 'Requested Qty Unit'
    @Common.Heading : 'RQ Unit'
    @Common.QuickInfo : 'Unit of the Requested Quantity'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=REQD_QTY_UNIT'
    RequestedQuantitySAPUnit : String(3) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'ISO Code Req. Qty'
    @Common.Heading : 'ISO Unit Code for Requested Quantity'
    @Common.QuickInfo : 'ISO Unit Code for Requested Quantity'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SD_REQD_QTY_ISOUNIT'
    RequestedQuantityISOUnit : String(3) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Reference Document'
    @Common.Heading : 'Ref. Doc.'
    @Common.QuickInfo : 'Document Number of Reference Document'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VGBEL'
    ReferenceSDDocument : String(10) not null;
    @Core.Computed : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Reference Item'
    @Common.Heading : 'RefItm'
    @Common.QuickInfo : 'Item number of the reference item'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VGPOS'
    ReferenceSDDocumentItem : String(6) not null;
    @Core.Computed : true
    @Common.Label : 'Reference Document Category'
    ReferenceSDDocumentCategory : String(4) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Solution Order Item'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=CRMS4_SOLO_NUMBER_INT'
    BusinessSolutionOrderItem : String(6);
    @Measures.Unit : ItemWeightSAPUnit
    @Measures.UNECEUnit : ItemWeightISOUnit
    @Common.Label : 'Gross Weight'
    @Common.QuickInfo : 'Gross Weight of the Item'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BRGEW_AP'
    ItemGrossWeight : Decimal(15, 3) not null;
    @Measures.Unit : ItemWeightSAPUnit
    @Measures.UNECEUnit : ItemWeightISOUnit
    @Common.Label : 'Net Weight'
    @Common.QuickInfo : 'Net Weight of the Item'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=NTGEW_AP'
    ItemNetWeight : Decimal(15, 3) not null;
    @Common.IsUnit : true
    @Common.Label : 'Unit of Weight'
    @Common.Heading : 'WUn'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=GEWEI'
    ItemWeightSAPUnit : String(3) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'ISO Code Item Weight'
    @Common.Heading : 'ISO Unit Code for Item Weight'
    @Common.QuickInfo : 'ISO Unit Code for Item Weight'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SD_ITM_WGT_ISOUNIT'
    ItemWeightISOUnit : String(3) not null;
    @Measures.Unit : ItemVolumeSAPUnit
    @Measures.UNECEUnit : ItemVolumeISOUnit
    @Common.Label : 'Volume'
    @Common.QuickInfo : 'Volume of the item'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VOLUM_AP'
    ItemVolume : Decimal(15, 3) not null;
    @Common.IsUnit : true
    @Common.Label : 'Volume Unit'
    @Common.Heading : 'VUn'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VOLEH'
    ItemVolumeSAPUnit : String(3) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'ISO Unit Item Volume'
    @Common.Heading : 'ISO Unit Code for Item Volume'
    @Common.QuickInfo : 'ISO Unit Code for Item Volume'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SD_ITM_VOL_ISOUNIT'
    ItemVolumeISOUnit : String(3) not null;
    @Common.Label : 'Requested Delivery Date'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=REQD_DELIVERY_DATE'
    RequestedDeliveryDate : Date;
    @Core.Computed : true
    @Common.Label : 'Confirmed Delivery Date'
    ConfirmedDeliveryDate : Date;
    @Common.Label : 'Pricing Date'
    @Common.Heading : 'Pricing Dt'
    @Common.QuickInfo : 'Date for Pricing and Exchange Rate'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PRSDT'
    PricingDate : Date;
    @Common.Label : 'Date of Services Rendered'
    @Common.QuickInfo : 'Date on which services are rendered'
    ServicesRenderedDate : Date;
    @Common.Label : 'Billing Date'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=FKDAT'
    BillingDocumentDate : Date;
    @Core.Computed : true
    @Measures.ISOCurrency : TransactionCurrency
    @Common.Label : 'Net Value'
    @Common.QuickInfo : 'Net Value of the Document Item in Document Currency'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=NETWR_AP'
    NetAmount : Decimal(precision: 15) not null;
    @Common.SAPObjectNodeTypeReference : 'Currency'
    @Common.IsCurrency : true
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Document Currency'
    @Common.Heading : 'Crcy'
    @Common.QuickInfo : 'SD Document Currency'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=WAERK'
    TransactionCurrency : String(3) not null;
    @Core.Computed : true
    @Measures.ISOCurrency : TransactionCurrency
    @Common.Label : 'Tax Amount'
    @Common.QuickInfo : 'Tax Amount in Document Currency'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=MWSBP'
    TaxAmount : Decimal(precision: 13) not null;
    @Common.SAPObjectNodeTypeReference : 'CustomerGroup'
    @Common.IsUpperCase : true
    @Common.Label : 'Customer Group'
    @Common.Heading : 'CGrp'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KDGRP'
    CustomerGroup : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Batch'
    @Common.QuickInfo : 'Batch Number'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=CHARG_D'
    Batch : String(10) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Plant'
    @Common.Heading : 'Plnt'
    @Common.QuickInfo : 'Plant (Own or External)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=WERKS_EXT'
    Plant : String(4) not null;
    @Common.SAPObjectNodeTypeReference : 'StorageLocation'
    @Common.IsUpperCase : true
    @Common.Label : 'Storage Location'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LGORT_D'
    StorageLocation : String(4) not null;
    @Common.SAPObjectNodeTypeReference : 'ShippingPoint'
    @Common.IsUpperCase : true
    @Common.Label : 'Shipping Point'
    @Common.Heading : 'ShPt'
    @Common.QuickInfo : 'Shipping Point / Receiving Point'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VSTEL'
    ShippingPoint : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Shipping Type'
    @Common.Heading : 'ST'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VSARTTR'
    ShippingType : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Route'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=ROUTE'
    Route : String(6) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Delivery Priority'
    @Common.Heading : 'DPrio'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LPRIO'
    DeliveryPriority : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Partial Delivery for Item'
    @Common.Heading : 'Partial Delivery at Item Level'
    @Common.QuickInfo : 'Partial Delivery at Item Level'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PARTIAL_DELIVERY_ALLOWED'
    PartialDeliveryIsAllowed : String(1) not null;
    @Common.Label : 'Number of Partial Deliveries'
    @Common.QuickInfo : 'Number of Allowed Partial Deliveries'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=NMBRPARTIALDELIV'
    MaxNmbrOfPartialDelivery : Decimal(precision: 1) not null;
    @Common.SAPObjectNodeTypeReference : 'DeliveryDateTypeRule'
    @Common.IsUpperCase : true
    @Common.Label : 'Deliv Date Rule'
    @Common.Heading : 'DlvDteRule'
    @Common.QuickInfo : 'Delivery Date Rule'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SD_DELIVERY_DATE_TYPE_RULE'
    DeliveryDateTypeRule : String(1) not null;
    @Common.Label : 'Receiving Point'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=EMPST'
    ReceivingPoint : String(25) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Delivery Group'
    @Common.Heading : 'Grp'
    @Common.QuickInfo : 'Delivery Group (Items are delivered together)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=GRKOR'
    DeliveryGroup : String(3) not null;
    @Common.SAPObjectNodeTypeReference : 'IncotermsClassification'
    @Common.IsUpperCase : true
    @Common.Label : 'Incoterms'
    @Common.Heading : 'IncoT'
    @Common.QuickInfo : 'Incoterms (Part 1)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=INCO1'
    IncotermsClassification : String(3) not null;
    @Common.Label : 'Incoterms Location 1'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=INCO2_L'
    IncotermsLocation1 : String(70) not null;
    @Common.Label : 'Incoterms Location 2'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=INCO3_L'
    IncotermsLocation2 : String(70) not null;
    @Common.SAPObjectNodeTypeReference : 'IncotermsVersion'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Incoterms Version'
    @Common.Heading : 'IncoV'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=INCOV'
    IncotermsVersion : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Terms of Payment'
    @Common.QuickInfo : 'Terms of Payment Key'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=DZTERM'
    CustomerPaymentTerms : String(4) not null;
    @Common.Label : 'Fixed Value Date'
    @Common.Heading : 'FixValDate'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VALDT'
    FixedValueDate : Date;
    @Common.SAPObjectNodeTypeReference : 'CustomerPriceGroup'
    @Common.IsUpperCase : true
    @Common.Label : 'Customer Price Group'
    @Common.Heading : 'CPG'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KONDA'
    CustomerPriceGroup : String(2) not null;
    @Common.SAPObjectNodeTypeReference : 'MaterialPricingGroup'
    @Common.IsUpperCase : true
    @Common.Label : 'Product Price Group'
    @Common.Heading : 'PPG'
    MaterialPricingGroup : String(2) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Business Area'
    @Common.Heading : 'BusA'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=GSBER'
    BusinessArea : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Profit Center'
    @Common.Heading : 'Profit Ctr'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PRCTR'
    ProfitCenter : String(10) not null;
    @Common.SAPObjectNodeTypeReference : 'MaterialAccountAssignmentGroup'
    @Common.IsUpperCase : true
    @Common.Label : 'Acct Assmt Grp Mat.'
    @Common.Heading : 'AAGM'
    @Common.QuickInfo : 'Account Assignment Group for Material'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KTGRM'
    MatlAccountAssignmentGroup : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'WBS Element'
    @Common.QuickInfo : 'Work Breakdown Structure Element (WBS Element) Edited'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PS_POSID_EDIT'
    WBSElementExternalID : String(24) not null;
    @Common.SAPObjectNodeTypeReference : 'BillingBlockReason'
    @Common.IsUpperCase : true
    @Common.Label : 'Billing Block'
    @Common.Heading : 'BB'
    @Common.QuickInfo : 'Billing Block for Item'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=FAKSP_AP'
    ItemBillingBlockReason : String(2) not null;
    @Common.SAPObjectNodeTypeReference : 'SalesDocumentRjcnReason'
    @Common.IsUpperCase : true
    @Common.Label : 'Reason for Rejection'
    @Common.Heading : 'Rj'
    @Common.QuickInfo : 'Reason for Rejection of Sales Documents'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=ABGRU_VA'
    SalesDocumentRjcnReason : String(2) not null;
    @Core.Computed : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Configuration'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=CUOBJ_VA'
    ProductConfiguration : String(18) not null;
    @Common.SAPObjectNodeTypeReference : 'SDProcessStatus'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Overall Status'
    @Common.Heading : 'OS'
    @Common.QuickInfo : 'Overall Processing Status (Item)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=GBSTA'
    SDProcessStatus : String(1) not null;
    @Common.SAPObjectNodeTypeReference : 'SalesDocRejectionStatus'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Rejection Status'
    @Common.QuickInfo : 'Rejection Status (Item)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=ABSTA_VB'
    SDDocumentRejectionStatus : String(1) not null;
    @Common.SAPObjectNodeTypeReference : 'SalesDocDeliveryStatus'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Delivery Status'
    @Common.Heading : 'DS'
    @Common.QuickInfo : 'Delivery Status (Item)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LFSTA'
    DeliveryStatus : String(1) not null;
    @Common.SAPObjectNodeTypeReference : 'SalesDocItemBillingBlockStatus'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Billing Block Status'
    @Common.Heading : 'BS'
    @Common.QuickInfo : 'Billing Block Status (Item)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=FSSTA'
    BillingBlockStatus : String(1) not null;
    @Common.SAPObjectNodeTypeReference : 'SlsDocItemGenIncompltnStatus'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Incompletion Status'
    @Common.Heading : 'Item General Incompletion Status'
    @Common.QuickInfo : 'Incompletion Status (Item)'
    ItemGeneralIncompletionStatus : String(1) not null;
    @Common.SAPObjectNodeTypeReference : 'SalesDocDeliveryBlockStatus'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Delivery Block Status'
    @Common.QuickInfo : 'Delivery Block Status (Item)'
    DeliveryBlockStatus : String(1) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Down Payment Status'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=DP_CLEAR_STA'
    SlsOrderItemDownPaymentStatus : String(1) not null;
    @Common.SAPObjectNodeTypeReference : 'OrderRelatedBillingStatus'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Order-Related Billing Status'
    @Common.QuickInfo : 'Order-Related Billing Status (Item)'
    OrderRelatedBillingStatus : String(1) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Product Marketability Status'
    @Common.QuickInfo : 'Product Marketability Status (Item)'
    ChmlCmplncStatus : String(1) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Dangerous Goods Status'
    @Common.QuickInfo : 'Dangerous Goods Status (Item)'
    DangerousGoodsStatus : String(1) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Safety Data Sheet Status'
    @Common.QuickInfo : 'Safety Data Sheet Status (Item)'
    SafetyDataSheetStatus : String(1) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Embargo Status'
    @Common.QuickInfo : 'Embargo Status (Item)'
    TrdCmplncEmbargoSts : String(1) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Screening Status'
    @Common.QuickInfo : 'Screening Status (Item)'
    TrdCmplncSnctndListChkSts : String(1) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Legal Control Status'
    @Common.QuickInfo : 'Legal Control Status (All Schedule Lines)'
    OvrlTrdCmplncLegalCtrlChkSts : String(1) not null;
    SAP__Messages : many SAP__Message not null;
    @Common.Composition : true
    _ItemPartner : Composition of many SalesOrderItemPartner on _ItemPartner._Item = $self;
    @Common.Composition : true
    _ItemPricingElement : Composition of many SalesOrderItemPricingElement on _ItemPricingElement._Item = $self;
    @Common.Composition : true
    _ItemText : Composition of many SalesOrderItemText on _ItemText._Item = $self;
    _SalesOrder : Association to one SalesOrder on _SalesOrder.SalesOrder = SalesOrder;
    @Common.Composition : true
    _ScheduleLine : Composition of many SalesOrderScheduleLine on _ScheduleLine._Item = $self;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Sales Order Item Partner'
  @Common.SemanticKey : [ 'PartnerFunction', 'SalesOrderItem', 'SalesOrder' ]
  @Communication.Contact.email : [ { address: EmailAddress } ]
  @Common.Messages : SAP__Messages
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.FilterRestrictions.NonFilterableProperties : [
    'BusinessPartnerName1',
    'BusinessPartnerName2',
    'BusinessPartnerName3',
    'BusinessPartnerName4'
  ]
  @Capabilities.SortRestrictions.NonSortableProperties : [
    'BusinessPartnerName1',
    'BusinessPartnerName2',
    'BusinessPartnerName3',
    'BusinessPartnerName4'
  ]
  @Capabilities.UpdateRestrictions.DeltaUpdateSupported : true
  @Capabilities.UpdateRestrictions.NonUpdatableProperties : [ 'PartnerFunction' ]
  @Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Item', '_SalesOrder' ]
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  @Capabilities.DeepUpdateSupport.ContentIDSupported : true
  @Capabilities.InsertRestrictions.Insertable : false
  @Core.OptimisticConcurrency : [ '_SalesOrder/LastChangeDateTime' ]
  entity SalesOrderItemPartner {
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Sales Order'
    @Common.Heading : 'SO'
    key SalesOrder : String(10) not null;
    @Core.Computed : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Item'
    @Common.Heading : 'SO Item'
    @Common.QuickInfo : 'Sales Order Item'
    key SalesOrderItem : String(6) not null;
    @Common.SAPObjectNodeTypeReference : 'PartnerFunction'
    @Core.Immutable : true
    @Common.IsUpperCase : true
    @Common.Label : 'Partner Function'
    @Common.Heading : 'PartF'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PARVW_UNV'
    key PartnerFunction : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Customer'
    @Common.QuickInfo : 'Customer Number'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KUNNR'
    Customer : String(10);
    @Common.IsUpperCase : true
    @Common.Label : 'Supplier'
    @Common.QuickInfo : 'Account Number of Supplier'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LIFNR'
    Supplier : String(10);
    @Common.IsDigitSequence : true
    @Common.Label : 'Personnel Number'
    @Common.Heading : 'Pers.No.'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PERNR_D'
    Personnel : String(8);
    @Common.IsDigitSequence : true
    @Common.Label : 'Contact Person'
    @Common.Heading : 'Partner'
    @Common.QuickInfo : 'Number of Contact Person'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PARNR'
    ContactPerson : String(10);
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Business Partner'
    @Common.QuickInfo : 'Business Partner Number'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BU_PARTNER'
    ReferenceBusinessPartner : String(10) not null;
    @Common.Label : 'Name'
    @Common.QuickInfo : 'Name 1'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_NAME1'
    BusinessPartnerName1 : String(40) not null;
    @Common.Label : 'Name 2'
    BusinessPartnerName2 : String(40) not null;
    @Common.Label : 'Name 3'
    BusinessPartnerName3 : String(40) not null;
    @Common.Label : 'Name 4'
    BusinessPartnerName4 : String(40) not null;
    @Core.Computed : true
    @Common.Label : 'Street'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_STREET'
    StreetName : String(60) not null;
    @Common.Label : 'Street 2'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_STRSPP1'
    StreetPrefixName1 : String(40) not null;
    @Common.Label : 'Street 3'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_STRSPP2'
    StreetPrefixName2 : String(40) not null;
    @Common.Label : 'Street 4'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_STRSPP3'
    StreetSuffixName1 : String(40) not null;
    @Common.Label : 'Street 5'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_LCTN'
    StreetSuffixName2 : String(40) not null;
    @Core.Computed : true
    @Common.Label : 'House Number'
    @Common.Heading : 'House No.'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_HSNM1'
    HouseNumber : String(10) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Postal Code'
    @Common.Heading : 'Postl Code'
    @Common.QuickInfo : 'City postal code'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_PSTCD1'
    PostalCode : String(10) not null;
    @Core.Computed : true
    @Common.Label : 'City'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_CITY1'
    CityName : String(40) not null;
    @Core.Computed : true
    @Common.Label : 'District'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_CITY2'
    DistrictName : String(40) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Region'
    @Common.Heading : 'Rg'
    @Common.QuickInfo : 'Region (State, Province, County)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=REGIO'
    Region : String(3) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Country/Region Key'
    @Common.Heading : 'C/R'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LAND1'
    Country : String(3) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Telephone number'
    @Common.QuickInfo : 'Complete Number: Dialing Code+Number+Extension'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_TELNRLG'
    InternationalPhoneNumber : String(30) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Telephone number'
    @Common.QuickInfo : 'Complete Number: Dialing Code+Number+Extension'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_TELNRLG'
    InternationalMobilePhoneNumber : String(30) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'PO Box'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_POBX'
    POBox : String(10) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'PO Box Postal Code'
    @Common.Heading : 'Postl Code'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_PSTCD2'
    POBoxPostalCode : String(10) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Title Key'
    @Common.Heading : 'Key'
    @Common.QuickInfo : 'Form-of-Address Key'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_TITLE'
    FormOfAddress : String(4) not null;
    @Common.Label : 'Correspondence Language'
    @Core.Computed : true
    @Common.Heading : 'LG'
    @Common.QuickInfo : 'Business Partner: Correspondence Language'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BU_LANGU_CORR'
    CorrespondenceLanguage : String(2) not null;
    @Core.Computed : true
    @Common.Label : 'Email Address'
    EmailAddress : String(241) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Tax Jurisdiction'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_TXJCD'
    TaxJurisdiction : String(15) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Transportation Zone'
    @Common.Heading : 'TranspZone'
    @Common.QuickInfo : 'Transportation zone to or from which the goods are delivered'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LZONE'
    TransportZone : String(10) not null;
    @Core.Computed : true
    @Common.Label : 'Unloading Point'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=ABLAD'
    UnloadingPointName : String(25);
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'VAT Registration No.'
    @Common.QuickInfo : 'VAT Registration Number'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=STCEG'
    VATRegistration : String(20);
    @Core.Computed : true
    @Common.Label : 'Item-Specific Partner'
    @Common.QuickInfo : 'Partner is specific for item'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SD_PARTNER_ITEM_IND'
    PartnerIsSpecificForSDDocItem : Boolean not null;
    @Core.Computed : true
    @Common.Label : 'Doc-Specific Address'
    @Common.Heading : 'Doc. Addr'
    @Common.QuickInfo : 'Document-Specific Address Indicator'
    SDDocPartnerAddrIsDocSpecific : Boolean not null;
    SAP__Messages : many SAP__Message not null;
    _Item : Association to one SalesOrderItem on _Item.SalesOrderItem = SalesOrderItem;
    _SalesOrder : Association to one SalesOrder on _SalesOrder.SalesOrder = SalesOrder;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Item Pricing Element'
  @Common.SemanticKey : [
    'PricingProcedureCounter',
    'PricingProcedureStep',
    'SalesOrderItem',
    'SalesOrder'
  ]
  @Common.Messages : SAP__Messages
  @Capabilities.NavigationRestrictions.RestrictedProperties : [
    {
      NavigationProperty: _Item,
      SortRestrictions: { Sortable: false },
      FilterRestrictions: { Filterable: false }
    },
    {
      NavigationProperty: _SalesOrder,
      SortRestrictions: { Sortable: false },
      FilterRestrictions: { Filterable: false }
    }
  ]
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.InsertRestrictions.RequiredProperties : [ 'ConditionType' ]
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.UpdateRestrictions.DeltaUpdateSupported : true
  @Capabilities.UpdateRestrictions.NonUpdatableProperties : [
    'ConditionType',
    'ConditionRateRatioSAPUnit',
    'ConditionRateRatioISOUnit'
  ]
  @Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Item', '_SalesOrder' ]
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  @Capabilities.DeepUpdateSupport.ContentIDSupported : true
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
    { Property: ConditionQuantity, AllowedExpressions: 'MultiValue' },
    { Property: ConditionBaseQuantity, AllowedExpressions: 'MultiValue' },
    { Property: ConditionQuantitySAPUnit, AllowedExpressions: 'MultiValue' },
    { Property: ConditionQuantityISOUnit, AllowedExpressions: 'MultiValue' },
    { Property: ConditionRateRatio, AllowedExpressions: 'MultiValue' },
    { Property: ConditionRateRatioSAPUnit, AllowedExpressions: 'MultiValue' },
    { Property: ConditionRateRatioISOUnit, AllowedExpressions: 'MultiValue' },
    { Property: ConditionAmount, AllowedExpressions: 'MultiValue' }
  ]
  entity SalesOrderItemPricingElement {
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Sales Order'
    @Common.Heading : 'SO'
    key SalesOrder : String(10) not null;
    @Core.Computed : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Item'
    @Common.Heading : 'SO Item'
    @Common.QuickInfo : 'Sales Order Item'
    key SalesOrderItem : String(6) not null;
    @Core.Computed : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Step Number'
    @Common.Heading : 'Step'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=STUNR'
    key PricingProcedureStep : String(3) not null;
    @Core.Computed : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Counter'
    @Common.Heading : 'Cntr'
    @Common.QuickInfo : 'Condition Counter'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VFPRC_COND_COUNT'
    key PricingProcedureCounter : String(3) not null;
    @Common.SAPObjectNodeTypeReference : 'SalesPricingConditionType'
    @Core.Immutable : true
    @Common.IsUpperCase : true
    @Common.Label : 'Condition Type'
    @Common.Heading : 'CnTy'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KSCHA'
    ConditionType : String(4) not null;
    @Common.SAPObjectNodeTypeReference : 'PriceConditionCalculationType'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Calculation Type'
    @Common.Heading : 'CalTy'
    @Common.QuickInfo : 'Calculation Type for Condition'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KRECH_LONG'
    ConditionCalculationType : String(3) not null;
    @Measures.ISOCurrency : ConditionCurrency
    @Common.Label : 'Condition Amount'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VFPRC_RATE_AMOUNT'
    ConditionRateAmount : Decimal(24, 9);
    @Common.SAPObjectNodeTypeReference : 'Currency'
    @Common.IsCurrency : true
    @Common.IsUpperCase : true
    @Common.Label : 'Currency'
    @Common.Heading : 'Crcy'
    @Common.QuickInfo : 'Currency Key'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=WAERS'
    ConditionCurrency : String(3) not null;
    @Measures.Unit : ConditionQuantitySAPUnit
    @Measures.UNECEUnit : ConditionQuantityISOUnit
    @Common.Label : 'Pricing Unit'
    @Common.Heading : 'per'
    @Common.QuickInfo : 'Condition Pricing Unit'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KPEIN'
    ConditionQuantity : Decimal(precision: 5);
    @Core.Computed : true
    @Measures.Unit : ConditionQuantitySAPUnit
    @Measures.UNECEUnit : ConditionQuantityISOUnit
    @Common.Label : 'Quantity'
    @Common.QuickInfo : 'Quantity of the Condition Basis'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VFPRC_ELEMENT_QUANTITY'
    ConditionBaseQuantity : Decimal(24, 9);
    @Common.IsUnit : true
    @Common.Label : 'Condition Unit'
    @Common.Heading : 'UoM'
    @Common.QuickInfo : 'Condition Unit in the Document'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KVMEI'
    ConditionQuantitySAPUnit : String(3) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'ISO Condition Qty'
    @Common.Heading : 'ISO Code for Condition Quantity'
    @Common.QuickInfo : 'ISO Unit Code for Condition Quantity'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SD_CNDN_QTY_ISOUNIT'
    ConditionQuantityISOUnit : String(3) not null;
    @Measures.Unit : ConditionRateRatioSAPUnit
    @Measures.UNECEUnit : ConditionRateRatioISOUnit
    @Common.Label : 'Ratio'
    @Common.QuickInfo : 'Condition Ratio (in Percent or Per Mille)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VFPRC_ELEMENT_RATIO'
    ConditionRateRatio : Decimal(24, 9);
    @Common.IsUnit : true
    @Core.Immutable : true
    @Common.Label : 'Internal UoM'
    @Common.Heading : 'MU'
    @Common.QuickInfo : 'Unit of Measurement'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=MSEHI'
    ConditionRateRatioSAPUnit : String(3) not null;
    @Core.Immutable : true
    @Common.IsUpperCase : true
    @Common.Label : 'ISO Unit Code for Condition Ratio'
    ConditionRateRatioISOUnit : String(3) not null;
    @Measures.ISOCurrency : TransactionCurrency
    @Common.Label : 'Condition Value'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VFPRC_ELEMENT_VALUE'
    ConditionAmount : Decimal(precision: 15);
    @Core.Computed : true
    @Measures.ISOCurrency : TransactionCurrency
    @Common.Label : 'Cndn Bs Amt'
    @Common.Heading : 'Condition Basis Amount'
    @Common.QuickInfo : 'Amount of the Condition Basis'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VFPRC_BASE_AMOUNT'
    ConditionBaseAmount : Decimal(24, 9);
    @Common.SAPObjectNodeTypeReference : 'Currency'
    @Common.IsCurrency : true
    @Common.IsUpperCase : true
    @Common.Label : 'Document Currency'
    @Common.Heading : 'Crcy'
    @Common.QuickInfo : 'SD Document Currency'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=WAERK'
    TransactionCurrency : String(3) not null;
    SAP__Messages : many SAP__Message not null;
    _Item : Association to one SalesOrderItem on _Item.SalesOrderItem = SalesOrderItem;
    _SalesOrder : Association to one SalesOrder on _SalesOrder.SalesOrder = SalesOrder;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Item Text'
  @Common.SemanticKey : [ 'LongTextID', 'Language', 'SalesOrderItem', 'SalesOrder' ]
  @Common.Messages : SAP__Messages
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.FilterRestrictions.Filterable : true
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [ { Property: LongText, AllowedExpressions: 'SearchExpression' } ]
  @Capabilities.FilterRestrictions.NonFilterableProperties : [ 'LongText' ]
  @Capabilities.SortRestrictions.NonSortableProperties : [ 'LongText' ]
  @Capabilities.InsertRestrictions.RequiredProperties : [ 'LongText' ]
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.UpdateRestrictions.DeltaUpdateSupported : true
  @Capabilities.UpdateRestrictions.NonUpdatableProperties : [ 'Language', 'LongTextID' ]
  @Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Item', '_SalesOrder' ]
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  @Capabilities.DeepUpdateSupport.ContentIDSupported : true
  @Core.OptimisticConcurrency : [ '_SalesOrder/LastChangeDateTime' ]
  entity SalesOrderItemText {
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Sales Order'
    @Common.Heading : 'SO'
    key SalesOrder : String(10) not null;
    @Core.Computed : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Item'
    @Common.Heading : 'SO Item'
    @Common.QuickInfo : 'Sales Order Item'
    key SalesOrderItem : String(6) not null;
    @Core.Immutable : true
    @Common.Label : 'Language Key'
    @Common.Heading : 'Language'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SPRAS'
    key Language : String(2) not null;
    @Core.Immutable : true
    @Common.IsUpperCase : true
    @Common.Label : 'Text ID'
    @Common.Heading : 'ID'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=TDID'
    key LongTextID : String(4) not null;
    @Common.Label : 'String'
    LongText : String not null;
    SAP__Messages : many SAP__Message not null;
    _Item : Association to one SalesOrderItem on _Item.SalesOrderItem = SalesOrderItem;
    _SalesOrder : Association to one SalesOrder on _SalesOrder.SalesOrder = SalesOrder;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Sales Order Header Partner'
  @Common.SemanticKey : [ 'PartnerFunction', 'SalesOrder' ]
  @Communication.Contact.email : [ { address: EmailAddress } ]
  @Common.Messages : SAP__Messages
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.FilterRestrictions.NonFilterableProperties : [
    'BusinessPartnerName1',
    'BusinessPartnerName2',
    'BusinessPartnerName3',
    'BusinessPartnerName4'
  ]
  @Capabilities.SortRestrictions.NonSortableProperties : [
    'BusinessPartnerName1',
    'BusinessPartnerName2',
    'BusinessPartnerName3',
    'BusinessPartnerName4'
  ]
  @Capabilities.UpdateRestrictions.DeltaUpdateSupported : true
  @Capabilities.UpdateRestrictions.NonUpdatableProperties : [ 'PartnerFunction' ]
  @Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_SalesOrder' ]
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  @Capabilities.DeepUpdateSupport.ContentIDSupported : true
  @Capabilities.InsertRestrictions.Insertable : false
  @Core.OptimisticConcurrency : [ '_SalesOrder/LastChangeDateTime' ]
  entity SalesOrderPartner {
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Sales Order'
    @Common.Heading : 'SO'
    key SalesOrder : String(10) not null;
    @Common.SAPObjectNodeTypeReference : 'PartnerFunction'
    @Core.Immutable : true
    @Common.IsUpperCase : true
    @Common.Label : 'Partner Function'
    @Common.Heading : 'PartF'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PARVW_UNV'
    key PartnerFunction : String(2) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Customer'
    @Common.QuickInfo : 'Customer Number'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KUNNR'
    Customer : String(10);
    @Common.IsUpperCase : true
    @Common.Label : 'Supplier'
    @Common.QuickInfo : 'Account Number of Supplier'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LIFNR'
    Supplier : String(10);
    @Common.IsDigitSequence : true
    @Common.Label : 'Personnel Number'
    @Common.Heading : 'Pers.No.'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PERNR_D'
    Personnel : String(8);
    @Common.IsDigitSequence : true
    @Common.Label : 'Contact Person'
    @Common.Heading : 'Partner'
    @Common.QuickInfo : 'Number of Contact Person'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PARNR'
    ContactPerson : String(10);
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Business Partner'
    @Common.QuickInfo : 'Business Partner Number'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BU_PARTNER'
    ReferenceBusinessPartner : String(10) not null;
    @Common.Label : 'Name'
    @Common.QuickInfo : 'Name 1'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_NAME1'
    BusinessPartnerName1 : String(40) not null;
    @Common.Label : 'Name 2'
    BusinessPartnerName2 : String(40) not null;
    @Common.Label : 'Name 3'
    BusinessPartnerName3 : String(40) not null;
    @Common.Label : 'Name 4'
    BusinessPartnerName4 : String(40) not null;
    @Core.Computed : true
    @Common.Label : 'Street'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_STREET'
    StreetName : String(60) not null;
    @Core.Computed : true
    @Common.Label : 'Street 2'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_STRSPP1'
    StreetPrefixName1 : String(40) not null;
    @Core.Computed : true
    @Common.Label : 'Street 3'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_STRSPP2'
    StreetPrefixName2 : String(40) not null;
    @Core.Computed : true
    @Common.Label : 'Street 4'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_STRSPP3'
    StreetSuffixName1 : String(40) not null;
    @Core.Computed : true
    @Common.Label : 'Street 5'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_LCTN'
    StreetSuffixName2 : String(40) not null;
    @Core.Computed : true
    @Common.Label : 'House Number'
    @Common.Heading : 'House No.'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_HSNM1'
    HouseNumber : String(10) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Postal Code'
    @Common.Heading : 'Postl Code'
    @Common.QuickInfo : 'City postal code'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_PSTCD1'
    PostalCode : String(10) not null;
    @Core.Computed : true
    @Common.Label : 'City'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_CITY1'
    CityName : String(40) not null;
    @Core.Computed : true
    @Common.Label : 'District'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_CITY2'
    DistrictName : String(40) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Region'
    @Common.Heading : 'Rg'
    @Common.QuickInfo : 'Region (State, Province, County)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=REGIO'
    Region : String(3) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Country/Region Key'
    @Common.Heading : 'C/R'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LAND1'
    Country : String(3) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Telephone number'
    @Common.QuickInfo : 'Complete Number: Dialing Code+Number+Extension'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_TELNRLG'
    InternationalPhoneNumber : String(30) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Telephone number'
    @Common.QuickInfo : 'Complete Number: Dialing Code+Number+Extension'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_TELNRLG'
    InternationalMobilePhoneNumber : String(30) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Fax Number'
    @Common.QuickInfo : 'Complete Number: Dialing Code+Number+Extension'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_FXNRLNG'
    InternationalFaxNumber : String(30) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'PO Box'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_POBX'
    POBox : String(10) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'PO Box Postal Code'
    @Common.Heading : 'Postl Code'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_PSTCD2'
    POBoxPostalCode : String(10) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Title Key'
    @Common.Heading : 'Key'
    @Common.QuickInfo : 'Form-of-Address Key'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_TITLE'
    FormOfAddress : String(4) not null;
    @Common.Label : 'Correspondence Language'
    @Core.Computed : true
    @Common.Heading : 'LG'
    @Common.QuickInfo : 'Business Partner: Correspondence Language'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BU_LANGU_CORR'
    CorrespondenceLanguage : String(2) not null;
    @Core.Computed : true
    @Common.Label : 'Email Address'
    EmailAddress : String(241) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Tax Jurisdiction'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=AD_TXJCD'
    TaxJurisdiction : String(15) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Transportation Zone'
    @Common.Heading : 'TranspZone'
    @Common.QuickInfo : 'Transportation zone to or from which the goods are delivered'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LZONE'
    TransportZone : String(10) not null;
    @Core.Computed : true
    @Common.Label : 'Unloading Point'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=ABLAD'
    UnloadingPointName : String(25);
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'VAT Registration No.'
    @Common.QuickInfo : 'VAT Registration Number'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=STCEG'
    VATRegistration : String(20);
    @Core.Computed : true
    @Common.Label : 'Doc-Specific Address'
    @Common.Heading : 'Doc. Addr'
    @Common.QuickInfo : 'Document-Specific Address Indicator'
    SDDocPartnerAddrIsDocSpecific : Boolean not null;
    SAP__Messages : many SAP__Message not null;
    _SalesOrder : Association to one SalesOrder on _SalesOrder.SalesOrder = SalesOrder;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Header Pricing Element'
  @Common.SemanticKey : [ 'PricingProcedureCounter', 'PricingProcedureStep', 'SalesOrder' ]
  @Common.Messages : SAP__Messages
  @Capabilities.NavigationRestrictions.RestrictedProperties : [
    {
      NavigationProperty: _SalesOrder,
      SortRestrictions: { Sortable: false },
      FilterRestrictions: { Filterable: false }
    }
  ]
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.InsertRestrictions.RequiredProperties : [ 'ConditionType' ]
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.UpdateRestrictions.DeltaUpdateSupported : true
  @Capabilities.UpdateRestrictions.NonUpdatableProperties : [
    'ConditionType',
    'ConditionRateRatioSAPUnit',
    'ConditionRateRatioISOUnit'
  ]
  @Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_SalesOrder' ]
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  @Capabilities.DeepUpdateSupport.ContentIDSupported : true
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
    { Property: ConditionQuantity, AllowedExpressions: 'MultiValue' },
    { Property: ConditionBaseQuantity, AllowedExpressions: 'MultiValue' },
    { Property: ConditionQuantitySAPUnit, AllowedExpressions: 'MultiValue' },
    { Property: ConditionQuantityISOUnit, AllowedExpressions: 'MultiValue' },
    { Property: ConditionRateRatio, AllowedExpressions: 'MultiValue' },
    { Property: ConditionRateRatioSAPUnit, AllowedExpressions: 'MultiValue' },
    { Property: ConditionRateRatioISOUnit, AllowedExpressions: 'MultiValue' },
    { Property: ConditionAmount, AllowedExpressions: 'MultiValue' }
  ]
  entity SalesOrderPricingElement {
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Sales Order'
    @Common.Heading : 'SO'
    key SalesOrder : String(10) not null;
    @Core.Computed : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Step Number'
    @Common.Heading : 'Step'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=STUNR'
    key PricingProcedureStep : String(3) not null;
    @Core.Computed : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Counter'
    @Common.Heading : 'Cntr'
    @Common.QuickInfo : 'Condition Counter'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VFPRC_COND_COUNT'
    key PricingProcedureCounter : String(3) not null;
    @Common.SAPObjectNodeTypeReference : 'SalesPricingConditionType'
    @Core.Immutable : true
    @Common.IsUpperCase : true
    @Common.Label : 'Condition Type'
    @Common.Heading : 'CnTy'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KSCHA'
    ConditionType : String(4) not null;
    @Common.SAPObjectNodeTypeReference : 'PriceConditionCalculationType'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Calculation Type'
    @Common.Heading : 'CalTy'
    @Common.QuickInfo : 'Calculation Type for Condition'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KRECH_LONG'
    ConditionCalculationType : String(3) not null;
    @Measures.ISOCurrency : ConditionCurrency
    @Common.Label : 'Condition Amount'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VFPRC_RATE_AMOUNT'
    ConditionRateAmount : Decimal(24, 9);
    @Common.SAPObjectNodeTypeReference : 'Currency'
    @Common.IsCurrency : true
    @Common.IsUpperCase : true
    @Common.Label : 'Currency'
    @Common.Heading : 'Crcy'
    @Common.QuickInfo : 'Currency Key'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=WAERS'
    ConditionCurrency : String(3) not null;
    @Measures.Unit : ConditionQuantitySAPUnit
    @Measures.UNECEUnit : ConditionQuantityISOUnit
    @Common.Label : 'Pricing Unit'
    @Common.Heading : 'per'
    @Common.QuickInfo : 'Condition Pricing Unit'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KPEIN'
    ConditionQuantity : Decimal(precision: 5);
    @Core.Computed : true
    @Measures.Unit : ConditionQuantitySAPUnit
    @Measures.UNECEUnit : ConditionQuantityISOUnit
    @Common.Label : 'Quantity'
    @Common.QuickInfo : 'Quantity of the Condition Basis'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VFPRC_ELEMENT_QUANTITY'
    ConditionBaseQuantity : Decimal(24, 9);
    @Common.IsUnit : true
    @Common.Label : 'Condition Unit'
    @Common.Heading : 'UoM'
    @Common.QuickInfo : 'Condition Unit in the Document'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=KVMEI'
    ConditionQuantitySAPUnit : String(3) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'ISO Condition Qty'
    @Common.Heading : 'ISO Code for Condition Quantity'
    @Common.QuickInfo : 'ISO Unit Code for Condition Quantity'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SD_CNDN_QTY_ISOUNIT'
    ConditionQuantityISOUnit : String(3) not null;
    @Measures.Unit : ConditionRateRatioSAPUnit
    @Measures.UNECEUnit : ConditionRateRatioISOUnit
    @Common.Label : 'Ratio'
    @Common.QuickInfo : 'Condition Ratio (in Percent or Per Mille)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VFPRC_ELEMENT_RATIO'
    ConditionRateRatio : Decimal(24, 9);
    @Common.IsUnit : true
    @Core.Immutable : true
    @Common.Label : 'Internal UoM'
    @Common.Heading : 'MU'
    @Common.QuickInfo : 'Unit of Measurement'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=MSEHI'
    ConditionRateRatioSAPUnit : String(3) not null;
    @Core.Immutable : true
    @Common.IsUpperCase : true
    @Common.Label : 'ISO Unit Code for Condition Ratio'
    ConditionRateRatioISOUnit : String(3) not null;
    @Measures.ISOCurrency : TransactionCurrency
    @Common.Label : 'Condition Value'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VFPRC_ELEMENT_VALUE'
    ConditionAmount : Decimal(precision: 15);
    @Core.Computed : true
    @Measures.ISOCurrency : TransactionCurrency
    @Common.Label : 'Cndn Bs Amt'
    @Common.Heading : 'Condition Basis Amount'
    @Common.QuickInfo : 'Amount of the Condition Basis'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VFPRC_BASE_AMOUNT'
    ConditionBaseAmount : Decimal(24, 9);
    @Common.SAPObjectNodeTypeReference : 'Currency'
    @Common.IsCurrency : true
    @Common.IsUpperCase : true
    @Common.Label : 'Document Currency'
    @Common.Heading : 'Crcy'
    @Common.QuickInfo : 'SD Document Currency'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=WAERK'
    TransactionCurrency : String(3) not null;
    SAP__Messages : many SAP__Message not null;
    _SalesOrder : Association to one SalesOrder on _SalesOrder.SalesOrder = SalesOrder;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Item Schedule Line'
  @Common.SemanticKey : [ 'ScheduleLine', 'SalesOrderItem', 'SalesOrder' ]
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_Item', '_SalesOrder' ]
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  @Core.OptimisticConcurrency : [ '_SalesOrder/LastChangeDateTime' ]
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
    { Property: ScheduleLineOrderQuantity, AllowedExpressions: 'MultiValue' },
    { Property: OrderQuantitySAPUnit, AllowedExpressions: 'MultiValue' },
    { Property: OrderQuantityISOUnit, AllowedExpressions: 'MultiValue' },
    {
      Property: ConfdOrderQtyByMatlAvailCheck,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: DeliveredQtyInOrderQtyUnit,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: OpenConfdDelivQtyInOrdQtyUnit,
      AllowedExpressions: 'MultiValue'
    },
    {
      Property: CorrectedQtyInOrderQtyUnit,
      AllowedExpressions: 'MultiValue'
    }
  ]
  entity SalesOrderScheduleLine {
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Sales Document'
    @Common.Heading : 'Sales Doc.'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VBELN_VA'
    key SalesOrder : String(10) not null;
    @Core.Computed : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Sales Document Item'
    @Common.Heading : 'SDItem'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=POSNR_VA'
    key SalesOrderItem : String(6) not null;
    @Core.Computed : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Schedule Line Number'
    @Common.Heading : 'SLNo'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=ETENR'
    key ScheduleLine : String(4) not null;
    @Common.SAPObjectNodeTypeReference : 'SalesDocScheduleLineCategory'
    @Common.IsUpperCase : true
    @Common.Label : 'Sched. Line Category'
    @Common.Heading : 'SLCa'
    @Common.QuickInfo : 'Schedule Line Category'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=ETTYP'
    ScheduleLineCategory : String(2) not null;
    @Measures.Unit : OrderQuantitySAPUnit
    @Measures.UNECEUnit : OrderQuantityISOUnit
    @Common.Label : 'Order Quantity'
    @Common.QuickInfo : 'Order Quantity in Sales Units'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=WMENG'
    ScheduleLineOrderQuantity : Decimal(13, 3);
    @Common.IsUnit : true
    @Core.Computed : true
    @Common.Label : 'Sales Unit'
    @Common.Heading : 'SU'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=VRKME'
    OrderQuantitySAPUnit : String(3) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'ISO Order Quantity'
    @Common.Heading : 'ISO Unit Code for Order Quantity'
    @Common.QuickInfo : 'ISO Unit Code for Order Quantity'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SD_ORD_QTY_ISOUNIT'
    OrderQuantityISOUnit : String(3) not null;
    @Common.Label : 'Delivery Date'
    @Common.Heading : 'Deliv.Date'
    @Common.QuickInfo : 'Requested Delivery Date'
    RequestedDeliveryDate : Date;
    @Core.Computed : true
    @Common.Label : 'Delivery Date'
    @Common.Heading : 'Deliv.Date'
    @Common.QuickInfo : 'Confirmed Delivery Date'
    ConfirmedDeliveryDate : Date;
    @Core.Computed : true
    @Measures.Unit : OrderQuantitySAPUnit
    @Measures.UNECEUnit : OrderQuantityISOUnit
    @Common.Label : 'Confirmed Quantity'
    @Common.Heading : 'Confirmed Qty'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BMENG'
    ConfdOrderQtyByMatlAvailCheck : Decimal(13, 3);
    @Core.Computed : true
    @Measures.Unit : OrderQuantitySAPUnit
    @Measures.UNECEUnit : OrderQuantityISOUnit
    @Common.Label : 'Delivered Quantity'
    @Common.Heading : 'Delivered Qty'
    DeliveredQtyInOrderQtyUnit : Decimal(13, 3) not null;
    @Core.Computed : true
    @Measures.Unit : OrderQuantitySAPUnit
    @Measures.UNECEUnit : OrderQuantityISOUnit
    @Common.Label : 'Open Quantity'
    @Common.QuickInfo : 'Open Confirmed Delivery Quantity'
    OpenConfdDelivQtyInOrdQtyUnit : Decimal(13, 3) not null;
    @Measures.Unit : OrderQuantitySAPUnit
    @Measures.UNECEUnit : OrderQuantityISOUnit
    @Common.Label : 'Corr.qty'
    @Common.QuickInfo : 'Corrected quantity in sales unit'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=CMENG'
    CorrectedQtyInOrderQtyUnit : Decimal(13, 3) not null;
    @Common.SAPObjectNodeTypeReference : 'DeliveryBlockReason'
    @Common.IsUpperCase : true
    @Common.Label : 'Delivery Block'
    @Common.Heading : 'DB'
    @Common.QuickInfo : 'Schedule Line Blocked for Delivery'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=LIFSP_EP'
    DelivBlockReasonForSchedLine : String(2) not null;
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Purchase Requisition'
    @Common.Heading : 'Purch.Reqn'
    @Common.QuickInfo : 'Purchase Requisition Number'
    PurchaseRequisition : String(10) not null;
    @Core.Computed : true
    @Common.IsDigitSequence : true
    @Common.Label : 'Purchase Requisition Item'
    PurchaseRequisitionItem : String(5);
    @Common.SAPObjectNodeTypeReference : 'GoodsMovementType'
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Movement Type'
    @Common.Heading : 'MvT'
    @Common.QuickInfo : 'Movement Type (Inventory Management)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BWART'
    GoodsMovementType : String(3) not null;
    _Item : Association to one SalesOrderItem on _Item.SalesOrderItem = SalesOrderItem;
    _SalesOrder : Association to one SalesOrder on _SalesOrder.SalesOrder = SalesOrder;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Header Text'
  @Common.SemanticKey : [ 'LongTextID', 'Language', 'SalesOrder' ]
  @Common.Messages : SAP__Messages
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.FilterRestrictions.Filterable : true
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [ { Property: LongText, AllowedExpressions: 'SearchExpression' } ]
  @Capabilities.FilterRestrictions.NonFilterableProperties : [ 'LongText' ]
  @Capabilities.SortRestrictions.NonSortableProperties : [ 'LongText' ]
  @Capabilities.InsertRestrictions.RequiredProperties : [ 'LongText' ]
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.UpdateRestrictions.DeltaUpdateSupported : true
  @Capabilities.UpdateRestrictions.NonUpdatableProperties : [ 'Language', 'LongTextID' ]
  @Capabilities.UpdateRestrictions.NonUpdatableNavigationProperties : [ '_SalesOrder' ]
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  @Capabilities.DeepUpdateSupport.ContentIDSupported : true
  @Core.OptimisticConcurrency : [ '_SalesOrder/LastChangeDateTime' ]
  entity SalesOrderText {
    @Core.Computed : true
    @Common.IsUpperCase : true
    @Common.Label : 'Sales Order'
    @Common.Heading : 'SO'
    key SalesOrder : String(10) not null;
    @Core.Immutable : true
    @Common.Label : 'Language Key'
    @Common.Heading : 'Language'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=SPRAS'
    key Language : String(2) not null;
    @Core.Immutable : true
    @Common.IsUpperCase : true
    @Common.Label : 'Text ID'
    @Common.Heading : 'ID'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=TDID'
    key LongTextID : String(4) not null;
    @Common.Label : 'String'
    LongText : String not null;
    SAP__Messages : many SAP__Message not null;
    _SalesOrder : Association to one SalesOrder on _SalesOrder.SalesOrder = SalesOrder;
  };
};

