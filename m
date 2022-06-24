Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29718559DB2
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jun 2022 17:54:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E005BC03FC5;
	Fri, 24 Jun 2022 15:54:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 574ACC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jun 2022 15:54:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25OD34NL003151;
 Fri, 24 Jun 2022 17:54:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=GfYk+A5KRwdLAqc/eWRzfg2b3p5WeI7KtAvJdW2Cf0M=;
 b=Np8oOv4a+MpbA0ajsza+6PDZa3haPWtWL8wQ8EX1YrU/E75gCkU+1JId67U+Wcujdexn
 0F+zPG4HlywwdN9ubNhj19DNY6NqWcviyzx/ZbssBBweECIL6PUFqcL+0dAE3btf/YYv
 0+WA9AEcjoyPbM9Oj8HcdKlVEeIEdRVysAzfyOcIVtR3KcSMGQxEfJFjEVppTz0JpR5W
 i7S/pR63jXu0SSfADDYXI8nEXWz7wMCiS4V94jbNQNd/PNlnCf0cVQZ/zORMSWJqAMwV
 l9FMX+eFMHwRExRz6BNTDsEe/AFC7GoyUifjvXv08V3BE/eDprajAK8W28sTD1hcFAnK DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gvn8s9qn5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 17:54:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9FCA1100039;
 Fri, 24 Jun 2022 17:54:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B4B0226FBB;
 Fri, 24 Jun 2022 17:54:27 +0200 (CEST)
Received: from localhost (10.75.127.48) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 24 Jun
 2022 17:54:26 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <robh+dt@kernel.org>, <heikki.krogerus@linux.intel.com>,
 <gregkh@linuxfoundation.org>
Date: Fri, 24 Jun 2022 17:54:11 +0200
Message-ID: <20220624155413.399190-3-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624155413.399190-1-fabrice.gasnier@foss.st.com>
References: <20220624155413.399190-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_07,2022-06-23_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/4] usb: typec: ucsi: stm32g0: add support
	for stm32g0 i2c controller
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

STM32G0 provides an integrated USB Type-C and power delivery interface.
It can be programmed with a firmware to handle UCSI protocol over I2C
interface. A GPIO is used as an interrupt line.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/usb/typec/ucsi/Kconfig        |  10 ++
 drivers/usb/typec/ucsi/Makefile       |   1 +
 drivers/usb/typec/ucsi/ucsi_stm32g0.c | 218 ++++++++++++++++++++++++++
 3 files changed, 229 insertions(+)
 create mode 100644 drivers/usb/typec/ucsi/ucsi_stm32g0.c

diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index 5e9b37b3f25e1..8f9c4b9f31f79 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -48,4 +48,14 @@ config UCSI_ACPI
 	  To compile the driver as a module, choose M here: the module will be
 	  called ucsi_acpi
 
+config UCSI_STM32G0
+	tristate "UCSI Interface Driver for STM32G0"
+	depends on I2C
+	help
+	  This driver enables UCSI support on platforms that expose a STM32G0
+	  Type-C controller over I2C interface.
+
+	  To compile the driver as a module, choose M here: the module will be
+	  called ucsi_stm32g0.
+
 endif
diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
index 8a8eb5cb8e0f0..480d533d762fe 100644
--- a/drivers/usb/typec/ucsi/Makefile
+++ b/drivers/usb/typec/ucsi/Makefile
@@ -17,3 +17,4 @@ endif
 
 obj-$(CONFIG_UCSI_ACPI)			+= ucsi_acpi.o
 obj-$(CONFIG_UCSI_CCG)			+= ucsi_ccg.o
+obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
new file mode 100644
index 0000000000000..d1f22cee8c6c9
--- /dev/null
+++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/*
+ * UCSI driver for STMicroelectronics STM32G0 Type-C controller
+ *
+ * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
+ * Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>.
+ */
+
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "ucsi.h"
+
+struct ucsi_stm32g0 {
+	struct i2c_client *client;
+	struct completion complete;
+	struct device *dev;
+	unsigned long flags;
+	struct ucsi *ucsi;
+};
+
+static int ucsi_stm32g0_read(struct ucsi *ucsi, unsigned int offset, void *val, size_t len)
+{
+	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
+	struct i2c_client *client = g0->client;
+	u8 reg = offset;
+	struct i2c_msg msg[] = {
+		{
+			.addr	= client->addr,
+			.flags  = 0,
+			.len	= 1,
+			.buf	= &reg,
+		},
+		{
+			.addr	= client->addr,
+			.flags  = I2C_M_RD,
+			.len	= len,
+			.buf	= val,
+		},
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+	if (ret != ARRAY_SIZE(msg)) {
+		dev_err(g0->dev, "i2c read %02x, %02x error: %d\n", client->addr, reg, ret);
+
+		return ret < 0 ? ret : -EIO;
+	}
+
+	return 0;
+}
+
+static int ucsi_stm32g0_async_write(struct ucsi *ucsi, unsigned int offset, const void *val,
+				    size_t len)
+{
+	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
+	struct i2c_client *client = g0->client;
+	struct i2c_msg msg[] = {
+		{
+			.addr	= client->addr,
+			.flags  = 0,
+		}
+	};
+	unsigned char *buf;
+	int ret;
+
+	buf = kzalloc(len + 1, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	buf[0] = offset;
+	memcpy(&buf[1], val, len);
+	msg[0].len = len + 1;
+	msg[0].buf = buf;
+
+	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+	kfree(buf);
+	if (ret != ARRAY_SIZE(msg)) {
+		dev_err(g0->dev, "i2c write %02x, %02x error: %d\n", client->addr, buf[0], ret);
+
+		return ret < 0 ? ret : -EIO;
+	}
+
+	return 0;
+}
+
+static int ucsi_stm32g0_sync_write(struct ucsi *ucsi, unsigned int offset, const void *val,
+				   size_t len)
+{
+	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
+	int ret;
+
+	set_bit(COMMAND_PENDING, &g0->flags);
+
+	ret = ucsi_stm32g0_async_write(ucsi, offset, val, len);
+	if (ret)
+		goto out_clear_bit;
+
+	if (!wait_for_completion_timeout(&g0->complete, msecs_to_jiffies(5000)))
+		ret = -ETIMEDOUT;
+
+out_clear_bit:
+	clear_bit(COMMAND_PENDING, &g0->flags);
+
+	return ret;
+}
+
+static irqreturn_t ucsi_stm32g0_irq_handler(int irq, void *data)
+{
+	struct ucsi_stm32g0 *g0 = data;
+	u32 cci;
+	int ret;
+
+	ret = ucsi_stm32g0_read(g0->ucsi, UCSI_CCI, &cci, sizeof(cci));
+	if (ret)
+		return IRQ_NONE;
+
+	if (UCSI_CCI_CONNECTOR(cci))
+		ucsi_connector_change(g0->ucsi, UCSI_CCI_CONNECTOR(cci));
+
+	if (test_bit(COMMAND_PENDING, &g0->flags) &&
+	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))
+		complete(&g0->complete);
+
+	return IRQ_HANDLED;
+}
+
+static const struct ucsi_operations ucsi_stm32g0_ops = {
+	.read = ucsi_stm32g0_read,
+	.sync_write = ucsi_stm32g0_sync_write,
+	.async_write = ucsi_stm32g0_async_write,
+};
+
+static int ucsi_stm32g0_probe(struct i2c_client *client, const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct ucsi_stm32g0 *g0;
+	int ret;
+
+	g0 = devm_kzalloc(dev, sizeof(*g0), GFP_KERNEL);
+	if (!g0)
+		return -ENOMEM;
+
+	g0->dev = dev;
+	g0->client = client;
+	init_completion(&g0->complete);
+	i2c_set_clientdata(client, g0);
+
+	g0->ucsi = ucsi_create(dev, &ucsi_stm32g0_ops);
+	if (IS_ERR(g0->ucsi))
+		return PTR_ERR(g0->ucsi);
+
+	ucsi_set_drvdata(g0->ucsi, g0);
+
+	/* Request alert interrupt */
+	ret = request_threaded_irq(client->irq, NULL, ucsi_stm32g0_irq_handler, IRQF_ONESHOT,
+				   dev_name(&client->dev), g0);
+	if (ret) {
+		dev_err_probe(dev, ret, "request IRQ failed\n");
+		goto destroy;
+	}
+
+	ret = ucsi_register(g0->ucsi);
+	if (ret) {
+		dev_err_probe(dev, ret, "ucsi_register failed\n");
+		goto freeirq;
+	}
+
+	return 0;
+
+freeirq:
+	free_irq(client->irq, g0);
+destroy:
+	ucsi_destroy(g0->ucsi);
+
+	return ret;
+}
+
+static int ucsi_stm32g0_remove(struct i2c_client *client)
+{
+	struct ucsi_stm32g0 *g0 = i2c_get_clientdata(client);
+
+	ucsi_unregister(g0->ucsi);
+	free_irq(client->irq, g0);
+	ucsi_destroy(g0->ucsi);
+
+	return 0;
+}
+
+static const struct of_device_id __maybe_unused ucsi_stm32g0_typec_of_match[] = {
+	{ .compatible = "st,stm32g0-typec" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ucsi_stm32g0_typec_of_match);
+
+static const struct i2c_device_id ucsi_stm32g0_typec_i2c_devid[] = {
+	{"stm32g0-typec", 0},
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, ucsi_stm32g0_typec_i2c_devid);
+
+static struct i2c_driver ucsi_stm32g0_i2c_driver = {
+	.driver = {
+		.name = "ucsi-stm32g0-i2c",
+		.of_match_table = of_match_ptr(ucsi_stm32g0_typec_of_match),
+	},
+	.probe = ucsi_stm32g0_probe,
+	.remove = ucsi_stm32g0_remove,
+	.id_table = ucsi_stm32g0_typec_i2c_devid
+};
+module_i2c_driver(ucsi_stm32g0_i2c_driver);
+
+MODULE_AUTHOR("Fabrice Gasnier <fabrice.gasnier@foss.st.com>");
+MODULE_DESCRIPTION("STMicroelectronics STM32G0 Type-C controller");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("platform:ucsi-stm32g0");
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
