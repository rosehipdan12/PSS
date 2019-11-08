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
    /// Represents the single order_product object view model.
    /// </summary>
    public partial class order_productViewModel : SingleObjectViewModel<order_product, int, IModel1UnitOfWork> {

        /// <summary>
        /// Creates a new instance of order_productViewModel as a POCO view model.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        public static order_productViewModel Create(IUnitOfWorkFactory<IModel1UnitOfWork> unitOfWorkFactory = null) {
            return ViewModelSource.Create(() => new order_productViewModel(unitOfWorkFactory));
        }

        /// <summary>
        /// Initializes a new instance of the order_productViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the order_productViewModel type without the POCO proxy factory.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        protected order_productViewModel(IUnitOfWorkFactory<IModel1UnitOfWork> unitOfWorkFactory = null)
            : base(unitOfWorkFactory ?? UnitOfWorkSource.GetUnitOfWorkFactory(), x => x.order_product, x => x.id) {
                }


        /// <summary>
        /// The view model that contains a look-up collection of items for the corresponding navigation property in the view.
        /// </summary>
        public IEntitiesViewModel<item> LookUpitems {
            get {
                return GetLookUpEntitiesViewModel(
                    propertyExpression: (order_productViewModel x) => x.LookUpitems,
                    getRepositoryFunc: x => x.items);
            }
        }
        /// <summary>
        /// The view model that contains a look-up collection of orders for the corresponding navigation property in the view.
        /// </summary>
        public IEntitiesViewModel<order> LookUporders {
            get {
                return GetLookUpEntitiesViewModel(
                    propertyExpression: (order_productViewModel x) => x.LookUporders,
                    getRepositoryFunc: x => x.orders);
            }
        }
        /// <summary>
        /// The view model that contains a look-up collection of pets for the corresponding navigation property in the view.
        /// </summary>
        public IEntitiesViewModel<pet> LookUppets {
            get {
                return GetLookUpEntitiesViewModel(
                    propertyExpression: (order_productViewModel x) => x.LookUppets,
                    getRepositoryFunc: x => x.pets);
            }
        }

    }
}
