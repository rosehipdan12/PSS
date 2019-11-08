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
    /// Represents the single user object view model.
    /// </summary>
    public partial class userViewModel : SingleObjectViewModel<user, int, IModel1UnitOfWork> {

        /// <summary>
        /// Creates a new instance of userViewModel as a POCO view model.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        public static userViewModel Create(IUnitOfWorkFactory<IModel1UnitOfWork> unitOfWorkFactory = null) {
            return ViewModelSource.Create(() => new userViewModel(unitOfWorkFactory));
        }

        /// <summary>
        /// Initializes a new instance of the userViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the userViewModel type without the POCO proxy factory.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        protected userViewModel(IUnitOfWorkFactory<IModel1UnitOfWork> unitOfWorkFactory = null)
            : base(unitOfWorkFactory ?? UnitOfWorkSource.GetUnitOfWorkFactory(), x => x.users, x => x.first_name) {
                }


        /// <summary>
        /// The view model that contains a look-up collection of order_user for the corresponding navigation property in the view.
        /// </summary>
        public IEntitiesViewModel<order_user> LookUporder_user {
            get {
                return GetLookUpEntitiesViewModel(
                    propertyExpression: (userViewModel x) => x.LookUporder_user,
                    getRepositoryFunc: x => x.order_user);
            }
        }
        /// <summary>
        /// The view model that contains a look-up collection of roles for the corresponding navigation property in the view.
        /// </summary>
        public IEntitiesViewModel<role> LookUproles {
            get {
                return GetLookUpEntitiesViewModel(
                    propertyExpression: (userViewModel x) => x.LookUproles,
                    getRepositoryFunc: x => x.roles);
            }
        }


        /// <summary>
        /// The view model for the userorder_user detail collection.
        /// </summary>
        public CollectionViewModelBase<order_user, order_user, Tuple<int, int, int>, IModel1UnitOfWork> userorder_userDetails {
            get {
                return GetDetailsCollectionViewModel(
                    propertyExpression: (userViewModel x) => x.userorder_userDetails,
                    getRepositoryFunc: x => x.order_user,
                    foreignKeyExpression: x => x.user_id,
                    navigationExpression: x => x.user);
            }
        }
    }
}
