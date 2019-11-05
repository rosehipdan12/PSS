using System;
using System.Linq;
using System.Collections.Generic;
using DevExpress.XtraEditors;
using DevExpress.Utils.MVVM;
using DevExpress.Utils.MVVM.Services;
using DevExpress.XtraGrid.Views.Grid;
using DevExpress.XtraGrid.Views.Base;

namespace test7.Views.supplierView{
    public partial class supplierView : XtraUserControl {
        public supplierView() {
            InitializeComponent();
			if(!mvvmContext.IsDesignMode)
				InitBindings();
		}
		void InitBindings() {
		    var fluentAPI = mvvmContext.OfType<test7.ViewModels.supplierViewModel>();
			fluentAPI.WithEvent(this, "Load").EventToCommand(x => x.OnLoaded());
            fluentAPI.SetObjectDataSourceBinding(
                supplierViewBindingSource, x => x.Entity, x => x.Update());
						#region items Detail Collection
			// We want to synchronize the ViewModel.SelectedEntity and the GridView.FocusedRowRandle in two-way manner
            fluentAPI.WithEvent<GridView, FocusedRowObjectChangedEventArgs>(itemsGridView, "FocusedRowObjectChanged")
                .SetBinding(x => x.supplieritemsDetails.SelectedEntity,
                    args => args.Row as test7.item,
                    (gView, entity) => gView.FocusedRowHandle = gView.FindRow(entity));
						// We want to proceed the Edit command when row double-clicked
			fluentAPI.WithEvent<RowClickEventArgs>(itemsGridView, "RowClick")
						.EventToCommand(
						    x => x.supplieritemsDetails.Edit(null), x => x.supplieritemsDetails.SelectedEntity,
						    args => (args.Clicks == 2) && (args.Button == System.Windows.Forms.MouseButtons.Left));
						//We want to show PopupMenu when row clicked by right button
			itemsGridView.RowClick += (s, e) => {
                if(e.Clicks == 1 && e.Button == System.Windows.Forms.MouseButtons.Right) {
                    itemsPopUpMenu.ShowPopup(itemsGridControl.PointToScreen(e.Location), s);
                }
            };
			// We want to show the supplieritemsDetails collection in grid and react on this collection external changes (Reload, server-side Filtering)
			fluentAPI.SetBinding(itemsGridControl, g => g.DataSource, x => x.supplieritemsDetails.Entities);
				
														fluentAPI.BindCommand(bbiitemsNew, x => x.supplieritemsDetails.New());
																													fluentAPI.BindCommand(bbiitemsEdit,x => x.supplieritemsDetails.Edit(null), x=>x.supplieritemsDetails.SelectedEntity);
																								fluentAPI.BindCommand(bbiitemsDelete,x => x.supplieritemsDetails.Delete(null), x=>x.supplieritemsDetails.SelectedEntity);
																			fluentAPI.BindCommand(bbiitemsRefresh, x => x.supplieritemsDetails.Refresh());
																	#endregion
						 
			bbiCustomize.ItemClick += (s, e) => { dataLayoutControl1.ShowCustomizationForm(); };
       }
    }
}
