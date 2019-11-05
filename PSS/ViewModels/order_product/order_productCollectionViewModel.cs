﻿using System;
using System.Linq;
using DevExpress.Mvvm.POCO;
using DevExpress.Mvvm.DataModel;
using DevExpress.Mvvm.ViewModel;
using test7.Model1DataModel;
using test7.Common;
using test7;

namespace test7.ViewModels {

    /// <summary>
    /// Represents the order_product collection view model.
    /// </summary>
    public partial class order_productCollectionViewModel : CollectionViewModel<order_product, Tuple<int, int>, IModel1UnitOfWork> {

        /// <summary>
        /// Creates a new instance of order_productCollectionViewModel as a POCO view model.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        public static order_productCollectionViewModel Create(IUnitOfWorkFactory<IModel1UnitOfWork> unitOfWorkFactory = null) {
            return ViewModelSource.Create(() => new order_productCollectionViewModel(unitOfWorkFactory));
        }

        /// <summary>
        /// Initializes a new instance of the order_productCollectionViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the order_productCollectionViewModel type without the POCO proxy factory.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        protected order_productCollectionViewModel(IUnitOfWorkFactory<IModel1UnitOfWork> unitOfWorkFactory = null)
            : base(unitOfWorkFactory ?? UnitOfWorkSource.GetUnitOfWorkFactory(), x => x.order_product) {
        }
    }
}