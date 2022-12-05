Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E84642B3E
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 16:18:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28B3CC65E6E;
	Mon,  5 Dec 2022 15:18:56 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B39BC65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Dec 2022 15:18:54 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id x28so1750612lfn.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Dec 2022 07:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0y6Fl5nmmyzxTIPnsN7I5cMbpP4z41yN4XYoyu6c3jc=;
 b=mO+7zarx+DxucFPY10l+B3VsMhLELHKJH6rHq4ek7bqaXb+qR1hTZOtn3rws92g0jO
 FTlJrua1bI1nc/P9HWytW0LW4bezurnVHeUxbEtka5AXvLRiiVSh2YMleTy8jTQpSZS5
 Q/3sswD1Ld3MisWiPYe3Vx86xcEj6U7csGU4z86svc66gc1F5vobXfwfg+o3FZwwbh6e
 6bB11NBSw8EZ2SZzDLJKRZHR7rIc9XSxc6i4VpfOM09o3s0ncDtFaIguC228+yyrH3t+
 4KipmNfx8fZl4jQyLu9Nq385iR6uS6ccqfOxiOAfMfo2HijzNapnX/yKZqMcfE0yNprc
 JhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0y6Fl5nmmyzxTIPnsN7I5cMbpP4z41yN4XYoyu6c3jc=;
 b=aeZSTV4rTINHSAM4NzIBV9mhuKkdVLzCtYkzFpyeEBX7zjexKaXMJ0lj+eJPLb5YIA
 i1LoWpN8ZZZcBireW5FQXH352EHoemiOjXfvM9XYBTLb0ca2asZJ5BOPwAxzDF1V4QeD
 0fj9nUL5SLmzsvj6BDxm3z5FeQz74RaWQ/vKAXuw0qH3vG9OUGV2TK65Q4wx09JQRQ31
 4BGjNNlgMPzsO1EyqYBdekJCB9IhxfIsLigWyUA33qWanUWvcpGiVn8FjzKXsfeYK9uN
 st7gEeimvi1CIfwRhZsojkMA+bUFgcfMDIIg8CObj4A8y4C562EJ35JXNvCboXzSWbEd
 BXCQ==
X-Gm-Message-State: ANoB5plykTqTEC2PyrRvdlgFFqNx78/Q3fxWpEzcnoYUSELnsxymOOHd
 5SnWOrZGtQPA0GaQrrvSldRZNA==
X-Google-Smtp-Source: AA0mqf4eQ3eDlVcaTMJOzJGRvcxfn6xFqaVgJoOB7uHiBOYlxYooiHYb5ToMFm5HnBlbDhFaIemAfA==
X-Received: by 2002:ac2:4159:0:b0:4b1:5a96:983f with SMTP id
 c25-20020ac24159000000b004b15a96983fmr31113889lfi.535.1670253534125; 
 Mon, 05 Dec 2022 07:18:54 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a05651204da00b004b55f60c65asm1012470lfq.284.2022.12.05.07.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 07:18:53 -0800 (PST)
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
Date: Mon,  5 Dec 2022 16:18:40 +0100
Message-Id: <20221205151845.21618-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 4/9] media: dt-bindings: amlogic,
	meson-gx-ao-cec: reference common CEC properties
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

Reference common HDMI CEC adapter properties to simplify the binding and
have only one place of definition for common properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/media/cec/amlogic,meson-gx-ao-cec.yaml        | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
index f65c9681a9f7..b1fab53418f9 100644
--- a/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
@@ -33,11 +33,8 @@ properties:
   interrupts:
     maxItems: 1
 
-  hdmi-phandle:
-    description: phandle to the HDMI controller
-    $ref: /schemas/types.yaml#/definitions/phandle
-
 allOf:
+  - $ref: cec-common.yaml#
   - if:
       properties:
         compatible:
@@ -81,7 +78,7 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
