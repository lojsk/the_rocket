import os, sys, pygame
import time
from pygame.locals import *
pygame.init()
pygame.font.init()

size = width, height = 700, 668

color = 20, 20, 20
white = 255,255,255
screen = pygame.display.set_mode(size)

last_pos = -1,-1
size = 20, 20

enemy = []
rocket_choose = [
    ["red", (20,20,20)],
    ["x", (120,120,120)], 
    ["bla", (180,180,180)]
]


myfont = pygame.font.Font("UbuntuMono-Regular.ttf", 14)
selected_enemy = rocket_choose[1]

edit_mode = False
label_edit = " edit"

last_time = time.time()

x_img = pygame.image.load("x_min.png")
x_img_rect = x_img.get_rect()
in_drag = -1

def button_click(area, last):
    if area[0] < last[0] and area[1] < last[1] and area[0]+area[2] > last[0] and area[1]+area[3] > last[1]:
        return True
    return False
    
def button_alloc(area, title):
    global last_time
    label = myfont.render(title, 1, (0,0,0))
    screen.blit(label, (area[0], area[1]))
    pygame.draw.rect (screen, (0,0,0), Rect(area[0], area[1], area[2], area[3]), 1)
    
    if pygame.mouse.get_pressed()[0]:
        if button_click(area, pygame.mouse.get_pos()):
            if last_time+0.5 < time.time():
                last_time = time.time()
                return True
    return False


while 1:
    legend_y = 50
    
    for event in pygame.event.get():
        if event.type==QUIT:
            pygame.quit()
            sys.exit()
    
    # screen
    screen.fill((255,255,255))        
    pygame.draw.rect (screen, (0,0,0), Rect(50, 50, 320, height-100), 2)
    pygame.draw.lines(screen, (0,0,0), False, [(420,0), (420, height)], 2)
    
    # click
    if pygame.mouse.get_pressed()[0] and last_pos != pygame.mouse.get_pos() and pygame.mouse.get_pos()[0] <= 420 and edit_mode == False:  
        last_pos = pygame.mouse.get_pos()
        enemy.append([pygame.mouse.get_pos(), selected_enemy])
        print pygame.mouse.get_pos()
    
    # object
    enemy_line = []
    for count, ob in enumerate(enemy):
        x = ob[0][0]-size[0]/2
        y = ob[0][1]-size[1]/2
        pygame.draw.rect (screen, ob[1][1], Rect(x, y, size[0], size[1]))   
        enemy_line.append((ob[0][0], ob[0][1]))
        if edit_mode == True:
            screen.blit(x_img, (x - x_img_rect[2]/2 ,y - x_img_rect[3]/2,20,20))
            # drag code
            if pygame.mouse.get_pressed()[0]:
                if in_drag == -1 or in_drag == count:
                    click_element = pygame.mouse.get_pos()
                    if button_click([x, y, size[0], size[1]], click_element) or count == in_drag:
                        in_drag = count
                        enemy[count][0] = (click_element[0],click_element[1])
                else:
                    button_click()
            else:
                
                in_drag = -1
        # help line code

    
    # lines
    if len(enemy_line) > 1 and edit_mode == False:
        pygame.draw.lines(screen, (0,0,0), False, enemy_line, 1)     
    
    # legend click
    
    # legend
    b = False
    if pygame.mouse.get_pressed()[0] and last_pos != pygame.mouse.get_pos():
        last_pos = pygame.mouse.get_pos()
        b = True
    
    for count, legend in enumerate(rocket_choose):
        pygame.draw.rect (screen, legend[1], Rect(450, legend_y, size[0], size[1]))
        label = myfont.render(legend[0], 1, (0,0,0))
        screen.blit(label, (480, legend_y))
        if b:
            if button_click((450, legend_y, size[0], size[1]), last_pos):
                selected_enemy = rocket_choose[count]
        
        legend_y += 50
    
    # current choose
    pygame.draw.rect (screen, selected_enemy[1], Rect(520, 568, size[0], size[1]))
    label = myfont.render(selected_enemy[0], 1, (0,0,0))
    screen.blit(label, (550, 568))
    
    label = myfont.render("selected: ", 1, (0,0,0))
    screen.blit(label, (450, 568))
    
    # back button
    if button_alloc((450, 618, 85, 20)," remove last"):
        enemy.remove(enemy[len(enemy)-1])
    
    # edit button    
    if button_alloc((550, 618, 85, 20), label_edit):
        if edit_mode:
            edit_mode = False
            label_edit = " edit"
        else:
            edit_mode = True
            label_edit = " build"
    
    # update
    pygame.display.update()   
     
    