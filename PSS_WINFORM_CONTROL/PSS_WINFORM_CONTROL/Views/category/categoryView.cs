using System;
using System.Linq;
using System.Collections.Generic;
using DevExpress.XtraEditors;
using DevExpress.Utils.MVVM;
using DevExpress.Utils.MVVM.Services;
using DevExpress.XtraGrid.Views.Grid;
using DevExpress.XtraGrid.Views.Base;

namespace PSS_WINFORM_CONTROL.Views.categoryView{
    public partial class categoryView : XtraUserControl {
        public categoryView() {
            InitializeComponent();
			if(!mvvmContext.IsDesignMode)
				InitBindings();
		}
		void InitBindings() {
		    var fluentAPI = mvvmContext.OfType<PSS_WINFORM_CONTROL.ViewModels.categoryViewModel>();
			fluentAPI.WithEvent(this, "Load").EventToCommand(x => x.OnLoaded());
            fluentAPI.SetObjectDataSourceBinding(
                categoryViewBindingSource, x => x.Entity, x => x.Update());
						#region category1 Detail Collection
			// We want to synchronize the ViewModel.SelectedEntity and the GridView.FocusedRowRandle in two-way manner
            fluentAPI.WithEvent<GridView, FocusedRowObjectChangedEventArgs>(category1GridView, "FocusedRowObjectChanged")
                .SetBinding(x => x.categorycategory1Details.SelectedEntity,
                    args => args.Row as PSS_WINFORM_CONTROL.category,
                    (gView, entity) => gView.FocusedRowHandle = gView.FindRow(entity));
						// We want to proceed the Edit command when row double-clicked
			fluentAPI.WithEvent<RowClickEventArgs>(category1GridView, "RowClick")
						.EventToCommand(
						    x => x.categorycategory1Details.Edit(null), x => x.categorycategory1Details.SelectedEntity,
						    args => (args.Clicks == 2) && (args.Button == System.Windows.Forms.MouseButtons.Left));
						//We want to show PopupMenu when row clicked by right button
			category1GridView.RowClick += (s, e) => {
                if(e.Clicks == 1 && e.Button == System.Windows.Forms.MouseButtons.Right) {
                    category1PopUpMenu.ShowPopup(category1GridControl.PointToScreen(e.Location), s);
                }
            };
			// We want to show the categorycategory1Details collection in grid and react on this collection external changes (Reload, server-side Filtering)
			fluentAPI.SetBinding(category1GridControl, g => g.DataSource, x => x.categorycategory1Details.Entities);
				
														fluentAPI.BindCommand(bbicategory1New, x => x.categorycategory1Details.New());
																													fluentAPI.BindCommand(bbicategory1Edit,x => x.categorycategory1Details.Edit(null), x=>x.categorycategory1Details.SelectedEntity);
																								fluentAPI.BindCommand(bbicategory1Delete,x => x.categorycategory1Details.Delete(null), x=>x.categorycategory1Details.SelectedEntity);
																			fluentAPI.BindCommand(bbicategory1Refresh, x => x.categorycategory1Details.Refresh());
																	#endregion
						#region items Detail Collection
			// We want to synchronize the ViewModel.SelectedEntity and the GridView.FocusedRowRandle in two-way manner
            fluentAPI.WithEvent<GridView, FocusedRowObjectChangedEventArgs>(itemsGridView, "FocusedRowObjectChanged")
                .SetBinding(x => x.categoryitemsDetails.SelectedEntity,
                    args => args.Row as PSS_WINFORM_CONTROL.item,
                    (gView, entity) => gView.FocusedRowHandle = gView.FindRow(entity));
						// We want to proceed the Edit command when row double-clicked
			fluentAPI.WithEvent<RowClickEventArgs>(itemsGridView, "RowClick")
						.EventToCommand(
						    x => x.categoryitemsDetails.Edit(null), x => x.categoryitemsDetails.SelectedEntity,
						    args => (args.Clicks == 2) && (args.Button == System.Windows.Forms.MouseButtons.Left));
						//We want to show PopupMenu when row clicked by right button
			itemsGridView.RowClick += (s, e) => {
                if(e.Clicks == 1 && e.Button == System.Windows.Forms.MouseButtons.Right) {
                    itemsPopUpMenu.ShowPopup(itemsGridControl.PointToScreen(e.Location), s);
                }
            };
			// We want to show the categoryitemsDetails collection in grid and react on this collection external changes (Reload, server-side Filtering)
			fluentAPI.SetBinding(itemsGridControl, g => g.DataSource, x => x.categoryitemsDetails.Entities);
				
														fluentAPI.BindCommand(bbiitemsNew, x => x.categoryitemsDetails.New());
																													fluentAPI.BindCommand(bbiitemsEdit,x => x.categoryitemsDetails.Edit(null), x=>x.categoryitemsDetails.SelectedEntity);
																								fluentAPI.BindCommand(bbiitemsDelete,x => x.categoryitemsDetails.Delete(null), x=>x.categoryitemsDetails.SelectedEntity);
																			fluentAPI.BindCommand(bbiitemsRefresh, x => x.categoryitemsDetails.Refresh());
																	#endregion
									// Binding for category2 LookUp editor
			fluentAPI.SetBinding(category2LookUpEdit.Properties, p => p.DataSource, x => x.LookUpcategories.Entities);
			 
			bbiCustomize.ItemClick += (s, e) => { dataLayoutControl1.ShowCustomizationForm(); };
       }
    }
}
