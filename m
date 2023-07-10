Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5CD74D0CB
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 11:00:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 580FFC6B45C;
	Mon, 10 Jul 2023 09:00:22 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12615C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 09:00:21 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-3fbfa811667so22328885e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 02:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688979620; x=1691571620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yqDy168k4TnvbweySqHfEZPadstBh9VaBWlyLgmDoG4=;
 b=4XppJ28QA7t1JSx0zGkQYQE+lcFRMRgyUHUeOKT+Xb+l3oojEo474/baSa9CEHJVne
 46K5dUKzG2MlT2LlVRJ0H3VLK8/N6g7abwGtGNIt6+86GEtrq+WfFChXBlEH3JEzc2GJ
 8B/OV4JOl7El3bon1Tay6tQJaN5Pxb4P+TGVcZQeMta3xTx7KUmSPulUle2T9DZ50ECR
 M2EahG5SrsyoXTudBFezKfkh15XlnV5D9LVqXJrY7OfTkvhaOcpd6I37kqOqwKr2oRnq
 JQhwD/InEs072T6LGrq39NcYZaCXUr1gyUwSQVCPX6GXfQa74MrVmCDsIemdY7LkSd3l
 Pq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688979620; x=1691571620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yqDy168k4TnvbweySqHfEZPadstBh9VaBWlyLgmDoG4=;
 b=XBvibh+/J2wQ0hsj9V4eOnklwiECYRVEeFov7K5xBH6QoPJ80Vtn/4UceBrs5pFHNx
 5udIlr31AgFElM3GpGkEaOAH6XxZ6VEtaxa9H5zPflyW1TLskRu1kHIpo+n5T5WjAlxN
 rKSy1av8AQZ+XbyEZV5x9REQBv3HbTWlZaj9eNfOJ/G1ISkIZpui1xtkJPV8/qWUuHue
 dc+dSw8A1bszKAjUHs05OeFbpVSExVjhoYJrdSoEXKTXAR2q0cgPEx1mvisSunAQQEoH
 L/Mr4VlW8T4F1GMcMLCFg4cduCCRa27i36Xv8YW375tsfMuphDpNBHsPt+jCHBZ8PwLF
 qLaw==
X-Gm-Message-State: ABy/qLYTgQAjDr8L+HCUW+Z69Me8xrsuMYdpNbEscnpIXHS50LLEk3AX
 wwnpb/vGRkceXq3DMhhjNwrRpg==
X-Google-Smtp-Source: APBJJlGujN4ftiSWThZXtM38s/Sf7sj7je+92ZALarqYsh+BvUKgcmZFzFsl5agwyjWOpH818Z6ueA==
X-Received: by 2002:a1c:cc02:0:b0:3fb:4064:7e22 with SMTP id
 h2-20020a1ccc02000000b003fb40647e22mr4839145wmb.19.1688979620728; 
 Mon, 10 Jul 2023 02:00:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6002:540:6954:abdd])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c0b4600b003fc00702f65sm8581045wmr.46.2023.07.10.02.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 02:00:20 -0700 (PDT)
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
Date: Mon, 10 Jul 2023 10:59:56 +0200
Message-Id: <20230710090001.303225-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230710090001.303225-1-brgl@bgdev.pl>
References: <20230710090001.303225-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v3 07/12] net: stmmac: replace the
	vlan_fail_q_en field with a flag
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 include/linux/stmmac.h                            | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index faa6f4ec6838..1f1bc99571a5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -560,7 +560,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	/* Set the maxmtu to a default of JUMBO_LEN */
 	plat->maxmtu = JUMBO_LEN;
 
-	plat->vlan_fail_q_en = true;
+	plat->flags |= STMMAC_FLAG_VLAN_FAIL_Q_EN;
 
 	/* Use the last Rx queue */
 	plat->vlan_fail_q = plat->rx_queues_to_use - 1;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d444514db07e..c5763f60c6ef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6923,7 +6923,8 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	if (priv->dma_cap.tsoen)
 		dev_info(priv->device, "TSO supported\n");
 
-	priv->hw->vlan_fail_q_en = priv->plat->vlan_fail_q_en;
+	priv->hw->vlan_fail_q_en =
+		(priv->plat->flags & STMMAC_FLAG_VLAN_FAIL_Q_EN);
 	priv->hw->vlan_fail_q = priv->plat->vlan_fail_q;
 
 	/* Run HW quirks, if any */
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index aeb3e75dc748..155cb11b1c8a 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -210,6 +210,7 @@ struct dwmac4_addrs {
 #define STMMAC_FLAG_HAS_SUN8I			BIT(3)
 #define STMMAC_FLAG_TSO_EN			BIT(4)
 #define STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP	BIT(5)
+#define STMMAC_FLAG_VLAN_FAIL_Q_EN		BIT(6)
 
 struct plat_stmmacenet_data {
 	int bus_id;
@@ -278,7 +279,6 @@ struct plat_stmmacenet_data {
 	bool en_tx_lpi_clockgating;
 	bool rx_clk_runs_in_lpi;
 	int has_xgmac;
-	bool vlan_fail_q_en;
 	u8 vlan_fail_q;
 	unsigned int eee_usecs_rate;
 	struct pci_dev *pdev;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
