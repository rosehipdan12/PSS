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
    /// Represents the categories collection view model.
    /// </summary>
    public partial class categoryCollectionViewModel : CollectionViewModel<category, int, IPSSEntitiesUnitOfWork> {

        /// <summary>
        /// Creates a new instance of categoryCollectionViewModel as a POCO view model.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        public static categoryCollectionViewModel Create(IUnitOfWorkFactory<IPSSEntitiesUnitOfWork> unitOfWorkFactory = null) {
            return ViewModelSource.Create(() => new categoryCollectionViewModel(unitOfWorkFactory));
        }

        /// <summary>
        /// Initializes a new instance of the categoryCollectionViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the categoryCollectionViewModel type without the POCO proxy factory.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        protected categoryCollectionViewModel(IUnitOfWorkFactory<IPSSEntitiesUnitOfWork> unitOfWorkFactory = null)
            : base(unitOfWorkFactory ?? UnitOfWorkSource.GetUnitOfWorkFactory(), x => x.categories) {
        }
    }
}