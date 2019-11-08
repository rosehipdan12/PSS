namespace PSS_WINFORM_CONTROL.Views.roleView {
    partial class roleView {
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
						this.usersGridControl = new DevExpress.XtraGrid.GridControl();
			this.usersGridView = new DevExpress.XtraGrid.Views.Grid.GridView();
			this.usersBarManager = new DevExpress.XtraBars.BarManager();
			this.usersBar = new DevExpress.XtraBars.Bar();
			this.usersXtraUserControl = new DevExpress.XtraEditors.XtraUserControl();
			this.usersPopUpMenu = new DevExpress.XtraBars.PopupMenu(this.components);
						this.bbiusersNew = new DevExpress.XtraBars.BarButtonItem();
						this.bbiusersEdit = new DevExpress.XtraBars.BarButtonItem();
						this.bbiusersDelete = new DevExpress.XtraBars.BarButtonItem();
						this.bbiusersRefresh = new DevExpress.XtraBars.BarButtonItem();
						((System.ComponentModel.ISupportInitialize)(this.usersBarManager)).BeginInit();
						 
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
            this.mainRibbonPageGroup.Text = "role Tasks";
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
			this.roleViewBindingSource = new System.Windows.Forms.BindingSource(this.components);
			this.roleViewBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.role);
			this.dataLayoutControl1.DataSource = roleViewBindingSource;
			//
			//Create GridControls
			//
			DevExpress.XtraDataLayout.RetrieveFieldsParameters parameters = new DevExpress.XtraDataLayout.RetrieveFieldsParameters();
			parameters.DataSourceUpdateMode = System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged;
           				//
			//usersGridControl
			//
			this.usersGridControl.MainView = this.usersGridView;
			this.usersGridControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.usersGridControl.MenuManager = this.mainRibbonControl;
            this.usersGridControl.Name = "usersGridControl";
            this.usersGridControl.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.usersGridView});
			//
			//usersGridView
			//
            this.usersGridView.GridControl = this.usersGridControl;
            this.usersGridView.Name = "usersGridView";
            this.usersGridView.OptionsBehavior.Editable = false;
            this.usersGridView.OptionsBehavior.ReadOnly = true;
			//
			//usersPopulateColumnsParameters
			//
			DevExpress.XtraGrid.Extensions.PopulateColumnsParameters usersPopulateColumnsParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnsParameters();
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters roleusersChildPopulateColumnParameters_NotVisible = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            roleusersChildPopulateColumnParameters_NotVisible.FieldName = "role";
		    roleusersChildPopulateColumnParameters_NotVisible.ColumnVisible = false;
			usersPopulateColumnsParameters.CustomColumnParameters.Add(roleusersChildPopulateColumnParameters_NotVisible);
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters order_userusersChildPopulateColumnParameters_NotVisible = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            order_userusersChildPopulateColumnParameters_NotVisible.FieldName = "order_user";
		    order_userusersChildPopulateColumnParameters_NotVisible.ColumnVisible = false;
			usersPopulateColumnsParameters.CustomColumnParameters.Add(order_userusersChildPopulateColumnParameters_NotVisible);
							
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters usersusersChildPopulateColumnParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            usersusersChildPopulateColumnParameters.FieldName = "usersusers";
            usersusersChildPopulateColumnParameters.Path = "users.first_name";
			usersPopulateColumnsParameters.CustomColumnParameters.Add(usersusersChildPopulateColumnParameters);
			 
		    this.usersGridView.PopulateColumns(typeof(PSS_WINFORM_CONTROL.user),usersPopulateColumnsParameters);
			//
			//usersBindingSource
			//
			System.Windows.Forms.BindingSource usersBindingSource = new System.Windows.Forms.BindingSource(this.components);
			usersBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.user);
            this.usersGridControl.DataSource = usersBindingSource;
			//
			//usersXtraUserControl
			//
            this.usersXtraUserControl.Controls.Add(usersGridControl);
			this.usersXtraUserControl.Name = "usersXtraUserControl";
			this.usersXtraUserControl.MinimumSize = new System.Drawing.Size(100, 100); 
							//
			//usersNew
			//
			this.bbiusersNew.Caption = "New";
			this.bbiusersNew.Name = "bbiusersNew";
			this.bbiusersNew.ImageUri.Uri = "New";
			this.bbiusersNew.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.usersBarManager.Items.Add(this.bbiusersNew);
			this.usersBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiusersNew));
			this.usersPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiusersNew));
						//
			//usersEdit
			//
			this.bbiusersEdit.Caption = "Edit";
			this.bbiusersEdit.Name = "bbiusersEdit";
			this.bbiusersEdit.ImageUri.Uri = "Edit";
			this.bbiusersEdit.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.usersBarManager.Items.Add(this.bbiusersEdit);
			this.usersBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiusersEdit));
			this.usersPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiusersEdit));
						//
			//usersDelete
			//
			this.bbiusersDelete.Caption = "Delete";
			this.bbiusersDelete.Name = "bbiusersDelete";
			this.bbiusersDelete.ImageUri.Uri = "Delete";
			this.bbiusersDelete.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.usersBarManager.Items.Add(this.bbiusersDelete);
			this.usersBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiusersDelete));
			this.usersPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiusersDelete));
						//
			//usersRefresh
			//
			this.bbiusersRefresh.Caption = "Refresh";
			this.bbiusersRefresh.Name = "bbiusersRefresh";
			this.bbiusersRefresh.ImageUri.Uri = "Refresh";
			this.bbiusersRefresh.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.usersBarManager.Items.Add(this.bbiusersRefresh);
			this.usersBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiusersRefresh));
			this.usersPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiusersRefresh));
						//
			//usersBar
			//
			this.usersBar.BarName = "users";
            this.usersBar.DockCol = 0;
            this.usersBar.DockRow = 0;
            this.usersBar.DockStyle = DevExpress.XtraBars.BarDockStyle.Top;
            this.usersBar.OptionsBar.AllowQuickCustomization = false;
            this.usersBar.OptionsBar.DrawDragBorder = false;
            this.usersBar.Text = "users";
			//
			//usersBarManager
			//
			this.usersBarManager.AllowCustomization = false;
            this.usersBarManager.Bars.AddRange(new DevExpress.XtraBars.Bar[] {this.usersBar});
            this.usersBarManager.Form = usersXtraUserControl;
            this.usersBarManager.MainMenu = this.usersBar;
			// 
            // usersPopUpMenu
            // 
            this.usersPopUpMenu.Manager = this.usersBarManager;
            this.usersPopUpMenu.Name = "usersPopUpMenu";
			//
			//usersRetriveFieldParameters
			//
			DevExpress.XtraDataLayout.RetrieveFieldParameters usersRetriveFieldParameters = new DevExpress.XtraDataLayout.RetrieveFieldParameters();
            usersRetriveFieldParameters.FieldName = "users";
            usersRetriveFieldParameters.ControlForField = usersXtraUserControl;
			usersRetriveFieldParameters.CreateTabGroupForItem = true;
			parameters.CustomListParameters.Add(usersRetriveFieldParameters);
						 
			//
			//call RetrieveFields
			//
            this.dataLayoutControl1.RetrieveFields(parameters);
			// 
            // mvvmContext
            // 
            this.mvvmContext.ContainerControl = this;
            this.mvvmContext.ViewModelType = typeof(PSS_WINFORM_CONTROL.ViewModels.roleViewModel);
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.roleViewModel), "Save", bbiSave));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.roleViewModel), "SaveAndClose", bbiSaveAndClose));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.roleViewModel), "SaveAndNew", bbiSaveAndNew));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.roleViewModel), "Reset", bbiReset));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.roleViewModel), "Delete", bbiDelete));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.roleViewModel), "Close", bbiClose));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.roleViewModel), "SaveLayout", bbiSaveLayout));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.roleViewModel), "ResetLayout", bbiResetLayout));
						this.mvvmContext.RegistrationExpressions.AddRange(new DevExpress.Utils.MVVM.RegistrationExpression[] {
            DevExpress.Utils.MVVM.RegistrationExpression.RegisterLayoutSerializationService(null, false, DevExpress.Utils.DefaultBoolean.True, this.dataLayoutControl1)});
			//
			//roleView
			//
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.Controls.Add(this.dataLayoutControl1);
			this.Controls.Add(this.mainRibbonControl);
			this.Size = new System.Drawing.Size(1024, 768);
            this.Name = "roleView";
						((System.ComponentModel.ISupportInitialize)(this.usersBarManager)).EndInit();
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
		private System.Windows.Forms.BindingSource roleViewBindingSource;
				private DevExpress.XtraGrid.GridControl usersGridControl;
		private DevExpress.XtraGrid.Views.Grid.GridView usersGridView;
		private DevExpress.XtraBars.BarManager usersBarManager;
		private DevExpress.XtraBars.Bar usersBar;
		private DevExpress.XtraEditors.XtraUserControl usersXtraUserControl;
		private DevExpress.XtraBars.PopupMenu usersPopUpMenu;
				private DevExpress.XtraBars.BarButtonItem bbiusersNew;
				private DevExpress.XtraBars.BarButtonItem bbiusersEdit;
				private DevExpress.XtraBars.BarButtonItem bbiusersDelete;
				private DevExpress.XtraBars.BarButtonItem bbiusersRefresh;
						 
	}
}
