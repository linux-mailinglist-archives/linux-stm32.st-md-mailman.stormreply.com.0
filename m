Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4328D7686DD
	for <lists+linux-stm32@lfdr.de>; Sun, 30 Jul 2023 19:49:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3293C6B470;
	Sun, 30 Jul 2023 17:49:58 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0DC4C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Jul 2023 17:49:57 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-992e22c09edso548920466b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Jul 2023 10:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690739397; x=1691344197;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=87/hc2oBNjx7AA5ml7v6DGG7KmXPNmXMrKuNLd+Cam8=;
 b=KoV2A2S2VXihDWH28FFjmqkUNx/7SLTAOrGQ9wnBcM/91bkK7BGhEUgOU3A4YRpAHu
 dJHmJ+Y2wCvhqHn/GFCq7xOaRBaQdqwBh1FV9dn2tpiCptiSA23cENGKBHI50c7j42c8
 zHDoYmWAkI6fvZBhdFAWZAeT9MB1s63jqNcp1YCX0fPeHJ1mZz06G6JVrVgAn8LylstE
 kGitWH3MJv6EO+FgkC2GiJJpfsAP2jMvCMLrSHYJMXnGeO84O4A67jJquVk7Mj5xc2Yg
 MpWuz0Tzd/qdZIsNHAWWVvdaMvc0xwoKF6vBjW6ijQ3P3rQ5caw9gZQ9JKV6E3jr1HdK
 cSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690739397; x=1691344197;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=87/hc2oBNjx7AA5ml7v6DGG7KmXPNmXMrKuNLd+Cam8=;
 b=GbV7lvY2FWplNPF804mgPzkvrVRU/Jssk1sqXFPEQbKc5vpinEzoQoDTD8+X5ZeN60
 tFdm5pnae4SslPJ2rDZBF/ruq2wzZqoSBEDY9OttWdURQV0PmQA40wL1duCz0DAOze/7
 6qFTWKGEO4rREdEReX5iozbaCyt2mVc6xyMrtUfpWc+oWp2+sropNQdCAqxrbNWUCcx2
 RRZloDvMV7fZS2svZnmEbc3GJrT6YwNnvBfqXm/SRZOUjsWs+LxQqt05OFY96R1NagOc
 h1/fxbFwMGA3UYh9xZbSRmuQrl2nDeWzv6v6exzXZysB6JARDyANofDIvbXt3q/LpFX1
 Rwig==
X-Gm-Message-State: ABy/qLafZyKeuo30qG1P/nJ4LsfoWzvZUJpcHacD30/Smm1TZFq0OA9D
 iPu0uKIV0QmAqRYuD+9+NMBHsQ==
X-Google-Smtp-Source: APBJJlG9GR8kO2Ji9RE+Ttxw2a12BgviIbh3tv8s6bTvtxdn1bX+lNclOz8m8RLw+QWanNdxGK79MA==
X-Received: by 2002:a17:906:7791:b0:994:34a2:8727 with SMTP id
 s17-20020a170906779100b0099434a28727mr5204356ejm.41.1690739397336; 
 Sun, 30 Jul 2023 10:49:57 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183]) by smtp.gmail.com with ESMTPSA id
 f19-20020a170906495300b00992c4103cb5sm4913537ejt.129.2023.07.30.10.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 10:49:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Sun, 30 Jul 2023 19:49:51 +0200
Message-Id: <20230730174954.5293-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 1/4] ARM: dts: st: stm32mp157c-emstamp:
	drop incorrect vref_ddr property
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

Changes in v2:
1. None
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
