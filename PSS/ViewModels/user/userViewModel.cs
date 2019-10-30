﻿using System;
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
    /// Represents the single user object view model.
    /// </summary>
    public partial class userViewModel : SingleObjectViewModel<user, int, IPSSEntitiesUnitOfWork> {

        /// <summary>
        /// Creates a new instance of userViewModel as a POCO view model.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        public static userViewModel Create(IUnitOfWorkFactory<IPSSEntitiesUnitOfWork> unitOfWorkFactory = null) {
            return ViewModelSource.Create(() => new userViewModel(unitOfWorkFactory));
        }

        /// <summary>
        /// Initializes a new instance of the userViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the userViewModel type without the POCO proxy factory.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        protected userViewModel(IUnitOfWorkFactory<IPSSEntitiesUnitOfWork> unitOfWorkFactory = null)
            : base(unitOfWorkFactory ?? UnitOfWorkSource.GetUnitOfWorkFactory(), x => x.users, x => x.first_name) {
                }


        protected override void RefreshLookUpCollections(bool raisePropertyChanged) {
            base.RefreshLookUpCollections(raisePropertyChanged);
                ordersDetailEntities = CreateAddRemoveDetailEntitiesViewModel(x => x.orders, x => x.orders);
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

    public virtual AddRemoveDetailEntitiesViewModel<user, Int32, order, Int32, IPSSEntitiesUnitOfWork> ordersDetailEntities { get; protected set; }
    }
}
