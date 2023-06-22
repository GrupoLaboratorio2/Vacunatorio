"use strict";
const {
    Model
} = require("secuelize");
module.exports = (sequelize, DataTypes) => {
    class aplicacion extends Model {
        static asociate(models) {
            aplicacion.hasMany(models.Agentedesalud, {
                foreignKey: "DNI"
            });
            aplicacion.hasMany(models.Persona, {
                foreignKey: "DNI"
            });
            aplicacion.hasMany(models.Loteinterno, {
                foreignKey: "numeroDeSerie"
            });
        }
    }
    aplicacion.init({
        idAplicacion: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncremental: true,
        },
        DNIPaciente: {
            type: DataTypes.INTEGER,
            foreignKey: true,
        },
        DNIAgente: {
            type: DataTypes.INTEGER,
            foreignKey: true,
        },
        numeroDeSerie: {
            type: DataTypes.INTEGER,
            foreignKey: true,
        },
        fechaDeAplicacion: {
            type: DataTypes.DATE,
        },
    }, {
        sequelize,
        timestamp: false,
        modelName: "Aplicacion",
        tableName: "aplicacion",
    });
    return aplicacion;
};