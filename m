Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED01E25F6D
	for <lists+linux-stm32@lfdr.de>; Wed, 22 May 2019 10:26:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0AF3C7802D
	for <lists+linux-stm32@lfdr.de>; Wed, 22 May 2019 08:26:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39017C7802B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 08:26:18 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4M8Gjp2016707; Wed, 22 May 2019 10:25:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=95DbXIJbPEyjb+3HhxJUM/8t0wqdd7pQtBu4/qr7Suc=;
 b=EbGREjpsIjyrZeuzjob0mWdmoQyx1V90ZeDFkUVJYWBzW4r6trY/JeAB2UVddK76tWfA
 V1rLn3N2aIqoKvfym2FgaJ6Pnqf/CcUssjhLs/Wp7fWFwf4JDF7CrgnqmowLmGBFKYl2
 dXSKYqlKgvD/rAq2Ue674LGcDPKDEk5orbg5SeK129nwRMgV5Ajg8i1AK2h6yAQmVgbk
 zEbdyi/3u7eDmSwA0sBsPbEPUwz/rEpEjnWjiEMWQ/OWUZnMolPP9Hg/qfw4Adrdqjf8
 mioz04sXjFUGeZ4E9IB7NOf7KRl2lz/nvK0gu2ZepPrljD0vdib78NlVyYLlOXNMgEmZ QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7h0y2bn-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 22 May 2019 10:25:53 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1C8D34;
 Wed, 22 May 2019 08:25:52 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D9A341E83;
 Wed, 22 May 2019 08:25:51 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.44) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May
 2019 10:25:51 +0200
Received: from localhost (10.48.0.131) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Wed, 22 May 2019 10:25:51 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Fabien DESSENNE
 <fabien.dessenne@st.com>
Date: Wed, 22 May 2019 10:25:35 +0200
Message-ID: <1558513535-16736-1-git-send-email-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.48.0.131]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-22_03:, , signatures=0
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] mailbox: stm32_ipcc: add spinlock to fix
	channels concurrent access
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

Add spinlock protection on IPCC register update to avoid race condition.
Without this fix, stm32_ipcc_set_bits and stm32_ipcc_clr_bits can be
called in parallel for different channels. This results in register
corruptions.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/mailbox/stm32-ipcc.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
index f91dfb1327c7..5c2d1e1f988b 100644
--- a/drivers/mailbox/stm32-ipcc.c
+++ b/drivers/mailbox/stm32-ipcc.c
@@ -50,6 +50,7 @@ struct stm32_ipcc {
 	void __iomem *reg_base;
 	void __iomem *reg_proc;
 	struct clk *clk;
+	spinlock_t lock; /* protect access to IPCC registers */
 	int irqs[IPCC_IRQ_NUM];
 	int wkp;
 	u32 proc_id;
@@ -58,14 +59,24 @@ struct stm32_ipcc {
 	u32 xmr;
 };
 
-static inline void stm32_ipcc_set_bits(void __iomem *reg, u32 mask)
+static inline void stm32_ipcc_set_bits(spinlock_t *lock, void __iomem *reg,
+				       u32 mask)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(lock, flags);
 	writel_relaxed(readl_relaxed(reg) | mask, reg);
+	spin_unlock_irqrestore(lock, flags);
 }
 
-static inline void stm32_ipcc_clr_bits(void __iomem *reg, u32 mask)
+static inline void stm32_ipcc_clr_bits(spinlock_t *lock, void __iomem *reg,
+				       u32 mask)
 {
+	unsigned long flags;
+
+	spin_lock_irqsave(lock, flags);
 	writel_relaxed(readl_relaxed(reg) & ~mask, reg);
+	spin_unlock_irqrestore(lock, flags);
 }
 
 static irqreturn_t stm32_ipcc_rx_irq(int irq, void *data)
@@ -92,7 +103,7 @@ static irqreturn_t stm32_ipcc_rx_irq(int irq, void *data)
 
 		mbox_chan_received_data(&ipcc->controller.chans[chan], NULL);
 
-		stm32_ipcc_set_bits(ipcc->reg_proc + IPCC_XSCR,
+		stm32_ipcc_set_bits(&ipcc->lock, ipcc->reg_proc + IPCC_XSCR,
 				    RX_BIT_CHAN(chan));
 
 		ret = IRQ_HANDLED;
@@ -121,7 +132,7 @@ static irqreturn_t stm32_ipcc_tx_irq(int irq, void *data)
 		dev_dbg(dev, "%s: chan:%d tx\n", __func__, chan);
 
 		/* mask 'tx channel free' interrupt */
-		stm32_ipcc_set_bits(ipcc->reg_proc + IPCC_XMR,
+		stm32_ipcc_set_bits(&ipcc->lock, ipcc->reg_proc + IPCC_XMR,
 				    TX_BIT_CHAN(chan));
 
 		mbox_chan_txdone(&ipcc->controller.chans[chan], 0);
@@ -141,10 +152,12 @@ static int stm32_ipcc_send_data(struct mbox_chan *link, void *data)
 	dev_dbg(ipcc->controller.dev, "%s: chan:%d\n", __func__, chan);
 
 	/* set channel n occupied */
-	stm32_ipcc_set_bits(ipcc->reg_proc + IPCC_XSCR, TX_BIT_CHAN(chan));
+	stm32_ipcc_set_bits(&ipcc->lock, ipcc->reg_proc + IPCC_XSCR,
+			    TX_BIT_CHAN(chan));
 
 	/* unmask 'tx channel free' interrupt */
-	stm32_ipcc_clr_bits(ipcc->reg_proc + IPCC_XMR, TX_BIT_CHAN(chan));
+	stm32_ipcc_clr_bits(&ipcc->lock, ipcc->reg_proc + IPCC_XMR,
+			    TX_BIT_CHAN(chan));
 
 	return 0;
 }
@@ -163,7 +176,8 @@ static int stm32_ipcc_startup(struct mbox_chan *link)
 	}
 
 	/* unmask 'rx channel occupied' interrupt */
-	stm32_ipcc_clr_bits(ipcc->reg_proc + IPCC_XMR, RX_BIT_CHAN(chan));
+	stm32_ipcc_clr_bits(&ipcc->lock, ipcc->reg_proc + IPCC_XMR,
+			    RX_BIT_CHAN(chan));
 
 	return 0;
 }
@@ -175,7 +189,7 @@ static void stm32_ipcc_shutdown(struct mbox_chan *link)
 					       controller);
 
 	/* mask rx/tx interrupt */
-	stm32_ipcc_set_bits(ipcc->reg_proc + IPCC_XMR,
+	stm32_ipcc_set_bits(&ipcc->lock, ipcc->reg_proc + IPCC_XMR,
 			    RX_BIT_CHAN(chan) | TX_BIT_CHAN(chan));
 
 	clk_disable_unprepare(ipcc->clk);
@@ -208,6 +222,8 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
 	if (!ipcc)
 		return -ENOMEM;
 
+	spin_lock_init(&ipcc->lock);
+
 	/* proc_id */
 	if (of_property_read_u32(np, "st,proc-id", &ipcc->proc_id)) {
 		dev_err(dev, "Missing st,proc-id\n");
@@ -259,9 +275,10 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
 	}
 
 	/* mask and enable rx/tx irq */
-	stm32_ipcc_set_bits(ipcc->reg_proc + IPCC_XMR,
+	stm32_ipcc_set_bits(&ipcc->lock, ipcc->reg_proc + IPCC_XMR,
 			    RX_BIT_MASK | TX_BIT_MASK);
-	stm32_ipcc_set_bits(ipcc->reg_proc + IPCC_XCR, XCR_RXOIE | XCR_TXOIE);
+	stm32_ipcc_set_bits(&ipcc->lock, ipcc->reg_proc + IPCC_XCR,
+			    XCR_RXOIE | XCR_TXOIE);
 
 	/* wakeup */
 	if (of_property_read_bool(np, "wakeup-source")) {
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
