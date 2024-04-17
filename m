Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 476AA8A8572
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 16:00:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C266C6DD66;
	Wed, 17 Apr 2024 14:00:21 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1621C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 14:00:19 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-518d98b9620so4583894e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 07:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713362419; x=1713967219;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8KnMWOMZl4OlIeWKfyhTeTgh6nDBj0ThrZdjCpvV0rs=;
 b=hgNV0262MCbVdfiakaabvZHyvBm+4W5nJbP97Hjc/PzmVX3kKpa0h18QPPrxA6ZiJ2
 u/Si19bVntQp82nprXTQuZG6aJcnokimhwDL6tJyZp9VGKUhRbEPJ7I7rOjbiGcBClK9
 PbooHW/Eo8r8yqiMiuORR44zXjxZHmr8caB8EXXUxCaal98E0twAReT7bSHxlC6GS+SW
 yKU5QlijyAoY2/oZA5oxYX7f6/5QUs4STINYXGISizYSLPYhO6YYoJX1x6dmK13vJ3wz
 HBZMOser/qYJeNaLyOR51xRwL1DoWR1sKIsotzWNycKGEsNIYAgGXU5YQ8MRs3HcBakY
 Yb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713362419; x=1713967219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8KnMWOMZl4OlIeWKfyhTeTgh6nDBj0ThrZdjCpvV0rs=;
 b=Ks5XouNfu22JlcXne6TcvNttetY6sFV64ls5z/0fnxK853OwWQzefjR+mm6UAbcQ3f
 jZPCThik/ZxS+2EuZ5P+ETxzmHylWhBAR7esz7KW7lx9XQTRZ4xhRvcHTYOLaVe4Q/RM
 J0ANeOpmSIuzFRTspqgbXFNLsoMASmLZj6WDq1Fb5gzN1yNg6YqY6jI86NjWr9hHBluP
 kyi6xD+4JOHXmzaC+IKIBuGX2jvwvvxyJi+ZxPuLr+y/tcvTaAv6d/2pIrP3Zm82A7Ej
 GVQedGe8bNQ5ND90ND4XbQCweejBzLVwaTF9B109nfDzaeoQoKZLhqGnMULJ3H72i1gT
 creg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3wBqXKXWp3QSaY/xhJw52tv2aFQ7D+bymgqPFT036IuegIzJYbdYHiel7xrQwHFoFPN5btC+TpIsy8WH51xaoRWLS+UMcfCxMj3M4ghs7sPXuXKZoY53Y
X-Gm-Message-State: AOJu0Yxf4giKK8Hpr+86O08ktwC/6+AEozVt82Zzggf47J+18flfGr6N
 Abj+GQPBpboRHtodPGCxIdpSEEfR+0tC9TgcyaXxeR4WB9FPZb9h
X-Google-Smtp-Source: AGHT+IEFwpS1qE+a87B7Ubcokq+jSyQu+NQX48mgWo7d9MJK3BT85N5w69dYy1tGNwmTeX2J7BN2jw==
X-Received: by 2002:ac2:4d9b:0:b0:516:d33a:7571 with SMTP id
 g27-20020ac24d9b000000b00516d33a7571mr10745339lfe.8.1713362418928; 
 Wed, 17 Apr 2024 07:00:18 -0700 (PDT)
Received: from localhost ([94.125.187.42]) by smtp.gmail.com with ESMTPSA id
 g20-20020a19ee14000000b00515b0706b95sm1971640lfb.17.2024.04.17.07.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 07:00:18 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Yanteng Si <siyanteng@loongson.cn>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 17 Apr 2024 17:00:08 +0300
Message-ID: <20240417140013.12575-3-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240417140013.12575-1-fancer.lancer@gmail.com>
References: <20240417140013.12575-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Cc: Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Serge Semin <fancer.lancer@gmail.com>,
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 2/2] net: stmmac: Move MAC caps
	init to phylink MAC caps getter
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

After a set of recent fixes the stmmac_phy_setup() and
stmmac_reinit_queues() methods have turned to having some duplicated code.
Let's get rid from the duplication by moving the MAC-capabilities
initialization to the PHYLINK MAC-capabilities getter. The getter is
called during each network device interface open/close cycle. So the
MAC-capabilities will be initialized in generic device open procedure and
in case of the Tx/Rx queues re-initialization as the original code
semantics implies.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Link: https://lore.kernel.org/netdev/20240412180340.7965-5-fancer.lancer@gmail.com/
Changelog v2:
- Resubmit the patch to net-next separately from the main patchset (Paolo)
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 36 +++++++++----------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b810f6b69bf5..0d6cd1704e6a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -936,6 +936,22 @@ static void stmmac_mac_flow_ctrl(struct stmmac_priv *priv, u32 duplex)
 			priv->pause, tx_cnt);
 }
 
+static unsigned long stmmac_mac_get_caps(struct phylink_config *config,
+					 phy_interface_t interface)
+{
+	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
+
+	/* Refresh the MAC-specific capabilities */
+	stmmac_mac_update_caps(priv);
+
+	config->mac_capabilities = priv->hw->link.caps;
+
+	if (priv->plat->max_speed)
+		phylink_limit_mac_speed(config, priv->plat->max_speed);
+
+	return config->mac_capabilities;
+}
+
 static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
 						 phy_interface_t interface)
 {
@@ -1105,6 +1121,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 }
 
 static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
+	.mac_get_caps = stmmac_mac_get_caps,
 	.mac_select_pcs = stmmac_mac_select_pcs,
 	.mac_config = stmmac_mac_config,
 	.mac_link_down = stmmac_mac_link_down,
@@ -1204,7 +1221,6 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	int mode = priv->plat->phy_interface;
 	struct fwnode_handle *fwnode;
 	struct phylink *phylink;
-	int max_speed;
 
 	priv->phylink_config.dev = &priv->dev->dev;
 	priv->phylink_config.type = PHYLINK_NETDEV;
@@ -1225,15 +1241,6 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 		xpcs_get_interfaces(priv->hw->xpcs,
 				    priv->phylink_config.supported_interfaces);
 
-	/* Refresh the MAC-specific capabilities */
-	stmmac_mac_update_caps(priv);
-
-	priv->phylink_config.mac_capabilities = priv->hw->link.caps;
-
-	max_speed = priv->plat->max_speed;
-	if (max_speed)
-		phylink_limit_mac_speed(&priv->phylink_config, max_speed);
-
 	fwnode = priv->plat->port_node;
 	if (!fwnode)
 		fwnode = dev_fwnode(priv->device);
@@ -7327,7 +7334,6 @@ int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	int ret = 0, i;
-	int max_speed;
 
 	if (netif_running(dev))
 		stmmac_release(dev);
@@ -7341,14 +7347,6 @@ int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
 			priv->rss.table[i] = ethtool_rxfh_indir_default(i,
 									rx_cnt);
 
-	stmmac_mac_update_caps(priv);
-
-	priv->phylink_config.mac_capabilities = priv->hw->link.caps;
-
-	max_speed = priv->plat->max_speed;
-	if (max_speed)
-		phylink_limit_mac_speed(&priv->phylink_config, max_speed);
-
 	stmmac_napi_add(dev);
 
 	if (netif_running(dev))
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
