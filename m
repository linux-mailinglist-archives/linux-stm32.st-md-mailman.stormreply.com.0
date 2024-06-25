Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D86F7916B1C
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jun 2024 16:54:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E760C78016;
	Tue, 25 Jun 2024 14:54:38 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1069EC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 14:54:30 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52cdf579dd2so3097020e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 07:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719327270; x=1719932070;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JAfmKGbaHSRN3BDyb2Ps0ChAgC9WErixxC6u5jSyHcs=;
 b=YPvZUr4SpXGDoj1LB2HPhrAeOy8mBtTmu00fw8bJgZ8AyiTZMDJsLaQSEKyRRDZCCA
 XPU0ExVEK9UPhDKB8EOXYTcNeq4VEhHp/HrkbtLQBaOVgKtb+WmEIN67qevbMWXT7i/s
 G9gWDo4axPG/VtHfCWDTV8dTHVWCg41ZvGqUjwoeroc0j6+uHhIyKl4O6IkpCn9LzAA0
 XdOoeRa72l/BXT0ntiGGqCFgyp1c83MHOYlkMW4g0FkRFvpXx8ezKPT8TF/Pg1f0Ji49
 aPxjDhLAFoZNvc7h00/RGpZPnCXWFFi+PLmC62kAfLMiNiYOUGLSI9ZqKcSWpyAbw1Ui
 NZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719327270; x=1719932070;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JAfmKGbaHSRN3BDyb2Ps0ChAgC9WErixxC6u5jSyHcs=;
 b=Pt2HlxASyOYijoQznF00tbH5c96VGPEnNYHMqsYS2TCarMpSY51MDYJVheRh/96lIA
 NceyafJJMVrXheIy26ehifYSj+MI5PE2kZKb5QyWKAemJ6p/rg1BLJl9fBe6CXpkHje3
 nEM/eVHRoVJaQgrU3cQMwOc2EJoeBLJN+OpGUcyvfOFSVujk5hxzIiofzWSQePoIkNFN
 Plbtts7AuSMmiXNpFlV80ngly48hLd4uGYEQuJ3BHQ/fHxaul4c5NilwKtitVgNIZnww
 TZIvu9DuzbzYI3xyxUSq3ZmIsSVVDIvTgkZi8BO3ReTqt+e8b0hQoS+NQdCcFqX/9dOD
 85YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMsmbMiD9W+YP+1gMKrQop2SW/4MZQiWUtcC9hg8qkancM5NRctWMmegj6SCRob4OlvgjNB/zZZ0kM5VDsE+AhmOjIWed92MulXFeYP3xBwXjljvN0BGX5
X-Gm-Message-State: AOJu0Yw6WQg7l8JKmT4nzdfGkK2bT0ZpJ+IzWRTLwEDokkVLm8AzfrPr
 Hg2csTSnxXvkzdPzPv1Fvc/iKQ2xiWbD05M6ma6BgF0c8PCdWM4zp3mOzZtUAnc=
X-Google-Smtp-Source: AGHT+IGZFf/nSGa2e2d62pxL5I+qOFEUEnjG9EKzs41xvEO8rAlHlgWJuddbGqx0uxqUQDIYsbz3Rw==
X-Received: by 2002:a05:6512:453:b0:52c:d943:300f with SMTP id
 2adb3069b0e04-52cdf7f6705mr5392914e87.38.1719327270161; 
 Tue, 25 Jun 2024 07:54:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd64328b7sm1251877e87.221.2024.06.25.07.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:54:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 17:54:26 +0300
MIME-Version: 1.0
Message-Id: <20240625-ucsi-rework-interface-v3-1-7a6c8e17be3a@linaro.org>
References: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
In-Reply-To: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=E+vOJjv2UvdlrXvKnRgzVGWs8xl24PgUq84JxgbpN+M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmetojmtp4D7cmDhXFyPFb6rzvpO9SqHUmDn68o
 x84cE4DSNWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnraIwAKCRCLPIo+Aiko
 1dsqB/wKU/73Da/F7fXX3mKihmmgqnEt8z5DsYc/2Ek86sZ2QOVH5pcoOyQjGE2tEHJM1A460DU
 fniZ9SvZ17LHTf335zpqrqK1baAzCc7as/KU5FPsnsANZRV0di+AWzepIIFaNaN3bkEDgvyhGv3
 D9plJZY56ZqgzDBYL4OkX/69YyQk2ndc/DcQOa6sbOSLN+5tjeH9gnPwh9coPGY9Cf2n3auuqJz
 1jSXserA6xSdR0TK2kuorPqnD+k9K6yufTUWdeB5SNheTQwuDx4uTO2SUb42q1522ZwVKmxA7Bp
 KSyWF53xjvQ5qHB3NY1c+iU9Gf62IqbUUg5WbVjtBFRAZ1HM
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/7] usb: typec: ucsi: move
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
index 76c48d873b2a..297d939e8da8 100644
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
