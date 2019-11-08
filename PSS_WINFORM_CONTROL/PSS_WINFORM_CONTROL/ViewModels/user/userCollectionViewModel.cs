using System;
using System.Linq;
using DevExpress.Mvvm.POCO;
using DevExpress.Mvvm.DataModel;
using DevExpress.Mvvm.ViewModel;
using PSS_WINFORM_CONTROL.Model1DataModel;
using PSS_WINFORM_CONTROL.Common;
using PSS_WINFORM_CONTROL;

namespace PSS_WINFORM_CONTROL.ViewModels {

    /// <summary>
    /// Represents the users collection view model.
    /// </summary>
    public partial class userCollectionViewModel : CollectionViewModel<user, int, IModel1UnitOfWork> {

        /// <summary>
        /// Creates a new instance of userCollectionViewModel as a POCO view model.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        public static userCollectionViewModel Create(IUnitOfWorkFactory<IModel1UnitOfWork> unitOfWorkFactory = null) {
            return ViewModelSource.Create(() => new userCollectionViewModel(unitOfWorkFactory));
        }

        /// <summary>
        /// Initializes a new instance of the userCollectionViewModel class.
        /// This constructor is declared protected to avoid undesired instantiation of the userCollectionViewModel type without the POCO proxy factory.
        /// </summary>
        /// <param name="unitOfWorkFactory">A factory used to create a unit of work instance.</param>
        protected userCollectionViewModel(IUnitOfWorkFactory<IModel1UnitOfWork> unitOfWorkFactory = null)
            : base(unitOfWorkFactory ?? UnitOfWorkSource.GetUnitOfWorkFactory(), x => x.users) {
        }
    }
}