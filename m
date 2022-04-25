Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2766350E299
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 16:04:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAA37C60479;
	Mon, 25 Apr 2022 14:04:46 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FE79C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 14:04:45 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id l7so29880508ejn.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 07:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bfw7Ovddlbe5fuQTBnG7gPxDqU0ldis3EFn+ik6O63U=;
 b=AEz26bWaEvfDbb5t4AbG182TG19r1l/X05IUJ+vH3MIEogFnH4fEn7R31IB75kWsv2
 19bmvbuvksG+FvVmkY/xjtNCF3EkDL3svXC2kKjzAArbAMv4V0iQGbaZTZgfrZyxj1s1
 UHxiDa3dDBugsiFh0s+aUhsYs6Oq7y8qV///5i2eVr1FM8ju6HnRXVubQkCIJboDkxmO
 4DKtTofiBmfvK/o03CXKAfSzTMnR0DwG4Me3gDrP/LC8MKMmKnPF6L18ZG75YyGiPfOH
 tmm2f4zqIy9JefYDZ04sWIb26q2lemKTu76tF1hyyjw5N+cyhnkclF1zOJ7Z4GNfEF+f
 b38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bfw7Ovddlbe5fuQTBnG7gPxDqU0ldis3EFn+ik6O63U=;
 b=uoNDD0+Hu6lNvYZGs0dmMgl/ZwRVAtEliaXkhXXJTu3epS+eCr6VAT73MX4E3XFFQY
 08WqKL/l2+r9YxG92j2PTJB8tr/mgaCtrfFJvvUs59dSS3E0WMICA+aunTQepQnEn2uB
 yo+plBSZICWttSXRW/UUc49HAcv9NuUlzH+VFKPV/B/AEV1YkgCNAsRpMomvZhwpTrbk
 cVUcIHcZJK2Oiabvp0d6Gxx3IfpPbl1p87i8ryI/lRxkGXhED386EzKg/G5LIUyivn+7
 +n2ZfOa5a6H9pgDar3Qt/XVXnjgWNzIdvfa43wFNJhrY5Pvm0UCt4Sk9G5S+q4uewvqn
 QbcA==
X-Gm-Message-State: AOAM531KnD7Yr2OvxhmAo9mz8YJuKplnjBmAOsz/0J4JeysWiGz4HWT1
 DVRqQONAhO9kPpJ/we/qvVlb6g==
X-Google-Smtp-Source: ABdhPJzVppVn/CGFKgoq3i/K1iOhoC7Cj/AxBhEdlNJwYwG0469109BHlaTisf80vW6oi22PRrj8ow==
X-Received: by 2002:a17:907:961c:b0:6f3:a3f9:bcef with SMTP id
 gb28-20020a170907961c00b006f3a3f9bcefmr1500534ejc.425.1650895484977; 
 Mon, 25 Apr 2022 07:04:44 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 l20-20020a1709062a9400b006ce71a88bf5sm3663554eje.183.2022.04.25.07.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 07:04:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 25 Apr 2022 16:04:36 +0200
Message-Id: <20220425140436.332467-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425140436.332467-1-krzysztof.kozlowski@linaro.org>
References: <20220425140436.332467-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 2/2] dt-bindings: arm: stm32: correct blank
	lines
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

Correct blank lines to precesily separate entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 2f83f2760e6a..80b29f6903f0 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -64,8 +64,8 @@ properties:
               - st,stm32mp157c-ed1
               - st,stm32mp157a-dk1
               - st,stm32mp157c-dk2
-
           - const: st,stm32mp157
+
       - items:
           - const: st,stm32mp157c-ev1
           - const: st,stm32mp157c-ed1
@@ -110,6 +110,7 @@ properties:
           - const: oct,stm32mp15xx-osd32
           - enum:
               - st,stm32mp157
+
       - description: Odyssey STM32MP1 SoM based Boards
         items:
           - enum:
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
