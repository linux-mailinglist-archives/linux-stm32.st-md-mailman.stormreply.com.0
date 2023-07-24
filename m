Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C4775F1BE
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jul 2023 12:01:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04A82C6B459;
	Mon, 24 Jul 2023 10:01:44 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D955C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 10:01:42 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qNsNn-00053J-UK; Mon, 24 Jul 2023 12:01:39 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qNsNk-001j38-Cg; Mon, 24 Jul 2023 12:01:36 +0200
Received: from localhost ([::1] helo=dude03.red.stw.pengutronix.de)
 by dude03.red.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qNsNj-008cdz-5s; Mon, 24 Jul 2023 12:01:35 +0200
From: Johannes Zink <j.zink@pengutronix.de>
Date: Mon, 24 Jul 2023 12:01:31 +0200
MIME-Version: 1.0
Message-Id: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAPpLvmQC/42NWwqDMBREtyL5boqJUk2/3EcRyeNWA5rITRRF3
 HujK+jfnIGZc5AAaCGQd3YQhNUG610C/siIHqTrgVqTmPCcF3nFBA1xmqTutEcEHbsrGxjlTkt
 e1VoJI5RmJM2VDEAVSqeHdOCWcUzljPC12+37tIkHG6LH/dav7Gr/MK2MMlq9ailLk4uiKJsZX
 L9E9M5uTwOkPc/zB2bDcCLaAAAA
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
X-Mailer: b4 0.12.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Johannes Zink <j.zink@pengutronix.de>, kernel test robot <lkp@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 patchwork-jzi@pengutronix.de
Subject: [Linux-stm32] [PATCH v2] net: stmmac: correct MAC propagation delay
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

The IEEE1588 Standard specifies that the timestamps of Packets must be
captured when the PTP message timestamp point (leading edge of first
octet after the start of frame delimiter) crosses the boundary between
the node and the network. As the MAC latches the timestamp at an
internal point, the captured timestamp must be corrected for the
additional path latency, as described in the publicly available
datasheet [1].

This patch only corrects for the MAC-Internal delay, which can be read
out from the MAC_Ingress_Timestamp_Latency register, since the Phy
framework currently does not support querying the Phy ingress and egress
latency. The Closs Domain Crossing Circuits errors as indicated in [1]
are already being accounted in the stmmac_get_tx_hwtstamp() function and
are not corrected here.

As the Latency varies for different link speeds and MII
modes of operation, the correction value needs to be updated on each
link state change.

As the delay also causes a phase shift in the timestamp counter compared
to the rest of the network, this correction will also reduce phase error
when generating PPS outputs from the timestamp counter.

[1] i.MX8MP Reference Manual, rev.1 Section 11.7.2.5.3 "Timestamp
correction"

Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
---
Changes in v2:
- fix builds for 32bit, this was found by the kernel build bot
	Reported-by: kernel test robot <lkp@intel.com>
	Closes: https://lore.kernel.org/oe-kbuild-all/202307200225.B8rmKQPN-lkp@intel.com/
- while at it also fix an overflow by shifting a u32 constant from macro by 10bits
  by casting the constant to u64
- Link to v1: https://lore.kernel.org/r/20230719-stmmac_correct_mac_delay-v1-1-768aa4d09334@pengutronix.de
---
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  3 ++
 .../net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c  | 43 ++++++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  4 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h   |  6 +++
 4 files changed, 56 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 6ee7cf07cfd7..95a4d6099577 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -536,6 +536,7 @@ struct stmmac_hwtimestamp {
 	void (*get_systime) (void __iomem *ioaddr, u64 *systime);
 	void (*get_ptptime)(void __iomem *ioaddr, u64 *ptp_time);
 	void (*timestamp_interrupt)(struct stmmac_priv *priv);
+	void (*correct_latency)(struct stmmac_priv *priv);
 };
 
 #define stmmac_config_hw_tstamping(__priv, __args...) \
@@ -554,6 +555,8 @@ struct stmmac_hwtimestamp {
 	stmmac_do_void_callback(__priv, ptp, get_ptptime, __args)
 #define stmmac_timestamp_interrupt(__priv, __args...) \
 	stmmac_do_void_callback(__priv, ptp, timestamp_interrupt, __args)
+#define stmmac_correct_latency(__priv, __args...) \
+	stmmac_do_void_callback(__priv, ptp, correct_latency, __args)
 
 struct stmmac_tx_queue;
 struct stmmac_rx_queue;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index fa2c3ba7e9fe..7e0fa024e0ad 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -60,6 +60,48 @@ static void config_sub_second_increment(void __iomem *ioaddr,
 		*ssinc = data;
 }
 
+static void correct_latency(struct stmmac_priv *priv)
+{
+	void __iomem *ioaddr = priv->ptpaddr;
+	u32 reg_tsic, reg_tsicsns;
+	u32 reg_tsec, reg_tsecsns;
+	u64 scaled_ns;
+	u32 val;
+
+	/* MAC-internal ingress latency */
+	scaled_ns = readl(ioaddr + PTP_TS_INGR_LAT);
+
+	/* See section 11.7.2.5.3.1 "Ingress Correction" on page 4001 of
+	 * i.MX8MP Applications Processor Reference Manual Rev. 1, 06/2021
+	 */
+	val = readl(ioaddr + PTP_TCR);
+	if (val & PTP_TCR_TSCTRLSSR)
+		/* nanoseconds field is in decimal format with granularity of 1ns/bit */
+		scaled_ns = ((u64)NSEC_PER_SEC << 16) - scaled_ns;
+	else
+		/* nanoseconds field is in binary format with granularity of ~0.466ns/bit */
+		scaled_ns = ((1ULL << 31) << 16) -
+			DIV_U64_ROUND_CLOSEST(scaled_ns * PSEC_PER_NSEC, 466U);
+
+	reg_tsic = scaled_ns >> 16;
+	reg_tsicsns = scaled_ns & 0xff00;
+
+	/* set bit 31 for 2's compliment */
+	reg_tsic |= BIT(31);
+
+	writel(reg_tsic, ioaddr + PTP_TS_INGR_CORR_NS);
+	writel(reg_tsicsns, ioaddr + PTP_TS_INGR_CORR_SNS);
+
+	/* MAC-internal egress latency */
+	scaled_ns = readl(ioaddr + PTP_TS_EGR_LAT);
+
+	reg_tsec = scaled_ns >> 16;
+	reg_tsecsns = scaled_ns & 0xff00;
+
+	writel(reg_tsec, ioaddr + PTP_TS_EGR_CORR_NS);
+	writel(reg_tsecsns, ioaddr + PTP_TS_EGR_CORR_SNS);
+}
+
 static int init_systime(void __iomem *ioaddr, u32 sec, u32 nsec)
 {
 	u32 value;
@@ -221,4 +263,5 @@ const struct stmmac_hwtimestamp stmmac_ptp = {
 	.get_systime = get_systime,
 	.get_ptptime = get_ptptime,
 	.timestamp_interrupt = timestamp_interrupt,
+	.correct_latency = correct_latency,
 };
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index efe85b086abe..ee78e69e9ae3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -909,6 +909,8 @@ static int stmmac_init_ptp(struct stmmac_priv *priv)
 	priv->hwts_tx_en = 0;
 	priv->hwts_rx_en = 0;
 
+	stmmac_correct_latency(priv, priv);
+
 	return 0;
 }
 
@@ -1094,6 +1096,8 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 
 	if (priv->dma_cap.fpesel)
 		stmmac_fpe_link_state_handle(priv, true);
+
+	stmmac_correct_latency(priv, priv);
 }
 
 static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
index bf619295d079..d1fe4b46f162 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
@@ -26,6 +26,12 @@
 #define	PTP_ACR		0x40	/* Auxiliary Control Reg */
 #define	PTP_ATNR	0x48	/* Auxiliary Timestamp - Nanoseconds Reg */
 #define	PTP_ATSR	0x4c	/* Auxiliary Timestamp - Seconds Reg */
+#define	PTP_TS_INGR_CORR_NS	0x58	/* Ingress timestamp correction nanoseconds */
+#define	PTP_TS_EGR_CORR_NS	0x5C	/* Egress timestamp correction nanoseconds*/
+#define	PTP_TS_INGR_CORR_SNS	0x60	/* Ingress timestamp correction subnanoseconds */
+#define	PTP_TS_EGR_CORR_SNS	0x64	/* Egress timestamp correction subnanoseconds */
+#define	PTP_TS_INGR_LAT	0x68	/* MAC internal Ingress Latency */
+#define	PTP_TS_EGR_LAT	0x6c	/* MAC internal Egress Latency */
 
 #define	PTP_STNSUR_ADDSUB_SHIFT	31
 #define	PTP_DIGITAL_ROLLOVER_MODE	0x3B9ACA00	/* 10e9-1 ns */

---
base-commit: ba80e20d7f3f87dab3f9f0c0ca66e4b1fcc7be9f
change-id: 20230719-stmmac_correct_mac_delay-4278cb9d9bc1

Best regards,
-- 
Johannes Zink <j.zink@pengutronix.de>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
