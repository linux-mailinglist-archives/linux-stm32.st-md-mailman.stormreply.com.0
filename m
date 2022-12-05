Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3395D642B3C
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 16:18:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E996EC65E62;
	Mon,  5 Dec 2022 15:18:54 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFB53C65E69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Dec 2022 15:18:51 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 1so5455028lfz.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Dec 2022 07:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t+PteMG/Ads8tC893Hy13VLmIBDMK2suUNCe/1HZdDs=;
 b=TyQKk5Jb/oTm+Kxu2GX9IYiCfH6m5H2YSYAaAsoQ4Xqhn0YSesbd+oJMZwhLzFIhsT
 uwPxEQiUzlRp2ZKGDHIMUWEM9hqwXUfS7wDSGb40/dB3jgxmd+WCeSGBZpWRAhpQblxZ
 woNdwJs7zRHNHg88D85YeUu8115asVSudFEajY5oe5yU6SNTBFmS1ZUh9YvzGT+PB0fF
 JFoGP/gUE8u5ZeUctNk1FTBoQkLcxpuv5B6UdCR4RAiZUa+O+EltMAzNWjagUULlVcwg
 R18gDUIVgp9X8sU3JDEez55GjaLFGz6gKm8Q/KiDjfumjmwKDzYRb2bAzyeG3MITLtCd
 34Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t+PteMG/Ads8tC893Hy13VLmIBDMK2suUNCe/1HZdDs=;
 b=og2iEyXe4kVaLHqZZjVXG1XyUGLaNOnj+AMMPyCmtoBM9HG57+iUZeNibDSb/XK9uL
 YbcU+Yp9pyspxg5UYo1Cc8STa1wSJnVwRIL+Uxl6CmtLvqkGkmKWnX5iH4x7XAFtV3Cd
 PJLAuetC/iM+dIlTrdbZWCI4X/ynhleqNaE1h9JriDAUKOv4gzhi2QD61mPcnIXHNtYp
 K1GipAN5bwnijFMvv7VP5ckUskNSLhwsqIvh8aQD3EBpVGuW4ALWcp6+CalGwcuXvP5j
 vRJQuExBhLVsDwmtXWL2SrCScnCossNVi1RCUPLBrQAd46gDxllkGjkYKl0WHcPJOi9r
 e9Dw==
X-Gm-Message-State: ANoB5pmnBf2Ek8LpEgUXX1Hyprl6IfE+S26zC0HHDFC+n3Ew12Zu/Zd4
 f3RJ1px0LyFjGJm7aIcN2aHwdA==
X-Google-Smtp-Source: AA0mqf78FJH5p0ax6RFYVZeoFxmMuA7VAWipG1lyz5YZW0n7TWCLHLZ7zCLyYkWtLb4MXZoQZsJMGg==
X-Received: by 2002:a19:654c:0:b0:4ab:e1c9:f9b1 with SMTP id
 c12-20020a19654c000000b004abe1c9f9b1mr22905192lfj.378.1670253531188; 
 Mon, 05 Dec 2022 07:18:51 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a05651204da00b004b55f60c65asm1012470lfq.284.2022.12.05.07.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 07:18:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Joe Tessler <jrt@google.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Mon,  5 Dec 2022 16:18:38 +0100
Message-Id: <20221205151845.21618-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 2/9] media: dt-bindings: st,
	stm32-cec: move to cec subfolder
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

Move st,stm32-cec.yaml bindings to cec subfolder and drop unneeded
"bindings" in the title.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/{ => cec}/st,stm32-cec.yaml     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/media/{ => cec}/st,stm32-cec.yaml (89%)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
similarity index 89%
rename from Documentation/devicetree/bindings/media/st,stm32-cec.yaml
rename to Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
index 77144cc6f7db..2314a9a14650 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/st,stm32-cec.yaml#
+$id: http://devicetree.org/schemas/media/cec/st,stm32-cec.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: STMicroelectronics STM32 CEC bindings
+title: STMicroelectronics STM32 CEC
 
 maintainers:
   - Yannick Fertre <yannick.fertre@foss.st.com>
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
