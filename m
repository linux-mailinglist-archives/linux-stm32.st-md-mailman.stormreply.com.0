Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E1D91A975
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 16:44:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 308D1C71280;
	Thu, 27 Jun 2024 14:44:51 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1F40C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 14:44:44 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ec0f3b9cfeso96171351fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 07:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719499484; x=1720104284;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gWQEDBR2cvKHd61KPN3Oc0zu2avyS++NhmAlrTQ8dMU=;
 b=ZM2sh63PaQ2EQlziMIuOhnRG4x5WNBGe7zpnAxgB05gpnBXaUNOnpzCF1jvE4WHgkc
 CEE6Ddy2oQMgcV9DqIFHdnn8mKSS8zEIe302s290hBF4/oAx7FFn+xiU4HDH/Y1DeXmE
 jKUh3dpDXoYAYY4TKsxIJ5g5XmCwgBvhA7y5PP61gXkKQYgVmWq5q+Toh7pyR8Qui5Tr
 /SOGgZH4PYJ9FQVtyV6XIVvh9rn055pdQH31Af6pYulgN1RwVOfOrKSw8Fel1AyzHYsq
 ZOo1F86Y1aW9GOxYWCSuTdaqWkV4uSvp6+Ft+xYwVI8CrY8f2zTbLjRtBhlWT/wiqLZd
 u8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719499484; x=1720104284;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gWQEDBR2cvKHd61KPN3Oc0zu2avyS++NhmAlrTQ8dMU=;
 b=ZY8cMBvQVP+11usXtYlV3FVEY7+zc7/fcbhJe4yL4TZel4pFMh9UK+BBmOMCk9jUvi
 Bn1TV54nEHajEUXs1BqYesip+iAd76K/LJo7Hu1dwCfXaMMT5ydmXD+NWHbk4cE2REag
 W02COJetT9+lH3rQGxk+HxTl5xN4aoWaioolJtaF8nTUzr/rYQtmWyYc8U5kkrDi1y8B
 s+PPHGziuNujKqOVq2IZka8Hva3hhWQAZpNtlD9qox6Em5bm15mjOBcTZqoFqLcIEn2v
 1sLcJwJAS7Xejgg1YmcUYC9QymV1cSm1Q5N7AR/mEqbsKd5AgeSR1ZMf8pNr2lsDDG2Y
 auLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCyNt6ZdBEMfYge56MugdhkwPr4UC/MuYtzrJv08SdAc13ji5IJe8VSYCgCU/3MFf7wXU1yArfNlBS4VGxVwWfHlTmQ4EAEO5RwPRhTnlYNz46CehZr01a
X-Gm-Message-State: AOJu0YwLrx+PgpiyRAgZyq9g6mtzkeDldOKkfR81OVXL8a+LFBpxBzkx
 j15SBUKyRI6axAMz6A7tIA2lXHDeGxMZ4gyjhVBXzdUdSxlR77/BjUY8dgWDGWyx5V6M4PN1oOT
 5FjE=
X-Google-Smtp-Source: AGHT+IF8lRY4yxVYxkR4RRTjf0SHogAEtg76W/F0NnLyvHUeyA8JM9QhKMO2Pbyo9TObJ219yDtmqA==
X-Received: by 2002:a2e:9d81:0:b0:2ec:57ff:92c7 with SMTP id
 38308e7fff4ca-2ec593d8613mr85645941fa.14.1719499483920; 
 Thu, 27 Jun 2024 07:44:43 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a34447fsm2775911fa.11.2024.06.27.07.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 07:44:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 17:44:40 +0300
MIME-Version: 1.0
Message-Id: <20240627-ucsi-rework-interface-v4-1-289ddc6874c7@linaro.org>
References: <20240627-ucsi-rework-interface-v4-0-289ddc6874c7@linaro.org>
In-Reply-To: <20240627-ucsi-rework-interface-v4-0-289ddc6874c7@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RCY/4C0+GrYFBzSYId6jLzfsNK5WXotKJnVh4nnnjG0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfXrZ1Gmvzxm4i0ZRKQCtxunw01G50Fjio700n
 1wqd1wu/bqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZn162QAKCRCLPIo+Aiko
 1eSUB/0RSAnq/bhc3trWD1uYPal7bW48CKzEDX0qEHMDzyjk1GJlHlUnP0d00i2vy8nmi4Y1sGn
 JAiSOJ/lwWBwJjTPJX+SM9WsqCMpMe+OhNP0pqyWhqupbTGR/xgmDHGDJN2LlgU/i9TwEYv+syQ
 JtwlhKuXilFvwSmQC0JHXxvdRzCHZ6YbtmckLEsqLLKsM8LmjI52G/ak/FSYcgemaKyXQs/iinQ
 bGgfFtTdVreI1ds55pjr1dCQ02q4k0RWJlgpVVqNAa43/P04n3jC5shcezrTu99ROP34Y0ORwxe
 +6Z9pQxIEgaq8/bd0vT5Eeas2kReYuVdzwWPirdh2qdhBySr
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 1/7] usb: typec: ucsi: move
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

Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 59eaa49042f4..651c22473472 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -71,11 +71,6 @@ static int ucsi_read_error(struct ucsi *ucsi, u8 connector_num)
 	u16 error;
 	int ret;
 
-	/* Acknowledge the command that failed */
-	ret = ucsi_acknowledge(ucsi, false);
-	if (ret)
-		return ret;
-
 	command = UCSI_GET_ERROR_STATUS | UCSI_CONNECTOR_NUMBER(connector_num);
 	ret = ucsi_exec_command(ucsi, command);
 	if (ret < 0)
@@ -182,13 +177,14 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
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
 		return ucsi_read_error(ucsi, connector_num);
 	}
 

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
