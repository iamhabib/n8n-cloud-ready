#!/bin/bash
source ./bash/utility.sh
source ./bash/docker.sh
source ./bash/nginx.sh
source ./bash/certbot.sh

    # Get the ENV from the .env file
    read_env_file

    automation_options=(
        "Install Docker"                            #0
        "Install Docker Compose"                    #1
        "Docker Compose Up"                         #2
        "Docker Compose Down"                       #3
        "Docker PS"                                 #4
        "Delete All Unused Docker Images"           #5
        "Set Swap Memory"                           #6
        "Create NGINX Server Block"                 #7
        "Delete NGINX Server Block"                 #8
        "Install Lets Encrypt SSL Certificate"      #9
        "Quit"                                      #10
    )

    show_heading "Select Your Automation Option: "
    selected_automation=$(get_selection "${automation_options[@]}")

    if [ "$selected_automation" = "${automation_options[0]}" ]; then
        # Install Docker and Docker Compose
        install_docker
    elif [ "$selected_automation" = "${automation_options[1]}" ]; then
        install_docker_compose
    elif [ "$selected_automation" = "${automation_options[2]}" ]; then

        # call function docker->docker_compose_down to stop all containers
        docker_compose_down

        display "danger" "ENV File: ===================START================"
        cat .env
        display "danger" "ENV File: ====================END================="

        # call function docker->docker_compose_up to start all containers
        docker_compose_up

        # Display the status of the containers
        docker ps

    elif [ "$selected_automation" = "${automation_options[3]}" ]; then
        # call function docker->docker_compose_down to stop all containers
        docker_compose_down
    elif [ "$selected_automation" = "${automation_options[4]}" ]; then
        docker ps
    elif [ "$selected_automation" = "${automation_options[5]}" ]; then
        # Delete all unused Docker images
        docker image prune -a
        docker system prune --volumes
        display "success" "All unused Docker images and volumes were deleted"
    elif [ "$selected_automation" = "${automation_options[6]}" ]; then
        #    Set Swap Memory
        setup_swap_memory
    elif [ "$selected_automation" = "${automation_options[7]}" ]; then
        # Add NGINX Server Block
        set_up_host_machine_nginx
    elif [ "$selected_automation" = "${automation_options[8]}" ]; then
        # Delete NGINX Server Block
        remove_host_machine_nginx
    elif [ "$selected_automation" = "${automation_options[9]}" ]; then
        # Install Lets Encrypt SSL Certificate
        install_ssl_certificate
    fi

