Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0477C2F42
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Oct 2019 10:51:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C005C36B0B;
	Tue,  1 Oct 2019 08:51:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 111C6C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2019 08:51:49 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x918aqa3032721; Tue, 1 Oct 2019 10:51:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=pHr2o+ZAoiEIH4WNUEwd9qYwlYMRQA1EuZfFQPwwXFA=;
 b=ceANKyQriGj7GYQEv1c9rHo45HNQobCG6YZP3AMFOBN4o92ul8CSv0d45ZdJFwOxI4cY
 JV3RL1c5NH45gyU3xjew5P1QGeL9kZa1O0MgDEkLw5TON/KZKyu/xA8ssDScji3uyjGy
 jwP/z7AUu+dDYvkJjxw2y30rg4l9UyQ30b2iG3/S9lVbfkWm6X7r93V9NmgskjhCkwkG
 P3h4drbVxw9czQUNqxQmnBdKX+Wc4pAHIKCd3EvyXY6A1K9C+3CnjWc+IuL1aaWoZAW8
 6I2Mf+siPsU53Fu4w/dtbXOmaM+W2HtLW5Df1K+UG2ZiYPo8wpRcOCGrPsRBvjHVf6Ag sQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v9xdgqmf4-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 01 Oct 2019 10:51:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6063523;
 Tue,  1 Oct 2019 08:51:40 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B97C42B2FF9;
 Tue,  1 Oct 2019 10:51:39 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.92) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 1 Oct 2019
 10:51:39 +0200
Received: from localhost (10.48.0.192) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Tue, 1 Oct 2019 10:51:39 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <wsa@the-dreams.de>, <pierre-yves.mordret@st.com>
Date: Tue, 1 Oct 2019 10:51:09 +0200
Message-ID: <1569919869-3218-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.48.0.192]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-01_04:2019-10-01,2019-10-01 signatures=0
Cc: linux-kernel@vger.kernel.org, alain.volmat@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] i2c: i2c-stm32f7: fix a race in slave mode
	with arbitration loss irq
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

When in slave mode, an arbitration loss (ARLO) may be detected before the
slave had a chance to detect the stop condition (STOPF in ISR).
This is seen when two master + slave adapters switch their roles. It
provokes the i2c bus to be stuck, busy as SCL line is stretched.
- the I2C_SLAVE_STOP event is never generated due to STOPF flag is set but
  don't generate an irq (race with ARLO irq, STOPIE is masked). STOPF flag
  remains set until next master xfer (e.g. when STOPIE irq get unmasked).
  In this case, completion is generated too early: immediately upon new
  transfer request (then it doesn't send all data).
- Some data get stuck in TXDR register. As a consequence, the controller
  stretches the SCL line: the bus gets busy until a future master transfer
  triggers the bus busy / recovery mechanism (this can take time... and
  may never happen at all)

So choice is to let the STOPF being detected by the slave isr handler,
to properly handle this stop condition. E.g. don't mask IRQs in error
handler, when the slave is running.

Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 266d1c2..3a8ab0c 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1501,7 +1501,7 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
 	void __iomem *base = i2c_dev->base;
 	struct device *dev = i2c_dev->dev;
 	struct stm32_i2c_dma *dma = i2c_dev->dma;
-	u32 mask, status;
+	u32 status;
 
 	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
 
@@ -1526,12 +1526,15 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
 		f7_msg->result = -EINVAL;
 	}
 
-	/* Disable interrupts */
-	if (stm32f7_i2c_is_slave_registered(i2c_dev))
-		mask = STM32F7_I2C_XFER_IRQ_MASK;
-	else
-		mask = STM32F7_I2C_ALL_IRQ_MASK;
-	stm32f7_i2c_disable_irq(i2c_dev, mask);
+	if (!i2c_dev->slave_running) {
+		u32 mask;
+		/* Disable interrupts */
+		if (stm32f7_i2c_is_slave_registered(i2c_dev))
+			mask = STM32F7_I2C_XFER_IRQ_MASK;
+		else
+			mask = STM32F7_I2C_ALL_IRQ_MASK;
+		stm32f7_i2c_disable_irq(i2c_dev, mask);
+	}
 
 	/* Disable dma */
 	if (i2c_dev->use_dma) {
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
