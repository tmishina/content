documentation_complete: true

title: 'CIS Red Hat OpenShift Container Platform 4 Benchmark for ROKS cluster'

platform: ocp4-node

metadata:
    SMEs:
        - JAORMX
        - mrogers950
        - jhrozek
        - tmishina

description: |-
    Custom profile for ROKS clusters.

selections:
  ### 4 Worker Nodes
  ###
  #### 4.1 Worker node configuration
  # 4.1.1 Ensure that the kubelet service file permissions are set to 644 or more restrictive
    - file_permissions_worker_service
  # 4.1.2 Ensure that the kubelet service file ownership is set to root:root
    - file_owner_worker_service
    - file_groupowner_worker_service
  # 4.1.5 Ensure that the --kubeconfig kubelet.conf file permissions are set to 644 or more restrictive
    - file_permissions_kubelet_conf
  # 4.1.6 Ensure that the --kubeconfig kubelet.conf file ownership is set to root:root
    - file_groupowner_kubelet_conf
    - file_owner_kubelet_conf
  # 4.1.7 Ensure that the certificate authorities file permissions are set to 644 or more restrictive
    - file_permissions_worker_ca
  # 4.1.8 Ensure that the client certificate authorities file ownership is set to root:root
    - file_owner_worker_ca
    - file_groupowner_worker_ca
  # 4.1.9 Ensure that the kubelet --config configuration file has permissions set to 644 or more restrictive
    - file_permissions_worker_kubeconfig
  # 4.1.10 Ensure that the kubelet configuration file ownership is set to root:root
    - file_owner_worker_kubeconfig
    - file_groupowner_worker_kubeconfig
  #### 4.2 Kubelet
  # 4.2.1 Ensure that the --anonymous-auth argument is set to false
    - kubelet_anonymous_auth
  # 4.2.2 Ensure that the --authorization-mode argument is not set to AlwaysAllow
    - kubelet_authorization_mode
  # 4.2.3 Ensure that the --client-ca-file argument is set as appropriate
    - kubelet_configure_client_ca
  # 4.2.4 Ensure that the --read-only-port argument is set to 0
    - kubelet_disable_readonly_port
  # 4.2.5 Ensure that the --streaming-connection-idle-timeout argument is not set to 0
    - kubelet_enable_streaming_connections
  # 4.2.6 Ensure that the --protect-kernel-defaults argument is set to true
    #- kubelet_enable_protect_kernel_defaults
  # 4.2.7 Ensure that the --make-iptables-util-chains argument is set to true
    - kubelet_enable_iptables_util_chains
  # 4.2.8 Ensure that the --hostname-override argument is not set
  #  - kubelet_disable_hostname_override
  # 4.2.9 Ensure that the --event-qps argument is set to 0 or a level which ensures appropriate event capture
    - kubelet_configure_event_creation
  # 4.2.10 Ensure that the --tls-cert-file and --tls-private-key-file arguments are set as appropriate
    - kubelet_configure_tls_cert
    # Like kubelet_disable_readonly_port but check for .apiServerArguments["kubelet-client-certificate"]
    - kubelet_configure_tls_key
    # Like kubelet_disable_readonly_port but check for .apiServerArguments["kubelet-client-key"]
  # 4.2.11 Ensure that the --rotate-certificates argument is not set to false
    - kubelet_enable_client_cert_rotation
    - kubelet_enable_cert_rotation
  # 4.2.12 Verify that the RotateKubeletServerCertificate argument is set to true
    - kubelet_enable_server_cert_rotation
  # 4.2.13 Ensure that the Kubelet only makes use of Strong Cryptographic Ciphers
