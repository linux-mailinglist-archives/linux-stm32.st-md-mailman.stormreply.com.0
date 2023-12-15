Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5E8814DFC
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Dec 2023 18:10:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21E57C6DD6E;
	Fri, 15 Dec 2023 17:10:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD840C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 17:10:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BFEjwiY006704; Fri, 15 Dec 2023 18:09:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=h//24ShO+UNY5lEks7GrfLoqCWGD61Zp6S+CD5MoPjM=; b=AB
 +bOzaaZq8cDntJhFrKvJHJNPXG1tkwzCc2RUti5KeNy1bdECtNEH4n0cx1VTR8S5
 O+9cnkqwJA8ak+nwWVWx4bImqSB30RghxL5/L3WfPLx1S1mXiopvqgWTxXzvwpsj
 KjqPJ2eu6pj0ghjHsG6IkjHGE5eRWXb1zr6+d/0T6HoqhXNk8aBN7u/ILgxh0dfk
 yUkFWCIA03kmCBP6swhdFjFdwQjM/E7a794pKxSUpUq0xUQ0z7Q2NWB209ygIx6x
 NeKTVeT6z/xhjI0m1xcX9HOQDe91XR9gE5KUYmmjLKN8PL8BGwgfn+1p0tyqz7Cw
 YxpNLfP9Aaz3VQtTkCNA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvg0hagnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Dec 2023 18:09:52 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 96666100052;
 Fri, 15 Dec 2023 18:09:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B995216840;
 Fri, 15 Dec 2023 18:09:51 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 18:09:51 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Pierre-Yves MORDRET
 <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 15 Dec 2023 18:06:09 +0100
Message-ID: <20231215170617.95868-6-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231215170617.95868-1-alain.volmat@foss.st.com>
References: <20231215170617.95868-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_10,2023-12-14_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 5/9] i2c: stm32f7: perform I2C_ISR read
	once at beginning of event isr
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

Move readl_relaxed of I2C_ISR register at beginning of event isr
so that it done once for both master & slave handling.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 15100fed0a3f..f7abf6d3a7b9 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1419,15 +1419,13 @@ static bool stm32f7_i2c_is_slave_busy(struct stm32f7_i2c_dev *i2c_dev)
 	return i == busy;
 }
 
-static irqreturn_t stm32f7_i2c_slave_isr_event(struct stm32f7_i2c_dev *i2c_dev)
+static irqreturn_t stm32f7_i2c_slave_isr_event(struct stm32f7_i2c_dev *i2c_dev, u32 status)
 {
 	void __iomem *base = i2c_dev->base;
-	u32 cr2, status, mask;
+	u32 cr2, mask;
 	u8 val;
 	int ret;
 
-	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
-
 	/* Slave transmitter mode */
 	if (status & STM32F7_I2C_ISR_TXIS) {
 		i2c_slave_event(i2c_dev->slave_running,
@@ -1531,11 +1529,11 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
 	u32 status, mask;
 	int ret;
 
-	if (!i2c_dev->master_mode)
-		return stm32f7_i2c_slave_isr_event(i2c_dev);
-
 	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
 
+	if (!i2c_dev->master_mode)
+		return stm32f7_i2c_slave_isr_event(i2c_dev, status);
+
 	/* NACK received */
 	if (status & STM32F7_I2C_ISR_NACKF) {
 		dev_dbg(i2c_dev->dev, "<%s>: Receive NACK (addr %x)\n",
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
