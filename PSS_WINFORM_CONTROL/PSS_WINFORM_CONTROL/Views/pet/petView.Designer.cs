namespace PSS_WINFORM_CONTROL.Views.petView {
    partial class petView {
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
            this.idTextEdit = new DevExpress.XtraEditors.TextEdit();
            this.petViewBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.mainRibbonControl = new DevExpress.XtraBars.Ribbon.RibbonControl();
            this.bbiCustomize = new DevExpress.XtraBars.BarButtonItem();
            this.bbiSave = new DevExpress.XtraBars.BarButtonItem();
            this.bbiSaveAndClose = new DevExpress.XtraBars.BarButtonItem();
            this.bbiSaveAndNew = new DevExpress.XtraBars.BarButtonItem();
            this.bbiReset = new DevExpress.XtraBars.BarButtonItem();
            this.bbiDelete = new DevExpress.XtraBars.BarButtonItem();
            this.bbiClose = new DevExpress.XtraBars.BarButtonItem();
            this.bbiSaveLayout = new DevExpress.XtraBars.BarButtonItem();
            this.bbiResetLayout = new DevExpress.XtraBars.BarButtonItem();
            this.mainRibbonPage = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.mainRibbonPageGroup = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonPageGroupLayout = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.nameTextEdit = new DevExpress.XtraEditors.TextEdit();
            this.descriptionTextEdit = new DevExpress.XtraEditors.TextEdit();
            this.birthDateEdit = new DevExpress.XtraEditors.DateEdit();
            this.priceTextEdit = new DevExpress.XtraEditors.TextEdit();
            this.colorTextEdit = new DevExpress.XtraEditors.TextEdit();
            this.vaccineCheckEdit = new DevExpress.XtraEditors.CheckEdit();
            this.statusCheckEdit = new DevExpress.XtraEditors.CheckEdit();
            this.speciesLookUpEdit = new DevExpress.XtraEditors.GridLookUpEdit();
            this.speciesBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.speciesLookUpEditView = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.order_productXtraUserControl = new DevExpress.XtraEditors.XtraUserControl();
            this.order_productGridControl = new DevExpress.XtraGrid.GridControl();
            this.order_productBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.order_productGridView = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.colorder_id = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colpet_id = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colitem_id = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colquantity = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colprice = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colid = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colitem = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colorder = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colpet = new DevExpress.XtraGrid.Columns.GridColumn();
            this.barDockControlLeft = new DevExpress.XtraBars.BarDockControl();
            this.order_productBarManager = new DevExpress.XtraBars.BarManager(this.components);
            this.order_productBar = new DevExpress.XtraBars.Bar();
            this.bbiorder_productNew = new DevExpress.XtraBars.BarButtonItem();
            this.bbiorder_productEdit = new DevExpress.XtraBars.BarButtonItem();
            this.bbiorder_productDelete = new DevExpress.XtraBars.BarButtonItem();
            this.bbiorder_productRefresh = new DevExpress.XtraBars.BarButtonItem();
            this.barDockControlTop = new DevExpress.XtraBars.BarDockControl();
            this.barDockControlBottom = new DevExpress.XtraBars.BarDockControl();
            this.barDockControlRight = new DevExpress.XtraBars.BarDockControl();
            this.imageComboBoxEdit1 = new DevExpress.XtraEditors.PictureEdit();
            this.genderTextEdit = new DevExpress.XtraEditors.RadioGroup();
            this.layoutControlGroup1 = new DevExpress.XtraLayout.LayoutControlGroup();
            this.layoutControlGroup2 = new DevExpress.XtraLayout.LayoutControlGroup();
            this.ItemForid = new DevExpress.XtraLayout.LayoutControlItem();
            this.ItemForname = new DevExpress.XtraLayout.LayoutControlItem();
            this.ItemFordescription = new DevExpress.XtraLayout.LayoutControlItem();
            this.ItemForgender = new DevExpress.XtraLayout.LayoutControlItem();
            this.ItemForbirth = new DevExpress.XtraLayout.LayoutControlItem();
            this.ItemForprice = new DevExpress.XtraLayout.LayoutControlItem();
            this.ItemForvaccine = new DevExpress.XtraLayout.LayoutControlItem();
            this.ItemForstatus = new DevExpress.XtraLayout.LayoutControlItem();
            this.ItemForspecies_id = new DevExpress.XtraLayout.LayoutControlItem();
            this.tabbedControlGroup1 = new DevExpress.XtraLayout.TabbedControlGroup();
            this.layoutControlGroup3 = new DevExpress.XtraLayout.LayoutControlGroup();
            this.ItemFororder_product = new DevExpress.XtraLayout.LayoutControlItem();
            this.ItemForcolor = new DevExpress.XtraLayout.LayoutControlItem();
            this.layoutControlItem1 = new DevExpress.XtraLayout.LayoutControlItem();
            this.mvvmContext = new DevExpress.Utils.MVVM.MVVMContext(this.components);
            this.order_productPopUpMenu = new DevExpress.XtraBars.PopupMenu(this.components);
            this.behaviorManager1 = new DevExpress.Utils.Behaviors.BehaviorManager(this.components);
            this.imageList1 = new System.Windows.Forms.ImageList(this.components);
            this.object_4652eaac_83ab_4b6b_9fa4_369399dddf03 = new DevExpress.XtraEditors.Repository.RepositoryItemRadioGroup();
            ((System.ComponentModel.ISupportInitialize)(this.dataLayoutControl1)).BeginInit();
            this.dataLayoutControl1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.idTextEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.petViewBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.mainRibbonControl)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nameTextEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.descriptionTextEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.birthDateEdit.Properties.CalendarTimeProperties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.birthDateEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.priceTextEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.colorTextEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.vaccineCheckEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.statusCheckEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.speciesLookUpEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.speciesBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.speciesLookUpEditView)).BeginInit();
            this.order_productXtraUserControl.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.order_productGridControl)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.order_productBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.order_productGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.order_productBarManager)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.imageComboBoxEdit1.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.genderTextEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForid)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForname)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemFordescription)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForgender)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForbirth)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForprice)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForvaccine)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForstatus)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForspecies_id)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tabbedControlGroup1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemFororder_product)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForcolor)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.mvvmContext)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.order_productPopUpMenu)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.behaviorManager1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.object_4652eaac_83ab_4b6b_9fa4_369399dddf03)).BeginInit();
            this.SuspendLayout();
            // 
            // dataLayoutControl1
            // 
            this.dataLayoutControl1.AllowCustomization = false;
            this.dataLayoutControl1.Controls.Add(this.idTextEdit);
            this.dataLayoutControl1.Controls.Add(this.nameTextEdit);
            this.dataLayoutControl1.Controls.Add(this.descriptionTextEdit);
            this.dataLayoutControl1.Controls.Add(this.birthDateEdit);
            this.dataLayoutControl1.Controls.Add(this.priceTextEdit);
            this.dataLayoutControl1.Controls.Add(this.colorTextEdit);
            this.dataLayoutControl1.Controls.Add(this.vaccineCheckEdit);
            this.dataLayoutControl1.Controls.Add(this.statusCheckEdit);
            this.dataLayoutControl1.Controls.Add(this.speciesLookUpEdit);
            this.dataLayoutControl1.Controls.Add(this.order_productXtraUserControl);
            this.dataLayoutControl1.Controls.Add(this.imageComboBoxEdit1);
            this.dataLayoutControl1.Controls.Add(this.genderTextEdit);
            this.dataLayoutControl1.DataSource = this.petViewBindingSource;
            this.dataLayoutControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataLayoutControl1.Location = new System.Drawing.Point(0, 116);
            this.dataLayoutControl1.Name = "dataLayoutControl1";
            this.dataLayoutControl1.Root = this.layoutControlGroup1;
            this.dataLayoutControl1.Size = new System.Drawing.Size(1024, 652);
            this.dataLayoutControl1.TabIndex = 0;
            // 
            // idTextEdit
            // 
            this.idTextEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.petViewBindingSource, "id", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.idTextEdit.Location = new System.Drawing.Point(68, 12);
            this.idTextEdit.MenuManager = this.mainRibbonControl;
            this.idTextEdit.Name = "idTextEdit";
            this.idTextEdit.Properties.Appearance.Options.UseTextOptions = true;
            this.idTextEdit.Properties.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Far;
            this.idTextEdit.Properties.Mask.EditMask = "N0";
            this.idTextEdit.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.Numeric;
            this.idTextEdit.Properties.Mask.UseMaskAsDisplayFormat = true;
            this.idTextEdit.Properties.ReadOnly = true;
            this.idTextEdit.Size = new System.Drawing.Size(944, 20);
            this.idTextEdit.StyleController = this.dataLayoutControl1;
            this.idTextEdit.TabIndex = 4;
            // 
            // petViewBindingSource
            // 
            this.petViewBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.pet);
            // 
            // mainRibbonControl
            // 
            this.mainRibbonControl.ExpandCollapseItem.Id = 0;
            this.mainRibbonControl.Items.AddRange(new DevExpress.XtraBars.BarItem[] {
            this.mainRibbonControl.ExpandCollapseItem,
            this.mainRibbonControl.SearchEditItem,
            this.bbiCustomize,
            this.bbiSave,
            this.bbiSaveAndClose,
            this.bbiSaveAndNew,
            this.bbiReset,
            this.bbiDelete,
            this.bbiClose,
            this.bbiSaveLayout,
            this.bbiResetLayout});
            this.mainRibbonControl.Location = new System.Drawing.Point(0, 0);
            this.mainRibbonControl.MaxItemId = 10;
            this.mainRibbonControl.Name = "mainRibbonControl";
            this.mainRibbonControl.Pages.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPage[] {
            this.mainRibbonPage});
            this.mainRibbonControl.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonControlStyle.Office2013;
            this.mainRibbonControl.ShowApplicationButton = DevExpress.Utils.DefaultBoolean.False;
            this.mainRibbonControl.Size = new System.Drawing.Size(1024, 116);
            this.mainRibbonControl.ToolbarLocation = DevExpress.XtraBars.Ribbon.RibbonQuickAccessToolbarLocation.Hidden;
            // 
            // bbiCustomize
            // 
            this.bbiCustomize.Caption = "Customize";
            this.bbiCustomize.Id = 1;
            this.bbiCustomize.ImageOptions.ImageUri.Uri = "Customization";
            this.bbiCustomize.Name = "bbiCustomize";
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
            this.mainRibbonPageGroup.Text = "pet Tasks";
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
            // nameTextEdit
            // 
            this.nameTextEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.petViewBindingSource, "name", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.nameTextEdit.Location = new System.Drawing.Point(68, 36);
            this.nameTextEdit.MenuManager = this.mainRibbonControl;
            this.nameTextEdit.Name = "nameTextEdit";
            this.nameTextEdit.Size = new System.Drawing.Size(944, 20);
            this.nameTextEdit.StyleController = this.dataLayoutControl1;
            this.nameTextEdit.TabIndex = 5;
            // 
            // descriptionTextEdit
            // 
            this.descriptionTextEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.petViewBindingSource, "description", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.descriptionTextEdit.Location = new System.Drawing.Point(68, 60);
            this.descriptionTextEdit.MenuManager = this.mainRibbonControl;
            this.descriptionTextEdit.Name = "descriptionTextEdit";
            this.descriptionTextEdit.Size = new System.Drawing.Size(944, 20);
            this.descriptionTextEdit.StyleController = this.dataLayoutControl1;
            this.descriptionTextEdit.TabIndex = 6;
            // 
            // birthDateEdit
            // 
            this.birthDateEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.petViewBindingSource, "birth", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.birthDateEdit.EditValue = null;
            this.birthDateEdit.Location = new System.Drawing.Point(68, 113);
            this.birthDateEdit.MenuManager = this.mainRibbonControl;
            this.birthDateEdit.Name = "birthDateEdit";
            this.birthDateEdit.Properties.AllowNullInput = DevExpress.Utils.DefaultBoolean.True;
            this.birthDateEdit.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.birthDateEdit.Properties.CalendarTimeProperties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.birthDateEdit.Size = new System.Drawing.Size(944, 20);
            this.birthDateEdit.StyleController = this.dataLayoutControl1;
            this.birthDateEdit.TabIndex = 8;
            // 
            // priceTextEdit
            // 
            this.priceTextEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.petViewBindingSource, "price", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.priceTextEdit.Location = new System.Drawing.Point(68, 137);
            this.priceTextEdit.MenuManager = this.mainRibbonControl;
            this.priceTextEdit.Name = "priceTextEdit";
            this.priceTextEdit.Properties.AllowNullInput = DevExpress.Utils.DefaultBoolean.True;
            this.priceTextEdit.Properties.Appearance.Options.UseTextOptions = true;
            this.priceTextEdit.Properties.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Far;
            this.priceTextEdit.Properties.Mask.EditMask = "F";
            this.priceTextEdit.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.Numeric;
            this.priceTextEdit.Properties.Mask.UseMaskAsDisplayFormat = true;
            this.priceTextEdit.Size = new System.Drawing.Size(944, 20);
            this.priceTextEdit.StyleController = this.dataLayoutControl1;
            this.priceTextEdit.TabIndex = 9;
            // 
            // colorTextEdit
            // 
            this.colorTextEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.petViewBindingSource, "color", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.colorTextEdit.Location = new System.Drawing.Point(68, 161);
            this.colorTextEdit.MenuManager = this.mainRibbonControl;
            this.colorTextEdit.Name = "colorTextEdit";
            this.colorTextEdit.Size = new System.Drawing.Size(944, 20);
            this.colorTextEdit.StyleController = this.dataLayoutControl1;
            this.colorTextEdit.TabIndex = 10;
            // 
            // vaccineCheckEdit
            // 
            this.vaccineCheckEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.petViewBindingSource, "vaccine", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.vaccineCheckEdit.Location = new System.Drawing.Point(12, 209);
            this.vaccineCheckEdit.MenuManager = this.mainRibbonControl;
            this.vaccineCheckEdit.Name = "vaccineCheckEdit";
            this.vaccineCheckEdit.Properties.Caption = "Vaccine";
            this.vaccineCheckEdit.Properties.GlyphAlignment = DevExpress.Utils.HorzAlignment.Default;
            this.vaccineCheckEdit.Size = new System.Drawing.Size(1000, 19);
            this.vaccineCheckEdit.StyleController = this.dataLayoutControl1;
            this.vaccineCheckEdit.TabIndex = 11;
            // 
            // statusCheckEdit
            // 
            this.statusCheckEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.petViewBindingSource, "status", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.statusCheckEdit.Location = new System.Drawing.Point(12, 232);
            this.statusCheckEdit.MenuManager = this.mainRibbonControl;
            this.statusCheckEdit.Name = "statusCheckEdit";
            this.statusCheckEdit.Properties.Caption = "Status";
            this.statusCheckEdit.Properties.GlyphAlignment = DevExpress.Utils.HorzAlignment.Default;
            this.statusCheckEdit.Size = new System.Drawing.Size(1000, 19);
            this.statusCheckEdit.StyleController = this.dataLayoutControl1;
            this.statusCheckEdit.TabIndex = 12;
            // 
            // speciesLookUpEdit
            // 
            this.speciesLookUpEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.petViewBindingSource, "species_id", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.speciesLookUpEdit.Location = new System.Drawing.Point(68, 255);
            this.speciesLookUpEdit.MenuManager = this.mainRibbonControl;
            this.speciesLookUpEdit.Name = "speciesLookUpEdit";
            this.speciesLookUpEdit.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.speciesLookUpEdit.Properties.DataSource = this.speciesBindingSource;
            this.speciesLookUpEdit.Properties.DisplayMember = "name";
            this.speciesLookUpEdit.Properties.PopupView = this.speciesLookUpEditView;
            this.speciesLookUpEdit.Properties.ValueMember = "id";
            this.speciesLookUpEdit.Size = new System.Drawing.Size(944, 20);
            this.speciesLookUpEdit.StyleController = this.dataLayoutControl1;
            this.speciesLookUpEdit.TabIndex = 13;
            // 
            // speciesBindingSource
            // 
            this.speciesBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.species);
            // 
            // speciesLookUpEditView
            // 
            this.speciesLookUpEditView.FocusRectStyle = DevExpress.XtraGrid.Views.Grid.DrawFocusRectStyle.RowFocus;
            this.speciesLookUpEditView.Name = "speciesLookUpEditView";
            this.speciesLookUpEditView.OptionsSelection.EnableAppearanceFocusedCell = false;
            this.speciesLookUpEditView.OptionsView.ShowGroupPanel = false;
            // 
            // order_productXtraUserControl
            // 
            this.order_productXtraUserControl.Controls.Add(this.order_productGridControl);
            this.order_productXtraUserControl.Controls.Add(this.barDockControlLeft);
            this.order_productXtraUserControl.Controls.Add(this.barDockControlRight);
            this.order_productXtraUserControl.Controls.Add(this.barDockControlBottom);
            this.order_productXtraUserControl.Controls.Add(this.barDockControlTop);
            this.order_productXtraUserControl.Location = new System.Drawing.Point(24, 313);
            this.order_productXtraUserControl.MinimumSize = new System.Drawing.Size(100, 100);
            this.order_productXtraUserControl.Name = "order_productXtraUserControl";
            this.order_productXtraUserControl.Size = new System.Drawing.Size(976, 315);
            this.order_productXtraUserControl.TabIndex = 15;
            // 
            // order_productGridControl
            // 
            this.order_productGridControl.DataSource = this.order_productBindingSource;
            this.order_productGridControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.order_productGridControl.Location = new System.Drawing.Point(0, 24);
            this.order_productGridControl.MainView = this.order_productGridView;
            this.order_productGridControl.MenuManager = this.mainRibbonControl;
            this.order_productGridControl.Name = "order_productGridControl";
            this.order_productGridControl.Size = new System.Drawing.Size(976, 291);
            this.order_productGridControl.TabIndex = 0;
            this.order_productGridControl.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.order_productGridView});
            // 
            // order_productBindingSource
            // 
            this.order_productBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.order_product);
            // 
            // order_productGridView
            // 
            this.order_productGridView.Columns.AddRange(new DevExpress.XtraGrid.Columns.GridColumn[] {
            this.colorder_id,
            this.colpet_id,
            this.colitem_id,
            this.colquantity,
            this.colprice,
            this.colid,
            this.colitem,
            this.colorder,
            this.colpet});
            this.order_productGridView.GridControl = this.order_productGridControl;
            this.order_productGridView.Name = "order_productGridView";
            this.order_productGridView.OptionsBehavior.Editable = false;
            this.order_productGridView.OptionsBehavior.ReadOnly = true;
            // 
            // colorder_id
            // 
            this.colorder_id.Caption = "Order ID";
            this.colorder_id.FieldName = "order_id";
            this.colorder_id.Name = "colorder_id";
            this.colorder_id.Visible = true;
            this.colorder_id.VisibleIndex = 0;
            // 
            // colpet_id
            // 
            this.colpet_id.Caption = "Pet ID";
            this.colpet_id.FieldName = "pet_id";
            this.colpet_id.Name = "colpet_id";
            this.colpet_id.Visible = true;
            this.colpet_id.VisibleIndex = 1;
            // 
            // colitem_id
            // 
            this.colitem_id.Caption = "Item ID";
            this.colitem_id.FieldName = "item_id";
            this.colitem_id.Name = "colitem_id";
            this.colitem_id.Visible = true;
            this.colitem_id.VisibleIndex = 2;
            // 
            // colquantity
            // 
            this.colquantity.Caption = "Quantity";
            this.colquantity.FieldName = "quantity";
            this.colquantity.Name = "colquantity";
            this.colquantity.Visible = true;
            this.colquantity.VisibleIndex = 3;
            // 
            // colprice
            // 
            this.colprice.Caption = "Price";
            this.colprice.FieldName = "price";
            this.colprice.Name = "colprice";
            this.colprice.Visible = true;
            this.colprice.VisibleIndex = 4;
            // 
            // colid
            // 
            this.colid.Caption = "ID";
            this.colid.FieldName = "id";
            this.colid.Name = "colid";
            this.colid.Visible = true;
            this.colid.VisibleIndex = 5;
            // 
            // colitem
            // 
            this.colitem.FieldName = "item";
            this.colitem.Name = "colitem";
            // 
            // colorder
            // 
            this.colorder.FieldName = "order";
            this.colorder.Name = "colorder";
            // 
            // colpet
            // 
            this.colpet.FieldName = "pet";
            this.colpet.Name = "colpet";
            // 
            // barDockControlLeft
            // 
            this.barDockControlLeft.CausesValidation = false;
            this.barDockControlLeft.Dock = System.Windows.Forms.DockStyle.Left;
            this.barDockControlLeft.Location = new System.Drawing.Point(0, 24);
            this.barDockControlLeft.Manager = this.order_productBarManager;
            this.barDockControlLeft.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.barDockControlLeft.Size = new System.Drawing.Size(0, 291);
            // 
            // order_productBarManager
            // 
            this.order_productBarManager.AllowCustomization = false;
            this.order_productBarManager.Bars.AddRange(new DevExpress.XtraBars.Bar[] {
            this.order_productBar});
            this.order_productBarManager.DockControls.Add(this.barDockControlTop);
            this.order_productBarManager.DockControls.Add(this.barDockControlBottom);
            this.order_productBarManager.DockControls.Add(this.barDockControlLeft);
            this.order_productBarManager.DockControls.Add(this.barDockControlRight);
            this.order_productBarManager.Form = this.order_productXtraUserControl;
            this.order_productBarManager.Items.AddRange(new DevExpress.XtraBars.BarItem[] {
            this.bbiorder_productNew,
            this.bbiorder_productEdit,
            this.bbiorder_productDelete,
            this.bbiorder_productRefresh});
            this.order_productBarManager.MainMenu = this.order_productBar;
            this.order_productBarManager.MaxItemId = 4;
            // 
            // order_productBar
            // 
            this.order_productBar.BarName = "order_product";
            this.order_productBar.DockCol = 0;
            this.order_productBar.DockRow = 0;
            this.order_productBar.DockStyle = DevExpress.XtraBars.BarDockStyle.Top;
            this.order_productBar.LinksPersistInfo.AddRange(new DevExpress.XtraBars.LinkPersistInfo[] {
            new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_productNew),
            new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_productEdit),
            new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_productDelete),
            new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_productRefresh)});
            this.order_productBar.OptionsBar.AllowQuickCustomization = false;
            this.order_productBar.OptionsBar.DrawDragBorder = false;
            this.order_productBar.Text = "order_product";
            // 
            // bbiorder_productNew
            // 
            this.bbiorder_productNew.Caption = "New";
            this.bbiorder_productNew.Id = 0;
            this.bbiorder_productNew.ImageOptions.ImageUri.Uri = "New";
            this.bbiorder_productNew.Name = "bbiorder_productNew";
            this.bbiorder_productNew.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
            // 
            // bbiorder_productEdit
            // 
            this.bbiorder_productEdit.Caption = "Edit";
            this.bbiorder_productEdit.Id = 1;
            this.bbiorder_productEdit.ImageOptions.ImageUri.Uri = "Edit";
            this.bbiorder_productEdit.Name = "bbiorder_productEdit";
            this.bbiorder_productEdit.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
            // 
            // bbiorder_productDelete
            // 
            this.bbiorder_productDelete.Caption = "Delete";
            this.bbiorder_productDelete.Id = 2;
            this.bbiorder_productDelete.ImageOptions.ImageUri.Uri = "Delete";
            this.bbiorder_productDelete.Name = "bbiorder_productDelete";
            this.bbiorder_productDelete.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
            // 
            // bbiorder_productRefresh
            // 
            this.bbiorder_productRefresh.Caption = "Refresh";
            this.bbiorder_productRefresh.Id = 3;
            this.bbiorder_productRefresh.ImageOptions.ImageUri.Uri = "Refresh";
            this.bbiorder_productRefresh.Name = "bbiorder_productRefresh";
            this.bbiorder_productRefresh.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
            // 
            // barDockControlTop
            // 
            this.barDockControlTop.CausesValidation = false;
            this.barDockControlTop.Dock = System.Windows.Forms.DockStyle.Top;
            this.barDockControlTop.Location = new System.Drawing.Point(0, 0);
            this.barDockControlTop.Manager = this.order_productBarManager;
            this.barDockControlTop.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.barDockControlTop.Size = new System.Drawing.Size(976, 24);
            // 
            // barDockControlBottom
            // 
            this.barDockControlBottom.CausesValidation = false;
            this.barDockControlBottom.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.barDockControlBottom.Location = new System.Drawing.Point(0, 315);
            this.barDockControlBottom.Manager = this.order_productBarManager;
            this.barDockControlBottom.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.barDockControlBottom.Size = new System.Drawing.Size(976, 0);
            // 
            // barDockControlRight
            // 
            this.barDockControlRight.CausesValidation = false;
            this.barDockControlRight.Dock = System.Windows.Forms.DockStyle.Right;
            this.barDockControlRight.Location = new System.Drawing.Point(976, 24);
            this.barDockControlRight.Manager = this.order_productBarManager;
            this.barDockControlRight.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.barDockControlRight.Size = new System.Drawing.Size(0, 291);
            // 
            // imageComboBoxEdit1
            // 
            this.imageComboBoxEdit1.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.petViewBindingSource, "image", true));
            this.imageComboBoxEdit1.Location = new System.Drawing.Point(68, 185);
            this.imageComboBoxEdit1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.imageComboBoxEdit1.MenuManager = this.mainRibbonControl;
            this.imageComboBoxEdit1.Name = "imageComboBoxEdit1";
            this.imageComboBoxEdit1.Properties.ShowCameraMenuItem = DevExpress.XtraEditors.Controls.CameraMenuItemVisibility.Auto;
            this.imageComboBoxEdit1.Properties.SizeMode = DevExpress.XtraEditors.Controls.PictureSizeMode.Stretch;
            this.imageComboBoxEdit1.Size = new System.Drawing.Size(944, 20);
            this.imageComboBoxEdit1.StyleController = this.dataLayoutControl1;
            this.imageComboBoxEdit1.TabIndex = 16;
            this.imageComboBoxEdit1.TabStop = true;
            // 
            // genderTextEdit
            // 
            this.genderTextEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.petViewBindingSource, "gender", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.genderTextEdit.EditValue = "Male";
            this.genderTextEdit.Location = new System.Drawing.Point(68, 84);
            this.genderTextEdit.MenuManager = this.mainRibbonControl;
            this.genderTextEdit.Name = "genderTextEdit";
            this.genderTextEdit.Properties.Items.AddRange(new DevExpress.XtraEditors.Controls.RadioGroupItem[] {
            new DevExpress.XtraEditors.Controls.RadioGroupItem("Male", "Male", true, "Male"),
            new DevExpress.XtraEditors.Controls.RadioGroupItem("Female", "Female", true, "Female")});
            this.genderTextEdit.Properties.Tag = "Male";
            this.genderTextEdit.Size = new System.Drawing.Size(944, 25);
            this.genderTextEdit.StyleController = this.dataLayoutControl1;
            this.genderTextEdit.TabIndex = 7;
            // 
            // layoutControlGroup1
            // 
            this.layoutControlGroup1.EnableIndentsWithoutBorders = DevExpress.Utils.DefaultBoolean.True;
            this.layoutControlGroup1.GroupBordersVisible = false;
            this.layoutControlGroup1.Items.AddRange(new DevExpress.XtraLayout.BaseLayoutItem[] {
            this.layoutControlGroup2});
            this.layoutControlGroup1.Name = "Root";
            this.layoutControlGroup1.Size = new System.Drawing.Size(1024, 652);
            this.layoutControlGroup1.TextVisible = false;
            // 
            // layoutControlGroup2
            // 
            this.layoutControlGroup2.AllowDrawBackground = false;
            this.layoutControlGroup2.GroupBordersVisible = false;
            this.layoutControlGroup2.Items.AddRange(new DevExpress.XtraLayout.BaseLayoutItem[] {
            this.ItemForid,
            this.ItemForname,
            this.ItemFordescription,
            this.ItemForgender,
            this.ItemForbirth,
            this.ItemForprice,
            this.ItemForvaccine,
            this.ItemForstatus,
            this.ItemForspecies_id,
            this.tabbedControlGroup1,
            this.ItemForcolor,
            this.layoutControlItem1});
            this.layoutControlGroup2.Location = new System.Drawing.Point(0, 0);
            this.layoutControlGroup2.Name = "autoGeneratedGroup0";
            this.layoutControlGroup2.Size = new System.Drawing.Size(1004, 632);
            // 
            // ItemForid
            // 
            this.ItemForid.Control = this.idTextEdit;
            this.ItemForid.Location = new System.Drawing.Point(0, 0);
            this.ItemForid.Name = "ItemForid";
            this.ItemForid.Size = new System.Drawing.Size(1004, 24);
            this.ItemForid.Text = "ID";
            this.ItemForid.TextSize = new System.Drawing.Size(53, 13);
            // 
            // ItemForname
            // 
            this.ItemForname.Control = this.nameTextEdit;
            this.ItemForname.Location = new System.Drawing.Point(0, 24);
            this.ItemForname.Name = "ItemForname";
            this.ItemForname.Size = new System.Drawing.Size(1004, 24);
            this.ItemForname.Text = "Name";
            this.ItemForname.TextSize = new System.Drawing.Size(53, 13);
            // 
            // ItemFordescription
            // 
            this.ItemFordescription.Control = this.descriptionTextEdit;
            this.ItemFordescription.Location = new System.Drawing.Point(0, 48);
            this.ItemFordescription.Name = "ItemFordescription";
            this.ItemFordescription.Size = new System.Drawing.Size(1004, 24);
            this.ItemFordescription.Text = "Description";
            this.ItemFordescription.TextSize = new System.Drawing.Size(53, 13);
            // 
            // ItemForgender
            // 
            this.ItemForgender.Control = this.genderTextEdit;
            this.ItemForgender.Location = new System.Drawing.Point(0, 72);
            this.ItemForgender.Name = "ItemForgender";
            this.ItemForgender.Size = new System.Drawing.Size(1004, 29);
            this.ItemForgender.Text = "Gender";
            this.ItemForgender.TextSize = new System.Drawing.Size(53, 13);
            // 
            // ItemForbirth
            // 
            this.ItemForbirth.Control = this.birthDateEdit;
            this.ItemForbirth.Location = new System.Drawing.Point(0, 101);
            this.ItemForbirth.Name = "ItemForbirth";
            this.ItemForbirth.Size = new System.Drawing.Size(1004, 24);
            this.ItemForbirth.Text = "Birth";
            this.ItemForbirth.TextSize = new System.Drawing.Size(53, 13);
            // 
            // ItemForprice
            // 
            this.ItemForprice.Control = this.priceTextEdit;
            this.ItemForprice.Location = new System.Drawing.Point(0, 125);
            this.ItemForprice.Name = "ItemForprice";
            this.ItemForprice.Size = new System.Drawing.Size(1004, 24);
            this.ItemForprice.Text = "Price";
            this.ItemForprice.TextSize = new System.Drawing.Size(53, 13);
            // 
            // ItemForvaccine
            // 
            this.ItemForvaccine.Control = this.vaccineCheckEdit;
            this.ItemForvaccine.Location = new System.Drawing.Point(0, 197);
            this.ItemForvaccine.Name = "ItemForvaccine";
            this.ItemForvaccine.Size = new System.Drawing.Size(1004, 23);
            this.ItemForvaccine.Text = "vaccine";
            this.ItemForvaccine.TextSize = new System.Drawing.Size(0, 0);
            this.ItemForvaccine.TextVisible = false;
            // 
            // ItemForstatus
            // 
            this.ItemForstatus.Control = this.statusCheckEdit;
            this.ItemForstatus.Location = new System.Drawing.Point(0, 220);
            this.ItemForstatus.Name = "ItemForstatus";
            this.ItemForstatus.Size = new System.Drawing.Size(1004, 23);
            this.ItemForstatus.Text = "status";
            this.ItemForstatus.TextSize = new System.Drawing.Size(0, 0);
            this.ItemForstatus.TextVisible = false;
            // 
            // ItemForspecies_id
            // 
            this.ItemForspecies_id.Control = this.speciesLookUpEdit;
            this.ItemForspecies_id.Location = new System.Drawing.Point(0, 243);
            this.ItemForspecies_id.Name = "ItemForspecies_id";
            this.ItemForspecies_id.Size = new System.Drawing.Size(1004, 24);
            this.ItemForspecies_id.Text = "Species ID";
            this.ItemForspecies_id.TextSize = new System.Drawing.Size(53, 13);
            // 
            // tabbedControlGroup1
            // 
            this.tabbedControlGroup1.Location = new System.Drawing.Point(0, 267);
            this.tabbedControlGroup1.Name = "autoGroupForTabs";
            this.tabbedControlGroup1.SelectedTabPage = this.layoutControlGroup3;
            this.tabbedControlGroup1.Size = new System.Drawing.Size(1004, 365);
            this.tabbedControlGroup1.TabPages.AddRange(new DevExpress.XtraLayout.BaseLayoutItem[] {
            this.layoutControlGroup3});
            this.tabbedControlGroup1.Text = "Tabs";
            // 
            // layoutControlGroup3
            // 
            this.layoutControlGroup3.Items.AddRange(new DevExpress.XtraLayout.BaseLayoutItem[] {
            this.ItemFororder_product});
            this.layoutControlGroup3.Location = new System.Drawing.Point(0, 0);
            this.layoutControlGroup3.Name = "autoGroupFororder_product";
            this.layoutControlGroup3.Size = new System.Drawing.Size(980, 319);
            this.layoutControlGroup3.Text = "Order Product";
            // 
            // ItemFororder_product
            // 
            this.ItemFororder_product.Control = this.order_productXtraUserControl;
            this.ItemFororder_product.Location = new System.Drawing.Point(0, 0);
            this.ItemFororder_product.Name = "ItemFororder_product";
            this.ItemFororder_product.Size = new System.Drawing.Size(980, 319);
            this.ItemFororder_product.StartNewLine = true;
            this.ItemFororder_product.Text = "order_product";
            this.ItemFororder_product.TextSize = new System.Drawing.Size(0, 0);
            this.ItemFororder_product.TextVisible = false;
            // 
            // ItemForcolor
            // 
            this.ItemForcolor.Control = this.colorTextEdit;
            this.ItemForcolor.Location = new System.Drawing.Point(0, 149);
            this.ItemForcolor.Name = "ItemForcolor";
            this.ItemForcolor.Size = new System.Drawing.Size(1004, 24);
            this.ItemForcolor.Text = "Color";
            this.ItemForcolor.TextSize = new System.Drawing.Size(53, 13);
            // 
            // layoutControlItem1
            // 
            this.layoutControlItem1.Control = this.imageComboBoxEdit1;
            this.layoutControlItem1.Location = new System.Drawing.Point(0, 173);
            this.layoutControlItem1.Name = "layoutControlItem1";
            this.layoutControlItem1.Size = new System.Drawing.Size(1004, 24);
            this.layoutControlItem1.Text = "Image";
            this.layoutControlItem1.TextSize = new System.Drawing.Size(53, 13);
            // 
            // mvvmContext
            // 
            this.mvvmContext.BindingExpressions.AddRange(new DevExpress.Utils.MVVM.BindingExpression[] {
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.petViewModel), "Save", this.bbiSave),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.petViewModel), "SaveAndClose", this.bbiSaveAndClose),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.petViewModel), "SaveAndNew", this.bbiSaveAndNew),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.petViewModel), "Reset", this.bbiReset),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.petViewModel), "Delete", this.bbiDelete),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.petViewModel), "Close", this.bbiClose),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.petViewModel), "SaveLayout", this.bbiSaveLayout),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.petViewModel), "ResetLayout", this.bbiResetLayout)});
            this.mvvmContext.ContainerControl = this;
            this.mvvmContext.RegistrationExpressions.AddRange(new DevExpress.Utils.MVVM.RegistrationExpression[] {
            DevExpress.Utils.MVVM.RegistrationExpression.RegisterLayoutSerializationService(null, false, DevExpress.Utils.DefaultBoolean.True, this.dataLayoutControl1)});
            this.mvvmContext.ViewModelType = typeof(PSS_WINFORM_CONTROL.ViewModels.petViewModel);
            // 
            // order_productPopUpMenu
            // 
            this.order_productPopUpMenu.LinksPersistInfo.AddRange(new DevExpress.XtraBars.LinkPersistInfo[] {
            new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_productNew),
            new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_productEdit),
            new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_productDelete),
            new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_productRefresh)});
            this.order_productPopUpMenu.Manager = this.order_productBarManager;
            this.order_productPopUpMenu.Name = "order_productPopUpMenu";
            // 
            // imageList1
            // 
            this.imageList1.ColorDepth = System.Windows.Forms.ColorDepth.Depth8Bit;
            this.imageList1.ImageSize = new System.Drawing.Size(16, 16);
            this.imageList1.TransparentColor = System.Drawing.Color.Transparent;
            // 
            // object_4652eaac_83ab_4b6b_9fa4_369399dddf03
            // 
            this.object_4652eaac_83ab_4b6b_9fa4_369399dddf03.Items.AddRange(new DevExpress.XtraEditors.Controls.RadioGroupItem[] {
            new DevExpress.XtraEditors.Controls.RadioGroupItem("Male", "Male", true, "Male"),
            new DevExpress.XtraEditors.Controls.RadioGroupItem("Female", "Female", true, "Female")});
            this.object_4652eaac_83ab_4b6b_9fa4_369399dddf03.Name = "object_4652eaac_83ab_4b6b_9fa4_369399dddf03";
            this.object_4652eaac_83ab_4b6b_9fa4_369399dddf03.Tag = "Male";
            // 
            // petView
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.Controls.Add(this.dataLayoutControl1);
            this.Controls.Add(this.mainRibbonControl);
            this.Name = "petView";
            this.Size = new System.Drawing.Size(1024, 768);
            ((System.ComponentModel.ISupportInitialize)(this.dataLayoutControl1)).EndInit();
            this.dataLayoutControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.idTextEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.petViewBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.mainRibbonControl)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nameTextEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.descriptionTextEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.birthDateEdit.Properties.CalendarTimeProperties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.birthDateEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.priceTextEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.colorTextEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.vaccineCheckEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.statusCheckEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.speciesLookUpEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.speciesBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.speciesLookUpEditView)).EndInit();
            this.order_productXtraUserControl.ResumeLayout(false);
            this.order_productXtraUserControl.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.order_productGridControl)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.order_productBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.order_productGridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.order_productBarManager)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.imageComboBoxEdit1.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.genderTextEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForid)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForname)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemFordescription)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForgender)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForbirth)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForprice)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForvaccine)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForstatus)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForspecies_id)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tabbedControlGroup1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemFororder_product)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForcolor)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlItem1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.mvvmContext)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.order_productPopUpMenu)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.behaviorManager1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.object_4652eaac_83ab_4b6b_9fa4_369399dddf03)).EndInit();
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
		private System.Windows.Forms.BindingSource petViewBindingSource;
				private DevExpress.XtraGrid.GridControl order_productGridControl;
		private DevExpress.XtraGrid.Views.Grid.GridView order_productGridView;
		private DevExpress.XtraBars.BarManager order_productBarManager;
		private DevExpress.XtraBars.Bar order_productBar;
		private DevExpress.XtraEditors.XtraUserControl order_productXtraUserControl;
		private DevExpress.XtraBars.PopupMenu order_productPopUpMenu;
				private DevExpress.XtraBars.BarButtonItem bbiorder_productNew;
				private DevExpress.XtraBars.BarButtonItem bbiorder_productEdit;
				private DevExpress.XtraBars.BarButtonItem bbiorder_productDelete;
				private DevExpress.XtraBars.BarButtonItem bbiorder_productRefresh;
								private DevExpress.XtraEditors.GridLookUpEdit speciesLookUpEdit;
		private System.Windows.Forms.BindingSource speciesBindingSource;
        private DevExpress.XtraEditors.TextEdit idTextEdit;
        private DevExpress.XtraBars.BarButtonItem bbiSave;
        private DevExpress.XtraBars.BarButtonItem bbiSaveAndClose;
        private DevExpress.XtraBars.BarButtonItem bbiSaveAndNew;
        private DevExpress.XtraBars.BarButtonItem bbiReset;
        private DevExpress.XtraBars.BarButtonItem bbiDelete;
        private DevExpress.XtraBars.BarButtonItem bbiClose;
        private DevExpress.XtraBars.BarButtonItem bbiSaveLayout;
        private DevExpress.XtraBars.BarButtonItem bbiResetLayout;
        private DevExpress.XtraEditors.TextEdit nameTextEdit;
        private DevExpress.XtraEditors.TextEdit descriptionTextEdit;
        private DevExpress.XtraEditors.DateEdit birthDateEdit;
        private DevExpress.XtraEditors.TextEdit priceTextEdit;
        private DevExpress.XtraEditors.TextEdit colorTextEdit;
        private DevExpress.XtraEditors.CheckEdit vaccineCheckEdit;
        private DevExpress.XtraEditors.CheckEdit statusCheckEdit;
        private DevExpress.XtraGrid.Views.Grid.GridView speciesLookUpEditView;
        private System.Windows.Forms.BindingSource order_productBindingSource;
        private DevExpress.XtraGrid.Columns.GridColumn colorder_id;
        private DevExpress.XtraGrid.Columns.GridColumn colpet_id;
        private DevExpress.XtraGrid.Columns.GridColumn colitem_id;
        private DevExpress.XtraGrid.Columns.GridColumn colquantity;
        private DevExpress.XtraGrid.Columns.GridColumn colprice;
        private DevExpress.XtraGrid.Columns.GridColumn colid;
        private DevExpress.XtraGrid.Columns.GridColumn colitem;
        private DevExpress.XtraGrid.Columns.GridColumn colorder;
        private DevExpress.XtraGrid.Columns.GridColumn colpet;
        private DevExpress.XtraBars.BarDockControl barDockControlLeft;
        private DevExpress.XtraBars.BarDockControl barDockControlTop;
        private DevExpress.XtraBars.BarDockControl barDockControlBottom;
        private DevExpress.XtraBars.BarDockControl barDockControlRight;
        private DevExpress.XtraLayout.LayoutControlGroup layoutControlGroup2;
        private DevExpress.XtraLayout.LayoutControlItem ItemForid;
        private DevExpress.XtraLayout.LayoutControlItem ItemForname;
        private DevExpress.XtraLayout.LayoutControlItem ItemFordescription;
        private DevExpress.XtraLayout.LayoutControlItem ItemForgender;
        private DevExpress.XtraLayout.LayoutControlItem ItemForbirth;
        private DevExpress.XtraLayout.LayoutControlItem ItemForprice;
        private DevExpress.XtraLayout.LayoutControlItem ItemForcolor;
        private DevExpress.XtraLayout.LayoutControlItem ItemForvaccine;
        private DevExpress.XtraLayout.LayoutControlItem ItemForstatus;
        private DevExpress.XtraLayout.LayoutControlItem ItemForspecies_id;
        private DevExpress.XtraLayout.TabbedControlGroup tabbedControlGroup1;
        private DevExpress.XtraLayout.LayoutControlGroup layoutControlGroup3;
        private DevExpress.XtraLayout.LayoutControlItem ItemFororder_product;
        private DevExpress.XtraEditors.PictureEdit imageComboBoxEdit1;
        private DevExpress.XtraLayout.LayoutControlItem layoutControlItem1;
        private DevExpress.Utils.Behaviors.BehaviorManager behaviorManager1;
        private System.Windows.Forms.ImageList imageList1;
        private DevExpress.XtraEditors.RadioGroup genderTextEdit;
        private DevExpress.XtraEditors.Repository.RepositoryItemRadioGroup object_4652eaac_83ab_4b6b_9fa4_369399dddf03;
    }
}
