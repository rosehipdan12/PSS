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
    /// Represents the single order_user object view model.
    /// </summary>
    public partial class order_userViewModel : SingleObjectViewModel<order_user, Tuple<int, int, int>, IModel1UnitOfWork> {

        /// <summary>
        /// Creates a new instance of order_userViewModel as a POCO view model.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        public static order_userViewModel Create(IUnitOfWorkFactory<IModel1UnitOfWork> unitOfWorkFactory = null) {
            return ViewModelSource.Create(() => new order_userViewModel(unitOfWorkFactory));
        }

        /// <summary>
        /// Initializes a new instance of the order_userViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the order_userViewModel type without the POCO proxy factory.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        protected order_userViewModel(IUnitOfWorkFactory<IModel1UnitOfWork> unitOfWorkFactory = null)
            : base(unitOfWorkFactory ?? UnitOfWorkSource.GetUnitOfWorkFactory(), x => x.order_user, x => x.user_id) {
                }


        /// <summary>
        /// The view model that contains a look-up collection of orders for the corresponding navigation property in the view.
        /// </summary>
        public IEntitiesViewModel<order> LookUporders {
            get {
                return GetLookUpEntitiesViewModel(
                    propertyExpression: (order_userViewModel x) => x.LookUporders,
                    getRepositoryFunc: x => x.orders);
            }
        }
        /// <summary>
        /// The view model that contains a look-up collection of users for the corresponding navigation property in the view.
        /// </summary>
        public IEntitiesViewModel<user> LookUpusers {
            get {
                return GetLookUpEntitiesViewModel(
                    propertyExpression: (order_userViewModel x) => x.LookUpusers,
                    getRepositoryFunc: x => x.users);
            }
        }

    }
}
