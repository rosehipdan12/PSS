using System;
using System.Linq;
using DevExpress.Mvvm.POCO;
using DevExpress.Mvvm.DataModel;
using DevExpress.Mvvm.ViewModel;
using PSS.PSSEntitiesDataModel;
using PSS.Common;
using PSS;

namespace PSS.ViewModels {

    /// <summary>
    /// Represents the species collection view model.
    /// </summary>
    public partial class speciesCollectionViewModel : CollectionViewModel<species, int, IPSSEntitiesUnitOfWork> {

        /// <summary>
        /// Creates a new instance of speciesCollectionViewModel as a POCO view model.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        public static speciesCollectionViewModel Create(IUnitOfWorkFactory<IPSSEntitiesUnitOfWork> unitOfWorkFactory = null) {
            return ViewModelSource.Create(() => new speciesCollectionViewModel(unitOfWorkFactory));
        }

        /// <summary>
        /// Initializes a new instance of the speciesCollectionViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the speciesCollectionViewModel type without the POCO proxy factory.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        protected speciesCollectionViewModel(IUnitOfWorkFactory<IPSSEntitiesUnitOfWork> unitOfWorkFactory = null)
            : base(unitOfWorkFactory ?? UnitOfWorkSource.GetUnitOfWorkFactory(), x => x.species) {
        }
    }
}