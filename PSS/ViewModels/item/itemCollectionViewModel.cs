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
    /// Represents the items collection view model.
    /// </summary>
    public partial class itemCollectionViewModel : CollectionViewModel<item, int, IPSSEntitiesUnitOfWork> {

        /// <summary>
        /// Creates a new instance of itemCollectionViewModel as a POCO view model.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        public static itemCollectionViewModel Create(IUnitOfWorkFactory<IPSSEntitiesUnitOfWork> unitOfWorkFactory = null) {
            return ViewModelSource.Create(() => new itemCollectionViewModel(unitOfWorkFactory));
        }

        /// <summary>
        /// Initializes a new instance of the itemCollectionViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the itemCollectionViewModel type without the POCO proxy factory.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        protected itemCollectionViewModel(IUnitOfWorkFactory<IPSSEntitiesUnitOfWork> unitOfWorkFactory = null)
            : base(unitOfWorkFactory ?? UnitOfWorkSource.GetUnitOfWorkFactory(), x => x.items) {
        }
    }
}