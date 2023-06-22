"use strict";
const {
    Model
} = require("secuelize");
module.exports = (sequelize, DataTypes) => {
    class agenteDeSalud extends Model {
        static asociate(models) {
            agenteDeSalud.hasOne(models.Persona, {
                foreignKey: "DNI"
            });
        }
    }
    agenteDeSalud.init({
        DNI: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            foreignKey: true,
        },
        matricula: {
            type: DataTypes.INTEGER,
            uniqueKey: true,
        },
    }, {
        sequelize,
        timestamps: false,
        modelName: "agenteDeSalud",
        tableName: "agenteDeSalud",
    });
    return agenteDeSalud;
};