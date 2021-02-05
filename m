Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F84310895
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Feb 2021 10:59:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF266C57B53;
	Fri,  5 Feb 2021 09:59:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88624C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 08:52:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1158l0lb007605; Fri, 5 Feb 2021 09:52:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=4sjVcBAIu91kgQQb9qupZQJrGYub/iUnq2yqTtTWMWQ=;
 b=Q4TW0scoETZOrOYSNw0uI0QK1tb5xie9JqPnEcwBDHtTcQkfXUyf7RYYLBDI8J9fUWTX
 DV3whN9VjVqwxFWJCvo/AjvJJQ5l/p8fZNV/mJkq5eSE/Ff3Rd9nyLmHGchCnzJ4yEvX
 oVfDQPnIqSvZo26TIhU0krhUzQxepI9xAxwgP77upiVNcNRVrpq5JrQZ8MmFt6T0LDwr
 qtTkkcMkqrkUtBIuihPJ3cFmuLIL5f/8yw0A45Rm/f3ni4Q4ZGmF5ndzXDE7q/N/zze7
 SihvTaBA10wQsGJUAfl7Ddp8qXFLd8GRVTCtQap7Tvkkf4cbk1qEzOhp36gO5RfFGJnB Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36d0nse4kg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 09:52:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D4B09100038;
 Fri,  5 Feb 2021 09:52:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C794D221793;
 Fri,  5 Feb 2021 09:52:06 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 09:52:06
 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <robh+dt@kernel.org>
Date: Fri, 5 Feb 2021 09:51:41 +0100
Message-ID: <1612515104-838-3-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
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
Subject: [Linux-stm32] [PATCH 2/5] i2c: stm32f7: support DT binding
	i2c-analog-filter
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

Replace driver internally coded enabling/disabling of the
analog-filter with the DT binding "i2c-analog-filter".

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 473fbe144b7e..0c539fea2754 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -164,7 +164,6 @@ enum {
 #define STM32F7_I2C_DNF_DEFAULT			0
 #define STM32F7_I2C_DNF_MAX			15
 
-#define STM32F7_I2C_ANALOG_FILTER_ENABLE	1
 #define STM32F7_I2C_ANALOG_FILTER_DELAY_MIN	50	/* ns */
 #define STM32F7_I2C_ANALOG_FILTER_DELAY_MAX	260	/* ns */
 
@@ -224,7 +223,6 @@ struct stm32f7_i2c_spec {
  * @rise_time: Rise time (ns)
  * @fall_time: Fall time (ns)
  * @dnf: Digital filter coefficient (0-16)
- * @analog_filter: Analog filter delay (On/Off)
  * @fmp_clr_offset: Fast Mode Plus clear register offset from set register
  */
 struct stm32f7_i2c_setup {
@@ -233,7 +231,6 @@ struct stm32f7_i2c_setup {
 	u32 rise_time;
 	u32 fall_time;
 	u8 dnf;
-	bool analog_filter;
 	u32 fmp_clr_offset;
 };
 
@@ -312,6 +309,7 @@ struct stm32f7_i2c_msg {
  * @wakeup_src: boolean to know if the device is a wakeup source
  * @smbus_mode: states that the controller is configured in SMBus mode
  * @host_notify_client: SMBus host-notify client
+ * @analog_filter: boolean to indicate enabling of the analog filter
  */
 struct stm32f7_i2c_dev {
 	struct i2c_adapter adap;
@@ -340,6 +338,7 @@ struct stm32f7_i2c_dev {
 	bool wakeup_src;
 	bool smbus_mode;
 	struct i2c_client *host_notify_client;
+	bool analog_filter;
 };
 
 /*
@@ -386,14 +385,12 @@ static const struct stm32f7_i2c_setup stm32f7_setup = {
 	.rise_time = STM32F7_I2C_RISE_TIME_DEFAULT,
 	.fall_time = STM32F7_I2C_FALL_TIME_DEFAULT,
 	.dnf = STM32F7_I2C_DNF_DEFAULT,
-	.analog_filter = STM32F7_I2C_ANALOG_FILTER_ENABLE,
 };
 
 static const struct stm32f7_i2c_setup stm32mp15_setup = {
 	.rise_time = STM32F7_I2C_RISE_TIME_DEFAULT,
 	.fall_time = STM32F7_I2C_FALL_TIME_DEFAULT,
 	.dnf = STM32F7_I2C_DNF_DEFAULT,
-	.analog_filter = STM32F7_I2C_ANALOG_FILTER_ENABLE,
 	.fmp_clr_offset = 0x40,
 };
 
@@ -471,10 +468,10 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
 
 	/*  Analog and Digital Filters */
 	af_delay_min =
-		(setup->analog_filter ?
+		(i2c_dev->analog_filter ?
 		 STM32F7_I2C_ANALOG_FILTER_DELAY_MIN : 0);
 	af_delay_max =
-		(setup->analog_filter ?
+		(i2c_dev->analog_filter ?
 		 STM32F7_I2C_ANALOG_FILTER_DELAY_MAX : 0);
 	dnf_delay = setup->dnf * i2cclk;
 
@@ -676,12 +673,15 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 		return ret;
 	}
 
+	i2c_dev->analog_filter = of_property_read_bool(i2c_dev->dev->of_node,
+						       "i2c-analog-filter");
+
 	dev_dbg(i2c_dev->dev, "I2C Speed(%i), Clk Source(%i)\n",
 		setup->speed_freq, setup->clock_src);
 	dev_dbg(i2c_dev->dev, "I2C Rise(%i) and Fall(%i) Time\n",
 		setup->rise_time, setup->fall_time);
 	dev_dbg(i2c_dev->dev, "I2C Analog Filter(%s), DNF(%i)\n",
-		(setup->analog_filter ? "On" : "Off"), setup->dnf);
+		(i2c_dev->analog_filter ? "On" : "Off"), setup->dnf);
 
 	i2c_dev->bus_rate = setup->speed_freq;
 
@@ -720,8 +720,8 @@ static void stm32f7_i2c_hw_config(struct stm32f7_i2c_dev *i2c_dev)
 	timing |= STM32F7_I2C_TIMINGR_SCLL(t->scll);
 	writel_relaxed(timing, i2c_dev->base + STM32F7_I2C_TIMINGR);
 
-	/* Enable I2C */
-	if (i2c_dev->setup.analog_filter)
+	/* Configure the Analog Filter */
+	if (i2c_dev->analog_filter)
 		stm32f7_i2c_clr_bits(i2c_dev->base + STM32F7_I2C_CR1,
 				     STM32F7_I2C_CR1_ANFOFF);
 	else
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
