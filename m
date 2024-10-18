Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 927DB9A4886
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2024 22:53:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3296AC78026;
	Fri, 18 Oct 2024 20:53:46 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com
 [192.19.144.207])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FD1AC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 20:53:39 +0000 (UTC)
Received: from mail-lvn-it-01.lvn.broadcom.net
 (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
 by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 31F2DC003AD1;
 Fri, 18 Oct 2024 13:53:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 31F2DC003AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1729284818;
 bh=0jiB1tRHc2IgEsT0lkF5yK8TzDqhVGpedseWUDNs8HI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P9MktG33gf9fUSfp6ywesUxei0uEgvl277RPQ0zhTJjzpdekx9LoCPz7uJEvlNjgY
 IZ7Hg+YbHcmNORrysMhea+fsUk7lZztAT2fPmFXYqtq/sLgOndWepGGk/ci37sxeqY
 YSi8IVzynC2BIIpavKryYSNqdVIkT0KsdGZqMxJM=
Received: from pcie-dev03.dhcp.broadcom.net (pcie-dev03.dhcp.broadcom.net
 [10.59.171.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 8715018041CACA;
 Fri, 18 Oct 2024 13:53:37 -0700 (PDT)
From: jitendra.vegiraju@broadcom.com
To: netdev@vger.kernel.org
Date: Fri, 18 Oct 2024 13:53:30 -0700
Message-Id: <20241018205332.525595-4-jitendra.vegiraju@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018205332.525595-1-jitendra.vegiraju@broadcom.com>
References: <20241018205332.525595-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Cc: andrew@lunn.ch, quic_abchauha@quicinc.com, Jianheng.Zhang@synopsys.com,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, linux@armlinux.org.uk,
 joabreu@synopsys.com, bcm-kernel-feedback-list@broadcom.com,
 jitendra.vegiraju@broadcom.com, kuba@kernel.org, rohan.g.thomas@intel.com,
 pabeni@redhat.com, ahalaney@redhat.com, hawk@kernel.org,
 richardcochran@gmail.com, ast@kernel.org, rmk+kernel@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, xiaolei.wang@windriver.com,
 florian.fainelli@broadcom.com, linux-kernel@vger.kernel.org,
 fancer.lancer@gmail.com, horms@kernel.org, mcoquelin.stm32@gmail.com,
 bpf@vger.kernel.org, davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next v6 3/5] net: stmmac: Integrate
	dw25gmac into stmmac hwif handling
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

From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>

Integrate dw25gmac support into stmmac hardware interface handling.
Added a new entry to the stmmac_hw table in hwif.c.
Since BCM8958x is an early adopter device, the synopsis_id reported in HW
is 0x32 and device_id is DWXGMAC_ID. Provide override support by giving
preference to snps_id, dev_id values when initialized to non-zero
values by glue driver.

Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 88cce28b2f98..b8ee7bf20037 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -257,6 +257,27 @@ static const struct stmmac_hwif_entry {
 		.est = &dwmac510_est_ops,
 		.setup = dwxgmac2_setup,
 		.quirks = NULL,
+	}, {
+		.gmac = false,
+		.gmac4 = false,
+		.xgmac = true,
+		.min_id = DW25GMAC_CORE_4_00,
+		.dev_id = DW25GMAC_ID,
+		.regs = {
+			.ptp_off = PTP_XGMAC_OFFSET,
+			.mmc_off = MMC_XGMAC_OFFSET,
+			.est_off = EST_XGMAC_OFFSET,
+		},
+		.desc = &dwxgmac210_desc_ops,
+		.dma = &dw25gmac400_dma_ops,
+		.mac = &dwxgmac210_ops,
+		.hwtimestamp = &stmmac_ptp,
+		.mode = NULL,
+		.tc = &dwmac510_tc_ops,
+		.mmc = &dwxgmac_mmc_ops,
+		.est = &dwmac510_est_ops,
+		.setup = dw25gmac_setup,
+		.quirks = NULL,
 	}, {
 		.gmac = false,
 		.gmac4 = false,
@@ -292,7 +313,10 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 	u32 id, dev_id = 0;
 	int i, ret;
 
-	if (needs_gmac) {
+	if (priv->plat->snps_id && priv->plat->dev_id) {
+		id = priv->plat->snps_id;
+		dev_id = priv->plat->dev_id;
+	} else if (needs_gmac) {
 		id = stmmac_get_id(priv, GMAC_VERSION);
 	} else if (needs_gmac4 || needs_xgmac) {
 		id = stmmac_get_id(priv, GMAC4_VERSION);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
