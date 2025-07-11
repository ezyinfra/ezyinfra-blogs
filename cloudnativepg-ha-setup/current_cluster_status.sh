for i in 0 1 2; do
  echo "cluster-example-$i:";
  kubectl exec -it cluster-example-$i -c postgres -- psql -U postgres -d appdb -c "SELECT pg_is_in_recovery();"
  echo "---"
done