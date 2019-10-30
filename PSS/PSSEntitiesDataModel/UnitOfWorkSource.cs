using DevExpress.Mvvm;
using DevExpress.Mvvm.DataModel;
using DevExpress.Mvvm.DataModel.DesignTime;
using DevExpress.Mvvm.DataModel.EF6;
using PSS;
using System;
using System.Collections;
using System.Linq;

namespace PSS.PSSEntitiesDataModel {

    /// <summary>
    /// Provides methods to obtain the relevant IUnitOfWorkFactory.
    /// </summary>
    public static class UnitOfWorkSource {

		/// <summary>
        /// Returns the IUnitOfWorkFactory implementation.
        /// </summary>
        public static IUnitOfWorkFactory<IPSSEntitiesUnitOfWork> GetUnitOfWorkFactory() {
            return new DbUnitOfWorkFactory<IPSSEntitiesUnitOfWork>(() => new PSSEntitiesUnitOfWork(() => new PSSEntities()));
        }
    }
}