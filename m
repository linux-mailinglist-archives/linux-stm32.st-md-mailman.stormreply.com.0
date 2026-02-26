Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFlRAyZNoWkfsAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 08:52:06 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DA51B41EA
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 08:52:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AC75C87EC5;
	Fri, 27 Feb 2026 07:52:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E23CC8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Feb 2026 08:54:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3EA5D440DD;
 Thu, 26 Feb 2026 08:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DE03C19424;
 Thu, 26 Feb 2026 08:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772096055;
 bh=Q9V6sTMaJ2pd7d5NGrdgzvEcNvyFxJE7OuvaMwzwrfQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=OEnTesdLTXh3CRG5FMziIXiU5v7UC1fFPXvISlCawSgWNkNG00f6jobgbp4NEqCTG
 w4d80TikFRuNdyWYoIaWZCjXtiG+vMVxxdu0HNFaQKTwrniV7JU9JxNOuJnvV3hCfT
 2HqVLHXm6AsXZYWY7uYtNTWSJPKRIEi/W89Jf8uVVX7zanc/nQ+OX7WK3pJ2lUozjN
 /1l5Nso20pqtJixJo070o2aImKJLEKti3AQZRW2XYaFWDm/9zAOpmtDWIPqdrodQ7Z
 IDYAGRyGfXZENuxjdkz9gMGuAHBQRi966HOd0ZNnFPvBOVzK4Mo9VIyYQAjPwpKPVt
 MThc4+jlmWUjQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id EE62AFC5913;
 Thu, 26 Feb 2026 08:54:14 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Thu, 26 Feb 2026 09:54:06 +0100
MIME-Version: 1.0
Message-Id: <20260226-dwmac_multi_irq-v7-1-f8fe3b945bb4@oss.nxp.com>
References: <20260226-dwmac_multi_irq-v7-0-f8fe3b945bb4@oss.nxp.com>
In-Reply-To: <20260226-dwmac_multi_irq-v7-0-f8fe3b945bb4@oss.nxp.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772096053; l=4143;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=AN9BxArjvT+LtwWtaoyDzsO4XeDTxufZg6uDwPtH3+8=;
 b=qx4zViXLhquemljUdcK9/hePoUKUSGDPdEFSLQaAUKxdNbrTHqfA5yznxNKgqzJbgLNjeQe5h
 HwPpAWooWzzCnl0hEP7EkpABcn72M2PYEy57NzXZsGL5wKXTtsMpsUG
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailman-Approved-At: Fri, 27 Feb 2026 07:52:03 +0000
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, boon.khai.ng@altera.com, vladimir.oltean@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 1/5] net: stmmac: Use helper macro for loop
 over queue-based arrays
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
Reply-To: jan.petrous@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[jan.petrous.oss.nxp.com];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@oss.nxp.com,m:s32@nxp.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:netdev@vger.kernel.org,m:jan.petrous@oss.nxp.com,m:linux-kernel@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:boon.khai.ng@altera.com,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[29];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,suse.com,oss.nxp.com,nxp.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.879];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	HAS_REPLYTO(0.00)[jan.petrous@oss.nxp.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,oss.nxp.com:mid,oss.nxp.com:replyto,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 99DA51B41EA
X-Rspamd-Action: no action

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

The stmmac driver contains similar pattern for processing queue-based
arrays, ie. interrupt lines, etc. Factor out the for loop and provide
a macro STMMAC_FOREACH_MTL_QUEUE(var, limit).

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h        |  3 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   | 16 ++++++++--------
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 49893b9fb88c..3890e82c69f6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -233,7 +233,7 @@ static void dwxgmac2_prog_mtl_tx_algorithms(struct mac_device_info *hw,
 	writel(value, ioaddr + XGMAC_MTL_OPMODE);
 
 	/* Set ETS if desired */
-	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
+	STMMAC_FOREACH_MTL_QUEUE(i, MTL_MAX_TX_QUEUES) {
 		value = readl(ioaddr + XGMAC_MTL_TCx_ETS_CONTROL(i));
 		value &= ~XGMAC_TSA;
 		if (ets)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 51c96a738151..c972ad8e79f8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -382,6 +382,9 @@ enum stmmac_state {
 
 extern const struct dev_pm_ops stmmac_simple_pm_ops;
 
+#define STMMAC_FOREACH_MTL_QUEUE(var, limit) \
+	for (var = 0; var < (limit); var++)
+
 int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index edf0799b7236..b920ca17b2be 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3875,7 +3875,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	}
 
 	/* Request Rx MSI irq */
-	for (i = 0; i < priv->plat->rx_queues_to_use; i++) {
+	STMMAC_FOREACH_MTL_QUEUE(i, priv->plat->rx_queues_to_use) {
 		if (i >= MTL_MAX_RX_QUEUES)
 			break;
 		if (priv->rx_irq[i] == 0)
@@ -3899,7 +3899,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	}
 
 	/* Request Tx MSI irq */
-	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
+	STMMAC_FOREACH_MTL_QUEUE(i, priv->plat->tx_queues_to_use) {
 		if (i >= MTL_MAX_TX_QUEUES)
 			break;
 		if (priv->tx_irq[i] == 0)
@@ -4084,10 +4084,10 @@ static int __stmmac_open(struct net_device *dev,
 			 struct stmmac_dma_conf *dma_conf)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
+	int ret, i;
 	u32 chan;
-	int ret;
 
-	for (int i = 0; i < MTL_MAX_TX_QUEUES; i++)
+	STMMAC_FOREACH_MTL_QUEUE(i, MTL_MAX_TX_QUEUES)
 		if (priv->dma_conf.tx_queue[i].tbs & STMMAC_TBS_EN)
 			dma_conf->tx_queue[i].tbs = priv->dma_conf.tx_queue[i].tbs;
 	memcpy(&priv->dma_conf, dma_conf, sizeof(*dma_conf));
@@ -7734,9 +7734,9 @@ static int __stmmac_dvr_probe(struct device *device,
 	priv->device = device;
 	priv->dev = ndev;
 
-	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
+	STMMAC_FOREACH_MTL_QUEUE(i, MTL_MAX_RX_QUEUES)
 		u64_stats_init(&priv->xstats.rxq_stats[i].napi_syncp);
-	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
+	STMMAC_FOREACH_MTL_QUEUE(i, MTL_MAX_TX_QUEUES) {
 		u64_stats_init(&priv->xstats.txq_stats[i].q_syncp);
 		u64_stats_init(&priv->xstats.txq_stats[i].napi_syncp);
 	}
@@ -7759,9 +7759,9 @@ static int __stmmac_dvr_probe(struct device *device,
 	priv->sfty_irq = res->sfty_irq;
 	priv->sfty_ce_irq = res->sfty_ce_irq;
 	priv->sfty_ue_irq = res->sfty_ue_irq;
-	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
+	STMMAC_FOREACH_MTL_QUEUE(i, MTL_MAX_RX_QUEUES)
 		priv->rx_irq[i] = res->rx_irq[i];
-	for (i = 0; i < MTL_MAX_TX_QUEUES; i++)
+	STMMAC_FOREACH_MTL_QUEUE(i, MTL_MAX_TX_QUEUES)
 		priv->tx_irq[i] = res->tx_irq[i];
 
 	if (!is_zero_ether_addr(res->mac))

-- 
2.47.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
