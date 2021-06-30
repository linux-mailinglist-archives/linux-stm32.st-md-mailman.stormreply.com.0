Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7690D3B84CA
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jun 2021 16:13:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FF6BC57B7D;
	Wed, 30 Jun 2021 14:13:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B67BDC56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jun 2021 14:13:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UEClFe019668; Wed, 30 Jun 2021 16:12:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=vwmnhmTHKfjU0Z6OnQKzznj0YzS9IAT39KjKpR8LzIE=;
 b=WYTNDmsfCzL/d7MHJKqishFkpACc0qMLpR2ZaXvqw2vMsyNoNfW7LrCsBzEJScTPmqie
 wjx/rLtgq9xTWyi58xMp7RJZ1GzFEaHyYl+8TCmrZXB9CZfqQZAPwPM9Tzo2p21Jsb5V
 pbvqx+Pg7louPI2JzsI0Z5uwsPKisbE4ayw1M8mwQKIt1vo098h0qFO2Wow1sNoujCHj
 NRpngEOr1XHAjBOZnjnh0ltokYKV98icUHRT6UiFJcGuAjg2ytlpVX17DmENYM2SrQL5
 IHXHvPs4ZR0UhCTlsPdxk3Whr2pYCvSEs6e3AX0xiF/jGT76QxbeWFIuothuyJBQwQWU hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39gnbpjpf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 16:12:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 88C93100039;
 Wed, 30 Jun 2021 16:12:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7B22923151F;
 Wed, 30 Jun 2021 16:12:57 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 30 Jun 2021 16:12:56
 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
Date: Wed, 30 Jun 2021 16:11:42 +0200
Message-ID: <1625062303-15327-3-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
References: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_06:2021-06-29,
 2021-06-30 signatures=0
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, alain.volmat@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/3] i2c: stm32f7: flush TX FIFO upon transfer
	errors
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

While handling an error during transfer (ex: NACK), it could
happen that the driver has already written data into the TX Fifo
before the transfer get stopped.
This commit add FIFO Flush after end of transfer in case of error to
avoid sending a wrong data on any other slave upon next transfer.

Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index d596733136c3..0d99c075deb2 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1696,6 +1696,15 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
 	time_left = wait_for_completion_timeout(&i2c_dev->complete,
 						i2c_dev->adap.timeout);
 	ret = f7_msg->result;
+	if (ret) {
+		/*
+		 * It is possible that some unsent data have already been
+		 * written in the TX Fifo. To avoid sending old data in a
+		 * further transfer, flush FIFO in case of any error
+		 */
+		writel_relaxed(STM32F7_I2C_ISR_TXE,
+			       i2c_dev->base + STM32F7_I2C_ISR);
+	}
 
 	if (!time_left) {
 		dev_dbg(i2c_dev->dev, "Access to slave 0x%x timed out\n",
@@ -1745,8 +1754,16 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 	timeout = wait_for_completion_timeout(&i2c_dev->complete,
 					      i2c_dev->adap.timeout);
 	ret = f7_msg->result;
-	if (ret)
+	if (ret) {
+		/*
+		 * It is possible that some unsent data have already been
+		 * written in the TX Fifo. To avoid sending old data in a
+		 * further transfer, flush FIFO in case of any error
+		 */
+		writel_relaxed(STM32F7_I2C_ISR_TXE,
+			       i2c_dev->base + STM32F7_I2C_ISR);
 		goto pm_free;
+	}
 
 	if (!timeout) {
 		dev_dbg(dev, "Access to slave 0x%x timed out\n", f7_msg->addr);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
