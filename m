Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B90AD9F26C1
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Dec 2024 23:44:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 676B9C69063;
	Sun, 15 Dec 2024 22:44:50 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 846DBC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Dec 2024 22:44:43 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3ad272538e8so11042565ab.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Dec 2024 14:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734302682; x=1734907482;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GYZguq+bOqaLBNmT5LzVDxT3aVxG2gbJEu2POu819ug=;
 b=hyyYyYKrUaLErlWkiiRGEo7CXaa2Br8AbfQ8QPLTTBRzP23G4hwsU9+P+ksCuq5G+b
 1GyH4BykDm/XQpUB99Xkk1UGSlz5Y6YKy9o9DiXVAasVCpb9hc8q2xMfGWFeluSViux2
 kDce5CZdDgjTYENuo7tc4ZEBxoIWUuJzzLqtZTaQx+awkTAGd6tfdBImeSaDXJm1BR5S
 grVykB2wF4xVnMksnVQZQMUCBfxy+MEmDRSmNg3CU4jDdT6/dpowmX/Y4nVt+hq1lilD
 GJg/HwsxLLpPLK+vNyzPrBrMsQDT05xW1LRMLzl2DnDABovB/c09QbNwC4LMOYz0Vh9T
 wqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734302682; x=1734907482;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GYZguq+bOqaLBNmT5LzVDxT3aVxG2gbJEu2POu819ug=;
 b=YWdf6uJt7ZiOK4Gm07A9NYBCFCA867WXjg1ryihzAz9uO+Hs2g86h1fNILsiDFPU93
 j69bdIbwEA4yxbX9nTt7QeRFHkllL0PMHA2cV2UEEbw4mqCQY4HIzbUzXGm49tfOKBgC
 F9RBgGS97WaiJ6z3qJAnf9k+h22rNTB84TKSSVnNaG5BGWVBaVb6vxJ2zOeGLA6shtTP
 pKpMXMbJtFOVymLYp7kcN7eMFw2X6HxfGz0J17tYXYF2rDPMnBg3oJ1TQSGeaFX5FULJ
 MB/oonbRmGrySwlnsRjtaEM0ACl7yezXKMhK9Vuo7cORVsY0TlvYstnYlwaVx4o28kWz
 sV2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+GK6HeW0168ovCL29XLi1LM/CsG0AkI1jqSyt9ydWD+YsGOavozkq8No4V2RMKXFd6q4P2f4OQEPIsg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyi4wj+iUoGx7eee/qFEySKTSTn9P61QrhqrA1Wcr5CfAwi1jPS
 hB5NrOXRyn9dBPlM8ZmtVdWdHA+N912rj2tLQa4X2a5gpQ8lpcUP
X-Gm-Gg: ASbGncs0HHvy1azm28yFwzJWi0r0BMswyC91VzMhQ4Z40N0VQ2XaeXjqyqG29L/Z510
 5GQ4qyZQEwfSidyDRCoWy2e97L8YDT34BS7DH2KJMDWtKOT9XObnYUbhTRCnYanNzONjwKG86ta
 KMTOj3lMitWm87xV0/UMFsuZokGVGy7f6fDmydBmE4dCnd2izP4FupdJb+UtKX3UyolvmXn0kaA
 EQbp1wj7Ke9+UR+KruaK8d7vSEMwiKWeYnHMJ0Z7H6plDTRyDiIGU9hIwaUJLiBkj8w
X-Google-Smtp-Source: AGHT+IGePq+VdOyJwC/DP6nHlG7iOFgBuuD/YTZRBrTEMTV7bz9Y/zOVCSArMUyH99zVjxlIVgJnKw==
X-Received: by 2002:a05:6e02:198d:b0:3a7:cf61:ded7 with SMTP id
 e9e14a558f8ab-3b02e0383f4mr90832675ab.10.1734302682348; 
 Sun, 15 Dec 2024 14:44:42 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3b2475af2d9sm12349775ab.14.2024.12.15.14.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 14:44:41 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: fabrice.gasnier@foss.st.com, ukleinek@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 thierry.reding@gmail.com, p.zabel@pengutronix.de
Date: Sun, 15 Dec 2024 17:47:52 -0500
Message-Id: <20241215224752.220318-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 Mingwei Zheng <zmw12306@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] pwm: stm32: Add check for clk_enable()
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

Add check for the return value of clk_enable() to catch the potential
error.

Fixes: 19f1016ea960 ("pwm: stm32: Fix enable count for clk in .probe()")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/pwm/pwm-stm32.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index b889e64522c3..b94d186e3c0c 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -858,8 +858,11 @@ static int stm32_pwm_probe(struct platform_device *pdev)
 	chip->ops = &stm32pwm_ops;
 
 	/* Initialize clock refcount to number of enabled PWM channels. */
-	for (i = 0; i < num_enabled; i++)
-		clk_enable(priv->clk);
+	for (i = 0; i < num_enabled; i++) {
+		ret = clk_enable(priv->clk);
+		if (ret)
+			return ret;
+	}
 
 	ret = devm_pwmchip_add(dev, chip);
 	if (ret < 0)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
