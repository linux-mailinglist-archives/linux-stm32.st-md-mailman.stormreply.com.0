Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5BE74D0CE
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 11:00:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D0E0C6B468;
	Mon, 10 Jul 2023 09:00:23 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EA8AC6B464
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 09:00:22 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-3fc02a92dcfso24132475e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 02:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688979622; x=1691571622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0pIcENny5wyN4aPPTX4E5kR9KARmjXxn8moCsW/zSJ4=;
 b=qHi6944tfn6w2OwrVVheZEXG2d9WTo+xLq3PZ0U82Cb2ffAvFnmHpBpLdSUkfDWe4O
 ++6LVWYpeg4A2sxrONLsAJ7jjLcBfSilqscpHFXoMCMPDles2G2b5wMYWiIE6KqLpRdM
 ZOu3tTL9l6a/GJ1rsZl0aaySX9bD08RyXQbv+Z+zuP6/EiVAHWuGiZSSBdhua72/5Xdp
 nYegQtgjuflcZjTUXTrnTupLwVq2GMQBVAzJyl8aJ7ItI6FuhNFkjJb4Fe5FUzE0sjtf
 aQioqMAwNhSnuFvTALABdUSvclfKnb+6B+hTesZ5qU6vPEKqtdIt2dSyeWY2bNyYgsIB
 7l1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688979622; x=1691571622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0pIcENny5wyN4aPPTX4E5kR9KARmjXxn8moCsW/zSJ4=;
 b=gu4yFd0ntPlkOhRMuyrinurXEQvnIxyCDtUFb2JOcm6m9DfhqslGq/HWWgCw9alPs4
 9BBgZm2A8nWjWVXrhY631v/BuILtEztyjtFZmov1kQ66GTKhkPnl1UXpQYrTBX+0zKYO
 kJsy6HMYaNJmqE7DwuYb/GBk/wtAXj2UvDu6z5ih5jiv9QkT7uEXm1Tyl3sqr/r1beJc
 +h3IdBweHlium9s7lbF3FuijBU9rhUlTwFiPFMEW1mAHH+tM95DHAklTXwI93FaEdORc
 sX+ytxpRbP1gqJVxO/MHcZL4xboC/KVNgYNj69uoVk5HPUBNCzALJjVQmvdxuK+6uJim
 2uTw==
X-Gm-Message-State: ABy/qLYo9ZaNWd43Jo62Qz4NHxNPKeXHzaJNDG6KniSgX4D/QI58cg/d
 bIOK+U+sF/EZrwO6J9Y+0fa+Dw==
X-Google-Smtp-Source: APBJJlF3vmekHxIVb3j8B+wKlmnAbsnqe6QaDOHCTG1RL+70XHfWoQqWSxwZM3a9bpcOPWpDVPhiBQ==
X-Received: by 2002:a7b:c7d2:0:b0:3fb:b18e:9b1a with SMTP id
 z18-20020a7bc7d2000000b003fbb18e9b1amr11633905wmk.8.1688979622013; 
 Mon, 10 Jul 2023 02:00:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6002:540:6954:abdd])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c0b4600b003fc00702f65sm8581045wmr.46.2023.07.10.02.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 02:00:21 -0700 (PDT)
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
Date: Mon, 10 Jul 2023 10:59:57 +0200
Message-Id: <20230710090001.303225-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230710090001.303225-1-brgl@bgdev.pl>
References: <20230710090001.303225-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v3 08/12] net: stmmac: replace the
	multi_msi_en field with a flag
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++---
 include/linux/stmmac.h                            | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 1f1bc99571a5..d8bcf9452197 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -953,7 +953,7 @@ static int stmmac_config_single_msi(struct pci_dev *pdev,
 
 	res->irq = pci_irq_vector(pdev, 0);
 	res->wol_irq = res->irq;
-	plat->multi_msi_en = 0;
+	plat->flags &= ~STMMAC_FLAG_MULTI_MSI_EN;
 	dev_info(&pdev->dev, "%s: Single IRQ enablement successful\n",
 		 __func__);
 
@@ -1005,7 +1005,7 @@ static int stmmac_config_multi_msi(struct pci_dev *pdev,
 	if (plat->msi_sfty_ue_vec < STMMAC_MSI_VEC_MAX)
 		res->sfty_ue_irq = pci_irq_vector(pdev, plat->msi_sfty_ue_vec);
 
-	plat->multi_msi_en = 1;
+	plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
 	dev_info(&pdev->dev, "%s: multi MSI enablement successful\n", __func__);
 
 	return 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c5763f60c6ef..ebe82e7b50fc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3711,7 +3711,7 @@ static int stmmac_request_irq(struct net_device *dev)
 	int ret;
 
 	/* Request the IRQ lines */
-	if (priv->plat->multi_msi_en)
+	if (priv->plat->flags & STMMAC_FLAG_MULTI_MSI_EN)
 		ret = stmmac_request_irq_multi_msi(dev);
 	else
 		ret = stmmac_request_irq_single(dev);
@@ -5954,7 +5954,7 @@ static void stmmac_poll_controller(struct net_device *dev)
 	if (test_bit(STMMAC_DOWN, &priv->state))
 		return;
 
-	if (priv->plat->multi_msi_en) {
+	if (priv->plat->flags & STMMAC_FLAG_MULTI_MSI_EN) {
 		for (i = 0; i < priv->plat->rx_queues_to_use; i++)
 			stmmac_msi_intr_rx(0, &priv->dma_conf.rx_queue[i]);
 
@@ -7169,7 +7169,8 @@ int stmmac_dvr_probe(struct device *device,
 	priv->plat = plat_dat;
 	priv->ioaddr = res->addr;
 	priv->dev->base_addr = (unsigned long)res->addr;
-	priv->plat->dma_cfg->multi_msi_en = priv->plat->multi_msi_en;
+	priv->plat->dma_cfg->multi_msi_en =
+		(priv->plat->flags & STMMAC_FLAG_MULTI_MSI_EN);
 
 	priv->dev->irq = res->irq;
 	priv->wol_irq = res->wol_irq;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 155cb11b1c8a..3365b8071686 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -211,6 +211,7 @@ struct dwmac4_addrs {
 #define STMMAC_FLAG_TSO_EN			BIT(4)
 #define STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP	BIT(5)
 #define STMMAC_FLAG_VLAN_FAIL_Q_EN		BIT(6)
+#define STMMAC_FLAG_MULTI_MSI_EN		BIT(7)
 
 struct plat_stmmacenet_data {
 	int bus_id;
@@ -286,7 +287,6 @@ struct plat_stmmacenet_data {
 	int ext_snapshot_num;
 	bool int_snapshot_en;
 	bool ext_snapshot_en;
-	bool multi_msi_en;
 	int msi_mac_vec;
 	int msi_wol_vec;
 	int msi_lpi_vec;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
