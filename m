Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FC58D7906
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 01:25:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA4E5C7128F;
	Sun,  2 Jun 2024 23:25:05 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E43F3C71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Jun 2024 23:24:58 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52b98fb5c32so601463e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Jun 2024 16:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717370698; x=1717975498;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/H9omkcKfSMWKhyxE8ouaq15vBQZtQgKk2aVI95FWUU=;
 b=E8ufx79UQlIzlWjBjcpktdz/pGMda2sWSWZmTUN0omUz7fg3pyLDi4MtDrn4tq41Sa
 omTK3ADddHwEliNFTPhjmyOcYz52cDpxl66S7KmMpVKgQ+0aDz3LUYx+Z0IWlnLnfGDr
 aZh4/TT1HMNAfbwAkBl5QsIosYaN7EjaZKgykPzf/enInD9qo+gwbjwRRgO/616q9lk/
 XBSgL7hgXaw+Mq9wjOGVSn2TEbnf/wXiDLVyu+dRzDYUcZMn/9sqLokQZjCmSfzG1TMj
 xRzumfiM+4EqUGgZou7LIjdae43ozNfTpvx7CUcDSWlJMzBnHL/rPBh4v6vsAvUQTm+h
 pMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717370698; x=1717975498;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/H9omkcKfSMWKhyxE8ouaq15vBQZtQgKk2aVI95FWUU=;
 b=ECF9uX1c0pm4WyUorMCviZ4+pPbvx1/246U1DvJy7/1x8iHxDoib+Qe+UsCFpHyzB8
 W901vJ5o+2Zhxj7eMpjzkIMpfoTIYY+HXFohwo/qFoRh22syJHG41YOmDZAG8+N2FYbu
 ZRHiZscHDDG+GTfwVABcrN9PHazEn6rMaQW3Ut+QEmZ5HfVhmfWlPr3T3OHPZF9bsd1v
 T16TyG2n3R1E1vs4ysjW7o38oJgI4exz0p/gsMJVOkySns/kIzzMnSilqaBHwNXJRanp
 SVgOsGbKZpSu/5jZ2EN3FmJ0aq1fz+tGDtNccwbDL57bi1WJbPyUP42V6whlh3Pl1rRC
 Vnkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ+jxyECHW1xXxrIb0B8nRJTIkhTgFjxwoSw525jnVPJr54z9qp2G+zrlPiQG713cp6f8cBhFXaEJDT/lB5D/yTB87HIj99glHJOr8f50JqXTfxpaNnqBC
X-Gm-Message-State: AOJu0YxpACbQ95gyu05AVD+q+OtMKbOIm0fRyrwk+fNW1ntnq9o+TxfL
 PSXUCXJmqrWLlHdyZqB9v3Xl939OvlQUEZQ5cjEEqfZyG/E8mVsSdTjIn+3fjcY=
X-Google-Smtp-Source: AGHT+IE2CkuVfuEeWibh2syHVvCT2BYHUAnYl4Dc3HsXN2GwvEWq+MuVV84p30lXkZjv/MWuXo6EyQ==
X-Received: by 2002:a19:2d14:0:b0:52b:9046:c44c with SMTP id
 2adb3069b0e04-52b9046c59amr4014987e87.58.1717370697587; 
 Sun, 02 Jun 2024 16:24:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b959008aasm392369e87.269.2024.06.02.16.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 16:24:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 02:24:54 +0300
MIME-Version: 1.0
Message-Id: <20240603-ucsi-rework-interface-v1-1-99a6d544cec8@linaro.org>
References: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
In-Reply-To: <20240603-ucsi-rework-interface-v1-0-99a6d544cec8@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=J3HQOCyfSVpr1YUtYQZItLe+bN2QWt7En48aq2hwcDQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXP9H/f3ba1SNbSVuQnOo1uz7VMfWjPKCe7tix
 noDzdNH6tGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlz/RwAKCRCLPIo+Aiko
 1d7IB/9MbaRNYHyugOOeccBgAd/6xgYFC8GC5EoakGOk+XO8fa4kUcKuCnypn9hKPcv5XYKagzt
 bPXUTZq47XUYgE1J2OW32LsWJ8dMV6Cw2Ue2hziAmhcMgc89R453njTxTc3eKF40ARb3FTptROQ
 xs3VZx2ERK741nPOXeoCPU79RmeSG7uMAZT9UFFi2yHZrrTfXV2g/IgAAmuNd0jQLCUQvGyFOcc
 G5i9jn4wNWURcR3K/mq8HTwfFr/kw5JW8Jtpeu3j1UTNSiRxVZMEjOH57d8d6thIm5tobzMtC0P
 e0YbXHJ8z8bldV5HBiq8FkRuTzcIgMVoIFCmG4pGI6WE2/w8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 1/7] usb: typec: ucsi: move
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
index 2cc7aedd490f..953196ca35a3 100644
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
