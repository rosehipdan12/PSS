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
    /// Represents the single species object view model.
    /// </summary>
    public partial class speciesViewModel : SingleObjectViewModel<species, int, IPSSEntitiesUnitOfWork> {

        /// <summary>
        /// Creates a new instance of speciesViewModel as a POCO view model.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        public static speciesViewModel Create(IUnitOfWorkFactory<IPSSEntitiesUnitOfWork> unitOfWorkFactory = null) {
            return ViewModelSource.Create(() => new speciesViewModel(unitOfWorkFactory));
        }

        /// <summary>
        /// Initializes a new instance of the speciesViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the speciesViewModel type without the POCO proxy factory.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        protected speciesViewModel(IUnitOfWorkFactory<IPSSEntitiesUnitOfWork> unitOfWorkFactory = null)
            : base(unitOfWorkFactory ?? UnitOfWorkSource.GetUnitOfWorkFactory(), x => x.species, x => x.name) {
                }


        /// <summary>
        /// The view model that contains a look-up collection of pets for the corresponding navigation property in the view.
        /// </summary>
        public IEntitiesViewModel<pet> LookUppets {
            get {
                return GetLookUpEntitiesViewModel(
                    propertyExpression: (speciesViewModel x) => x.LookUppets,
                    getRepositoryFunc: x => x.pets);
            }
        }


        /// <summary>
        /// The view model for the speciespets detail collection.
        /// </summary>
        public CollectionViewModelBase<pet, pet, int, IPSSEntitiesUnitOfWork> speciespetsDetails {
            get {
                return GetDetailsCollectionViewModel(
                    propertyExpression: (speciesViewModel x) => x.speciespetsDetails,
                    getRepositoryFunc: x => x.pets,
                    foreignKeyExpression: x => x.species_id,
                    navigationExpression: x => x.species);
            }
        }
    }
}
