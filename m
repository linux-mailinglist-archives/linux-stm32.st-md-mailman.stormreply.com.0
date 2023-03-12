Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A2D6B6826
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Mar 2023 17:17:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B0B8C69073;
	Sun, 12 Mar 2023 16:17:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DD0CC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Mar 2023 16:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678637868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q4/iPsVRBPkg6AepawVnMg1wwRgKOLDi6FjhOobj1H0=;
 b=gEyUrG5Zd8yfVUxPlS/1hrbpv0il4Ja+cG2bOlzYOhEhvyfbmIq4DWr0eXALJkNUY8B0EG
 8gJo7jukvlxp2Oz8DCkuOmpUdqm2jOxbPECU126Li2cJSoylQp4OHJoPP9AGadoa5bidW6
 ZX42RIhYRjPcdHzVIw2AGaeox8bBz6w=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-xSf01exfMOar_DQvR434DQ-1; Sun, 12 Mar 2023 12:17:47 -0400
X-MC-Unique: xSf01exfMOar_DQvR434DQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 x21-20020ac86b55000000b003c01d1a0708so5670222qts.19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Mar 2023 09:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678637866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q4/iPsVRBPkg6AepawVnMg1wwRgKOLDi6FjhOobj1H0=;
 b=hP+ORPcXuZ3IsEBawySJBCVk/4zZ3907Ree2qDeghmtaZy+5RcbQ5Qek4Jj64RALSa
 0HovZ9yZC3zHLo9gsCmIj/66i9gjJugbe5h+fikOV6ht6Km/lTT3RoKfxqhpJ3gSQI9m
 Hp9O1esZp3tjZ69LxFWxKiU9HmDMCwKs81kFUqlESKDOYX8dZDIoVkrZcvAeBC/bv82d
 JRv18BLqS1Tnua5ICUBmyu3mYm0ph5A6ZcDkMxHJhyA8mmZhZ1nvhsQf3LM7uuNwjrrG
 /y0ipzVfXGwwM2UztqhL/Q1miU00RdVJZniZIgYfzFLMs2FSIbMZX8XwiPnSxTMfVHj9
 X08A==
X-Gm-Message-State: AO0yUKXKuLpNJZTcXZl4IQKKqy8yG/y3aAPfW5JH7SU9MLhve4ofKNL7
 73GdzyYPjH/vZ62elwmp1ttad+1kJQtKFcbfsVEGReMdYvoHz+uYpS8tDEdqiAO0LNu6MQvgRbN
 D7/YlBB6nyuoVDq/2oM294XUs1GtiujbrSamd6K99
X-Received: by 2002:a05:622a:1811:b0:3bf:b70c:cb02 with SMTP id
 t17-20020a05622a181100b003bfb70ccb02mr56462026qtc.61.1678637866662; 
 Sun, 12 Mar 2023 09:17:46 -0700 (PDT)
X-Google-Smtp-Source: AK7set/zwEcGLiorbWwvzcLRN7QE8tQwzoIcsH7hK+o/zR3XjwOjx605byBFLnz8cxnvcIf7BNPJ8w==
X-Received: by 2002:a05:622a:1811:b0:3bf:b70c:cb02 with SMTP id
 t17-20020a05622a181100b003bfb70ccb02mr56462004qtc.61.1678637866429; 
 Sun, 12 Mar 2023 09:17:46 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 g1-20020ac84801000000b003b7e8c04d2esm3815120qtq.64.2023.03.12.09.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 09:17:46 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: jic23@kernel.org, lars@metafoo.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, fabrice.gasnier@foss.st.com,
 olivier.moysan@foss.st.com, andy.shevchenko@gmail.com,
 yannick.brosseau@gmail.com, nuno.sa@analog.com
Date: Sun, 12 Mar 2023 12:17:33 -0400
Message-Id: <20230312161733.470617-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-iio@vger.kernel.org, Tom Rix <trix@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] iio: adc: stm32-adc: set some stm32-adc.c
	variables storage-class-specifier to static
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

smatch reports several warnings
drivers/iio/adc/stm32-adc.c:2591:20: warning:
  symbol 'stm32_adc_min_ts_h7' was not declared. Should it be static?
drivers/iio/adc/stm32-adc.c:2610:20: warning:
  symbol 'stm32_adc_min_ts_mp1' was not declared. Should it be static?
drivers/iio/adc/stm32-adc.c:2630:20: warning:
  symbol 'stm32_adc_min_ts_mp13' was not declared. Should it be static?

These variables are only used in stm32-adc.c, so they should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/iio/adc/stm32-adc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 45d4e79f8e55..1aadb2ad2cab 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -2588,7 +2588,7 @@ static const struct stm32_adc_cfg stm32f4_adc_cfg = {
 	.irq_clear = stm32f4_adc_irq_clear,
 };
 
-const unsigned int stm32_adc_min_ts_h7[] = { 0, 0, 0, 4300, 9000 };
+static const unsigned int stm32_adc_min_ts_h7[] = { 0, 0, 0, 4300, 9000 };
 static_assert(ARRAY_SIZE(stm32_adc_min_ts_h7) == STM32_ADC_INT_CH_NB);
 
 static const struct stm32_adc_cfg stm32h7_adc_cfg = {
@@ -2607,7 +2607,7 @@ static const struct stm32_adc_cfg stm32h7_adc_cfg = {
 	.ts_int_ch = stm32_adc_min_ts_h7,
 };
 
-const unsigned int stm32_adc_min_ts_mp1[] = { 100, 100, 100, 4300, 9800 };
+static const unsigned int stm32_adc_min_ts_mp1[] = { 100, 100, 100, 4300, 9800 };
 static_assert(ARRAY_SIZE(stm32_adc_min_ts_mp1) == STM32_ADC_INT_CH_NB);
 
 static const struct stm32_adc_cfg stm32mp1_adc_cfg = {
@@ -2627,7 +2627,7 @@ static const struct stm32_adc_cfg stm32mp1_adc_cfg = {
 	.ts_int_ch = stm32_adc_min_ts_mp1,
 };
 
-const unsigned int stm32_adc_min_ts_mp13[] = { 100, 0, 0, 4300, 9800 };
+static const unsigned int stm32_adc_min_ts_mp13[] = { 100, 0, 0, 4300, 9800 };
 static_assert(ARRAY_SIZE(stm32_adc_min_ts_mp13) == STM32_ADC_INT_CH_NB);
 
 static const struct stm32_adc_cfg stm32mp13_adc_cfg = {
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
