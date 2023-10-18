Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D837CD53F
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Oct 2023 09:10:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE4E8C6C83F;
	Wed, 18 Oct 2023 07:10:28 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DEC5C6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Oct 2023 07:10:28 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qt0h1-0007Ys-S7; Wed, 18 Oct 2023 09:10:11 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qt0gz-002V9a-3a; Wed, 18 Oct 2023 09:10:09 +0200
Received: from localhost ([::1] helo=dude03.red.stw.pengutronix.de)
 by dude03.red.stw.pengutronix.de with esmtp (Exim 4.96)
 (envelope-from <j.zink@pengutronix.de>) id 1qt0gz-003JoA-03;
 Wed, 18 Oct 2023 09:10:09 +0200
From: Johannes Zink <j.zink@pengutronix.de>
Date: Wed, 18 Oct 2023 09:09:54 +0200
MIME-Version: 1.0
Message-Id: <20231010-stmmac_fix_auxiliary_event_capture-v2-2-51d5f56542d7@pengutronix.de>
References: <20231010-stmmac_fix_auxiliary_event_capture-v2-0-51d5f56542d7@pengutronix.de>
In-Reply-To: <20231010-stmmac_fix_auxiliary_event_capture-v2-0-51d5f56542d7@pengutronix.de>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Kurt Kanzenbach <kurt@linutronix.de>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Johannes Zink <j.zink@pengutronix.de>, vee.khee.wong@linux.intel.com,
 horms@kernel.org, bartosz.golaszewski@linaro.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk,
 kernel@pengutronix.de, tee.min.tan@intel.com, ahalaney@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 patchwork-jzi@pengutronix.de
Subject: [Linux-stm32] [PATCH net-next v2 2/5] net: stmmac: use correct PPS
 capture input index
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

The stmmac supports up to 4 auxiliary snapshots that can be enabled by
setting the appropriate bits in the PTP_ACR bitfield.

Previously as of commit f4da56529da6 ("net: stmmac: Add support for
external trigger timestamping") instead of setting the bits, a fixed
value was written to this bitfield instead of passing the appropriate
bitmask.

Now the correct bit is set according to the ptp_clock_request.extts_index
passed as a parameter to stmmac_enable().

Signed-off-by: Johannes Zink <j.zink@pengutronix.de>

---

Changelog:

v1 > v2: no functional changes. reword commit message and remove fixes-tag
as discussed with Simon and Jakub. Thanks to both for reviewing my patches!
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 5 ++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index f110b91af9bd..300e673d2a36 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -201,12 +201,11 @@ static int stmmac_enable(struct ptp_clock_info *ptp,
 		acr_value &= ~PTP_ACR_MASK;
 		if (on) {
 			/* Enable External snapshot trigger */
-			acr_value |= priv->plat->ext_snapshot_num;
+			acr_value |= PTP_ACR_ATSEN(rq->extts.index);
 			acr_value |= PTP_ACR_ATSFC;
 		}
 		netdev_dbg(priv->dev, "Auxiliary Snapshot %d %s.\n",
-			   priv->plat->ext_snapshot_num >> PTP_ACR_ATSEN_SHIFT,
-			   on ? "enabled" : "disabled");
+			   rq->extts.index, on ? "enabled" : "disabled");
 		writel(acr_value, ptpaddr + PTP_ACR);
 		mutex_unlock(&priv->aux_ts_lock);
 		/* wait for auxts fifo clear to finish */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
index d1fe4b46f162..fce3fba2ffd2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
@@ -79,7 +79,7 @@
 #define	PTP_ACR_ATSEN1		BIT(5)	/* Auxiliary Snapshot 1 Enable */
 #define	PTP_ACR_ATSEN2		BIT(6)	/* Auxiliary Snapshot 2 Enable */
 #define	PTP_ACR_ATSEN3		BIT(7)	/* Auxiliary Snapshot 3 Enable */
-#define	PTP_ACR_ATSEN_SHIFT	5	/* Auxiliary Snapshot shift */
+#define	PTP_ACR_ATSEN(index)	(PTP_ACR_ATSEN0 << (index))
 #define	PTP_ACR_MASK		GENMASK(7, 4)	/* Aux Snapshot Mask */
 #define	PMC_ART_VALUE0		0x01	/* PMC_ART[15:0] timer value */
 #define	PMC_ART_VALUE1		0x02	/* PMC_ART[31:16] timer value */

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
