Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29765A0A566
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Jan 2025 19:54:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1BAAC78F71;
	Sat, 11 Jan 2025 18:54:15 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0F4FC7802E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jan 2025 18:54:07 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4363299010dso2889295e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jan 2025 10:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736621647; x=1737226447;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xPRSMg1Y79bflHzzHnMnAqsVQxqcpqEauFJNoySqrOM=;
 b=AwuteI434WjxF1n/E0IBpnRQ8Z7PTYRVuJQrgsKj+zEADLoegIHm7a15GyuqwRC1kR
 gMi0UOoQPFnEa9qmdt5IaIabZHH0rjkKyq27B96amy9d+O+PYDBP0dt3lA4HzwU4nZZq
 qL1k1lJQvh6cM18ObsdUr61sJ6t+harmiaFvXbke+EKd5nK6bJ/NoW9GYRx/XwiAVfHy
 7LC8H/1tK7+sRTnRjf1+2i8sFJnI5F6zHR9HsySWbgcYk+Yit1jgUI7rSWMf8ivwg3PY
 sWhZ7BTJT13q4U6NlGupprm5Mjtu51+FjbL107nePmSXyMqia6lw8HvXxVx2Kd/yi9Jk
 TGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736621647; x=1737226447;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xPRSMg1Y79bflHzzHnMnAqsVQxqcpqEauFJNoySqrOM=;
 b=PnathWs+dNap0rBaSOrWhU1FmX29GdTDTG2/wEFb8on6Jr0s9tx1noe/T/bwItbjwS
 itwSfWYUFHXTC8rcbV5BGXjD/MhZ+WMG+Jtuj9aPEQ60F46nbEvo3fRabKOxOrCGRq9U
 p/IeIQ8G0uLwjtskh1nI77+NRuS5/S9Y7nbfFZA5kVe0/LXbIEEjbd7VRwfG12PmeQEE
 VZ14L5NWoY7t7l79dM5FBN41bFxIi8ebQyS/9uSnocHsAPlhYDn5cjgqDkUKM0XhUT7g
 n+52BwBth8ET8DTGwZARdyDiGE7lZ1Z1ubbI53kWss8gPN/8U5ihEl0zIWVg5q2MDkqP
 67Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMq3ByqjEvUNhp3JRTdbTIWuc6/FPblRTjIX0L3hBm65yqQsl/No3fMvdJ9oTHEOZvkBr/9EGKVD9r0g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw8X3gj+8EFIUudoQt24Sx+8OBTRojrTOJNj048fiEjy7FY27Pl
 igSxfNx7xVNAi20PwTl3iYKPbaiVYeGYCKVGtyxYl2afBQEKXO2UGxRPKCYVS4I=
X-Gm-Gg: ASbGncvFZaQe7vp8aFnt+DUrvMMIiopLv3xAgRUoD4A2BagdDn4UWcgPibGteFaI7pY
 Y6xJYRTprUVjXl3PEuX+345KnnfqvPsQZUzS3C/Nw2T5NtgGXfkGcTYJhAXg3abQ4zcVwrXkryN
 UkcUyprX8MNPmQoDaiwK2pnIgd343DJObhGjee6GmySNNnEeqb/Mk0+pZgPCIaPeY8Y5VSC7ZGq
 AepEKiMl5EXLsanVOIWUU8LcMiN8tmY7ZReSbus806UlzJVj9kp3MhoxDa5Ionmji07uqc=
X-Google-Smtp-Source: AGHT+IGKMCNZ9lSIpKE90rRk19Kureh0VeUXVKcP8mbMQG8DavWdzbFmeA+Vz1ozm2bjDyjv4IITPQ==
X-Received: by 2002:adf:e3c4:0:b0:38a:888c:6785 with SMTP id
 ffacd0b85a97d-38a888c69bcmr4077895f8f.6.1736621647135; 
 Sat, 11 Jan 2025 10:54:07 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a9fcb7a11sm2315556f8f.75.2025.01.11.10.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:54:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-rtc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 11 Jan 2025 19:54:05 +0100
Message-ID: <20250111185405.183824-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH] rtc: stm32: Use
	syscon_regmap_lookup_by_phandle_args
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/rtc/rtc-stm32.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 9f1a019ec8af..a0564d443569 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -1074,26 +1074,18 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 	regs = &rtc->data->regs;
 
 	if (rtc->data->need_dbp) {
-		rtc->dbp = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
-							   "st,syscfg");
+		unsigned int args[2];
+
+		rtc->dbp = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
+								"st,syscfg",
+								2, args);
 		if (IS_ERR(rtc->dbp)) {
 			dev_err(&pdev->dev, "no st,syscfg\n");
 			return PTR_ERR(rtc->dbp);
 		}
 
-		ret = of_property_read_u32_index(pdev->dev.of_node, "st,syscfg",
-						 1, &rtc->dbp_reg);
-		if (ret) {
-			dev_err(&pdev->dev, "can't read DBP register offset\n");
-			return ret;
-		}
-
-		ret = of_property_read_u32_index(pdev->dev.of_node, "st,syscfg",
-						 2, &rtc->dbp_mask);
-		if (ret) {
-			dev_err(&pdev->dev, "can't read DBP register mask\n");
-			return ret;
-		}
+		rtc->dbp_reg = args[0];
+		rtc->dbp_mask = args[1];
 	}
 
 	if (!rtc->data->has_pclk) {
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
