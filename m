Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 663299115FD
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 00:55:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 096E3C78002;
	Thu, 20 Jun 2024 22:55:32 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3110EC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 22:55:28 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ec461d1005so11096561fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 15:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718924127; x=1719528927;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IhIWSFu3KL8FQFaNNsaJys043+45WO3iphZ/TCyhan0=;
 b=J6C2Cr5FBBQ/1pa3tdSNVzAo3o5DYEoLOJBDuQ2R2i8ShV60flFlNgf4okWNgO1rPK
 0USpPkeTTVBZEByZQkTbGagetzLrltXk72iaZgEM8Z58Ma+FLCnlmwSHTlWtyLztCIpO
 NSFp+rMpUIM1sacXJ7Y1uhEZcAN0Mgy2PwINzPIvQP37+As5OSKoyB2b1bYSyF3SvME2
 7hG0irKxNaSt8zVLrrc/YFbBVLCoN7Pqtu+krokRSVpTHNVypAiNRvLcTy345nATNbMZ
 12/ajyWvr3vq1f0EjDOYFcNafi6uCfPMnkoJXMO5+tAcvHI83gl3r3YIIGvoDbOzD+or
 8Dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718924127; x=1719528927;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IhIWSFu3KL8FQFaNNsaJys043+45WO3iphZ/TCyhan0=;
 b=HfOGxkoKlS67sexT2dDqoNDjZnu+uLxPxDUjAkmb+LvTvFFnn32VKwb0h0De32pXk2
 mL06qW86N5KA83O9GZIuU+NY+xmrFSCpIaLGb8NRCjbiI/JFRGMdhKahDtcIjHwQYurT
 RS5UozVhSqNegSv+oG1AQMaGtvM+xwhkhB6qa2iQLIUO0dyEbXuBIXu+9gYU8VWk6p9k
 BeUwDEvPcpcIJ5zTjaBg3V1x8VglmxK2cAKkSO7DfhHOolehJCsyostwDSDEIaejXJ0x
 HfRnK1ts6j8jw6CuMg8oNMH8Sx8aU5ZLpvxZgq+MON9Pc9fLAXjg8snoWfPmy66BJeOM
 mLCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV1ufsBrnlfToGst17n/bWZLDPDHNfg4WWawfMPF87Aw+TzK6J+Fr4UlbpkjOXwScLGoFBRwovncLWTAMoC5TJLiRm1N4dMYfBAfUGwNj9cxhxI8QJEXPr
X-Gm-Message-State: AOJu0YySTIHYscbSf9Glgmf3eGRJ0ZhFEzPdZjMUhKBtX/+kAAQBPM3M
 JphsGDJWfdvS499f8RtrfKzCJtfC5SSNe7dmv/pdcx8dFPZOqKGX+FDCoDy3NCY=
X-Google-Smtp-Source: AGHT+IFm99Slgt1LIpyLXT+Wo6l94e8VBfmHLr5VRGBHvf1DVTQlimSBnYvZUVnyRT9O2EVPLyG4xw==
X-Received: by 2002:a2e:9257:0:b0:2eb:fcea:2f18 with SMTP id
 38308e7fff4ca-2ec3ce7dfdbmr21801041fa.2.1718924127311; 
 Thu, 20 Jun 2024 15:55:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d60126fsm510461fa.20.2024.06.20.15.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 15:55:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Jun 2024 01:55:25 +0300
MIME-Version: 1.0
Message-Id: <20240621-ucsi-rework-interface-v2-6-a399ff96bf88@linaro.org>
References: <20240621-ucsi-rework-interface-v2-0-a399ff96bf88@linaro.org>
In-Reply-To: <20240621-ucsi-rework-interface-v2-0-a399ff96bf88@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17503;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=h08MXKhYJwgVcw5jf3rZEspBt6Ktk0dGLtkODJ0HI60=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmdLNa9F8EZmmrxXHX2OGQWiA0kFKEVf8EycVc1
 vAJml19hOyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnSzWgAKCRCLPIo+Aiko
 1QrPB/9fGCjbzUkxiIkCd9gr9KBAo+DLUQFGfy4MIKOiFYjRp7mK91fiaAZN5WmzgOj+9FmGuiT
 +0K6V/0utyULT3lVKdey+QEYHS2MWxSdFkAW4jidzu+XBgxgAKc+rHMvQQCZz3aeR98V8wSba+h
 tgLb6EpLwTCM8mmZVgHPFgk6Erqab0xw6KgI9O0kuAoANC3tIUqFxYb6wa13GH2Ot7+c6VwqSPM
 8+4H+PL/N5J15nt7UVMmOIqVQXc9MMTCFS6wgHkLkTuynpIPeS+1ght/ig8ZnSw7VutnK7NX3qg
 RKomTUpSVKdgECUYTzj35yXA3qI7xNysTZ6gm33NlfkCwHuf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 6/7] usb: typec: ucsi: extract common code
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
 drivers/usb/typec/ucsi/ucsi.c           | 43 +++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h           |  7 +++++
 drivers/usb/typec/ucsi/ucsi_acpi.c      | 46 ++---------------------------
 drivers/usb/typec/ucsi/ucsi_ccg.c       | 21 ++-----------
 drivers/usb/typec/ucsi/ucsi_glink.c     | 47 ++---------------------------
 drivers/usb/typec/ucsi/ucsi_stm32g0.c   | 44 ++--------------------------
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 52 ++-------------------------------
 7 files changed, 62 insertions(+), 198 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 4ba22323dbf9..691ee0c4ef87 100644
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
@@ -1883,6 +1925,7 @@ struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
 	INIT_WORK(&ucsi->resume_work, ucsi_resume_work);
 	INIT_DELAYED_WORK(&ucsi->work, ucsi_init_work);
 	mutex_init(&ucsi->ppm_lock);
+	init_completion(&ucsi->complete);
 	ucsi->dev = dev;
 	ucsi->ops = ops;
 
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 0cf550cc9b5d..676fa9db9ba8 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -4,6 +4,7 @@
 #define __DRIVER_USB_TYPEC_UCSI_H
 
 #include <linux/bitops.h>
+#include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/power_supply.h>
 #include <linux/types.h>
@@ -420,6 +421,9 @@ struct ucsi {
 	/* PPM communication flags */
 	unsigned long flags;
 #define EVENT_PENDING	0
+#define COMMAND_PENDING	1
+#define ACK_PENDING	2
+	struct completion complete;
 
 	unsigned long quirks;
 #define UCSI_NO_PARTNER_PDOS	BIT(0)	/* Don't read partner's PDOs */
@@ -484,6 +488,9 @@ int ucsi_send_command(struct ucsi *ucsi, u64 command,
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
index 62a3a192e076..57bc9540fc36 100644
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
index 14737ca3724c..d948c3f579e1 100644
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
-#define ACK_PENDING	2
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
diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 95a333ad5496..f3a5e24ea84d 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -20,10 +20,6 @@ struct yoga_c630_ucsi {
 	struct yoga_c630_ec *ec;
 	struct ucsi *ucsi;
 	struct notifier_block nb;
-	struct completion complete;
-	unsigned long flags;
-#define UCSI_C630_COMMAND_PENDING	0
-#define UCSI_C630_ACK_PENDING		1
 	u16 version;
 };
 
@@ -75,57 +71,14 @@ static int yoga_c630_ucsi_async_control(struct ucsi *ucsi, u64 command)
 	return yoga_c630_ec_ucsi_write(uec->ec, (u8*)&command);
 }
 
-static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi, u64 command)
-{
-	struct yoga_c630_ucsi *uec = ucsi_get_drvdata(ucsi);
-	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
-	int ret;
-
-	if (ack)
-		set_bit(UCSI_C630_ACK_PENDING, &uec->flags);
-	else
-		set_bit(UCSI_C630_COMMAND_PENDING, &uec->flags);
-
-	reinit_completion(&uec->complete);
-
-	ret = yoga_c630_ucsi_async_control(ucsi, command);
-	if (ret)
-		goto out_clear_bit;
-
-	if (!wait_for_completion_timeout(&uec->complete, 5 * HZ))
-		ret = -ETIMEDOUT;
-
-out_clear_bit:
-	if (ack)
-		clear_bit(UCSI_C630_ACK_PENDING, &uec->flags);
-	else
-		clear_bit(UCSI_C630_COMMAND_PENDING, &uec->flags);
-
-	return ret;
-}
-
 const struct ucsi_operations yoga_c630_ucsi_ops = {
 	.read_version = yoga_c630_ucsi_read_version,
 	.read_cci = yoga_c630_ucsi_read_cci,
 	.read_message_in = yoga_c630_ucsi_read_message_in,
-	.sync_control = yoga_c630_ucsi_sync_control,
+	.sync_control = ucsi_sync_control_common,
 	.async_control = yoga_c630_ucsi_async_control,
 };
 
-static void yoga_c630_ucsi_notify_ucsi(struct yoga_c630_ucsi *uec, u32 cci)
-{
-	if (UCSI_CCI_CONNECTOR(cci))
-		ucsi_connector_change(uec->ucsi, UCSI_CCI_CONNECTOR(cci));
-
-	if (cci & UCSI_CCI_ACK_COMPLETE &&
-	    test_bit(UCSI_C630_ACK_PENDING, &uec->flags))
-		complete(&uec->complete);
-
-	if (cci & UCSI_CCI_COMMAND_COMPLETE &&
-	    test_bit(UCSI_C630_COMMAND_PENDING, &uec->flags))
-		complete(&uec->complete);
-}
-
 static int yoga_c630_ucsi_notify(struct notifier_block *nb,
 				 unsigned long action, void *data)
 {
@@ -144,7 +97,7 @@ static int yoga_c630_ucsi_notify(struct notifier_block *nb,
 		if (ret)
 			return NOTIFY_DONE;
 
-		yoga_c630_ucsi_notify_ucsi(uec, cci);
+		ucsi_notify_common(uec->ucsi, cci);
 
 		return NOTIFY_OK;
 
@@ -165,7 +118,6 @@ static int yoga_c630_ucsi_probe(struct auxiliary_device *adev,
 		return -ENOMEM;
 
 	uec->ec = ec;
-	init_completion(&uec->complete);
 	uec->nb.notifier_call = yoga_c630_ucsi_notify;
 
 	uec->ucsi = ucsi_create(&adev->dev, &yoga_c630_ucsi_ops);

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
