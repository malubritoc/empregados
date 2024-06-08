class EmpregadosController < ApplicationController
    def create
        @empregado = Empregado.new(empregado_params)
        
        if @empregado.save
            render json: @empregado, status: :created
        else
            render json: @empregado.errors, status: :unprocessable_entity
        end
    end
    
    private
    
        def empregado_params
        params.require(:empregado).permit(:nome, :cpf, :email)
        end

    def show
        @empregado = Empregado.find(params[:id])
        render json: @empregado
    end

    def index
        @empregados = Empregado.all
        render json: @empregados
    end
    
    def update
        @empregado = Empregado.find(params[:id])
        
        if @empregado.update(empregado_params)
            render json: @empregado
        else
            render json: @empregado.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @empregado = Empregado.find(params[:id])
        @empregado.destroy!
      end
end
