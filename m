Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AC091A978
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 16:44:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53F22C78012;
	Thu, 27 Jun 2024 14:44:53 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7534C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 14:44:47 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ec0f3b9cfeso96171911fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 07:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719499487; x=1720104287;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Pv3PctyJy2SnI13bqUyVzb7EmYqWrJDar658iy+XONk=;
 b=wgkUil9BLmcCIpTwvirTKBDsNDdVDrRxZFcT6stnTdu0MERlrt9sCWYUiwmsNsfNef
 CMpqfnwu3hG10XZDi9iS1x4fL2EM/smarEaQKxlwJ5aqbQY7U2CNCs5wBIV9uRdTdSDi
 3qm7vuTf0x/+b2Hy0DU2thSpHG7eyZDoAIKpOUa5KU4Ag31cgDPzXMU14yByyR8WYVhc
 CE41C6DttdPW3eVuqGO8rYCzyjcGTEqx4qRs8SDU3CQ/Qr9d3k7fwCPUSJbuzDkUQz2b
 dYebGe69JWtsRQT8pcMS9uaBNBaWbQevfWaxK844daKuEVBfd7jmBPUSJ47+kdDqKoqE
 5vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719499487; x=1720104287;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pv3PctyJy2SnI13bqUyVzb7EmYqWrJDar658iy+XONk=;
 b=BCTPBBDt3e828MJVrBr1oszLQwTd1LdITzOby6OLP5cp2N1ekcxuZ4Zm1TA4xKVLAd
 BDFCrDSaxrYItS3KhJ2ULEOK8G8vjs/4i/KFtsksWjN93icLmRzSq1EMwdDubiYaQ1HT
 Im4R4/cjWF0vEk/xK50tHS3cLg/u2Japo7eQN/6aBajmb6Vz3+ViclFilLWdJykG6x37
 8r51EIBMj31AVrw17pvUH7RqH52wsm6Mat1pEvZra1bYhYB4mzleDKp4RIWwsAkZDLXf
 X8ipndUQgRvj2DRF7y7KEhyECyvdGmDDMLA/VAGx11fYCHZVPIUxpsZ4PynpCRCwdFWd
 eYWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX03JqmsJrxDlXPjrknG8unGM6F6OHtth+/ptwbAYfNXM7g0b/u8EKrT729bUXfX/9YewBpO0+epN+dlA+EyR/xiYbYzEYv6SIbIt91P9go0nnEgM65XJo
X-Gm-Message-State: AOJu0YysbmTC/2NLg+mOB9KxK/eWBggSRTBTfMRHc1ByfrAuqoQsB52U
 rldrS9yedn0ZMRgTEneShsWZqrJfa7EOF4FUckutoAHUglcN74jCMJag7UrZY40=
X-Google-Smtp-Source: AGHT+IGyKCad0pTtyjWDWYT4auTNDLJlAquHp5LlnqVILjGBHWKp/6jvkXxkAFrJTEFJQT7zvH22Gw==
X-Received: by 2002:a2e:b004:0:b0:2eb:ebcd:fc1c with SMTP id
 38308e7fff4ca-2ec594034bbmr78292621fa.26.1719499486745; 
 Thu, 27 Jun 2024 07:44:46 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a34447fsm2775911fa.11.2024.06.27.07.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 07:44:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 17:44:43 +0300
MIME-Version: 1.0
Message-Id: <20240627-ucsi-rework-interface-v4-4-289ddc6874c7@linaro.org>
References: <20240627-ucsi-rework-interface-v4-0-289ddc6874c7@linaro.org>
In-Reply-To: <20240627-ucsi-rework-interface-v4-0-289ddc6874c7@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4910;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=IUlRPLcwpNg8JnyGbOvllbRci0dly68y4uffDqgWHcE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfXrZU2jPKiwjQP35+8I88ou3BxaPfkpg4PJJq
 onR4FOLWHaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZn162QAKCRCLPIo+Aiko
 1cBnB/sEp9lqE76ma6UnCY7LbhqliIuPkO9FULEW8UHfMI5X8F+JdTgWpedlAKFdYNxEK48AiL5
 xytAUgkAj6ceGwOp0xx/JTMBPfGy/LNlBQVvbzU1YiRjUr+lbg6H1lI80C5VvdijDo+1hnCNQRV
 ecEYU8muhwSmRAj0FR1SIQ10cp13vLbTdEse+BDcmnHMwMh41KT4DknuX3Pfkler5ez4oOucu5o
 R/9mtPjhNSLk1SkyMDxYrJIC7Tq8ds8MBqBFTnWBzsHJ3CG9sS0o7HlCr6Wj78lqxsWVId+Mv73
 RrG8rgRv1c9gmbcNJ99Kk8jsDbZtPmbx4tG9QhqGFKT7lSTU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 4/7] usb: typec: ucsi: rework command
 execution functions
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

Rework command execution code to remove recursive calls of
ucsi_exec_command. This also streamlines the sync_control / read(CCI)
read (MESSAGE_IN) sequence, allowing further rework of the command code.

Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 138 ++++++++++++++++++++----------------------
 1 file changed, 66 insertions(+), 72 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 17d12c1872f6..10a8fe893333 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -63,27 +63,76 @@ static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 	return ucsi->ops->sync_control(ucsi, ctrl);
 }
 
-static int ucsi_exec_command(struct ucsi *ucsi, u64 command);
+static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
+			    void *data, size_t size, bool conn_ack)
+{
+	int ret;
+
+	*cci = 0;
+
+	ret = ucsi->ops->sync_control(ucsi, command);
+	if (ret)
+		return ret;
+
+	ret = ucsi->ops->read_cci(ucsi, cci);
+	if (ret)
+		return ret;
+
+	if (*cci & UCSI_CCI_BUSY)
+		return -EBUSY;
+
+	if (!(*cci & UCSI_CCI_COMMAND_COMPLETE))
+		return -EIO;
+
+	if (*cci & UCSI_CCI_NOT_SUPPORTED) {
+		if (ucsi_acknowledge(ucsi, false) < 0)
+			dev_err(ucsi->dev,
+				"ACK of unsupported command failed\n");
+		return -EOPNOTSUPP;
+	}
+
+	if (*cci & UCSI_CCI_ERROR) {
+		/* Acknowledge the command that failed */
+		ret = ucsi_acknowledge(ucsi, false);
+		return ret ? ret : -EIO;
+	}
+
+	if (data) {
+		ret = ucsi_read_message_in(ucsi, data, size);
+		if (ret)
+			return ret;
+	}
+
+	ret = ucsi_acknowledge(ucsi, conn_ack);
+	if (ret)
+		return ret;
+
+	return 0;
+}
 
 static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
 {
 	u64 command;
 	u16 error;
+	u32 cci;
 	int ret;
 
 	command = UCSI_GET_ERROR_STATUS | UCSI_CONNECTOR_NUMBER(connector_num);
-	ret = ucsi_exec_command(ucsi, command);
-	if (ret < 0)
-		return ret;
+	ret = ucsi_run_command(ucsi, command, &cci,
+			       &error, sizeof(error), false);
 
-	ret = ucsi_read_message_in(ucsi, &error, sizeof(error));
-	if (ret)
-		return ret;
+	if (cci & UCSI_CCI_BUSY) {
+		ret = ucsi_run_command(ucsi, UCSI_CANCEL, &cci, NULL, 0, false);
 
-	ret = ucsi_acknowledge(ucsi, false);
-	if (ret)
+		return ret ? ret : -EBUSY;
+	}
+
+	if (ret < 0)
 		return ret;
 
+	if (cci & UCSI_CCI_ERROR)
+		return -EIO;
+
 	switch (error) {
 	case UCSI_ERROR_INCOMPATIBLE_PARTNER:
 		return -EOPNOTSUPP;
@@ -129,7 +178,8 @@ static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
 	return -EIO;
 }
 
-static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
+static int ucsi_send_command_common(struct ucsi *ucsi, u64 cmd,
+				    void *data, size_t size, bool conn_ack)
 {
 	u8 connector_num;
 	u32 cci;
@@ -155,73 +205,17 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 		connector_num = 0;
 	}
 
-	ret = ucsi->ops->sync_control(ucsi, cmd);
-	if (ret)
-		return ret;
-
-	ret = ucsi->ops->read_cci(ucsi, &cci);
-	if (ret)
-		return ret;
-
-	if (cmd != UCSI_CANCEL && cci & UCSI_CCI_BUSY)
-		return ucsi_exec_command(ucsi, UCSI_CANCEL);
-
-	if (!(cci & UCSI_CCI_COMMAND_COMPLETE))
-		return -EIO;
-
-	if (cci & UCSI_CCI_NOT_SUPPORTED) {
-		if (ucsi_acknowledge(ucsi, false) < 0)
-			dev_err(ucsi->dev,
-				"ACK of unsupported command failed\n");
-		return -EOPNOTSUPP;
-	}
-
-	if (cci & UCSI_CCI_ERROR) {
-		/* Acknowledge the command that failed */
-		ret = ucsi_acknowledge(ucsi, false);
-		if (ret)
-			return ret;
-
-		if (cmd == UCSI_GET_ERROR_STATUS)
-			return -EIO;
-
-		return ucsi_read_error(ucsi, connector_num);
-	}
-
-	if (cmd == UCSI_CANCEL && cci & UCSI_CCI_CANCEL_COMPLETE) {
-		ret = ucsi_acknowledge(ucsi, false);
-		return ret ? ret : -EBUSY;
-	}
-
-	return UCSI_CCI_LENGTH(cci);
-}
-
-static int ucsi_send_command_common(struct ucsi *ucsi, u64 command,
-				    void *data, size_t size, bool conn_ack)
-{
-	u8 length;
-	int ret;
-
 	mutex_lock(&ucsi->ppm_lock);
 
-	ret = ucsi_exec_command(ucsi, command);
-	if (ret < 0)
-		goto out;
-
-	length = ret;
-
-	if (data) {
-		ret = ucsi_read_message_in(ucsi, data, size);
-		if (ret)
-			goto out;
+	ret = ucsi_run_command(ucsi, cmd, &cci, data, size, conn_ack);
+	if (cci & UCSI_CCI_BUSY) {
+		ret = ucsi_run_command(ucsi, UCSI_CANCEL, &cci, NULL, 0, false);
+		return ret ? ret : -EBUSY;
 	}
 
-	ret = ucsi_acknowledge(ucsi, conn_ack);
-	if (ret)
-		goto out;
+	if (cci & UCSI_CCI_ERROR)
+		return ucsi_read_error(ucsi, connector_num);
 
-	ret = length;
-out:
 	mutex_unlock(&ucsi->ppm_lock);
 	return ret;
 }

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
