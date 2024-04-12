Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 824F58A354A
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Apr 2024 20:04:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A8A7C6C859;
	Fri, 12 Apr 2024 18:04:12 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA11FCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 18:04:10 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2d895138d0eso9962401fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 11:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712945050; x=1713549850;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nVOumlgGtBlZ85ugSU3wCdejk77Ru/Jzabc/ZwR7GtA=;
 b=Zx1WErrds54bPMNIittPifNy5uysRRZ4oNBzmHMwStgOxnEmt0dHag832xlim71J95
 bf1dU7WOCa0bFAedrL6P0H3xVao3dEbErxbyEAtMQRvVOF2M/EDZPwmEdsvs8uNu9bUO
 k0fL4yLPYP1eMJUwo1mnZHio6VIk92PlPHYP3b8RKnGhNKz7Tz7XOGYMdKTXzGae4y1T
 Zt+DemhkH67qWqU0bXNwAWPIcZYlfSWRsgaOk5uEE9cZyIsyHQn/k1vqq9wfuSL4M9QQ
 ACYuI5JmdPAisHc1W86S57R1IRylVECbAfKDDNWcXnQrnJGW1EKzvN4eiVtUQqeI9A1T
 /qkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712945050; x=1713549850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nVOumlgGtBlZ85ugSU3wCdejk77Ru/Jzabc/ZwR7GtA=;
 b=TgoVrheiNZMZBScMeVKl+3HiUJRyQztXHHBlOxqbM+YD2EpJig1Osbfw8HgRB5BEEs
 xNwkODbra6CmfDwKSHTdGP9KryH/TW38ddZELJoIzY8NkTZ8vejx6WCRxi3JllKGVhqx
 kW2lUYwKlOMnSH8EGUqqfteGxwFlnmzqnFxSIgkHqVJkcqksvHuEc68X7ZnNoucpz/uD
 XKSjqPvKJ19GViNB5e8cheSnfLbWnD6tRN5ihb4zcQrfwSyurRw8ere5lslMHBEXvPK1
 WMaHJAYjMjeCrLrXOJUZpanZM83CKu8EbQwYKhCFVGCXXOa+CE9yOI/f+smGJLlVgKfd
 xfIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6EUFffPybsT6hmUkBeC0iXKJSI9U96fo9jpOOyVZhjZqXK06JBus/HaLLiI+2kPNtqoYzK0E44CB7zyXUbzaga3cS9dUCr4HDVwh92peXiV3Z0NMUe8XV
X-Gm-Message-State: AOJu0Yz26mvBhLIY4hzfp2Il9s2ZzvzyHJPxaDmOSrsuwNHGNLj0IVPa
 m1Uar+NOwauTSUXBPMQkJYXw2V1mHR9Vi6hYbaFvMLagGGYVYj4C
X-Google-Smtp-Source: AGHT+IErtp2nV7mcKdqRo+jq1OWZkiMk/4riy2CBgl5T4ICW2MsRDn+iJIiWgWyWac4RMpk9UBQ8Xg==
X-Received: by 2002:a05:651c:33a:b0:2d8:6561:72ca with SMTP id
 b26-20020a05651c033a00b002d8656172camr2074103ljp.19.1712945049992; 
 Fri, 12 Apr 2024 11:04:09 -0700 (PDT)
Received: from localhost ([95.79.241.172]) by smtp.gmail.com with ESMTPSA id
 g20-20020a05651c079400b002d86998c8f6sm570047lje.88.2024.04.12.11.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 11:04:09 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Yanteng Si <siyanteng@loongson.cn>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 12 Apr 2024 21:03:17 +0300
Message-ID: <20240412180340.7965-5-fancer.lancer@gmail.com>
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
Subject: [Linux-stm32] [PATCH net-next 4/4] net: stmmac: Move MAC caps init
	to phylink MAC caps getter
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

After a set of fixes the stmmac_phy_setup() and stmmac_reinit_queues()
method have turned to having some duplicated code. Let's get rid from the
duplication by moving the MAC-capabilities initialization to the PHYLINK
MAC-capabilities getter. The getter is called during each network device
interface open/close cycle. So the MAC-capabilities will be initialized in
normal device functioning and in case of the Tx/Rx queues
re-initialization as the original code semantics implies.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 36 +++++++++----------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7c6fb14b5555..cb72dd93191e 100644
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
+	/* Get the MAC-specific capabilities */
+	stmmac_mac_phylink_get_caps(priv);
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
 
-	/* Get the MAC specific capabilities */
-	stmmac_mac_phylink_get_caps(priv);
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
 
-	stmmac_mac_phylink_get_caps(priv);
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
