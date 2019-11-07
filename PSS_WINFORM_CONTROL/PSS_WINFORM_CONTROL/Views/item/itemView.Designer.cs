namespace PSS_WINFORM_CONTROL.Views.itemView {
    partial class itemView {
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
						this.order_productGridControl = new DevExpress.XtraGrid.GridControl();
			this.order_productGridView = new DevExpress.XtraGrid.Views.Grid.GridView();
			this.order_productBarManager = new DevExpress.XtraBars.BarManager();
			this.order_productBar = new DevExpress.XtraBars.Bar();
			this.order_productXtraUserControl = new DevExpress.XtraEditors.XtraUserControl();
			this.order_productPopUpMenu = new DevExpress.XtraBars.PopupMenu(this.components);
						this.bbiorder_productNew = new DevExpress.XtraBars.BarButtonItem();
						this.bbiorder_productEdit = new DevExpress.XtraBars.BarButtonItem();
						this.bbiorder_productDelete = new DevExpress.XtraBars.BarButtonItem();
						this.bbiorder_productRefresh = new DevExpress.XtraBars.BarButtonItem();
						((System.ComponentModel.ISupportInitialize)(this.order_productBarManager)).BeginInit();
									this.categoryLookUpEdit = new DevExpress.XtraEditors.GridLookUpEdit();
			this.categoryBindingSource = new System.Windows.Forms.BindingSource(this.components);
						this.supplierLookUpEdit = new DevExpress.XtraEditors.GridLookUpEdit();
			this.supplierBindingSource = new System.Windows.Forms.BindingSource(this.components);
			 
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
            this.mainRibbonPageGroup.Text = "item Tasks";
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
			this.itemViewBindingSource = new System.Windows.Forms.BindingSource(this.components);
			this.itemViewBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.item);
			this.dataLayoutControl1.DataSource = itemViewBindingSource;
			//
			//Create GridControls
			//
			DevExpress.XtraDataLayout.RetrieveFieldsParameters parameters = new DevExpress.XtraDataLayout.RetrieveFieldsParameters();
			parameters.DataSourceUpdateMode = System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged;
           				//
			//order_productGridControl
			//
			this.order_productGridControl.MainView = this.order_productGridView;
			this.order_productGridControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.order_productGridControl.MenuManager = this.mainRibbonControl;
            this.order_productGridControl.Name = "order_productGridControl";
            this.order_productGridControl.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.order_productGridView});
			//
			//order_productGridView
			//
            this.order_productGridView.GridControl = this.order_productGridControl;
            this.order_productGridView.Name = "order_productGridView";
            this.order_productGridView.OptionsBehavior.Editable = false;
            this.order_productGridView.OptionsBehavior.ReadOnly = true;
			//
			//order_productPopulateColumnsParameters
			//
			DevExpress.XtraGrid.Extensions.PopulateColumnsParameters order_productPopulateColumnsParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnsParameters();
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters itemorder_productChildPopulateColumnParameters_NotVisible = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            itemorder_productChildPopulateColumnParameters_NotVisible.FieldName = "item";
		    itemorder_productChildPopulateColumnParameters_NotVisible.ColumnVisible = false;
			order_productPopulateColumnsParameters.CustomColumnParameters.Add(itemorder_productChildPopulateColumnParameters_NotVisible);
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters orderorder_productChildPopulateColumnParameters_NotVisible = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            orderorder_productChildPopulateColumnParameters_NotVisible.FieldName = "order";
		    orderorder_productChildPopulateColumnParameters_NotVisible.ColumnVisible = false;
			order_productPopulateColumnsParameters.CustomColumnParameters.Add(orderorder_productChildPopulateColumnParameters_NotVisible);
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters petorder_productChildPopulateColumnParameters_NotVisible = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            petorder_productChildPopulateColumnParameters_NotVisible.FieldName = "pet";
		    petorder_productChildPopulateColumnParameters_NotVisible.ColumnVisible = false;
			order_productPopulateColumnsParameters.CustomColumnParameters.Add(petorder_productChildPopulateColumnParameters_NotVisible);
							
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters categoryorder_productChildPopulateColumnParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            categoryorder_productChildPopulateColumnParameters.FieldName = "categoryorder_product";
            categoryorder_productChildPopulateColumnParameters.Path = "category.name";
			order_productPopulateColumnsParameters.CustomColumnParameters.Add(categoryorder_productChildPopulateColumnParameters);
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters supplierorder_productChildPopulateColumnParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            supplierorder_productChildPopulateColumnParameters.FieldName = "supplierorder_product";
            supplierorder_productChildPopulateColumnParameters.Path = "supplier.name";
			order_productPopulateColumnsParameters.CustomColumnParameters.Add(supplierorder_productChildPopulateColumnParameters);
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters order_productorder_productChildPopulateColumnParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            order_productorder_productChildPopulateColumnParameters.FieldName = "order_productorder_product";
            order_productorder_productChildPopulateColumnParameters.Path = "order_product.id";
			order_productPopulateColumnsParameters.CustomColumnParameters.Add(order_productorder_productChildPopulateColumnParameters);
			 
		    this.order_productGridView.PopulateColumns(typeof(PSS_WINFORM_CONTROL.order_product),order_productPopulateColumnsParameters);
			//
			//order_productBindingSource
			//
			System.Windows.Forms.BindingSource order_productBindingSource = new System.Windows.Forms.BindingSource(this.components);
			order_productBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.order_product);
            this.order_productGridControl.DataSource = order_productBindingSource;
			//
			//order_productXtraUserControl
			//
            this.order_productXtraUserControl.Controls.Add(order_productGridControl);
			this.order_productXtraUserControl.Name = "order_productXtraUserControl";
			this.order_productXtraUserControl.MinimumSize = new System.Drawing.Size(100, 100); 
							//
			//order_productNew
			//
			this.bbiorder_productNew.Caption = "New";
			this.bbiorder_productNew.Name = "bbiorder_productNew";
			this.bbiorder_productNew.ImageUri.Uri = "New";
			this.bbiorder_productNew.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.order_productBarManager.Items.Add(this.bbiorder_productNew);
			this.order_productBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_productNew));
			this.order_productPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_productNew));
						//
			//order_productEdit
			//
			this.bbiorder_productEdit.Caption = "Edit";
			this.bbiorder_productEdit.Name = "bbiorder_productEdit";
			this.bbiorder_productEdit.ImageUri.Uri = "Edit";
			this.bbiorder_productEdit.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.order_productBarManager.Items.Add(this.bbiorder_productEdit);
			this.order_productBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_productEdit));
			this.order_productPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_productEdit));
						//
			//order_productDelete
			//
			this.bbiorder_productDelete.Caption = "Delete";
			this.bbiorder_productDelete.Name = "bbiorder_productDelete";
			this.bbiorder_productDelete.ImageUri.Uri = "Delete";
			this.bbiorder_productDelete.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.order_productBarManager.Items.Add(this.bbiorder_productDelete);
			this.order_productBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_productDelete));
			this.order_productPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_productDelete));
						//
			//order_productRefresh
			//
			this.bbiorder_productRefresh.Caption = "Refresh";
			this.bbiorder_productRefresh.Name = "bbiorder_productRefresh";
			this.bbiorder_productRefresh.ImageUri.Uri = "Refresh";
			this.bbiorder_productRefresh.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.order_productBarManager.Items.Add(this.bbiorder_productRefresh);
			this.order_productBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_productRefresh));
			this.order_productPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_productRefresh));
						//
			//order_productBar
			//
			this.order_productBar.BarName = "order_product";
            this.order_productBar.DockCol = 0;
            this.order_productBar.DockRow = 0;
            this.order_productBar.DockStyle = DevExpress.XtraBars.BarDockStyle.Top;
            this.order_productBar.OptionsBar.AllowQuickCustomization = false;
            this.order_productBar.OptionsBar.DrawDragBorder = false;
            this.order_productBar.Text = "order_product";
			//
			//order_productBarManager
			//
			this.order_productBarManager.AllowCustomization = false;
            this.order_productBarManager.Bars.AddRange(new DevExpress.XtraBars.Bar[] {this.order_productBar});
            this.order_productBarManager.Form = order_productXtraUserControl;
            this.order_productBarManager.MainMenu = this.order_productBar;
			// 
            // order_productPopUpMenu
            // 
            this.order_productPopUpMenu.Manager = this.order_productBarManager;
            this.order_productPopUpMenu.Name = "order_productPopUpMenu";
			//
			//order_productRetriveFieldParameters
			//
			DevExpress.XtraDataLayout.RetrieveFieldParameters order_productRetriveFieldParameters = new DevExpress.XtraDataLayout.RetrieveFieldParameters();
            order_productRetriveFieldParameters.FieldName = "order_product";
            order_productRetriveFieldParameters.ControlForField = order_productXtraUserControl;
			order_productRetriveFieldParameters.CreateTabGroupForItem = true;
			parameters.CustomListParameters.Add(order_productRetriveFieldParameters);
									//
			//categoryLookUpEdit
			//
			this.categoryBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.category);
			this.categoryLookUpEdit.Properties.ValueMember = "id"; 
			this.categoryLookUpEdit.Properties.DisplayMember = "name";
			this.categoryLookUpEdit.Properties.DataSource = this.categoryBindingSource;
			this.categoryLookUpEdit.Name = "categoryLookUpEdit";
			this.categoryLookUpEdit.DataBindings.Add("EditValue", itemViewBindingSource, "category_id", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged);
			DevExpress.XtraDataLayout.RetrieveFieldParameters categoryLookUpEditRetrieveFieldParameters = new DevExpress.XtraDataLayout.RetrieveFieldParameters();
            categoryLookUpEditRetrieveFieldParameters.FieldName = "category_id";
            categoryLookUpEditRetrieveFieldParameters.ControlForField = this.categoryLookUpEdit;
			parameters.CustomListParameters.Add(categoryLookUpEditRetrieveFieldParameters);
			DevExpress.XtraDataLayout.RetrieveFieldParameters categoryLookUpEditRetrieveFieldParameters_NotGenerate = new DevExpress.XtraDataLayout.RetrieveFieldParameters();
		    categoryLookUpEditRetrieveFieldParameters_NotGenerate.FieldName = "category";
		    categoryLookUpEditRetrieveFieldParameters_NotGenerate.GenerateField = false;
			parameters.CustomListParameters.Add(categoryLookUpEditRetrieveFieldParameters_NotGenerate);
						//
			//supplierLookUpEdit
			//
			this.supplierBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.supplier);
			this.supplierLookUpEdit.Properties.ValueMember = "id"; 
			this.supplierLookUpEdit.Properties.DisplayMember = "name";
			this.supplierLookUpEdit.Properties.DataSource = this.supplierBindingSource;
			this.supplierLookUpEdit.Name = "supplierLookUpEdit";
			this.supplierLookUpEdit.DataBindings.Add("EditValue", itemViewBindingSource, "supplier_id", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged);
			DevExpress.XtraDataLayout.RetrieveFieldParameters supplierLookUpEditRetrieveFieldParameters = new DevExpress.XtraDataLayout.RetrieveFieldParameters();
            supplierLookUpEditRetrieveFieldParameters.FieldName = "supplier_id";
            supplierLookUpEditRetrieveFieldParameters.ControlForField = this.supplierLookUpEdit;
			parameters.CustomListParameters.Add(supplierLookUpEditRetrieveFieldParameters);
			DevExpress.XtraDataLayout.RetrieveFieldParameters supplierLookUpEditRetrieveFieldParameters_NotGenerate = new DevExpress.XtraDataLayout.RetrieveFieldParameters();
		    supplierLookUpEditRetrieveFieldParameters_NotGenerate.FieldName = "supplier";
		    supplierLookUpEditRetrieveFieldParameters_NotGenerate.GenerateField = false;
			parameters.CustomListParameters.Add(supplierLookUpEditRetrieveFieldParameters_NotGenerate);
			 
			//
			//call RetrieveFields
			//
            this.dataLayoutControl1.RetrieveFields(parameters);
			// 
            // mvvmContext
            // 
            this.mvvmContext.ContainerControl = this;
            this.mvvmContext.ViewModelType = typeof(PSS_WINFORM_CONTROL.ViewModels.itemViewModel);
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.itemViewModel), "Save", bbiSave));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.itemViewModel), "SaveAndClose", bbiSaveAndClose));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.itemViewModel), "SaveAndNew", bbiSaveAndNew));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.itemViewModel), "Reset", bbiReset));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.itemViewModel), "Delete", bbiDelete));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.itemViewModel), "Close", bbiClose));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.itemViewModel), "SaveLayout", bbiSaveLayout));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.itemViewModel), "ResetLayout", bbiResetLayout));
						this.mvvmContext.RegistrationExpressions.AddRange(new DevExpress.Utils.MVVM.RegistrationExpression[] {
            DevExpress.Utils.MVVM.RegistrationExpression.RegisterLayoutSerializationService(null, false, DevExpress.Utils.DefaultBoolean.True, this.dataLayoutControl1)});
			//
			//itemView
			//
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.Controls.Add(this.dataLayoutControl1);
			this.Controls.Add(this.mainRibbonControl);
			this.Size = new System.Drawing.Size(1024, 768);
            this.Name = "itemView";
						((System.ComponentModel.ISupportInitialize)(this.order_productBarManager)).EndInit();
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
		private System.Windows.Forms.BindingSource itemViewBindingSource;
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
								private DevExpress.XtraEditors.GridLookUpEdit categoryLookUpEdit;
		private System.Windows.Forms.BindingSource categoryBindingSource;
				private DevExpress.XtraEditors.GridLookUpEdit supplierLookUpEdit;
		private System.Windows.Forms.BindingSource supplierBindingSource;
		 
	}
}
