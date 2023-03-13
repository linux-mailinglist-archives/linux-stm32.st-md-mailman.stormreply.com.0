Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F12C56B84F8
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 23:42:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5BAAC6A60F;
	Mon, 13 Mar 2023 22:42:59 +0000 (UTC)
Received: from post.baikalelectronics.com (post.baikalelectronics.com
 [213.79.110.86])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7CE1C6A610
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 22:42:57 +0000 (UTC)
Received: from post.baikalelectronics.com (localhost.localdomain [127.0.0.1])
 by post.baikalelectronics.com (Proxmox) with ESMTP id 601ECE0EBF;
 Tue, 14 Mar 2023 01:42:57 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 baikalelectronics.ru; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:from:from:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=post;
 bh=c91xgDA+xxkJQX7Ffet0DRolPx3vpd9nRj5buf/A0EU=; b=Ju2Ta6H/2Nh8
 ijhmSvQmf0bjzvuSQmkhT7zEcVMJ7cOaScu7vLX19ALicrfdoaBXrKRgsECsc7fM
 2JvJMbjcFw1yA6V7TMuPCvAcKDa5TNm7Eg/dR7bwWcyKu4vDEt45nX9/8x8K5biL
 xyQ881AlqgzhLXDriOpxPbOT2ACC9Hs=
Received: from mail.baikal.int (mail.baikal.int [192.168.51.25])
 by post.baikalelectronics.com (Proxmox) with ESMTP id 45D14E0EBB;
 Tue, 14 Mar 2023 01:42:57 +0300 (MSK)
Received: from localhost (10.8.30.10) by mail (192.168.51.25) with Microsoft
 SMTP Server (TLS) id 15.0.1395.4; Tue, 14 Mar 2023 01:42:56 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew
 Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Ong Boon Leong
 <boon.leong.ong@intel.com>, Voon Weifeng <weifeng.voon@intel.com>, Wong Vee
 Khee <vee.khee.wong@linux.intel.com>, Tan Tee Min <tee.min.tan@intel.com>,
 Richard Cochran <richardcochran@gmail.com>
Date: Tue, 14 Mar 2023 01:42:36 +0300
Message-ID: <20230313224237.28757-13-Sergey.Semin@baikalelectronics.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313224237.28757-1-Sergey.Semin@baikalelectronics.ru>
References: <20230313224237.28757-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-Originating-IP: [10.8.30.10]
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 12/13] net: stmmac: Stop overriding the
	PTP clock info static instance
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

It had been defined as constant before commit 9a8a02c9d46d ("net: stmmac:
Add Flexible PPS support"). But then it was converted to be just static,
which fields may get to be modified on each stmmac_ptp_register()
invocation. Since that method is called from the driver probe method, a
concurrent DW *MAC NIC initialization causes the race condition for the
updated stmmac_ptp_clock_ops fields. That also may lead to setting an
inappropriate max_adj value, which was specific for one device, was
written to the stmmac_ptp_clock_ops, but then copied to the private
ptp_clock_info instance unmodified.

So to speak let's leave the stmmac_ptp_clock_ops content untouched and
just copy it to the device-specific instance of the ptp_clock_info
structure, which fields could be then accordingly modified. After that we
can get the const qualifier back to the stmmac_ptp_clock_ops instance
definition.

While at it remove pointless zero-initialization of the
stmmac_ptp_clock_ops fields. It's redundant since the structure is static.

Fixes: 9a8a02c9d46d ("net: stmmac: Add Flexible PPS support")
Fixes: 190f73ab4c43 ("net: stmmac: setup higher frequency clk support for EHL & TGL")
Fixes: f4da56529da6 ("net: stmmac: Add support for external trigger timestamping")
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index b4388ca8d211..19a28b1cc272 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -254,15 +254,10 @@ static int stmmac_getcrosststamp(struct ptp_clock_info *ptp,
 }
 
 /* structure describing a PTP hardware clock */
-static struct ptp_clock_info stmmac_ptp_clock_ops = {
+static const struct ptp_clock_info stmmac_ptp_clock_ops = {
 	.owner = THIS_MODULE,
 	.name = "stmmac ptp",
 	.max_adj = 62500000,
-	.n_alarm = 0,
-	.n_ext_ts = 0, /* will be overwritten in stmmac_ptp_register */
-	.n_per_out = 0, /* will be overwritten in stmmac_ptp_register */
-	.n_pins = 0,
-	.pps = 0,
 	.adjfine = stmmac_adjust_freq,
 	.adjtime = stmmac_adjust_time,
 	.gettime64 = stmmac_get_time,
@@ -287,21 +282,21 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
 		priv->pps[i].available = true;
 	}
 
-	if (priv->plat->ptp_max_adj)
-		stmmac_ptp_clock_ops.max_adj = priv->plat->ptp_max_adj;
-
 	/* Calculate the clock domain crossing (CDC) error if necessary */
 	priv->plat->cdc_error_adj = 0;
 	if (priv->plat->has_gmac4 && priv->plat->clk_ptp_rate)
 		priv->plat->cdc_error_adj = (2 * NSEC_PER_SEC) / priv->plat->clk_ptp_rate;
 
-	stmmac_ptp_clock_ops.n_per_out = priv->dma_cap.pps_out_num;
-	stmmac_ptp_clock_ops.n_ext_ts = priv->dma_cap.aux_snapshot_n;
-
 	rwlock_init(&priv->ptp_lock);
 	mutex_init(&priv->aux_ts_lock);
 	priv->ptp_clock_ops = stmmac_ptp_clock_ops;
 
+	if (priv->plat->ptp_max_adj)
+		priv->ptp_clock_ops.max_adj = priv->plat->ptp_max_adj;
+
+	priv->ptp_clock_ops.n_per_out = priv->dma_cap.pps_out_num;
+	priv->ptp_clock_ops.n_ext_ts = priv->dma_cap.aux_snapshot_n;
+
 	priv->ptp_clock = ptp_clock_register(&priv->ptp_clock_ops,
 					     priv->device);
 	if (IS_ERR(priv->ptp_clock)) {
-- 
2.39.2


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
