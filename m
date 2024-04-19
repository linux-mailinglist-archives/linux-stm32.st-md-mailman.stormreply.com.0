Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A408AAB25
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Apr 2024 11:04:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED200C6DD9C;
	Fri, 19 Apr 2024 09:04:09 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D7A7C6DD9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 09:04:09 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2db13ca0363so29328361fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 02:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713517448; x=1714122248;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rgMQYr4oV4JNndEuD2biU5vQV/pnebRAnRkbrVejXaA=;
 b=XGZlYeUbB3chv5461mlzMVPWtupa+GF6kgYqGZie/zrHWcyW+5KBiGfqSjdxGAy+GE
 0crXVFk93cqJPNRvkCFHW2aG8rARwQuVbwyhMNkdAlCp51c9B2XaSum0TxP2nMj1Yvsw
 nFgV4jENsxgTpMEHI0ROqdsH1ETjOJwmY0XSfAxx6CFtfZbLssxvWLvy4uF6HOOY2ACg
 sIMrqWXx6eHW2W0nqHxcczQv2u0aL/UOpzpUfBDjUP56YsM/C/R12urIOFkwVcf0+UZs
 hInJQ7hJNsxBqbbXYEA1DM27RKyzhD+ybSfUGTQ4GPvTtroWhPQYYft41iLPLPtUJL8c
 6nwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713517448; x=1714122248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rgMQYr4oV4JNndEuD2biU5vQV/pnebRAnRkbrVejXaA=;
 b=Bw8GcRKm5ntBnwXdbM4abY/CJETrtk08D8q6Hg4OKYtuamEnjH9zWgQXuuiB+WWw+T
 Bxtc8f7j0VgYSGrqev8DGodVj/Rax/luJxf5wk4ruB8hE+bW1M8N4relfDHJd2S+Mhe9
 tyMrsEEuEY7eOCiPBtvM5/0mCfhhDtPQLQYd0gwsQJV27dt5x2+z6eza4zO8mzUv0JEO
 U4dJkObSe3Xj5LFhxQ5NlBvSCds20X71kK5IgfjAsi4NLxYu/pM1QWHdyNI3lTlwTLnV
 waeORN+/m16dy99VLg34qnIqASrVUj8wr9tobDuU5M4NOkYaGn14kvdTaNyOfPixQf/x
 Lf/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV6/uD+8Ef5i4SKFlJxyRbt8RZi3W4yr3DXQ1K+uYOt1d8TttvdafqgAqao5BcSQK1ld8ggImjTz+d/FN/zIv4SJHNw6RbCFdvU/WPQns8dEFcr7DWo6Az
X-Gm-Message-State: AOJu0Yx95zdwGQvaXW/vKDS7i4qD2MAKX/OVQbLYgLtNic5+igBoLUKJ
 be3yfxQdhl4la3QUM6qpKlfpbSHtoj5K2and1MSzYRLDn4zPfQXG
X-Google-Smtp-Source: AGHT+IHQi06xeUbRVNwJPi1rGkVQYXntNtrD89Vy0P8/uMlqN9zH9EDGdcfcGdRrkx/08kp0eZERLQ==
X-Received: by 2002:a2e:2a46:0:b0:2d4:7455:89f6 with SMTP id
 q67-20020a2e2a46000000b002d4745589f6mr1137769ljq.40.1713517448297; 
 Fri, 19 Apr 2024 02:04:08 -0700 (PDT)
Received: from localhost (srv1.baikalchip.ru. [87.245.175.227])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a2e3a19000000b002da968f03f9sm520526lja.89.2024.04.19.02.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 02:04:07 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Yanteng Si <siyanteng@loongson.cn>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 19 Apr 2024 12:03:06 +0300
Message-ID: <20240419090357.5547-3-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240419090357.5547-1-fancer.lancer@gmail.com>
References: <20240419090357.5547-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Cc: Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Serge Semin <fancer.lancer@gmail.com>,
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND net-next v3 2/2] net: stmmac: Move MAC
	caps init to phylink MAC caps getter
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
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>

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
