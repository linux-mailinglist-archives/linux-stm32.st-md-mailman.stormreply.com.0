Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC59F8D7904
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 01:25:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C140C6B47E;
	Sun,  2 Jun 2024 23:25:05 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEEA6C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Jun 2024 23:25:01 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52b9af7a01bso382893e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Jun 2024 16:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717370701; x=1717975501;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fLTVeDBunzWZL7NXj62dRVbdmskQ6vEkyJgavqsHljg=;
 b=fkl7fpLqGPJHunhGUDAGlIDAHUff5+jvuVgq/akJKXG5VxzcaHxmt5C4s7Wao5+Gnr
 jtaabAbM95ffjvy2673UkyQ+QXGRXV+qDOiWTLX2nuubdQudjEwpwY5R4z7D7uKwBP1/
 h9FiTOMBk+qkwHbwYgh7meEMsNSP7HDmI5EanAVX0EqXUkvS+uCEqw5F02gwHhBnT9S+
 onT/aTTIfXP29knEWEHeEacffuNE+kDY/XHAih8tYwC6ok7Sz9CNSilFoeIfTOADsj0G
 GfeYDjysv6loMum+C9gIJDxk+FJa9xBgtC+Ay/hUi4ekNaDwsgMWz12nqXFxBoyRVK8C
 zapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717370701; x=1717975501;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fLTVeDBunzWZL7NXj62dRVbdmskQ6vEkyJgavqsHljg=;
 b=E0xzeJWAHP0XvBP3efWtltDKFEGQ1EHBQRIez6UO4HgSpQzuvFeNimzcJwbAvIFv0d
 HpksTLHnChFT/CWcy5b2ABi7BZ09iO/U94c6y0csGug1iHq4lWbDxEUt9l1tGXq3cvIz
 GHrCCusXX/2J9zbsPZireEmD/wO7kS8O4faN9g7HJsOgBV++80mMOr0yLLtiDcIQcQ1D
 Y35Pq6fwybVIj/W4ZnRbTo9n/dYqToH5ZnW7bXOwrkWL/j0/X54cUvdLvZRsmRYAQ1Jt
 4tA7Zs68lQXNX83ZmmVtPQTtevRUu+pRLmyEXneS/4SfbQSUgBqbUpG1DrO5GieXt4xy
 V8lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxcj8E75YQHVNSzbtxCSnTV7z+cIpuLbYXuGWkLq8CnrGlwIZOJ1FttiZxniRSM+taurckv9sYGVqjLCpEYScBfSGBNNFUXSOr3KUyveYuFhlPYuQ8a8bg
X-Gm-Message-State: AOJu0YxbkqtOjnKOEVJ27vd4lH2sYl/21gjVgbCe0TVM2s1W5CeqDs9X
 aorg0sTxjtR96Imso4C4nU9GqCRlCC2issy2v3cX8XEV+JkiuwCoJM6sWo87GI8=
X-Google-Smtp-Source: AGHT+IHY6hl3fA/aTU7/5Qs5jHutGO3eYNynfRaMh7gFJxG/9+xPnjuSt6dd6ciGptalIyviyk3Uvw==
X-Received: by 2002:a05:6512:1152:b0:52b:9c8a:735a with SMTP id
 2adb3069b0e04-52b9c8a74fcmr205388e87.40.1717370700848; 
 Sun, 02 Jun 2024 16:25:00 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b959008aasm392369e87.269.2024.06.02.16.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 16:25:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 02:24:59 +0300
MIME-Version: 1.0
Message-Id: <20240603-ucsi-rework-interface-v1-6-99a6d544cec8@linaro.org>
References: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
In-Reply-To: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14654;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xsVlzflUb/Qp1trYi1IqtQRk3wSvC2VlMHb1s/cNflQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1rMf3fZKVbMvl/MvA4YZCjfVVleW3U9nju+f0XV2tjJe
 17ZW27rZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEFHdxMMyLKbipKsrvU3b1
 XdwubZecG8LTp9RNfLIn4AHP2+7vP63uPZD5J8+cyiOrxngkznOJWV1RumBn6NeZf1ezipzkfb1
 HnHftHiWnLc4PdVXFVwhs1P0t92qflabtpI37/VimvE80fLrGfHuDn72PfbJNb4e/6h/v566PGf
 23Bh3fossgZrVWLD80J39fr0Ju6u34vy31dU9sD8dzZ0gt3HPDqsFb606YXsSX7bZ+Dd8dG76Jz
 TcyXSRgzWBk3F56Y01K8fR16ayKhmKl+afNzVdctzqm8W2L+6P/1xp+7T7Oocx7+5X/e50i///7
 vk07cmS/f1uWe9mxh1qqEXph7wp3sYRmds50cnz1zkoTAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 6/7] usb: typec: ucsi: extract common code
 for command handling
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

Extract common functions to handle command sending and to handle events
from UCSI. This ensures that all UCSI glue drivers handle the ACKs in
the same way.

The CCG driver used DEV_CMD_PENDING both for internal
firmware-related commands and for UCSI control handling. Leave the
former use case intact.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c         | 43 ++++++++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h         |  7 ++++++
 drivers/usb/typec/ucsi/ucsi_acpi.c    | 46 +++-------------------------------
 drivers/usb/typec/ucsi/ucsi_ccg.c     | 21 +++-------------
 drivers/usb/typec/ucsi/ucsi_glink.c   | 47 ++---------------------------------
 drivers/usb/typec/ucsi/ucsi_stm32g0.c | 44 ++------------------------------
 6 files changed, 60 insertions(+), 148 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ac4bd86b3fae..4d36a04dc63b 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -36,6 +36,48 @@
  */
 #define UCSI_SWAP_TIMEOUT_MS	5000
 
+void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
+{
+	if (UCSI_CCI_CONNECTOR(cci))
+		ucsi_connector_change(ucsi, UCSI_CCI_CONNECTOR(cci));
+
+	if (cci & UCSI_CCI_ACK_COMPLETE &&
+	    test_bit(ACK_PENDING, &ucsi->flags))
+		complete(&ucsi->complete);
+
+	if (cci & UCSI_CCI_COMMAND_COMPLETE &&
+	    test_bit(COMMAND_PENDING, &ucsi->flags))
+		complete(&ucsi->complete);
+}
+EXPORT_SYMBOL_GPL(ucsi_notify_common);
+
+int ucsi_sync_control_common(struct ucsi *ucsi, u64 command)
+{
+	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
+	int ret;
+
+	if (ack)
+		set_bit(ACK_PENDING, &ucsi->flags);
+	else
+		set_bit(COMMAND_PENDING, &ucsi->flags);
+
+	ret = ucsi->ops->async_control(ucsi, command);
+	if (ret)
+		goto out_clear_bit;
+
+	if (!wait_for_completion_timeout(&ucsi->complete, 5 * HZ))
+		ret = -ETIMEDOUT;
+
+out_clear_bit:
+	if (ack)
+		clear_bit(ACK_PENDING, &ucsi->flags);
+	else
+		clear_bit(COMMAND_PENDING, &ucsi->flags);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ucsi_sync_control_common);
+
 static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 {
 	u64 ctrl;
@@ -1858,6 +1900,7 @@ struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
 	INIT_WORK(&ucsi->resume_work, ucsi_resume_work);
 	INIT_DELAYED_WORK(&ucsi->work, ucsi_init_work);
 	mutex_init(&ucsi->ppm_lock);
+	init_completion(&ucsi->complete);
 	ucsi->dev = dev;
 	ucsi->ops = ops;
 
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index f770e1070424..b08393417fa9 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -4,6 +4,7 @@
 #define __DRIVER_USB_TYPEC_UCSI_H
 
 #include <linux/bitops.h>
+#include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/power_supply.h>
 #include <linux/types.h>
@@ -409,6 +410,9 @@ struct ucsi {
 	/* PPM communication flags */
 	unsigned long flags;
 #define EVENT_PENDING	0
+#define COMMAND_PENDING	1
+#define ACK_PENDING	2
+	struct completion complete;
 
 	unsigned long quirks;
 #define UCSI_NO_PARTNER_PDOS	BIT(0)	/* Don't read partner's PDOs */
@@ -473,6 +477,9 @@ int ucsi_send_command(struct ucsi *ucsi, u64 command,
 void ucsi_altmode_update_active(struct ucsi_connector *con);
 int ucsi_resume(struct ucsi *ucsi);
 
+void ucsi_notify_common(struct ucsi *ucsi, u32 cci);
+int ucsi_sync_control_common(struct ucsi *ucsi, u64 command);
+
 #if IS_ENABLED(CONFIG_POWER_SUPPLY)
 int ucsi_register_port_psy(struct ucsi_connector *con);
 void ucsi_unregister_port_psy(struct ucsi_connector *con);
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 61dd28dae3a4..e8402fac70c8 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -21,10 +21,6 @@ struct ucsi_acpi {
 	struct device *dev;
 	struct ucsi *ucsi;
 	void *base;
-	struct completion complete;
-	unsigned long flags;
-#define UCSI_ACPI_COMMAND_PENDING	1
-#define UCSI_ACPI_ACK_PENDING		2
 	guid_t guid;
 	u64 cmd;
 };
@@ -97,38 +93,11 @@ static int ucsi_acpi_async_control(struct ucsi *ucsi, u64 command)
 	return ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_WRITE);
 }
 
-static int ucsi_acpi_sync_control(struct ucsi *ucsi, u64 command)
-{
-	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
-	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
-	int ret;
-
-	if (ack)
-		set_bit(UCSI_ACPI_ACK_PENDING, &ua->flags);
-	else
-		set_bit(UCSI_ACPI_COMMAND_PENDING, &ua->flags);
-
-	ret = ucsi_acpi_async_control(ucsi, command);
-	if (ret)
-		goto out_clear_bit;
-
-	if (!wait_for_completion_timeout(&ua->complete, 5 * HZ))
-		ret = -ETIMEDOUT;
-
-out_clear_bit:
-	if (ack)
-		clear_bit(UCSI_ACPI_ACK_PENDING, &ua->flags);
-	else
-		clear_bit(UCSI_ACPI_COMMAND_PENDING, &ua->flags);
-
-	return ret;
-}
-
 static const struct ucsi_operations ucsi_acpi_ops = {
 	.read_version = ucsi_acpi_read_version,
 	.read_cci = ucsi_acpi_read_cci,
 	.read_message_in = ucsi_acpi_read_message_in,
-	.sync_control = ucsi_acpi_sync_control,
+	.sync_control = ucsi_sync_control_common,
 	.async_control = ucsi_acpi_async_control
 };
 
@@ -164,7 +133,7 @@ static const struct ucsi_operations ucsi_zenbook_ops = {
 	.read_version = ucsi_acpi_read_version,
 	.read_cci = ucsi_zenbook_read_cci,
 	.read_message_in = ucsi_zenbook_read_message_in,
-	.sync_control = ucsi_acpi_sync_control,
+	.sync_control = ucsi_sync_control_common,
 	.async_control = ucsi_acpi_async_control
 };
 
@@ -189,15 +158,7 @@ static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
 	if (ret)
 		return;
 
-	if (UCSI_CCI_CONNECTOR(cci))
-		ucsi_connector_change(ua->ucsi, UCSI_CCI_CONNECTOR(cci));
-
-	if (cci & UCSI_CCI_ACK_COMPLETE &&
-	    test_bit(UCSI_ACPI_ACK_PENDING, &ua->flags))
-		complete(&ua->complete);
-	if (cci & UCSI_CCI_COMMAND_COMPLETE &&
-	    test_bit(UCSI_ACPI_COMMAND_PENDING, &ua->flags))
-		complete(&ua->complete);
+	ucsi_notify_common(ua->ucsi, cci);
 }
 
 static int ucsi_acpi_probe(struct platform_device *pdev)
@@ -231,7 +192,6 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	init_completion(&ua->complete);
 	ua->dev = &pdev->dev;
 
 	id = dmi_first_match(ucsi_acpi_quirks);
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 6ccc394f268e..ba4db2310a05 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -222,8 +222,6 @@ struct ucsi_ccg {
 	u16 fw_build;
 	struct work_struct pm_work;
 
-	struct completion complete;
-
 	u64 last_cmd_sent;
 	bool has_multiple_dp;
 	struct ucsi_ccg_altmode orig[UCSI_MAX_ALTMODES];
@@ -637,7 +635,6 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
 
 	mutex_lock(&uc->lock);
 	pm_runtime_get_sync(uc->dev);
-	set_bit(DEV_CMD_PENDING, &uc->flags);
 
 	uc->last_cmd_sent = command;
 
@@ -649,15 +646,8 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
 		ucsi_ccg_update_set_new_cam_cmd(uc, con, &command);
 	}
 
-	ret = ucsi_ccg_async_control(ucsi, command);
-	if (ret)
-		goto err_clear_bit;
-
-	if (!wait_for_completion_timeout(&uc->complete, msecs_to_jiffies(5000)))
-		ret = -ETIMEDOUT;
+	ret = ucsi_sync_control_common(ucsi, command);
 
-err_clear_bit:
-	clear_bit(DEV_CMD_PENDING, &uc->flags);
 	pm_runtime_put_sync(uc->dev);
 	mutex_unlock(&uc->lock);
 
@@ -694,9 +684,6 @@ static irqreturn_t ccg_irq_handler(int irq, void *data)
 	if (ret)
 		goto err_clear_irq;
 
-	if (UCSI_CCI_CONNECTOR(cci))
-		ucsi_connector_change(uc->ucsi, UCSI_CCI_CONNECTOR(cci));
-
 	/*
 	 * As per CCGx UCSI interface guide, copy CCI and MESSAGE_IN
 	 * to the OpRegion before clear the UCSI interrupt
@@ -708,9 +695,8 @@ static irqreturn_t ccg_irq_handler(int irq, void *data)
 err_clear_irq:
 	ccg_write(uc, CCGX_RAB_INTR_REG, &intr_reg, sizeof(intr_reg));
 
-	if (!ret && test_bit(DEV_CMD_PENDING, &uc->flags) &&
-	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))
-		complete(&uc->complete);
+	if (!ret)
+		ucsi_notify_common(uc->ucsi, cci);
 
 	return IRQ_HANDLED;
 }
@@ -1429,7 +1415,6 @@ static int ucsi_ccg_probe(struct i2c_client *client)
 	uc->client = client;
 	uc->irq = client->irq;
 	mutex_init(&uc->lock);
-	init_completion(&uc->complete);
 	INIT_WORK(&uc->work, ccg_update_firmware);
 	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
 
diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 7f6a48624ee5..8b74da38d283 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -64,12 +64,8 @@ struct pmic_glink_ucsi {
 	struct ucsi *ucsi;
 	struct completion read_ack;
 	struct completion write_ack;
-	struct completion sync_ack;
-	bool sync_pending;
 	struct mutex lock;	/* protects concurrent access to PMIC Glink interface */
 
-	int sync_val;
-
 	struct work_struct notify_work;
 	struct work_struct register_work;
 
@@ -170,35 +166,6 @@ static int pmic_glink_ucsi_async_control(struct ucsi *__ucsi, u64 command)
 	return ret;
 }
 
-static int pmic_glink_ucsi_sync_control(struct ucsi *__ucsi, u64 command)
-{
-	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(__ucsi);
-	unsigned long left;
-	int ret;
-
-	/* TOFIX: Downstream forces recipient to CON when UCSI_GET_ALTERNATE_MODES command */
-
-	mutex_lock(&ucsi->lock);
-	ucsi->sync_val = 0;
-	reinit_completion(&ucsi->sync_ack);
-	ucsi->sync_pending = true;
-	ret = pmic_glink_ucsi_locked_write(ucsi, UCSI_CONTROL, &command, sizeof(command));
-	mutex_unlock(&ucsi->lock);
-
-	left = wait_for_completion_timeout(&ucsi->sync_ack, 5 * HZ);
-	if (!left) {
-		dev_err(ucsi->dev, "timeout waiting for UCSI sync write response\n");
-		/* return 0 here and let core UCSI code handle the CCI_BUSY */
-		ret = 0;
-	} else if (ucsi->sync_val) {
-		dev_err(ucsi->dev, "sync write returned: %d\n", ucsi->sync_val);
-	}
-
-	ucsi->sync_pending = false;
-
-	return ret;
-}
-
 static void pmic_glink_ucsi_update_connector(struct ucsi_connector *con)
 {
 	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
@@ -232,7 +199,7 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
 	.read_version = pmic_glink_ucsi_read_version,
 	.read_cci = pmic_glink_ucsi_read_cci,
 	.read_message_in = pmic_glink_ucsi_read_message_in,
-	.sync_control = pmic_glink_ucsi_sync_control,
+	.sync_control = ucsi_sync_control_common,
 	.async_control = pmic_glink_ucsi_async_control,
 	.update_connector = pmic_glink_ucsi_update_connector,
 	.connector_status = pmic_glink_ucsi_connector_status,
@@ -256,14 +223,12 @@ static void pmic_glink_ucsi_write_ack(struct pmic_glink_ucsi *ucsi, const void *
 	if (resp->ret_code)
 		return;
 
-	ucsi->sync_val = resp->ret_code;
 	complete(&ucsi->write_ack);
 }
 
 static void pmic_glink_ucsi_notify(struct work_struct *work)
 {
 	struct pmic_glink_ucsi *ucsi = container_of(work, struct pmic_glink_ucsi, notify_work);
-	unsigned int con_num;
 	u32 cci;
 	int ret;
 
@@ -273,14 +238,7 @@ static void pmic_glink_ucsi_notify(struct work_struct *work)
 		return;
 	}
 
-	con_num = UCSI_CCI_CONNECTOR(cci);
-	if (con_num)
-		ucsi_connector_change(ucsi->ucsi, con_num);
-
-	if (ucsi->sync_pending &&
-		   (cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))) {
-		complete(&ucsi->sync_ack);
-	}
+	ucsi_notify_common(ucsi->ucsi, cci);
 }
 
 static void pmic_glink_ucsi_register(struct work_struct *work)
@@ -362,7 +320,6 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 	INIT_WORK(&ucsi->register_work, pmic_glink_ucsi_register);
 	init_completion(&ucsi->read_ack);
 	init_completion(&ucsi->write_ack);
-	init_completion(&ucsi->sync_ack);
 	mutex_init(&ucsi->lock);
 
 	ucsi->ucsi = ucsi_create(dev, &pmic_glink_ucsi_ops);
diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
index e3cfcb258e43..d948c3f579e1 100644
--- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
+++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
@@ -61,11 +61,7 @@ struct ucsi_stm32g0 {
 	struct i2c_client *i2c_bl;
 	bool in_bootloader;
 	u8 bl_version;
-	struct completion complete;
 	struct device *dev;
-	unsigned long flags;
-#define COMMAND_PENDING	1
-#define ACK_PENDING 2
 	const char *fw_name;
 	struct ucsi *ucsi;
 	bool suspended;
@@ -407,35 +403,6 @@ static int ucsi_stm32g0_async_control(struct ucsi *ucsi, u64 command)
 	return 0;
 }
 
-static int ucsi_stm32g0_sync_control(struct ucsi *ucsi, u64 command)
-{
-	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
-	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
-	int ret;
-
-	if (ack)
-		set_bit(ACK_PENDING, &g0->flags);
-	else
-		set_bit(COMMAND_PENDING, &g0->flags);
-
-	ret = ucsi_stm32g0_async_control(ucsi, command);
-	if (ret)
-		goto out_clear_bit;
-
-	if (!wait_for_completion_timeout(&g0->complete, msecs_to_jiffies(5000)))
-		ret = -ETIMEDOUT;
-	else
-		return 0;
-
-out_clear_bit:
-	if (ack)
-		clear_bit(ACK_PENDING, &g0->flags);
-	else
-		clear_bit(COMMAND_PENDING, &g0->flags);
-
-	return ret;
-}
-
 static irqreturn_t ucsi_stm32g0_irq_handler(int irq, void *data)
 {
 	struct ucsi_stm32g0 *g0 = data;
@@ -449,13 +416,7 @@ static irqreturn_t ucsi_stm32g0_irq_handler(int irq, void *data)
 	if (ret)
 		return IRQ_NONE;
 
-	if (UCSI_CCI_CONNECTOR(cci))
-		ucsi_connector_change(g0->ucsi, UCSI_CCI_CONNECTOR(cci));
-
-	if (cci & UCSI_CCI_ACK_COMPLETE && test_and_clear_bit(ACK_PENDING, &g0->flags))
-		complete(&g0->complete);
-	if (cci & UCSI_CCI_COMMAND_COMPLETE && test_and_clear_bit(COMMAND_PENDING, &g0->flags))
-		complete(&g0->complete);
+	ucsi_notify_common(g0->ucsi, cci);
 
 	return IRQ_HANDLED;
 }
@@ -464,7 +425,7 @@ static const struct ucsi_operations ucsi_stm32g0_ops = {
 	.read_version = ucsi_stm32g0_read_version,
 	.read_cci = ucsi_stm32g0_read_cci,
 	.read_message_in = ucsi_stm32g0_read_message_in,
-	.sync_control = ucsi_stm32g0_sync_control,
+	.sync_control = ucsi_sync_control_common,
 	.async_control = ucsi_stm32g0_async_control,
 };
 
@@ -665,7 +626,6 @@ static int ucsi_stm32g0_probe(struct i2c_client *client)
 
 	g0->dev = dev;
 	g0->client = client;
-	init_completion(&g0->complete);
 	i2c_set_clientdata(client, g0);
 
 	g0->ucsi = ucsi_create(dev, &ucsi_stm32g0_ops);

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
