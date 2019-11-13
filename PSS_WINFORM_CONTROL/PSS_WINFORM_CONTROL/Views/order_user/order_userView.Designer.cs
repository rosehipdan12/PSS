namespace PSS_WINFORM_CONTROL.Views.order_userView {
    partial class order_userView {
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
            this.order_userViewBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.orderLookUpEdit = new DevExpress.XtraEditors.GridLookUpEdit();
            this.orderBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.userLookUpEdit = new DevExpress.XtraEditors.GridLookUpEdit();
            this.userBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.layoutControlGroup2 = new DevExpress.XtraLayout.LayoutControlGroup();
            this.userLookUpEditView = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.ItemForuser_id = new DevExpress.XtraLayout.LayoutControlItem();
            this.orderLookUpEditView = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.ItemFororder_id = new DevExpress.XtraLayout.LayoutControlItem();
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
            ((System.ComponentModel.ISupportInitialize)(this.order_userViewBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.orderLookUpEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.orderBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.userLookUpEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.userBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.userLookUpEditView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForuser_id)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.orderLookUpEditView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemFororder_id)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.idTextEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForid)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.mvvmContext)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.mainRibbonControl)).BeginInit();
            this.SuspendLayout();
            // 
            // dataLayoutControl1
            // 
            this.dataLayoutControl1.AllowCustomization = false;
            this.dataLayoutControl1.Controls.Add(this.userLookUpEdit);
            this.dataLayoutControl1.Controls.Add(this.orderLookUpEdit);
            this.dataLayoutControl1.Controls.Add(this.idTextEdit);
            this.dataLayoutControl1.DataSource = this.order_userViewBindingSource;
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
            // order_userViewBindingSource
            // 
            this.order_userViewBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.order_user);
            // 
            // orderLookUpEdit
            // 
            this.orderLookUpEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.order_userViewBindingSource, "order_id", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.orderLookUpEdit.Location = new System.Drawing.Point(66, 40);
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
            this.orderLookUpEdit.TabIndex = 5;
            // 
            // orderBindingSource
            // 
            this.orderBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.order);
            // 
            // userLookUpEdit
            // 
            this.userLookUpEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.order_userViewBindingSource, "user_id", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.userLookUpEdit.Location = new System.Drawing.Point(66, 14);
            this.userLookUpEdit.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.userLookUpEdit.Name = "userLookUpEdit";
            this.userLookUpEdit.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.userLookUpEdit.Properties.DataSource = this.userBindingSource;
            this.userLookUpEdit.Properties.DisplayMember = "first_name";
            this.userLookUpEdit.Properties.PopupView = this.userLookUpEditView;
            this.userLookUpEdit.Properties.ValueMember = "id";
            this.userLookUpEdit.Size = new System.Drawing.Size(1115, 22);
            this.userLookUpEdit.StyleController = this.dataLayoutControl1;
            this.userLookUpEdit.TabIndex = 4;
            // 
            // userBindingSource
            // 
            this.userBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.user);
            // 
            // layoutControlGroup2
            // 
            this.layoutControlGroup2.AllowDrawBackground = false;
            this.layoutControlGroup2.GroupBordersVisible = false;
            this.layoutControlGroup2.Items.AddRange(new DevExpress.XtraLayout.BaseLayoutItem[] {
            this.ItemForuser_id,
            this.ItemFororder_id,
            this.ItemForid});
            this.layoutControlGroup2.Location = new System.Drawing.Point(0, 0);
            this.layoutControlGroup2.Name = "autoGeneratedGroup0";
            this.layoutControlGroup2.Size = new System.Drawing.Size(1171, 776);
            // 
            // userLookUpEditView
            // 
            this.userLookUpEditView.FocusRectStyle = DevExpress.XtraGrid.Views.Grid.DrawFocusRectStyle.RowFocus;
            this.userLookUpEditView.Name = "userLookUpEditView";
            this.userLookUpEditView.OptionsSelection.EnableAppearanceFocusedCell = false;
            this.userLookUpEditView.OptionsView.ShowGroupPanel = false;
            // 
            // ItemForuser_id
            // 
            this.ItemForuser_id.Control = this.userLookUpEdit;
            this.ItemForuser_id.Location = new System.Drawing.Point(0, 0);
            this.ItemForuser_id.Name = "ItemForuser_id";
            this.ItemForuser_id.Size = new System.Drawing.Size(1171, 26);
            this.ItemForuser_id.Text = "User ID";
            this.ItemForuser_id.TextSize = new System.Drawing.Size(49, 16);
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
            this.ItemFororder_id.Location = new System.Drawing.Point(0, 26);
            this.ItemFororder_id.Name = "ItemFororder_id";
            this.ItemFororder_id.Size = new System.Drawing.Size(1171, 26);
            this.ItemFororder_id.Text = "Order ID";
            this.ItemFororder_id.TextSize = new System.Drawing.Size(49, 16);
            // 
            // idTextEdit
            // 
            this.idTextEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.order_userViewBindingSource, "id", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.idTextEdit.Location = new System.Drawing.Point(66, 66);
            this.idTextEdit.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.idTextEdit.Name = "idTextEdit";
            this.idTextEdit.Properties.Appearance.Options.UseTextOptions = true;
            this.idTextEdit.Properties.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Far;
            this.idTextEdit.Properties.Mask.EditMask = "N0";
            this.idTextEdit.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.Numeric;
            this.idTextEdit.Properties.Mask.UseMaskAsDisplayFormat = true;
            this.idTextEdit.Size = new System.Drawing.Size(1115, 22);
            this.idTextEdit.StyleController = this.dataLayoutControl1;
            this.idTextEdit.TabIndex = 6;
            // 
            // ItemForid
            // 
            this.ItemForid.Control = this.idTextEdit;
            this.ItemForid.Location = new System.Drawing.Point(0, 52);
            this.ItemForid.Name = "ItemForid";
            this.ItemForid.Size = new System.Drawing.Size(1171, 724);
            this.ItemForid.Text = "ID";
            this.ItemForid.TextSize = new System.Drawing.Size(49, 16);
            // 
            // mvvmContext
            // 
            this.mvvmContext.BindingExpressions.AddRange(new DevExpress.Utils.MVVM.BindingExpression[] {
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_userViewModel), "Save", this.bbiSave),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_userViewModel), "SaveAndClose", this.bbiSaveAndClose),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_userViewModel), "SaveAndNew", this.bbiSaveAndNew),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_userViewModel), "Reset", this.bbiReset),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_userViewModel), "Delete", this.bbiDelete),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_userViewModel), "Close", this.bbiClose),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_userViewModel), "SaveLayout", this.bbiSaveLayout),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_userViewModel), "ResetLayout", this.bbiResetLayout)});
            this.mvvmContext.ContainerControl = this;
            this.mvvmContext.RegistrationExpressions.AddRange(new DevExpress.Utils.MVVM.RegistrationExpression[] {
            DevExpress.Utils.MVVM.RegistrationExpression.RegisterLayoutSerializationService(null, false, DevExpress.Utils.DefaultBoolean.True, this.dataLayoutControl1)});
            this.mvvmContext.ViewModelType = typeof(PSS_WINFORM_CONTROL.ViewModels.order_userViewModel);
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
            this.mainRibbonPageGroup.Text = "order_user Tasks";
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
            // order_userView
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.Controls.Add(this.dataLayoutControl1);
            this.Controls.Add(this.mainRibbonControl);
            this.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.Name = "order_userView";
            this.Size = new System.Drawing.Size(1195, 945);
            ((System.ComponentModel.ISupportInitialize)(this.dataLayoutControl1)).EndInit();
            this.dataLayoutControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.order_userViewBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.orderLookUpEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.orderBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.userLookUpEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.userBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.userLookUpEditView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForuser_id)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.orderLookUpEditView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemFororder_id)).EndInit();
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
		private System.Windows.Forms.BindingSource order_userViewBindingSource;
						private DevExpress.XtraEditors.GridLookUpEdit orderLookUpEdit;
		private System.Windows.Forms.BindingSource orderBindingSource;
				private DevExpress.XtraEditors.GridLookUpEdit userLookUpEdit;
		private System.Windows.Forms.BindingSource userBindingSource;
        private DevExpress.XtraGrid.Views.Grid.GridView userLookUpEditView;
        private DevExpress.XtraGrid.Views.Grid.GridView orderLookUpEditView;
        private DevExpress.XtraEditors.TextEdit idTextEdit;
        private DevExpress.XtraLayout.LayoutControlGroup layoutControlGroup2;
        private DevExpress.XtraLayout.LayoutControlItem ItemForuser_id;
        private DevExpress.XtraLayout.LayoutControlItem ItemFororder_id;
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
