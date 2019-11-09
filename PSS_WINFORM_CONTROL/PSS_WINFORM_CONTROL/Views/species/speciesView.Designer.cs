namespace PSS_WINFORM_CONTROL.Views.speciesView {
    partial class speciesView {
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
						this.petsGridControl = new DevExpress.XtraGrid.GridControl();
			this.petsGridView = new DevExpress.XtraGrid.Views.Grid.GridView();
			this.petsBarManager = new DevExpress.XtraBars.BarManager();
			this.petsBar = new DevExpress.XtraBars.Bar();
			this.petsXtraUserControl = new DevExpress.XtraEditors.XtraUserControl();
			this.petsPopUpMenu = new DevExpress.XtraBars.PopupMenu(this.components);
						this.bbipetsNew = new DevExpress.XtraBars.BarButtonItem();
						this.bbipetsEdit = new DevExpress.XtraBars.BarButtonItem();
						this.bbipetsDelete = new DevExpress.XtraBars.BarButtonItem();
						this.bbipetsRefresh = new DevExpress.XtraBars.BarButtonItem();
						((System.ComponentModel.ISupportInitialize)(this.petsBarManager)).BeginInit();
						 
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
            this.mainRibbonPageGroup.Text = "species Tasks";
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
			this.speciesViewBindingSource = new System.Windows.Forms.BindingSource(this.components);
			this.speciesViewBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.species);
			this.dataLayoutControl1.DataSource = speciesViewBindingSource;
			//
			//Create GridControls
			//
			DevExpress.XtraDataLayout.RetrieveFieldsParameters parameters = new DevExpress.XtraDataLayout.RetrieveFieldsParameters();
			parameters.DataSourceUpdateMode = System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged;
           				//
			//petsGridControl
			//
			this.petsGridControl.MainView = this.petsGridView;
			this.petsGridControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.petsGridControl.MenuManager = this.mainRibbonControl;
            this.petsGridControl.Name = "petsGridControl";
            this.petsGridControl.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.petsGridView});
			//
			//petsGridView
			//
            this.petsGridView.GridControl = this.petsGridControl;
            this.petsGridView.Name = "petsGridView";
            this.petsGridView.OptionsBehavior.Editable = false;
            this.petsGridView.OptionsBehavior.ReadOnly = true;
			//
			//petsPopulateColumnsParameters
			//
			DevExpress.XtraGrid.Extensions.PopulateColumnsParameters petsPopulateColumnsParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnsParameters();
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters order_productpetsChildPopulateColumnParameters_NotVisible = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            order_productpetsChildPopulateColumnParameters_NotVisible.FieldName = "order_product";
		    order_productpetsChildPopulateColumnParameters_NotVisible.ColumnVisible = false;
			petsPopulateColumnsParameters.CustomColumnParameters.Add(order_productpetsChildPopulateColumnParameters_NotVisible);
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters speciespetsChildPopulateColumnParameters_NotVisible = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            speciespetsChildPopulateColumnParameters_NotVisible.FieldName = "species";
		    speciespetsChildPopulateColumnParameters_NotVisible.ColumnVisible = false;
			petsPopulateColumnsParameters.CustomColumnParameters.Add(speciespetsChildPopulateColumnParameters_NotVisible);
							
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters petspetsChildPopulateColumnParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            petspetsChildPopulateColumnParameters.FieldName = "petspets";
            petspetsChildPopulateColumnParameters.Path = "pets.name";
			petsPopulateColumnsParameters.CustomColumnParameters.Add(petspetsChildPopulateColumnParameters);
			 
		    this.petsGridView.PopulateColumns(typeof(PSS_WINFORM_CONTROL.pet),petsPopulateColumnsParameters);
			//
			//petsBindingSource
			//
			System.Windows.Forms.BindingSource petsBindingSource = new System.Windows.Forms.BindingSource(this.components);
			petsBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.pet);
            this.petsGridControl.DataSource = petsBindingSource;
			//
			//petsXtraUserControl
			//
            this.petsXtraUserControl.Controls.Add(petsGridControl);
			this.petsXtraUserControl.Name = "petsXtraUserControl";
			this.petsXtraUserControl.MinimumSize = new System.Drawing.Size(100, 100); 
							//
			//petsNew
			//
			this.bbipetsNew.Caption = "New";
			this.bbipetsNew.Name = "bbipetsNew";
			this.bbipetsNew.ImageUri.Uri = "New";
			this.bbipetsNew.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.petsBarManager.Items.Add(this.bbipetsNew);
			this.petsBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbipetsNew));
			this.petsPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbipetsNew));
						//
			//petsEdit
			//
			this.bbipetsEdit.Caption = "Edit";
			this.bbipetsEdit.Name = "bbipetsEdit";
			this.bbipetsEdit.ImageUri.Uri = "Edit";
			this.bbipetsEdit.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.petsBarManager.Items.Add(this.bbipetsEdit);
			this.petsBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbipetsEdit));
			this.petsPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbipetsEdit));
						//
			//petsDelete
			//
			this.bbipetsDelete.Caption = "Delete";
			this.bbipetsDelete.Name = "bbipetsDelete";
			this.bbipetsDelete.ImageUri.Uri = "Delete";
			this.bbipetsDelete.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.petsBarManager.Items.Add(this.bbipetsDelete);
			this.petsBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbipetsDelete));
			this.petsPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbipetsDelete));
						//
			//petsRefresh
			//
			this.bbipetsRefresh.Caption = "Refresh";
			this.bbipetsRefresh.Name = "bbipetsRefresh";
			this.bbipetsRefresh.ImageUri.Uri = "Refresh";
			this.bbipetsRefresh.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.petsBarManager.Items.Add(this.bbipetsRefresh);
			this.petsBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbipetsRefresh));
			this.petsPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbipetsRefresh));
						//
			//petsBar
			//
			this.petsBar.BarName = "pets";
            this.petsBar.DockCol = 0;
            this.petsBar.DockRow = 0;
            this.petsBar.DockStyle = DevExpress.XtraBars.BarDockStyle.Top;
            this.petsBar.OptionsBar.AllowQuickCustomization = false;
            this.petsBar.OptionsBar.DrawDragBorder = false;
            this.petsBar.Text = "pets";
			//
			//petsBarManager
			//
			this.petsBarManager.AllowCustomization = false;
            this.petsBarManager.Bars.AddRange(new DevExpress.XtraBars.Bar[] {this.petsBar});
            this.petsBarManager.Form = petsXtraUserControl;
            this.petsBarManager.MainMenu = this.petsBar;
			// 
            // petsPopUpMenu
            // 
            this.petsPopUpMenu.Manager = this.petsBarManager;
            this.petsPopUpMenu.Name = "petsPopUpMenu";
			//
			//petsRetriveFieldParameters
			//
			DevExpress.XtraDataLayout.RetrieveFieldParameters petsRetriveFieldParameters = new DevExpress.XtraDataLayout.RetrieveFieldParameters();
            petsRetriveFieldParameters.FieldName = "pets";
            petsRetriveFieldParameters.ControlForField = petsXtraUserControl;
			petsRetriveFieldParameters.CreateTabGroupForItem = true;
			parameters.CustomListParameters.Add(petsRetriveFieldParameters);
						 
			//
			//call RetrieveFields
			//
            this.dataLayoutControl1.RetrieveFields(parameters);
			// 
            // mvvmContext
            // 
            this.mvvmContext.ContainerControl = this;
            this.mvvmContext.ViewModelType = typeof(PSS_WINFORM_CONTROL.ViewModels.speciesViewModel);
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.speciesViewModel), "Save", bbiSave));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.speciesViewModel), "SaveAndClose", bbiSaveAndClose));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.speciesViewModel), "SaveAndNew", bbiSaveAndNew));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.speciesViewModel), "Reset", bbiReset));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.speciesViewModel), "Delete", bbiDelete));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.speciesViewModel), "Close", bbiClose));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.speciesViewModel), "SaveLayout", bbiSaveLayout));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.speciesViewModel), "ResetLayout", bbiResetLayout));
						this.mvvmContext.RegistrationExpressions.AddRange(new DevExpress.Utils.MVVM.RegistrationExpression[] {
            DevExpress.Utils.MVVM.RegistrationExpression.RegisterLayoutSerializationService(null, false, DevExpress.Utils.DefaultBoolean.True, this.dataLayoutControl1)});
			//
			//speciesView
			//
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.Controls.Add(this.dataLayoutControl1);
			this.Controls.Add(this.mainRibbonControl);
			this.Size = new System.Drawing.Size(1024, 768);
            this.Name = "speciesView";
						((System.ComponentModel.ISupportInitialize)(this.petsBarManager)).EndInit();
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
		private System.Windows.Forms.BindingSource speciesViewBindingSource;
				private DevExpress.XtraGrid.GridControl petsGridControl;
		private DevExpress.XtraGrid.Views.Grid.GridView petsGridView;
		private DevExpress.XtraBars.BarManager petsBarManager;
		private DevExpress.XtraBars.Bar petsBar;
		private DevExpress.XtraEditors.XtraUserControl petsXtraUserControl;
		private DevExpress.XtraBars.PopupMenu petsPopUpMenu;
				private DevExpress.XtraBars.BarButtonItem bbipetsNew;
				private DevExpress.XtraBars.BarButtonItem bbipetsEdit;
				private DevExpress.XtraBars.BarButtonItem bbipetsDelete;
				private DevExpress.XtraBars.BarButtonItem bbipetsRefresh;
						 
	}
}
