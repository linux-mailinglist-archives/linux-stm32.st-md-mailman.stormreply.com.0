Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EC6411810
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Sep 2021 17:22:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AAB1C5A4D1;
	Mon, 20 Sep 2021 15:22:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 543E6C5A4CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Sep 2021 15:21:58 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18K8jYXi030008; 
 Mon, 20 Sep 2021 17:21:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=lKK7tW0dd7BDh9Hbo0KoKkJC0ZxJv8/xpKW54tXqj/Q=;
 b=lSCcqbEgGml1CoPg0Yo5dR8cHHDISDpzi+spWIJGJW2UGSRfvh4x4AZbTXzh2FBg9JEK
 jyD5nTam+vloYK/vKwwiIoeeRKdO3Oa7sGk566bQUYfgQLBogo3jbBhm1E4ePb8xGUlO
 Ge7YodYFA3Ad3Sqv5LDshNELC7skPXjQihJOEWdzi+XH+KiX+j848qqFBuA/NJ9CVkJV
 cx16EdCCMxthJ36nI/aIMOwFk27h2sw3R1WCGq24Y7gsloqc/+NE6VFvw1UjaszFkVDf
 v4y3yJhd1avfa+LyUhBVQdAmCubM+2ZpTY+7qX5zmzhqHlvxPU7nQcEyWLMAB5ts879u Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b6q2shv60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 17:21:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF0CB100039;
 Mon, 20 Sep 2021 17:21:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D696222F7B7;
 Mon, 20 Sep 2021 17:21:46 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep 2021 17:21:46
 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
Date: Mon, 20 Sep 2021 17:21:31 +0200
Message-ID: <1632151292-18503-4-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, alain.volmat@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/4] i2c: stm32f7: stop dma transfer in case
	of NACK
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

In case of receiving a NACK, the dma transfer should be stopped
to avoid feeding data into the FIFO.
Also ensure to properly return the proper error code and avoid
waiting for the end of the dma completion in case of
error happening during the transmission.

Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index ad3459a3bc5e..50d5ae81d227 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1493,6 +1493,7 @@ static irqreturn_t stm32f7_i2c_isr_event(int irq, void *data)
 {
 	struct stm32f7_i2c_dev *i2c_dev = data;
 	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
+	struct stm32_i2c_dma *dma = i2c_dev->dma;
 	void __iomem *base = i2c_dev->base;
 	u32 status, mask;
 	int ret = IRQ_HANDLED;
@@ -1518,6 +1519,10 @@ static irqreturn_t stm32f7_i2c_isr_event(int irq, void *data)
 		dev_dbg(i2c_dev->dev, "<%s>: Receive NACK (addr %x)\n",
 			__func__, f7_msg->addr);
 		writel_relaxed(STM32F7_I2C_ICR_NACKCF, base + STM32F7_I2C_ICR);
+		if (i2c_dev->use_dma) {
+			stm32f7_i2c_disable_dma_req(i2c_dev);
+			dmaengine_terminate_all(dma->chan_using);
+		}
 		f7_msg->result = -ENXIO;
 	}
 
@@ -1533,7 +1538,7 @@ static irqreturn_t stm32f7_i2c_isr_event(int irq, void *data)
 		/* Clear STOP flag */
 		writel_relaxed(STM32F7_I2C_ICR_STOPCF, base + STM32F7_I2C_ICR);
 
-		if (i2c_dev->use_dma) {
+		if (i2c_dev->use_dma && !f7_msg->result) {
 			ret = IRQ_WAKE_THREAD;
 		} else {
 			i2c_dev->master_mode = false;
@@ -1546,7 +1551,7 @@ static irqreturn_t stm32f7_i2c_isr_event(int irq, void *data)
 		if (f7_msg->stop) {
 			mask = STM32F7_I2C_CR2_STOP;
 			stm32f7_i2c_set_bits(base + STM32F7_I2C_CR2, mask);
-		} else if (i2c_dev->use_dma) {
+		} else if (i2c_dev->use_dma && !f7_msg->result) {
 			ret = IRQ_WAKE_THREAD;
 		} else if (f7_msg->smbus) {
 			stm32f7_i2c_smbus_rep_start(i2c_dev);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
