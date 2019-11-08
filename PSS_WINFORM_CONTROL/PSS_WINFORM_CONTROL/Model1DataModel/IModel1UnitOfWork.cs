using DevExpress.Mvvm.DataModel;
using PSS_WINFORM_CONTROL;
using System;
using System.Collections.Generic;
using System.Linq;

namespace PSS_WINFORM_CONTROL.Model1DataModel {

    /// <summary>
    /// IModel1UnitOfWork extends the IUnitOfWork interface with repositories representing specific entities.
    /// </summary>
    public interface IModel1UnitOfWork : IUnitOfWork {
        
        /// <summary>
        /// The category entities repository.
        /// </summary>
		IRepository<category, int> categories { get; }
        
        /// <summary>
        /// The item entities repository.
        /// </summary>
		IRepository<item, int> items { get; }
        
        /// <summary>
        /// The order_product entities repository.
        /// </summary>
		IRepository<order_product, int> order_product { get; }
        
        /// <summary>
        /// The order entities repository.
        /// </summary>
		IRepository<order, int> orders { get; }
        
        /// <summary>
        /// The order_user entities repository.
        /// </summary>
		IRepository<order_user, Tuple<int, int, int>> order_user { get; }
        
        /// <summary>
        /// The user entities repository.
        /// </summary>
		IRepository<user, int> users { get; }
        
        /// <summary>
        /// The role entities repository.
        /// </summary>
		IRepository<role, int> roles { get; }
        
        /// <summary>
        /// The pet entities repository.
        /// </summary>
		IRepository<pet, int> pets { get; }
        
        /// <summary>
        /// The species entities repository.
        /// </summary>
		IRepository<species, int> species { get; }
        
        /// <summary>
        /// The supplier entities repository.
        /// </summary>
		IRepository<supplier, int> suppliers { get; }
        
        /// <summary>
        /// The sysdiagram entities repository.
        /// </summary>
		IRepository<sysdiagram, int> sysdiagrams { get; }
    }
}
