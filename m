Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DD53F930D
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Aug 2021 05:48:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B5BBC597B4;
	Fri, 27 Aug 2021 03:48:26 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9A35C597B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Aug 2021 03:48:24 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id y11so4529469pfl.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Aug 2021 20:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NBoYGyBiTNoAvtIS6d3/4JvR5xP0NBcEY2yL+79p2+4=;
 b=IKvI3Xk6wcnJEsbj1ToKZV3yCQZ4JXDWX2afKN88MDwgvUrlFJE02x9JAH+OtTy4Gh
 SpFsM2lUbWTtLwz1ktES0Rh3tickoWHRYf7h9zCLzt2dukiiftidOqKUDdC3c3ivqmwk
 3belztgEeWDqQh6KC5qfSi8BiJTLI2uLcw1SnUWHj8Wnh0CaIYklRAZ5wrBSbBTPIm+P
 LjTDkKdheHTJ2vOpV3s/TvF2FF6kLmLalwI+7QlO+2+0+DGreRExm9jstq4DcI8sweXp
 QJTfef0e/uA0A75g6VQYwgpdX9Dk3BOOQwbRdb0ySJZWw0PTZT1P8QVzFM6lhk2gn0DU
 JaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NBoYGyBiTNoAvtIS6d3/4JvR5xP0NBcEY2yL+79p2+4=;
 b=LdZ1AZ5N7MDMPwNUvH1just+RgXrXt6vN+qI4x9Air7ym8H7AwtdeTbylASRKag8rc
 FLnVGlRljloKyPHzvazxkNmW7t+XU1jcmeLP8ixT6Jb07CKgIyvdjxAYsCwGTZB+WYCv
 jWZSj2YsvTyBtpLhuq/4DFtVbLzh1BnHk6R/KzXgdE4OvCkS9l/XR+feUtwYORrTvRGg
 KnnHi6kYR/ZFjALX7ENrwd/9AxYCet/f97UI0/VPQP/ogl1rX0TT0laeLYkjLSknc3cy
 6tThPEEYiFPvXyJ4fmVa3ApuQsLl+20wpZvNh6Q7B6cGVpBFQZtPLbMU4YGIvTs50ix1
 XKlQ==
X-Gm-Message-State: AOAM533ppdOs9kc8oNKp5/940/Dz0dagCDJJrUlUe4u7iMB76yXF0IrN
 w5h+PH7REkQtrmflY1Dcvow=
X-Google-Smtp-Source: ABdhPJyQg43G+SVpT+iI0BtVFx1OBxsqKuosP0AlvzVxqk7QBS1SyoH7MVnnN5QuYoLD9O9GQ9EfMQ==
X-Received: by 2002:a05:6a00:a85:b0:3eb:1934:de53 with SMTP id
 b5-20020a056a000a8500b003eb1934de53mr6862089pfl.71.1630036103419; 
 Thu, 26 Aug 2021 20:48:23 -0700 (PDT)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id o6sm4364693pjk.4.2021.08.26.20.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 20:48:23 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Fri, 27 Aug 2021 12:47:46 +0900
Message-Id: <ad3d9cd7af580d586316d368f74964cbc394f981.1630031207.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1630031207.git.vilhelm.gray@gmail.com>
References: <cover.1630031207.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v16 02/14] counter: stm32-timer-cnt: Provide
	defines for slave mode selection
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

The STM32 timer permits configuration of the counter encoder mode via
the slave mode control register (SMCR) slave mode selection (SMS) bits.
This patch provides preprocessor defines for the supported encoder
modes.

Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/stm32-timer-cnt.c | 16 ++++++++--------
 include/linux/mfd/stm32-timers.h  |  4 ++++
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 3fb0debd7425..1fbc46f4ee66 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -93,16 +93,16 @@ static int stm32_count_function_get(struct counter_device *counter,
 	regmap_read(priv->regmap, TIM_SMCR, &smcr);
 
 	switch (smcr & TIM_SMCR_SMS) {
-	case 0:
+	case TIM_SMCR_SMS_SLAVE_MODE_DISABLED:
 		*function = STM32_COUNT_SLAVE_MODE_DISABLED;
 		return 0;
-	case 1:
+	case TIM_SMCR_SMS_ENCODER_MODE_1:
 		*function = STM32_COUNT_ENCODER_MODE_1;
 		return 0;
-	case 2:
+	case TIM_SMCR_SMS_ENCODER_MODE_2:
 		*function = STM32_COUNT_ENCODER_MODE_2;
 		return 0;
-	case 3:
+	case TIM_SMCR_SMS_ENCODER_MODE_3:
 		*function = STM32_COUNT_ENCODER_MODE_3;
 		return 0;
 	default:
@@ -119,16 +119,16 @@ static int stm32_count_function_set(struct counter_device *counter,
 
 	switch (function) {
 	case STM32_COUNT_SLAVE_MODE_DISABLED:
-		sms = 0;
+		sms = TIM_SMCR_SMS_SLAVE_MODE_DISABLED;
 		break;
 	case STM32_COUNT_ENCODER_MODE_1:
-		sms = 1;
+		sms = TIM_SMCR_SMS_ENCODER_MODE_1;
 		break;
 	case STM32_COUNT_ENCODER_MODE_2:
-		sms = 2;
+		sms = TIM_SMCR_SMS_ENCODER_MODE_2;
 		break;
 	case STM32_COUNT_ENCODER_MODE_3:
-		sms = 3;
+		sms = TIM_SMCR_SMS_ENCODER_MODE_3;
 		break;
 	default:
 		return -EINVAL;
diff --git a/include/linux/mfd/stm32-timers.h b/include/linux/mfd/stm32-timers.h
index f8db83aedb2b..5f5c43fd69dd 100644
--- a/include/linux/mfd/stm32-timers.h
+++ b/include/linux/mfd/stm32-timers.h
@@ -82,6 +82,10 @@
 #define MAX_TIM_ICPSC		0x3
 #define TIM_CR2_MMS_SHIFT	4
 #define TIM_CR2_MMS2_SHIFT	20
+#define TIM_SMCR_SMS_SLAVE_MODE_DISABLED	0 /* counts on internal clock when CEN=1 */
+#define TIM_SMCR_SMS_ENCODER_MODE_1		1 /* counts TI1FP1 edges, depending on TI2FP2 level */
+#define TIM_SMCR_SMS_ENCODER_MODE_2		2 /* counts TI2FP2 edges, depending on TI1FP1 level */
+#define TIM_SMCR_SMS_ENCODER_MODE_3		3 /* counts on both TI1FP1 and TI2FP2 edges */
 #define TIM_SMCR_TS_SHIFT	4
 #define TIM_BDTR_BKF_MASK	0xF
 #define TIM_BDTR_BKF_SHIFT(x)	(16 + (x) * 4)
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
