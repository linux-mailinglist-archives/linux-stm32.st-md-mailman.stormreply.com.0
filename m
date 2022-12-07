Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0632E645782
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Dec 2022 11:23:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1DF8C65E6B;
	Wed,  7 Dec 2022 10:23:06 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CEA3C65E5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 10:23:05 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id j4so28012096lfk.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Dec 2022 02:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d5ptnyM8tU9KK9vuHrqJhLp9kBHzmtP8NOjNL98W6O0=;
 b=kwnECpHYYs2dljETpxBP82ebzWcB8+wP08KcpTW0mTbgigX6RffI70K/KhpLO/YDC2
 6DwfcxArNz6QB+WP8rHiDiRyFxCJlWR4KIL0b5P82ylwXg++5M3rZhjXdHiiXenylfhh
 WHGDlw16wENi7DG/Sin7l0bUZZT73PHBprW595DmdPO4nQRLmk9Hzom9bLKpofnmbhu1
 7eeohVs98jGdxiVle7XGMFdI+y4jxV+npBwZjmRSfJFJNx67uycw7h98J5ThbGjBDaJg
 KFTspp95uosj6pXTZxb2sC4/FEUjUWOCO/8FUs5ZSXmYLlNvJY4ndBIiWMWqIYdxGArH
 cL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d5ptnyM8tU9KK9vuHrqJhLp9kBHzmtP8NOjNL98W6O0=;
 b=4nxajZm/UEuanoynfGzMhfWsM8WNdDXZYLn7tDrAuCUcV9d5CCOV49Po6N1si/IWwt
 Ci6jSbt7wnsgfV+A9qpWZteOVgDE85Ar/CxrrNku2+NwGtisGopYkXKj63ps8hit2oPa
 k2u37Pe+3gJriQSBxYHwgwPOC10vjc3CXP7JDsDa0DksdeD392dVIlWv6JesXxgPfLI3
 o9fctv7DdqdOH1KmO8VNo2uw4gOZQBWGymmd2RSYWrM9hoZ00RZhg5RWpZqdXKEUiwqx
 5NQxwN8btz3inFKbzyMj2QmBBwAnjirsYRUnVPDdaaKDIOHc1IuXmTR/w3+91W5/vy0s
 magg==
X-Gm-Message-State: ANoB5pknPYiNSV0pUj3vyi82csc7rm1xqIOWKNZ1bJ1oVZygsmofXndJ
 C3Z9jm80KopaKf9s887NvJqkKg==
X-Google-Smtp-Source: AA0mqf4r7f2xeXn7yaYoPkPuO7SMWpWfTPrwG1RH+SDYe9rX4EhYS8TzE8+PgGnMNg3pkiB3apXW2A==
X-Received: by 2002:ac2:5e8e:0:b0:4b5:9370:d084 with SMTP id
 b14-20020ac25e8e000000b004b59370d084mr573180lfq.527.1670408584717; 
 Wed, 07 Dec 2022 02:23:04 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 bu31-20020a056512169f00b00499b27a329esm1953183lfb.300.2022.12.07.02.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 02:23:04 -0800 (PST)
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
Date: Wed,  7 Dec 2022 11:22:49 +0100
Message-Id: <20221207102253.26663-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
References: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v3 5/9] media: dt-bindings: chrontel,
	ch7322: reference common CEC properties
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
have only one place of definition for common properties.  The common CEC
binding expects also node name to be 'cec'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v1:
1. Fix node name to cec.
---
 .../bindings/media/i2c/chrontel,ch7322.yaml           | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
index 63e5b89d2e0b..af8ada55b3f2 100644
--- a/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
@@ -13,6 +13,9 @@ description:
   The Chrontel CH7322 is a discrete HDMI-CEC controller. It is
   programmable through I2C and drives a single CEC line.
 
+allOf:
+  - $ref: /schemas/media/cec/cec-common.yaml#
+
 properties:
   compatible:
     const: chrontel,ch7322
@@ -40,16 +43,12 @@ properties:
       if in auto mode.
     maxItems: 1
 
-  # see ../cec.txt
-  hdmi-phandle:
-    description: phandle to the HDMI controller
-
 required:
   - compatible
   - reg
   - interrupts
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -58,7 +57,7 @@ examples:
     i2c {
       #address-cells = <1>;
       #size-cells = <0>;
-      ch7322@75 {
+      cec@75 {
         compatible = "chrontel,ch7322";
         reg = <0x75>;
         interrupts = <47 IRQ_TYPE_EDGE_RISING>;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
