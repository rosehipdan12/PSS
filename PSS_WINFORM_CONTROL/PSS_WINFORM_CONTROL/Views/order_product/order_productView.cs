using System;
using System.Linq;
using System.Collections.Generic;
using DevExpress.XtraEditors;
using DevExpress.Utils.MVVM;
using DevExpress.Utils.MVVM.Services;
using DevExpress.XtraGrid.Views.Grid;
using DevExpress.XtraGrid.Views.Base;

namespace PSS_WINFORM_CONTROL.Views.order_productView{
    public partial class order_productView : XtraUserControl {
        public order_productView() {
            InitializeComponent();
			if(!mvvmContext.IsDesignMode)
				InitBindings();
		}
		void InitBindings() {
		    var fluentAPI = mvvmContext.OfType<PSS_WINFORM_CONTROL.ViewModels.order_productViewModel>();
			fluentAPI.WithEvent(this, "Load").EventToCommand(x => x.OnLoaded());
            fluentAPI.SetObjectDataSourceBinding(
                order_productViewBindingSource, x => x.Entity, x => x.Update());
									// Binding for item LookUp editor
			fluentAPI.SetBinding(itemLookUpEdit.Properties, p => p.DataSource, x => x.LookUpitems.Entities);
						// Binding for order LookUp editor
			fluentAPI.SetBinding(orderLookUpEdit.Properties, p => p.DataSource, x => x.LookUporders.Entities);
						// Binding for pet LookUp editor
			fluentAPI.SetBinding(petLookUpEdit.Properties, p => p.DataSource, x => x.LookUppets.Entities);
			 
			bbiCustomize.ItemClick += (s, e) => { dataLayoutControl1.ShowCustomizationForm(); };
       }
    }
}
