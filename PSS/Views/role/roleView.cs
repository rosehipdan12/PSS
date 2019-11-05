using System;
using System.Linq;
using System.Collections.Generic;
using DevExpress.XtraEditors;
using DevExpress.Utils.MVVM;
using DevExpress.Utils.MVVM.Services;
using DevExpress.XtraGrid.Views.Grid;
using DevExpress.XtraGrid.Views.Base;

namespace test7.Views.roleView{
    public partial class roleView : XtraUserControl {
        public roleView() {
            InitializeComponent();
			if(!mvvmContext.IsDesignMode)
				InitBindings();
		}
		void InitBindings() {
		    var fluentAPI = mvvmContext.OfType<test7.ViewModels.roleViewModel>();
			fluentAPI.WithEvent(this, "Load").EventToCommand(x => x.OnLoaded());
            fluentAPI.SetObjectDataSourceBinding(
                roleViewBindingSource, x => x.Entity, x => x.Update());
						#region users Detail Collection
			// We want to synchronize the ViewModel.SelectedEntity and the GridView.FocusedRowRandle in two-way manner
            fluentAPI.WithEvent<GridView, FocusedRowObjectChangedEventArgs>(usersGridView, "FocusedRowObjectChanged")
                .SetBinding(x => x.roleusersDetails.SelectedEntity,
                    args => args.Row as test7.user,
                    (gView, entity) => gView.FocusedRowHandle = gView.FindRow(entity));
						// We want to proceed the Edit command when row double-clicked
			fluentAPI.WithEvent<RowClickEventArgs>(usersGridView, "RowClick")
						.EventToCommand(
						    x => x.roleusersDetails.Edit(null), x => x.roleusersDetails.SelectedEntity,
						    args => (args.Clicks == 2) && (args.Button == System.Windows.Forms.MouseButtons.Left));
						//We want to show PopupMenu when row clicked by right button
			usersGridView.RowClick += (s, e) => {
                if(e.Clicks == 1 && e.Button == System.Windows.Forms.MouseButtons.Right) {
                    usersPopUpMenu.ShowPopup(usersGridControl.PointToScreen(e.Location), s);
                }
            };
			// We want to show the roleusersDetails collection in grid and react on this collection external changes (Reload, server-side Filtering)
			fluentAPI.SetBinding(usersGridControl, g => g.DataSource, x => x.roleusersDetails.Entities);
				
														fluentAPI.BindCommand(bbiusersNew, x => x.roleusersDetails.New());
																													fluentAPI.BindCommand(bbiusersEdit,x => x.roleusersDetails.Edit(null), x=>x.roleusersDetails.SelectedEntity);
																								fluentAPI.BindCommand(bbiusersDelete,x => x.roleusersDetails.Delete(null), x=>x.roleusersDetails.SelectedEntity);
																			fluentAPI.BindCommand(bbiusersRefresh, x => x.roleusersDetails.Refresh());
																	#endregion
						 
			bbiCustomize.ItemClick += (s, e) => { dataLayoutControl1.ShowCustomizationForm(); };
       }
    }
}
