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
    /// Represents the single pet object view model.
    /// </summary>
    public partial class petViewModel : SingleObjectViewModel<pet, int, IPSSEntitiesUnitOfWork> {

        /// <summary>
        /// Creates a new instance of petViewModel as a POCO view model.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        public static petViewModel Create(IUnitOfWorkFactory<IPSSEntitiesUnitOfWork> unitOfWorkFactory = null) {
            return ViewModelSource.Create(() => new petViewModel(unitOfWorkFactory));
        }

        /// <summary>
        /// Initializes a new instance of the petViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the petViewModel type without the POCO proxy factory.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        protected petViewModel(IUnitOfWorkFactory<IPSSEntitiesUnitOfWork> unitOfWorkFactory = null)
            : base(unitOfWorkFactory ?? UnitOfWorkSource.GetUnitOfWorkFactory(), x => x.pets, x => x.name) {
                }


        /// <summary>
        /// The view model that contains a look-up collection of species for the corresponding navigation property in the view.
        /// </summary>
        public IEntitiesViewModel<species> LookUpspecies {
            get {
                return GetLookUpEntitiesViewModel(
                    propertyExpression: (petViewModel x) => x.LookUpspecies,
                    getRepositoryFunc: x => x.species);
            }
        }
        /// <summary>
        /// The view model that contains a look-up collection of order_product for the corresponding navigation property in the view.
        /// </summary>
        public IEntitiesViewModel<order_product> LookUporder_product {
            get {
                return GetLookUpEntitiesViewModel<petViewModel, order_product, Tuple<int, int>>(
                    propertyExpression: (petViewModel x) => x.LookUporder_product,
                    getRepositoryFunc: x => x.order_product);
            }
        }


        /// <summary>
        /// The view model for the petorder_product detail collection.
        /// </summary>
        public ReadOnlyCollectionViewModelBase<order_product, order_product, IPSSEntitiesUnitOfWork> petorder_productDetails {
            get { return GetReadOnlyDetailsCollectionViewModel((petViewModel x) => x.petorder_productDetails, x => x.order_product, x => x.pet_id); }
        }
    }
}
