using System;
using System.Linq;
using System.Linq.Expressions;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using DevExpress.Mvvm;
using DevExpress.Mvvm.POCO;
using DevExpress.Mvvm.DataModel;
using DevExpress.Mvvm.ViewModel;
using PSS_WINFORM_CONTROL.Model1DataModel;
using PSS_WINFORM_CONTROL.Common;
using PSS_WINFORM_CONTROL;

namespace PSS_WINFORM_CONTROL.ViewModels {

    /// <summary>
    /// Represents the single supplier object view model.
    /// </summary>
    public partial class supplierViewModel : SingleObjectViewModel<supplier, int, IModel1UnitOfWork> {

        /// <summary>
        /// Creates a new instance of supplierViewModel as a POCO view model.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        public static supplierViewModel Create(IUnitOfWorkFactory<IModel1UnitOfWork> unitOfWorkFactory = null) {
            return ViewModelSource.Create(() => new supplierViewModel(unitOfWorkFactory));
        }

        /// <summary>
        /// Initializes a new instance of the supplierViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the supplierViewModel type without the POCO proxy factory.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        protected supplierViewModel(IUnitOfWorkFactory<IModel1UnitOfWork> unitOfWorkFactory = null)
            : base(unitOfWorkFactory ?? UnitOfWorkSource.GetUnitOfWorkFactory(), x => x.suppliers, x => x.name) {
                }


        /// <summary>
        /// The view model that contains a look-up collection of items for the corresponding navigation property in the view.
        /// </summary>
        public IEntitiesViewModel<item> LookUpitems {
            get {
                return GetLookUpEntitiesViewModel(
                    propertyExpression: (supplierViewModel x) => x.LookUpitems,
                    getRepositoryFunc: x => x.items);
            }
        }


        /// <summary>
        /// The view model for the supplieritems detail collection.
        /// </summary>
        public CollectionViewModelBase<item, item, int, IModel1UnitOfWork> supplieritemsDetails {
            get {
                return GetDetailsCollectionViewModel(
                    propertyExpression: (supplierViewModel x) => x.supplieritemsDetails,
                    getRepositoryFunc: x => x.items,
                    foreignKeyExpression: x => x.supplier_id,
                    navigationExpression: x => x.supplier);
            }
        }
    }
}
