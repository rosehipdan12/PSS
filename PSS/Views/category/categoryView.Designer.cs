namespace PSS.Views.categoryView {
    partial class categoryView {
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
			this.mvvmContext = new DevExpress.Utils.MVVM.MVVMContext(this.components);
			this.mainRibbonControl = new DevExpress.XtraBars.Ribbon.RibbonControl();
			this.mainRibbonPage = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.mainRibbonPageGroup = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
			this.ribbonPageGroupLayout = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.bbiCustomize = new DevExpress.XtraBars.BarButtonItem();
						this.category1GridControl = new DevExpress.XtraGrid.GridControl();
			this.category1GridView = new DevExpress.XtraGrid.Views.Grid.GridView();
			this.category1BarManager = new DevExpress.XtraBars.BarManager();
			this.category1Bar = new DevExpress.XtraBars.Bar();
			this.category1XtraUserControl = new DevExpress.XtraEditors.XtraUserControl();
			this.category1PopUpMenu = new DevExpress.XtraBars.PopupMenu(this.components);
						this.bbicategory1New = new DevExpress.XtraBars.BarButtonItem();
						this.bbicategory1Edit = new DevExpress.XtraBars.BarButtonItem();
						this.bbicategory1Delete = new DevExpress.XtraBars.BarButtonItem();
						this.bbicategory1Refresh = new DevExpress.XtraBars.BarButtonItem();
						((System.ComponentModel.ISupportInitialize)(this.category1BarManager)).BeginInit();
						this.itemsGridControl = new DevExpress.XtraGrid.GridControl();
			this.itemsGridView = new DevExpress.XtraGrid.Views.Grid.GridView();
			this.itemsBarManager = new DevExpress.XtraBars.BarManager();
			this.itemsBar = new DevExpress.XtraBars.Bar();
			this.itemsXtraUserControl = new DevExpress.XtraEditors.XtraUserControl();
			this.itemsPopUpMenu = new DevExpress.XtraBars.PopupMenu(this.components);
						this.bbiitemsNew = new DevExpress.XtraBars.BarButtonItem();
						this.bbiitemsEdit = new DevExpress.XtraBars.BarButtonItem();
						this.bbiitemsDelete = new DevExpress.XtraBars.BarButtonItem();
						this.bbiitemsRefresh = new DevExpress.XtraBars.BarButtonItem();
						((System.ComponentModel.ISupportInitialize)(this.itemsBarManager)).BeginInit();
									this.category2LookUpEdit = new DevExpress.XtraEditors.GridLookUpEdit();
			this.category2BindingSource = new System.Windows.Forms.BindingSource(this.components);
			 
			this.SuspendLayout();
			// 
            // mainRibbonControl
            // 
            this.mainRibbonControl.ExpandCollapseItem.Id = 0;
			this.mainRibbonControl.Items.AddRange(new DevExpress.XtraBars.BarItem[] {this.bbiCustomize});
            this.mainRibbonControl.Name = "mainRibbonControl";
			this.mainRibbonControl.Pages.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPage[] {this.mainRibbonPage});
            this.mainRibbonControl.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonControlStyle.Office2013;
            this.mainRibbonControl.ShowApplicationButton = DevExpress.Utils.DefaultBoolean.False;
            this.mainRibbonControl.ToolbarLocation = DevExpress.XtraBars.Ribbon.RibbonQuickAccessToolbarLocation.Hidden;
						DevExpress.XtraBars.BarButtonItem bbiSave = new DevExpress.XtraBars.BarButtonItem();
			bbiSave.Caption = "Save";
			bbiSave.Name = "bbiSave";
			bbiSave.ImageUri.Uri = "Save";
			this.mainRibbonControl.Items.Add(bbiSave);
						DevExpress.XtraBars.BarButtonItem bbiSaveAndClose = new DevExpress.XtraBars.BarButtonItem();
			bbiSaveAndClose.Caption = "Save And Close";
			bbiSaveAndClose.Name = "bbiSaveAndClose";
			bbiSaveAndClose.ImageUri.Uri = "SaveAndClose";
			this.mainRibbonControl.Items.Add(bbiSaveAndClose);
						DevExpress.XtraBars.BarButtonItem bbiSaveAndNew = new DevExpress.XtraBars.BarButtonItem();
			bbiSaveAndNew.Caption = "Save And New";
			bbiSaveAndNew.Name = "bbiSaveAndNew";
			bbiSaveAndNew.ImageUri.Uri = "SaveAndNew";
			this.mainRibbonControl.Items.Add(bbiSaveAndNew);
						DevExpress.XtraBars.BarButtonItem bbiReset = new DevExpress.XtraBars.BarButtonItem();
			bbiReset.Caption = "Reset Changes";
			bbiReset.Name = "bbiReset";
			bbiReset.ImageUri.Uri = "Reset";
			this.mainRibbonControl.Items.Add(bbiReset);
						DevExpress.XtraBars.BarButtonItem bbiDelete = new DevExpress.XtraBars.BarButtonItem();
			bbiDelete.Caption = "Delete";
			bbiDelete.Name = "bbiDelete";
			bbiDelete.ImageUri.Uri = "Delete";
			this.mainRibbonControl.Items.Add(bbiDelete);
						DevExpress.XtraBars.BarButtonItem bbiClose = new DevExpress.XtraBars.BarButtonItem();
			bbiClose.Caption = "Close";
			bbiClose.Name = "bbiClose";
			bbiClose.ImageUri.Uri = "Close";
			this.mainRibbonControl.Items.Add(bbiClose);
						DevExpress.XtraBars.BarButtonItem bbiSaveLayout = new DevExpress.XtraBars.BarButtonItem();
			bbiSaveLayout.Caption = "Save Layout";
			bbiSaveLayout.Name = "bbiSaveLayout";
			bbiSaveLayout.ImageUri.Uri = "Save";
			this.mainRibbonControl.Items.Add(bbiSaveLayout);
						DevExpress.XtraBars.BarButtonItem bbiResetLayout = new DevExpress.XtraBars.BarButtonItem();
			bbiResetLayout.Caption = "Reset Layout";
			bbiResetLayout.Name = "bbiResetLayout";
			bbiResetLayout.ImageUri.Uri = "Reset";
			this.mainRibbonControl.Items.Add(bbiResetLayout);
			            // 
            // mainRibbonPage
            // 
            this.mainRibbonPage.Groups.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPageGroup[] {
            this.mainRibbonPageGroup,
            this.ribbonPageGroupLayout});
            this.mainRibbonPage.Name = "mainRibbonPage";
            this.mainRibbonPage.Text = "Home";
			this.mainRibbonPage.MergeOrder = 0;
            // 
            // mainRibbonPageGroup
            // 
            this.mainRibbonPageGroup.AllowTextClipping = false;
						this.mainRibbonPageGroup.ItemLinks.Add(bbiSave);
						this.mainRibbonPageGroup.ItemLinks.Add(bbiSaveAndClose);
						this.mainRibbonPageGroup.ItemLinks.Add(bbiSaveAndNew);
						this.mainRibbonPageGroup.ItemLinks.Add(bbiReset);
						this.mainRibbonPageGroup.ItemLinks.Add(bbiDelete);
						this.mainRibbonPageGroup.ItemLinks.Add(bbiClose);
			            this.mainRibbonPageGroup.Name = "mainRibbonPageGroup";
            this.mainRibbonPageGroup.ShowCaptionButton = false;
            this.mainRibbonPageGroup.Text = "category Tasks";
			// 
            // ribbonPageGroupLayout
            //
			this.ribbonPageGroupLayout.AllowTextClipping = false; 
			this.ribbonPageGroupLayout.ItemLinks.Add(this.bbiCustomize);
						this.ribbonPageGroupLayout.ItemLinks.Add(bbiSaveLayout);
						this.ribbonPageGroupLayout.ItemLinks.Add(bbiResetLayout);
			            this.ribbonPageGroupLayout.Name = "ribbonPageGroupLayout";
            this.ribbonPageGroupLayout.Text = "Layout";
			// 
            // bbiCustomize
            // 
            this.bbiCustomize.Caption = "Customize";
            this.bbiCustomize.ImageUri.Uri = "Customization";
            this.bbiCustomize.Name = "bbiCustomize";
			// 
            // layoutControlGroup1
            // 
            this.layoutControlGroup1.EnableIndentsWithoutBorders = DevExpress.Utils.DefaultBoolean.True;
            this.layoutControlGroup1.GroupBordersVisible = false;
            this.layoutControlGroup1.Name = "Root";
            this.layoutControlGroup1.TextVisible = false;
			// 
            // dataLayoutControl1
            // 
            this.dataLayoutControl1.AllowCustomization = false;
			this.dataLayoutControl1.Dock = System.Windows.Forms.DockStyle.Fill;
			this.dataLayoutControl1.Root = this.layoutControlGroup1;
			this.categoryViewBindingSource = new System.Windows.Forms.BindingSource(this.components);
			this.categoryViewBindingSource.DataSource = typeof(PSS.category);
			this.dataLayoutControl1.DataSource = categoryViewBindingSource;
			//
			//Create GridControls
			//
			DevExpress.XtraDataLayout.RetrieveFieldsParameters parameters = new DevExpress.XtraDataLayout.RetrieveFieldsParameters();
			parameters.DataSourceUpdateMode = System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged;
           				//
			//category1GridControl
			//
			this.category1GridControl.MainView = this.category1GridView;
			this.category1GridControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.category1GridControl.MenuManager = this.mainRibbonControl;
            this.category1GridControl.Name = "category1GridControl";
            this.category1GridControl.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.category1GridView});
			//
			//category1GridView
			//
            this.category1GridView.GridControl = this.category1GridControl;
            this.category1GridView.Name = "category1GridView";
            this.category1GridView.OptionsBehavior.Editable = false;
            this.category1GridView.OptionsBehavior.ReadOnly = true;
			//
			//category1PopulateColumnsParameters
			//
			DevExpress.XtraGrid.Extensions.PopulateColumnsParameters category1PopulateColumnsParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnsParameters();
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters category1category1ChildPopulateColumnParameters_NotVisible = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            category1category1ChildPopulateColumnParameters_NotVisible.FieldName = "category1";
		    category1category1ChildPopulateColumnParameters_NotVisible.ColumnVisible = false;
			category1PopulateColumnsParameters.CustomColumnParameters.Add(category1category1ChildPopulateColumnParameters_NotVisible);
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters category2category1ChildPopulateColumnParameters_NotVisible = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            category2category1ChildPopulateColumnParameters_NotVisible.FieldName = "category2";
		    category2category1ChildPopulateColumnParameters_NotVisible.ColumnVisible = false;
			category1PopulateColumnsParameters.CustomColumnParameters.Add(category2category1ChildPopulateColumnParameters_NotVisible);
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters itemscategory1ChildPopulateColumnParameters_NotVisible = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            itemscategory1ChildPopulateColumnParameters_NotVisible.FieldName = "items";
		    itemscategory1ChildPopulateColumnParameters_NotVisible.ColumnVisible = false;
			category1PopulateColumnsParameters.CustomColumnParameters.Add(itemscategory1ChildPopulateColumnParameters_NotVisible);
							
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters category1category1ChildPopulateColumnParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            category1category1ChildPopulateColumnParameters.FieldName = "category1category1";
            category1category1ChildPopulateColumnParameters.Path = "category1.name";
			category1PopulateColumnsParameters.CustomColumnParameters.Add(category1category1ChildPopulateColumnParameters);
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters category2category1ChildPopulateColumnParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            category2category1ChildPopulateColumnParameters.FieldName = "category2category1";
            category2category1ChildPopulateColumnParameters.Path = "category2.name";
			category1PopulateColumnsParameters.CustomColumnParameters.Add(category2category1ChildPopulateColumnParameters);
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters itemscategory1ChildPopulateColumnParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            itemscategory1ChildPopulateColumnParameters.FieldName = "itemscategory1";
            itemscategory1ChildPopulateColumnParameters.Path = "items.name";
			category1PopulateColumnsParameters.CustomColumnParameters.Add(itemscategory1ChildPopulateColumnParameters);
			 
		    this.category1GridView.PopulateColumns(typeof(PSS.category),category1PopulateColumnsParameters);
			//
			//category1BindingSource
			//
			System.Windows.Forms.BindingSource category1BindingSource = new System.Windows.Forms.BindingSource(this.components);
			category1BindingSource.DataSource = typeof(PSS.category);
            this.category1GridControl.DataSource = category1BindingSource;
			//
			//category1XtraUserControl
			//
            this.category1XtraUserControl.Controls.Add(category1GridControl);
			this.category1XtraUserControl.Name = "category1XtraUserControl";
			this.category1XtraUserControl.MinimumSize = new System.Drawing.Size(100, 100); 
							//
			//category1New
			//
			this.bbicategory1New.Caption = "New";
			this.bbicategory1New.Name = "bbicategory1New";
			this.bbicategory1New.ImageUri.Uri = "New";
			this.bbicategory1New.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.category1BarManager.Items.Add(this.bbicategory1New);
			this.category1Bar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbicategory1New));
			this.category1PopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbicategory1New));
						//
			//category1Edit
			//
			this.bbicategory1Edit.Caption = "Edit";
			this.bbicategory1Edit.Name = "bbicategory1Edit";
			this.bbicategory1Edit.ImageUri.Uri = "Edit";
			this.bbicategory1Edit.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.category1BarManager.Items.Add(this.bbicategory1Edit);
			this.category1Bar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbicategory1Edit));
			this.category1PopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbicategory1Edit));
						//
			//category1Delete
			//
			this.bbicategory1Delete.Caption = "Delete";
			this.bbicategory1Delete.Name = "bbicategory1Delete";
			this.bbicategory1Delete.ImageUri.Uri = "Delete";
			this.bbicategory1Delete.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.category1BarManager.Items.Add(this.bbicategory1Delete);
			this.category1Bar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbicategory1Delete));
			this.category1PopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbicategory1Delete));
						//
			//category1Refresh
			//
			this.bbicategory1Refresh.Caption = "Refresh";
			this.bbicategory1Refresh.Name = "bbicategory1Refresh";
			this.bbicategory1Refresh.ImageUri.Uri = "Refresh";
			this.bbicategory1Refresh.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.category1BarManager.Items.Add(this.bbicategory1Refresh);
			this.category1Bar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbicategory1Refresh));
			this.category1PopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbicategory1Refresh));
						//
			//category1Bar
			//
			this.category1Bar.BarName = "category1";
            this.category1Bar.DockCol = 0;
            this.category1Bar.DockRow = 0;
            this.category1Bar.DockStyle = DevExpress.XtraBars.BarDockStyle.Top;
            this.category1Bar.OptionsBar.AllowQuickCustomization = false;
            this.category1Bar.OptionsBar.DrawDragBorder = false;
            this.category1Bar.Text = "category1";
			//
			//category1BarManager
			//
			this.category1BarManager.AllowCustomization = false;
            this.category1BarManager.Bars.AddRange(new DevExpress.XtraBars.Bar[] {this.category1Bar});
            this.category1BarManager.Form = category1XtraUserControl;
            this.category1BarManager.MainMenu = this.category1Bar;
			// 
            // category1PopUpMenu
            // 
            this.category1PopUpMenu.Manager = this.category1BarManager;
            this.category1PopUpMenu.Name = "category1PopUpMenu";
			//
			//category1RetriveFieldParameters
			//
			DevExpress.XtraDataLayout.RetrieveFieldParameters category1RetriveFieldParameters = new DevExpress.XtraDataLayout.RetrieveFieldParameters();
            category1RetriveFieldParameters.FieldName = "category1";
            category1RetriveFieldParameters.ControlForField = category1XtraUserControl;
			category1RetriveFieldParameters.CreateTabGroupForItem = true;
			parameters.CustomListParameters.Add(category1RetriveFieldParameters);
						//
			//itemsGridControl
			//
			this.itemsGridControl.MainView = this.itemsGridView;
			this.itemsGridControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.itemsGridControl.MenuManager = this.mainRibbonControl;
            this.itemsGridControl.Name = "itemsGridControl";
            this.itemsGridControl.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.itemsGridView});
			//
			//itemsGridView
			//
            this.itemsGridView.GridControl = this.itemsGridControl;
            this.itemsGridView.Name = "itemsGridView";
            this.itemsGridView.OptionsBehavior.Editable = false;
            this.itemsGridView.OptionsBehavior.ReadOnly = true;
			//
			//itemsPopulateColumnsParameters
			//
			DevExpress.XtraGrid.Extensions.PopulateColumnsParameters itemsPopulateColumnsParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnsParameters();
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters categoryitemsChildPopulateColumnParameters_NotVisible = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            categoryitemsChildPopulateColumnParameters_NotVisible.FieldName = "category";
		    categoryitemsChildPopulateColumnParameters_NotVisible.ColumnVisible = false;
			itemsPopulateColumnsParameters.CustomColumnParameters.Add(categoryitemsChildPopulateColumnParameters_NotVisible);
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters supplieritemsChildPopulateColumnParameters_NotVisible = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            supplieritemsChildPopulateColumnParameters_NotVisible.FieldName = "supplier";
		    supplieritemsChildPopulateColumnParameters_NotVisible.ColumnVisible = false;
			itemsPopulateColumnsParameters.CustomColumnParameters.Add(supplieritemsChildPopulateColumnParameters_NotVisible);
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters order_productitemsChildPopulateColumnParameters_NotVisible = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            order_productitemsChildPopulateColumnParameters_NotVisible.FieldName = "order_product";
		    order_productitemsChildPopulateColumnParameters_NotVisible.ColumnVisible = false;
			itemsPopulateColumnsParameters.CustomColumnParameters.Add(order_productitemsChildPopulateColumnParameters_NotVisible);
							
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters category1itemsChildPopulateColumnParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            category1itemsChildPopulateColumnParameters.FieldName = "category1items";
            category1itemsChildPopulateColumnParameters.Path = "category1.name";
			itemsPopulateColumnsParameters.CustomColumnParameters.Add(category1itemsChildPopulateColumnParameters);
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters category2itemsChildPopulateColumnParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            category2itemsChildPopulateColumnParameters.FieldName = "category2items";
            category2itemsChildPopulateColumnParameters.Path = "category2.name";
			itemsPopulateColumnsParameters.CustomColumnParameters.Add(category2itemsChildPopulateColumnParameters);
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters itemsitemsChildPopulateColumnParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            itemsitemsChildPopulateColumnParameters.FieldName = "itemsitems";
            itemsitemsChildPopulateColumnParameters.Path = "items.name";
			itemsPopulateColumnsParameters.CustomColumnParameters.Add(itemsitemsChildPopulateColumnParameters);
			 
		    this.itemsGridView.PopulateColumns(typeof(PSS.item),itemsPopulateColumnsParameters);
			//
			//itemsBindingSource
			//
			System.Windows.Forms.BindingSource itemsBindingSource = new System.Windows.Forms.BindingSource(this.components);
			itemsBindingSource.DataSource = typeof(PSS.item);
            this.itemsGridControl.DataSource = itemsBindingSource;
			//
			//itemsXtraUserControl
			//
            this.itemsXtraUserControl.Controls.Add(itemsGridControl);
			this.itemsXtraUserControl.Name = "itemsXtraUserControl";
			this.itemsXtraUserControl.MinimumSize = new System.Drawing.Size(100, 100); 
							//
			//itemsNew
			//
			this.bbiitemsNew.Caption = "New";
			this.bbiitemsNew.Name = "bbiitemsNew";
			this.bbiitemsNew.ImageUri.Uri = "New";
			this.bbiitemsNew.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.itemsBarManager.Items.Add(this.bbiitemsNew);
			this.itemsBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiitemsNew));
			this.itemsPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiitemsNew));
						//
			//itemsEdit
			//
			this.bbiitemsEdit.Caption = "Edit";
			this.bbiitemsEdit.Name = "bbiitemsEdit";
			this.bbiitemsEdit.ImageUri.Uri = "Edit";
			this.bbiitemsEdit.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.itemsBarManager.Items.Add(this.bbiitemsEdit);
			this.itemsBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiitemsEdit));
			this.itemsPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiitemsEdit));
						//
			//itemsDelete
			//
			this.bbiitemsDelete.Caption = "Delete";
			this.bbiitemsDelete.Name = "bbiitemsDelete";
			this.bbiitemsDelete.ImageUri.Uri = "Delete";
			this.bbiitemsDelete.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.itemsBarManager.Items.Add(this.bbiitemsDelete);
			this.itemsBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiitemsDelete));
			this.itemsPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiitemsDelete));
						//
			//itemsRefresh
			//
			this.bbiitemsRefresh.Caption = "Refresh";
			this.bbiitemsRefresh.Name = "bbiitemsRefresh";
			this.bbiitemsRefresh.ImageUri.Uri = "Refresh";
			this.bbiitemsRefresh.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.itemsBarManager.Items.Add(this.bbiitemsRefresh);
			this.itemsBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiitemsRefresh));
			this.itemsPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiitemsRefresh));
						//
			//itemsBar
			//
			this.itemsBar.BarName = "items";
            this.itemsBar.DockCol = 0;
            this.itemsBar.DockRow = 0;
            this.itemsBar.DockStyle = DevExpress.XtraBars.BarDockStyle.Top;
            this.itemsBar.OptionsBar.AllowQuickCustomization = false;
            this.itemsBar.OptionsBar.DrawDragBorder = false;
            this.itemsBar.Text = "items";
			//
			//itemsBarManager
			//
			this.itemsBarManager.AllowCustomization = false;
            this.itemsBarManager.Bars.AddRange(new DevExpress.XtraBars.Bar[] {this.itemsBar});
            this.itemsBarManager.Form = itemsXtraUserControl;
            this.itemsBarManager.MainMenu = this.itemsBar;
			// 
            // itemsPopUpMenu
            // 
            this.itemsPopUpMenu.Manager = this.itemsBarManager;
            this.itemsPopUpMenu.Name = "itemsPopUpMenu";
			//
			//itemsRetriveFieldParameters
			//
			DevExpress.XtraDataLayout.RetrieveFieldParameters itemsRetriveFieldParameters = new DevExpress.XtraDataLayout.RetrieveFieldParameters();
            itemsRetriveFieldParameters.FieldName = "items";
            itemsRetriveFieldParameters.ControlForField = itemsXtraUserControl;
			itemsRetriveFieldParameters.CreateTabGroupForItem = true;
			parameters.CustomListParameters.Add(itemsRetriveFieldParameters);
									//
			//category2LookUpEdit
			//
			this.category2BindingSource.DataSource = typeof(PSS.category);
			this.category2LookUpEdit.Properties.ValueMember = "id"; 
			this.category2LookUpEdit.Properties.DisplayMember = "name";
			this.category2LookUpEdit.Properties.DataSource = this.category2BindingSource;
			this.category2LookUpEdit.Name = "category2LookUpEdit";
			this.category2LookUpEdit.DataBindings.Add("EditValue", categoryViewBindingSource, "parent_id", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged);
			DevExpress.XtraDataLayout.RetrieveFieldParameters category2LookUpEditRetrieveFieldParameters = new DevExpress.XtraDataLayout.RetrieveFieldParameters();
            category2LookUpEditRetrieveFieldParameters.FieldName = "parent_id";
            category2LookUpEditRetrieveFieldParameters.ControlForField = this.category2LookUpEdit;
			parameters.CustomListParameters.Add(category2LookUpEditRetrieveFieldParameters);
			DevExpress.XtraDataLayout.RetrieveFieldParameters category2LookUpEditRetrieveFieldParameters_NotGenerate = new DevExpress.XtraDataLayout.RetrieveFieldParameters();
		    category2LookUpEditRetrieveFieldParameters_NotGenerate.FieldName = "category2";
		    category2LookUpEditRetrieveFieldParameters_NotGenerate.GenerateField = false;
			parameters.CustomListParameters.Add(category2LookUpEditRetrieveFieldParameters_NotGenerate);
			 
			//
			//call RetrieveFields
			//
            this.dataLayoutControl1.RetrieveFields(parameters);
			// 
            // mvvmContext
            // 
            this.mvvmContext.ContainerControl = this;
            this.mvvmContext.ViewModelType = typeof(PSS.ViewModels.categoryViewModel);
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS.ViewModels.categoryViewModel), "Save", bbiSave));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS.ViewModels.categoryViewModel), "SaveAndClose", bbiSaveAndClose));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS.ViewModels.categoryViewModel), "SaveAndNew", bbiSaveAndNew));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS.ViewModels.categoryViewModel), "Reset", bbiReset));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS.ViewModels.categoryViewModel), "Delete", bbiDelete));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS.ViewModels.categoryViewModel), "Close", bbiClose));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS.ViewModels.categoryViewModel), "SaveLayout", bbiSaveLayout));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS.ViewModels.categoryViewModel), "ResetLayout", bbiResetLayout));
						this.mvvmContext.RegistrationExpressions.AddRange(new DevExpress.Utils.MVVM.RegistrationExpression[] {
            DevExpress.Utils.MVVM.RegistrationExpression.RegisterLayoutSerializationService(null, false, DevExpress.Utils.DefaultBoolean.True, this.dataLayoutControl1)});
			//
			//categoryView
			//
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.Controls.Add(this.dataLayoutControl1);
			this.Controls.Add(this.mainRibbonControl);
			this.Size = new System.Drawing.Size(1024, 768);
            this.Name = "categoryView";
						((System.ComponentModel.ISupportInitialize)(this.category1BarManager)).EndInit();
						((System.ComponentModel.ISupportInitialize)(this.itemsBarManager)).EndInit();
						this.ResumeLayout(false);
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
		private System.Windows.Forms.BindingSource categoryViewBindingSource;
				private DevExpress.XtraGrid.GridControl category1GridControl;
		private DevExpress.XtraGrid.Views.Grid.GridView category1GridView;
		private DevExpress.XtraBars.BarManager category1BarManager;
		private DevExpress.XtraBars.Bar category1Bar;
		private DevExpress.XtraEditors.XtraUserControl category1XtraUserControl;
		private DevExpress.XtraBars.PopupMenu category1PopUpMenu;
				private DevExpress.XtraBars.BarButtonItem bbicategory1New;
				private DevExpress.XtraBars.BarButtonItem bbicategory1Edit;
				private DevExpress.XtraBars.BarButtonItem bbicategory1Delete;
				private DevExpress.XtraBars.BarButtonItem bbicategory1Refresh;
						private DevExpress.XtraGrid.GridControl itemsGridControl;
		private DevExpress.XtraGrid.Views.Grid.GridView itemsGridView;
		private DevExpress.XtraBars.BarManager itemsBarManager;
		private DevExpress.XtraBars.Bar itemsBar;
		private DevExpress.XtraEditors.XtraUserControl itemsXtraUserControl;
		private DevExpress.XtraBars.PopupMenu itemsPopUpMenu;
				private DevExpress.XtraBars.BarButtonItem bbiitemsNew;
				private DevExpress.XtraBars.BarButtonItem bbiitemsEdit;
				private DevExpress.XtraBars.BarButtonItem bbiitemsDelete;
				private DevExpress.XtraBars.BarButtonItem bbiitemsRefresh;
								private DevExpress.XtraEditors.GridLookUpEdit category2LookUpEdit;
		private System.Windows.Forms.BindingSource category2BindingSource;
		 
	}
}
