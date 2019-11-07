using System;
using System.Linq;
using System.Collections.Generic;
using DevExpress.XtraEditors;
using DevExpress.Utils.MVVM;
using DevExpress.Utils.MVVM.Services;
using DevExpress.XtraGrid.Views.Grid;
using DevExpress.XtraGrid.Views.Base;

namespace PSS_WINFORM_CONTROL.Views.order_userView{
    public partial class order_userView : XtraUserControl {
        public order_userView() {
            InitializeComponent();
			if(!mvvmContext.IsDesignMode)
				InitBindings();
		}
		void InitBindings() {
		    var fluentAPI = mvvmContext.OfType<PSS_WINFORM_CONTROL.ViewModels.order_userViewModel>();
			fluentAPI.WithEvent(this, "Load").EventToCommand(x => x.OnLoaded());
            fluentAPI.SetObjectDataSourceBinding(
                order_userViewBindingSource, x => x.Entity, x => x.Update());
									// Binding for order LookUp editor
			fluentAPI.SetBinding(orderLookUpEdit.Properties, p => p.DataSource, x => x.LookUporders.Entities);
						// Binding for user LookUp editor
			fluentAPI.SetBinding(userLookUpEdit.Properties, p => p.DataSource, x => x.LookUpusers.Entities);
			 
			bbiCustomize.ItemClick += (s, e) => { dataLayoutControl1.ShowCustomizationForm(); };
       }
    }
}
