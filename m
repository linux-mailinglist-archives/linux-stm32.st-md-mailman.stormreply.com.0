Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C189115FF
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 00:55:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28190C78014;
	Thu, 20 Jun 2024 22:55:32 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3988FC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 22:55:24 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ebe0a81dc8so16197101fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 15:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718924124; x=1719528924;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=59oHXNpi12pYEsSfaS8SpC7edflQWBXEOYjnnm2ogho=;
 b=UKqXeujFoYOxsPgQD9O7QBz/ttMf6sU72UKSHXHKo7pe8N+cApAuS7/ShX2RWgbMh4
 Gv9ZkaoiF9o0AVXRiJgReE5smwb/+UaloK44PL2SRdJ2kD2xfGSUn1x4cfMMIiZBmh4+
 DpZNcKjX9OCniknD9ACYzFAn3jRiEQJDi5fW/Rpoge4EutsMroaJvRnctkBFuRO2UxR8
 mMlPW/XYWI+IWnDTVo3xBdKd+3wqVfic9wU01pqbjHtsfWyUfjbGf+P7sxx1/RHWOS9M
 xkNcED8dWbC4aDNBOb4KrMgx0LmFEaGoO+sFYI9s0XGNv/yoPWFC3dM5bbfkMRfvn3ro
 RwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718924124; x=1719528924;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=59oHXNpi12pYEsSfaS8SpC7edflQWBXEOYjnnm2ogho=;
 b=I0a06sPJf3MnW8hhnBv75HDAZfTNAinqg1HbnMmBqYJ0/vRJR7nxiTHyxFttXzrqic
 cU0f2CHrXjPPfCy9M5251VQtXHmO5RFwhAykwhH7FKz+6WUzNQ5/z0OBF/q60tdUt5iE
 n5RN7WrbmAezc3BX2g0lkq8cqv978KIIBe3KzeGy890+CEtRiG+jlIhGQgT9xRii+9f2
 9MpBnatTxJweaQ7wLOjAXQ0pF/KQRWgiTr5pFUM8Jmi0imXqZ7gX9WNfGW5tlHuMRWLF
 ExLnWyh/PuFtuzg00yDDfdd0qeynn3PFyvR4tsOMAAA/OzYw35RSyLcwejDSnobeffgX
 t7PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdOWf8z+wrKVSkz+daKjviAxCcEpFDAgIBWMiQvRSsathyeDfbI9SlL99mqq/eegTf2BQ+iZSthnjE0hUCrAbnxkJjb27I/tjrX/ftD8dI1QPbQxqUGJFj
X-Gm-Message-State: AOJu0Yzy8OxV2v8FKI0wj5rYnQ9v4osoAGkco33/KVKlzTrovyW8eLzQ
 5VVD3TrStI4i2XJ2Ianp3pNfH4EmukUUSIxf45sLG2QBVV5btX84CeNBkn2A8dU=
X-Google-Smtp-Source: AGHT+IEDyGBKz3t3wGE2QIBNprd46E5kie6qSIewKgUjN4f5gzLvwrTF8H7FN9Rdja49NN2RywJamg==
X-Received: by 2002:a2e:8904:0:b0:2ec:eee:f197 with SMTP id
 38308e7fff4ca-2ec3ce7e058mr46393111fa.9.1718924123766; 
 Thu, 20 Jun 2024 15:55:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d60126fsm510461fa.20.2024.06.20.15.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 15:55:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Jun 2024 01:55:20 +0300
MIME-Version: 1.0
Message-Id: <20240621-ucsi-rework-interface-v2-1-a399ff96bf88@linaro.org>
References: <20240621-ucsi-rework-interface-v2-0-a399ff96bf88@linaro.org>
In-Reply-To: <20240621-ucsi-rework-interface-v2-0-a399ff96bf88@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7E3v+0gLqGBn3XeWvM8WTYb4Nd3klVpPD6SOrvO9a+g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmdLNZ45oT6EY8DYlITEu+W5ykCaKw3FQHbQSiU
 G+9rz60uKWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnSzWQAKCRCLPIo+Aiko
 1V0oB/97hJGoKKWHK/VtNc0gAJ9+nbCucdeyixOoQ2IAHqQRbB406Sz9CIG2dlvR1ljV2fhUjol
 /TLxEA2QJgN9N9Z7o8gdFY1TmCtgB6XEVYKMA1be5fzzCDE0OA4lMHTTItT4VKvzWIBWsgGfsqI
 tn9C2ze2WpNKnVTFGIHOmY83R6J2BvHTk7lOPFYxdaA33oFYNt6Tw63jl11XXwJ/MKvkIlFG557
 rwjeWarTd7Xygqco4AX5c0cGdU5uRoPZ3kZ02bDFHoGekzqlOuVC42XxqGYZgBYRHJdEUngqAj0
 CJtDpxRPtZAH3K1yS8Seke4+5pQ/bXf2ij+VZI4/tJLS4vGz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/7] usb: typec: ucsi: move
 ucsi_acknowledge() from ucsi_read_error()
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

As a preparation for reworking UCSI command handling, move
ucsi_acknowledge() for the failed command from ucsi_read_error() to
ucsi_exec_command().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 134ef4e17d85..8e4d92cbd6e2 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -70,11 +70,6 @@ static int ucsi_read_error(struct ucsi *ucsi)
 	u16 error;
 	int ret;
 
-	/* Acknowledge the command that failed */
-	ret = ucsi_acknowledge(ucsi, false);
-	if (ret)
-		return ret;
-
 	ret = ucsi_exec_command(ucsi, UCSI_GET_ERROR_STATUS);
 	if (ret < 0)
 		return ret;
@@ -153,13 +148,14 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 	}
 
 	if (cci & UCSI_CCI_ERROR) {
-		if (cmd == UCSI_GET_ERROR_STATUS) {
-			ret = ucsi_acknowledge(ucsi, false);
-			if (ret)
-				return ret;
+		/* Acknowledge the command that failed */
+		ret = ucsi_acknowledge(ucsi, false);
+		if (ret)
+			return ret;
 
+		if (cmd == UCSI_GET_ERROR_STATUS)
 			return -EIO;
-		}
+
 		return ucsi_read_error(ucsi);
 	}
 

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
