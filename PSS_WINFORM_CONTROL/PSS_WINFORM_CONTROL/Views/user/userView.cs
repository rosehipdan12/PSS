using System;
using System.Linq;
using System.Collections.Generic;
using DevExpress.XtraEditors;
using DevExpress.Utils.MVVM;
using DevExpress.Utils.MVVM.Services;
using DevExpress.XtraGrid.Views.Grid;
using DevExpress.XtraGrid.Views.Base;

namespace PSS_WINFORM_CONTROL.Views.userView{
    public partial class userView : XtraUserControl {
        public userView() {
            InitializeComponent();
			if(!mvvmContext.IsDesignMode)
				InitBindings();
		}
		void InitBindings() {
		    var fluentAPI = mvvmContext.OfType<PSS_WINFORM_CONTROL.ViewModels.userViewModel>();
			fluentAPI.WithEvent(this, "Load").EventToCommand(x => x.OnLoaded());
            fluentAPI.SetObjectDataSourceBinding(
                userViewBindingSource, x => x.Entity, x => x.Update());
						#region order_user Detail Collection
			// We want to synchronize the ViewModel.SelectedEntity and the GridView.FocusedRowRandle in two-way manner
            fluentAPI.WithEvent<GridView, FocusedRowObjectChangedEventArgs>(order_userGridView, "FocusedRowObjectChanged")
                .SetBinding(x => x.userorder_userDetails.SelectedEntity,
                    args => args.Row as PSS_WINFORM_CONTROL.order_user,
                    (gView, entity) => gView.FocusedRowHandle = gView.FindRow(entity));
						// We want to proceed the Edit command when row double-clicked
			fluentAPI.WithEvent<RowClickEventArgs>(order_userGridView, "RowClick")
						.EventToCommand(
						    x => x.userorder_userDetails.Edit(null), x => x.userorder_userDetails.SelectedEntity,
						    args => (args.Clicks == 2) && (args.Button == System.Windows.Forms.MouseButtons.Left));
						//We want to show PopupMenu when row clicked by right button
			order_userGridView.RowClick += (s, e) => {
                if(e.Clicks == 1 && e.Button == System.Windows.Forms.MouseButtons.Right) {
                    order_userPopUpMenu.ShowPopup(order_userGridControl.PointToScreen(e.Location), s);
                }
            };
			// We want to show the userorder_userDetails collection in grid and react on this collection external changes (Reload, server-side Filtering)
			fluentAPI.SetBinding(order_userGridControl, g => g.DataSource, x => x.userorder_userDetails.Entities);
				
														fluentAPI.BindCommand(bbiorder_userNew, x => x.userorder_userDetails.New());
																													fluentAPI.BindCommand(bbiorder_userEdit,x => x.userorder_userDetails.Edit(null), x=>x.userorder_userDetails.SelectedEntity);
																								fluentAPI.BindCommand(bbiorder_userDelete,x => x.userorder_userDetails.Delete(null), x=>x.userorder_userDetails.SelectedEntity);
																			fluentAPI.BindCommand(bbiorder_userRefresh, x => x.userorder_userDetails.Refresh());
																	#endregion
									// Binding for role LookUp editor
			fluentAPI.SetBinding(roleLookUpEdit.Properties, p => p.DataSource, x => x.LookUproles.Entities);
			 
			bbiCustomize.ItemClick += (s, e) => { dataLayoutControl1.ShowCustomizationForm(); };
       }
    }
}
