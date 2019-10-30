using System;
using System.Linq;
using System.Collections.Generic;
using DevExpress.XtraEditors;
using DevExpress.Utils.MVVM;
using DevExpress.Utils.MVVM.Services;
using DevExpress.XtraGrid.Views.Grid;
using DevExpress.XtraGrid.Views.Base;

namespace PSS.Views.speciesView{
    public partial class speciesView : XtraUserControl {
        public speciesView() {
            InitializeComponent();
			if(!mvvmContext.IsDesignMode)
				InitBindings();
		}
		void InitBindings() {
		    var fluentAPI = mvvmContext.OfType<PSS.ViewModels.speciesViewModel>();
			fluentAPI.WithEvent(this, "Load").EventToCommand(x => x.OnLoaded());
            fluentAPI.SetObjectDataSourceBinding(
                speciesViewBindingSource, x => x.Entity, x => x.Update());
						#region pets Detail Collection
			// We want to synchronize the ViewModel.SelectedEntity and the GridView.FocusedRowRandle in two-way manner
            fluentAPI.WithEvent<GridView, FocusedRowObjectChangedEventArgs>(petsGridView, "FocusedRowObjectChanged")
                .SetBinding(x => x.speciespetsDetails.SelectedEntity,
                    args => args.Row as PSS.pet,
                    (gView, entity) => gView.FocusedRowHandle = gView.FindRow(entity));
						// We want to proceed the Edit command when row double-clicked
			fluentAPI.WithEvent<RowClickEventArgs>(petsGridView, "RowClick")
						.EventToCommand(
						    x => x.speciespetsDetails.Edit(null), x => x.speciespetsDetails.SelectedEntity,
						    args => (args.Clicks == 2) && (args.Button == System.Windows.Forms.MouseButtons.Left));
						//We want to show PopupMenu when row clicked by right button
			petsGridView.RowClick += (s, e) => {
                if(e.Clicks == 1 && e.Button == System.Windows.Forms.MouseButtons.Right) {
                    petsPopUpMenu.ShowPopup(petsGridControl.PointToScreen(e.Location), s);
                }
            };
			// We want to show the speciespetsDetails collection in grid and react on this collection external changes (Reload, server-side Filtering)
			fluentAPI.SetBinding(petsGridControl, g => g.DataSource, x => x.speciespetsDetails.Entities);
				
														fluentAPI.BindCommand(bbipetsNew, x => x.speciespetsDetails.New());
																													fluentAPI.BindCommand(bbipetsEdit,x => x.speciespetsDetails.Edit(null), x=>x.speciespetsDetails.SelectedEntity);
																								fluentAPI.BindCommand(bbipetsDelete,x => x.speciespetsDetails.Delete(null), x=>x.speciespetsDetails.SelectedEntity);
																			fluentAPI.BindCommand(bbipetsRefresh, x => x.speciespetsDetails.Refresh());
																	#endregion
						 
			bbiCustomize.ItemClick += (s, e) => { dataLayoutControl1.ShowCustomizationForm(); };
       }
    }
}
