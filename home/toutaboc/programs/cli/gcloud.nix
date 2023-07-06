{ pkgs, ... }: {

  home.packages = with pkgs; [
    (
      google-cloud-sdk.withExtraComponents [
        google-cloud-sdk.components.cloud-build-local
        google-cloud-sdk.components.gke-gcloud-auth-plugin
      ]
    )
  ];
}
