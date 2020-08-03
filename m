Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0B9239F18
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Aug 2020 07:27:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9F6CC36B3A;
	Mon,  3 Aug 2020 05:27:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3270AC36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Aug 2020 05:27:03 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0735GR6a020633; Mon, 3 Aug 2020 07:26:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=cDA+cqjXgSwkoE7fs7oSbNh+/jtYbRrtkDdblBLNN2o=;
 b=gFL1De2x5VEJ7xQjcpo6vHRc/6tQ29mAbfp1REIjVahBFRwbGNVYDmpuHPcfOlTUVvup
 2lw1F4Um1FzV71o3Ku6wJYdgTv1MWvWjnF33h8OQkGb9jl5LTeWKy5A8ZFTQHCGwARv5
 7oGrYGXXX4qBlEJ0jl+AX3w7IUcUFM0ry9f+9jpoL9C9NutbH3Io2ootYpBp4scAARdk
 zVPzjPjDybN22JWDmlIEcV/CB1OO5iw75HhrvkC1rBxnsZo8i09dG1Fbx9L7cpe/euk0
 MkyckZHuDamuIrPPlO8XKEkJ6DlsuDPn+4Y2K22fVZLI6WdylqUW7q6rfzd1cEZwV/MS hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32n6savwcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Aug 2020 07:26:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4D142100034;
 Mon,  3 Aug 2020 07:26:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B41920B859;
 Mon,  3 Aug 2020 07:26:57 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 3 Aug 2020 07:26:56
 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <wsa@kernel.org>, <pierre-yves.mordret@st.com>
Date: Mon, 3 Aug 2020 07:26:56 +0200
Message-ID: <1596432416-24636-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-03_04:2020-07-31,
 2020-08-03 signatures=0
Cc: linux-kernel@vger.kernel.org, alain.volmat@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] i2c: stm32f7: add SMBus-Alert support
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

Add support for the SMBus-Alert protocol.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 This patch has to be integrated on top of the patch
 'i2c: stm32f7: Add SMBus Host-Notify protocol support' since SMBus Alert is
 enabled by the DT binding 'smbus' introduced in that patch.

 drivers/i2c/busses/i2c-stm32f7.c | 71 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 223c238c3c09..fe7641da54ef 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -51,6 +51,7 @@
 
 /* STM32F7 I2C control 1 */
 #define STM32F7_I2C_CR1_PECEN			BIT(23)
+#define STM32F7_I2C_CR1_ALERTEN			BIT(22)
 #define STM32F7_I2C_CR1_SMBHEN			BIT(20)
 #define STM32F7_I2C_CR1_WUPEN			BIT(18)
 #define STM32F7_I2C_CR1_SBC			BIT(16)
@@ -123,6 +124,7 @@
 				(((n) & STM32F7_I2C_ISR_ADDCODE_MASK) >> 17)
 #define STM32F7_I2C_ISR_DIR			BIT(16)
 #define STM32F7_I2C_ISR_BUSY			BIT(15)
+#define STM32F7_I2C_ISR_ALERT			BIT(13)
 #define STM32F7_I2C_ISR_PECERR			BIT(11)
 #define STM32F7_I2C_ISR_ARLO			BIT(9)
 #define STM32F7_I2C_ISR_BERR			BIT(8)
@@ -136,6 +138,7 @@
 #define STM32F7_I2C_ISR_TXE			BIT(0)
 
 /* STM32F7 I2C Interrupt Clear */
+#define STM32F7_I2C_ICR_ALERTCF			BIT(13)
 #define STM32F7_I2C_ICR_PECCF			BIT(11)
 #define STM32F7_I2C_ICR_ARLOCF			BIT(9)
 #define STM32F7_I2C_ICR_BERRCF			BIT(8)
@@ -277,6 +280,17 @@ struct stm32f7_i2c_msg {
 };
 
 /**
+ * struct stm32f7_i2c_alert - SMBus alert specific data
+ * @setup: platform data for the smbus_alert i2c client
+ * @ara: I2C slave device used to respond to the SMBus Alert with Alert
+ * Response Address
+ */
+struct stm32f7_i2c_alert {
+	struct i2c_smbus_alert_setup setup;
+	struct i2c_client *ara;
+};
+
+/**
  * struct stm32f7_i2c_dev - private data of the controller
  * @adap: I2C adapter for this controller
  * @dev: device for this controller
@@ -305,6 +319,7 @@ struct stm32f7_i2c_msg {
  * @wakeup_src: boolean to know if the device is a wakeup source
  * @smbus_mode: states that the controller is configured in SMBus mode
  * @host_notify_client: SMBus host-notify client
+ * @alert: SMBus alert specific data
  */
 struct stm32f7_i2c_dev {
 	struct i2c_adapter adap;
@@ -333,6 +348,7 @@ struct stm32f7_i2c_dev {
 	bool wakeup_src;
 	bool smbus_mode;
 	struct i2c_client *host_notify_client;
+	struct stm32f7_i2c_alert *alert;
 };
 
 /*
@@ -1601,6 +1617,13 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
 		f7_msg->result = -EINVAL;
 	}
 
+	if (status & STM32F7_I2C_ISR_ALERT) {
+		dev_dbg(dev, "<%s>: SMBus alert received\n", __func__);
+		writel_relaxed(STM32F7_I2C_ICR_ALERTCF, base + STM32F7_I2C_ICR);
+		i2c_handle_smbus_alert(i2c_dev->alert->ara);
+		return IRQ_HANDLED;
+	}
+
 	if (!i2c_dev->slave_running) {
 		u32 mask;
 		/* Disable interrupts */
@@ -1967,6 +1990,42 @@ static void stm32f7_i2c_disable_smbus_host(struct stm32f7_i2c_dev *i2c_dev)
 	}
 }
 
+static int stm32f7_i2c_enable_smbus_alert(struct stm32f7_i2c_dev *i2c_dev)
+{
+	struct stm32f7_i2c_alert *alert;
+	struct i2c_adapter *adap = &i2c_dev->adap;
+	struct device *dev = i2c_dev->dev;
+	void __iomem *base = i2c_dev->base;
+
+	alert = devm_kzalloc(dev, sizeof(*alert), GFP_KERNEL);
+	if (!alert)
+		return -ENOMEM;
+
+	alert->ara = i2c_new_smbus_alert_device(adap, &alert->setup);
+	if (IS_ERR(alert->ara))
+		return PTR_ERR(alert->ara);
+
+	i2c_dev->alert = alert;
+
+	/* Enable SMBus Alert */
+	stm32f7_i2c_set_bits(base + STM32F7_I2C_CR1, STM32F7_I2C_CR1_ALERTEN);
+
+	return 0;
+}
+
+static void stm32f7_i2c_disable_smbus_alert(struct stm32f7_i2c_dev *i2c_dev)
+{
+	struct stm32f7_i2c_alert *alert = i2c_dev->alert;
+	void __iomem *base = i2c_dev->base;
+
+	if (alert) {
+		/* Disable SMBus Alert */
+		stm32f7_i2c_clr_bits(base + STM32F7_I2C_CR1,
+				     STM32F7_I2C_CR1_ALERTEN);
+		i2c_unregister_device(alert->ara);
+	}
+}
+
 static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
 {
 	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
@@ -2161,6 +2220,14 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 				ret);
 			goto i2c_adapter_remove;
 		}
+
+		ret = stm32f7_i2c_enable_smbus_alert(i2c_dev);
+		if (ret) {
+			dev_err(i2c_dev->dev,
+				"failed to enable SMBus alert protocol (%d)\n",
+				ret);
+			goto i2c_disable_smbus_host;
+		}
 	}
 
 	dev_info(i2c_dev->dev, "STM32F7 I2C-%d bus adapter\n", adap->nr);
@@ -2170,6 +2237,9 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 
 	return 0;
 
+i2c_disable_smbus_host:
+	stm32f7_i2c_disable_smbus_host(i2c_dev);
+
 i2c_adapter_remove:
 	i2c_del_adapter(adap);
 
@@ -2204,6 +2274,7 @@ static int stm32f7_i2c_remove(struct platform_device *pdev)
 {
 	struct stm32f7_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 
+	stm32f7_i2c_disable_smbus_alert(i2c_dev);
 	stm32f7_i2c_disable_smbus_host(i2c_dev);
 
 	i2c_del_adapter(&i2c_dev->adap);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
