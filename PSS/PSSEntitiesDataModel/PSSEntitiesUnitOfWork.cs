using DevExpress.Mvvm.DataModel;
using DevExpress.Mvvm.DataModel.EF6;
using PSS;
using System;
using System.Collections.Generic;
using System.Linq;

namespace PSS.PSSEntitiesDataModel {

    /// <summary>
    /// A PSSEntitiesUnitOfWork instance that represents the run-time implementation of the IPSSEntitiesUnitOfWork interface.
    /// </summary>
    public class PSSEntitiesUnitOfWork : DbUnitOfWork<PSSEntities>, IPSSEntitiesUnitOfWork {

        public PSSEntitiesUnitOfWork(Func<PSSEntities> contextFactory)
            : base(contextFactory) {
        }

        IRepository<category, int> IPSSEntitiesUnitOfWork.categories {
            get { return GetRepository(x => x.Set<category>(), (category x) => x.id); }
        }

        IRepository<item, int> IPSSEntitiesUnitOfWork.items {
            get { return GetRepository(x => x.Set<item>(), (item x) => x.id); }
        }

        IRepository<order, int> IPSSEntitiesUnitOfWork.orders {
            get { return GetRepository(x => x.Set<order>(), (order x) => x.id); }
        }

        IRepository<pet, int> IPSSEntitiesUnitOfWork.pets {
            get { return GetRepository(x => x.Set<pet>(), (pet x) => x.id); }
        }

        IRepository<role, int> IPSSEntitiesUnitOfWork.roles {
            get { return GetRepository(x => x.Set<role>(), (role x) => x.id); }
        }

        IRepository<species, int> IPSSEntitiesUnitOfWork.species {
            get { return GetRepository(x => x.Set<species>(), (species x) => x.id); }
        }

        IRepository<supplier, int> IPSSEntitiesUnitOfWork.suppliers {
            get { return GetRepository(x => x.Set<supplier>(), (supplier x) => x.id); }
        }

        IRepository<user, int> IPSSEntitiesUnitOfWork.users {
            get { return GetRepository(x => x.Set<user>(), (user x) => x.id); }
        }

        IReadOnlyRepository<order_product> IPSSEntitiesUnitOfWork.order_product {
            get { return GetReadOnlyRepository(x => x.Set<order_product>()); }
        }
    }
}
