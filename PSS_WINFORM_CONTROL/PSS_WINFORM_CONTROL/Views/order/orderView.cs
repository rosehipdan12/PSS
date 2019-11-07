using System;
using System.Linq;
using System.Collections.Generic;
using DevExpress.XtraEditors;
using DevExpress.Utils.MVVM;
using DevExpress.Utils.MVVM.Services;
using DevExpress.XtraGrid.Views.Grid;
using DevExpress.XtraGrid.Views.Base;

namespace PSS_WINFORM_CONTROL.Views.orderView{
    public partial class orderView : XtraUserControl {
        public orderView() {
            InitializeComponent();
			if(!mvvmContext.IsDesignMode)
				InitBindings();
		}
		void InitBindings() {
		    var fluentAPI = mvvmContext.OfType<PSS_WINFORM_CONTROL.ViewModels.orderViewModel>();
			fluentAPI.WithEvent(this, "Load").EventToCommand(x => x.OnLoaded());
            fluentAPI.SetObjectDataSourceBinding(
                orderViewBindingSource, x => x.Entity, x => x.Update());
						#region order_product Detail Collection
			// We want to synchronize the ViewModel.SelectedEntity and the GridView.FocusedRowRandle in two-way manner
            fluentAPI.WithEvent<GridView, FocusedRowObjectChangedEventArgs>(order_productGridView, "FocusedRowObjectChanged")
                .SetBinding(x => x.orderorder_productDetails.SelectedEntity,
                    args => args.Row as PSS_WINFORM_CONTROL.order_product,
                    (gView, entity) => gView.FocusedRowHandle = gView.FindRow(entity));
						// We want to proceed the Edit command when row double-clicked
			fluentAPI.WithEvent<RowClickEventArgs>(order_productGridView, "RowClick")
						.EventToCommand(
						    x => x.orderorder_productDetails.Edit(null), x => x.orderorder_productDetails.SelectedEntity,
						    args => (args.Clicks == 2) && (args.Button == System.Windows.Forms.MouseButtons.Left));
						//We want to show PopupMenu when row clicked by right button
			order_productGridView.RowClick += (s, e) => {
                if(e.Clicks == 1 && e.Button == System.Windows.Forms.MouseButtons.Right) {
                    order_productPopUpMenu.ShowPopup(order_productGridControl.PointToScreen(e.Location), s);
                }
            };
			// We want to show the orderorder_productDetails collection in grid and react on this collection external changes (Reload, server-side Filtering)
			fluentAPI.SetBinding(order_productGridControl, g => g.DataSource, x => x.orderorder_productDetails.Entities);

            fluentAPI.BindCommand(bbiorder_productNew, x => x.orderorder_productDetails.New());
																													fluentAPI.BindCommand(bbiorder_productEdit,x => x.orderorder_productDetails.Edit(null), x=>x.orderorder_productDetails.SelectedEntity);
																								fluentAPI.BindCommand(bbiorder_productDelete,x => x.orderorder_productDetails.Delete(null), x=>x.orderorder_productDetails.SelectedEntity);
																			fluentAPI.BindCommand(bbiorder_productRefresh, x => x.orderorder_productDetails.Refresh());
																	#endregion
						#region order_user Detail Collection
			// We want to synchronize the ViewModel.SelectedEntity and the GridView.FocusedRowRandle in two-way manner
            fluentAPI.WithEvent<GridView, FocusedRowObjectChangedEventArgs>(order_userGridView, "FocusedRowObjectChanged")
                .SetBinding(x => x.orderorder_userDetails.SelectedEntity,
                    args => args.Row as PSS_WINFORM_CONTROL.order_user,
                    (gView, entity) => gView.FocusedRowHandle = gView.FindRow(entity));
						// We want to proceed the Edit command when row double-clicked
			fluentAPI.WithEvent<RowClickEventArgs>(order_userGridView, "RowClick")
						.EventToCommand(
						    x => x.orderorder_userDetails.Edit(null), x => x.orderorder_userDetails.SelectedEntity,
						    args => (args.Clicks == 2) && (args.Button == System.Windows.Forms.MouseButtons.Left));
						//We want to show PopupMenu when row clicked by right button
			order_userGridView.RowClick += (s, e) => {
                if(e.Clicks == 1 && e.Button == System.Windows.Forms.MouseButtons.Right) {
                    order_userPopUpMenu.ShowPopup(order_userGridControl.PointToScreen(e.Location), s);
                }
            };
			// We want to show the orderorder_userDetails collection in grid and react on this collection external changes (Reload, server-side Filtering)
			fluentAPI.SetBinding(order_userGridControl, g => g.DataSource, x => x.orderorder_userDetails.Entities);
				
														fluentAPI.BindCommand(bbiorder_userNew, x => x.orderorder_userDetails.New());
																													fluentAPI.BindCommand(bbiorder_userEdit,x => x.orderorder_userDetails.Edit(null), x=>x.orderorder_userDetails.SelectedEntity);
																								fluentAPI.BindCommand(bbiorder_userDelete,x => x.orderorder_userDetails.Delete(null), x=>x.orderorder_userDetails.SelectedEntity);
																			fluentAPI.BindCommand(bbiorder_userRefresh, x => x.orderorder_userDetails.Refresh());
																	#endregion
						 
			bbiCustomize.ItemClick += (s, e) => { dataLayoutControl1.ShowCustomizationForm(); };
       }
    }
}
