Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A0B3B84CC
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jun 2021 16:13:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F927C597AA;
	Wed, 30 Jun 2021 14:13:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F456C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jun 2021 14:13:10 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UEAY0h002860; Wed, 30 Jun 2021 16:12:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=2vk0SM1w1rYwBoKsGyRqoKEvl040SvG0KTlIbUrKgsc=;
 b=Z1d9v2V2HDrqhk0MZUnAz3mbRajKOrOhUStToRb4SFG4plLLFkABzrzbvm3vF6p2ZJkQ
 8mAL1QZXGXVJerZ4E94/hRGdgTANjyqGNo1RgAfvE+24aa92S3mMwmuTizzuiIcXAttR
 Q2zBtFHhBxr1OliAftxJELttwA7le6qd6X/vNKKoww+qhcHkChQXm8FX2ldCrORgh8l1
 nJiW3SRWXnHeZThK3CD184V/9oQNUwSnCeeFpye+x+HmhpoPJ951VWP+fQ/RPFmcSFHu
 cngiVrGseXFTM0rryX7Y7yi2sHLNmdoPama/w4SJaeuSZve1zKvxtJtVhB3AVMMIgU5l Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39g4kpy7f2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 16:12:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF43810003A;
 Wed, 30 Jun 2021 16:12:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E465F23151D;
 Wed, 30 Jun 2021 16:12:57 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 30 Jun 2021 16:12:57
 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
Date: Wed, 30 Jun 2021 16:11:43 +0200
Message-ID: <1625062303-15327-4-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
References: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_06:2021-06-29,
 2021-06-30 signatures=0
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, alain.volmat@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/3] i2c: stm32f7: prevent calling slave
	handling if no slave running
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

Slave interrupt handler should only be called if there is actually
a slave registered and running to avoid accessing an invalid pointer.

Without this commit, an OOPS can be generated due to a NULL ptr dereference
while receiving an IT when there is no master transfer and no slave
running:
  - stm32f7_i2c_isr_event
  - no master_mode hence calling stm32f7_i2c_slave_isr_event
  - access to i2c_dev->slave_running leading to oops due to
slave_running being NULL.

Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 0d99c075deb2..2cc9bb0f6d7f 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1497,10 +1497,14 @@ static irqreturn_t stm32f7_i2c_isr_event(int irq, void *data)
 	u32 status, mask;
 	int ret = IRQ_HANDLED;
 
-	/* Check if the interrupt if for a slave device */
+	/* Check if the interrupt is for a slave device */
 	if (!i2c_dev->master_mode) {
-		ret = stm32f7_i2c_slave_isr_event(i2c_dev);
-		return ret;
+		if (i2c_dev->slave_running)
+			return stm32f7_i2c_slave_isr_event(i2c_dev);
+
+		dev_warn_ratelimited(i2c_dev->dev,
+				"Unexpected IT received: ISR:0x%x\n",
+				readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR));
 	}
 
 	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
