Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37369114505
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2019 17:45:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCA8CC36B0B;
	Thu,  5 Dec 2019 16:45:01 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9074CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2019 16:07:07 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id g6so1423707plp.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Dec 2019 08:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0EteF4iAsRPHclRrUrgDLpQZXRR6Kg6d9lRSQjCvFTM=;
 b=MwasEGI7lm+mGeCpcG6eU/GbXC7zNqrFuCiJB87Bv7lJ6q2aJsS0HYDmpRLMlUSnqr
 bUH7uorWtXJHy2FK4Zsht6aeU4IUKqqwnZqXstHWd3GAuGh+2N3gtLqJwHkC/4cMwELe
 TGBTIYm8HyoAcyb5tC2dN1UQVgxQuiHpHniL2G1fqOZ/R6OVf+4+qGsuMYxKegG66IJ2
 YXBVIsZfNABYv3Sz4wFzY0T7O3TSMvsnzhbjAXUcVF9SdWMXZEDFPTsPS0jcIVerLj22
 wzKbLoCckcPxFqGApIK4ifdjwT7ETBkDktx5+KbEIahJMKhckepyBFeQaknkWrs1ja12
 So1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0EteF4iAsRPHclRrUrgDLpQZXRR6Kg6d9lRSQjCvFTM=;
 b=gLnst6eKhTyaoiDLQZ4BlNmgvOq7pQ0XxqVmeDipaUFl4lgsxhK/u/OBwCJXG6PKqe
 dwnd4LgH4fN/Ay3OVjWJfB2epGKFiGhX3HmxBMF3Uz1dZ7KwPnpurYwdbdTEQC59P5bt
 yd/7Y3lpSK6HnUUAW0v6JbfdR5COYGUt2D6NdT7AzCGzbbKuDGxk/bjtZeXDm4qf77Xr
 cd6ayIiRlFB6FSz5YpPw2flR1tMJhNFhaOeRhWdVkkIXpiyzIVem33bQ+jNBPc3Q45Kv
 HnrcMUmufw7AkNdWLhFj30P7srnOaOXjtFezlNSakvho6A8f3Pm2M9+5jvrtaDBXz0GT
 s8fQ==
X-Gm-Message-State: APjAAAVuS+NYifXWK4YfwR380besyYzF/5PIkyLOI5Cvhh42MHdo9q25
 LvjiNACM6fWXRK7XOS62yMo=
X-Google-Smtp-Source: APXvYqywhPRYNArYzVQFWv+PuF/L2d6dUUNgv5VAlL+Ittq3144uB72j/wDmK/qj00I0S7d386YuRA==
X-Received: by 2002:a17:902:7c0a:: with SMTP id
 x10mr9926650pll.168.1575562026013; 
 Thu, 05 Dec 2019 08:07:06 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id h5sm13877752pfk.30.2019.12.05.08.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 08:07:05 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Fri,  6 Dec 2019 00:06:55 +0800
Message-Id: <20191205160655.32188-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Dec 2019 16:45:01 +0000
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] rtc: stm32: add missed clk_disable_unprepare
	in error path of resume
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

The resume() forgets to call clk_disable_unprepare() when failed.
Add the missed call to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/rtc/rtc-stm32.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 781cabb2afca..d774aa18f57a 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -897,8 +897,11 @@ static int stm32_rtc_resume(struct device *dev)
 	}
 
 	ret = stm32_rtc_wait_sync(rtc);
-	if (ret < 0)
+	if (ret < 0) {
+		if (rtc->data->has_pclk)
+			clk_disable_unprepare(rtc->pclk);
 		return ret;
+	}
 
 	if (device_may_wakeup(dev))
 		return disable_irq_wake(rtc->irq_alarm);
-- 
2.24.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
