Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJhOBZ4Jr2nXMQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 18:55:42 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D566423E08F
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 18:55:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B8AAC56603;
	Mon,  9 Mar 2026 17:55:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2771C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2026 17:55:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 79563445A5;
 Mon,  9 Mar 2026 17:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54F56C2BCB4;
 Mon,  9 Mar 2026 17:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773078936;
 bh=ZezFSr32pT7ms/HOoEkJXINjhxxXzSKhdAF4TkA5u20=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=knNm3syeZRNgKge4u292si+PXIkwFTkONyzhIGpX3wxCWxjvwza25tO/CCvhpQQFr
 h2+k6YWpSFOI30HQUtLn9yAkeMwEDaUhNce0yDhDhAy7r0AYkbvKV+b97zKYz/28uU
 sh45Wa/mJNBRyxGYILlPfBAXhbjAgw79mF4h7SEeC4RuBS7XOssGP2mw8VPylPsgFe
 fL3H5sS0gpIGz2K8jq8bYS6p+o1PIzHHQHrQyoNCuJQp6cwBtmuNXC/ZQiX0uEc4sW
 5KfdrK32nUE/k/2V0cubDAtdkboTzFtvtYLSIsm4G4O707vOuWYwdbJ5DjyoDzb7nL
 vEwE6/ytMftbA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 49995FCA171;
 Mon,  9 Mar 2026 17:55:36 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 09 Mar 2026 18:55:24 +0100
MIME-Version: 1.0
Message-Id: <20260309-dwmac_multi_irq-v8-5-f0cc5bc811a7@oss.nxp.com>
References: <20260309-dwmac_multi_irq-v8-0-f0cc5bc811a7@oss.nxp.com>
In-Reply-To: <20260309-dwmac_multi_irq-v8-0-f0cc5bc811a7@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773078934; l=4702;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=Ccg7iBM1Fl+oVJULpuGtFE+LiMWCMv+ramMC+vtotcs=;
 b=TauJNyXlklHqzzs9EdPPUbvJPNT0FDkCEIZoutsGNVvCyNTQZqCFb336k/psw/nmcceEGsp/G
 lrGYC/1aEkKDPRPiNiM9sxMwykFy79sNUGkRwlJvOyehvA13zBm73FZ
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, boon.khai.ng@altera.com, vladimir.oltean@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 5/5] stmmac: s32: enable support for
	Multi-IRQ mode
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
X-Rspamd-Queue-Id: D566423E08F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[jan.petrous.oss.nxp.com];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@oss.nxp.com,m:s32@nxp.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:netdev@vger.kernel.org,m:jan.petrous@oss.nxp.com,m:linux-kernel@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:boon.khai.ng@altera.com,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,suse.com,oss.nxp.com,nxp.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.922];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	HAS_REPLYTO(0.00)[jan.petrous@oss.nxp.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4033c000:email,nxp.com:email,st-md-mailman.stormreply.com:rdns,oss.nxp.com:replyto,oss.nxp.com:mid,suse.com:email,s32g399aevb3:email]
X-Rspamd-Action: no action

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Based on previous changes in platform driver, the vendor
glue driver can enable Multi-IRQ mode, if needed.

To get enabled Multi-IRQ mode for dwmac-s32, the driver checks:

  1) property of 'snps,mtl-xx-config' subnode
     defines 'snps,xx-queues-to-use' bigger then one, ie:

     ethernet@4033c000 {
         compatible = "nxp,s32g2-dwmac";
         ...
         snps,mtl-rx-config = <&mtl_rx_setup>;
         ...

         mtl_rx_setup: rx-queues-config {
             snps,rx-queues-to-use = <2>;
         };

  2) queue based IRQs are set, ie:

     ethernet@4033c000 {
         compatible = "nxp,s32g2-dwmac";
         ...
         interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
                      /* CHN 0: tx, rx */
                      <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
                      /* CHN 1: tx, rx */
                      <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
                      <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-names = "macirq",
                           "tx-queue-0", "rx-queue-0",
                           "tx-queue-1", "rx-queue-1";

If those prerequisites are met, the driver switches to Multi-IRQ mode,
using per-queue IRQs for rx/tx data pathr:

[    1.387045] s32-dwmac 4033c000.ethernet: Multi-IRQ mode (per queue IRQs) selected

Now the driver owns all queues IRQs:

root@s32g399aevb3:~# grep eth /proc/interrupts
 29:    0    0    0    0    0    0    0    0    GICv3  89 Level   eth0:mac
 30:    0    0    0    0    0    0    0    0    GICv3  91 Level   eth0:rx-0
 31:    0    0    0    0    0    0    0    0    GICv3  93 Level   eth0:rx-1
 32:    0    0    0    0    0    0    0    0    GICv3  95 Level   eth0:rx-2
 33:    0    0    0    0    0    0    0    0    GICv3  97 Level   eth0:rx-3
 34:    0    0    0    0    0    0    0    0    GICv3  99 Level   eth0:rx-4
 35:    0    0    0    0    0    0    0    0    GICv3  90 Level   eth0:tx-0
 36:    0    0    0    0    0    0    0    0    GICv3  92 Level   eth0:tx-1
 37:    0    0    0    0    0    0    0    0    GICv3  94 Level   eth0:tx-2
 38:    0    0    0    0    0    0    0    0    GICv3  96 Level   eth0:tx-3
 39:    0    0    0    0    0    0    0    0    GICv3  98 Level   eth0:tx-4

Otherwise, if one of the prerequisite don't met, the driver
continue with MAC IRQ mode:

[    1.387045] s32-dwmac 4033c000.ethernet: MAC IRQ mode selected

And only MAC IRQ will be attached:

root@s32g399aevb3:~# grep eth /proc/interrupts
 29:    0    0    0    0    0    0    0    0    GICv3  89 Level   eth0:mac

What represents the original MAC IRQ mode and is fully backward
compatible.

Reviewed-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c | 36 ++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index af594a096676..d4e0c9f44fb3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -2,7 +2,7 @@
 /*
  * NXP S32G/R GMAC glue layer
  *
- * Copyright 2019-2024 NXP
+ * Copyright 2019-2026 NXP
  *
  */
 
@@ -110,6 +110,37 @@ static void s32_gmac_exit(struct device *dev, void *priv)
 	clk_disable_unprepare(gmac->rx_clk);
 }
 
+static void s32_gmac_setup_multi_irq(struct device *dev,
+				     struct plat_stmmacenet_data *plat,
+				     struct stmmac_resources *res)
+{
+	int i;
+
+	/* RX IRQs */
+	STMMAC_FOREACH_MTL_QUEUE(i, plat->rx_queues_to_use) {
+		if (res->rx_irq[i] <= 0) {
+			dev_dbg(dev, "Missing RX queue %d interrupt\n", i);
+			goto mac_irq_mode;
+		}
+	}
+
+	/* TX IRQs */
+	STMMAC_FOREACH_MTL_QUEUE(i, plat->tx_queues_to_use) {
+		if (res->tx_irq[i] <= 0) {
+			dev_dbg(dev, "Missing TX queue %d interrupt\n", i);
+			goto mac_irq_mode;
+		}
+	}
+
+	plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
+	dev_info(dev, "Multi-IRQ mode (per queue IRQs) selected\n");
+	return;
+
+mac_irq_mode:
+	plat->flags &= ~STMMAC_FLAG_MULTI_MSI_EN;
+	dev_info(dev, "MAC IRQ mode selected\n");
+}
+
 static int s32_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat;
@@ -165,6 +196,9 @@ static int s32_dwmac_probe(struct platform_device *pdev)
 	plat->core_type = DWMAC_CORE_GMAC4;
 	plat->pmt = 1;
 	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
+
+	s32_gmac_setup_multi_irq(dev, plat, &res);
+
 	plat->rx_fifo_size = 20480;
 	plat->tx_fifo_size = 20480;
 

-- 
2.47.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
