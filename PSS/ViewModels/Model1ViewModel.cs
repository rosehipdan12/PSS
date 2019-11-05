using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using DevExpress.Mvvm;
using DevExpress.Mvvm.DataAnnotations;
using DevExpress.Mvvm.POCO;
using DevExpress.Mvvm.ViewModel;
using test7.Model1DataModel;

namespace test7.ViewModels {
    /// <summary>
    /// Represents the root POCO view model for the Model1 data model.
    /// </summary>
    public partial class Model1ViewModel : DocumentsViewModel<Model1ModuleDescription, IModel1UnitOfWork> {

		const string TablesGroup = "Tables";

		const string ViewsGroup = "Views";
		INavigationService NavigationService { get { return this.GetService<INavigationService>(); } }
	
        /// <summary>
        /// Creates a new instance of Model1ViewModel as a POCO view model.
        /// </summary>
        public static Model1ViewModel Create() {
            return ViewModelSource.Create(() => new Model1ViewModel());
        }

		
        /// <summary>
        /// Initializes a new instance of the Model1ViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the Model1ViewModel type without the POCO proxy factory.
        /// </summary>
        protected Model1ViewModel()
		    : base(UnitOfWorkSource.GetUnitOfWorkFactory()) {
        }

        protected override Model1ModuleDescription[] CreateModules() {
			return new Model1ModuleDescription[] {
                new Model1ModuleDescription( "categories", "categoryCollectionView", TablesGroup, GetPeekCollectionViewModelFactory(x => x.categories)),
                new Model1ModuleDescription( "items", "itemCollectionView", TablesGroup, GetPeekCollectionViewModelFactory(x => x.items)),
                new Model1ModuleDescription( "order product", "order_productCollectionView", TablesGroup, GetPeekCollectionViewModelFactory(x => x.order_product)),
                new Model1ModuleDescription( "orders", "orderCollectionView", TablesGroup, GetPeekCollectionViewModelFactory(x => x.orders)),
                new Model1ModuleDescription( "users", "userCollectionView", TablesGroup, GetPeekCollectionViewModelFactory(x => x.users)),
                new Model1ModuleDescription( "roles", "roleCollectionView", TablesGroup, GetPeekCollectionViewModelFactory(x => x.roles)),
                new Model1ModuleDescription( "pets", "petCollectionView", TablesGroup, GetPeekCollectionViewModelFactory(x => x.pets)),
                new Model1ModuleDescription( "species", "speciesCollectionView", TablesGroup, GetPeekCollectionViewModelFactory(x => x.species)),
                new Model1ModuleDescription( "suppliers", "supplierCollectionView", TablesGroup, GetPeekCollectionViewModelFactory(x => x.suppliers)),
			};
        }
                		protected override void OnActiveModuleChanged(Model1ModuleDescription oldModule) {
            if(ActiveModule != null && NavigationService != null) {
                NavigationService.ClearNavigationHistory();
            }
            base.OnActiveModuleChanged(oldModule);
        }
	}

    public partial class Model1ModuleDescription : ModuleDescription<Model1ModuleDescription> {
        public Model1ModuleDescription(string title, string documentType, string group, Func<Model1ModuleDescription, object> peekCollectionViewModelFactory = null)
            : base(title, documentType, group, peekCollectionViewModelFactory) {
        }
    }
}