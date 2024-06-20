Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACB7911600
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 00:55:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D493C78016;
	Thu, 20 Jun 2024 22:55:32 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 360FFC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 22:55:28 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ec10324791so15746581fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 15:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718924128; x=1719528928;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IR6olVBcDJAiFqvRlmHubkR26Doy6VX5UC/TUKocw0g=;
 b=BST3TVK3F75JQ7OCE8ALYgR+DyAASxJsLxxI393o/NbIDDrPkDP9T77hf0OZ4/YmgF
 PoQNC6uYQ5GNodgrUZMC7TQkQge9YiYecr/Xkn1pCkn/Mm2B7mZR3vsDEB6LIKoAWE3I
 hddMhNyO2zDdC14pCrIMkNuQ+bzXERuD9fKoKk2tHQNeHlEbSpmSmli7V29sYxyD+hde
 abu4y9U7C2sROmgYs0bdSfx7yEqC3cyG4T5HauWH4kM5FdplBr+AUfxkVLioF5SOzsjP
 aWnh7Mbp0xFR3G5Fs29xm7reuK1O/sllGxhESQDjOMXWQDmIaRFzd+UzNUrxqgsqhscX
 m5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718924128; x=1719528928;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IR6olVBcDJAiFqvRlmHubkR26Doy6VX5UC/TUKocw0g=;
 b=IIw2xpou1sb7P/3my+FGZQOQFjLn2z/hom7TJGMcvqZlWr+4R5CNlrCvQXcr3556Dw
 QhaEQxSquqdZGhtyOsUFf4qgIMcLGAbT9FjtvajdrPfS32ONsbEIwgWRU+TCMn6KPHv+
 tZKixePG8K2SrSm+/WUu70tIHeHV6gYPg3T/Ap83wEmwnnri8IWGfH1r+JjKTE5Y+wcM
 kFsLPNZBluoSUDSWVsBDluKty0ATiJ4UHj9zeCcfF5yCxfSWi+xA74SE6AyFf2VtYdcP
 ZOdkeRLqcqiU6QaE92BtnTVy9JDWn2uVIhxuwjFXOZvR2MlvxgdH9ju9mFgVfKOTMYZO
 y+Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyRkIn7dGjQM2FgRDjUD7WEmLEwCSuz2WNs0XT8d+vaWWdo8lfOaYmG+KZY66h/SI0YzW3PAzdHMoBCWi1lDOgTtnaaAgEWPqjJLieMrx8DpbpBIZ0uoTf
X-Gm-Message-State: AOJu0Yzs8/Rqi+/qyFUO8dO2Q6pi5I5q0dPrE5VYBTv5bOpxw2cnkbM9
 K8ZcTPXT5WEwpMxYyKIfF+FufmhVEprXfe6MFncystZM0Scv1hIrOtuJwYCallNA6CTppz+7qy6
 Upig=
X-Google-Smtp-Source: AGHT+IHoxm/6bBTyOgi+zBFIRiNRkYizZyitnEFBjNxxc70xWD6BEN8Wul1ZDUIcnnkKkMaGcgzZdA==
X-Received: by 2002:a05:651c:b26:b0:2ec:4086:ea6d with SMTP id
 38308e7fff4ca-2ec4086ec1emr49099931fa.4.1718924127943; 
 Thu, 20 Jun 2024 15:55:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d60126fsm510461fa.20.2024.06.20.15.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 15:55:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Jun 2024 01:55:26 +0300
MIME-Version: 1.0
Message-Id: <20240621-ucsi-rework-interface-v2-7-a399ff96bf88@linaro.org>
References: <20240621-ucsi-rework-interface-v2-0-a399ff96bf88@linaro.org>
In-Reply-To: <20240621-ucsi-rework-interface-v2-0-a399ff96bf88@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2070;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LOWb+Vw9/QmbxNoLHa2MHXOU60Fguix3lqbyVHzGXkk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmdLNaauNrup2m6YbsM/7Td6FdrCda5Pnyu6yKM
 KQfN812DcyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnSzWgAKCRCLPIo+Aiko
 1WJVCACp9pu/iAzSt7ocCbeRjeF2QNEs+jrrsHD/b2EUMTwZj+CrEmvEUlQDxQXC7zXAd2CyulU
 2CHiKhJzIcdW+ivIcX1VN4T+ZHDRrmbijLRu1P6gOHjj+tVsNuagPseUbs7eBe9OE8H3zUTaYYo
 8uWyen4Q2yXas5QQ9lh5S2uxKHY2V0U7x3S+6KfUNySztOw7idFWM3qpd90cVLeq0MYDpC7Q0wN
 SdAXBNRai83HlLbWOV8IcsDtk8dTU+XqBv/pw1L8OveVRH3KmRlMU8fEY05haSv39zYydoJzZZL
 9sN9Gt9sVPpd8Uy2e/m9rG9PTHHXSLm+lHzaIslA0nG/PqPf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 7/7] usb: typec: ucsi: reorder operations
 in ucsi_run_command()
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

Streamline control stream of ucsi_run_command(). Reorder operations so
that there is only one call to ucsi_acknowledge(), making sure that all
complete commands are acknowledged. This also makes sure that the
command is acknowledged even if reading MESSAGE_IN data returns an
error.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 691ee0c4ef87..02d7f745acad 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -95,7 +95,7 @@ static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 			    void *data, size_t size, bool conn_ack)
 {
-	int ret;
+	int ret, err;
 
 	*cci = 0;
 
@@ -120,30 +120,24 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 	if (!(*cci & UCSI_CCI_COMMAND_COMPLETE))
 		return -EIO;
 
-	if (*cci & UCSI_CCI_NOT_SUPPORTED) {
-		if (ucsi_acknowledge(ucsi, false) < 0)
-			dev_err(ucsi->dev,
-				"ACK of unsupported command failed\n");
-		return -EOPNOTSUPP;
-	}
-
-	if (*cci & UCSI_CCI_ERROR) {
-		/* Acknowledge the command that failed */
-		ret = ucsi_acknowledge(ucsi, false);
-		return ret ? ret : -EIO;
-	}
+	if (*cci & UCSI_CCI_NOT_SUPPORTED)
+		err = -EOPNOTSUPP;
+	else if (*cci & UCSI_CCI_ERROR)
+		err = -EIO;
+	else
+		err = 0;
 
-	if (data) {
-		ret = ucsi->ops->read_message_in(ucsi, data, size);
-		if (ret)
-			return ret;
-	}
+	if (!err && data && UCSI_CCI_LENGTH(*cci))
+		err = ucsi->ops->read_message_in(ucsi, data, size);
 
-	ret = ucsi_acknowledge(ucsi, conn_ack);
+	/*
+	 * Don't ACK connection change if there was an error.
+	 */
+	ret = ucsi_acknowledge(ucsi, err ? false : conn_ack);
 	if (ret)
 		return ret;
 
-	return 0;
+	return err;
 }
 
 static int ucsi_read_error(struct ucsi *ucsi)

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
