Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7F831089A
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Feb 2021 10:59:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 240ADC57B64;
	Fri,  5 Feb 2021 09:59:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3507CC57B52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 08:52:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1158oefC025978; Fri, 5 Feb 2021 09:52:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=/+/I6SdY03bQilvtIFB1iL7I596ZdcVprRvr7qjZX/k=;
 b=jQFcvl119/OGc7mx8mJn9Yn9mDktE0XxCKY+JWOLhcRUecK2AKXQyn6ssHlRIub0PxW0
 JoDn4P/G2kRFaIzbpPXwiT3KaP3b3bzh75UwIOUMeEow896c6WB5cx0nFoGHHEM+Ymia
 pg4TkDN1RhBbYWFCHZFLQ2p00YZ/UIyJZ4gA/SIviBHK/fHda15h9JAzS/xkw3diX2ik
 IrJrvP3Ey8hY0ZTCOudEst9z/5zYl8yCDT64cirjXkZHJCKmot1fZbN+Ua1xgZ4uY6mN
 Gm17vYjReh5DLx3NLXv5uOaXgB9vRc34IEO/IO6oCdIwV5l7/I+Fm+JusHOoW1n/MkMd cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36ey7hev28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 09:52:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7AE1F100034;
 Fri,  5 Feb 2021 09:52:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 691E2221793;
 Fri,  5 Feb 2021 09:52:06 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 09:52:06
 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <robh+dt@kernel.org>
Date: Fri, 5 Feb 2021 09:51:40 +0100
Message-ID: <1612515104-838-2-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_06:2021-02-05,
 2021-02-05 signatures=0
X-Mailman-Approved-At: Fri, 05 Feb 2021 09:59:37 +0000
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 pierre-yves.mordret@foss.st.com, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, alain.volmat@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/5] i2c: stm32f7: fix configuration of the
	digital filter
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

The digital filter related computation are present in the driver
however the programming of the filter within the IP is missing.
The maximum value for the DNF is wrong and should be 15 instead of 16.

Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 9aa8e65b511e..473fbe144b7e 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -57,6 +57,8 @@
 #define STM32F7_I2C_CR1_RXDMAEN			BIT(15)
 #define STM32F7_I2C_CR1_TXDMAEN			BIT(14)
 #define STM32F7_I2C_CR1_ANFOFF			BIT(12)
+#define STM32F7_I2C_CR1_DNF_MASK		GENMASK(11, 8)
+#define STM32F7_I2C_CR1_DNF(n)			(((n) & 0xf) << 8)
 #define STM32F7_I2C_CR1_ERRIE			BIT(7)
 #define STM32F7_I2C_CR1_TCIE			BIT(6)
 #define STM32F7_I2C_CR1_STOPIE			BIT(5)
@@ -160,7 +162,7 @@ enum {
 };
 
 #define STM32F7_I2C_DNF_DEFAULT			0
-#define STM32F7_I2C_DNF_MAX			16
+#define STM32F7_I2C_DNF_MAX			15
 
 #define STM32F7_I2C_ANALOG_FILTER_ENABLE	1
 #define STM32F7_I2C_ANALOG_FILTER_DELAY_MIN	50	/* ns */
@@ -725,6 +727,13 @@ static void stm32f7_i2c_hw_config(struct stm32f7_i2c_dev *i2c_dev)
 	else
 		stm32f7_i2c_set_bits(i2c_dev->base + STM32F7_I2C_CR1,
 				     STM32F7_I2C_CR1_ANFOFF);
+
+	/* Program the Digital Filter */
+	stm32f7_i2c_clr_bits(i2c_dev->base + STM32F7_I2C_CR1,
+			     STM32F7_I2C_CR1_DNF_MASK);
+	stm32f7_i2c_set_bits(i2c_dev->base + STM32F7_I2C_CR1,
+			     STM32F7_I2C_CR1_DNF(i2c_dev->setup.dnf));
+
 	stm32f7_i2c_set_bits(i2c_dev->base + STM32F7_I2C_CR1,
 			     STM32F7_I2C_CR1_PE);
 }
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
