function interacao_spline()
%Pra lidar com os botões usei como base a discussão e códigos nesse link: https://www.mathworks.com/matlabcentral/answers/476028-interrupting-a-callback-with-a-push-button
h.fig = figure();
h.but1 = uicontrol(h.fig,'Style','PushButton','Units','Normalize','Position',[.9,.3,.1,.1],'String','Iniciar');
h.but2 = uicontrol(h.fig,'Style','PushButton','Units','Normalize','Position',[.9,.2,.1,.1],'String','Parar');
h.but2Value = false;

guidata(h.fig, h)

h.but1.Callback = {@plotButton1Pushed,h};
h.but2.Callback = {@plotButton2Pushed,h};

    function plotButton1Pushed(src,event,handles)
        xVec = [];
        yVec = [];
        aux = 1;
        
        while aux
            handles = guidata(src.Parent);
            
            hold on;
            if handles.but2Value
                %Esse botão reinicia o processo para a próxima curva
                %Chamo a função pra construir a spline com os valores dos
                %pontos marcados até aqui
                spline_cubica_parametrica(xVec, yVec);
                %Tenho novos vetores x e y vazios para a proxíma construção
                xVec = [];
                yVec = [];
                aux = 0;
                
                handles.but2Value = false; 
                guidata(src.Parent,handles)
            end
            xlim([0 100])
            ylim([0 100])
            [x,y] = ginput(1);
            
            %Utilizo o if pra evitar que seja considerado o clique no botão
            %como um ponto da spline
            if x < 100
            plot(x,y, '*');
            title('O segundo clique será o ponto guia de (x1,y1) e para criar o ponto guia de (xn,yn) clique no botão PARAR e para continuar criando outra spline em INICIAR ')
            
            %xVec e yVec guardam os valores das coordenadas dos pontos
            %marcados
            xVec = [xVec x];
            yVec = [yVec y];
            
            end
            %disp(xVec);
           
        end
        hold off
    end

    function plotButton2Pushed(src,event,handles)
        handles.but2Value = true;
        guidata(src.Parent, handles)
    end
end


