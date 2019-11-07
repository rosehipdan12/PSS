namespace PSS_WINFORM_CONTROL.Views.userView {
    partial class userView {
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
						this.order_userGridControl = new DevExpress.XtraGrid.GridControl();
			this.order_userGridView = new DevExpress.XtraGrid.Views.Grid.GridView();
			this.order_userBarManager = new DevExpress.XtraBars.BarManager();
			this.order_userBar = new DevExpress.XtraBars.Bar();
			this.order_userXtraUserControl = new DevExpress.XtraEditors.XtraUserControl();
			this.order_userPopUpMenu = new DevExpress.XtraBars.PopupMenu(this.components);
						this.bbiorder_userNew = new DevExpress.XtraBars.BarButtonItem();
						this.bbiorder_userEdit = new DevExpress.XtraBars.BarButtonItem();
						this.bbiorder_userDelete = new DevExpress.XtraBars.BarButtonItem();
						this.bbiorder_userRefresh = new DevExpress.XtraBars.BarButtonItem();
						((System.ComponentModel.ISupportInitialize)(this.order_userBarManager)).BeginInit();
									this.roleLookUpEdit = new DevExpress.XtraEditors.GridLookUpEdit();
			this.roleBindingSource = new System.Windows.Forms.BindingSource(this.components);
			 
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
            this.mainRibbonPageGroup.Text = "user Tasks";
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
			this.userViewBindingSource = new System.Windows.Forms.BindingSource(this.components);
			this.userViewBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.user);
			this.dataLayoutControl1.DataSource = userViewBindingSource;
			//
			//Create GridControls
			//
			DevExpress.XtraDataLayout.RetrieveFieldsParameters parameters = new DevExpress.XtraDataLayout.RetrieveFieldsParameters();
			parameters.DataSourceUpdateMode = System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged;
           				//
			//order_userGridControl
			//
			this.order_userGridControl.MainView = this.order_userGridView;
			this.order_userGridControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.order_userGridControl.MenuManager = this.mainRibbonControl;
            this.order_userGridControl.Name = "order_userGridControl";
            this.order_userGridControl.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.order_userGridView});
			//
			//order_userGridView
			//
            this.order_userGridView.GridControl = this.order_userGridControl;
            this.order_userGridView.Name = "order_userGridView";
            this.order_userGridView.OptionsBehavior.Editable = false;
            this.order_userGridView.OptionsBehavior.ReadOnly = true;
			//
			//order_userPopulateColumnsParameters
			//
			DevExpress.XtraGrid.Extensions.PopulateColumnsParameters order_userPopulateColumnsParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnsParameters();
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters orderorder_userChildPopulateColumnParameters_NotVisible = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            orderorder_userChildPopulateColumnParameters_NotVisible.FieldName = "order";
		    orderorder_userChildPopulateColumnParameters_NotVisible.ColumnVisible = false;
			order_userPopulateColumnsParameters.CustomColumnParameters.Add(orderorder_userChildPopulateColumnParameters_NotVisible);
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters userorder_userChildPopulateColumnParameters_NotVisible = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            userorder_userChildPopulateColumnParameters_NotVisible.FieldName = "user";
		    userorder_userChildPopulateColumnParameters_NotVisible.ColumnVisible = false;
			order_userPopulateColumnsParameters.CustomColumnParameters.Add(userorder_userChildPopulateColumnParameters_NotVisible);
							
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters order_userorder_userChildPopulateColumnParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            order_userorder_userChildPopulateColumnParameters.FieldName = "order_userorder_user";
            order_userorder_userChildPopulateColumnParameters.Path = "order_user.user_id";
			order_userPopulateColumnsParameters.CustomColumnParameters.Add(order_userorder_userChildPopulateColumnParameters);
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters roleorder_userChildPopulateColumnParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            roleorder_userChildPopulateColumnParameters.FieldName = "roleorder_user";
            roleorder_userChildPopulateColumnParameters.Path = "role.name";
			order_userPopulateColumnsParameters.CustomColumnParameters.Add(roleorder_userChildPopulateColumnParameters);
			 
		    this.order_userGridView.PopulateColumns(typeof(PSS_WINFORM_CONTROL.order_user),order_userPopulateColumnsParameters);
			//
			//order_userBindingSource
			//
			System.Windows.Forms.BindingSource order_userBindingSource = new System.Windows.Forms.BindingSource(this.components);
			order_userBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.order_user);
            this.order_userGridControl.DataSource = order_userBindingSource;
			//
			//order_userXtraUserControl
			//
            this.order_userXtraUserControl.Controls.Add(order_userGridControl);
			this.order_userXtraUserControl.Name = "order_userXtraUserControl";
			this.order_userXtraUserControl.MinimumSize = new System.Drawing.Size(100, 100); 
							//
			//order_userNew
			//
			this.bbiorder_userNew.Caption = "New";
			this.bbiorder_userNew.Name = "bbiorder_userNew";
			this.bbiorder_userNew.ImageUri.Uri = "New";
			this.bbiorder_userNew.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.order_userBarManager.Items.Add(this.bbiorder_userNew);
			this.order_userBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_userNew));
			this.order_userPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_userNew));
						//
			//order_userEdit
			//
			this.bbiorder_userEdit.Caption = "Edit";
			this.bbiorder_userEdit.Name = "bbiorder_userEdit";
			this.bbiorder_userEdit.ImageUri.Uri = "Edit";
			this.bbiorder_userEdit.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.order_userBarManager.Items.Add(this.bbiorder_userEdit);
			this.order_userBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_userEdit));
			this.order_userPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_userEdit));
						//
			//order_userDelete
			//
			this.bbiorder_userDelete.Caption = "Delete";
			this.bbiorder_userDelete.Name = "bbiorder_userDelete";
			this.bbiorder_userDelete.ImageUri.Uri = "Delete";
			this.bbiorder_userDelete.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.order_userBarManager.Items.Add(this.bbiorder_userDelete);
			this.order_userBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_userDelete));
			this.order_userPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_userDelete));
						//
			//order_userRefresh
			//
			this.bbiorder_userRefresh.Caption = "Refresh";
			this.bbiorder_userRefresh.Name = "bbiorder_userRefresh";
			this.bbiorder_userRefresh.ImageUri.Uri = "Refresh";
			this.bbiorder_userRefresh.PaintStyle = DevExpress.XtraBars.BarItemPaintStyle.CaptionGlyph;
			this.order_userBarManager.Items.Add(this.bbiorder_userRefresh);
			this.order_userBar.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_userRefresh));
			this.order_userPopUpMenu.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.bbiorder_userRefresh));
						//
			//order_userBar
			//
			this.order_userBar.BarName = "order_user";
            this.order_userBar.DockCol = 0;
            this.order_userBar.DockRow = 0;
            this.order_userBar.DockStyle = DevExpress.XtraBars.BarDockStyle.Top;
            this.order_userBar.OptionsBar.AllowQuickCustomization = false;
            this.order_userBar.OptionsBar.DrawDragBorder = false;
            this.order_userBar.Text = "order_user";
			//
			//order_userBarManager
			//
			this.order_userBarManager.AllowCustomization = false;
            this.order_userBarManager.Bars.AddRange(new DevExpress.XtraBars.Bar[] {this.order_userBar});
            this.order_userBarManager.Form = order_userXtraUserControl;
            this.order_userBarManager.MainMenu = this.order_userBar;
			// 
            // order_userPopUpMenu
            // 
            this.order_userPopUpMenu.Manager = this.order_userBarManager;
            this.order_userPopUpMenu.Name = "order_userPopUpMenu";
			//
			//order_userRetriveFieldParameters
			//
			DevExpress.XtraDataLayout.RetrieveFieldParameters order_userRetriveFieldParameters = new DevExpress.XtraDataLayout.RetrieveFieldParameters();
            order_userRetriveFieldParameters.FieldName = "order_user";
            order_userRetriveFieldParameters.ControlForField = order_userXtraUserControl;
			order_userRetriveFieldParameters.CreateTabGroupForItem = true;
			parameters.CustomListParameters.Add(order_userRetriveFieldParameters);
									//
			//roleLookUpEdit
			//
			this.roleBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.role);
			this.roleLookUpEdit.Properties.ValueMember = "id"; 
			this.roleLookUpEdit.Properties.DisplayMember = "name";
			this.roleLookUpEdit.Properties.DataSource = this.roleBindingSource;
			this.roleLookUpEdit.Name = "roleLookUpEdit";
			this.roleLookUpEdit.DataBindings.Add("EditValue", userViewBindingSource, "role_id", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged);
			DevExpress.XtraDataLayout.RetrieveFieldParameters roleLookUpEditRetrieveFieldParameters = new DevExpress.XtraDataLayout.RetrieveFieldParameters();
            roleLookUpEditRetrieveFieldParameters.FieldName = "role_id";
            roleLookUpEditRetrieveFieldParameters.ControlForField = this.roleLookUpEdit;
			parameters.CustomListParameters.Add(roleLookUpEditRetrieveFieldParameters);
			DevExpress.XtraDataLayout.RetrieveFieldParameters roleLookUpEditRetrieveFieldParameters_NotGenerate = new DevExpress.XtraDataLayout.RetrieveFieldParameters();
		    roleLookUpEditRetrieveFieldParameters_NotGenerate.FieldName = "role";
		    roleLookUpEditRetrieveFieldParameters_NotGenerate.GenerateField = false;
			parameters.CustomListParameters.Add(roleLookUpEditRetrieveFieldParameters_NotGenerate);
			 
			//
			//call RetrieveFields
			//
            this.dataLayoutControl1.RetrieveFields(parameters);
			// 
            // mvvmContext
            // 
            this.mvvmContext.ContainerControl = this;
            this.mvvmContext.ViewModelType = typeof(PSS_WINFORM_CONTROL.ViewModels.userViewModel);
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.userViewModel), "Save", bbiSave));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.userViewModel), "SaveAndClose", bbiSaveAndClose));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.userViewModel), "SaveAndNew", bbiSaveAndNew));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.userViewModel), "Reset", bbiReset));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.userViewModel), "Delete", bbiDelete));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.userViewModel), "Close", bbiClose));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.userViewModel), "SaveLayout", bbiSaveLayout));
						this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.userViewModel), "ResetLayout", bbiResetLayout));
						this.mvvmContext.RegistrationExpressions.AddRange(new DevExpress.Utils.MVVM.RegistrationExpression[] {
            DevExpress.Utils.MVVM.RegistrationExpression.RegisterLayoutSerializationService(null, false, DevExpress.Utils.DefaultBoolean.True, this.dataLayoutControl1)});
			//
			//userView
			//
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.Controls.Add(this.dataLayoutControl1);
			this.Controls.Add(this.mainRibbonControl);
			this.Size = new System.Drawing.Size(1024, 768);
            this.Name = "userView";
						((System.ComponentModel.ISupportInitialize)(this.order_userBarManager)).EndInit();
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
		private System.Windows.Forms.BindingSource userViewBindingSource;
				private DevExpress.XtraGrid.GridControl order_userGridControl;
		private DevExpress.XtraGrid.Views.Grid.GridView order_userGridView;
		private DevExpress.XtraBars.BarManager order_userBarManager;
		private DevExpress.XtraBars.Bar order_userBar;
		private DevExpress.XtraEditors.XtraUserControl order_userXtraUserControl;
		private DevExpress.XtraBars.PopupMenu order_userPopUpMenu;
				private DevExpress.XtraBars.BarButtonItem bbiorder_userNew;
				private DevExpress.XtraBars.BarButtonItem bbiorder_userEdit;
				private DevExpress.XtraBars.BarButtonItem bbiorder_userDelete;
				private DevExpress.XtraBars.BarButtonItem bbiorder_userRefresh;
								private DevExpress.XtraEditors.GridLookUpEdit roleLookUpEdit;
		private System.Windows.Forms.BindingSource roleBindingSource;
		 
	}
}
