Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBDD9115FB
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 00:55:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E28C1C712A2;
	Thu, 20 Jun 2024 22:55:31 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F5DFC7128E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 22:55:26 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so14474691fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 15:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718924126; x=1719528926;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=71+mH5Floh82G3AnJlaDTvShrwKqWGqG0Bz3hMtCxBI=;
 b=IerHDueLdzB+bkJZDn+4pCovmoyXZmlQU5sdA10W/ddvaC/81BvbWQFCsRGFH0XAk3
 tiRRKlOyjOddoD246gpx81FlHF1wqZ35DF5zVikUWDdzB0bpeWAxdJET3Aq5843r2BJ3
 gtc3FzTHKi282DMovKEqJznXljN6FeH65mMhmjKCzrWAV22P3m7ii05kitvE0dWfdrGC
 NP9dTGwRX6tE7C/9Vdvuh00ULoUCqIxPg0awd3ftsg3PuWyZPGsz1huM3hhqh0l7O+w5
 lCkKoFdQsIlCs/Fdoy2DId7hOOzmRXO4EPxbk/BHjkCmwXaj3qfu/+O6XjaWPbIN2nLi
 /kjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718924126; x=1719528926;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=71+mH5Floh82G3AnJlaDTvShrwKqWGqG0Bz3hMtCxBI=;
 b=mLrZEEmoQ0ueYDXfaqJT5ZHeliLmGQvTViXr46XtnYBGoCItlG8dOx/O2xTX9mJYrw
 h/GEFdsIjOXZq6fpDTsGW+nUo2CM0Vsl4VJnKX77YEUOw54gIFk2Drr1f+tHQeVc1DS4
 ib6ax8NkGYjluSmM08c3cQWmZU360xyrdlnDXrxzIcJQ7CQTjGZH9ljkxjIlR32OkdzM
 b4nHO+7AUTWHjK0BvVThZT4khcT/B3YoEZDWlrDvLhog7y5yCihCNFAd55F4DgTphron
 nXQg5bX+EAR9gfPad6SwIxZ/pMiySSekrir6OHcLX+o94dguLS1QhcMK+Xk/eBhNknWI
 PFEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb9IGHEuHPMH+XNHKdH3nQeljBiHu4ppRMXiEB+SQrF0ibDxGvggd1W4PwsZenVHH2NLaVrUaMJHeFjnp+YnzDzP3hTVvxOSaf2u/OhcFQoEkZNLtdBOfi
X-Gm-Message-State: AOJu0YwQWBGJao2mc47eHA/N7TBwccnff36/IeZsyvdQFtT4wyt3uSRh
 4slNM6UHgafeK3TOh6xYzJIGHjnXzTx+dyIoG8gO7KfwvTyop/MIlGOPhAMReEg=
X-Google-Smtp-Source: AGHT+IFZM+I+YtVh64S4lDZ2udWYywALAsQznYgcpbJetOLRC5X51Yoe0ZNnbkCPl3SnLSja0Yx9VQ==
X-Received: by 2002:a2e:818e:0:b0:2eb:e3a7:8b with SMTP id
 38308e7fff4ca-2ec3ced134amr43741981fa.26.1718924125887; 
 Thu, 20 Jun 2024 15:55:25 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d60126fsm510461fa.20.2024.06.20.15.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 15:55:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Jun 2024 01:55:23 +0300
MIME-Version: 1.0
Message-Id: <20240621-ucsi-rework-interface-v2-4-a399ff96bf88@linaro.org>
References: <20240621-ucsi-rework-interface-v2-0-a399ff96bf88@linaro.org>
In-Reply-To: <20240621-ucsi-rework-interface-v2-0-a399ff96bf88@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4449;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=42Enl7rJ+JieEa2j+TC+Pkbg3DYxAPRfCHYi64Mdal8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmdLNZW1iosGP2/ESy5WgAGVEoe8PqaPXapLjv8
 Z5ef9DvoauJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnSzWQAKCRCLPIo+Aiko
 1ccECACV/t1O7ibAb++EUfbXBQHS1BVPzE5BfW10D8XOLBh4Y71iTfBan0XZMR56o+hvJy1B9Un
 TOtp0zCUfQMQKPEUE79oVfhEP9Mm+fBKLvLx4uIyvOsEA0FpLA9kwFLUC086n/8zEsa0Llcvjib
 wFwaHncYK92DaNRJaJ6dDPUHV0jk3rdY5b2rcGbymUfniut3PZJZ0azC5ckc5SjbVI7dqS8q9N9
 dv/mNa8u9muxna9inYtyRMJrFPiAioRycDC7vtAOpkz/c5AHvWPFSzHJjilKSi28Lwyk1WQ5BJX
 rJ+TYTACbKFBmMVjJ8A655Zjq34XmFx+wIewFisYIdqB3AdQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/7] usb: typec: ucsi: rework command
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 134 ++++++++++++++++++++----------------------
 1 file changed, 64 insertions(+), 70 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 81b459b26b74..58d9602bd752 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -63,25 +63,74 @@ static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 	return ucsi->ops->sync_control(ucsi, ctrl);
 }
 
-static int ucsi_exec_command(struct ucsi *ucsi, u64 command);
-
-static int ucsi_read_error(struct ucsi *ucsi)
+static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
+			    void *data, size_t size, bool conn_ack)
 {
-	u16 error;
 	int ret;
 
-	ret = ucsi_exec_command(ucsi, UCSI_GET_ERROR_STATUS);
-	if (ret < 0)
+	*cci = 0;
+
+	ret = ucsi->ops->sync_control(ucsi, command);
+	if (ret)
 		return ret;
 
-	ret = ucsi_read_message_in(ucsi, &error, sizeof(error));
+	ret = ucsi->ops->read_cci(ucsi, cci);
 	if (ret)
 		return ret;
 
-	ret = ucsi_acknowledge(ucsi, false);
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
 	if (ret)
 		return ret;
 
+	return 0;
+}
+
+static int ucsi_read_error(struct ucsi *ucsi)
+{
+	u16 error;
+	u32 cci;
+	int ret;
+
+	ret = ucsi_run_command(ucsi, UCSI_GET_ERROR_STATUS, &cci,
+			       &error, sizeof(error), false);
+
+	if (cci & UCSI_CCI_BUSY) {
+		ret = ucsi_run_command(ucsi, UCSI_CANCEL, &cci, NULL, 0, false);
+
+		return ret ? ret : -EBUSY;
+	}
+
+	if (ret < 0)
+		return ret;
+
+	if (cci & UCSI_CCI_ERROR)
+		return -EIO;
+
 	switch (error) {
 	case UCSI_ERROR_INCOMPATIBLE_PARTNER:
 		return -EOPNOTSUPP;
@@ -121,78 +170,23 @@ static int ucsi_read_error(struct ucsi *ucsi)
 	return -EIO;
 }
 
-static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
-{
-	u32 cci;
-	int ret;
-
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
-		return ucsi_read_error(ucsi);
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
 static int ucsi_send_command_common(struct ucsi *ucsi, u64 command,
 				    void *data, size_t size, bool conn_ack)
 {
-	u8 length;
+	u32 cci;
 	int ret;
 
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
+	ret = ucsi_run_command(ucsi, command, &cci, data, size, conn_ack);
+	if (cci & UCSI_CCI_BUSY) {
+		ret = ucsi_run_command(ucsi, UCSI_CANCEL, &cci, NULL, 0, false);
+		return ret ? ret : -EBUSY;
 	}
 
-	ret = ucsi_acknowledge(ucsi, conn_ack);
-	if (ret)
-		goto out;
+	if (cci & UCSI_CCI_ERROR)
+		return ucsi_read_error(ucsi);
 
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
