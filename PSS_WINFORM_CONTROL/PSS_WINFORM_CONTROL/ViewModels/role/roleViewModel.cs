﻿using System;
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
    /// Represents the single role object view model.
    /// </summary>
    public partial class roleViewModel : SingleObjectViewModel<role, int, IModel1UnitOfWork> {

        /// <summary>
        /// Creates a new instance of roleViewModel as a POCO view model.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        public static roleViewModel Create(IUnitOfWorkFactory<IModel1UnitOfWork> unitOfWorkFactory = null) {
            return ViewModelSource.Create(() => new roleViewModel(unitOfWorkFactory));
        }

        /// <summary>
        /// Initializes a new instance of the roleViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the roleViewModel type without the POCO proxy factory.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        protected roleViewModel(IUnitOfWorkFactory<IModel1UnitOfWork> unitOfWorkFactory = null)
            : base(unitOfWorkFactory ?? UnitOfWorkSource.GetUnitOfWorkFactory(), x => x.roles, x => x.name) {
                }


        /// <summary>
        /// The view model that contains a look-up collection of users for the corresponding navigation property in the view.
        /// </summary>
        public IEntitiesViewModel<user> LookUpusers {
            get {
                return GetLookUpEntitiesViewModel(
                    propertyExpression: (roleViewModel x) => x.LookUpusers,
                    getRepositoryFunc: x => x.users);
            }
        }


        /// <summary>
        /// The view model for the roleusers detail collection.
        /// </summary>
        public CollectionViewModelBase<user, user, int, IModel1UnitOfWork> roleusersDetails {
            get {
                return GetDetailsCollectionViewModel(
                    propertyExpression: (roleViewModel x) => x.roleusersDetails,
                    getRepositoryFunc: x => x.users,
                    foreignKeyExpression: x => x.role_id,
                    navigationExpression: x => x.role);
            }
        }
    }
}
