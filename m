Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3499D8D7908
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 01:25:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6B59C7129F;
	Sun,  2 Jun 2024 23:25:05 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E27EDC6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Jun 2024 23:24:59 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52b992fd796so532676e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Jun 2024 16:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717370698; x=1717975498;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vehF8oKD1FhtE9feRp5zr7W3EX4UPLlYPHbRSRvEcqw=;
 b=oHY3EqXiekSjhKpEmFA7O4bowRlwvJ6bLB7gtYEE4TmLHGrFKvh2oKbjyeoGatsaJD
 7wnLuEPDzTQgVosT2Yq5jLrX/wf1pMAlKc/BpfOkqVZbKKH0NNnxr33w4ShEpgkJnTD2
 WQo1FJsdOmAnY9J0YeTPMH6PPjPI+SWL5QH2MmdDcVSiVuLDlSftgyZZSOqk2hWBegdL
 XVC+KEJH/ccyjMHQRGwt/oY8clxumw5hAMntkNG3y6OINqjAFaIeECe2n80IFxHAanSa
 B07GzfeSPz2iDwVHdjmrd15Ubc0H4pdVruq8MBcpDde+eIkKwhnUGrjjk8V7twEmhjoE
 cMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717370698; x=1717975498;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vehF8oKD1FhtE9feRp5zr7W3EX4UPLlYPHbRSRvEcqw=;
 b=LGog6p8NFH+lR/8hQ1VyiNBe6KwfgFlI4q+3AGDFfdZKCXAPb5Ud5LTjOcEIufzo+s
 o/bk9SRbiLaw3x6yFBOBVXWSM92B1ujFyXwde50oEa7RWUM9IqH9e0gDxgQ2p8DcPj14
 vNYvwbRMEnjT2vIWrxtdhsYaU7Sci2Dz8FUPuE6tnUOHuSB95syAjF4DaHDyAB8AWoml
 863euiVyPQDl0s/uWbUh6tSvFYT72d3s0YULtXV/N89VsZBt63IZX5arom60T2pEU/K1
 gEIXEzv4+XjLYxjMX0VlWjST1gy6ItnwmdaoMwYqs2L+KiWydk50gfSYII/KbtJuafnm
 Y+Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+oAXk+0zTvLSsPwckluMyybaYriucPEnZ0mQit6twzw6KeaatfxapE5h7Bi0Fe5d7NbVwqTcxGSiaDBXlMZ7N3v6YW24DjqMrbE4/C6mnxC/n0Rxbsvp0
X-Gm-Message-State: AOJu0YxPCY9V2Ee0kXBuxSV1Dcn9q67p2833ZnoxovrAT6+esoR0T74Y
 Z9YYYV0tzZC1SRN3YN0jd02n+b3s7Hq8bybfAl3Sj4hSmiGyC9vbZuZnyY6xEgo=
X-Google-Smtp-Source: AGHT+IHEYyxLjKGI4/aduNv7WoI4hAskzxqmMj+bh4agJWyuOSeELf3fC6jtRbYSOCpnJ8PVUxaizQ==
X-Received: by 2002:ac2:5a4c:0:b0:523:294f:7fe6 with SMTP id
 2adb3069b0e04-52b8970bf73mr4765319e87.44.1717370698240; 
 Sun, 02 Jun 2024 16:24:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b959008aasm392369e87.269.2024.06.02.16.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 16:24:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 02:24:55 +0300
MIME-Version: 1.0
Message-Id: <20240603-ucsi-rework-interface-v1-2-99a6d544cec8@linaro.org>
References: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
In-Reply-To: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14289;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FBcTYsqPsFc93PcwEeFHfR5zjPtqmb2eWpdZiIr3dx8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXP9HpZmNsITXLReSiYqcvni6cvSi0MzwbZU9e
 a8wO2rGeHmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlz/RwAKCRCLPIo+Aiko
 1eiIB/9xyW6Xoy5tHiGAFg2QRyFUjGQZVSDU8ucyU9RN8Svw9k/JkCRTpWhJTXSg5VEW1Wgld3X
 1Y6tu/FWZg29MKsZdhEHHwWI+LPQoMgso7QLU3cx2h1O03UglZmc189693E0mao6wv8i6mZo+sv
 2ycbZCEYWA/xToPgXnvT/NzkraOvbtt2JOXT/704hoY6Dyke7JKB5spgHGL0gkM/LGFbQ0VSpcS
 G2daguTxfiIKsiDKGe+zm5za5HEbvItr9kAHmmRTtEEADA0mFb8gOcoRfsfYuMBBDIqZ3jgECN5
 uJ+tNo6kDswVGrMAeQbFL6YmEjKmeIW3VI2DZkmPuicIy1Lf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 2/7] usb: typec: ucsi: simplify command
	sending API
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

The sync_write and async_write are used only for writing UCSI commands
to the UCSI_CONTROL offsets. Rename sync_write and async_write
operations to sync_control and async_control accordingly. Drop the
offset and length fields and pass u64 command instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c         | 18 +++++++-----------
 drivers/usb/typec/ucsi/ucsi.h         | 10 ++++------
 drivers/usb/typec/ucsi/ucsi_acpi.c    | 22 ++++++++++------------
 drivers/usb/typec/ucsi/ucsi_ccg.c     | 34 +++++++++++++++-------------------
 drivers/usb/typec/ucsi/ucsi_glink.c   | 14 ++++++--------
 drivers/usb/typec/ucsi/ucsi_stm32g0.c | 24 +++++++++++-------------
 6 files changed, 53 insertions(+), 69 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 953196ca35a3..f58908a76e1d 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -60,7 +60,7 @@ static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 		ctrl |= UCSI_ACK_CONNECTOR_CHANGE;
 	}
 
-	return ucsi->ops->sync_write(ucsi, UCSI_CONTROL, &ctrl, sizeof(ctrl));
+	return ucsi->ops->sync_control(ucsi, ctrl);
 }
 
 static int ucsi_exec_command(struct ucsi *ucsi, u64 command);
@@ -126,7 +126,7 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 	u32 cci;
 	int ret;
 
-	ret = ucsi->ops->sync_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
+	ret = ucsi->ops->sync_control(ucsi, cmd);
 	if (ret)
 		return ret;
 
@@ -1306,8 +1306,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 	 */
 	if (cci & UCSI_CCI_RESET_COMPLETE) {
 		command = UCSI_SET_NOTIFICATION_ENABLE;
-		ret = ucsi->ops->async_write(ucsi, UCSI_CONTROL, &command,
-					     sizeof(command));
+		ret = ucsi->ops->async_control(ucsi, command);
 		if (ret < 0)
 			goto out;
 
@@ -1328,8 +1327,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 	}
 
 	command = UCSI_PPM_RESET;
-	ret = ucsi->ops->async_write(ucsi, UCSI_CONTROL, &command,
-				     sizeof(command));
+	ret = ucsi->ops->async_control(ucsi, command);
 	if (ret < 0)
 		goto out;
 
@@ -1350,9 +1348,7 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 
 		/* If the PPM is still doing something else, reset it again. */
 		if (cci & ~UCSI_CCI_RESET_COMPLETE) {
-			ret = ucsi->ops->async_write(ucsi, UCSI_CONTROL,
-						     &command,
-						     sizeof(command));
+			ret = ucsi->ops->async_control(ucsi, command);
 			if (ret < 0)
 				goto out;
 		}
@@ -1863,7 +1859,7 @@ struct ucsi *ucsi_create(struct device *dev, const struct ucsi_operations *ops)
 {
 	struct ucsi *ucsi;
 
-	if (!ops || !ops->read || !ops->sync_write || !ops->async_write)
+	if (!ops || !ops->read || !ops->sync_control || !ops->async_control)
 		return ERR_PTR(-EINVAL);
 
 	ucsi = kzalloc(sizeof(*ucsi), GFP_KERNEL);
@@ -1939,7 +1935,7 @@ void ucsi_unregister(struct ucsi *ucsi)
 	cancel_work_sync(&ucsi->resume_work);
 
 	/* Disable notifications */
-	ucsi->ops->async_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
+	ucsi->ops->async_control(ucsi, cmd);
 
 	if (!ucsi->connector)
 		return;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index c4d103db9d0f..94ea54d3d47d 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -57,8 +57,8 @@ struct dentry;
 /**
  * struct ucsi_operations - UCSI I/O operations
  * @read: Read operation
- * @sync_write: Blocking write operation
- * @async_write: Non-blocking write operation
+ * @sync_control: Blocking control operation
+ * @async_control: Non-blocking control operation
  * @update_altmodes: Squashes duplicate DP altmodes
  * @update_connector: Update connector capabilities before registering
  * @connector_status: Updates connector status, called holding connector lock
@@ -70,10 +70,8 @@ struct dentry;
 struct ucsi_operations {
 	int (*read)(struct ucsi *ucsi, unsigned int offset,
 		    void *val, size_t val_len);
-	int (*sync_write)(struct ucsi *ucsi, unsigned int offset,
-			  const void *val, size_t val_len);
-	int (*async_write)(struct ucsi *ucsi, unsigned int offset,
-			   const void *val, size_t val_len);
+	int (*sync_control)(struct ucsi *ucsi, u64 command);
+	int (*async_control)(struct ucsi *ucsi, u64 command);
 	bool (*update_altmodes)(struct ucsi *ucsi, struct ucsi_altmode *orig,
 				struct ucsi_altmode *updated);
 	void (*update_connector)(struct ucsi_connector *con);
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 8d112c3edae5..feccbfc8acbe 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -60,22 +60,20 @@ static int ucsi_acpi_read(struct ucsi *ucsi, unsigned int offset,
 	return 0;
 }
 
-static int ucsi_acpi_async_write(struct ucsi *ucsi, unsigned int offset,
-				 const void *val, size_t val_len)
+static int ucsi_acpi_async_control(struct ucsi *ucsi, u64 command)
 {
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
 
-	memcpy(ua->base + offset, val, val_len);
-	ua->cmd = *(u64 *)val;
+	memcpy(ua->base + UCSI_CONTROL, &command, sizeof(command));
+	ua->cmd = command;
 
 	return ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_WRITE);
 }
 
-static int ucsi_acpi_sync_write(struct ucsi *ucsi, unsigned int offset,
-				const void *val, size_t val_len)
+static int ucsi_acpi_sync_control(struct ucsi *ucsi, u64 command)
 {
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
-	bool ack = UCSI_COMMAND(*(u64 *)val) == UCSI_ACK_CC_CI;
+	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
 	int ret;
 
 	if (ack)
@@ -83,7 +81,7 @@ static int ucsi_acpi_sync_write(struct ucsi *ucsi, unsigned int offset,
 	else
 		set_bit(UCSI_ACPI_COMMAND_PENDING, &ua->flags);
 
-	ret = ucsi_acpi_async_write(ucsi, offset, val, val_len);
+	ret = ucsi_acpi_async_control(ucsi, command);
 	if (ret)
 		goto out_clear_bit;
 
@@ -101,8 +99,8 @@ static int ucsi_acpi_sync_write(struct ucsi *ucsi, unsigned int offset,
 
 static const struct ucsi_operations ucsi_acpi_ops = {
 	.read = ucsi_acpi_read,
-	.sync_write = ucsi_acpi_sync_write,
-	.async_write = ucsi_acpi_async_write
+	.sync_control = ucsi_acpi_sync_control,
+	.async_control = ucsi_acpi_async_control
 };
 
 static int
@@ -124,8 +122,8 @@ ucsi_zenbook_read(struct ucsi *ucsi, unsigned int offset, void *val, size_t val_
 
 static const struct ucsi_operations ucsi_zenbook_ops = {
 	.read = ucsi_zenbook_read,
-	.sync_write = ucsi_acpi_sync_write,
-	.async_write = ucsi_acpi_async_write
+	.sync_control = ucsi_acpi_sync_control,
+	.async_control = ucsi_acpi_async_control
 };
 
 static const struct dmi_system_id ucsi_acpi_quirks[] = {
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index dda7c7c94e08..76b39bb9762d 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -610,25 +610,23 @@ static int ucsi_ccg_read(struct ucsi *ucsi, unsigned int offset,
 	return ret;
 }
 
-static int ucsi_ccg_async_write(struct ucsi *ucsi, unsigned int offset,
-				const void *val, size_t val_len)
+static int ucsi_ccg_async_control(struct ucsi *ucsi, u64 command)
 {
 	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
-	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(offset);
+	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(UCSI_CONTROL);
 
 	/*
-	 * UCSI may read CCI instantly after async_write,
+	 * UCSI may read CCI instantly after async_control,
 	 * clear CCI to avoid caller getting wrong data before we get CCI from ISR
 	 */
 	spin_lock(&uc->op_lock);
 	uc->op_data.cci = 0;
 	spin_unlock(&uc->op_lock);
 
-	return ccg_write(uc, reg, val, val_len);
+	return ccg_write(uc, reg, (u8 *)&command, sizeof(command));
 }
 
-static int ucsi_ccg_sync_write(struct ucsi *ucsi, unsigned int offset,
-			       const void *val, size_t val_len)
+static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
 {
 	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
 	struct ucsi_connector *con;
@@ -639,19 +637,17 @@ static int ucsi_ccg_sync_write(struct ucsi *ucsi, unsigned int offset,
 	pm_runtime_get_sync(uc->dev);
 	set_bit(DEV_CMD_PENDING, &uc->flags);
 
-	if (offset == UCSI_CONTROL && val_len == sizeof(uc->last_cmd_sent)) {
-		uc->last_cmd_sent = *(u64 *)val;
+	uc->last_cmd_sent = command;
 
-		if (UCSI_COMMAND(uc->last_cmd_sent) == UCSI_SET_NEW_CAM &&
-		    uc->has_multiple_dp) {
-			con_index = (uc->last_cmd_sent >> 16) &
-				    UCSI_CMD_CONNECTOR_MASK;
-			con = &uc->ucsi->connector[con_index - 1];
-			ucsi_ccg_update_set_new_cam_cmd(uc, con, (u64 *)val);
-		}
+	if (UCSI_COMMAND(uc->last_cmd_sent) == UCSI_SET_NEW_CAM &&
+	    uc->has_multiple_dp) {
+		con_index = (uc->last_cmd_sent >> 16) &
+			UCSI_CMD_CONNECTOR_MASK;
+		con = &uc->ucsi->connector[con_index - 1];
+		ucsi_ccg_update_set_new_cam_cmd(uc, con, &command);
 	}
 
-	ret = ucsi_ccg_async_write(ucsi, offset, val, val_len);
+	ret = ucsi_ccg_async_control(ucsi, command);
 	if (ret)
 		goto err_clear_bit;
 
@@ -668,8 +664,8 @@ static int ucsi_ccg_sync_write(struct ucsi *ucsi, unsigned int offset,
 
 static const struct ucsi_operations ucsi_ccg_ops = {
 	.read = ucsi_ccg_read,
-	.sync_write = ucsi_ccg_sync_write,
-	.async_write = ucsi_ccg_async_write,
+	.sync_control = ucsi_ccg_sync_control,
+	.async_control = ucsi_ccg_async_control,
 	.update_altmodes = ucsi_ccg_update_altmodes
 };
 
diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index f7546bb488c3..047998f33274 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -143,21 +143,19 @@ static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned i
 	return 0;
 }
 
-static int pmic_glink_ucsi_async_write(struct ucsi *__ucsi, unsigned int offset,
-				       const void *val, size_t val_len)
+static int pmic_glink_ucsi_async_control(struct ucsi *__ucsi, u64 command)
 {
 	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(__ucsi);
 	int ret;
 
 	mutex_lock(&ucsi->lock);
-	ret = pmic_glink_ucsi_locked_write(ucsi, offset, val, val_len);
+	ret = pmic_glink_ucsi_locked_write(ucsi, UCSI_CONTROL, &command, sizeof(command));
 	mutex_unlock(&ucsi->lock);
 
 	return ret;
 }
 
-static int pmic_glink_ucsi_sync_write(struct ucsi *__ucsi, unsigned int offset,
-				      const void *val, size_t val_len)
+static int pmic_glink_ucsi_sync_control(struct ucsi *__ucsi, u64 command)
 {
 	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(__ucsi);
 	unsigned long left;
@@ -169,7 +167,7 @@ static int pmic_glink_ucsi_sync_write(struct ucsi *__ucsi, unsigned int offset,
 	ucsi->sync_val = 0;
 	reinit_completion(&ucsi->sync_ack);
 	ucsi->sync_pending = true;
-	ret = pmic_glink_ucsi_locked_write(ucsi, offset, val, val_len);
+	ret = pmic_glink_ucsi_locked_write(ucsi, UCSI_CONTROL, &command, sizeof(command));
 	mutex_unlock(&ucsi->lock);
 
 	left = wait_for_completion_timeout(&ucsi->sync_ack, 5 * HZ);
@@ -217,8 +215,8 @@ static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
 
 static const struct ucsi_operations pmic_glink_ucsi_ops = {
 	.read = pmic_glink_ucsi_read,
-	.sync_write = pmic_glink_ucsi_sync_write,
-	.async_write = pmic_glink_ucsi_async_write,
+	.sync_control = pmic_glink_ucsi_sync_control,
+	.async_control = pmic_glink_ucsi_async_control,
 	.update_connector = pmic_glink_ucsi_update_connector,
 	.connector_status = pmic_glink_ucsi_connector_status,
 };
diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
index 9b2af32b7874..f97dc5a075e2 100644
--- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
+++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
@@ -359,8 +359,7 @@ static int ucsi_stm32g0_read(struct ucsi *ucsi, unsigned int offset, void *val,
 	return 0;
 }
 
-static int ucsi_stm32g0_async_write(struct ucsi *ucsi, unsigned int offset, const void *val,
-				    size_t len)
+static int ucsi_stm32g0_async_control(struct ucsi *ucsi, u64 command)
 {
 	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
 	struct i2c_client *client = g0->client;
@@ -373,19 +372,19 @@ static int ucsi_stm32g0_async_write(struct ucsi *ucsi, unsigned int offset, cons
 	unsigned char *buf;
 	int ret;
 
-	buf = kmalloc(len + 1, GFP_KERNEL);
+	buf = kmalloc(sizeof(command) + 1, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
-	buf[0] = offset;
-	memcpy(&buf[1], val, len);
-	msg[0].len = len + 1;
+	buf[0] = UCSI_CONTROL;
+	memcpy(&buf[1], &command, sizeof(command));
+	msg[0].len = sizeof(command) + 1;
 	msg[0].buf = buf;
 
 	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
 	kfree(buf);
 	if (ret != ARRAY_SIZE(msg)) {
-		dev_err(g0->dev, "i2c write %02x, %02x error: %d\n", client->addr, offset, ret);
+		dev_err(g0->dev, "i2c write %02x, %02x error: %d\n", client->addr, UCSI_CONTROL, ret);
 
 		return ret < 0 ? ret : -EIO;
 	}
@@ -393,11 +392,10 @@ static int ucsi_stm32g0_async_write(struct ucsi *ucsi, unsigned int offset, cons
 	return 0;
 }
 
-static int ucsi_stm32g0_sync_write(struct ucsi *ucsi, unsigned int offset, const void *val,
-				   size_t len)
+static int ucsi_stm32g0_sync_control(struct ucsi *ucsi, u64 command)
 {
 	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
-	bool ack = UCSI_COMMAND(*(u64 *)val) == UCSI_ACK_CC_CI;
+	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
 	int ret;
 
 	if (ack)
@@ -405,7 +403,7 @@ static int ucsi_stm32g0_sync_write(struct ucsi *ucsi, unsigned int offset, const
 	else
 		set_bit(COMMAND_PENDING, &g0->flags);
 
-	ret = ucsi_stm32g0_async_write(ucsi, offset, val, len);
+	ret = ucsi_stm32g0_async_control(ucsi, command);
 	if (ret)
 		goto out_clear_bit;
 
@@ -449,8 +447,8 @@ static irqreturn_t ucsi_stm32g0_irq_handler(int irq, void *data)
 
 static const struct ucsi_operations ucsi_stm32g0_ops = {
 	.read = ucsi_stm32g0_read,
-	.sync_write = ucsi_stm32g0_sync_write,
-	.async_write = ucsi_stm32g0_async_write,
+	.sync_control = ucsi_stm32g0_sync_control,
+	.async_control = ucsi_stm32g0_async_control,
 };
 
 static int ucsi_stm32g0_register(struct ucsi *ucsi)

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
