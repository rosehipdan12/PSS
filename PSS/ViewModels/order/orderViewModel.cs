using System;
using System.Linq;
using System.Linq.Expressions;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using DevExpress.Mvvm;
using DevExpress.Mvvm.POCO;
using DevExpress.Mvvm.DataModel;
using DevExpress.Mvvm.ViewModel;
using test7.Model1DataModel;
using test7.Common;
using test7;

namespace test7.ViewModels {

    /// <summary>
    /// Represents the single order object view model.
    /// </summary>
    public partial class orderViewModel : SingleObjectViewModel<order, int, IModel1UnitOfWork> {

        /// <summary>
        /// Creates a new instance of orderViewModel as a POCO view model.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        public static orderViewModel Create(IUnitOfWorkFactory<IModel1UnitOfWork> unitOfWorkFactory = null) {
            return ViewModelSource.Create(() => new orderViewModel(unitOfWorkFactory));
        }

        /// <summary>
        /// Initializes a new instance of the orderViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the orderViewModel type without the POCO proxy factory.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        protected orderViewModel(IUnitOfWorkFactory<IModel1UnitOfWork> unitOfWorkFactory = null)
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
                return GetLookUpEntitiesViewModel(
                    propertyExpression: (orderViewModel x) => x.LookUporder_product,
                    getRepositoryFunc: x => x.order_product);
            }
        }

    public virtual AddRemoveDetailEntitiesViewModel<order, Int32, user, Int32, IModel1UnitOfWork> usersDetailEntities { get; protected set; }

        /// <summary>
        /// The view model for the orderorder_product detail collection.
        /// </summary>
        public CollectionViewModelBase<order_product, order_product, Tuple<int, int>, IModel1UnitOfWork> orderorder_productDetails {
            get {
                return GetDetailsCollectionViewModel(
                    propertyExpression: (orderViewModel x) => x.orderorder_productDetails,
                    getRepositoryFunc: x => x.order_product,
                    foreignKeyExpression: x => x.order_id,
                    navigationExpression: x => x.order);
            }
        }
    }
}
