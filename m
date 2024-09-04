Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7158E96B66B
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 11:22:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37B50C78013;
	Wed,  4 Sep 2024 09:22:35 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1C77C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2024 09:22:33 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-70b3b62025dso4327798a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Sep 2024 02:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725441752; x=1726046552;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O+hsEPkE4Ui2VEOHfUKqGaAT9XjcCNX3RsUHXC4KQWw=;
 b=F2h+yWAhn6bSbY/YSUI3clB+gD0+N2pfbjnfA7LG5guMGWy9jKuqZ3U6IWr+SpuesR
 vhcNYxp8VBqBxXfHCsYxD+CbYHk+8QYA0JVHDV9ANZPYv0RweyWOw85+K+4fjppaZNgY
 rd7+wI3wWE73DcsFWw2CqFgOZBVK2d4lNZCUnZHCgTYCMo2QxEcDsvBH5Hl6MK72xnh4
 uK06Bt+qy7YSnZBS3le3lNkQIImmiO+2N3ymX+Pr920PWZW9PvStt+AN5tdItCokXnO4
 PNIRU2XrbqnZq/qJI8UZG6tCvJVLqI5oms40f6jLE+yrQIWWXAAkj36gyk2Ss/HjBN77
 Ww6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725441752; x=1726046552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O+hsEPkE4Ui2VEOHfUKqGaAT9XjcCNX3RsUHXC4KQWw=;
 b=LhVSpEoBpIOxB1L4oGGOtkbpFAa/JI43Ju+B0CG4zq0WfrCLLADSDlJ9FxFrrlyqh9
 m9xoHwtxtrbGWmy4LSZk/RCMcu976Qy6Pzoi/yDL4bhLRnRai2Dx/ie6puWM4x64VE4I
 HlmDc8RTR26bLxR/zUDP/K0W1J9V9OKF9NlEIHrWWv1G+2001epBflj5czkHdcKxYHoN
 4bU9pUkxXX63zh+ZNeHCbGGvqBxomH7t2XZZtY3CedJRDAbou8pOtYXd1hGDE2wT4c+t
 5q6X7RabqkSss15lLIp1QgsnUVeBZqJw267i4SiHIy6uXWpjlEp63W9TiPJwSG2KtyPy
 fC8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNYmZcPDqoDPrMW0z6oTs/1sDylQqXMOP5U543Mg7bT3qMLa4w9ERO6Y+qsV+Qf1JBHXLeo6jU/Jqfhw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz4RdQW2iRNx1TfZccooT3xI54ba6fYTmVi+s6ITiJE1Em9gTJl
 0NBoBR3vFSUvPgStvoVkaNCNQKAjePDFcRUqv55EewJT0vw6lnoT
X-Google-Smtp-Source: AGHT+IHwb6FAfvG488jHmtgVp1MLPEh59tWevx7xn2wiVpvzrKcsUZZhOD/xH1RMexDlngjupkrCdA==
X-Received: by 2002:a05:6358:715:b0:1ad:10eb:cd39 with SMTP id
 e5c5f4694b2df-1b7f1b42363mr1580293155d.26.1725441752492; 
 Wed, 04 Sep 2024 02:22:32 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7177859968csm1232048b3a.146.2024.09.04.02.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 02:22:32 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Wed,  4 Sep 2024 17:21:19 +0800
Message-Id: <0b8baa10f6e15e75d57ef1b2ce52f4e66e4ce90d.1725441317.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725441317.git.0x1207@gmail.com>
References: <cover.1725441317.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 4/7] net: stmmac: configure FPE
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
---
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  4 +
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 14 +++
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  6 ++
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  6 ++
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 91 +++++++++++++++++++
 5 files changed, 121 insertions(+)

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
index 220c582904f4..cc08553c8b9a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -19,6 +19,7 @@
 #include "stmmac.h"
 #include "dwmac_dma.h"
 #include "dwxgmac2.h"
+#include "dwmac5.h"
 
 #define REG_SPACE_SIZE	0x1060
 #define GMAC4_REG_SPACE_SIZE	0x116C
@@ -1263,6 +1264,93 @@ static int stmmac_set_tunable(struct net_device *dev,
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
+	*state = priv->fpe_cfg.state;
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
+	struct ethtool_mm_state *state = &priv->fpe_cfg.state;
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
+	del_timer_sync(&fpe_cfg->verify_timer);
+
+	spin_lock_irqsave(&fpe_cfg->lock, flags);
+
+	state->pmac_enabled = cfg->pmac_enabled;
+	state->tx_enabled = cfg->tx_enabled;
+	state->verify_time = cfg->verify_time;
+	state->verify_enabled = cfg->verify_enabled;
+
+	if (!cfg->verify_enabled)
+		state->verify_status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
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
+	s->MACMergeFrameSmdErrorCount = mmc->mmc_rx_packet_smd_err_cntr;
+	s->MACMergeFrameAssOkCount = mmc->mmc_rx_packet_assembly_ok_cntr;
+	s->MACMergeFragCountRx = mmc->mmc_rx_fpe_fragment_cntr;
+	s->MACMergeFragCountTx = mmc->mmc_tx_fpe_fragment_cntr;
+	s->MACMergeHoldCount = mmc->mmc_tx_hold_req_cntr;
+}
+
 static const struct ethtool_ops stmmac_ethtool_ops = {
 	.supported_coalesce_params = ETHTOOL_COALESCE_USECS |
 				     ETHTOOL_COALESCE_MAX_FRAMES,
@@ -1301,6 +1389,9 @@ static const struct ethtool_ops stmmac_ethtool_ops = {
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
