using System;
using System.Linq;
using System.Linq.Expressions;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using DevExpress.Mvvm;
using DevExpress.Mvvm.POCO;
using DevExpress.Mvvm.DataModel;
using DevExpress.Mvvm.ViewModel;
using PSS.PSSEntitiesDataModel;
using PSS.Common;
using PSS;

namespace PSS.ViewModels {

    /// <summary>
    /// Represents the single order object view model.
    /// </summary>
    public partial class orderViewModel : SingleObjectViewModel<order, int, IPSSEntitiesUnitOfWork> {

        /// <summary>
        /// Creates a new instance of orderViewModel as a POCO view model.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        public static orderViewModel Create(IUnitOfWorkFactory<IPSSEntitiesUnitOfWork> unitOfWorkFactory = null) {
            return ViewModelSource.Create(() => new orderViewModel(unitOfWorkFactory));
        }

        /// <summary>
        /// Initializes a new instance of the orderViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the orderViewModel type without the POCO proxy factory.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        protected orderViewModel(IUnitOfWorkFactory<IPSSEntitiesUnitOfWork> unitOfWorkFactory = null)
            : base(unitOfWorkFactory ?? UnitOfWorkSource.GetUnitOfWorkFactory(), x => x.orders, x => x.id) {
                }


        protected override void RefreshLookUpCollections(bool raisePropertyChanged) {
            base.RefreshLookUpCollections(raisePropertyChanged);
                usersDetailEntities = CreateAddRemoveDetailEntitiesViewModel(x => x.users, x => x.users);
        }
        /// <summary>
        /// The view model that contains a look-up collection of order_product for the corresponding navigation property in the view.
        /// </summary>
        public IEntitiesViewModel<order_product> LookUporder_product {
            get {
                return GetLookUpEntitiesViewModel<orderViewModel, order_product, Tuple<int, int>>(
                    propertyExpression: (orderViewModel x) => x.LookUporder_product,
                    getRepositoryFunc: x => x.order_product);
            }
        }

    public virtual AddRemoveDetailEntitiesViewModel<order, Int32, user, Int32, IPSSEntitiesUnitOfWork> usersDetailEntities { get; protected set; }

        /// <summary>
        /// The view model for the orderorder_product detail collection.
        /// </summary>
        public ReadOnlyCollectionViewModelBase<order_product, order_product, IPSSEntitiesUnitOfWork> orderorder_productDetails {
            get { return GetReadOnlyDetailsCollectionViewModel((orderViewModel x) => x.orderorder_productDetails, x => x.order_product, x => x.order_id); }
        }
    }
}
