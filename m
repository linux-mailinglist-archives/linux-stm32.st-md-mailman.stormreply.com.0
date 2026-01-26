Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JqBJn+jd2mWjgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 18:25:19 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDD98B6E3
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 18:25:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C70F3C87EDB;
	Mon, 26 Jan 2026 17:25:18 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0723CC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 17:25:16 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-4359a302794so2960772f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 09:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769448316; x=1770053116;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I8NCqtdKCDQg/h+vlP7+WRT2HIbB0HaXTUJf1+ishbw=;
 b=Sd2qMm7hj93ZdTV4afRBM5pVlSpRtg0pUBkCTN0TUxYfY1MwIlq5eL3/3iyeLyGLqm
 45fzBNTcq+VPqpl3cYFEfEtpQ9n4VZbYZYv55leek7sT1pKFxMGxLRMF8aVTnkzdHEvk
 RQZMicLJAOYJ+n3RzxCQIxqxQcjUG0RRpnbGJrYyiuHmp0MBqlEfGaow4eDKB5RnfSKJ
 YGDAVO2i86LhgFCoO+tcFmtZm7kzzKLu5t3NBLir45mDlYaVjl1wNQRrOYLOTyOmK3pO
 gbNDx4yL8Pbr5gMUNHojN3wxah4k52HzYoOvSoCXDO/IW3nyHbZkWhzm3yotIeBTcQRZ
 qM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769448316; x=1770053116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I8NCqtdKCDQg/h+vlP7+WRT2HIbB0HaXTUJf1+ishbw=;
 b=fGB8kSy9pmWhtTyhRsTuS4R7KY16xscaJYplthc5rY0RCFb0+4JJFn5Ss9Hk9XubRC
 CfzT2N5Ygj3UAOce1jo2zq6WYMc4eyJcbkILilDjmFN0IjU/rANo1tRD4jC7O+oJBSMs
 nwHLlMCdtAWPX5abhi4v/ai0tpbHVaOD5wnkKtcE7gt8eALSZgo4vLOCQ/elVdOqMHYV
 raEuukajjKkDknKlrNQ8ySwsvkkUl80Xyf1DsUwCtn4czQ30YEVabRccV6E3jcYDR3YZ
 G1SGjVZhAvMCRzuKe9CztcjTMfTgJRzLv08Tk2NtAYG3NSKOxalImRImCkhNvySZZjsM
 7UVQ==
X-Gm-Message-State: AOJu0Yya1/H0bpgY1btEvzpE5EIJMsd6lOfpp1rCerSxrsGhaOh5ZrQt
 aLWA85hkO27zJscFxT60N3p/DyxQpoLwopkyLt44X1tNhCN4agEyzQ9v
X-Gm-Gg: AZuq6aJ/6gs0oCh8Is8MWsP4aonCZMGun0ZyVywR5sthjBuISHqYu7LCJHrhjv8Vl1b
 rrJ2YEqMUouIQW1kjI5WMa3+KYXqNZQdqnyT4u8p+r/rT2sJQT2UBLz/vuCr5YWK3hTx84c5NK7
 REG9LHCrxPCyCaPTK+SgKbPwzCja1taXNN9uIawfKPKd1gW5TsKzvG7pfNvXOgw5vkcKnjLlpM0
 sd/PgIH6s8/Xryvi+FRRmt5A2yAbcnKVoPOW3FKt34LKkbWusUzwhPp8aaCLTBUKvhJL5Fcobbd
 ZB4I/hwh+g05vETnFsqcEvcER8L1p7o1wIJ9KLlUVck7iNObPsoZurCt+E30bEMaZxsiDduXEJT
 RGH9JKknLJxWipxiasrcY8MosyQNTJgCi48sDGXANx4pp9ZIFvBYmye0i+/BVfbSqgx3OjwtpKh
 cFdE8I5J/2z39nSmD7lALTvqSXC+sInCGOM0FFpDkGFjj+80has4uM/xzdSTOmF46qaMiCDgr29
 pR9J8Pl2+blQ+Hrcsxionm6A+NJZrLopi8w218DQGMC
X-Received: by 2002:a05:6000:2889:b0:435:9e32:2b78 with SMTP id
 ffacd0b85a97d-435ca0f7b5cmr7897753f8f.1.1769448315992; 
 Mon, 26 Jan 2026 09:25:15 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:6788:ac2b:89cc:7ade])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1c24bf8sm31288531f8f.11.2026.01.26.09.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:25:15 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org
Date: Mon, 26 Jan 2026 17:25:03 +0000
Message-ID: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFC PATCH net-next] net: stmmac: Preserve bootloader
	MAC address across unconditional reset
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:p.zabel@pengutronix.de,m:rmk+kernel@armlinux.org.uk,m:geert+renesas@glider.be,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:geert@glider.be,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,pengutronix.de,armlinux.org.uk,glider.be,vger.kernel.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,renesas.com,bp.renesas.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 2FDD98B6E3
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Commit 90f522a20e3d1 ("NET: dwmac: Make dwmac reset unconditional")
asserts a reset in probe when a reset controller is present. This reset
clears the MAC address registers, so a valid address programmed by the
bootloader gets lost and the driver falls back to a random address.

Read the MAC address from the hardware registers before resetting the
hardware. Keep the existing address selection logic when no valid
address is found, and program the selected address back into the MAC
after probe so it remains consistent in hardware.

Export stmmac_bus_clks_config() so the early read path can enable the
bus clocks before accessing the MAC registers.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi all,

Sending this patch as an RFC if there is an alternative/better way to
achieve this.

Cheers,
Prabhakar
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 66 ++++++++++++++++++-
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  3 +-
 .../ethernet/stmicro/stmmac/stmmac_platform.h |  2 +
 3 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 347a0078f622..171bf08d6242 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -44,6 +44,7 @@
 #include <net/page_pool/helpers.h>
 #include <net/pkt_cls.h>
 #include <net/xdp_sock_drv.h>
+#include "stmmac_platform.h"
 #include "stmmac_ptp.h"
 #include "stmmac_fpe.h"
 #include "stmmac.h"
@@ -7659,11 +7660,65 @@ struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(stmmac_plat_dat_alloc);
 
+static int stmmac_read_mac_before_reset(struct stmmac_priv *priv,
+					u8 *mac_addr)
+{
+	unsigned int hi_addr, lo_addr;
+	int ret;
+
+	eth_zero_addr(mac_addr);
+
+	/* Deassert reset to allow hardware access */
+	if (priv->plat->stmmac_rst) {
+		ret = reset_control_deassert(priv->plat->stmmac_rst);
+		if (ret)
+			return ret;
+	}
+
+	/* Enable bus clocks to read MAC address */
+	ret = stmmac_bus_clks_config(priv, true);
+	if (ret) {
+		dev_warn(priv->device, "failed to enable clocks: %d\n", ret);
+		goto assert_reset;
+	}
+
+	switch (priv->plat->core_type) {
+	case DWMAC_CORE_GMAC4:
+	case DWMAC_CORE_XGMAC:
+		/* GMAC4/XGMAC: MAC Address0 High/Low Register */
+		hi_addr = 0x300;  /* GMAC_ADDR_HIGH(0) */
+		lo_addr = 0x304;  /* GMAC_ADDR_LOW(0) */
+		break;
+	case DWMAC_CORE_GMAC:
+	case DWMAC_CORE_MAC100:
+		/* GMAC/GMAC3/MAC100: MAC Address0 High/Low Register */
+		hi_addr = 0x40;   /* GMAC_ADDR_HIGH(0) */
+		lo_addr = 0x44;   /* GMAC_ADDR_LOW(0) */
+		break;
+	default:
+		hi_addr = 0;
+	}
+
+	if (hi_addr)
+		stmmac_get_mac_addr(priv->ioaddr, mac_addr, hi_addr, lo_addr);
+
+	ret = 0;
+
+	stmmac_bus_clks_config(priv, false);
+
+assert_reset:
+	if (priv->plat->stmmac_rst)
+		reset_control_assert(priv->plat->stmmac_rst);
+
+	return ret;
+}
+
 static int __stmmac_dvr_probe(struct device *device,
 			      struct plat_stmmacenet_data *plat_dat,
 			      struct stmmac_resources *res)
 {
 	struct net_device *ndev = NULL;
+	u8 saved_mac_addr[ETH_ALEN];
 	struct stmmac_priv *priv;
 	u32 rxq;
 	int i, ret = 0;
@@ -7740,6 +7795,9 @@ static int __stmmac_dvr_probe(struct device *device,
 	if ((phyaddr >= 0) && (phyaddr <= 31))
 		priv->plat->phy_addr = phyaddr;
 
+	/* Save MAC address before reset (if bootloader programmed it) */
+	stmmac_read_mac_before_reset(priv, saved_mac_addr);
+
 	if (priv->plat->stmmac_rst) {
 		ret = reset_control_assert(priv->plat->stmmac_rst);
 		reset_control_deassert(priv->plat->stmmac_rst);
@@ -7768,7 +7826,13 @@ static int __stmmac_dvr_probe(struct device *device,
 	if (priv->synopsys_id < DWMAC_CORE_5_20)
 		priv->plat->dma_cfg->dche = false;
 
-	stmmac_check_ether_addr(priv);
+	if (is_valid_ether_addr(saved_mac_addr))
+		eth_hw_addr_set(priv->dev, saved_mac_addr);
+	else
+		stmmac_check_ether_addr(priv);
+
+	/* Store the MAC address in hardware */
+	stmmac_set_umac_addr(priv, priv->hw, priv->dev->dev_addr, 0);
 
 	ndev->netdev_ops = &stmmac_netdev_ops;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 8979a50b5507..6f0393f2992d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -857,7 +857,7 @@ void stmmac_pltfr_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(stmmac_pltfr_remove);
 
-static int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled)
+int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled)
 {
 	struct plat_stmmacenet_data *plat_dat = priv->plat;
 	int ret;
@@ -888,6 +888,7 @@ static int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(stmmac_bus_clks_config);
 
 static int __maybe_unused stmmac_runtime_suspend(struct device *dev)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
index 6e6561e29d6e..2d52197020a7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
@@ -20,6 +20,8 @@ struct clk *stmmac_pltfr_find_clk(struct plat_stmmacenet_data *plat_dat,
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res);
 
+int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled);
+
 int stmmac_pltfr_probe(struct platform_device *pdev,
 		       struct plat_stmmacenet_data *plat,
 		       struct stmmac_resources *res);
-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
