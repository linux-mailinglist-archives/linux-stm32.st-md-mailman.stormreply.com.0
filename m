Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2F974D0BF
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 11:00:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4390C6B463;
	Mon, 10 Jul 2023 09:00:14 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 084CCC6B459
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 09:00:14 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-3fbc244d384so43124425e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 02:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688979613; x=1691571613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fyyBvpSV8LxDog0ek0zaEgbX3az6xRdpMaG/0FwAEzQ=;
 b=3x1HBwDRhKRpNZtS59+egzHon09AC6viqlxvkgig2u73jYmx2KoeiJv1WiGL7psptP
 oMeODFZTw3hjHXmYBX3QeVeNKw79pLtGo6r+NUK4N7fgNxD5BWuk2ZA8IRrXTOF3GNvY
 fy3dAOOguHIKIbIra8lHLXaDJ2jRzs4s3csIvTScXvBfxT2bCY0/yXUoHOeVYZyUI9AC
 Mr7vbwGBMJuGhmekxfISybKSynGEb/+sV5B81QyA/7tCGowtlyzQPum6C8WZmps/VrLm
 wx5ymFtihSkmQ9FjnCaVtJMJzrwb7VXinhrIMOtWXm5HiUsVkNJedZyIZk2jOb33wNds
 tO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688979613; x=1691571613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fyyBvpSV8LxDog0ek0zaEgbX3az6xRdpMaG/0FwAEzQ=;
 b=WPxG1JrAj+s2HFhNieQskFgAHide0nwyO53zoxynvC4CkOWcx4Y0+Wx4X0mlV/nX8d
 B7o/ElJua0mQoLZl5Iu2NGc6aN2RCmxCNFBy7cDaJlhHFSrXY5lhpNaGG5FGZtSqYGPT
 T0AHZ6t497LYt/PE2sNtILXcnEoXKjxyDtNYOsQJbqgm39qfuibA2AQ25ZIleQGeuO2Z
 mRfZXuuLKM4UZtvjPgPv07XZD/FHD7AsoF1r8tmKAcCxBpkkzvM4qYKtDuAJz+i3zxGI
 4+9LB8aGOu6CpH8tHP6w8eENnamw/oGVmn/jNpl/76YKSuiA97imb9FeG9IFnWM1xu2p
 3eeg==
X-Gm-Message-State: ABy/qLZ1iVmJozb5KxEjCA57BQJcK8sbgRufXFlzjl3JP/vbF9wqnUEj
 +2atjP0cQaH8g8DOAszUviBxgA==
X-Google-Smtp-Source: APBJJlE0CWZzeJZ8TiwIWmaXT0WdMJVW73xR7UitbR/EEdZvdmMI1C9Osy594l6Z5i7AebtR9dEpZA==
X-Received: by 2002:a05:600c:378b:b0:3fb:ffa8:6d78 with SMTP id
 o11-20020a05600c378b00b003fbffa86d78mr7014533wmr.36.1688979613585; 
 Mon, 10 Jul 2023 02:00:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6002:540:6954:abdd])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c0b4600b003fc00702f65sm8581045wmr.46.2023.07.10.02.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 02:00:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Mon, 10 Jul 2023 10:59:51 +0200
Message-Id: <20230710090001.303225-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230710090001.303225-1-brgl@bgdev.pl>
References: <20230710090001.303225-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v3 02/12] net: stmmac: replace the
	sph_disable field with a flag
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
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c       | 3 ++-
 include/linux/stmmac.h                                  | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 9f88530c5e8c..0c12ab67c27b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -359,7 +359,7 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	data->fix_mac_speed = tegra_eqos_fix_speed;
 	data->init = tegra_eqos_init;
 	data->bsp_priv = eqos;
-	data->sph_disable = 1;
+	data->flags |= STMMAC_FLAG_SPH_DISABLE;
 
 	err = tegra_eqos_init(pdev, eqos);
 	if (err < 0)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index ab9f876b6df7..ae5db39a3f1b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -459,7 +459,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->has_gmac4 = 1;
 	plat->force_sf_dma_mode = 0;
 	plat->tso_en = 1;
-	plat->sph_disable = 1;
+	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
 
 	/* Multiplying factor to the clk_eee_i clock time
 	 * period to make it closer to 100 ns. This value
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 38b6cbd8a133..18e56299363d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7258,7 +7258,8 @@ int stmmac_dvr_probe(struct device *device,
 		dev_info(priv->device, "TSO feature enabled\n");
 	}
 
-	if (priv->dma_cap.sphen && !priv->plat->sph_disable) {
+	if (priv->dma_cap.sphen &&
+	    !(priv->plat->flags & STMMAC_FLAG_SPH_DISABLE)) {
 		ndev->hw_features |= NETIF_F_GRO;
 		priv->sph_cap = true;
 		priv->sph = priv->sph_cap;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 8e7511071ef1..1b02f866316c 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -205,6 +205,7 @@ struct dwmac4_addrs {
 };
 
 #define STMMAC_FLAG_HAS_INTEGRATED_PCS		BIT(0)
+#define STMMAC_FLAG_SPH_DISABLE			BIT(1)
 
 struct plat_stmmacenet_data {
 	int bus_id;
@@ -292,7 +293,6 @@ struct plat_stmmacenet_data {
 	int msi_rx_base_vec;
 	int msi_tx_base_vec;
 	bool use_phy_wol;
-	bool sph_disable;
 	bool serdes_up_after_phy_linkup;
 	const struct dwmac4_addrs *dwmac4_addrs;
 	unsigned int flags;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
