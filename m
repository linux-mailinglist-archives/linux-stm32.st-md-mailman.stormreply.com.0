Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE56762C73
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 09:03:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DA6DC6B45B;
	Wed, 26 Jul 2023 07:03:57 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3DC1C6B459
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 07:03:56 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-99bc02890c1so71550966b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 00:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690355036; x=1690959836;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n3OYrZEWc/RsqnCiSew02qdPklfY25DFyQPxO4i8A+4=;
 b=udSHl+NPhOY2ohAq0oizF+LL4ZknSMEcg6SfnOiM4VEsNIeqS8Zgr57DfHlQG61DRH
 J5gD1r++Lhl5gFwSaJTjbHTXo2Gb/AeXozdqMsH/vlsBB60NMVJhcj+pHXYfe25szTfL
 gHd0nCrrnivFs/XqvwaMM/fBv/hmnuVyBtmi5qp3wUswoLucGeusz57AhwEXgL+4wLKk
 81ZiYvt/v5eR3nwy+erz3d1aY5VZxsXwwqHtTHgV3g/Gvsq7R9+PFYOm86qqkAi8aUWS
 f3CCjMRgmpFkS1I3F9XKBV2Ze2bsU0BdEFy9DJ0Nw+/n8ZWKaVhskqqyfAo8ldmWna3W
 vxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690355036; x=1690959836;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n3OYrZEWc/RsqnCiSew02qdPklfY25DFyQPxO4i8A+4=;
 b=M6xormkYgDFTPlRyICyhHsmiQ21S8rwnHMGeXREtLzUn/fKOD3oBwcKFNHmuRpN47F
 dqcK/IimnaJ/EDcn0Fn62sLTRXxdjFcUyFilVFyy7odJ7o3bH9zCdI8IpM0hl32ocAMG
 VboLlLDS2zADRBtJxQi1cElEfeBswncF3RRK3ZrpSYlu5+gJTPxCmsCmCEyyJ1Ion02/
 RRZ1NF2jv3e6gVUnQMRvYVzoY1dgWsxYBqAa9tPb1rKY0EmJNhwFJYaj4DzxaNHfAKdS
 xCNeg7MfRuHTE5D4jY1PbyOOSsM017nOJ+fTufw5upIc7r78s7NIVsfVJszPDtxnatNa
 3AXA==
X-Gm-Message-State: ABy/qLayyP8GW1MqWrvJargWPwtM831Yg2uFTDHLBxlUZJSqE0vfhmVW
 Mt6rGwBR2VH3nCaxkaPqBrhHHA==
X-Google-Smtp-Source: APBJJlE/HYLctwUu0akyRKzjFfPG5IVC3SDHcSEFXBMrYX782comSFFO/KzvV7TnO6iIcwhZBqWZiQ==
X-Received: by 2002:a17:906:1084:b0:994:5350:5a2b with SMTP id
 u4-20020a170906108400b0099453505a2bmr719803eju.62.1690355036348; 
 Wed, 26 Jul 2023 00:03:56 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104]) by smtp.gmail.com with ESMTPSA id
 ks27-20020a170906f85b00b0097404f4a124sm9212372ejb.2.2023.07.26.00.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 00:03:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 26 Jul 2023 09:03:50 +0200
Message-Id: <20230726070353.103989-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 1/4] ARM: dts: st: stm32mp157c-emstamp: drop
	incorrect vref_ddr property
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

The STPMIC1 PMIC vref_ddr regulator does not support over-current
protection, according to bindings and Linux driver:

  stm32mp157c-emsbc-argon.dtb: stpmic@33: regulators:vref_ddr: 'regulator-over-current-protection' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi b/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi
index fd89542c69c9..f8e9980ed3d4 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi
@@ -310,7 +310,6 @@ vdda: ldo6 {
 			vref_ddr: vref_ddr {
 				regulator-name = "vref_ddr";
 				regulator-always-on;
-				regulator-over-current-protection;
 			};
 
 			bst_out: boost {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
