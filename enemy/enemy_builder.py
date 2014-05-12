import os, sys, pygame

import time
import pickle
import math
from pygame.locals import *
pygame.init()
pygame.font.init()

from parse_rest.connection import register
register("cAsO2IG0vn5dWs7wFb4Dm1cBxAlfXsvk26sHqWkP", "aFbRLKJtrub3xHXtMTB165RVltweQ5B37qp6ceSg")

from parse_rest.datatypes import Object
from parse_rest.connection import ParseBatcher
from pgu import gui

class pointBase(Object):
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
device_ID = "lojsk123"


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

color = 20, 20, 20
white = 255,255,255
screen = pygame.display.set_mode(size)

last_pos = -1,-1
size = 10, 10

enemies = [[]]
enemies_name = [0]
e_count = 1
selected_object = 0
start_button_position = 140
start_button_left = 0

rocket_choose = []

for x in range(0, 12):
    rocket_choose.append([str(x),(x*20+10,40,0)])
    


myfont = pygame.font.Font(None,18)
selected_enemy = rocket_choose[0]

edit_mode = False
label_edit = " edit"

last_time = time.time()
exported_time = time.time()

x_img = pygame.image.load("x_min.png")
x_img_rect = x_img.get_rect()

yes_img = pygame.image.load("yes.png")
yes_img_rect = x_img.get_rect()

in_drag = -1

active = -1
start_position = 200
speed = 200
y_os = 50

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
    
    # click
    if pygame.mouse.get_pressed()[0] and last_pos != pygame.mouse.get_pos() and pygame.mouse.get_pos()[0] <= 420 and edit_mode == False:  
        last_pos = pygame.mouse.get_pos()
        enemies[selected_object].append([(last_pos[0], last_pos[1] - y_os), selected_enemy])
        start_position += 50
        #print pygame.mouse.get_pos()
        active = -1
    
    # object
    enemy_line = []
    for line_count, rocket in enumerate(enemies):
        enemy_line.append([])
        
        # secound line
        start_button_left_a = 0
        next_line = 0
        if line_count > 10:
            start_button_left_a = 140
            next_line = 11*25
        
        # selected object
        if selected_object == line_count:
            start_button_left = 0
            if selected_object > 3:
                start_button_left = 140
            screen.blit(yes_img, (535+start_button_left_a, start_button_position+line_count*25-next_line))
                

        # enemy list
        if button_alloc((450+start_button_left_a, start_button_position+line_count*25-next_line, 85, 20)," rocket "+str(enemies_name[line_count])):
            selected_object = line_count
        screen.blit(x_img, (430+start_button_left_a, start_button_position+line_count*25-next_line))
        if button_alloc((430+start_button_left_a, start_button_position+line_count*25-next_line, 20, 20),""):
            enemies.pop(line_count)
            if selected_object == line_count:
                selected_object -= 1
            if selected_object > len(enemies)-1:
                selected_object = len(enemies)-1
                
            enemies_name.pop(line_count)
            
    
        for count, ob in enumerate(rocket):
            x = ob[0][0]-size[0]/2 
            y = ob[0][1]-size[1]/2 + y_os
            color = ob[1][1]
            pygame.draw.rect (screen, color, Rect(x, y, size[0], size[1]))   
            enemy_line[line_count].append((ob[0][0], ob[0][1] + y_os))
            if edit_mode == True:
                if keys[K_d]:
                    screen.blit(x_img, (x - x_img_rect[2]/2 ,y - x_img_rect[3]/2,20,20))
                # drag code
                if pygame.mouse.get_pressed()[0]:
                    if in_drag == -1 or in_drag == count:
                        click_element = pygame.mouse.get_pos()
                        if button_click([x, y, size[0], size[1]], click_element) or count == in_drag:
                            keys=pygame.key.get_pressed()
                            if keys[K_d]:
                                enemies[line_count].remove(rocket[count])
                            else:
                                if selected_object == line_count:
                                    in_drag = count
                                    rocket[count][0] = (click_element[0],click_element[1] - y_os)                  
                else:
                    in_drag = -1

    # lines
    for line_count, line in enumerate(enemy_line):
        if len(line) > 1:
            color = (0,0,0)
            if selected_object == line_count:
                color = (0,20,160)
            pygame.draw.lines(screen, color, False, line, 2)     
    
    # legend click
    
    # legend
    b = False
    if pygame.mouse.get_pressed()[0] and last_pos != pygame.mouse.get_pos():
        last_pos = pygame.mouse.get_pos()
        b = True
    
    label = myfont.render("slow", 1, (0,0,0))
    screen.blit(label, (legend_y, 40))
    
    for count, legend in enumerate(rocket_choose):
        pygame.draw.rect (screen, legend[1], Rect(legend_y, 20 , size[0], size[1]))
        if b:
            if button_click((legend_y, 20, size[0], size[1]), last_pos):
                selected_enemy = rocket_choose[count]
        
        legend_y += 20
        
    label = myfont.render("fast", 1, (0,0,0))
    screen.blit(label, (legend_y-30, 40))
    
    # current choose
    pygame.draw.rect (screen, selected_enemy[1], Rect(520, 68, size[0], size[1]))
    label = myfont.render(selected_enemy[0], 1, (0,0,0))
    screen.blit(label, (550, 68))
    
    label = myfont.render("selected: ", 1, (0,0,0))
    screen.blit(label, (450, 68))
    
    # back button
    if button_alloc((450, 618, 85, 20)," remove last"):
        enemies[selected_object].remove(enemies[selected_object][len(enemies[selected_object])-1])
        
    # export
    if button_alloc((450, 648, 85, 20)," export"):
        # delete last one
        dev_delete = pointBase.Query.filter(id_devices=device_ID)
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
        
        for rocket_num, one in enumerate(enemies):
            # create new one
            rocket_id = str(time.time())
            pointts = []
            
            batcher = ParseBatcher()
            save_limit = 0
            all_object = 0
            for count in range(0, len(one)):
                if count == 0:
                    firstT = [(50, y_os), ['1', (70, 40, 0)]]
                else:
                    firstT = one[count-1]
                v1 = (one[count][0][0] - firstT[0][0])*2 #- one[count-1][0][0]
                v2 = (one[count][0][1] - firstT[0][1])*2 #- one[count-1][0][1]
                if one[count][1][0] == '0':
                    t = 0
                else:
                    t = math.sqrt((v1)**2 + (v2)**2)/(float(one[count][1][0])*50)
                
                pointt = pointBase(id_line=count+1, id_rocket="Rocket"+str(rocket_num), pos_x=v1, pos_y=v2, speed=t, id_devices=device_ID)
                pointts.append(pointt)
                
                save_limit += 1
                if save_limit >= 49:
                    batcher.batch_save(pointts)
                    pointts = []
                    save_limit = 0
                
                all_object += 1
                
                
            if pointts:
                batcher.batch_save(pointts)

        exported = "sucesfully exported !!!"
        exported_time = time.time() + 3
        label = myfont.render("", 1, (200,0,0))
        screen.blit(label, (450, 580))
     
    if exported_time > time.time():           
        label = myfont.render(exported, 1, (200,0,0))
        screen.blit(label, (450, 580))
    
    # new rocket
    if button_alloc((450, 100, 85, 20)," new rocket"):
        selected_object += 1
        enemies.append([])
        enemies_name.append(e_count)
        e_count += 1
    
    # edit button    
    if button_alloc((550, 618, 85, 20), label_edit):
        if edit_mode:
            edit_mode = False
            label_edit = " edit"
        else:
            edit_mode = True
            label_edit = " build"
    
    # save
    if button_alloc((550, 648, 85, 20), " Open/Save"):
        app.run(main)
        if save_open == "Open":   
            enemies = []
            enemies_name = []
            active = -1         
            with open(input_file.value) as f:
                for line in f:
                    if line.startswith("---"):
                        enemies_name.append(int(line.replace("-","")))
                        enemies.append([])
                        active += 1
                        e_count = int(line.replace("-",""))+1
                        selected_object = int(line.replace("-",""))
                    else:
                        el = line.split("|")
                        enemies[active].append([(int(el[0]), int(el[1])), [el[2], (int(el[3]), int(el[4]), int(el[5].replace("","\n")))]])
                        
        else: 
            if save_open == "Save":
                f = open(input_fileS.value, 'w')
                all_input = ""
                for con1, onen in enumerate(enemies):
                    all_input += "---"+str(enemies_name[con1])+"---\n"
                    for a in onen:
                        all_input += str(a[0][0])+"|"+str(a[0][1])+"|"+str(a[1][0])+"|"+str(a[1][1][0])+"|"+str(a[1][1][1])+"|"+str(a[1][1][2])+"\n"
                f.write(all_input)
                f.close()
    
    # update
    pygame.display.update()   
     
    