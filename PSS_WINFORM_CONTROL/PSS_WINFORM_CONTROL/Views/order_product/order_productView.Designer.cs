namespace PSS_WINFORM_CONTROL.Views.order_productView {
    partial class order_productView {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing) {
            if(disposing && (components != null)) {
                components.Dispose();
            }
            base.Dispose(disposing);
        }
		 #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
		private void InitializeComponent() {
            this.components = new System.ComponentModel.Container();
            this.dataLayoutControl1 = new DevExpress.XtraDataLayout.DataLayoutControl();
            this.layoutControlGroup1 = new DevExpress.XtraLayout.LayoutControlGroup();
            this.order_productViewBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.itemLookUpEdit = new DevExpress.XtraEditors.GridLookUpEdit();
            this.itemBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.orderLookUpEdit = new DevExpress.XtraEditors.GridLookUpEdit();
            this.orderBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.petLookUpEdit = new DevExpress.XtraEditors.GridLookUpEdit();
            this.petBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.layoutControlGroup2 = new DevExpress.XtraLayout.LayoutControlGroup();
            this.orderLookUpEditView = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.ItemFororder_id = new DevExpress.XtraLayout.LayoutControlItem();
            this.petLookUpEditView = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.ItemForpet_id = new DevExpress.XtraLayout.LayoutControlItem();
            this.itemLookUpEditView = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.ItemForitem_id = new DevExpress.XtraLayout.LayoutControlItem();
            this.quantityTextEdit = new DevExpress.XtraEditors.TextEdit();
            this.ItemForquantity = new DevExpress.XtraLayout.LayoutControlItem();
            this.priceTextEdit = new DevExpress.XtraEditors.TextEdit();
            this.ItemForprice = new DevExpress.XtraLayout.LayoutControlItem();
            this.idTextEdit = new DevExpress.XtraEditors.TextEdit();
            this.ItemForid = new DevExpress.XtraLayout.LayoutControlItem();
            this.mvvmContext = new DevExpress.Utils.MVVM.MVVMContext(this.components);
            this.bbiSave = new DevExpress.XtraBars.BarButtonItem();
            this.bbiSaveAndClose = new DevExpress.XtraBars.BarButtonItem();
            this.bbiSaveAndNew = new DevExpress.XtraBars.BarButtonItem();
            this.bbiReset = new DevExpress.XtraBars.BarButtonItem();
            this.bbiDelete = new DevExpress.XtraBars.BarButtonItem();
            this.bbiClose = new DevExpress.XtraBars.BarButtonItem();
            this.bbiSaveLayout = new DevExpress.XtraBars.BarButtonItem();
            this.bbiResetLayout = new DevExpress.XtraBars.BarButtonItem();
            this.mainRibbonControl = new DevExpress.XtraBars.Ribbon.RibbonControl();
            this.bbiCustomize = new DevExpress.XtraBars.BarButtonItem();
            this.mainRibbonPage = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.mainRibbonPageGroup = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonPageGroupLayout = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            ((System.ComponentModel.ISupportInitialize)(this.dataLayoutControl1)).BeginInit();
            this.dataLayoutControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.order_productViewBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.itemLookUpEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.itemBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.orderLookUpEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.orderBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.petLookUpEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.petBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.orderLookUpEditView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemFororder_id)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.petLookUpEditView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForpet_id)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.itemLookUpEditView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForitem_id)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.quantityTextEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForquantity)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.priceTextEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForprice)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.idTextEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForid)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.mvvmContext)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.mainRibbonControl)).BeginInit();
            this.SuspendLayout();
            // 
            // dataLayoutControl1
            // 
            this.dataLayoutControl1.AllowCustomization = false;
            this.dataLayoutControl1.Controls.Add(this.orderLookUpEdit);
            this.dataLayoutControl1.Controls.Add(this.petLookUpEdit);
            this.dataLayoutControl1.Controls.Add(this.itemLookUpEdit);
            this.dataLayoutControl1.Controls.Add(this.quantityTextEdit);
            this.dataLayoutControl1.Controls.Add(this.priceTextEdit);
            this.dataLayoutControl1.Controls.Add(this.idTextEdit);
            this.dataLayoutControl1.DataSource = this.order_productViewBindingSource;
            this.dataLayoutControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataLayoutControl1.Location = new System.Drawing.Point(0, 145);
            this.dataLayoutControl1.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.dataLayoutControl1.Name = "dataLayoutControl1";
            this.dataLayoutControl1.Root = this.layoutControlGroup1;
            this.dataLayoutControl1.Size = new System.Drawing.Size(1195, 800);
            this.dataLayoutControl1.TabIndex = 0;
            // 
            // layoutControlGroup1
            // 
            this.layoutControlGroup1.EnableIndentsWithoutBorders = DevExpress.Utils.DefaultBoolean.True;
            this.layoutControlGroup1.GroupBordersVisible = false;
            this.layoutControlGroup1.Items.AddRange(new DevExpress.XtraLayout.BaseLayoutItem[] {
            this.layoutControlGroup2});
            this.layoutControlGroup1.Name = "Root";
            this.layoutControlGroup1.Size = new System.Drawing.Size(1195, 800);
            this.layoutControlGroup1.TextVisible = false;
            // 
            // order_productViewBindingSource
            // 
            this.order_productViewBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.order_product);
            // 
            // itemLookUpEdit
            // 
            this.itemLookUpEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.order_productViewBindingSource, "item_id", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.itemLookUpEdit.Location = new System.Drawing.Point(66, 66);
            this.itemLookUpEdit.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.itemLookUpEdit.Name = "itemLookUpEdit";
            this.itemLookUpEdit.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.itemLookUpEdit.Properties.DataSource = this.itemBindingSource;
            this.itemLookUpEdit.Properties.DisplayMember = "name";
            this.itemLookUpEdit.Properties.PopupView = this.itemLookUpEditView;
            this.itemLookUpEdit.Properties.ValueMember = "id";
            this.itemLookUpEdit.Size = new System.Drawing.Size(1115, 22);
            this.itemLookUpEdit.StyleController = this.dataLayoutControl1;
            this.itemLookUpEdit.TabIndex = 6;
            // 
            // itemBindingSource
            // 
            this.itemBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.item);
            // 
            // orderLookUpEdit
            // 
            this.orderLookUpEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.order_productViewBindingSource, "order_id", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.orderLookUpEdit.Location = new System.Drawing.Point(66, 14);
            this.orderLookUpEdit.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.orderLookUpEdit.Name = "orderLookUpEdit";
            this.orderLookUpEdit.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.orderLookUpEdit.Properties.DataSource = this.orderBindingSource;
            this.orderLookUpEdit.Properties.DisplayMember = "id";
            this.orderLookUpEdit.Properties.PopupView = this.orderLookUpEditView;
            this.orderLookUpEdit.Properties.ValueMember = "id";
            this.orderLookUpEdit.Size = new System.Drawing.Size(1115, 22);
            this.orderLookUpEdit.StyleController = this.dataLayoutControl1;
            this.orderLookUpEdit.TabIndex = 4;
            // 
            // orderBindingSource
            // 
            this.orderBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.order);
            // 
            // petLookUpEdit
            // 
            this.petLookUpEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.order_productViewBindingSource, "pet_id", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.petLookUpEdit.Location = new System.Drawing.Point(66, 40);
            this.petLookUpEdit.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.petLookUpEdit.Name = "petLookUpEdit";
            this.petLookUpEdit.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.petLookUpEdit.Properties.DataSource = this.petBindingSource;
            this.petLookUpEdit.Properties.DisplayMember = "name";
            this.petLookUpEdit.Properties.PopupView = this.petLookUpEditView;
            this.petLookUpEdit.Properties.ValueMember = "id";
            this.petLookUpEdit.Size = new System.Drawing.Size(1115, 22);
            this.petLookUpEdit.StyleController = this.dataLayoutControl1;
            this.petLookUpEdit.TabIndex = 5;
            // 
            // petBindingSource
            // 
            this.petBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.pet);
            // 
            // layoutControlGroup2
            // 
            this.layoutControlGroup2.AllowDrawBackground = false;
            this.layoutControlGroup2.GroupBordersVisible = false;
            this.layoutControlGroup2.Items.AddRange(new DevExpress.XtraLayout.BaseLayoutItem[] {
            this.ItemFororder_id,
            this.ItemForpet_id,
            this.ItemForitem_id,
            this.ItemForquantity,
            this.ItemForprice,
            this.ItemForid});
            this.layoutControlGroup2.Location = new System.Drawing.Point(0, 0);
            this.layoutControlGroup2.Name = "autoGeneratedGroup0";
            this.layoutControlGroup2.Size = new System.Drawing.Size(1171, 776);
            // 
            // orderLookUpEditView
            // 
            this.orderLookUpEditView.FocusRectStyle = DevExpress.XtraGrid.Views.Grid.DrawFocusRectStyle.RowFocus;
            this.orderLookUpEditView.Name = "orderLookUpEditView";
            this.orderLookUpEditView.OptionsSelection.EnableAppearanceFocusedCell = false;
            this.orderLookUpEditView.OptionsView.ShowGroupPanel = false;
            // 
            // ItemFororder_id
            // 
            this.ItemFororder_id.Control = this.orderLookUpEdit;
            this.ItemFororder_id.Location = new System.Drawing.Point(0, 0);
            this.ItemFororder_id.Name = "ItemFororder_id";
            this.ItemFororder_id.Size = new System.Drawing.Size(1171, 26);
            this.ItemFororder_id.Text = "Order ID";
            this.ItemFororder_id.TextSize = new System.Drawing.Size(49, 16);
            // 
            // petLookUpEditView
            // 
            this.petLookUpEditView.FocusRectStyle = DevExpress.XtraGrid.Views.Grid.DrawFocusRectStyle.RowFocus;
            this.petLookUpEditView.Name = "petLookUpEditView";
            this.petLookUpEditView.OptionsSelection.EnableAppearanceFocusedCell = false;
            this.petLookUpEditView.OptionsView.ShowGroupPanel = false;
            // 
            // ItemForpet_id
            // 
            this.ItemForpet_id.Control = this.petLookUpEdit;
            this.ItemForpet_id.Location = new System.Drawing.Point(0, 26);
            this.ItemForpet_id.Name = "ItemForpet_id";
            this.ItemForpet_id.Size = new System.Drawing.Size(1171, 26);
            this.ItemForpet_id.Text = "Pet ID";
            this.ItemForpet_id.TextSize = new System.Drawing.Size(49, 16);
            // 
            // itemLookUpEditView
            // 
            this.itemLookUpEditView.FocusRectStyle = DevExpress.XtraGrid.Views.Grid.DrawFocusRectStyle.RowFocus;
            this.itemLookUpEditView.Name = "itemLookUpEditView";
            this.itemLookUpEditView.OptionsSelection.EnableAppearanceFocusedCell = false;
            this.itemLookUpEditView.OptionsView.ShowGroupPanel = false;
            // 
            // ItemForitem_id
            // 
            this.ItemForitem_id.Control = this.itemLookUpEdit;
            this.ItemForitem_id.Location = new System.Drawing.Point(0, 52);
            this.ItemForitem_id.Name = "ItemForitem_id";
            this.ItemForitem_id.Size = new System.Drawing.Size(1171, 26);
            this.ItemForitem_id.Text = "Item ID";
            this.ItemForitem_id.TextSize = new System.Drawing.Size(49, 16);
            // 
            // quantityTextEdit
            // 
            this.quantityTextEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.order_productViewBindingSource, "quantity", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.quantityTextEdit.Location = new System.Drawing.Point(66, 92);
            this.quantityTextEdit.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.quantityTextEdit.Name = "quantityTextEdit";
            this.quantityTextEdit.Properties.AllowNullInput = DevExpress.Utils.DefaultBoolean.True;
            this.quantityTextEdit.Properties.Appearance.Options.UseTextOptions = true;
            this.quantityTextEdit.Properties.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Far;
            this.quantityTextEdit.Properties.Mask.EditMask = "N0";
            this.quantityTextEdit.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.Numeric;
            this.quantityTextEdit.Properties.Mask.UseMaskAsDisplayFormat = true;
            this.quantityTextEdit.Size = new System.Drawing.Size(1115, 22);
            this.quantityTextEdit.StyleController = this.dataLayoutControl1;
            this.quantityTextEdit.TabIndex = 7;
            // 
            // ItemForquantity
            // 
            this.ItemForquantity.Control = this.quantityTextEdit;
            this.ItemForquantity.Location = new System.Drawing.Point(0, 78);
            this.ItemForquantity.Name = "ItemForquantity";
            this.ItemForquantity.Size = new System.Drawing.Size(1171, 26);
            this.ItemForquantity.Text = "Quantity";
            this.ItemForquantity.TextSize = new System.Drawing.Size(49, 16);
            // 
            // priceTextEdit
            // 
            this.priceTextEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.order_productViewBindingSource, "price", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.priceTextEdit.Location = new System.Drawing.Point(66, 118);
            this.priceTextEdit.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.priceTextEdit.Name = "priceTextEdit";
            this.priceTextEdit.Properties.AllowNullInput = DevExpress.Utils.DefaultBoolean.True;
            this.priceTextEdit.Properties.Appearance.Options.UseTextOptions = true;
            this.priceTextEdit.Properties.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Far;
            this.priceTextEdit.Properties.Mask.EditMask = "N0";
            this.priceTextEdit.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.Numeric;
            this.priceTextEdit.Properties.Mask.UseMaskAsDisplayFormat = true;
            this.priceTextEdit.Size = new System.Drawing.Size(1115, 22);
            this.priceTextEdit.StyleController = this.dataLayoutControl1;
            this.priceTextEdit.TabIndex = 8;
            // 
            // ItemForprice
            // 
            this.ItemForprice.Control = this.priceTextEdit;
            this.ItemForprice.Location = new System.Drawing.Point(0, 104);
            this.ItemForprice.Name = "ItemForprice";
            this.ItemForprice.Size = new System.Drawing.Size(1171, 26);
            this.ItemForprice.Text = "Price";
            this.ItemForprice.TextSize = new System.Drawing.Size(49, 16);
            // 
            // idTextEdit
            // 
            this.idTextEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.order_productViewBindingSource, "id", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.idTextEdit.Location = new System.Drawing.Point(66, 144);
            this.idTextEdit.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.idTextEdit.Name = "idTextEdit";
            this.idTextEdit.Properties.Appearance.Options.UseTextOptions = true;
            this.idTextEdit.Properties.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Far;
            this.idTextEdit.Properties.Mask.EditMask = "N0";
            this.idTextEdit.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.Numeric;
            this.idTextEdit.Properties.Mask.UseMaskAsDisplayFormat = true;
            this.idTextEdit.Size = new System.Drawing.Size(1115, 22);
            this.idTextEdit.StyleController = this.dataLayoutControl1;
            this.idTextEdit.TabIndex = 9;
            // 
            // ItemForid
            // 
            this.ItemForid.Control = this.idTextEdit;
            this.ItemForid.Location = new System.Drawing.Point(0, 130);
            this.ItemForid.Name = "ItemForid";
            this.ItemForid.Size = new System.Drawing.Size(1171, 646);
            this.ItemForid.Text = "ID";
            this.ItemForid.TextSize = new System.Drawing.Size(49, 16);
            // 
            // mvvmContext
            // 
            this.mvvmContext.BindingExpressions.AddRange(new DevExpress.Utils.MVVM.BindingExpression[] {
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_productViewModel), "Save", this.bbiSave),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_productViewModel), "SaveAndClose", this.bbiSaveAndClose),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_productViewModel), "SaveAndNew", this.bbiSaveAndNew),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_productViewModel), "Reset", this.bbiReset),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_productViewModel), "Delete", this.bbiDelete),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_productViewModel), "Close", this.bbiClose),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_productViewModel), "SaveLayout", this.bbiSaveLayout),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_productViewModel), "ResetLayout", this.bbiResetLayout)});
            this.mvvmContext.ContainerControl = this;
            this.mvvmContext.RegistrationExpressions.AddRange(new DevExpress.Utils.MVVM.RegistrationExpression[] {
            DevExpress.Utils.MVVM.RegistrationExpression.RegisterLayoutSerializationService(null, false, DevExpress.Utils.DefaultBoolean.True, this.dataLayoutControl1)});
            this.mvvmContext.ViewModelType = typeof(PSS_WINFORM_CONTROL.ViewModels.order_productViewModel);
            // 
            // bbiSave
            // 
            this.bbiSave.Caption = "Save";
            this.bbiSave.Id = 2;
            this.bbiSave.ImageOptions.ImageUri.Uri = "Save";
            this.bbiSave.Name = "bbiSave";
            // 
            // bbiSaveAndClose
            // 
            this.bbiSaveAndClose.Caption = "Save And Close";
            this.bbiSaveAndClose.Id = 3;
            this.bbiSaveAndClose.ImageOptions.ImageUri.Uri = "SaveAndClose";
            this.bbiSaveAndClose.Name = "bbiSaveAndClose";
            // 
            // bbiSaveAndNew
            // 
            this.bbiSaveAndNew.Caption = "Save And New";
            this.bbiSaveAndNew.Id = 4;
            this.bbiSaveAndNew.ImageOptions.ImageUri.Uri = "SaveAndNew";
            this.bbiSaveAndNew.Name = "bbiSaveAndNew";
            // 
            // bbiReset
            // 
            this.bbiReset.Caption = "Reset Changes";
            this.bbiReset.Id = 5;
            this.bbiReset.ImageOptions.ImageUri.Uri = "Reset";
            this.bbiReset.Name = "bbiReset";
            // 
            // bbiDelete
            // 
            this.bbiDelete.Caption = "Delete";
            this.bbiDelete.Id = 6;
            this.bbiDelete.ImageOptions.ImageUri.Uri = "Delete";
            this.bbiDelete.Name = "bbiDelete";
            // 
            // bbiClose
            // 
            this.bbiClose.Caption = "Close";
            this.bbiClose.Id = 7;
            this.bbiClose.ImageOptions.ImageUri.Uri = "Close";
            this.bbiClose.Name = "bbiClose";
            // 
            // bbiSaveLayout
            // 
            this.bbiSaveLayout.Caption = "Save Layout";
            this.bbiSaveLayout.Id = 8;
            this.bbiSaveLayout.ImageOptions.ImageUri.Uri = "Save";
            this.bbiSaveLayout.Name = "bbiSaveLayout";
            // 
            // bbiResetLayout
            // 
            this.bbiResetLayout.Caption = "Reset Layout";
            this.bbiResetLayout.Id = 9;
            this.bbiResetLayout.ImageOptions.ImageUri.Uri = "Reset";
            this.bbiResetLayout.Name = "bbiResetLayout";
            // 
            // mainRibbonControl
            // 
            this.mainRibbonControl.ExpandCollapseItem.Id = 0;
            this.mainRibbonControl.Items.AddRange(new DevExpress.XtraBars.BarItem[] {
            this.mainRibbonControl.ExpandCollapseItem,
            this.bbiCustomize,
            this.bbiSave,
            this.bbiSaveAndClose,
            this.bbiSaveAndNew,
            this.bbiReset,
            this.bbiDelete,
            this.bbiClose,
            this.bbiSaveLayout,
            this.bbiResetLayout,
            this.mainRibbonControl.SearchEditItem});
            this.mainRibbonControl.Location = new System.Drawing.Point(0, 0);
            this.mainRibbonControl.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.mainRibbonControl.MaxItemId = 10;
            this.mainRibbonControl.Name = "mainRibbonControl";
            this.mainRibbonControl.Pages.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPage[] {
            this.mainRibbonPage});
            this.mainRibbonControl.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonControlStyle.Office2013;
            this.mainRibbonControl.ShowApplicationButton = DevExpress.Utils.DefaultBoolean.False;
            this.mainRibbonControl.Size = new System.Drawing.Size(1195, 145);
            this.mainRibbonControl.ToolbarLocation = DevExpress.XtraBars.Ribbon.RibbonQuickAccessToolbarLocation.Hidden;
            // 
            // bbiCustomize
            // 
            this.bbiCustomize.Caption = "Customize";
            this.bbiCustomize.Id = 1;
            this.bbiCustomize.ImageOptions.ImageUri.Uri = "Customization";
            this.bbiCustomize.Name = "bbiCustomize";
            // 
            // mainRibbonPage
            // 
            this.mainRibbonPage.Groups.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPageGroup[] {
            this.mainRibbonPageGroup,
            this.ribbonPageGroupLayout});
            this.mainRibbonPage.MergeOrder = 0;
            this.mainRibbonPage.Name = "mainRibbonPage";
            this.mainRibbonPage.Text = "Home";
            // 
            // mainRibbonPageGroup
            // 
            this.mainRibbonPageGroup.AllowTextClipping = false;
            this.mainRibbonPageGroup.ItemLinks.Add(this.bbiSave);
            this.mainRibbonPageGroup.ItemLinks.Add(this.bbiSaveAndClose);
            this.mainRibbonPageGroup.ItemLinks.Add(this.bbiSaveAndNew);
            this.mainRibbonPageGroup.ItemLinks.Add(this.bbiReset);
            this.mainRibbonPageGroup.ItemLinks.Add(this.bbiDelete);
            this.mainRibbonPageGroup.ItemLinks.Add(this.bbiClose);
            this.mainRibbonPageGroup.Name = "mainRibbonPageGroup";
            this.mainRibbonPageGroup.ShowCaptionButton = false;
            this.mainRibbonPageGroup.Text = "order_product Tasks";
            // 
            // ribbonPageGroupLayout
            // 
            this.ribbonPageGroupLayout.AllowTextClipping = false;
            this.ribbonPageGroupLayout.ItemLinks.Add(this.bbiCustomize);
            this.ribbonPageGroupLayout.ItemLinks.Add(this.bbiSaveLayout);
            this.ribbonPageGroupLayout.ItemLinks.Add(this.bbiResetLayout);
            this.ribbonPageGroupLayout.Name = "ribbonPageGroupLayout";
            this.ribbonPageGroupLayout.Text = "Layout";
            // 
            // order_productView
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.Controls.Add(this.dataLayoutControl1);
            this.Controls.Add(this.mainRibbonControl);
            this.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.Name = "order_productView";
            this.Size = new System.Drawing.Size(1195, 945);
            ((System.ComponentModel.ISupportInitialize)(this.dataLayoutControl1)).EndInit();
            this.dataLayoutControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.order_productViewBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.itemLookUpEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.itemBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.orderLookUpEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.orderBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.petLookUpEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.petBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.orderLookUpEditView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemFororder_id)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.petLookUpEditView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForpet_id)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.itemLookUpEditView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForitem_id)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.quantityTextEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForquantity)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.priceTextEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForprice)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.idTextEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForid)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.mvvmContext)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.mainRibbonControl)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

		}
		
        #endregion

		private DevExpress.XtraDataLayout.DataLayoutControl dataLayoutControl1;
		private DevExpress.XtraLayout.LayoutControlGroup layoutControlGroup1;
		private DevExpress.Utils.MVVM.MVVMContext mvvmContext;
		private DevExpress.XtraBars.Ribbon.RibbonControl mainRibbonControl;
		private DevExpress.XtraBars.Ribbon.RibbonPage mainRibbonPage;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup mainRibbonPageGroup;
		private DevExpress.XtraBars.BarButtonItem bbiCustomize;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroupLayout;
		private System.Windows.Forms.BindingSource order_productViewBindingSource;
						private DevExpress.XtraEditors.GridLookUpEdit itemLookUpEdit;
		private System.Windows.Forms.BindingSource itemBindingSource;
				private DevExpress.XtraEditors.GridLookUpEdit orderLookUpEdit;
		private System.Windows.Forms.BindingSource orderBindingSource;
				private DevExpress.XtraEditors.GridLookUpEdit petLookUpEdit;
		private System.Windows.Forms.BindingSource petBindingSource;
        private DevExpress.XtraGrid.Views.Grid.GridView orderLookUpEditView;
        private DevExpress.XtraGrid.Views.Grid.GridView petLookUpEditView;
        private DevExpress.XtraGrid.Views.Grid.GridView itemLookUpEditView;
        private DevExpress.XtraEditors.TextEdit quantityTextEdit;
        private DevExpress.XtraEditors.TextEdit priceTextEdit;
        private DevExpress.XtraEditors.TextEdit idTextEdit;
        private DevExpress.XtraLayout.LayoutControlGroup layoutControlGroup2;
        private DevExpress.XtraLayout.LayoutControlItem ItemFororder_id;
        private DevExpress.XtraLayout.LayoutControlItem ItemForpet_id;
        private DevExpress.XtraLayout.LayoutControlItem ItemForitem_id;
        private DevExpress.XtraLayout.LayoutControlItem ItemForquantity;
        private DevExpress.XtraLayout.LayoutControlItem ItemForprice;
        private DevExpress.XtraLayout.LayoutControlItem ItemForid;
        private DevExpress.XtraBars.BarButtonItem bbiSave;
        private DevExpress.XtraBars.BarButtonItem bbiSaveAndClose;
        private DevExpress.XtraBars.BarButtonItem bbiSaveAndNew;
        private DevExpress.XtraBars.BarButtonItem bbiReset;
        private DevExpress.XtraBars.BarButtonItem bbiDelete;
        private DevExpress.XtraBars.BarButtonItem bbiClose;
        private DevExpress.XtraBars.BarButtonItem bbiSaveLayout;
        private DevExpress.XtraBars.BarButtonItem bbiResetLayout;
    }
}
