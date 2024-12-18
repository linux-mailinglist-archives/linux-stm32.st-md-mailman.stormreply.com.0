Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6059F602B
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2024 09:34:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD7FBC7129D;
	Wed, 18 Dec 2024 08:34:37 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 223F0C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 08:34:30 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso47895295ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 00:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734510868; x=1735115668;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TDrHezrIz5cTXpjA6dJ5uIqtYCcnxWcs7DL1g5f/WEU=;
 b=UVE9f7Huf2x49NVEQ4mOeseo5xss1mS8eBex/k9M3ccLtUMH00WD3+ooGoaHsRjwiu
 zxqdZwY8UxCjhtOqzQbdk27nieDhH5BU9rwJokLkdp/X9zySNKnuKyLGrwZ+C0ngaPgA
 7gr3pfdyrkIwbTOcjKAHQjtPSIzwrVYNAUJMMO25zTajeuzAAlR/K9x89ybzvFXpVYDL
 tGiqtvB+o4zrcUekLHObt1u0kMOarN5IunyLUya+dr2cdISqYCSv8iW46FT41zOoky2X
 YRNrtSm0d7Kl8sIH4m4qKO5eay71USWpfdH81qvS+QsOPqXR0W3ZMeVEGtbgcOMRTsWC
 z38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734510868; x=1735115668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TDrHezrIz5cTXpjA6dJ5uIqtYCcnxWcs7DL1g5f/WEU=;
 b=BfjupIovNkAalua9CmaigdzDDStwNaBYvo454BalyBRcNabiifPyyqu1ramu0SI9xl
 x6S7V4LJlbQbr+SLHvLyZssyASBRf1sjZiPYypW/q7IC4TWsbRoaHcaoDHxHOkuSgSBL
 hz5aSPMLm0zGnl9OIZM0hPV+kTwk5NFLhsrjB/cWgNctAa9ZjVgrHED59znyrQj256Sa
 NlGf//EGz7jmM5vH73AnG73g0pXLTtK9HRNsbA7hRSfnQcUI1NBO+2f938Spdn3pdZuB
 nPABouW47zeJlPxlDnMA7tie1svD/aqkm3cvQJIrTmhk5v+Xq3+RAeSkLzYckqxQxTBi
 I1wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoWvaxwWyJJ5yZsojKI0YGo6L4+jjCyqvp9Iny/1l0oRkRc3qCnUnb8AYNgd6uMiDna0Gdb+ttaEFKEw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzXgyF7JGI5DCiBmP8AopxYEcygY9eqWaBQP+Zfy0/0HqJBYvjI
 WJY1GmvI1/LnSfPK5w1dDv4BPF1hxcGQzBYh8P0otNSmmYeoQo2t
X-Gm-Gg: ASbGncuAiJvP/d9VeQk4kmcnYVQjCo/ahkoS3pOL+c6yp/vgvtBPxE8G/IxxcB+Rgf5
 DsVvVX2i058Kbx7mlhFg6UJzbg5ek/Lh1AxNFiy+AWgna8K0oT0Rxns9+5Vl/MZPs+9QpGqAW++
 Kx36HJwPghPHuuuAlNrXAaUxelO2VdSCEG0A301Yy7HggEY056rJjMgYrpkQ39+7EFBhwLkcHij
 woyPZL8B2BWnjyWdBWOOngYgJ3VE5jC/x8aMD0JFTgCyeQfHqoEEBd/oOi1pkLJFKWfjg==
X-Google-Smtp-Source: AGHT+IGtJJCUk3iuXtE8y8mYuVun1NG2Fd8lbXIzpgpbU7+72x9qCy3AunOkM68r/azCHGKP3Ipq1g==
X-Received: by 2002:a17:902:ccd2:b0:216:7cef:99b3 with SMTP id
 d9443c01a7336-218d7280492mr30713875ad.52.1734510868506; 
 Wed, 18 Dec 2024 00:34:28 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-218a206a098sm70772485ad.270.2024.12.18.00.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 00:34:28 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 18 Dec 2024 16:34:07 +0800
Message-Id: <20241218083407.390509-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v1] net: stmmac: Drop useless code
	related to ethtool rx-copybreak
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

After commit 2af6106ae949 ("net: stmmac: Introducing support for Page
Pool"), the driver always copies frames to get a better performance,
zero-copy for RX frames is no more, then these code turned to be
useless and users of ethtool may get confused about the unhandled
rx-copybreak parameter.

This patch mostly reverts
commit 22ad38381547 ("stmmac: do not perform zero-copy for rx frames")

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 -
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 39 -------------------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  5 ---
 3 files changed, 46 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 1d86439b8a14..b8d631e559c0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -126,7 +126,6 @@ struct stmmac_rx_queue {
 	unsigned int cur_rx;
 	unsigned int dirty_rx;
 	unsigned int buf_alloc_num;
-	u32 rx_zeroc_thresh;
 	dma_addr_t dma_rx_phy;
 	u32 rx_tail_addr;
 	unsigned int state_saved;
@@ -266,7 +265,6 @@ struct stmmac_priv {
 	int sph_cap;
 	u32 sarc_type;
 
-	unsigned int rx_copybreak;
 	u32 rx_riwt[MTL_MAX_TX_QUEUES];
 	int hwts_rx_en;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 1d77389ce953..16b4d8c21c90 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -1227,43 +1227,6 @@ static int stmmac_get_ts_info(struct net_device *dev,
 		return ethtool_op_get_ts_info(dev, info);
 }
 
-static int stmmac_get_tunable(struct net_device *dev,
-			      const struct ethtool_tunable *tuna, void *data)
-{
-	struct stmmac_priv *priv = netdev_priv(dev);
-	int ret = 0;
-
-	switch (tuna->id) {
-	case ETHTOOL_RX_COPYBREAK:
-		*(u32 *)data = priv->rx_copybreak;
-		break;
-	default:
-		ret = -EINVAL;
-		break;
-	}
-
-	return ret;
-}
-
-static int stmmac_set_tunable(struct net_device *dev,
-			      const struct ethtool_tunable *tuna,
-			      const void *data)
-{
-	struct stmmac_priv *priv = netdev_priv(dev);
-	int ret = 0;
-
-	switch (tuna->id) {
-	case ETHTOOL_RX_COPYBREAK:
-		priv->rx_copybreak = *(u32 *)data;
-		break;
-	default:
-		ret = -EINVAL;
-		break;
-	}
-
-	return ret;
-}
-
 static int stmmac_get_mm(struct net_device *ndev,
 			 struct ethtool_mm_state *state)
 {
@@ -1390,8 +1353,6 @@ static const struct ethtool_ops stmmac_ethtool_ops = {
 	.set_per_queue_coalesce = stmmac_set_per_queue_coalesce,
 	.get_channels = stmmac_get_channels,
 	.set_channels = stmmac_set_channels,
-	.get_tunable = stmmac_get_tunable,
-	.set_tunable = stmmac_set_tunable,
 	.get_link_ksettings = stmmac_ethtool_get_link_ksettings,
 	.set_link_ksettings = stmmac_ethtool_set_link_ksettings,
 	.get_mm = stmmac_get_mm,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 16b8bcfa8b11..6bc10ffe7a2b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -77,7 +77,6 @@ module_param(phyaddr, int, 0444);
 MODULE_PARM_DESC(phyaddr, "Physical device address");
 
 #define STMMAC_TX_THRESH(x)	((x)->dma_conf.dma_tx_size / 4)
-#define STMMAC_RX_THRESH(x)	((x)->dma_conf.dma_rx_size / 4)
 
 /* Limit to make sure XDP TX and slow path can coexist */
 #define STMMAC_XSK_TX_BUDGET_MAX	256
@@ -107,8 +106,6 @@ static int buf_sz = DEFAULT_BUFSIZE;
 module_param(buf_sz, int, 0644);
 MODULE_PARM_DESC(buf_sz, "DMA buffer size");
 
-#define	STMMAC_RX_COPYBREAK	256
-
 static const u32 default_msg_level = (NETIF_MSG_DRV | NETIF_MSG_PROBE |
 				      NETIF_MSG_LINK | NETIF_MSG_IFUP |
 				      NETIF_MSG_IFDOWN | NETIF_MSG_TIMER);
@@ -3927,8 +3924,6 @@ static int __stmmac_open(struct net_device *dev,
 		}
 	}
 
-	priv->rx_copybreak = STMMAC_RX_COPYBREAK;
-
 	buf_sz = dma_conf->dma_buf_sz;
 	for (int i = 0; i < MTL_MAX_TX_QUEUES; i++)
 		if (priv->dma_conf.tx_queue[i].tbs & STMMAC_TBS_EN)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
