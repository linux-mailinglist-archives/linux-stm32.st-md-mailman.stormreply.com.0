Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD93916B1F
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jun 2024 16:54:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BED58C7801C;
	Tue, 25 Jun 2024 14:54:38 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60EAEC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 14:54:36 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52cdebf9f53so3028756e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 07:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719327275; x=1719932075;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=g2gxtQIN+xKJeYZrrZg4eTx3pd8ql0F1T/zN9SBRQsY=;
 b=FK3f0wvTEwTXnsThJdQKK9kq9cpvhjPTRlN7uteTBO8cabZT5FeZ6H1IhcuPC29ZLF
 D1CpEmMp6SHRpZ57mkwFQZE8WvVQI/9gwX6603vbxJGGWTz6b7PDMppGPPUlPaCiQBy7
 bpl9VUWkZ9OF/EXZo7XFXfgd5cWrGBKuwQ+8PQH76PwAVU4r7bD9+OeGNTfIXLioglyR
 DoEpi0wNqlPezt8Z2OdisQ95j1geTgc+w7Rq5s1J8fTttV0GCeNYBrTkKQWZPCM/uILQ
 znChosg+oExPCTMtMULUokEIemIA2HvhyOeEYuPZoZPZnMNDAMPYjWtqkNKx+OpSrDpF
 Ogrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719327275; x=1719932075;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g2gxtQIN+xKJeYZrrZg4eTx3pd8ql0F1T/zN9SBRQsY=;
 b=VkDzJICRFMccI7J9AfQcatK3LWTtaqhzIhesZGqH1/78Apo1SdHf1I0bEy9UB/xeSI
 aKrYGx/H83Giwn0SzTDjn0EUQGtj9VKIsauOkl1TEZtdKbsMwRa3fvhODuYIL7gt8i3Q
 TKMLAXJLEXAJpI6y1xowsm55Of9qBlaj77k4z+sO7wIuFI/9JXJ+fhsBdXlkLD0PaZrq
 QHnEkzQsa5Gwt62x3JvF9bklNx9ZSrbA+rkFiUcMZ9/IQd6zhc7xMfSLRysDh9sU2Hx/
 Kw0LkcQNoJ9S+iH1FY54Q9XP5it0e2iApU79MQuUy/AY4ffYvQZNrGPnAkqvX3oP9H7B
 Pm+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBOQC89lEEqv53EdhQJ1wsBU0xqMcAxACnyEduJWuC4vr+A2xBtZMwU1zZzAEePvwLk6fX7zNzwpl5WSPv8YVzZzgkTQxHqGwRtPeOeiex/vhFc5lJtjI3
X-Gm-Message-State: AOJu0YzRctsAVMkWBEXE5ySibhLlgSzEdtLmH/4iC8nEijS0uIt0Rd5x
 IUIBCxkswHBPxvCTXmDNww9yhyRq4QLumgudizM8p3kdXdBmZgKhlPQ7+DtuPvY=
X-Google-Smtp-Source: AGHT+IFgTfwsx7ElY5vsvTSzReP2HLuqQHHg6f+F1C3RO23ndtkGTJu8+wBSZAIAD6eWetNxoUG4Kg==
X-Received: by 2002:a05:6512:46f:b0:52c:9f9e:d8e3 with SMTP id
 2adb3069b0e04-52ce064e3d8mr4973783e87.31.1719327275739; 
 Tue, 25 Jun 2024 07:54:35 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd64328b7sm1251877e87.221.2024.06.25.07.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:54:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 17:54:32 +0300
MIME-Version: 1.0
Message-Id: <20240625-ucsi-rework-interface-v3-7-7a6c8e17be3a@linaro.org>
References: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
In-Reply-To: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2070;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=c1mFXRw/1F7jX+PLOZli37YidJtYzYIZwD0eERkZXpg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmetokKTBUAvA860F4TZ7LaGT2vn3//h0eO5fRP
 eXnVpE4f++JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnraJAAKCRCLPIo+Aiko
 1Y7VCACNYuSM7sEYoqQvGqND2MRdAoZLFky1iBiqT6oimIP7qis1KVCv3F+gBFz/bdKtij+cztp
 Z5awCnGfW7Httm4zKIIT7NjJpuUDn4ia7oZOW3FAe99Zdq92p1EKUvXKnXApxNz6eom/iOY7qGH
 ZuClKE5VA15dUN4sl0zW6TTatSGt7zTfkToJ2jq8u83k9ID/maCxlb5V8FISVxuKEqgOJwLGGoE
 OvAeeooTh9x2NFAt/eeMWZ2D8kgVxeDZw+j5aVfO6x8v8emzAdbZuHaM+qRTH+T7uUXJOiJNXkB
 9HVHfVpFVz76fdbmU925vbf0ul+6bFBUI9SNsbusDr5OPJul
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 7/7] usb: typec: ucsi: reorder operations
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
index 3fb5d3a52b80..0d091f06abd3 100644
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
