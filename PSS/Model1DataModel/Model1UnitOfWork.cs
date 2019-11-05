using DevExpress.Mvvm.DataModel;
using DevExpress.Mvvm.DataModel.EF6;
using System;
using System.Collections.Generic;
using System.Linq;
using test7;

namespace test7.Model1DataModel {

    /// <summary>
    /// A Model1UnitOfWork instance that represents the run-time implementation of the IModel1UnitOfWork interface.
    /// </summary>
    public class Model1UnitOfWork : DbUnitOfWork<Model1>, IModel1UnitOfWork {

        public Model1UnitOfWork(Func<Model1> contextFactory)
            : base(contextFactory) {
        }

        IRepository<category, int> IModel1UnitOfWork.categories {
            get { return GetRepository(x => x.Set<category>(), (category x) => x.id); }
        }

        IRepository<item, int> IModel1UnitOfWork.items {
            get { return GetRepository(x => x.Set<item>(), (item x) => x.id); }
        }

        IRepository<order_product, Tuple<int, int>> IModel1UnitOfWork.order_product {
            get { return GetRepository(x => x.Set<order_product>(), (order_product x) => Tuple.Create(x.order_id, x.quantity)); }
        }

        IRepository<order, int> IModel1UnitOfWork.orders {
            get { return GetRepository(x => x.Set<order>(), (order x) => x.id); }
        }

        IRepository<user, int> IModel1UnitOfWork.users {
            get { return GetRepository(x => x.Set<user>(), (user x) => x.id); }
        }

        IRepository<role, int> IModel1UnitOfWork.roles {
            get { return GetRepository(x => x.Set<role>(), (role x) => x.id); }
        }

        IRepository<pet, int> IModel1UnitOfWork.pets {
            get { return GetRepository(x => x.Set<pet>(), (pet x) => x.id); }
        }

        IRepository<species, int> IModel1UnitOfWork.species {
            get { return GetRepository(x => x.Set<species>(), (species x) => x.id); }
        }

        IRepository<supplier, int> IModel1UnitOfWork.suppliers {
            get { return GetRepository(x => x.Set<supplier>(), (supplier x) => x.id); }
        }
    }
}
