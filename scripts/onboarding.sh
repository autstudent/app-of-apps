oc create serviceaccount k8sadmin -n default

oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:default:k8sadmin

oc adm policy add-cluster-role-to-user admin system:serviceaccount:openshift-gitops:openshift-gitops-argocd-server

oc -n default describe secret $(oc -n default get secret | (grep k8sadmin || echo "$_") | awk '{print $1}') | grep token: | awk '{print $2}'

oc new-project authentication

oc new-project monitoring