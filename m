Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CD7916B1A
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jun 2024 16:54:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F13CC78006;
	Tue, 25 Jun 2024 14:54:38 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E76EC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 14:54:34 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52cdfb69724so3401951e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 07:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719327274; x=1719932074;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Cd2X10zVjMn+EpTL9h3lm0rs/LnmaQV9sjYCW3W4aNs=;
 b=o8jV4c4aAnCS1X080oMrX5q1WCI9U80XeZeX23gqi6Wn3yFtjcXiFIrIaWyO6qpnn1
 Q9lK3zVq1cPt9NOjAWZJ6tCGm35cC+gkPPOvdS0UX3DMSv9owBq61mAwINt06IsOraS3
 uhkKqgwd9SBJTxsVhrO9Vkmpl8w+4Ri4XMZYM1oZfuQ1Vjkbx9anXYsWPwqUtMRgc4uy
 8TIbHxzCX4BycIKoIQG9Lj8InqcKBSMy0ZoVTgiSDbTKhiCUNIy6bI5fVLxehpVXMqcr
 lC5bRM5QfntFBOdrtvNEOsfa/N2v53sYq8UvEBRQSmMWqBnnKYQ3a/WudeVR9M8/d7hJ
 6CNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719327274; x=1719932074;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cd2X10zVjMn+EpTL9h3lm0rs/LnmaQV9sjYCW3W4aNs=;
 b=p8Mu0PXtG8GavdVCHOWZQb2LO+Rk5t9aBxngpxI/+bmHWWQppAn3RvzAxBnoOhI7JI
 EU8S2SKkx3cFf23lnXQbuD8S6lasLbuph9vDrqQYMuZ9q/PB3fGz3SWz47QhwUkk/2tD
 YvnRObsj1umq6bnIyGuv4Qw6JBdhUEG+wobi3LfXHnp3/cE3AXqDezyBsX4ZYERlRjUT
 TDhQDir9WdM8ku21sARP/H0iXvUDqkW5JPNvOHxKqLVuIPVR0RuCJcTqmNmbx09agbMf
 0JboErXJBOdlfhflPHZdCb6E3gR3PEdG45ygbfUm5Py1mmnrZ6b+gkcD5BZv3VPJU1Ti
 tWiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTGOI6DaAceKCuCtNHgI9+ajLhotEAo7Y3qSwOmnOd3MFOwDuPlgSlIi/Nyvn8j7FYI28O5QoSmU4AGixnxzcOvT5HZNkAHlCo4riIcdDaBS5wTcpj4WNq
X-Gm-Message-State: AOJu0Ywm7zrgwgpzKhZEHHd0tfqvCxw1iWKzy1KkYSTcH3BOOcSFcafV
 5swne5FLSo646v0MDyw2kZsaRze22WNVIyD/V2/Lu9U4GydZjTQZTQ79RadzdGQ=
X-Google-Smtp-Source: AGHT+IFBU/FqlV1rlHFm7VcDP7TI1En+d6tYg9faOguYFxQeaenBL0P/drueNcNZbM5bdmNqJCDT6w==
X-Received: by 2002:a05:6512:2394:b0:52c:d84c:1182 with SMTP id
 2adb3069b0e04-52ce1862c12mr5311099e87.64.1719327274126; 
 Tue, 25 Jun 2024 07:54:34 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd64328b7sm1251877e87.221.2024.06.25.07.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:54:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 17:54:30 +0300
MIME-Version: 1.0
Message-Id: <20240625-ucsi-rework-interface-v3-5-7a6c8e17be3a@linaro.org>
References: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
In-Reply-To: <20240625-ucsi-rework-interface-v3-0-7a6c8e17be3a@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mI5j32lGmh9mGgx/qR0lTHll3MYLBaGs+ozW531l430=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmetojhmAknU4eETQ/0OVEnR93dwpzXwqv4zv11
 DBDhLbs1XGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnraIwAKCRCLPIo+Aiko
 1Zv3B/9UujGkolgkJQLF8DrUxTo7LuRVr+QOZJVWx5Y+Qqj2Vrktn20TdD10r17dEMR4lI7w1VC
 UMrX64IlrvWdR72wijPKPH6uafW5wUnCh3PNSBQgh+/03iBS8LwLJHaACH8JzISR8VnV8dh6Cya
 Xn2x+c9iwslIG6VPuSj+cxfyP1RPp+XY24Um3N7VOqS9MpeuJ54FtBQ9SwcEq/lf33MRf/+Vxv+
 WwdlSitm/UoP2YJG99Fmg4nhaSNFDyyuKOvwrwC8TVZlSnhgehx4ekDRPW/4pQEtyC2R6/PNpN5
 9FXIu8GWZ1DIn1Pb30kNSGbmuqxjMWkVwcYgoe6MFIjYwGMf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 5/7] usb: typec: ucsi: inline
	ucsi_read_message_in
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

There is no need to have a separate wrapper for reading MESSAGE_IN data,
inline it to ucsi_run_command().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5f8e5ed9e0f9..e14366e20cd5 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -36,19 +36,6 @@
  */
 #define UCSI_SWAP_TIMEOUT_MS	5000
 
-static int ucsi_read_message_in(struct ucsi *ucsi, void *buf,
-					  size_t buf_size)
-{
-	/*
-	 * Below UCSI 2.0, MESSAGE_IN was limited to 16 bytes. Truncate the
-	 * reads here.
-	 */
-	if (ucsi->version <= UCSI_VERSION_1_2)
-		buf_size = clamp(buf_size, 0, 16);
-
-	return ucsi->ops->read_message_in(ucsi, buf, buf_size);
-}
-
 static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 {
 	u64 ctrl;
@@ -70,6 +57,13 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 
 	*cci = 0;
 
+	/*
+	 * Below UCSI 2.0, MESSAGE_IN was limited to 16 bytes. Truncate the
+	 * reads here.
+	 */
+	if (ucsi->version <= UCSI_VERSION_1_2)
+		size = clamp(size, 0, 16);
+
 	ret = ucsi->ops->sync_control(ucsi, command);
 	if (ret)
 		return ret;
@@ -98,7 +92,7 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 	}
 
 	if (data) {
-		ret = ucsi_read_message_in(ucsi, data, size);
+		ret = ucsi->ops->read_message_in(ucsi, data, size);
 		if (ret)
 			return ret;
 	}

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
