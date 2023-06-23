Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CCD73B499
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 12:08:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A75FC6B457;
	Fri, 23 Jun 2023 10:08:57 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD245C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 10:08:55 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-3f9ede60140so5385925e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 03:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687514935; x=1690106935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1HRVKBhefxoQaIrrk1E+lF53Gj3p4Z+uWDwMbBoofOY=;
 b=OemuTJCWfC5VWij5fB4MS4ju7PFwOzlbykJyaXqedjZ+76URX44WT/HdxYIMwy8WVb
 EDioSsGVE22zZ24I2YyJsgPd0ATIyEY50xkU+Xm39nJ1MjkhgwS3owOV8EuYxKHPpETc
 aIpWXmGrn2GCP3/abQ40aC/U4dE46esG0ULnxgiK8YLcwxNbNDx98asXbZ/a3dMa94Lr
 4uYdP+lELTweB056/N/i52IkUKzRSMZ/u5uLn/vDZAcVv7r+CJQbV4T22wvCixtIGOFQ
 pHHUjz1Q3xlpIhavVcBeihW/cgN2j4yCrGpT3thENVf81rckuX3uPt7wXPvI+N3P2R0h
 yZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687514935; x=1690106935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1HRVKBhefxoQaIrrk1E+lF53Gj3p4Z+uWDwMbBoofOY=;
 b=JlncRCiie9K1V/hdGZi0XVOLDdru1f6MvRY2QGQNx2IYbrKzcg/NHu8Q16kLvNh26h
 SLBXvZXc3CWP+vHchg03/oKog/+wvEKMaAP5NIQpwtfWanEZJrChxQtQnVWwhuRHL1br
 gD2ZbqQvlRRIQ5o6/4I6FMbHd/z+NVqG5MW2ng3UAOQkotvvR8Ywy8o8IPoyBgQadRdZ
 wsktxOM5P8Hin+/JESlQGipGSQI/o9ZdxeZitfMZf7uZ6tIyMLfsaFWUoc9SE4I0lwlE
 uCpECtfl6erCjBGc9yiMe4DhGJ/4qHYWwchBRztyisWf+8gE62qFp/k/xg1lZfX7tseL
 4DYA==
X-Gm-Message-State: AC+VfDxM4HOKXMZqM3tS7v+ZBpGKvGSaAOg2osBvenCAt2Nwnias9Lke
 b/Lv/gXygDN1xMrHkb8GgPTpbw==
X-Google-Smtp-Source: ACHHUZ6DlvdaPd+U5SDulK33NhxI1nKFSmpmi/GYBjmKv0HD9ZzOduqx5doEBd+NCwuHjt1hIwG0ig==
X-Received: by 2002:a1c:7c17:0:b0:3fa:76e2:e6e3 with SMTP id
 x23-20020a1c7c17000000b003fa76e2e6e3mr2712678wmc.34.1687514935529; 
 Fri, 23 Jun 2023 03:08:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
 by smtp.gmail.com with ESMTPSA id
 k18-20020adfe8d2000000b0030ae3a6be4asm9278100wrn.72.2023.06.23.03.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 03:08:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>
Date: Fri, 23 Jun 2023 12:08:38 +0200
Message-Id: <20230623100845.114085-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623100845.114085-1-brgl@bgdev.pl>
References: <20230623100845.114085-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 05/12] net: stmmac: replace the
	tso_en field with a flag
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Drop the boolean field of the plat_stmmacenet_data structure in favor of a
simple bitfield flag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c       | 3 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ++-
 drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c       | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c        | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c   | 6 ++++--
 include/linux/stmmac.h                                  | 2 +-
 8 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 0c12ab67c27b..b5efd9c2eac7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -113,7 +113,7 @@ static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
 	/* dwc-qos needs GMAC4, AAL, TSO and PMT */
 	plat_dat->has_gmac4 = 1;
 	plat_dat->dma_cfg->aal = 1;
-	plat_dat->tso_en = 1;
+	plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	plat_dat->pmt = 1;
 
 	return 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 44a84a6c18ce..faa6f4ec6838 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -458,8 +458,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->has_gmac = 0;
 	plat->has_gmac4 = 1;
 	plat->force_sf_dma_mode = 0;
-	plat->tso_en = 1;
-	data->flags |= STMMAC_FLAG_SPH_DISABLE;
+	plat->flags |= (STMMAC_FLAG_TSO_EN | STMMAC_FLAG_SPH_DISABLE);
 
 	/* Multiplying factor to the clk_eee_i clock time
 	 * period to make it closer to 100 ns. This value
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 44151e69f9ce..79e196397aea 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -787,7 +787,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
-	plat_dat->tso_en = of_property_read_bool(np, "snps,tso");
+	if (of_property_read_bool(np, "snps,tso"))
+		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
 		plat_dat->rx_clk_runs_in_lpi = 1;
 	if (data->has_integrated_pcs)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
index f8367c5b490b..5e8aa03cffae 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
@@ -290,7 +290,7 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
 	}
 
 	plat->has_xgmac = 1;
-	plat->tso_en = 1;
+	plat->flags |= STMMAC_FLAG_TSO_EN;
 	plat->pmt = 1;
 	plat->bsp_priv = mgbe;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3df32658b5bb..73002ed923aa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5677,7 +5677,7 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
 		features &= ~NETIF_F_CSUM_MASK;
 
 	/* Disable tso if asked by ethtool */
-	if ((priv->plat->tso_en) && (priv->dma_cap.tsoen)) {
+	if ((priv->plat->flags & STMMAC_FLAG_TSO_EN) && (priv->dma_cap.tsoen)) {
 		if (features & NETIF_F_TSO)
 			priv->tso = true;
 		else
@@ -7250,7 +7250,7 @@ int stmmac_dvr_probe(struct device *device,
 		ndev->hw_features |= NETIF_F_HW_TC;
 	}
 
-	if ((priv->plat->tso_en) && (priv->dma_cap.tsoen)) {
+	if ((priv->plat->flags & STMMAC_FLAG_TSO_EN) && (priv->dma_cap.tsoen)) {
 		ndev->hw_features |= NETIF_F_TSO | NETIF_F_TSO6;
 		if (priv->plat->has_gmac4)
 			ndev->hw_features |= NETIF_F_GSO_UDP_L4;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 644bb54f5f02..352b01678c22 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -77,7 +77,7 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 	plat->clk_csr = 5;
 	plat->has_gmac4 = 1;
 	plat->force_sf_dma_mode = 1;
-	plat->tso_en = 1;
+	plat->flags |= STMMAC_FLAG_TSO_EN;
 	plat->pmt = 1;
 
 	/* Set default value for multicast hash bins */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 3c6b55b60461..5a67af4526c7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -524,7 +524,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->has_gmac4 = 1;
 		plat->has_gmac = 0;
 		plat->pmt = 1;
-		plat->tso_en = of_property_read_bool(np, "snps,tso");
+		if (of_property_read_bool(np, "snps,tso"))
+			plat->flags |= STMMAC_FLAG_TSO_EN;
 	}
 
 	if (of_device_is_compatible(np, "snps,dwmac-3.610") ||
@@ -537,7 +538,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	if (of_device_is_compatible(np, "snps,dwxgmac")) {
 		plat->has_xgmac = 1;
 		plat->pmt = 1;
-		plat->tso_en = of_property_read_bool(np, "snps,tso");
+		if (of_property_read_bool(np, "snps,tso"))
+			plat->flags |= STMMAC_FLAG_TSO_EN;
 	}
 
 	dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*dma_cfg),
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 66dcf84d024a..47ae29a98835 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -208,6 +208,7 @@ struct dwmac4_addrs {
 #define STMMAC_FLAG_SPH_DISABLE			BIT(1)
 #define STMMAC_FLAG_USE_PHY_WOL			BIT(2)
 #define STMMAC_FLAG_HAS_SUN8I			BIT(3)
+#define STMMAC_FLAG_TSO_EN			BIT(4)
 
 struct plat_stmmacenet_data {
 	int bus_id;
@@ -271,7 +272,6 @@ struct plat_stmmacenet_data {
 	struct reset_control *stmmac_ahb_rst;
 	struct stmmac_axi *axi;
 	int has_gmac4;
-	bool tso_en;
 	int rss_en;
 	int mac_port_sel_speed;
 	bool en_tx_lpi_clockgating;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
