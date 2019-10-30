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
    /// Represents the single item object view model.
    /// </summary>
    public partial class itemViewModel : SingleObjectViewModel<item, int, IPSSEntitiesUnitOfWork> {

        /// <summary>
        /// Creates a new instance of itemViewModel as a POCO view model.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        public static itemViewModel Create(IUnitOfWorkFactory<IPSSEntitiesUnitOfWork> unitOfWorkFactory = null) {
            return ViewModelSource.Create(() => new itemViewModel(unitOfWorkFactory));
        }

        /// <summary>
        /// Initializes a new instance of the itemViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the itemViewModel type without the POCO proxy factory.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        protected itemViewModel(IUnitOfWorkFactory<IPSSEntitiesUnitOfWork> unitOfWorkFactory = null)
            : base(unitOfWorkFactory ?? UnitOfWorkSource.GetUnitOfWorkFactory(), x => x.items, x => x.name) {
                }


        /// <summary>
        /// The view model that contains a look-up collection of categories for the corresponding navigation property in the view.
        /// </summary>
        public IEntitiesViewModel<category> LookUpcategories {
            get {
                return GetLookUpEntitiesViewModel(
                    propertyExpression: (itemViewModel x) => x.LookUpcategories,
                    getRepositoryFunc: x => x.categories);
            }
        }
        /// <summary>
        /// The view model that contains a look-up collection of suppliers for the corresponding navigation property in the view.
        /// </summary>
        public IEntitiesViewModel<supplier> LookUpsuppliers {
            get {
                return GetLookUpEntitiesViewModel(
                    propertyExpression: (itemViewModel x) => x.LookUpsuppliers,
                    getRepositoryFunc: x => x.suppliers);
            }
        }
        /// <summary>
        /// The view model that contains a look-up collection of order_product for the corresponding navigation property in the view.
        /// </summary>
        public IEntitiesViewModel<order_product> LookUporder_product {
            get {
                return GetLookUpEntitiesViewModel<itemViewModel, order_product, Tuple<int, int>>(
                    propertyExpression: (itemViewModel x) => x.LookUporder_product,
                    getRepositoryFunc: x => x.order_product);
            }
        }


        /// <summary>
        /// The view model for the itemorder_product detail collection.
        /// </summary>
        public ReadOnlyCollectionViewModelBase<order_product, order_product, IPSSEntitiesUnitOfWork> itemorder_productDetails {
            get { return GetReadOnlyDetailsCollectionViewModel((itemViewModel x) => x.itemorder_productDetails, x => x.order_product, x => x.item_id); }
        }
    }
}
