using DevExpress.Mvvm;
using DevExpress.Mvvm.DataModel;
using DevExpress.Mvvm.DataModel.DesignTime;
using DevExpress.Mvvm.DataModel.EF6;
using PSS_WINFORM_CONTROL;
using System;
using System.Collections;
using System.Linq;

namespace PSS_WINFORM_CONTROL.Model1DataModel {

    /// <summary>
    /// Provides methods to obtain the relevant IUnitOfWorkFactory.
    /// </summary>
    public static class UnitOfWorkSource {

		/// <summary>
        /// Returns the IUnitOfWorkFactory implementation.
        /// </summary>
        public static IUnitOfWorkFactory<IModel1UnitOfWork> GetUnitOfWorkFactory() {
            return new DbUnitOfWorkFactory<IModel1UnitOfWork>(() => new Model1UnitOfWork(() => new Model1()));
        }
    }
}