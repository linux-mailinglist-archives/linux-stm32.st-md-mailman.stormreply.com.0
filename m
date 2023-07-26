Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2DB762C76
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 09:04:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6512BC6B45D;
	Wed, 26 Jul 2023 07:04:02 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C3FCC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 07:04:01 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-992b66e5affso1049457766b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 00:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690355040; x=1690959840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KBZ9nkefs+Guv5W4o1fCyA4lt8kjyOA2HRoasDNFuK8=;
 b=jhhnyEITh5AaGNVeGXy/ByEcFQXL+Sjx6SGJ8azKZODSlFR3+UVgKmfZ68dGz3cN5e
 0Cub31uI8AeH7fMUsCHZoRzaPYz/+kpw95/s4FCUtL524aA2dmy7fdOU1Ve4PAb4t2W1
 Ek4kaHRaDh6ZcrzS9m5+QjNVANz8z1MBxx3S83IKzNNh1boYh5s/z0SS3AvqwPBXzNa/
 RmUT/X9cCZWRbkZ909fxrLVkSQ5lxyXgjHxeUqCPUEgrkSBYmCmv4/9hJ+i7IL5Ljbod
 rWS3hE4aufZ+8fQNhnisFBnkUBfSPgkY3/mpTYLUNDzkqbwmWrTUAAoUwYp3p/cOWeQP
 73cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690355040; x=1690959840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KBZ9nkefs+Guv5W4o1fCyA4lt8kjyOA2HRoasDNFuK8=;
 b=bo1yWMPpyAtD5Qxt7zCUTree8Mk7o/4hDd44LW4mHUps27LxR73sjEsAIh9OgEn9dl
 ZPOUhsvDUaIB6BlRu06K0TVmtqjwr2gA7E9G0PBhT3lVQPTefPM+95La1siqvVcohayq
 nETVXbMsBz1JsTXeBgJK4iWJM6iyEV6wkusNKgOMC6bieWbhtdfwsWJ2NaXkaWiU7EW1
 GYZC3gZbZRBlmFQYSwlM6KFyEQ3PUF+0kZA27hlMLDUgKm38/Wz67zvuPIGP/4VZ5WAJ
 7VDWz0vhNOn+JvwzT414QHWSkw1dnQnF1aMKYSke7XMpB211llMzBLQ4afLUYHDTwbhq
 nfoA==
X-Gm-Message-State: ABy/qLaN+dGsBEL9eHv46AV/dfN6//RYNa4VNhs+n8Fn+Wmv1y05xSz6
 9T4RLU7mONM8INTweRlokhpgAg==
X-Google-Smtp-Source: APBJJlGn3l9hRuVm9wnbpKyx/+KTgfdlF7yVYlWpOmc5m8Up6hQRd6J8D6rVsblNvjqg6B4+wve9sg==
X-Received: by 2002:a17:906:73c8:b0:997:e7d9:50f7 with SMTP id
 n8-20020a17090673c800b00997e7d950f7mr967939ejl.66.1690355040781; 
 Wed, 26 Jul 2023 00:04:00 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104]) by smtp.gmail.com with ESMTPSA id
 ks27-20020a170906f85b00b0097404f4a124sm9212372ejb.2.2023.07.26.00.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 00:04:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 26 Jul 2023 09:03:53 +0200
Message-Id: <20230726070353.103989-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726070353.103989-1-krzysztof.kozlowski@linaro.org>
References: <20230726070353.103989-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 4/4] AMR: dts: st: stih407: drop max-duty-cycle
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

"max-duty-cycle" property was removed in the commit f747a1fe7848
("regulator: pwm-regulator: Remove obsoleted property"):

  stih418-b2199.dtb: pwm-regulator: Unevaluated properties are not allowed ('max-duty-cycle' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/st/stih407-family.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts/st/stih407-family.dtsi
index 3f58383a7b59..29302e74aa1d 100644
--- a/arch/arm/boot/dts/st/stih407-family.dtsi
+++ b/arch/arm/boot/dts/st/stih407-family.dtsi
@@ -111,7 +111,6 @@ pwm_regulator: pwm-regulator {
 		regulator-min-microvolt = <784000>;
 		regulator-max-microvolt = <1299000>;
 		regulator-always-on;
-		max-duty-cycle = <255>;
 		status = "okay";
 	};
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
