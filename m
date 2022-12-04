Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B6C641EA5
	for <lists+linux-stm32@lfdr.de>; Sun,  4 Dec 2022 19:29:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 905F4C65E61;
	Sun,  4 Dec 2022 18:29:24 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40786C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Dec 2022 18:29:23 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id bp15so15309439lfb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Dec 2022 10:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k3M3VyN+gt6ftGeaDe6rXF+qMLaJNZCrheDPOaVNkN4=;
 b=Ds+u0ZbE0sJq/iBjWNK+IxPNbNDviPYZcAp+xql3tG9OD0vWUJ8mfgXG/Vaw9ddwiW
 xEav0N5hivFM+WsRUKsisnKVi+OmcpfL+dZh8IyGIx3ry1F7tciUd61J6xe5BkkBOu35
 qcgH6KTuszPG+CggawH1zVfd+rwsK/WqTeoFO4uhXP40rVGDcGMBqo3AJ7jCC99KeYuS
 3slDIWRZWydsycY6PPEmkDMDfNgcnAMpx0XUZpzcDVZls3N9jS2EkxyZUeIlfG8lW2To
 BbA7HiVcq1qaBvak1jJPKyygT50cVcPfUrAjRvEflATLZXrFKApwLkzPdn4FeUE+3iUa
 XySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k3M3VyN+gt6ftGeaDe6rXF+qMLaJNZCrheDPOaVNkN4=;
 b=CyUP74RqrqHdOH9KShDon7gikV8PGffw0nh2j91kRAZJ3RiJB++qi6q0XBGIpQZhDZ
 8Qe8X3DR1kQ4P6W8rvNl8y2DdQxitywzLMd35h6c//fPzoUMty5/GcrbHdGauo54MsGm
 m3wf72PfALH7FX87PLjZG8oYHMtn4mIzwnzqMa31ppoxKvYl39qGkg5ZvylrmGGO09Po
 S2TMcOV4h5romGfrbTTqDDTZB6gpYoorc9l28iMkbZm1HppIUhx1RnbrE4LYryd8zQs6
 7boYS8ICHD1HW+loeFz4M+bu1NHISLCReFu94n0DcYkOLjfL8XMcC/s/nOM92v88Ao+S
 2Jog==
X-Gm-Message-State: ANoB5plb7rH9eEkBHatdM4SMHz6CEQTNdb6UTZLyhZj9Ju8WjjFVroO2
 JZD4ZK1fwAU/A3jh3wWxnWZXfw==
X-Google-Smtp-Source: AA0mqf6pY51XPJcwK4YklKJNLUWc3bAAU36hqO/Jj5kXIUWVKjswhYHVnyQo7swA5lN98jdcrzxwiA==
X-Received: by 2002:a19:f713:0:b0:498:f36a:76fa with SMTP id
 z19-20020a19f713000000b00498f36a76famr27418948lfe.532.1670178562707; 
 Sun, 04 Dec 2022 10:29:22 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a056512340f00b004b3b2a9f506sm1838996lfr.4.2022.12.04.10.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 10:29:22 -0800 (PST)
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
Date: Sun,  4 Dec 2022 19:29:03 +0100
Message-Id: <20221204182908.138910-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 4/9] media: dt-bindings: amlogic,
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
