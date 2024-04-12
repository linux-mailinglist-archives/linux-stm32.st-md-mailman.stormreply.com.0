Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0FF8A3547
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Apr 2024 20:04:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28D72C6DD67;
	Fri, 12 Apr 2024 18:04:05 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F4B4C6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 18:04:04 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d6ff0422a2so13641471fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 11:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712945043; x=1713549843;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCp+O5zf1XAzEa7QvAx53sYKNLIL8eSplg5NSTorigk=;
 b=DTxY/xqVlnaQZFabHsm0zvKS+ZOcCfUp/Q3WUP7E4wk3NppZbx4S4air5PoWFafihb
 65vceY9yFSY/Re2eikkHwQACylbN1by6WZUPvoieLQUn/9cmFhjBAniqBvE6ahCu1vQp
 VKFrM3Y2xPh3fMQ6qqDOciMmrCeCQl80IwqTisK6O9J3HjSEvRjtWdy2u0q3pKc4bzHF
 iYVJ5r8gOdquVLHSY/y3mZ6apGdCRwKJqIN1oa4ZtCE4JDgUiiVb9Yd9F/40iNF7nnpM
 4tyZJPHesvObTxS7vvI++h30m8hu6CmxKTawywVEXcmCGvLor1hhMibuluE9F6+7/DrE
 L5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712945043; x=1713549843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CCp+O5zf1XAzEa7QvAx53sYKNLIL8eSplg5NSTorigk=;
 b=mDXHedmBjAuPxalp9k/ljyCS5aKjRZK/bOZuYX07UxYJneeAggUC/4gf1CXrloSQJG
 rkfhjMNVH1CWMWtLgeMtwJmVKiFHFco61tPtldU+HuJXhDAML0wwBaKtfug4S/iHVefe
 My3KW6mLMYXzF28w4o/ykc29J6OerAIxhWH6WcePj3PFG7wyaoUu6qPQ7TrhZVArM3hb
 LODkowwAr2PN5srQCWxJP3pcPSTufB+ioTKuBQ/peHUAu2iyTexnfSo58r7k5dgTpvml
 IXt9d3gf2Z8jpQMi4x6uzORWwEGks+rA3X7nAmBCNy/KQDTqnPfXZgteJtFXKIuc5Lf/
 NoWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2mcvw+Bzzf82oHCE3JJC2hiy4AEHVjTJiuncgi0ou48GxwMKfKolk7cZKY0Dy9i2/E4FsShAUyJnlGkzUOmILPgD2Zgykd8S8nJz54W7/uq6ZHfC23vNS
X-Gm-Message-State: AOJu0Yzx4bIuX1rxbbCLXictV6uq2RL0tk28obskOAJukecFpurxE0EP
 AOOHfzP5/eISxYrO3vWOzhsXQAKnzogR5aXgUb/kMho5yBAx+ekn
X-Google-Smtp-Source: AGHT+IHENBuTlxLf/6N97dtbn3xcV+Dq/EI4bigipZaf5nXjIl76R7vPSnhcP7MwSAR0x+L4seiNwQ==
X-Received: by 2002:a05:651c:33c:b0:2d9:fe84:a485 with SMTP id
 b28-20020a05651c033c00b002d9fe84a485mr2395294ljp.29.1712945043444; 
 Fri, 12 Apr 2024 11:04:03 -0700 (PDT)
Received: from localhost ([95.79.241.172]) by smtp.gmail.com with ESMTPSA id
 by43-20020a05651c1a2b00b002d88d978484sm547676ljb.132.2024.04.12.11.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 11:04:03 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Yanteng Si <siyanteng@loongson.cn>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bhadram Varka <vbhadram@nvidia.com>
Date: Fri, 12 Apr 2024 21:03:14 +0300
Message-ID: <20240412180340.7965-2-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240412180340.7965-1-fancer.lancer@gmail.com>
References: <20240412180340.7965-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Cc: Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Serge Semin <fancer.lancer@gmail.com>,
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/4] net: stmmac: Apply half-duplex-less
	constraint for DW QoS Eth only
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

There are three DW MAC IP-cores which can have the multiple Tx/Rx queues
enabled:
DW GMAC v3.7+ with AV feature,
DW QoS Eth v4.x/v5.x,
DW XGMAC/XLGMAC
Based on the respective HW databooks, only the DW QoS Eth IP-core doesn't
support the half-duplex link mode in case if more than one queues enabled:

"In multiple queue/channel configurations, for half-duplex operation,
enable only the Q0/CH0 on Tx and Rx. For single queue/channel in
full-duplex operation, any queue/channel can be enabled."

The rest of the IP-cores don't have such constraint. Thus in order to have
the constraint applied for the DW QoS Eth MACs only, let's move the it'
implementation to the respective MAC-capabilities getter and make sure the
getter is called in the queues re-init procedure.

Fixes: b6cfffa7ad92 ("stmmac: fix DMA channel hang in half-duplex mode")
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  7 +++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 +++----------------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index cef25efbdff9..ec6a13e644b3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -71,6 +71,13 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 static void dwmac4_phylink_get_caps(struct stmmac_priv *priv)
 {
 	priv->phylink_config.mac_capabilities |= MAC_2500FD;
+
+	if (priv->plat->tx_queues_to_use > 1)
+		priv->phylink_config.mac_capabilities &=
+			~(MAC_10HD | MAC_100HD | MAC_1000HD);
+	else
+		priv->phylink_config.mac_capabilities |=
+			(MAC_10HD | MAC_100HD | MAC_1000HD);
 }
 
 static void dwmac4_rx_queue_enable(struct mac_device_info *hw,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 24cd80490d19..dd58c21b53ee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1198,17 +1198,6 @@ static int stmmac_init_phy(struct net_device *dev)
 	return ret;
 }
 
-static void stmmac_set_half_duplex(struct stmmac_priv *priv)
-{
-	/* Half-Duplex can only work with single tx queue */
-	if (priv->plat->tx_queues_to_use > 1)
-		priv->phylink_config.mac_capabilities &=
-			~(MAC_10HD | MAC_100HD | MAC_1000HD);
-	else
-		priv->phylink_config.mac_capabilities |=
-			(MAC_10HD | MAC_100HD | MAC_1000HD);
-}
-
 static int stmmac_phy_setup(struct stmmac_priv *priv)
 {
 	struct stmmac_mdio_bus_data *mdio_bus_data;
@@ -1237,10 +1226,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 				    priv->phylink_config.supported_interfaces);
 
 	priv->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
-						MAC_10FD | MAC_100FD |
-						MAC_1000FD;
-
-	stmmac_set_half_duplex(priv);
+						MAC_10 | MAC_100 | MAC_1000;
 
 	/* Get the MAC specific capabilities */
 	stmmac_mac_phylink_get_caps(priv);
@@ -7355,7 +7341,8 @@ int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
 			priv->rss.table[i] = ethtool_rxfh_indir_default(i,
 									rx_cnt);
 
-	stmmac_set_half_duplex(priv);
+	stmmac_mac_phylink_get_caps(priv);
+
 	stmmac_napi_add(dev);
 
 	if (netif_running(dev))
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
