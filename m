Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CB591A97C
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 16:44:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92A6EC7801B;
	Thu, 27 Jun 2024 14:44:53 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52CBAC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 14:44:50 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2eaae2a6dc1so5962451fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 07:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719499489; x=1720104289;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dO9vc3WlwnOOdxIv2wYOfRp/f4HDsDDrITVn2Ghy1d0=;
 b=qW/q0yLQ9PFBg6Hqmd7Y9305uFgVPMrJs+SZhnxwAKHRaLdgbRxYqx4ng63PLGoZJV
 RuAxP8Y0ASOyWuq8J2yz/xkc2F5ys8x5FSOONSJIY2UzPI7p55fYkW4tnkrsiwNIfgRp
 N68EZgl4vXljxnKj2tUp/6uHOP07Q9L5YOkcjgWUk04Y37k/lNEPudr56Q284Z5nKd7Q
 IbTMbQ4e2zGsRZfN5L4Q7p0aoR8pPZIHFeX7Pg18t0Qd56v05jBRWttszSZuCiRyjyMY
 5N3bOFaKReJlAWLyIoUIT9MUwvNyxb8ZyaYsG6CMv8z9MYGYj7lvz1tfAgZ8h6TklpPT
 r4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719499489; x=1720104289;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dO9vc3WlwnOOdxIv2wYOfRp/f4HDsDDrITVn2Ghy1d0=;
 b=U0w0citqHNK7Hk457t3yfFvzkqqSEQ4NqN/RLF3h4kwcjaanS7NIFXuN8pmXccMee8
 30t41v9XaMM5kyQVhdSldVhk6O1xpBzKK3vhqCdLOT/4H6UihgCepRMPLc/1TroJRrdn
 BAkJAta0+v0+Y2Kt8BxS+7H64l+pZv/hRebIwc7E96do6f5z+kc/hkdEAjF21H9FVBV/
 DUgnNeOA/8NexbUPzCWp70iQiOachR4y2fqZSBGQfiOkqwZnFmqWIRWyq/w9Xthh9vkg
 Z1jBsRbAVqjuzXuLMGXsofWeJQaevaTiCG8rQ8BRy0k64zKkKNrNlqR3mAgfQap94MBL
 PuBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2jzEwVmQnBZlCF8q93vEVrjxc8jjFbiK1tPkM5MMRcbioJsk7/XrKptxBMsJb/UD3fgzW+r+Y0iZwwlfI4Vd/gHIAox6cgKJ8vjo4nmfOgTTejvoJ+7T8
X-Gm-Message-State: AOJu0Yzuh2FisZbVoTbnN1W3C0vYInRBW1jgUa9PdlMHxusMO1CXYj5O
 lHYhWpOc6mAO/cQotiwimAkXRmMxWPlRe3NjobIknKeG6qgQHuUi4996L7L32Dw=
X-Google-Smtp-Source: AGHT+IH7syasty7HaTDsD5E51KorF8XfnrmM9ehc/fLT067hmE63RvbKOsoAR+lMidxzL11uJ8ieFA==
X-Received: by 2002:a2e:a5cb:0:b0:2ee:4a67:3d82 with SMTP id
 38308e7fff4ca-2ee4a673edcmr21435651fa.28.1719499489631; 
 Thu, 27 Jun 2024 07:44:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a34447fsm2775911fa.11.2024.06.27.07.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 07:44:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 17:44:46 +0300
MIME-Version: 1.0
Message-Id: <20240627-ucsi-rework-interface-v4-7-289ddc6874c7@linaro.org>
References: <20240627-ucsi-rework-interface-v4-0-289ddc6874c7@linaro.org>
In-Reply-To: <20240627-ucsi-rework-interface-v4-0-289ddc6874c7@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2214;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8t+rc0a05n9eyrWDZO2kMieJ1aEfnXGXWDcAD9GfTds=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfXratpXe2Md2H7XXIFiFlNCnAymp1cbi5Lu3s
 qKILWjJemOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZn162gAKCRCLPIo+Aiko
 1Vy9CACQ+eAL9dx+gexu83BB5XxVSv6Vuxl4xliWjn7OFQ5qhxpaKRh9ucFB2OfRdDoDeIVc18T
 MoqzXZJWA2gqYP1kStZ4QPCA6+0iw8+2UHZd9AsQKWvzcrmtuwKzwy1V462QBHKrujuB1iw/5CR
 T/5lE2vCu/gucwCPeeSYreoIpc6c27v32N8foNt1wKRy2iNpl5mhJloJqi00fHLWHDVVYTwzdV1
 5RKDglkwuPy7nsSYxwg/s/2tRnL8pyw70IotCuYqMpoix5oGImSWc8bxTX73YyyXJ6FCuiDNHPW
 +4ySKPNRD0Ud8QgBYaG+IbKt41a4Heejgijje2FTFn7iNol4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 7/7] usb: typec: ucsi: reorder operations
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

Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 25d2ee5ee8bb..dcd3765cc1f5 100644
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
 
 static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
