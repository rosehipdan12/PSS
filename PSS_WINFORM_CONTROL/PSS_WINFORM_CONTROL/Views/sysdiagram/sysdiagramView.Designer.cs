namespace PSS_WINFORM_CONTROL.Views.sysdiagramView {
    partial class sysdiagramView {
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
            this.sysdiagramViewBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.layoutControlGroup2 = new DevExpress.XtraLayout.LayoutControlGroup();
            this.nameTextEdit = new DevExpress.XtraEditors.TextEdit();
            this.ItemForname = new DevExpress.XtraLayout.LayoutControlItem();
            this.principal_idTextEdit = new DevExpress.XtraEditors.TextEdit();
            this.ItemForprincipal_id = new DevExpress.XtraLayout.LayoutControlItem();
            this.diagram_idTextEdit = new DevExpress.XtraEditors.TextEdit();
            this.ItemFordiagram_id = new DevExpress.XtraLayout.LayoutControlItem();
            this.versionTextEdit = new DevExpress.XtraEditors.TextEdit();
            this.ItemForversion = new DevExpress.XtraLayout.LayoutControlItem();
            this.definitionPictureEdit = new DevExpress.XtraEditors.PictureEdit();
            this.ItemFordefinition = new DevExpress.XtraLayout.LayoutControlItem();
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
            ((System.ComponentModel.ISupportInitialize)(this.sysdiagramViewBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nameTextEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForname)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.principal_idTextEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForprincipal_id)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.diagram_idTextEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemFordiagram_id)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.versionTextEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForversion)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.definitionPictureEdit.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemFordefinition)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.mvvmContext)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.mainRibbonControl)).BeginInit();
            this.SuspendLayout();
            // 
            // dataLayoutControl1
            // 
            this.dataLayoutControl1.AllowCustomization = false;
            this.dataLayoutControl1.Controls.Add(this.nameTextEdit);
            this.dataLayoutControl1.Controls.Add(this.principal_idTextEdit);
            this.dataLayoutControl1.Controls.Add(this.diagram_idTextEdit);
            this.dataLayoutControl1.Controls.Add(this.versionTextEdit);
            this.dataLayoutControl1.Controls.Add(this.definitionPictureEdit);
            this.dataLayoutControl1.DataSource = this.sysdiagramViewBindingSource;
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
            // sysdiagramViewBindingSource
            // 
            this.sysdiagramViewBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.sysdiagram);
            // 
            // layoutControlGroup2
            // 
            this.layoutControlGroup2.AllowDrawBackground = false;
            this.layoutControlGroup2.GroupBordersVisible = false;
            this.layoutControlGroup2.Items.AddRange(new DevExpress.XtraLayout.BaseLayoutItem[] {
            this.ItemForname,
            this.ItemForprincipal_id,
            this.ItemFordiagram_id,
            this.ItemForversion,
            this.ItemFordefinition});
            this.layoutControlGroup2.Location = new System.Drawing.Point(0, 0);
            this.layoutControlGroup2.Name = "autoGeneratedGroup0";
            this.layoutControlGroup2.Size = new System.Drawing.Size(1171, 776);
            // 
            // nameTextEdit
            // 
            this.nameTextEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.sysdiagramViewBindingSource, "name", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.nameTextEdit.Location = new System.Drawing.Point(81, 14);
            this.nameTextEdit.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.nameTextEdit.Name = "nameTextEdit";
            this.nameTextEdit.Properties.AllowNullInput = DevExpress.Utils.DefaultBoolean.False;
            this.nameTextEdit.Size = new System.Drawing.Size(1100, 22);
            this.nameTextEdit.StyleController = this.dataLayoutControl1;
            this.nameTextEdit.TabIndex = 4;
            // 
            // ItemForname
            // 
            this.ItemForname.Control = this.nameTextEdit;
            this.ItemForname.Location = new System.Drawing.Point(0, 0);
            this.ItemForname.Name = "ItemForname";
            this.ItemForname.Size = new System.Drawing.Size(1171, 26);
            this.ItemForname.Text = "Name";
            this.ItemForname.TextSize = new System.Drawing.Size(64, 16);
            // 
            // principal_idTextEdit
            // 
            this.principal_idTextEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.sysdiagramViewBindingSource, "principal_id", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.principal_idTextEdit.Location = new System.Drawing.Point(81, 40);
            this.principal_idTextEdit.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.principal_idTextEdit.Name = "principal_idTextEdit";
            this.principal_idTextEdit.Properties.Appearance.Options.UseTextOptions = true;
            this.principal_idTextEdit.Properties.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Far;
            this.principal_idTextEdit.Properties.Mask.EditMask = "N0";
            this.principal_idTextEdit.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.Numeric;
            this.principal_idTextEdit.Properties.Mask.UseMaskAsDisplayFormat = true;
            this.principal_idTextEdit.Size = new System.Drawing.Size(1100, 22);
            this.principal_idTextEdit.StyleController = this.dataLayoutControl1;
            this.principal_idTextEdit.TabIndex = 5;
            // 
            // ItemForprincipal_id
            // 
            this.ItemForprincipal_id.Control = this.principal_idTextEdit;
            this.ItemForprincipal_id.Location = new System.Drawing.Point(0, 26);
            this.ItemForprincipal_id.Name = "ItemForprincipal_id";
            this.ItemForprincipal_id.Size = new System.Drawing.Size(1171, 26);
            this.ItemForprincipal_id.Text = "Principal ID";
            this.ItemForprincipal_id.TextSize = new System.Drawing.Size(64, 16);
            // 
            // diagram_idTextEdit
            // 
            this.diagram_idTextEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.sysdiagramViewBindingSource, "diagram_id", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.diagram_idTextEdit.Location = new System.Drawing.Point(81, 66);
            this.diagram_idTextEdit.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.diagram_idTextEdit.Name = "diagram_idTextEdit";
            this.diagram_idTextEdit.Properties.Appearance.Options.UseTextOptions = true;
            this.diagram_idTextEdit.Properties.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Far;
            this.diagram_idTextEdit.Properties.Mask.EditMask = "N0";
            this.diagram_idTextEdit.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.Numeric;
            this.diagram_idTextEdit.Properties.Mask.UseMaskAsDisplayFormat = true;
            this.diagram_idTextEdit.Size = new System.Drawing.Size(1100, 22);
            this.diagram_idTextEdit.StyleController = this.dataLayoutControl1;
            this.diagram_idTextEdit.TabIndex = 6;
            // 
            // ItemFordiagram_id
            // 
            this.ItemFordiagram_id.Control = this.diagram_idTextEdit;
            this.ItemFordiagram_id.Location = new System.Drawing.Point(0, 52);
            this.ItemFordiagram_id.Name = "ItemFordiagram_id";
            this.ItemFordiagram_id.Size = new System.Drawing.Size(1171, 26);
            this.ItemFordiagram_id.Text = "Diagram ID";
            this.ItemFordiagram_id.TextSize = new System.Drawing.Size(64, 16);
            // 
            // versionTextEdit
            // 
            this.versionTextEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.sysdiagramViewBindingSource, "version", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.versionTextEdit.Location = new System.Drawing.Point(81, 92);
            this.versionTextEdit.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.versionTextEdit.Name = "versionTextEdit";
            this.versionTextEdit.Properties.AllowNullInput = DevExpress.Utils.DefaultBoolean.True;
            this.versionTextEdit.Properties.Appearance.Options.UseTextOptions = true;
            this.versionTextEdit.Properties.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Far;
            this.versionTextEdit.Properties.Mask.EditMask = "N0";
            this.versionTextEdit.Properties.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.Numeric;
            this.versionTextEdit.Properties.Mask.UseMaskAsDisplayFormat = true;
            this.versionTextEdit.Size = new System.Drawing.Size(1100, 22);
            this.versionTextEdit.StyleController = this.dataLayoutControl1;
            this.versionTextEdit.TabIndex = 7;
            // 
            // ItemForversion
            // 
            this.ItemForversion.Control = this.versionTextEdit;
            this.ItemForversion.Location = new System.Drawing.Point(0, 78);
            this.ItemForversion.Name = "ItemForversion";
            this.ItemForversion.Size = new System.Drawing.Size(1171, 26);
            this.ItemForversion.Text = "Version";
            this.ItemForversion.TextSize = new System.Drawing.Size(64, 16);
            // 
            // definitionPictureEdit
            // 
            this.definitionPictureEdit.DataBindings.Add(new System.Windows.Forms.Binding("EditValue", this.sysdiagramViewBindingSource, "definition", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.definitionPictureEdit.Location = new System.Drawing.Point(81, 118);
            this.definitionPictureEdit.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.definitionPictureEdit.Name = "definitionPictureEdit";
            this.definitionPictureEdit.Properties.SizeMode = DevExpress.XtraEditors.Controls.PictureSizeMode.Squeeze;
            this.definitionPictureEdit.Size = new System.Drawing.Size(1100, 668);
            this.definitionPictureEdit.StyleController = this.dataLayoutControl1;
            this.definitionPictureEdit.TabIndex = 8;
            // 
            // ItemFordefinition
            // 
            this.ItemFordefinition.Control = this.definitionPictureEdit;
            this.ItemFordefinition.Location = new System.Drawing.Point(0, 104);
            this.ItemFordefinition.Name = "ItemFordefinition";
            this.ItemFordefinition.Size = new System.Drawing.Size(1171, 672);
            this.ItemFordefinition.StartNewLine = true;
            this.ItemFordefinition.Text = "definition";
            this.ItemFordefinition.TextSize = new System.Drawing.Size(64, 16);
            // 
            // mvvmContext
            // 
            this.mvvmContext.BindingExpressions.AddRange(new DevExpress.Utils.MVVM.BindingExpression[] {
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.sysdiagramViewModel), "Save", this.bbiSave),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.sysdiagramViewModel), "SaveAndClose", this.bbiSaveAndClose),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.sysdiagramViewModel), "SaveAndNew", this.bbiSaveAndNew),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.sysdiagramViewModel), "Reset", this.bbiReset),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.sysdiagramViewModel), "Delete", this.bbiDelete),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.sysdiagramViewModel), "Close", this.bbiClose),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.sysdiagramViewModel), "SaveLayout", this.bbiSaveLayout),
            DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.sysdiagramViewModel), "ResetLayout", this.bbiResetLayout)});
            this.mvvmContext.ContainerControl = this;
            this.mvvmContext.RegistrationExpressions.AddRange(new DevExpress.Utils.MVVM.RegistrationExpression[] {
            DevExpress.Utils.MVVM.RegistrationExpression.RegisterLayoutSerializationService(null, false, DevExpress.Utils.DefaultBoolean.True, this.dataLayoutControl1)});
            this.mvvmContext.ViewModelType = typeof(PSS_WINFORM_CONTROL.ViewModels.sysdiagramViewModel);
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
            this.mainRibbonPageGroup.Text = "sysdiagram Tasks";
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
            // sysdiagramView
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoValidate = System.Windows.Forms.AutoValidate.EnableAllowFocusChange;
            this.Controls.Add(this.dataLayoutControl1);
            this.Controls.Add(this.mainRibbonControl);
            this.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.Name = "sysdiagramView";
            this.Size = new System.Drawing.Size(1195, 945);
            ((System.ComponentModel.ISupportInitialize)(this.dataLayoutControl1)).EndInit();
            this.dataLayoutControl1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sysdiagramViewBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.layoutControlGroup2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nameTextEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForname)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.principal_idTextEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForprincipal_id)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.diagram_idTextEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemFordiagram_id)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.versionTextEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemForversion)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.definitionPictureEdit.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ItemFordefinition)).EndInit();
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
		private System.Windows.Forms.BindingSource sysdiagramViewBindingSource;
        private DevExpress.XtraEditors.TextEdit nameTextEdit;
        private DevExpress.XtraEditors.TextEdit principal_idTextEdit;
        private DevExpress.XtraEditors.TextEdit diagram_idTextEdit;
        private DevExpress.XtraEditors.TextEdit versionTextEdit;
        private DevExpress.XtraEditors.PictureEdit definitionPictureEdit;
        private DevExpress.XtraLayout.LayoutControlGroup layoutControlGroup2;
        private DevExpress.XtraLayout.LayoutControlItem ItemForname;
        private DevExpress.XtraLayout.LayoutControlItem ItemForprincipal_id;
        private DevExpress.XtraLayout.LayoutControlItem ItemFordiagram_id;
        private DevExpress.XtraLayout.LayoutControlItem ItemForversion;
        private DevExpress.XtraLayout.LayoutControlItem ItemFordefinition;
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
