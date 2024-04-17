Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F018A8571
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 16:00:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00176C6C859;
	Wed, 17 Apr 2024 14:00:19 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 506B6C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 14:00:18 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-516d0161e13so6991907e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 07:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713362417; x=1713967217;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wCuHkgJvG5roUfAj93LLXibybGnOYsen6TK2djTp+uM=;
 b=iFVUFMs/N/Zz5TQDuGnfaj3FqP1bMPNJ9aIPxMXSga5Rai/VT3elIUJIVGFkXg9jEn
 7nM0773+a0CZW+3yyXx+Aw3jcLXwWGBYD82kAV9k8AVpXBUZmyMrU5o0FXIsAKmFYX9+
 Hzcmp7r5E78WdFEYPWJV9q5D/w41jaVG5YrPxli8yyjvPVqPC4eNGEmKLE4wCi1xF1vI
 LV6uVFaGymGxVL7C6ni8phrSMlzgQl5yLR99GEH93eBO/UEcWrD8NVB8dJhbRGDpaWbQ
 OsxydoiuUNt1KCGT7TbfhWAI14IiibbYOcKeoNBA/snqSyj00Ql+V4nCbQz+Ab1NyMO7
 SdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713362417; x=1713967217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wCuHkgJvG5roUfAj93LLXibybGnOYsen6TK2djTp+uM=;
 b=HOJA6FEdo0d6KLJQm6A7dLFLpBZbQwZ2EGY43W3SKDZjPs4CGgUx+9z3vw07tjbb5g
 myzMLCz8ePHTG2+uDcGom8n/9/zfwIc0cDr0gQ7kadNJSQHC2XvgO9VV1H13Cry0o0Q2
 bbKwCX5Zyq3tGNQe9uWu0A2GxHSjdVsg94TtSFRvk8vPPcvkqMFKuRt5eZkVAY9upQ0f
 RvLp8ubDu3/lrsgjqbEWWSj2fVJpiPkjbTgb1wLB1dqG/ft9IgSr3xjoKdXJ1MSfDmGv
 jm+baC826MXinp9P+Na2fFWRlFTuy7AQxJTMBmW4ierBquzfSDuRKFVS9sgYIvcjF1ma
 3RJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3TWn5IDyTVCMiER/e1FoWek7rIeBK46d6yfHBWWfi8HqnA9AR8vmSYKqXhq51SBKTZS/H8wI36ZYis8NZqZ8YIvazgEDXX4gPsDRKdgt3oEVfOsxohPWf
X-Gm-Message-State: AOJu0YwHZUt0sSpV9DNP6kJCCd3Zv9q4CM+9lbWbiGG8gu3vupt3JYrw
 a4+SgZ+DpXj5xbGDBfmTpdTErkdwnetVGv7Z2/JkVqywwAbeUfbV
X-Google-Smtp-Source: AGHT+IHZISTn2b4MdatLv09pVqgN8Rj/zh3VicITjG9ZAtAiCv8/i6AUH8xtyM+z/+qSzfgj1akGPQ==
X-Received: by 2002:a05:6512:1150:b0:516:ced5:3afa with SMTP id
 m16-20020a056512115000b00516ced53afamr14396995lfg.5.1713362417376; 
 Wed, 17 Apr 2024 07:00:17 -0700 (PDT)
Received: from localhost ([94.125.187.42]) by smtp.gmail.com with ESMTPSA id
 g11-20020a0565123b8b00b00518f53da2dfsm890439lfv.291.2024.04.17.07.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 07:00:17 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Yanteng Si <siyanteng@loongson.cn>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 17 Apr 2024 17:00:07 +0300
Message-ID: <20240417140013.12575-2-fancer.lancer@gmail.com>
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
Subject: [Linux-stm32] [PATCH net-next v2 1/2] net: stmmac: Rename
	phylink_get_caps() callback to update_caps()
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

Since recent commits the stmmac_ops::phylink_get_caps() callback has no
longer been responsible for the phylink MAC capabilities getting, but
merely updates the MAC capabilities in the mac_device_info::link::caps
field. Rename the callback to comply with the what the method does now.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Link: https://lore.kernel.org/netdev/20240412180340.7965-5-fancer.lancer@gmail.com/
Changelog v2:
- This is a new patch created based on the discussion around patch #4 in
  the series above.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 8 ++++----
 drivers/net/ethernet/stmicro/stmmac/hwif.h        | 8 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index a38226d7cc6a..b25774d69195 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -68,7 +68,7 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 		init_waitqueue_head(&priv->tstamp_busy_wait);
 }
 
-static void dwmac4_phylink_get_caps(struct stmmac_priv *priv)
+static void dwmac4_update_caps(struct stmmac_priv *priv)
 {
 	if (priv->plat->tx_queues_to_use > 1)
 		priv->hw->link.caps &= ~(MAC_10HD | MAC_100HD | MAC_1000HD);
@@ -1190,7 +1190,7 @@ static void dwmac4_set_hw_vlan_mode(struct mac_device_info *hw)
 
 const struct stmmac_ops dwmac4_ops = {
 	.core_init = dwmac4_core_init,
-	.phylink_get_caps = dwmac4_phylink_get_caps,
+	.update_caps = dwmac4_update_caps,
 	.set_mac = stmmac_set_mac,
 	.rx_ipc = dwmac4_rx_ipc_enable,
 	.rx_queue_enable = dwmac4_rx_queue_enable,
@@ -1235,7 +1235,7 @@ const struct stmmac_ops dwmac4_ops = {
 
 const struct stmmac_ops dwmac410_ops = {
 	.core_init = dwmac4_core_init,
-	.phylink_get_caps = dwmac4_phylink_get_caps,
+	.update_caps = dwmac4_update_caps,
 	.set_mac = stmmac_dwmac4_set_mac,
 	.rx_ipc = dwmac4_rx_ipc_enable,
 	.rx_queue_enable = dwmac4_rx_queue_enable,
@@ -1284,7 +1284,7 @@ const struct stmmac_ops dwmac410_ops = {
 
 const struct stmmac_ops dwmac510_ops = {
 	.core_init = dwmac4_core_init,
-	.phylink_get_caps = dwmac4_phylink_get_caps,
+	.update_caps = dwmac4_update_caps,
 	.set_mac = stmmac_dwmac4_set_mac,
 	.rx_ipc = dwmac4_rx_ipc_enable,
 	.rx_queue_enable = dwmac4_rx_queue_enable,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 7be04b54738b..90384db228b5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -308,8 +308,8 @@ struct stmmac_est;
 struct stmmac_ops {
 	/* MAC core initialization */
 	void (*core_init)(struct mac_device_info *hw, struct net_device *dev);
-	/* Get phylink capabilities */
-	void (*phylink_get_caps)(struct stmmac_priv *priv);
+	/* Update MAC capabilities */
+	void (*update_caps)(struct stmmac_priv *priv);
 	/* Enable the MAC RX/TX */
 	void (*set_mac)(void __iomem *ioaddr, bool enable);
 	/* Enable and verify that the IPC module is supported */
@@ -430,8 +430,8 @@ struct stmmac_ops {
 
 #define stmmac_core_init(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, core_init, __args)
-#define stmmac_mac_phylink_get_caps(__priv) \
-	stmmac_do_void_callback(__priv, mac, phylink_get_caps, __priv)
+#define stmmac_mac_update_caps(__priv) \
+	stmmac_do_void_callback(__priv, mac, update_caps, __priv)
 #define stmmac_mac_set(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, set_mac, __args)
 #define stmmac_rx_ipc(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7c6fb14b5555..b810f6b69bf5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1225,8 +1225,8 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 		xpcs_get_interfaces(priv->hw->xpcs,
 				    priv->phylink_config.supported_interfaces);
 
-	/* Get the MAC specific capabilities */
-	stmmac_mac_phylink_get_caps(priv);
+	/* Refresh the MAC-specific capabilities */
+	stmmac_mac_update_caps(priv);
 
 	priv->phylink_config.mac_capabilities = priv->hw->link.caps;
 
@@ -7341,7 +7341,7 @@ int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
 			priv->rss.table[i] = ethtool_rxfh_indir_default(i,
 									rx_cnt);
 
-	stmmac_mac_phylink_get_caps(priv);
+	stmmac_mac_update_caps(priv);
 
 	priv->phylink_config.mac_capabilities = priv->hw->link.caps;
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
