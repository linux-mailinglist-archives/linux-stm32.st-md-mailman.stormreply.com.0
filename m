Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2468F96F6BA
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 16:31:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E444DC78013;
	Fri,  6 Sep 2024 14:31:06 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 222B1C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 14:31:05 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-201d5af11a4so19710145ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Sep 2024 07:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725633064; x=1726237864;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AJ6Trtv6k+vgGrKnOznxVMZTVS8bYYyikdpz2CwQnH0=;
 b=LkvFzNvOHid6g7GJ/4KEsdm4nmOqenyJGxmxY5p5nWzIgCNnwbf485YQy8nKOPSjpS
 khgJhP55VPf/LmrFuFFP2hUREUs4pxVGeQGMAzSNds4Z9QJOeXKVZ5WSUuIq4i8hIcmt
 7/r4EST+3I6vnXdE5iRSQD1KjFkaxay6YyMgrHhjOJV/xyxqRXM760OB3jvLvhScaiuY
 DabqwJynaFUhmJbVyfsPX8aRJ5MCuQyg/0abak8n1SRv3E0YZjBinNnOROMiHYXdzdmk
 E4mBukCJFED7iUDau3T3hDqxkMdIOctMU6UHb8ax+Q98exlsaIWUfwQrZrmPbgifez2T
 3rGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725633064; x=1726237864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AJ6Trtv6k+vgGrKnOznxVMZTVS8bYYyikdpz2CwQnH0=;
 b=E7zo8XFRJ1qAB19N3/eqU09FIJD8GW0ny5VcjXcvXc1XQm1ALAQ3YHDjRKnVVahSmb
 uSB+boeoyDEJotu3An1u49VyLNV32+8vbXHWEt54KKuwFSi9+0VkS3wIjTjPh2m71OgJ
 ASUd/hM10uMS8RLvdS2itcYsdQp1a2KxPo8sl9H4wKkCMuef7RRQdBj+XSTTcP3dp6Rc
 Nqm7gaTZ85Ql8sdZEhAnZ349/Q9ditZatSRuAuoR/eywbw9lhWj2NLXd3x60pjIEpUwQ
 OaFLEd5Ru6vAmuHwjQYzLh1+3tBs0TTKPj3oPgzv8DWCmHIndeVvUgktAWZ/zBYSBWtB
 7lkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWflUfkmRTL6f1TBkoS9mt35G4WxhT0FCBNXB55/5WTfgVrPN3PD2al5iJlnDkq/KYkPXArfj4DbeSIGg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwoH8UgPgD+sNwC0fgMOXrsy/+ERp/rHtQGb1dUsus6ncS0cmWs
 YFNTrOtN83Hg0onIwcv81a2ellQi5PYVoMdkNTglcto06xOzVpRB
X-Google-Smtp-Source: AGHT+IHktLGuP4RFnllysEwZwpz+2sBcrOMM0FOEP2l5lGMUfD135ur8/XzdME4jmdJdUIMaWB9Fwg==
X-Received: by 2002:a17:902:db03:b0:1fd:9e6e:7c1f with SMTP id
 d9443c01a7336-206f062359fmr32190495ad.56.1725633063732; 
 Fri, 06 Sep 2024 07:31:03 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-206ae94dcf3sm43951975ad.80.2024.09.06.07.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 07:31:03 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Fri,  6 Sep 2024 22:30:09 +0800
Message-Id: <06ed409314fe0ee37b78b800922f2c0cce762532.1725631883.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725631883.git.0x1207@gmail.com>
References: <cover.1725631883.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v10 4/7] net: stmmac: configure FPE
	via ethtool-mm
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

Implement ethtool --show-mm and --set-mm callbacks.

NIC up/down, link up/down, suspend/resume, kselftest-ethtool_mm,
all tested okay.

Signed-off-by: Furong Xu <0x1207@gmail.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  4 +
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 14 +++
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  6 ++
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  6 ++
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 96 +++++++++++++++++++
 5 files changed, 126 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 7947b1212a2d..679efcc631f1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -1264,6 +1264,8 @@ const struct stmmac_ops dwmac410_ops = {
 	.fpe_configure = dwmac5_fpe_configure,
 	.fpe_send_mpacket = dwmac5_fpe_send_mpacket,
 	.fpe_irq_status = dwmac5_fpe_irq_status,
+	.fpe_get_add_frag_size = dwmac5_fpe_get_add_frag_size,
+	.fpe_set_add_frag_size = dwmac5_fpe_set_add_frag_size,
 	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
 	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
 	.restore_hw_vlan_rx_fltr = dwmac4_restore_hw_vlan_rx_fltr,
@@ -1316,6 +1318,8 @@ const struct stmmac_ops dwmac510_ops = {
 	.fpe_configure = dwmac5_fpe_configure,
 	.fpe_send_mpacket = dwmac5_fpe_send_mpacket,
 	.fpe_irq_status = dwmac5_fpe_irq_status,
+	.fpe_get_add_frag_size = dwmac5_fpe_get_add_frag_size,
+	.fpe_set_add_frag_size = dwmac5_fpe_set_add_frag_size,
 	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
 	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
 	.restore_hw_vlan_rx_fltr = dwmac4_restore_hw_vlan_rx_fltr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index 850cfc4df6eb..db7bbc50cfae 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -653,3 +653,17 @@ void dwmac5_fpe_send_mpacket(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
 
 	writel(value, ioaddr + MAC_FPE_CTRL_STS);
 }
+
+int dwmac5_fpe_get_add_frag_size(const void __iomem *ioaddr)
+{
+	return FIELD_GET(DWMAC5_ADD_FRAG_SZ, readl(ioaddr + MTL_FPE_CTRL_STS));
+}
+
+void dwmac5_fpe_set_add_frag_size(void __iomem *ioaddr, u32 add_frag_size)
+{
+	u32 value;
+
+	value = readl(ioaddr + MTL_FPE_CTRL_STS);
+	writel(u32_replace_bits(value, add_frag_size, DWMAC5_ADD_FRAG_SZ),
+	       ioaddr + MTL_FPE_CTRL_STS);
+}
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
index c3031c1357d0..58704c15f320 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
@@ -39,6 +39,10 @@
 #define MAC_PPSx_INTERVAL(x)		(0x00000b88 + ((x) * 0x10))
 #define MAC_PPSx_WIDTH(x)		(0x00000b8c + ((x) * 0x10))
 
+#define MTL_FPE_CTRL_STS		0x00000c90
+/* Additional Fragment Size of preempted frames */
+#define DWMAC5_ADD_FRAG_SZ		GENMASK(1, 0)
+
 #define MTL_RXP_CONTROL_STATUS		0x00000ca0
 #define RXPI				BIT(31)
 #define NPE				GENMASK(23, 16)
@@ -109,5 +113,7 @@ void dwmac5_fpe_send_mpacket(void __iomem *ioaddr,
 			     struct stmmac_fpe_cfg *cfg,
 			     enum stmmac_mpacket_type type);
 int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev);
+int dwmac5_fpe_get_add_frag_size(const void __iomem *ioaddr);
+void dwmac5_fpe_set_add_frag_size(void __iomem *ioaddr, u32 add_frag_size);
 
 #endif /* __DWMAC5_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 4942fc398ea6..f080e271f7af 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -426,6 +426,8 @@ struct stmmac_ops {
 				 struct stmmac_fpe_cfg *cfg,
 				 enum stmmac_mpacket_type type);
 	int (*fpe_irq_status)(void __iomem *ioaddr, struct net_device *dev);
+	int (*fpe_get_add_frag_size)(const void __iomem *ioaddr);
+	void (*fpe_set_add_frag_size)(void __iomem *ioaddr, u32 add_frag_size);
 };
 
 #define stmmac_core_init(__priv, __args...) \
@@ -530,6 +532,10 @@ struct stmmac_ops {
 	stmmac_do_void_callback(__priv, mac, fpe_send_mpacket, __args)
 #define stmmac_fpe_irq_status(__priv, __args...) \
 	stmmac_do_callback(__priv, mac, fpe_irq_status, __args)
+#define stmmac_fpe_get_add_frag_size(__priv, __args...) \
+	stmmac_do_callback(__priv, mac, fpe_get_add_frag_size, __args)
+#define stmmac_fpe_set_add_frag_size(__priv, __args...) \
+	stmmac_do_void_callback(__priv, mac, fpe_set_add_frag_size, __args)
 
 /* PTP and HW Timer helpers */
 struct stmmac_hwtimestamp {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 220c582904f4..266e7d335929 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -19,6 +19,7 @@
 #include "stmmac.h"
 #include "dwmac_dma.h"
 #include "dwxgmac2.h"
+#include "dwmac5.h"
 
 #define REG_SPACE_SIZE	0x1060
 #define GMAC4_REG_SPACE_SIZE	0x116C
@@ -1263,6 +1264,98 @@ static int stmmac_set_tunable(struct net_device *dev,
 	return ret;
 }
 
+static int stmmac_get_mm(struct net_device *ndev,
+			 struct ethtool_mm_state *state)
+{
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	unsigned long flags;
+	u32 frag_size;
+
+	if (!priv->dma_cap.fpesel)
+		return -EOPNOTSUPP;
+
+	spin_lock_irqsave(&priv->fpe_cfg.lock, flags);
+
+	state->max_verify_time = STMMAC_FPE_MM_MAX_VERIFY_TIME_MS;
+	state->verify_enabled = priv->fpe_cfg.verify_enabled;
+	state->pmac_enabled = priv->fpe_cfg.pmac_enabled;
+	state->verify_time = priv->fpe_cfg.verify_time;
+	state->tx_enabled = priv->fpe_cfg.tx_enabled;
+	state->verify_status = priv->fpe_cfg.status;
+	state->rx_min_frag_size = ETH_ZLEN;
+
+	/* FPE active if common tx_enabled and
+	 * (verification success or disabled(forced))
+	 */
+	if (state->tx_enabled &&
+	    (state->verify_status == ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED ||
+	     state->verify_status == ETHTOOL_MM_VERIFY_STATUS_DISABLED))
+		state->tx_active = true;
+	else
+		state->tx_active = false;
+
+	frag_size = stmmac_fpe_get_add_frag_size(priv, priv->ioaddr);
+	state->tx_min_frag_size = ethtool_mm_frag_size_add_to_min(frag_size);
+
+	spin_unlock_irqrestore(&priv->fpe_cfg.lock, flags);
+
+	return 0;
+}
+
+static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
+			 struct netlink_ext_ack *extack)
+{
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
+	unsigned long flags;
+	u32 frag_size;
+	int err;
+
+	err = ethtool_mm_frag_size_min_to_add(cfg->tx_min_frag_size,
+					      &frag_size, extack);
+	if (err)
+		return err;
+
+	/* Wait for the verification that's currently in progress to finish */
+	timer_shutdown_sync(&fpe_cfg->verify_timer);
+
+	spin_lock_irqsave(&fpe_cfg->lock, flags);
+
+	fpe_cfg->verify_enabled = cfg->verify_enabled;
+	fpe_cfg->pmac_enabled = cfg->pmac_enabled;
+	fpe_cfg->verify_time = cfg->verify_time;
+	fpe_cfg->tx_enabled = cfg->tx_enabled;
+
+	if (!cfg->verify_enabled)
+		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
+
+	stmmac_fpe_set_add_frag_size(priv, priv->ioaddr, frag_size);
+	stmmac_fpe_apply(priv);
+
+	spin_unlock_irqrestore(&fpe_cfg->lock, flags);
+
+	return 0;
+}
+
+static void stmmac_get_mm_stats(struct net_device *ndev,
+				struct ethtool_mm_stats *s)
+{
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct stmmac_counters *mmc = &priv->mmc;
+
+	if (!priv->dma_cap.rmon)
+		return;
+
+	stmmac_mmc_read(priv, priv->mmcaddr, mmc);
+
+	s->MACMergeFrameAssErrorCount = mmc->mmc_rx_packet_assembly_err_cntr;
+	s->MACMergeFrameAssOkCount = mmc->mmc_rx_packet_assembly_ok_cntr;
+	s->MACMergeFrameSmdErrorCount = mmc->mmc_rx_packet_smd_err_cntr;
+	s->MACMergeFragCountRx = mmc->mmc_rx_fpe_fragment_cntr;
+	s->MACMergeFragCountTx = mmc->mmc_tx_fpe_fragment_cntr;
+	s->MACMergeHoldCount = mmc->mmc_tx_hold_req_cntr;
+}
+
 static const struct ethtool_ops stmmac_ethtool_ops = {
 	.supported_coalesce_params = ETHTOOL_COALESCE_USECS |
 				     ETHTOOL_COALESCE_MAX_FRAMES,
@@ -1301,6 +1394,9 @@ static const struct ethtool_ops stmmac_ethtool_ops = {
 	.set_tunable = stmmac_set_tunable,
 	.get_link_ksettings = stmmac_ethtool_get_link_ksettings,
 	.set_link_ksettings = stmmac_ethtool_set_link_ksettings,
+	.get_mm = stmmac_get_mm,
+	.set_mm = stmmac_set_mm,
+	.get_mm_stats = stmmac_get_mm_stats,
 };
 
 void stmmac_set_ethtool_ops(struct net_device *netdev)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
