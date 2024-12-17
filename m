Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E939F4720
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 10:17:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D06EC78011;
	Tue, 17 Dec 2024 09:17:41 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FED5C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 09:17:40 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2165cb60719so39701895ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 01:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734427059; x=1735031859;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RHB7BdWE+mdq4KW1atHm3QasLuffzsNyx3HPRXiGpvM=;
 b=Db2bUTA7mcerukO2IZXrV/I8o99RFJj0VgCBPjM/u2WZU7m5ckzY1+5WMJGNv7yC2D
 asCYWZEZeGyTvul3MFbY36qoJQg/2nO9HRao0oBvPZjKt4CPkzUu11S/SOKfONinwPeP
 8t3tqOkETogmkaSA5usmxyf3l4O+UatXEAhIVSeomfd/MkhE9+FFsjYjWsPMMIalzt0L
 NGYYwPNFIJuhs3+eTB1CpX9/nwJJnh0yeifIVTlAKWNyjk2vy+0gN34KrqJSSGNIUTNQ
 G2klfgeSghKky6u/QkVyAR6oDnfmxvHs6ApC8LPs0ro8JhdIDMZ3XsQXxAzJcBwH43jR
 W6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734427059; x=1735031859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RHB7BdWE+mdq4KW1atHm3QasLuffzsNyx3HPRXiGpvM=;
 b=b6PEExP+wlTDOcRK6kg2W3kow2GjzQhp5Mv8PTeKQTHfZpTyak10pTavO+OzE/6t5/
 hR/+JBJAAE3suuccvINAYtwnMYGl1iVP3o0fbNWJoWUQE1J4WEJNf1ov2XTO7ZMfXEVm
 uKVBcadE4gihoC0wloMZ3dCVusBQutJHJ6OUVnkdsd4yQf5MMRO5FrY81q9I+aRByZl8
 pc+gojRuoJhJLuw1yp6f/3dC6T0lttI+JMthkiDbwsdFp3Q5Aew10w4mbSNFoaO4VDVd
 t460S/k4r8h7EetK6gyyfEBQ344YP6eZiX2N756Zc0IGeIt71+EX527yQGwr1GRbM/Ng
 FygQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVenC4zrY8ixXrnWRYUvVjzMz5ExJdMIK8/Y5nUbZW7E2bTBt6xy8p0R75GgBb15JrmHszYijswAo1new==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzGKzaKWEuYxl2wxfEIHLVNZCbGgtdm2Dpk/URthWhwYlShiSEs
 qhJoTPql2FfhXkq+2P1UuBx8g6mAu+zU1jNwaWZAkYl8oxl34q4y
X-Gm-Gg: ASbGnctS0a4JnHZOoFHSu1Nax4zHG/KVBNfw4BiiKr2ltDflL71zKo4JECVAuccO2Or
 GQl5bXLS+JM7Bv1THgUscPdDqRycD/+brxMfDxinPSxyRnOtgcyrqvhKNSaq7aLOFo3Qja5jsgv
 qCdsD0mjOx5WJwHOMYOYaUyNQaPupBQXxBNcEpeTE46QPgg+uhIXo4QdXPdzVzZtteTs0AWmx4i
 lA9QXU726ga4m3IR3TyXlEaCHXI6c4hKcbaUoyDgWVXfeMQImk4OavwOaLMdpRMdmKSCA==
X-Google-Smtp-Source: AGHT+IEpUUha2LoiankVqO1OxKO8y+rZTQ9zEw/8VBZ4PS0Jm8U+EJqmmiMzkJu6dtkcwNLxH8qP9g==
X-Received: by 2002:a17:903:41cd:b0:215:8ca3:3bac with SMTP id
 d9443c01a7336-218929a1f14mr212249005ad.16.1734427058537; 
 Tue, 17 Dec 2024 01:17:38 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-218a1db74e3sm55007165ad.30.2024.12.17.01.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 01:17:37 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 17 Dec 2024 17:17:12 +0800
Message-Id: <20241217091712.383911-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net v1] net: stmmac: Drop useless code related
	to ethtool rx-copybreak
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
Pool"), these code turned to be useless and users of ethtool may get
confused about the unhandled rx-copybreak parameter.

This patch mostly reverts
commit 22ad38381547 ("stmmac: do not perform zero-copy for rx frames")

Fixes: 2af6106ae949 ("net: stmmac: Introducing support for Page Pool")
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
