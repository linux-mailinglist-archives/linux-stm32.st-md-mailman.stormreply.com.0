Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F629A3596
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2024 08:39:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9405C78037;
	Fri, 18 Oct 2024 06:39:58 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56C09C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 06:39:57 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-71e7086c231so1299691b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 23:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729233596; x=1729838396;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8MDQrB0ee+wSOWj7i9m+771wGRY+ZQ0e7kYg3aj0vKk=;
 b=bULLV1lP5fZ4TsLoYYgToX6Apr1q4vgemwZtIiSO6kZREdyrepDvu3WuU7gT9rTkuA
 +J6l0j8Q60CKcbQre6Vp/zoLqCNOOZ11KVQLoZteBHZbTTJU44954U9FFxgj314DEX4U
 pFB8E0Y2bYT9/baH6cyo9VW+8YMCryZAKYjjsfMpRUIh6XyVihMnpXuvFeW4uI1DkEdH
 L9p9eV2LaUcYFHHMeI9KfPJW2jL8BmhuqSNF2uB3y9U/xC/rdd8nF/pRu+CUfQE6fPIn
 A51wgQS6RzXKQJMEssENdooscyHX1L13sOYcgHv8P1ofvKAWf5VZdX5+OPZznX0sjXvd
 ngwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729233596; x=1729838396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8MDQrB0ee+wSOWj7i9m+771wGRY+ZQ0e7kYg3aj0vKk=;
 b=HpaTosX0r3pA9HfQyHnlyW/feOsPKwi3zpONboZNEKBF3+Io9gGRcBK7bfGJ39sK6s
 b6ce0SD+F6Va1NU1uToLEEZp5I7rJ1NhcCkTcJfkInB1Hvt2zDu2c5Bwl6Rlnil9p6CF
 yfKJWegP+rNdvB8j+HIWyLnSG8jZ1+ckxll2ZXbUtAwrtwOK4DgVIw3ggxP/ekFdm9JP
 imv3cG8k97BQIdLl31n0XaLBG9jTSeeP0+tFZ8UqUKhXycuHis6LtHquvAvWG309nrFt
 kN4CP/pEpzNgCrilt/dH9JH0Nr+PGu1Zk53bp01SUdKJstQJu+dIN4UN83RKDV13DL6Y
 Gofw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF/Fr/F9cufAJzVg3TLQDKbBrG/VEpifnUELXbYnhNV2Ti/7TbUjejAsbPcXaFEEiwIQ1zVy7/cVSJFQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy1b4jTy2UjAX2C29/k85FSj/wyKh/Mj08vVdQVLTr2AQBy/dny
 T8SKdmCzm3/si7Aw9tAE/sq0Vk51Y2hSTmxoaVRBaPgEgg/JCw75
X-Google-Smtp-Source: AGHT+IH7e7Tstx3JC/hZC8zRo4Gy5IHjcfofmbIDYA7Vom0jF+5TKlj1gforv/o2ShkVdUS3rAlMpA==
X-Received: by 2002:a05:6a21:4781:b0:1d9:2408:aa4c with SMTP id
 adf61e73a8af0-1d92c508de1mr2365500637.23.1729233595766; 
 Thu, 17 Oct 2024 23:39:55 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20e5a74766fsm6285455ad.73.2024.10.17.23.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 23:39:55 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 18 Oct 2024 14:39:08 +0800
Message-Id: <210809290a8ca34159d193ade2a0e68649e1509a.1729233020.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729233020.git.0x1207@gmail.com>
References: <cover.1729233020.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v2 2/8] net: stmmac: Introduce
	stmmac_fpe_ops for gmac4 and xgmac
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

By moving FPE function callbacks from stmmac_ops to stmmac_fpe_ops,
FPE implementation becomes a separate module completely, like the
EST implementation.

Signed-off-by: Furong Xu <0x1207@gmail.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 13 -----
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  3 --
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  7 +++
 drivers/net/ethernet/stmicro/stmmac/hwif.h    | 54 ++++++++++---------
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 44 ++++++++++-----
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  | 16 ------
 7 files changed, 69 insertions(+), 69 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 684489156dce..a6e6ef687f36 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -592,6 +592,7 @@ struct mac_device_info {
 	const struct stmmac_tc_ops *tc;
 	const struct stmmac_mmc_ops *mmc;
 	const struct stmmac_est_ops *est;
+	const struct stmmac_fpe_ops *fpe;
 	struct dw_xpcs *xpcs;
 	struct phylink_pcs *phylink_pcs;
 	struct mii_regs mii;	/* MII register Addresses */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 4d217926820a..1c45b7c1660f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -16,7 +16,6 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include "stmmac.h"
-#include "stmmac_fpe.h"
 #include "stmmac_pcs.h"
 #include "dwmac4.h"
 #include "dwmac5.h"
@@ -1262,12 +1261,6 @@ const struct stmmac_ops dwmac410_ops = {
 	.set_arp_offload = dwmac4_set_arp_offload,
 	.config_l3_filter = dwmac4_config_l3_filter,
 	.config_l4_filter = dwmac4_config_l4_filter,
-	.fpe_configure = dwmac5_fpe_configure,
-	.fpe_send_mpacket = dwmac5_fpe_send_mpacket,
-	.fpe_irq_status = dwmac5_fpe_irq_status,
-	.fpe_get_add_frag_size = dwmac5_fpe_get_add_frag_size,
-	.fpe_set_add_frag_size = dwmac5_fpe_set_add_frag_size,
-	.fpe_map_preemption_class = dwmac5_fpe_map_preemption_class,
 	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
 	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
 	.restore_hw_vlan_rx_fltr = dwmac4_restore_hw_vlan_rx_fltr,
@@ -1317,12 +1310,6 @@ const struct stmmac_ops dwmac510_ops = {
 	.set_arp_offload = dwmac4_set_arp_offload,
 	.config_l3_filter = dwmac4_config_l3_filter,
 	.config_l4_filter = dwmac4_config_l4_filter,
-	.fpe_configure = dwmac5_fpe_configure,
-	.fpe_send_mpacket = dwmac5_fpe_send_mpacket,
-	.fpe_irq_status = dwmac5_fpe_irq_status,
-	.fpe_get_add_frag_size = dwmac5_fpe_get_add_frag_size,
-	.fpe_set_add_frag_size = dwmac5_fpe_set_add_frag_size,
-	.fpe_map_preemption_class = dwmac5_fpe_map_preemption_class,
 	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
 	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
 	.restore_hw_vlan_rx_fltr = dwmac4_restore_hw_vlan_rx_fltr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 111ba5a524ed..ce2cbae15973 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -8,7 +8,6 @@
 #include <linux/crc32.h>
 #include <linux/iopoll.h>
 #include "stmmac.h"
-#include "stmmac_fpe.h"
 #include "stmmac_ptp.h"
 #include "dwxlgmac2.h"
 #include "dwxgmac2.h"
@@ -1545,7 +1544,6 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.config_l3_filter = dwxgmac2_config_l3_filter,
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
-	.fpe_configure = dwxgmac3_fpe_configure,
 };
 
 static void dwxlgmac2_rx_queue_enable(struct mac_device_info *hw, u8 mode,
@@ -1602,7 +1600,6 @@ const struct stmmac_ops dwxlgmac2_ops = {
 	.config_l3_filter = dwxgmac2_config_l3_filter,
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
-	.fpe_configure = dwxgmac3_fpe_configure,
 };
 
 int dwxgmac2_setup(struct stmmac_priv *priv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 88cce28b2f98..5969963d132b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -116,6 +116,7 @@ static const struct stmmac_hwif_entry {
 	const void *tc;
 	const void *mmc;
 	const void *est;
+	const void *fpe;
 	int (*setup)(struct stmmac_priv *priv);
 	int (*quirks)(struct stmmac_priv *priv);
 } stmmac_hw[] = {
@@ -194,6 +195,7 @@ static const struct stmmac_hwif_entry {
 		.tc = &dwmac510_tc_ops,
 		.mmc = &dwmac_mmc_ops,
 		.est = &dwmac510_est_ops,
+		.fpe = &dwmac5_fpe_ops,
 		.setup = dwmac4_setup,
 		.quirks = NULL,
 	}, {
@@ -214,6 +216,7 @@ static const struct stmmac_hwif_entry {
 		.tc = &dwmac510_tc_ops,
 		.mmc = &dwmac_mmc_ops,
 		.est = &dwmac510_est_ops,
+		.fpe = &dwmac5_fpe_ops,
 		.setup = dwmac4_setup,
 		.quirks = NULL,
 	}, {
@@ -234,6 +237,7 @@ static const struct stmmac_hwif_entry {
 		.tc = &dwmac510_tc_ops,
 		.mmc = &dwmac_mmc_ops,
 		.est = &dwmac510_est_ops,
+		.fpe = &dwmac5_fpe_ops,
 		.setup = dwmac4_setup,
 		.quirks = NULL,
 	}, {
@@ -255,6 +259,7 @@ static const struct stmmac_hwif_entry {
 		.tc = &dwxgmac_tc_ops,
 		.mmc = &dwxgmac_mmc_ops,
 		.est = &dwmac510_est_ops,
+		.fpe = &dwxgmac_fpe_ops,
 		.setup = dwxgmac2_setup,
 		.quirks = NULL,
 	}, {
@@ -276,6 +281,7 @@ static const struct stmmac_hwif_entry {
 		.tc = &dwxgmac_tc_ops,
 		.mmc = &dwxgmac_mmc_ops,
 		.est = &dwmac510_est_ops,
+		.fpe = &dwxgmac_fpe_ops,
 		.setup = dwxlgmac2_setup,
 		.quirks = stmmac_dwxlgmac_quirks,
 	},
@@ -351,6 +357,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 		mac->tc = mac->tc ? : entry->tc;
 		mac->mmc = mac->mmc ? : entry->mmc;
 		mac->est = mac->est ? : entry->est;
+		mac->fpe = mac->fpe ? : entry->fpe;
 
 		priv->hw = mac;
 		priv->ptpaddr = priv->ioaddr + entry->regs.ptp_off;
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index d5a9f01ecac5..2f069657d9d5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -420,18 +420,6 @@ struct stmmac_ops {
 				bool en, bool udp, bool sa, bool inv,
 				u32 match);
 	void (*set_arp_offload)(struct mac_device_info *hw, bool en, u32 addr);
-	void (*fpe_configure)(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
-			      u32 num_txq, u32 num_rxq,
-			      bool tx_enable, bool pmac_enable);
-	void (*fpe_send_mpacket)(void __iomem *ioaddr,
-				 struct stmmac_fpe_cfg *cfg,
-				 enum stmmac_mpacket_type type);
-	int (*fpe_irq_status)(void __iomem *ioaddr, struct net_device *dev);
-	int (*fpe_get_add_frag_size)(const void __iomem *ioaddr);
-	void (*fpe_set_add_frag_size)(void __iomem *ioaddr, u32 add_frag_size);
-	int (*fpe_map_preemption_class)(struct net_device *ndev,
-					struct netlink_ext_ack *extack,
-					u32 pclass);
 };
 
 #define stmmac_core_init(__priv, __args...) \
@@ -530,18 +518,6 @@ struct stmmac_ops {
 	stmmac_do_callback(__priv, mac, config_l4_filter, __args)
 #define stmmac_set_arp_offload(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, set_arp_offload, __args)
-#define stmmac_fpe_configure(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, fpe_configure, __args)
-#define stmmac_fpe_send_mpacket(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, fpe_send_mpacket, __args)
-#define stmmac_fpe_irq_status(__priv, __args...) \
-	stmmac_do_callback(__priv, mac, fpe_irq_status, __args)
-#define stmmac_fpe_get_add_frag_size(__priv, __args...) \
-	stmmac_do_callback(__priv, mac, fpe_get_add_frag_size, __args)
-#define stmmac_fpe_set_add_frag_size(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, fpe_set_add_frag_size, __args)
-#define stmmac_fpe_map_preemption_class(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, fpe_map_preemption_class, __args)
 
 /* PTP and HW Timer helpers */
 struct stmmac_hwtimestamp {
@@ -677,6 +653,34 @@ struct stmmac_est_ops {
 #define stmmac_est_irq_status(__priv, __args...) \
 	stmmac_do_void_callback(__priv, est, irq_status, __args)
 
+struct stmmac_fpe_ops {
+	void (*fpe_configure)(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
+			      u32 num_txq, u32 num_rxq,
+			      bool tx_enable, bool pmac_enable);
+	void (*fpe_send_mpacket)(void __iomem *ioaddr,
+				 struct stmmac_fpe_cfg *cfg,
+				 enum stmmac_mpacket_type type);
+	int (*fpe_irq_status)(void __iomem *ioaddr, struct net_device *dev);
+	int (*fpe_get_add_frag_size)(const void __iomem *ioaddr);
+	void (*fpe_set_add_frag_size)(void __iomem *ioaddr, u32 add_frag_size);
+	int (*fpe_map_preemption_class)(struct net_device *ndev,
+					struct netlink_ext_ack *extack,
+					u32 pclass);
+};
+
+#define stmmac_fpe_configure(__priv, __args...) \
+	stmmac_do_void_callback(__priv, fpe, fpe_configure, __args)
+#define stmmac_fpe_send_mpacket(__priv, __args...) \
+	stmmac_do_void_callback(__priv, fpe, fpe_send_mpacket, __args)
+#define stmmac_fpe_irq_status(__priv, __args...) \
+	stmmac_do_callback(__priv, fpe, fpe_irq_status, __args)
+#define stmmac_fpe_get_add_frag_size(__priv, __args...) \
+	stmmac_do_callback(__priv, fpe, fpe_get_add_frag_size, __args)
+#define stmmac_fpe_set_add_frag_size(__priv, __args...) \
+	stmmac_do_void_callback(__priv, fpe, fpe_set_add_frag_size, __args)
+#define stmmac_fpe_map_preemption_class(__priv, __args...) \
+	stmmac_do_void_callback(__priv, fpe, fpe_map_preemption_class, __args)
+
 struct stmmac_regs_off {
 	u32 ptp_off;
 	u32 mmc_off;
@@ -702,6 +706,8 @@ extern const struct stmmac_desc_ops dwxgmac210_desc_ops;
 extern const struct stmmac_mmc_ops dwmac_mmc_ops;
 extern const struct stmmac_mmc_ops dwxgmac_mmc_ops;
 extern const struct stmmac_est_ops dwmac510_est_ops;
+extern const struct stmmac_fpe_ops dwmac5_fpe_ops;
+extern const struct stmmac_fpe_ops dwxgmac_fpe_ops;
 
 #define GMAC_VERSION		0x00000020	/* GMAC CORE Version */
 #define GMAC4_VERSION		0x00000110	/* GMAC4+ CORE Version */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 3187eaea7503..c01eb7243d56 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -160,9 +160,10 @@ void stmmac_fpe_apply(struct stmmac_priv *priv)
 	}
 }
 
-void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
-			  u32 num_txq, u32 num_rxq,
-			  bool tx_enable, bool pmac_enable)
+static void dwmac5_fpe_configure(void __iomem *ioaddr,
+				 struct stmmac_fpe_cfg *cfg,
+				 u32 num_txq, u32 num_rxq,
+				 bool tx_enable, bool pmac_enable)
 {
 	u32 value;
 
@@ -193,7 +194,7 @@ void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
 	writel(value, ioaddr + GMAC_INT_EN);
 }
 
-int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
+static int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
 {
 	u32 value;
 	int status;
@@ -228,8 +229,9 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
 	return status;
 }
 
-void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
-			     enum stmmac_mpacket_type type)
+static void dwmac5_fpe_send_mpacket(void __iomem *ioaddr,
+				    struct stmmac_fpe_cfg *cfg,
+				    enum stmmac_mpacket_type type)
 {
 	u32 value = cfg->fpe_csr;
 
@@ -241,12 +243,13 @@ void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
 	writel(value, ioaddr + MAC_FPE_CTRL_STS);
 }
 
-int dwmac5_fpe_get_add_frag_size(const void __iomem *ioaddr)
+static int dwmac5_fpe_get_add_frag_size(const void __iomem *ioaddr)
 {
 	return FIELD_GET(DWMAC5_ADD_FRAG_SZ, readl(ioaddr + MTL_FPE_CTRL_STS));
 }
 
-void dwmac5_fpe_set_add_frag_size(void __iomem *ioaddr, u32 add_frag_size)
+static void dwmac5_fpe_set_add_frag_size(void __iomem *ioaddr,
+					 u32 add_frag_size)
 {
 	u32 value;
 
@@ -258,8 +261,9 @@ void dwmac5_fpe_set_add_frag_size(void __iomem *ioaddr, u32 add_frag_size)
 #define ALG_ERR_MSG "TX algorithm SP is not suitable for one-to-many mapping"
 #define WEIGHT_ERR_MSG "TXQ weight %u differs across other TXQs in TC: [%u]"
 
-int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
-				    struct netlink_ext_ack *extack, u32 pclass)
+static int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
+					   struct netlink_ext_ack *extack,
+					   u32 pclass)
 {
 	u32 val, offset, count, queue_weight, preemptible_txqs = 0;
 	struct stmmac_priv *priv = netdev_priv(ndev);
@@ -310,9 +314,10 @@ int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 	return 0;
 }
 
-void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
-			    u32 num_txq, u32 num_rxq,
-			    bool tx_enable, bool pmac_enable)
+static void dwxgmac3_fpe_configure(void __iomem *ioaddr,
+				   struct stmmac_fpe_cfg *cfg,
+				   u32 num_txq, u32 num_rxq,
+				   bool tx_enable, bool pmac_enable)
 {
 	u32 value;
 
@@ -334,3 +339,16 @@ void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
 	value |= XGMAC_EFPE;
 	writel(value, ioaddr + XGMAC_FPE_CTRL_STS);
 }
+
+const struct stmmac_fpe_ops dwmac5_fpe_ops = {
+	.fpe_configure = dwmac5_fpe_configure,
+	.fpe_send_mpacket = dwmac5_fpe_send_mpacket,
+	.fpe_irq_status = dwmac5_fpe_irq_status,
+	.fpe_get_add_frag_size = dwmac5_fpe_get_add_frag_size,
+	.fpe_set_add_frag_size = dwmac5_fpe_set_add_frag_size,
+	.fpe_map_preemption_class = dwmac5_fpe_map_preemption_class,
+};
+
+const struct stmmac_fpe_ops dwxgmac_fpe_ops = {
+	.fpe_configure = dwxgmac3_fpe_configure,
+};
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
index d4d46a07d6a7..a113b5c57de9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
@@ -36,19 +36,3 @@ void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up);
 void stmmac_fpe_event_status(struct stmmac_priv *priv, int status);
 void stmmac_fpe_init(struct stmmac_priv *priv);
 void stmmac_fpe_apply(struct stmmac_priv *priv);
-
-void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
-			  u32 num_txq, u32 num_rxq,
-			  bool tx_enable, bool pmac_enable);
-void dwmac5_fpe_send_mpacket(void __iomem *ioaddr,
-			     struct stmmac_fpe_cfg *cfg,
-			     enum stmmac_mpacket_type type);
-int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev);
-int dwmac5_fpe_get_add_frag_size(const void __iomem *ioaddr);
-void dwmac5_fpe_set_add_frag_size(void __iomem *ioaddr, u32 add_frag_size);
-int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
-				    struct netlink_ext_ack *extack, u32 pclass);
-
-void dwxgmac3_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
-			    u32 num_txq, u32 num_rxq,
-			    bool tx_enable, bool pmac_enable);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
