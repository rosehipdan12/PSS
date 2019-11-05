using System;
using System.Linq;
using System.Collections.Generic;
using DevExpress.XtraEditors;
using DevExpress.Utils.MVVM;
using DevExpress.Utils.MVVM.Services;
using DevExpress.XtraGrid.Views.Grid;
using DevExpress.XtraGrid.Views.Base;

namespace test7.Views.petView{
    public partial class petView : XtraUserControl {
        public petView() {
            InitializeComponent();
			if(!mvvmContext.IsDesignMode)
				InitBindings();
		}
		void InitBindings() {
		    var fluentAPI = mvvmContext.OfType<test7.ViewModels.petViewModel>();
			fluentAPI.WithEvent(this, "Load").EventToCommand(x => x.OnLoaded());
            fluentAPI.SetObjectDataSourceBinding(
                petViewBindingSource, x => x.Entity, x => x.Update());
						#region order_product Detail Collection
			// We want to synchronize the ViewModel.SelectedEntity and the GridView.FocusedRowRandle in two-way manner
            fluentAPI.WithEvent<GridView, FocusedRowObjectChangedEventArgs>(order_productGridView, "FocusedRowObjectChanged")
                .SetBinding(x => x.petorder_productDetails.SelectedEntity,
                    args => args.Row as test7.order_product,
                    (gView, entity) => gView.FocusedRowHandle = gView.FindRow(entity));
						// We want to proceed the Edit command when row double-clicked
			fluentAPI.WithEvent<RowClickEventArgs>(order_productGridView, "RowClick")
						.EventToCommand(
						    x => x.petorder_productDetails.Edit(null), x => x.petorder_productDetails.SelectedEntity,
						    args => (args.Clicks == 2) && (args.Button == System.Windows.Forms.MouseButtons.Left));
						//We want to show PopupMenu when row clicked by right button
			order_productGridView.RowClick += (s, e) => {
                if(e.Clicks == 1 && e.Button == System.Windows.Forms.MouseButtons.Right) {
                    order_productPopUpMenu.ShowPopup(order_productGridControl.PointToScreen(e.Location), s);
                }
            };
			// We want to show the petorder_productDetails collection in grid and react on this collection external changes (Reload, server-side Filtering)
			fluentAPI.SetBinding(order_productGridControl, g => g.DataSource, x => x.petorder_productDetails.Entities);
				
														fluentAPI.BindCommand(bbiorder_productNew, x => x.petorder_productDetails.New());
																													fluentAPI.BindCommand(bbiorder_productEdit,x => x.petorder_productDetails.Edit(null), x=>x.petorder_productDetails.SelectedEntity);
																								fluentAPI.BindCommand(bbiorder_productDelete,x => x.petorder_productDetails.Delete(null), x=>x.petorder_productDetails.SelectedEntity);
																			fluentAPI.BindCommand(bbiorder_productRefresh, x => x.petorder_productDetails.Refresh());
																	#endregion
									// Binding for species LookUp editor
			fluentAPI.SetBinding(speciesLookUpEdit.Properties, p => p.DataSource, x => x.LookUpspecies.Entities);
			 
			bbiCustomize.ItemClick += (s, e) => { dataLayoutControl1.ShowCustomizationForm(); };
       }
    }
}
