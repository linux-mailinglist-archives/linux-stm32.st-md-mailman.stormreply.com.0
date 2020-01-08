Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EBE13394E
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2020 03:56:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1338C36B0B;
	Wed,  8 Jan 2020 02:56:33 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74FEAC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2020 02:56:31 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id x8so812328pgk.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jan 2020 18:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=QyroB5LXjxb8iNcU2ElAPCjALtlsDRJIi4SawaB0E7c=;
 b=E3n6Gk5MirvuWn2qz2nIHVm+5Hxjz4Nq4wAdMyekVm9lA2tuXwuqxrIjy+bHKC6aRy
 29YP9weDLGP7P9gpfg+rJTz8bKsZdziuhhe78aqk5P0FQYw1x1Cxt19eIwU3FiJ6Y/k7
 NwXUcOVepPCx6qcmZeR+tgGPaRqDgKb8TnZr5eOO6Qw/aIROygskXs0fAuif0zs0puaX
 h/4PakQlPNNXEue27pSySzbAqBiXhfLYjmtKEBgQj+uimEl4Q+aHoJ78jWSQW04VJ+Z7
 glvcWowQ6cbxVX7rUq4/7W7IeFANAJQqoleuAoftLI05xvciZ6epm3pCB+V5Xm/OFS0B
 6TWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QyroB5LXjxb8iNcU2ElAPCjALtlsDRJIi4SawaB0E7c=;
 b=qIrEOG/xzGU56cyrPEBkV/CfM5FY1xdysYFxOckU7QJUAZDnZ7hMP1aDdLFFoV4bLd
 TVNbdlC3Q2mU4c/d91EaKmFOES7PbWKgTbOyrmnoSvAzHvFB7jLgeOmuEZKZ82my34lC
 irqnu3zMxkfcRHqpdC2bWTnbP/Y0SvgkCe0edGyn5caM1qcCETgvHp8Zb5A0t5wSZgM/
 tFUSWHATFkxyabVXcIKyDSJZvKMBEOFmmTXOQTdpSQqclFUVcVKe+woDef8TIGFVuGpQ
 h97aDcBwCiXlT0OuIbTsPltsXJJMSJLjjtF8gwdn5M7bRsqKUhpIoqPTjvHYMNHVyij3
 J5iw==
X-Gm-Message-State: APjAAAUejzguK+OwUmkmHGkZ8iCHp/EQwzY/k1YrgvT+jemnTYAQzOu7
 h8vioE9aJH0bphUA93iRvM8=
X-Google-Smtp-Source: APXvYqx2B0gxIFJca1dgjrpJf7auzNgufbWz8vdqEcAFaSebP15mW1okQWAH7ySFcWH1sK9e1o+WwA==
X-Received: by 2002:a65:538b:: with SMTP id x11mr2823226pgq.395.1578452189886; 
 Tue, 07 Jan 2020 18:56:29 -0800 (PST)
Received: from localhost (199.168.140.36.16clouds.com. [199.168.140.36])
 by smtp.gmail.com with ESMTPSA id 144sm1021480pfc.124.2020.01.07.18.56.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Jan 2020 18:56:29 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com
Date: Wed,  8 Jan 2020 10:56:24 +0800
Message-Id: <20200108025624.13968-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: netdev@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: stmmac: pci: remove the duplicate code
	of phy_mask
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The value of phy_mask will be passed to phy_mask of struct mii_bus
before register mdiobus, the mii_bus was obtained by mdiobus_alloc()
and set mii_bus->phy_mask as zero by default. so It doesn't need to
set phy_mask as zero again in this driver.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 8237dbc3e991..40f171d310d7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -65,7 +65,6 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 	plat->force_sf_dma_mode = 1;
 
 	plat->mdio_bus_data->needs_reset = true;
-	plat->mdio_bus_data->phy_mask = 0;
 
 	/* Set default value for multicast hash bins */
 	plat->multicast_filter_bins = HASH_TABLE_SIZE;
@@ -154,8 +153,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->tx_queues_cfg[6].weight = 0x0F;
 	plat->tx_queues_cfg[7].weight = 0x10;
 
-	plat->mdio_bus_data->phy_mask = 0;
-
 	plat->dma_cfg->pbl = 32;
 	plat->dma_cfg->pblx8 = true;
 	plat->dma_cfg->fixed_burst = 0;
@@ -386,8 +383,6 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 	plat->tso_en = 1;
 	plat->pmt = 1;
 
-	plat->mdio_bus_data->phy_mask = 0;
-
 	/* Set default value for multicast hash bins */
 	plat->multicast_filter_bins = HASH_TABLE_SIZE;
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
