Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F397686E0
	for <lists+linux-stm32@lfdr.de>; Sun, 30 Jul 2023 19:50:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41329C6B474;
	Sun, 30 Jul 2023 17:50:04 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E74EC6B473
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Jul 2023 17:50:03 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-99bf3f59905so360136466b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Jul 2023 10:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690739403; x=1691344203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yKdWXJFxJOmvyguMabmhrddMvFGn8oXWx7/tkmVRvZo=;
 b=CPmpGeWzZs3ZL/cGyJyLCAYINXnwa8buI2DaqarinlaeP0atyea+Gg52V6zg2EbzFr
 XyLyaILCl/HRUQKAA0+a28N8kgavE/I/q7xwtvTD9eWnjHTHCiOkto61goP5DEyH1CKE
 zBgpLdPI7nbWs9ngARyiMSS7SVMZqok6Q3Jak0VQgJSxzd7y44rlvLcH3UDC+PiyjmgB
 7f4QHoi1TAO4jnvYo/Q+J79xffCyiEBWxY97M47hFYHO9qZibnIJt7+UnmA5pq3RgXbe
 JU88sehUMYk4MJzGHHAkhz8vQhjvVE82fLEYCUE/s4yeYkTkriY9Uh0ogNVRU+ZWobuE
 9AYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690739403; x=1691344203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yKdWXJFxJOmvyguMabmhrddMvFGn8oXWx7/tkmVRvZo=;
 b=kbvY4N+N34736898QKG9ATGKz5Tj46m44ovKUjeZU8J30IeAzbEFHrT76K26w2zaiU
 BwvxrBmVZJRJ8JGzPxjIRkfGq/60T2T7m9PTIVvT+hDDATWB7gJJJ8rnhbJIUw2yURr3
 1/zei/bnm1xHg2Nu+vHkQ83/jzlcIJ5mUVcfYRZkLBsTXUVUvlJKy/vXWXZ7K/MMX0f7
 ggZGyaVUXlVlEUE3QExDWpUtL0GqumEUltRsImyBT8O9tsNLFtUMMh1UGzh3ClTk8HJJ
 n0ZsyzVLbRdh7dbDGvY0TcQMBFYwZhKccRkX2Ekit0/xL0wiDOdWXKhPZYxGQf1qp4Ut
 ZmYw==
X-Gm-Message-State: ABy/qLYlsCuijcwCcAo/0eHo0Z1+4ibHRIcOHiE+pvg1c44FhBn3mi67
 OiqEHLntHPSofLMzfj7H+3idqA==
X-Google-Smtp-Source: APBJJlGC3sCLh5foHeUM1Fe+v1Io+TMzDHc0uyIKAFYSSMPfT+pMaUaoyiVW/Ba3seMgfmcKBGAthw==
X-Received: by 2002:a17:907:7798:b0:96b:e93:3aa8 with SMTP id
 ky24-20020a170907779800b0096b0e933aa8mr6102323ejc.21.1690739402898; 
 Sun, 30 Jul 2023 10:50:02 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183]) by smtp.gmail.com with ESMTPSA id
 f19-20020a170906495300b00992c4103cb5sm4913537ejt.129.2023.07.30.10.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 10:50:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Sun, 30 Jul 2023 19:49:54 +0200
Message-Id: <20230730174954.5293-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230730174954.5293-1-krzysztof.kozlowski@linaro.org>
References: <20230730174954.5293-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 4/4] ARM: dts: st: stih407: drop
	max-duty-cycle
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

Changes in v2:
1. Correct subject prefix: AMR->ARM
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
