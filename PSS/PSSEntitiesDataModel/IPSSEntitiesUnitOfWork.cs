using DevExpress.Mvvm.DataModel;
using PSS;
using System;
using System.Collections.Generic;
using System.Linq;

namespace PSS.PSSEntitiesDataModel {

    /// <summary>
    /// IPSSEntitiesUnitOfWork extends the IUnitOfWork interface with repositories representing specific entities.
    /// </summary>
    public interface IPSSEntitiesUnitOfWork : IUnitOfWork {
        
        /// <summary>
        /// The category entities repository.
        /// </summary>
		IRepository<category, int> categories { get; }
        
        /// <summary>
        /// The item entities repository.
        /// </summary>
		IRepository<item, int> items { get; }
        
        /// <summary>
        /// The order entities repository.
        /// </summary>
		IRepository<order, int> orders { get; }
        
        /// <summary>
        /// The pet entities repository.
        /// </summary>
		IRepository<pet, int> pets { get; }
        
        /// <summary>
        /// The role entities repository.
        /// </summary>
		IRepository<role, int> roles { get; }
        
        /// <summary>
        /// The species entities repository.
        /// </summary>
		IRepository<species, int> species { get; }
        
        /// <summary>
        /// The supplier entities repository.
        /// </summary>
		IRepository<supplier, int> suppliers { get; }
        
        /// <summary>
        /// The user entities repository.
        /// </summary>
		IRepository<user, int> users { get; }
        
        /// <summary>
        /// The order_product entities repository.
        /// </summary>
		IReadOnlyRepository<order_product> order_product { get; }
    }
}
