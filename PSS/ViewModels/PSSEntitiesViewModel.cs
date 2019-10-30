using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel;
using DevExpress.Mvvm;
using DevExpress.Mvvm.DataAnnotations;
using DevExpress.Mvvm.POCO;
using DevExpress.Mvvm.ViewModel;
using PSS.PSSEntitiesDataModel;

namespace PSS.ViewModels {
    /// <summary>
    /// Represents the root POCO view model for the PSSEntities data model.
    /// </summary>
    public partial class PSSEntitiesViewModel : DocumentsViewModel<PSSEntitiesModuleDescription, IPSSEntitiesUnitOfWork> {

		const string TablesGroup = "Tables";

		const string ViewsGroup = "Views";
		INavigationService NavigationService { get { return this.GetService<INavigationService>(); } }
	
        /// <summary>
        /// Creates a new instance of PSSEntitiesViewModel as a POCO view model.
        /// </summary>
        public static PSSEntitiesViewModel Create() {
            return ViewModelSource.Create(() => new PSSEntitiesViewModel());
        }

		
        /// <summary>
        /// Initializes a new instance of the PSSEntitiesViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the PSSEntitiesViewModel type without the POCO proxy factory.
        /// </summary>
        protected PSSEntitiesViewModel()
		    : base(UnitOfWorkSource.GetUnitOfWorkFactory()) {
        }

        protected override PSSEntitiesModuleDescription[] CreateModules() {
			return new PSSEntitiesModuleDescription[] {
                new PSSEntitiesModuleDescription( "categories", "categoryCollectionView", TablesGroup, GetPeekCollectionViewModelFactory(x => x.categories)),
                new PSSEntitiesModuleDescription( "items", "itemCollectionView", TablesGroup, GetPeekCollectionViewModelFactory(x => x.items)),
                new PSSEntitiesModuleDescription( "orders", "orderCollectionView", TablesGroup, GetPeekCollectionViewModelFactory(x => x.orders)),
                new PSSEntitiesModuleDescription( "pets", "petCollectionView", TablesGroup, GetPeekCollectionViewModelFactory(x => x.pets)),
                new PSSEntitiesModuleDescription( "roles", "roleCollectionView", TablesGroup, GetPeekCollectionViewModelFactory(x => x.roles)),
                new PSSEntitiesModuleDescription( "species", "speciesCollectionView", TablesGroup, GetPeekCollectionViewModelFactory(x => x.species)),
                new PSSEntitiesModuleDescription( "suppliers", "supplierCollectionView", TablesGroup, GetPeekCollectionViewModelFactory(x => x.suppliers)),
                new PSSEntitiesModuleDescription( "users", "userCollectionView", TablesGroup, GetPeekCollectionViewModelFactory(x => x.users)),
                new PSSEntitiesModuleDescription("order product", "order_productCollectionView", ViewsGroup),
			};
        }
                		protected override void OnActiveModuleChanged(PSSEntitiesModuleDescription oldModule) {
            if(ActiveModule != null && NavigationService != null) {
                NavigationService.ClearNavigationHistory();
            }
            base.OnActiveModuleChanged(oldModule);
        }
	}

    public partial class PSSEntitiesModuleDescription : ModuleDescription<PSSEntitiesModuleDescription> {
        public PSSEntitiesModuleDescription(string title, string documentType, string group, Func<PSSEntitiesModuleDescription, object> peekCollectionViewModelFactory = null)
            : base(title, documentType, group, peekCollectionViewModelFactory) {
        }
    }
}