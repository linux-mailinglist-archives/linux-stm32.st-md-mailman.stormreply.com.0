Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0978CEB98
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2024 23:03:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF8B4C6DD6D;
	Fri, 24 May 2024 21:03:28 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46F9CC6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2024 21:03:25 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5295f201979so1547604e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2024 14:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716584605; x=1717189405;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6SsA/DX4FQd1mwIvYQLseyq3XbpKYYuZmRUlHTPnong=;
 b=DqmndhH/Fz6Uq3BnaX25uMr19DcJeixWP5djjtSOH4Pcy3FL0D3vgv7lKuSk4HwegV
 haBhaT1XurlE3JlVyhKGQPlwZhYlNCqVuJIYllbxEZLsVS7U5vti7CwnsqtRrqcHWf8l
 e1WFBY+/8LjTOKomC0b4bKUIDP2MMKlGLRPvASNdTS+O5UfRICdEX0FR30LBMGwpGiYc
 s1Obx7oHUjnX8hRjVUeP+UyeJaov1hB3X0/In2WIKtJ3dVQs9fXvlS3ffUSUlaYSNQJr
 bqtQyuCw6vu5z7RGHIAAuashWzw/j7FxV2jMHIb/Bk8uYD8s+xOxmizMNPHKCXhAHIvX
 hBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716584605; x=1717189405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6SsA/DX4FQd1mwIvYQLseyq3XbpKYYuZmRUlHTPnong=;
 b=FbKWUpPdTuLMR+6hTn7yZBUCZ7ReHhV7U7r0bxAWO01w/Lhfs/xX/ozI0CCUO4oaUX
 UXVnAIxGILjbDNcVLP15NfNadlKx9L6xH0NuaxtxNQAWaFhE96D5HTXA6d4VeKRFsoWl
 HI3add/oMRy9dsVCXWrYZB9kEA61DiiOb1QEl/memJlpCkzqMh1/yB+U8qfjPVOIIVRm
 lp3lidpd+NaoyHz6SA23Saqc93E3wj5CQrcwMsUPcG2IY/h5d1YJ2/BgGwIgnxm+MmPt
 NpmfmuWA3j0S0hze/GKbLqc3v8CcuhioBkilhmcwZ+4L2NuAc4fjcQVMs2kF4eQIWA8o
 eVlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2e8nGjJ0KcqZy5xZhcNpHmvrjLaUzLasjkz/1MCW8WFI9XMKYXclryXmMAVhd5d4jmXpt72yzogrf9lvEYMkX53tZyoEajksi5BCpgbI3mlurxvNX4zRm
X-Gm-Message-State: AOJu0Yz/0Wfyibwpshzajx0gEPx+VZfi5qSt2vD3Un+2RMD+LKMMfUAm
 /gzotNu6JIJtjNOYrG6u6jIjKKHGMEwM9sUUwKoZYb6ZKobtD7ls
X-Google-Smtp-Source: AGHT+IG0PT+7TnzaGJ6HfS/LUBBacBaRk08p6C1KaUcsx5/G5OJ+ElDL8rqeNbSK5PYnnNXLPfqj6Q==
X-Received: by 2002:ac2:454c:0:b0:523:a924:3268 with SMTP id
 2adb3069b0e04-52964109a01mr1779610e87.6.1716584604952; 
 Fri, 24 May 2024 14:03:24 -0700 (PDT)
Received: from localhost ([95.79.182.53]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5297066bcd6sm237510e87.164.2024.05.24.14.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 14:03:24 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Sat, 25 May 2024 00:02:59 +0300
Message-ID: <20240524210304.9164-3-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240524210304.9164-1-fancer.lancer@gmail.com>
References: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
 <20240524210304.9164-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 3/3] net: stmmac: Drop TBI/RTBI
	PCS flags
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

First of all the flags are never set by any of the driver parts. If nobody
have them set then the respective statements will always have the same
result. Thus the statements can be simplified or even dropped with no risk
to break things.

Secondly shall any of the TBI or RTBI flag is set the MDIO-bus
registration will be bypassed. Why? It really seems weird. It's perfectly
fine to have a TBI/RTBI-capable PHY configured over the MDIO bus
interface.

Based on the notes above the TBI/RTBI PCS flags can be freely dropped thus
simplifying the driver code.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h  |  2 -
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 37 ++++++-------------
 2 files changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index b02b905bc892..40a930ea4ff3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -268,8 +268,6 @@ struct stmmac_safety_stats {
 /* PCS defines */
 #define STMMAC_PCS_RGMII	(1 << 0)
 #define STMMAC_PCS_SGMII	(1 << 1)
-#define STMMAC_PCS_TBI		(1 << 2)
-#define STMMAC_PCS_RTBI		(1 << 3)
 
 #define SF_DMA_MODE 1		/* DMA STORE-AND-FORWARD Operation Mode */
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6c4e90b1fea3..06f95dfdf09e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -471,13 +471,6 @@ bool stmmac_eee_init(struct stmmac_priv *priv)
 {
 	int eee_tw_timer = priv->eee_tw_timer;
 
-	/* Using PCS we cannot dial with the phy registers at this stage
-	 * so we do not support extra feature like EEE.
-	 */
-	if (priv->hw->pcs == STMMAC_PCS_TBI ||
-	    priv->hw->pcs == STMMAC_PCS_RTBI)
-		return false;
-
 	/* Check if MAC core supports the EEE feature. */
 	if (!priv->dma_cap.eee)
 		return false;
@@ -3945,9 +3938,7 @@ static int __stmmac_open(struct net_device *dev,
 	if (ret < 0)
 		return ret;
 
-	if (priv->hw->pcs != STMMAC_PCS_TBI &&
-	    priv->hw->pcs != STMMAC_PCS_RTBI &&
-	    (!priv->hw->xpcs ||
+	if ((!priv->hw->xpcs ||
 	     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73) &&
 	    !priv->hw->lynx_pcs) {
 		ret = stmmac_init_phy(dev);
@@ -7724,16 +7715,12 @@ int stmmac_dvr_probe(struct device *device,
 	if (!pm_runtime_enabled(device))
 		pm_runtime_enable(device);
 
-	if (priv->hw->pcs != STMMAC_PCS_TBI &&
-	    priv->hw->pcs != STMMAC_PCS_RTBI) {
-		/* MDIO bus Registration */
-		ret = stmmac_mdio_register(ndev);
-		if (ret < 0) {
-			dev_err_probe(priv->device, ret,
-				      "%s: MDIO bus (id: %d) registration failed\n",
-				      __func__, priv->plat->bus_id);
-			goto error_mdio_register;
-		}
+	ret = stmmac_mdio_register(ndev);
+	if (ret < 0) {
+		dev_err_probe(priv->device, ret,
+			      "MDIO bus (id: %d) registration failed\n",
+			      priv->plat->bus_id);
+		goto error_mdio_register;
 	}
 
 	if (priv->plat->speed_mode_2500)
@@ -7776,9 +7763,7 @@ int stmmac_dvr_probe(struct device *device,
 	phylink_destroy(priv->phylink);
 error_xpcs_setup:
 error_phy_setup:
-	if (priv->hw->pcs != STMMAC_PCS_TBI &&
-	    priv->hw->pcs != STMMAC_PCS_RTBI)
-		stmmac_mdio_unregister(ndev);
+	stmmac_mdio_unregister(ndev);
 error_mdio_register:
 	stmmac_napi_del(ndev);
 error_hw_init:
@@ -7817,9 +7802,9 @@ void stmmac_dvr_remove(struct device *dev)
 	if (priv->plat->stmmac_rst)
 		reset_control_assert(priv->plat->stmmac_rst);
 	reset_control_assert(priv->plat->stmmac_ahb_rst);
-	if (priv->hw->pcs != STMMAC_PCS_TBI &&
-	    priv->hw->pcs != STMMAC_PCS_RTBI)
-		stmmac_mdio_unregister(ndev);
+
+	stmmac_mdio_unregister(ndev);
+
 	destroy_workqueue(priv->wq);
 	mutex_destroy(&priv->lock);
 	bitmap_free(priv->af_xdp_zc_qps);
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
