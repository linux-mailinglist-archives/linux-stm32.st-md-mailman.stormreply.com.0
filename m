Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A27AB641EA2
	for <lists+linux-stm32@lfdr.de>; Sun,  4 Dec 2022 19:29:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C003C65E5E;
	Sun,  4 Dec 2022 18:29:22 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ED9EC6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Dec 2022 18:29:20 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id bn5so11194908ljb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Dec 2022 10:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t+PteMG/Ads8tC893Hy13VLmIBDMK2suUNCe/1HZdDs=;
 b=zP5nnhCXiClJ1DgCHNM3yk7JNqSv02YTEZax4FH6Y0gPcr14cFqylT8Hbkz3SNtRTn
 MkkF0S/zRYGUQLLy4DbRInPHw2yzVtW7QyTVzI4pU4RpNqkljZEkCcCg/LtaUqR2smha
 hbhh0k+4K7ONv9Dwd34Xy49ceZftpvWYk8vLjLe/4r/8nB6LiBKf0wYrWO4+eP0fH/jD
 3L9eUcSGuHBbDzFwLP8nW/QAjNXtSdRxAemSmyqfsEcvdW5FPFWbBwVX038t0+yVF/nA
 QpcSWxI0MFIR6ADPslPbPPo2k43pYt8w9InuRouSkiNz/hL1UPAbLyX8H8DHD/vrcD1A
 Zhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t+PteMG/Ads8tC893Hy13VLmIBDMK2suUNCe/1HZdDs=;
 b=Yana+S8BuYdiAtnmYUXtq7a/3fEo+Hs8e6md/jAtDp9LAKTPXHUMcj0b5J13AH47Jy
 sYdJMrern4YewpTdFfBtisdp8fZMhXocsHCL/C85YUPdDYVQDu4wnT7FeNvk4kDQSi2c
 u0nMpQbhoB/c2vbojzq6Z+0o9M0vID69gRyq06swf+Ytp1f1lieSfX92li4ksMaLt6ar
 vPvgHDwHqqPuM5untvAL8GN6g4dQHi7a1FNRXGowPIx2o66iKND02b+OtqChgrkVdrLv
 RHRDh4m1U8RTG7Qb8VPsiyY5W/MxNhLBiT7Luyk3xohN9NC0YL0PoxwLDGiEJDwK1O6Y
 z33Q==
X-Gm-Message-State: ANoB5pnCPlbTPEn6bFI1neZ7Bhjv3NPjI5a8ZVobegIPihUEFCChy4E6
 I519VyJZtsAIuSIC2nqU9Fl73w==
X-Google-Smtp-Source: AA0mqf7cT4VZxE40h1S5qRGuAOZwWxzBWZBIYv7ax4dztOW39Zzssoufn9ODgvCoaB+u5NHzZC0IXw==
X-Received: by 2002:a05:651c:1145:b0:277:8759:bf65 with SMTP id
 h5-20020a05651c114500b002778759bf65mr23608947ljo.108.1670178559826; 
 Sun, 04 Dec 2022 10:29:19 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a056512340f00b004b3b2a9f506sm1838996lfr.4.2022.12.04.10.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 10:29:19 -0800 (PST)
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
Date: Sun,  4 Dec 2022 19:29:01 +0100
Message-Id: <20221204182908.138910-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 2/9] media: dt-bindings: st,
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
