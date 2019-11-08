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
    /// Represents the single category object view model.
    /// </summary>
    public partial class categoryViewModel : SingleObjectViewModel<category, int, IModel1UnitOfWork> {

        /// <summary>
        /// Creates a new instance of categoryViewModel as a POCO view model.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        public static categoryViewModel Create(IUnitOfWorkFactory<IModel1UnitOfWork> unitOfWorkFactory = null) {
            return ViewModelSource.Create(() => new categoryViewModel(unitOfWorkFactory));
        }

        /// <summary>
        /// Initializes a new instance of the categoryViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the categoryViewModel type without the POCO proxy factory.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        protected categoryViewModel(IUnitOfWorkFactory<IModel1UnitOfWork> unitOfWorkFactory = null)
            : base(unitOfWorkFactory ?? UnitOfWorkSource.GetUnitOfWorkFactory(), x => x.categories, x => x.name) {
                }


        /// <summary>
        /// The view model that contains a look-up collection of categories for the corresponding navigation property in the view.
        /// </summary>
        public IEntitiesViewModel<category> LookUpcategories {
            get {
                return GetLookUpEntitiesViewModel(
                    propertyExpression: (categoryViewModel x) => x.LookUpcategories,
                    getRepositoryFunc: x => x.categories);
            }
        }
        /// <summary>
        /// The view model that contains a look-up collection of items for the corresponding navigation property in the view.
        /// </summary>
        public IEntitiesViewModel<item> LookUpitems {
            get {
                return GetLookUpEntitiesViewModel(
                    propertyExpression: (categoryViewModel x) => x.LookUpitems,
                    getRepositoryFunc: x => x.items);
            }
        }


        /// <summary>
        /// The view model for the categorycategory1 detail collection.
        /// </summary>
        public CollectionViewModelBase<category, category, int, IModel1UnitOfWork> categorycategory1Details {
            get {
                return GetDetailsCollectionViewModel(
                    propertyExpression: (categoryViewModel x) => x.categorycategory1Details,
                    getRepositoryFunc: x => x.categories,
                    foreignKeyExpression: x => x.parent_id,
                    navigationExpression: x => x.category2);
            }
        }

        /// <summary>
        /// The view model for the categoryitems detail collection.
        /// </summary>
        public CollectionViewModelBase<item, item, int, IModel1UnitOfWork> categoryitemsDetails {
            get {
                return GetDetailsCollectionViewModel(
                    propertyExpression: (categoryViewModel x) => x.categoryitemsDetails,
                    getRepositoryFunc: x => x.items,
                    foreignKeyExpression: x => x.category_id,
                    navigationExpression: x => x.category);
            }
        }
    }
}
