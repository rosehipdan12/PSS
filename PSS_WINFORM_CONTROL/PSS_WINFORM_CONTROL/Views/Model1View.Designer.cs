namespace PSS_WINFORM_CONTROL.Views.Model1View {
    partial class Model1View {
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
			this.documentManager = new DevExpress.XtraBars.Docking2010.DocumentManager();
            this.tabbedView = new DevExpress.XtraBars.Docking2010.Views.Tabbed.TabbedView();
			this.mvvmContext = new DevExpress.Utils.MVVM.MVVMContext(this.components);
			this.ribbonControl = new DevExpress.XtraBars.Ribbon.RibbonControl();
			this.ribbonPage = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.ribbonPageGroup = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
			this.ribbonStatusBar = new DevExpress.XtraBars.Ribbon.RibbonStatusBar();
			this.ribbonPageGroupNavigation = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
			this.barSubItemNavigation = new DevExpress.XtraBars.BarSubItem();
			this.skinRibbonGalleryBarItem = new DevExpress.XtraBars.SkinRibbonGalleryBarItem();
			this.officeNavigationBar = new DevExpress.XtraBars.Navigation.OfficeNavigationBar();
            this.navigationFrame = new DevExpress.XtraBars.Navigation.NavigationFrame();
									this.navigationBarItemcategoryCollectionView = new DevExpress.XtraBars.Navigation.NavigationBarItem();
			this.barButtonItemcategoryCollectionView = new DevExpress.XtraBars.BarButtonItem();
						this.navigationBarItemitemCollectionView = new DevExpress.XtraBars.Navigation.NavigationBarItem();
			this.barButtonItemitemCollectionView = new DevExpress.XtraBars.BarButtonItem();
						this.navigationBarItemorder_productCollectionView = new DevExpress.XtraBars.Navigation.NavigationBarItem();
			this.barButtonItemorder_productCollectionView = new DevExpress.XtraBars.BarButtonItem();
						this.navigationBarItemorderCollectionView = new DevExpress.XtraBars.Navigation.NavigationBarItem();
			this.barButtonItemorderCollectionView = new DevExpress.XtraBars.BarButtonItem();
						this.navigationBarItemorder_userCollectionView = new DevExpress.XtraBars.Navigation.NavigationBarItem();
			this.barButtonItemorder_userCollectionView = new DevExpress.XtraBars.BarButtonItem();
						this.navigationBarItemuserCollectionView = new DevExpress.XtraBars.Navigation.NavigationBarItem();
			this.barButtonItemuserCollectionView = new DevExpress.XtraBars.BarButtonItem();
						this.navigationBarItemroleCollectionView = new DevExpress.XtraBars.Navigation.NavigationBarItem();
			this.barButtonItemroleCollectionView = new DevExpress.XtraBars.BarButtonItem();
						this.navigationBarItempetCollectionView = new DevExpress.XtraBars.Navigation.NavigationBarItem();
			this.barButtonItempetCollectionView = new DevExpress.XtraBars.BarButtonItem();
						this.navigationBarItemspeciesCollectionView = new DevExpress.XtraBars.Navigation.NavigationBarItem();
			this.barButtonItemspeciesCollectionView = new DevExpress.XtraBars.BarButtonItem();
						this.navigationBarItemsupplierCollectionView = new DevExpress.XtraBars.Navigation.NavigationBarItem();
			this.barButtonItemsupplierCollectionView = new DevExpress.XtraBars.BarButtonItem();
						this.navigationBarItemsysdiagramCollectionView = new DevExpress.XtraBars.Navigation.NavigationBarItem();
			this.barButtonItemsysdiagramCollectionView = new DevExpress.XtraBars.BarButtonItem();
						            ((System.ComponentModel.ISupportInitialize)(this.mvvmContext)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ribbonControl)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.officeNavigationBar)).BeginInit();
            this.SuspendLayout();
			// 
            // ribbonControl
            // 
            this.ribbonControl.ExpandCollapseItem.Id = 0;
            this.ribbonControl.MaxItemId = 14;
            this.ribbonControl.Name = "ribbonControl";
			this.ribbonControl.Items.AddRange(new DevExpress.XtraBars.BarItem[] {this.skinRibbonGalleryBarItem, this.barSubItemNavigation });
			this.ribbonControl.Pages.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPage[] {
            this.ribbonPage});
            this.ribbonControl.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonControlStyle.Office2013;
            this.ribbonControl.ShowApplicationButton = DevExpress.Utils.DefaultBoolean.False;
			this.ribbonControl.MdiMergeStyle = DevExpress.XtraBars.Ribbon.RibbonMdiMergeStyle.Always;
            this.ribbonControl.ToolbarLocation = DevExpress.XtraBars.Ribbon.RibbonQuickAccessToolbarLocation.Hidden;
			this.ribbonControl.StatusBar = this.ribbonStatusBar;
            // 
            // ribbonPage
            // 
            this.ribbonPage.Groups.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPageGroup[] {
			this.ribbonPageGroupNavigation,
            this.ribbonPageGroup});
			this.ribbonPage.MergeOrder = -1;
            this.ribbonPage.Name = "ribbonPage";
            this.ribbonPage.Text = "View";
			// 
            // ribbonPageGroupNavigation
            // 
            this.ribbonPageGroupNavigation.ItemLinks.Add(this.barSubItemNavigation);
            this.ribbonPageGroupNavigation.Name = "ribbonPageGroupNavigation";
            this.ribbonPageGroupNavigation.Text = "Module";
			 // 
            // barSubItemNavigation
            // 
            this.barSubItemNavigation.Caption = "Navigation";
            this.barSubItemNavigation.ImageUri.Uri = "NavigationBar";
            this.barSubItemNavigation.Name = "barSubItemNavigation";
			            // 
            // ribbonPageGroup
            // 
            this.ribbonPageGroup.AllowTextClipping = false;
			this.ribbonPageGroup.ItemLinks.Add(this.skinRibbonGalleryBarItem);
            this.ribbonPageGroup.Name = "ribbonPageGroup";
            this.ribbonPageGroup.ShowCaptionButton = false;
            this.ribbonPageGroup.Text = "Appearance";
			// 
            // ribbonStatusBar
            // 
			this.ribbonStatusBar.Name = "ribbonStatusBar";
            this.ribbonStatusBar.Ribbon = this.ribbonControl;
			// 
            // officeNavigationBar
            //
			this.officeNavigationBar.Dock = System.Windows.Forms.DockStyle.Bottom; 
            this.officeNavigationBar.Items.AddRange(new DevExpress.XtraBars.Navigation.NavigationBarItem[] {
            			this.navigationBarItemcategoryCollectionView,
						this.navigationBarItemitemCollectionView,
						this.navigationBarItemorder_productCollectionView,
						this.navigationBarItemorderCollectionView,
						this.navigationBarItemorder_userCollectionView,
						this.navigationBarItemuserCollectionView,
						this.navigationBarItemroleCollectionView,
						this.navigationBarItempetCollectionView,
						this.navigationBarItemspeciesCollectionView,
						this.navigationBarItemsupplierCollectionView,
						this.navigationBarItemsysdiagramCollectionView,
									
			});
            this.officeNavigationBar.Name = "officeNavigationBar";
            this.officeNavigationBar.Text = "officeNavigationBar";
						// 
            // navigationBarItemcategoryCollectionView
            // 
			this.navigationBarItemcategoryCollectionView.Name = "navigationBarItemcategoryCollectionView";
            this.navigationBarItemcategoryCollectionView.Text = "categories";
			// 
            // barButtonItemcategoryCollectionView
            // 
			this.barButtonItemcategoryCollectionView.Name = "barButtonItemcategoryCollectionView";
            this.barButtonItemcategoryCollectionView.Caption = "categories";
											this.barSubItemNavigation.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItemcategoryCollectionView));
					
						// 
            // navigationBarItemitemCollectionView
            // 
			this.navigationBarItemitemCollectionView.Name = "navigationBarItemitemCollectionView";
            this.navigationBarItemitemCollectionView.Text = "items";
			// 
            // barButtonItemitemCollectionView
            // 
			this.barButtonItemitemCollectionView.Name = "barButtonItemitemCollectionView";
            this.barButtonItemitemCollectionView.Caption = "items";
											this.barSubItemNavigation.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItemitemCollectionView));
					
						// 
            // navigationBarItemorder_productCollectionView
            // 
			this.navigationBarItemorder_productCollectionView.Name = "navigationBarItemorder_productCollectionView";
            this.navigationBarItemorder_productCollectionView.Text = "order product";
			// 
            // barButtonItemorder_productCollectionView
            // 
			this.barButtonItemorder_productCollectionView.Name = "barButtonItemorder_productCollectionView";
            this.barButtonItemorder_productCollectionView.Caption = "order product";
											this.barSubItemNavigation.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItemorder_productCollectionView));
					
						// 
            // navigationBarItemorderCollectionView
            // 
			this.navigationBarItemorderCollectionView.Name = "navigationBarItemorderCollectionView";
            this.navigationBarItemorderCollectionView.Text = "orders";
			// 
            // barButtonItemorderCollectionView
            // 
			this.barButtonItemorderCollectionView.Name = "barButtonItemorderCollectionView";
            this.barButtonItemorderCollectionView.Caption = "orders";
											this.barSubItemNavigation.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItemorderCollectionView));
					
						// 
            // navigationBarItemorder_userCollectionView
            // 
			this.navigationBarItemorder_userCollectionView.Name = "navigationBarItemorder_userCollectionView";
            this.navigationBarItemorder_userCollectionView.Text = "order user";
			// 
            // barButtonItemorder_userCollectionView
            // 
			this.barButtonItemorder_userCollectionView.Name = "barButtonItemorder_userCollectionView";
            this.barButtonItemorder_userCollectionView.Caption = "order user";
											this.barSubItemNavigation.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItemorder_userCollectionView));
					
						// 
            // navigationBarItemuserCollectionView
            // 
			this.navigationBarItemuserCollectionView.Name = "navigationBarItemuserCollectionView";
            this.navigationBarItemuserCollectionView.Text = "users";
			// 
            // barButtonItemuserCollectionView
            // 
			this.barButtonItemuserCollectionView.Name = "barButtonItemuserCollectionView";
            this.barButtonItemuserCollectionView.Caption = "users";
											this.barSubItemNavigation.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItemuserCollectionView));
					
						// 
            // navigationBarItemroleCollectionView
            // 
			this.navigationBarItemroleCollectionView.Name = "navigationBarItemroleCollectionView";
            this.navigationBarItemroleCollectionView.Text = "roles";
			// 
            // barButtonItemroleCollectionView
            // 
			this.barButtonItemroleCollectionView.Name = "barButtonItemroleCollectionView";
            this.barButtonItemroleCollectionView.Caption = "roles";
											this.barSubItemNavigation.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItemroleCollectionView));
					
						// 
            // navigationBarItempetCollectionView
            // 
			this.navigationBarItempetCollectionView.Name = "navigationBarItempetCollectionView";
            this.navigationBarItempetCollectionView.Text = "pets";
			// 
            // barButtonItempetCollectionView
            // 
			this.barButtonItempetCollectionView.Name = "barButtonItempetCollectionView";
            this.barButtonItempetCollectionView.Caption = "pets";
											this.barSubItemNavigation.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItempetCollectionView));
					
						// 
            // navigationBarItemspeciesCollectionView
            // 
			this.navigationBarItemspeciesCollectionView.Name = "navigationBarItemspeciesCollectionView";
            this.navigationBarItemspeciesCollectionView.Text = "species";
			// 
            // barButtonItemspeciesCollectionView
            // 
			this.barButtonItemspeciesCollectionView.Name = "barButtonItemspeciesCollectionView";
            this.barButtonItemspeciesCollectionView.Caption = "species";
											this.barSubItemNavigation.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItemspeciesCollectionView));
					
						// 
            // navigationBarItemsupplierCollectionView
            // 
			this.navigationBarItemsupplierCollectionView.Name = "navigationBarItemsupplierCollectionView";
            this.navigationBarItemsupplierCollectionView.Text = "suppliers";
			// 
            // barButtonItemsupplierCollectionView
            // 
			this.barButtonItemsupplierCollectionView.Name = "barButtonItemsupplierCollectionView";
            this.barButtonItemsupplierCollectionView.Caption = "suppliers";
											this.barSubItemNavigation.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItemsupplierCollectionView));
					
						// 
            // navigationBarItemsysdiagramCollectionView
            // 
			this.navigationBarItemsysdiagramCollectionView.Name = "navigationBarItemsysdiagramCollectionView";
            this.navigationBarItemsysdiagramCollectionView.Text = "sysdiagrams";
			// 
            // barButtonItemsysdiagramCollectionView
            // 
			this.barButtonItemsysdiagramCollectionView.Name = "barButtonItemsysdiagramCollectionView";
            this.barButtonItemsysdiagramCollectionView.Caption = "sysdiagrams";
											this.barSubItemNavigation.LinksPersistInfo.Add(new DevExpress.XtraBars.LinkPersistInfo(this.barButtonItemsysdiagramCollectionView));
					
							
			// 
            // mvvmContext
            // 
            this.mvvmContext.ContainerControl = this;
            this.mvvmContext.ViewModelType = typeof(PSS_WINFORM_CONTROL.ViewModels.Model1ViewModel);
			 // 
            // navigationFrame
            // 
            this.navigationFrame.Dock = System.Windows.Forms.DockStyle.Fill;
            this.navigationFrame.Name = "navigationFrame";
            this.navigationFrame.RibbonAndBarsMergeStyle = DevExpress.XtraBars.Docking2010.Views.RibbonAndBarsMergeStyle.Always;
            this.navigationFrame.Text = "navigationFrame";
			// 
            // Model1View
            // 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.Controls.Add(this.navigationFrame);
            this.Controls.Add(this.officeNavigationBar);
            this.Controls.Add(this.ribbonStatusBar);
            this.Controls.Add(this.ribbonControl);
			this.Size = new System.Drawing.Size(1024, 768);
            this.Name = "Model1View";
            ((System.ComponentModel.ISupportInitialize)(this.mvvmContext)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ribbonControl)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.officeNavigationBar)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();
		}
		
        #endregion

		private DevExpress.XtraBars.Docking2010.DocumentManager documentManager;
        private DevExpress.XtraBars.Docking2010.Views.Tabbed.TabbedView tabbedView;
		private DevExpress.Utils.MVVM.MVVMContext mvvmContext;
		private DevExpress.XtraBars.Ribbon.RibbonControl ribbonControl;
		private DevExpress.XtraBars.Ribbon.RibbonPage ribbonPage;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup;
		private DevExpress.XtraBars.Ribbon.RibbonStatusBar ribbonStatusBar;
		private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroupNavigation;
		private DevExpress.XtraBars.BarSubItem barSubItemNavigation;
		private DevExpress.XtraBars.SkinRibbonGalleryBarItem skinRibbonGalleryBarItem;
		private DevExpress.XtraBars.Navigation.OfficeNavigationBar officeNavigationBar;
        private DevExpress.XtraBars.Navigation.NavigationFrame navigationFrame; 
						private DevExpress.XtraBars.Navigation.NavigationBarItem navigationBarItemcategoryCollectionView;
		private DevExpress.XtraBars.BarButtonItem  barButtonItemcategoryCollectionView;
				private DevExpress.XtraBars.Navigation.NavigationBarItem navigationBarItemitemCollectionView;
		private DevExpress.XtraBars.BarButtonItem  barButtonItemitemCollectionView;
				private DevExpress.XtraBars.Navigation.NavigationBarItem navigationBarItemorder_productCollectionView;
		private DevExpress.XtraBars.BarButtonItem  barButtonItemorder_productCollectionView;
				private DevExpress.XtraBars.Navigation.NavigationBarItem navigationBarItemorderCollectionView;
		private DevExpress.XtraBars.BarButtonItem  barButtonItemorderCollectionView;
				private DevExpress.XtraBars.Navigation.NavigationBarItem navigationBarItemorder_userCollectionView;
		private DevExpress.XtraBars.BarButtonItem  barButtonItemorder_userCollectionView;
				private DevExpress.XtraBars.Navigation.NavigationBarItem navigationBarItemuserCollectionView;
		private DevExpress.XtraBars.BarButtonItem  barButtonItemuserCollectionView;
				private DevExpress.XtraBars.Navigation.NavigationBarItem navigationBarItemroleCollectionView;
		private DevExpress.XtraBars.BarButtonItem  barButtonItemroleCollectionView;
				private DevExpress.XtraBars.Navigation.NavigationBarItem navigationBarItempetCollectionView;
		private DevExpress.XtraBars.BarButtonItem  barButtonItempetCollectionView;
				private DevExpress.XtraBars.Navigation.NavigationBarItem navigationBarItemspeciesCollectionView;
		private DevExpress.XtraBars.BarButtonItem  barButtonItemspeciesCollectionView;
				private DevExpress.XtraBars.Navigation.NavigationBarItem navigationBarItemsupplierCollectionView;
		private DevExpress.XtraBars.BarButtonItem  barButtonItemsupplierCollectionView;
				private DevExpress.XtraBars.Navigation.NavigationBarItem navigationBarItemsysdiagramCollectionView;
		private DevExpress.XtraBars.BarButtonItem  barButtonItemsysdiagramCollectionView;
					}
}
