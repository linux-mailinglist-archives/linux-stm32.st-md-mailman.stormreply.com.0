Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F669BBDDE
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 20:18:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DB9FC6DD9A;
	Mon,  4 Nov 2024 19:18:36 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A4C8C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Nov 2024 19:18:29 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-460ad98b043so36536101cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Nov 2024 11:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730747908; x=1731352708;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=unJ9b+rts3y1hb3/PAxKDJbTMcuKEtEuGFYI5bvW40k=;
 b=O5ZlA5QqEkc1QkIxfLWFIXJAxj9LkUsQUGOPYh1kJTpFN/iHVNX3BKVnBlI28Ojovu
 KXyAeCCfmvMA7nKs1ZikbjfPkG629ZBCnUO/9smPKkwJQLuX+JCaiRAZYh3MZdgXfYXZ
 /ATqklF2ZGvIOl/g88Lzu781PWc8HRNWMcj+cNFWJ67r18Roi3jwYdsjK/R/jGzFkuvG
 jZ4r/YaITJDn6PueaJCXGemUrSUtY3JlqeOowvCfrXP5j5W6PQLI0mtoan3UjuuIZ7Ob
 cOXrx0NkP4xdsf6AGyf6OcWQAeaDXz/w4WB6IxODvzwa3WCB16lsdBW0VmF+1g57Zcez
 y9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730747908; x=1731352708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=unJ9b+rts3y1hb3/PAxKDJbTMcuKEtEuGFYI5bvW40k=;
 b=Vrnk+YSRc/FGk/5TKGrqai3ZHoI8lPqWhKhWSaMLFjWkwYRjQcuHIZyZCt5wxmEZoO
 CIKiwMEb3e4Y/Vfc94y9/VKhABnvCoynmFURkbcMHfLxCvURxcortxTtE45iYZz1hwjh
 8SX52n5uyPHfGQeg5aBNcLIp39R1Yj9e7t9+6NRB9DZ9QGOvrdldBGe3qTzMyUpAKLBY
 wDy9m9P9jMbFlJ9ZFmMU9auMc7N2diy0D2+ry+DjAmK1BY9yZkT7YuYAsfDe6Yfn2YXY
 Gxtm80xbypzoW27GsO24qvHTLhmKjqJPCETGvD980u2431/jZn107FL8fmBYflFXs3Om
 NGKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP7bxF74eWkjgsyfeKH1yos/nbhTrADYYI0ad1xjcleJNcpOft7tZVWBeIW0ly1v+b4a34zhpqGvSdew==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwptUvnhIQfXag3bubCVkbUdF9oZvAa53eJo5RB+NyxxE1IgK78
 GGW6LH1sDveSXs2cDkMoYTDIbQcUOfLrYqDdwCaEmj6GlUJw5pLA
X-Google-Smtp-Source: AGHT+IELakiFzr59EudtKLiMCMHPt484NaNIT6Kjz/ZSDX/NpW9fjmCjoWrs7c/vQ4eTZTNX7i2z4g==
X-Received: by 2002:ac8:58ce:0:b0:44f:fb6d:4b2f with SMTP id
 d75a77b69052e-462b6e83130mr228655931cf.23.1730747908255; 
 Mon, 04 Nov 2024 11:18:28 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-462ad086e55sm50174351cf.7.2024.11.04.11.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 11:18:28 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: wbg@kernel.org, fabrice.gasnier@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, Jonathan.Cameron@huawei.com,
 benjamin.gaignard@st.com, gregkh@linuxfoundation.org
Date: Mon,  4 Nov 2024 19:18:25 +0000
Message-Id: <20241104191825.40155-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2] counter: stm32-timer-cnt: Add check for
	clk_enable()
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

Add check for the return value of clk_enable() in order to catch the
potential exception.

Fixes: c5b8425514da ("counter: stm32-timer-cnt: add power management support")
Fixes: ad29937e206f ("counter: Add STM32 Timer quadrature encoder")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v1 -> v2:

1. Add dev_err() to indicate the reason for the error code.
---
 drivers/counter/stm32-timer-cnt.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 186e73d6ccb4..9c188d9edd89 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -214,11 +214,17 @@ static int stm32_count_enable_write(struct counter_device *counter,
 {
 	struct stm32_timer_cnt *const priv = counter_priv(counter);
 	u32 cr1;
+	int ret;
 
 	if (enable) {
 		regmap_read(priv->regmap, TIM_CR1, &cr1);
-		if (!(cr1 & TIM_CR1_CEN))
-			clk_enable(priv->clk);
+		if (!(cr1 & TIM_CR1_CEN)) {
+			ret = clk_enable(priv->clk);
+			if (ret) {
+				dev_err(counter->parent, "Cannot enable clock %d\n", ret);
+				return ret;
+			}
+		}
 
 		regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN,
 				   TIM_CR1_CEN);
@@ -816,7 +822,11 @@ static int __maybe_unused stm32_timer_cnt_resume(struct device *dev)
 		return ret;
 
 	if (priv->enabled) {
-		clk_enable(priv->clk);
+		ret = clk_enable(priv->clk);
+		if (ret) {
+			dev_err(dev, "Cannot enable clock %d\n", ret);
+			return ret;
+		}
 
 		/* Restore registers that may have been lost */
 		regmap_write(priv->regmap, TIM_SMCR, priv->bak.smcr);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
