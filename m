Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B83FB2C510
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 15:17:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57729C3F94D;
	Tue, 19 Aug 2025 13:17:16 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 073BEC36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 13:17:15 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6188b7895e9so758694a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755609434; x=1756214234;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eYMdhxIUQ31/cy7vzWDrnpVEGbQxqOB4QZi3i8Wf6a0=;
 b=bNULXCedemd5gFsV9SirFWcIs865CpwZg1Os/Qn+s7uC3wkz8mxRasiOWnm5d70tgh
 LFBVZvmd3xUk/XEZDSyr7GFcEglP64gXf1+w+j5nCTKtneQltSR5Jj8SUYZ9xLhl+jwI
 VKsrJ9rEix3mofdX7RqB86LTuoww8mFuh462neohWWtrGen8JdHcdpZJ6tf5XSTMzfXn
 KGsCMRrCB6bXJpFuZSC2jDQgwSpiDRujmhO/AGYeC1wCpt3TEGRe1ldXjqxDvlDTMjm2
 No90LqTmyR83WNkqAf6iKusuAhWsE9SnOQiqEtDy9ZFQNj3M0bw/KSSLDA5l+E+p/kSM
 /pQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755609434; x=1756214234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eYMdhxIUQ31/cy7vzWDrnpVEGbQxqOB4QZi3i8Wf6a0=;
 b=Wh+BkrJOO8MHUPMeP7/D+uyPn/EHu31VUu+H1U4usfObTniBNOfOUKr3TGQjid+rPX
 YEs4h+v2+rp8TWOiQGrdGynQgdxHWcIIxs8spn9My4jQzCkf3cPyy5jDQnIGwSgVjAZL
 xEhrHqUS993NRJfhdK+JD7rTw8q3rGT4DJ5tlQ28jz2MlZA7WWbcgA3vOw2DtiqIkG+q
 qm2Ixs+j//JHS3YxPCqkxAKfY0rX/d6cBJ5jh+KXXENvTdSwoi7xiW8R0T5PyltFdkf6
 5sJeWSaMtNpmr8/Q6VjPteltiUbDOme/E0yoYZgfVx2Wwu7kRpwm7sLzi90PhhZQ65DD
 ag4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDbz/pQjK0zOLQJ+jvBrBV4JQyefOaOSWbJjTGGWe4hSlRjWLBckn1t8eDjQ9o03exnBb5WM/YbsjaWA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxu/v4QC6JzyN/u+j+6c7KTLQC9zS4CXT+UIoGLv2psKU9mAAj0
 gbCKwXgR+puH9jP71WkH7y23JIesB67ptIgyqajV/erffARBZhh34ye/UjwIcOo1rGY=
X-Gm-Gg: ASbGncvQDzktezMRgz4nNt/77w7oxaLIvQDdhPalZYVYQotZg/qLjzFO67gbgzLZddB
 k26TICatWerFvc26l+L4sp6HAHpHfG5iiCxWEc8d3W3BQIM5JVehbSPPeEhA6Cssweg3WEITqQ0
 aDklUkW3bLWd1Nw+w0X4UyX/BM/yn1KH4mDpu0DSPNd3PesJenoIZ4k+8IpwzvWc0alYWNztAYc
 eteZHEAqPFBRG/f/SXNoytV41n42cnBGA7kHxIn/xVU1dJgKoF5PuPpQ5VZOorxM5drjV1U1WLR
 QXJs/Cd9G+Iv0L5+haLgwChGnJbYouhCLKD1pSxw3a0Gvj3YeAVq/PxrMbk5gMsKO5TjFBqMkVW
 0shb9ryD+nCToT9YTfND4vcy/fOgLKxs7FA==
X-Google-Smtp-Source: AGHT+IGKdkV+1r589d0SVRi3O+feTSsj4hmOGvm3/y18TTqAWbPqtEd00j4EtkVL8S15WigaZDcifQ==
X-Received: by 2002:a05:6402:35ce:b0:612:f2fc:2b9b with SMTP id
 4fb4d7f45d1cf-61a7e6d953emr1012321a12.1.1755609434365; 
 Tue, 19 Aug 2025 06:17:14 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a92678f45sm129674a12.18.2025.08.19.06.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 06:17:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
 =?UTF-8?q?B=C3=B6rge=20Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 19 Aug 2025 15:17:09 +0200
Message-ID: <20250819131707.86657-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819131707.86657-3-krzysztof.kozlowski@linaro.org>
References: <20250819131707.86657-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=CbjadNNNEe8Yn9p48OvNEAWuQJuq9CsOCkHrF+TBmzM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHlUh9ijAKsBRMt2aMyQYJ9QM9JmObsPeF4fB
 AxubSnhgyCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5VAAKCRDBN2bmhouD
 1xayD/9T2Czt91Y2lD5WnyYHRP0t4bhHs/mS2Qe5NTJa2kew7W8Ij/MB5UdXtd0mQcNRTLa1RmQ
 zXdldkv7Q4qLc0e8j8u6/U+ZeGUQ0TNC0amXAXc1XbKOrQI8RmACzjSwjV7bueIInrNE+Wm3xh4
 JjHAbMbiTxjc5DFkVK33xKIzty0UwuTjB0GrFPdA5aMfnRQTrtyux3nG5b3BrlvheRM8u/iAB05
 YdIBZDyrB7Zp/W2+4lxfUuSmRrp8Q9LZX4mSCVQXPKAgKiHcWYQTTgKcudviMw/owCZrKDmfu8j
 Qyc3qwE5+zfAMMHEZGMMBjxd0eFcXj94nTyZET3KIyG76XwIbyuU82mc11GVAk5x0C5jrIFCwm0
 W8ogs68q1bM6Hj78EeyNLzdnVpg8l8wo9c9WIsJwvT8SALOtFSRGeyTh6Jxq5GnQF1HOJKs/TrK
 kUHl7U3aLmpMrPUtwTDtCSdyhIKxNBdfX6AknvtipYJ24n4a953GkS8UVw2FefBkvaCbt/scdjR
 tTYvQMz0UXez7T6LuMsDNIR9DuKvK0PXXcbn01XzwSaI9YmmDPpiSb+y6RnNHn2aoKNQ1FABysk
 YaI8qpT+itvR0oJ1W1chMdyl7JA5C5KpZdSgnK4kLjb6jjrv190uoih1k91q9q4z2S+Pgak9lV2
 zSIyIDqwPENIr1w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 2/2] arm64: dts: stm32: Minor whitespace
	cleanup
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

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 836b1958ce65..4ff334563599 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -100,7 +100,7 @@ &combophy {
 };
 
 &csi {
-	vdd-supply =  <&scmi_vddcore>;
+	vdd-supply = <&scmi_vddcore>;
 	vdda18-supply = <&scmi_v1v8>;
 	status = "okay";
 	ports {
@@ -151,7 +151,7 @@ phy0_eth2: ethernet-phy@1 {
 			reg = <1>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <300>;
-			reset-gpios =  <&gpiog 6 GPIO_ACTIVE_LOW>;
+			reset-gpios = <&gpiog 6 GPIO_ACTIVE_LOW>;
 		};
 	};
 };
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
