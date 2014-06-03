import os, sys, pygame

import time
import pickle
import math
from pygame.locals import *
from random import randint
pygame.init()
pygame.font.init()

from parse_rest.connection import register
register("cAsO2IG0vn5dWs7wFb4Dm1cBxAlfXsvk26sHqWkP", "aFbRLKJtrub3xHXtMTB165RVltweQ5B37qp6ceSg")

from parse_rest.datatypes import Object
from parse_rest.connection import ParseBatcher
from pgu import gui

class balls(Object):
    pass
    


##### code for open dialog #####
def open_file_browser(arg):
    d = gui.FileDialog()
    d.connect(gui.CHANGE, handle_file_browser_closed, d)
    d.open()
    
def handle_file_browser_closed(dlg):
    if dlg.value: input_file.value = dlg.value
    
def saveFF():
    global save_open
    save_open = "Save"
    app.quit()
    
def openFF():
    global save_open
    save_open = "Open"
    app.quit()
    
def closeFF():
    global save_open
    save_open = ""
    app.quit()
    
    
    
# DEVICE ID
device_ID = "lojsk"


app = gui.Desktop()
app.connect(gui.QUIT,app.quit,None)

main = gui.Container(width=500, height=400) #, background=(220, 220, 220) )
main.add(gui.Label("Select file:", cls="h1"), 20, 20)
td_style = {'padding_right': 10}

t = gui.Table()
t.tr()
t.td( gui.Label('Open:') , style=td_style )
input_file = gui.Input()
t.td( input_file, style=td_style )
b = gui.Button("Browse...")
t.td( b, style=td_style )
b.connect(gui.CLICK, open_file_browser, None)
btn = gui.Button("Open!")
btn.connect(gui.CLICK, openFF)
t.td(btn)
t.tr()
t.tr()
t.td( gui.Label('Save:') , style=td_style )
input_fileS = gui.Input("def.txt")
t.td( input_fileS, style=td_style )
b.connect(gui.CLICK, open_file_browser, None)

btn = gui.Button("Save!")
btn.connect(gui.CLICK, saveFF)
t.td(btn)
t.tr()
btn1 = gui.Button("Close")
btn1.connect(gui.CLICK, closeFF)
t.td(btn1)

main.add(t, 20, 100)
######### end code for dialog #############




size = width, height = 700, 668

white = 255,255,255
screen = pygame.display.set_mode(size)

last_pos = -1,-1
size = 10, 10

e_count = 1
selected_object = 0
start_button_position = 140
start_button_left = 0

rocket = []
circle = []

myfont = pygame.font.Font(None,18)

edit_mode = False
label_edit = " edit"

last_time = time.time()
exported_time = time.time()

x_img = pygame.image.load("x_min.png")
x_img_rect = x_img.get_rect()

yes_img = pygame.image.load("yes.png")
yes_img_rect = x_img.get_rect()

s_img = pygame.image.load("s_min.png")
s_img_rect = s_img.get_rect()

in_drag = -1
in_resize = -1
in_remove = -1

active = -1
start_position = 200
speed = 200
y_os = 0

circle_num = 0

def button_click(area, last):
    if area[0] < last[0] and area[1] < last[1] and area[0]+area[2] > last[0] and area[1]+area[3] > last[1]:
        return True
    return False
    
def button_alloc(area, title):
    global last_time
    label = myfont.render(title, 1, (0,0,0))
    screen.blit(label, (area[0], area[1]))
    pygame.draw.rect (screen, (0,0,0), Rect(area[0]-5, area[1]-5, area[2], area[3]), 1)
    
    if pygame.mouse.get_pressed()[0]:
        if button_click(area, pygame.mouse.get_pos()):
            if last_time+0.5 < time.time():
                last_time = time.time()
                return True
    return False


while 1:
    legend_y = 450
    events = pygame.event.get()
    for event in events:
        if event.type==QUIT:
            pygame.quit()
            sys.exit()

    
    # key hold
    move_ticker = 0
    keys=pygame.key.get_pressed()
    if keys[K_DOWN]:
        y_os += 10;
    if keys[K_UP]:
        y_os -= 10;
    
    # screen
    screen.fill((255,255,255))  
    if edit_mode:
         screen.fill((180,240,180))   
    pygame.draw.rect (screen, (0,0,0), Rect(50, 50, 320, height-100), 2)
    pygame.draw.lines(screen, (0,0,0), False, [(420,0), (420, height)], 2)
    
    # add point
    if keys[K_a]:  
        if pygame.mouse.get_pressed()[0] and last_pos != pygame.mouse.get_pos() and pygame.mouse.get_pos()[0] <= 420 and edit_mode == False:  
            last_pos = pygame.mouse.get_pos()
        
        
            rocket.append([last_pos[0], last_pos[1] - y_os])
        
            start_position += 50
            #print pygame.mouse.get_pos()
            active = -1
        
            if circle_num % 2 == 1:
                distance = math.sqrt(((rocket[0][0]-rocket[1][0])**2 + (rocket[0][1]-rocket[1][1])**2))
                color = (50+randint(0,180),50+randint(0,180),50+randint(0,180))
                circle.append([rocket[0][0], rocket[0][1], distance, color])
                rocket = []
            
            circle_num += 1
           
    # point
    for count, ob in enumerate(rocket):
        x = ob[0]-size[0]/2 
        y = ob[1]-size[1]/2 + y_os
        color = (100,100,100)
        pygame.draw.rect(screen, color, Rect(x, y, size[0], size[1]))       
    
    # circle
    for line_count, cir in enumerate(circle):
        pygame.draw.circle(screen, cir[3], (cir[0], cir[1]+ y_os), int(cir[2]))

        # move point
        if keys[K_d]:    
            screen.blit(x_img, (cir[0]-10 ,cir[1] - 10 + y_os, 20, 20))
            if pygame.mouse.get_pressed()[0]:
                if in_remove == -1 or in_remove == line_count:
                    click_element = pygame.mouse.get_pos()
                    if button_click([cir[0]-10 ,cir[1] - 10 + y_os, 20, 20], click_element) or line_count == in_remove:
                        keys=pygame.key.get_pressed()
                        in_remove = line_count
                        circle.remove(circle[line_count])
            else:
                in_remove = -1
        
        # move point
        if keys[K_s]:    
            screen.blit(s_img, (cir[0]-5 ,cir[1] - 5 + y_os, 20, 20))
            if pygame.mouse.get_pressed()[0]:
                if in_drag == -1 or in_drag == line_count:
                    click_element = pygame.mouse.get_pos()
                    if button_click([cir[0]-15, cir[1]-15 + y_os, 30, 30], click_element) or line_count == in_drag:
                        keys=pygame.key.get_pressed()
                        in_drag = line_count
                        circle[in_drag][0] = click_element[0]
                        circle[in_drag][1] = click_element[1] - y_os
            else:
                in_drag = -1
                
        # resize point
        if keys[K_w]:
            screen.blit(s_img, (cir[0]-5 + cir[2],cir[1] - 5 + y_os, 20, 20))
            if pygame.mouse.get_pressed()[0]:
                if in_resize == -1 or in_resize == line_count:
                    click_element = pygame.mouse.get_pos()
                    if button_click([cir[0]-5+cir[2]-25, cir[1]-25 + y_os, 50, 50], click_element) or line_count == in_resize:
                        in_resize = line_count
                        distance = math.sqrt(((circle[in_resize][0]-click_element[0])**2 + (circle[in_resize][1]-click_element[1])**2))
                        circle[in_resize][2] = distance
            else:
                in_resize = -1
                

    
    # legend
    b = False
    if pygame.mouse.get_pressed()[0] and last_pos != pygame.mouse.get_pos():
        last_pos = pygame.mouse.get_pos()
        b = True
       
    # back button
    if button_alloc((450, 618, 85, 20)," remove last"):
        if len(circle) > 0:
            circle.remove(circle[len(circle)-1])
        
    # export
    if button_alloc((450, 648, 85, 20)," export"):
        dev_delete = balls.Query.filter(device_id=device_ID)
        dev_number = 1
        while 1:
            this_delete = dev_delete.limit(49)
            if this_delete.exists():
                batcher = ParseBatcher()
                batcher.batch_delete(this_delete)
                dev_delete.skip(49*dev_number).limit(49)
                dev_number += 1
            else:
                break
        
        pointts = []
        for count, one_cir in enumerate(circle):
            firstT = [50, 0, 0, (10,10,10)]
            v1 = (one_cir[0] - firstT[0])*2 
            v2 = (one_cir[1] - firstT[1])*2
            
            pointt = balls(pos_x = v1, pos_y = v2, distance = int(one_cir[2]), device_id=device_ID)
            pointts.append(pointt)
        batcher = ParseBatcher()
        batcher.batch_save(pointts)

        exported = "sucesfully exported !!!"
        exported_time = time.time() + 3
        label = myfont.render("", 1, (200,0,0))
        screen.blit(label, (450, 580))
     
    if exported_time > time.time():           
        label = myfont.render(exported, 1, (200,0,0))
        screen.blit(label, (450, 580))
        
    # save
    if button_alloc((550, 648, 85, 20), " Open/Save"):
        app.run(main)
        if save_open == "Open":   
            enemies = []
            enemies_name = []
            active = -1         
            with open(input_file.value) as f:
                for line in f:
                    objects = line.split("|")
                    circle.append([int(objects[0]), int(objects[1]), float(objects[2]), (int(objects[3]), int(objects[4]), int(objects[5]))])
                        
        else: 
            if save_open == "Save":
                f = open(input_fileS.value, 'w')
                all_input = ""
                for one in circle:
                    all_input += str(one[0])+"|"+str(one[1])+"|"+str(one[2])+"|"+str(one[3][0])+"|"+str(one[3][1])+"|"+str(one[3][2])+"\n"
        
                f.write(all_input)
                f.close()
    
    # update
    pygame.display.update()   
     
    