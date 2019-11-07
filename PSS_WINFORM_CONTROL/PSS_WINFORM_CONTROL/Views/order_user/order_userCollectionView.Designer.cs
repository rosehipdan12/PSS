﻿namespace PSS_WINFORM_CONTROL.Views.order_userCollectionView {
    partial class order_userCollectionView {
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
			this.gridControl = new DevExpress.XtraGrid.GridControl();
            this.gridView = new DevExpress.XtraGrid.Views.Grid.GridView();
			this.mvvmContext = new DevExpress.Utils.MVVM.MVVMContext(this.components);
			this.ribbonControl = new DevExpress.XtraBars.Ribbon.RibbonControl();
			this.ribbonPage1 = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.ribbonPageGroup1 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
			this.ribbonPageGroup2 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonStatusBar = new DevExpress.XtraBars.Ribbon.RibbonStatusBar();
            this.bsiRecordsCount = new DevExpress.XtraBars.BarStaticItem();
			this.bbiPrintPreview = new DevExpress.XtraBars.BarButtonItem();
			this.popupMenu = new DevExpress.XtraBars.PopupMenu(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.gridControl)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ribbonControl)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.mvvmContext)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.popupMenu)).BeginInit();
            this.SuspendLayout();
			// 
            // ribbonControl
            // 
            this.ribbonControl.ExpandCollapseItem.Id = 0;
            this.ribbonControl.MaxItemId = 14;
            this.ribbonControl.Name = "ribbonControl";
			this.ribbonControl.Pages.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPage[] {
            this.ribbonPage1});
            this.ribbonControl.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonControlStyle.Office2013;
            this.ribbonControl.ShowApplicationButton = DevExpress.Utils.DefaultBoolean.False;
            this.ribbonControl.ToolbarLocation = DevExpress.XtraBars.Ribbon.RibbonQuickAccessToolbarLocation.Hidden;
			this.ribbonControl.Items.AddRange(new DevExpress.XtraBars.BarItem[] {this.bbiPrintPreview, this.bsiRecordsCount});
																DevExpress.XtraBars.BarButtonItem bbiNew = new DevExpress.XtraBars.BarButtonItem();
			bbiNew.Caption = "New";
			bbiNew.Name = "bbiNew";
			bbiNew.ImageUri.Uri = "New";
						this.ribbonControl.Items.Add(bbiNew);
								DevExpress.XtraBars.BarButtonItem bbiEdit = new DevExpress.XtraBars.BarButtonItem();
			bbiEdit.Caption = "Edit";
			bbiEdit.Name = "bbiEdit";
			bbiEdit.ImageUri.Uri = "Edit";
						this.ribbonControl.Items.Add(bbiEdit);
								DevExpress.XtraBars.BarButtonItem bbiDelete = new DevExpress.XtraBars.BarButtonItem();
			bbiDelete.Caption = "Delete";
			bbiDelete.Name = "bbiDelete";
			bbiDelete.ImageUri.Uri = "Delete";
						this.ribbonControl.Items.Add(bbiDelete);
										DevExpress.XtraBars.BarButtonItem bbiRefresh = new DevExpress.XtraBars.BarButtonItem();
			bbiRefresh.Caption = "Refresh";
			bbiRefresh.Name = "bbiRefresh";
			bbiRefresh.ImageUri.Uri = "Refresh";
						this.ribbonControl.Items.Add(bbiRefresh);
	
            // 
            // ribbonPage1
            // 
            this.ribbonPage1.Groups.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPageGroup[] {
            this.ribbonPageGroup1,
            this.ribbonPageGroup2});
			this.ribbonPage1.MergeOrder = 0;
            this.ribbonPage1.Name = "ribbonPage1";
            this.ribbonPage1.Text = "Home";
            // 
            // ribbonPageGroup1
            // 
            this.ribbonPageGroup1.AllowTextClipping = false;
            this.ribbonPageGroup1.Name = "ribbonPageGroup1";
            this.ribbonPageGroup1.ShowCaptionButton = false;
            this.ribbonPageGroup1.Text = "order_user Tasks";
								this.ribbonPageGroup1.ItemLinks.Add(bbiNew);
			this.ribbonPageGroup1.ItemLinks.Add(bbiEdit);
			this.ribbonPageGroup1.ItemLinks.Add(bbiDelete);
					this.ribbonPageGroup1.ItemLinks.Add(bbiRefresh);
	
			// 
            // ribbonPageGroup2
            // 
            this.ribbonPageGroup2.ItemLinks.Add(this.bbiPrintPreview);
            this.ribbonPageGroup2.Name = "ribbonPageGroup2";
            this.ribbonPageGroup2.Text = "Print and Export";
			this.ribbonPageGroup2.AllowTextClipping = false;
			this.ribbonPageGroup2.ShowCaptionButton = false;
			// 
            // ribbonStatusBar
            // 
            this.ribbonStatusBar.ItemLinks.Add(this.bsiRecordsCount);
            this.ribbonStatusBar.Name = "ribbonStatusBar";
            this.ribbonStatusBar.Ribbon = this.ribbonControl;
			// 
            // bbiPrintPreview
            // 
            this.bbiPrintPreview.Caption = "Print Preview";
            this.bbiPrintPreview.ImageUri.Uri = "Preview";
            this.bbiPrintPreview.Name = "bbiPrintPreview";
			// 
            // barStaticItem1
            // 
            this.bsiRecordsCount.Caption = "RECORDS : 2";
            this.bsiRecordsCount.Name = "bsiRecordsCount";
            this.bsiRecordsCount.TextAlignment = System.Drawing.StringAlignment.Near;
			// 
            // gridControl
            // 
            this.gridControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gridControl.Location = new System.Drawing.Point(5, 116);
            this.gridControl.MainView = this.gridView;
            this.gridControl.MenuManager = this.ribbonControl;
            this.gridControl.Name = "gridControl";
            this.gridControl.Size = new System.Drawing.Size(779, 311);
            this.gridControl.TabIndex = 2;
            this.gridControl.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.gridView});
            // 
            // gridView
            // 
            this.gridView.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.NoBorder;
            this.gridView.GridControl = this.gridControl;
            this.gridView.Name = "gridView";
            this.gridView.OptionsBehavior.Editable = false;
            this.gridView.OptionsBehavior.ReadOnly = true;
			this.order_userCollectionViewBindingSource = new System.Windows.Forms.BindingSource(this.components);
			this.order_userCollectionViewBindingSource.DataSource = typeof(PSS_WINFORM_CONTROL.order_user);
			this.gridControl.DataSource = order_userCollectionViewBindingSource;

			DevExpress.XtraGrid.Extensions.PopulateColumnsParameters parameters = new DevExpress.XtraGrid.Extensions.PopulateColumnsParameters();
						//
			//order
			//
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters orderPopulateColumnParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            orderPopulateColumnParameters.FieldName = "order";
            orderPopulateColumnParameters.Path = "order.id";
			parameters.CustomColumnParameters.Add(orderPopulateColumnParameters);
						DevExpress.XtraGrid.Extensions.PopulateColumnParameters orderPopulateColumnParameters_NotGenerate = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            orderPopulateColumnParameters_NotGenerate.FieldName = "order_id";
		    orderPopulateColumnParameters_NotGenerate.ColumnVisible = false;
			parameters.CustomColumnParameters.Add(orderPopulateColumnParameters_NotGenerate);
									//
			//user
			//
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters userPopulateColumnParameters = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            userPopulateColumnParameters.FieldName = "user";
            userPopulateColumnParameters.Path = "user.first_name";
			parameters.CustomColumnParameters.Add(userPopulateColumnParameters);
						DevExpress.XtraGrid.Extensions.PopulateColumnParameters userPopulateColumnParameters_NotGenerate = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            userPopulateColumnParameters_NotGenerate.FieldName = "user_id";
		    userPopulateColumnParameters_NotGenerate.ColumnVisible = false;
			parameters.CustomColumnParameters.Add(userPopulateColumnParameters_NotGenerate);
										
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters orderPopulateColumnParameters_NotVisible = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            orderPopulateColumnParameters_NotVisible.FieldName = "order";
		    orderPopulateColumnParameters_NotVisible.ColumnVisible = false;
			parameters.CustomColumnParameters.Add(orderPopulateColumnParameters_NotVisible);
				
			DevExpress.XtraGrid.Extensions.PopulateColumnParameters userPopulateColumnParameters_NotVisible = new DevExpress.XtraGrid.Extensions.PopulateColumnParameters();
            userPopulateColumnParameters_NotVisible.FieldName = "user";
		    userPopulateColumnParameters_NotVisible.ColumnVisible = false;
			parameters.CustomColumnParameters.Add(userPopulateColumnParameters_NotVisible);
			 
			this.gridView.PopulateColumns(typeof(PSS_WINFORM_CONTROL.order_user),parameters);
			// 
            // popupMenu1
            // 
								this.popupMenu.ItemLinks.Add(bbiNew);
			this.popupMenu.ItemLinks.Add(bbiEdit);
			this.popupMenu.ItemLinks.Add(bbiDelete);
					this.popupMenu.ItemLinks.Add(bbiRefresh);
	
            this.popupMenu.Name = "popupMenu";
            this.popupMenu.Ribbon = this.ribbonControl;
		    // 
            // mvvmContext
            // 
            this.mvvmContext.ContainerControl = this;
            this.mvvmContext.ViewModelType = typeof(PSS_WINFORM_CONTROL.ViewModels.order_userCollectionViewModel);
								this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_userCollectionViewModel), "New", bbiNew));
			this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateParameterizedCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_userCollectionViewModel), "Edit", "SelectedEntity", bbiEdit));
			this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateParameterizedCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_userCollectionViewModel), "Delete", "SelectedEntity", bbiDelete));
					this.mvvmContext.BindingExpressions.Add(DevExpress.Utils.MVVM.BindingExpression.CreateCommandBinding(typeof(PSS_WINFORM_CONTROL.ViewModels.order_userCollectionViewModel), "Refresh", bbiRefresh));
	
			this.mvvmContext.RegistrationExpressions.AddRange(new DevExpress.Utils.MVVM.RegistrationExpression[] {
            DevExpress.Utils.MVVM.RegistrationExpression.RegisterLayoutSerializationService(null, false, DevExpress.Utils.DefaultBoolean.Default, this.gridControl),
            DevExpress.Utils.MVVM.RegistrationExpression.RegisterWindowedDocumentManagerService(null, false, this, DevExpress.Utils.MVVM.Services.DefaultWindowedDocumentManagerServiceType.XtraForm, null)});
			//
			//order_userCollectionView
			//
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.Controls.Add(this.ribbonStatusBar);
            this.Controls.Add(this.gridControl);
			this.Controls.Add(this.ribbonControl);
			this.Size = new System.Drawing.Size(1024, 768);
            this.Name = "order_userCollectionView";
			((System.ComponentModel.ISupportInitialize)(this.gridControl)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ribbonControl)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.mvvmContext)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.popupMenu)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();
		}
		
        #endregion

		private DevExpress.XtraGrid.GridControl gridControl;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView;
		private DevExpress.Utils.MVVM.MVVMContext mvvmContext;
		private DevExpress.XtraBars.Ribbon.RibbonControl ribbonControl;
		private DevExpress.XtraBars.Ribbon.RibbonPage ribbonPage1;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup1;
		private System.Windows.Forms.BindingSource order_userCollectionViewBindingSource;
		private DevExpress.XtraBars.BarButtonItem bbiPrintPreview;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup2;
        private DevExpress.XtraBars.Ribbon.RibbonStatusBar ribbonStatusBar;
        private DevExpress.XtraBars.BarStaticItem bsiRecordsCount;
		private DevExpress.XtraBars.PopupMenu popupMenu;
	}
}
