Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA77D641EA6
	for <lists+linux-stm32@lfdr.de>; Sun,  4 Dec 2022 19:29:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F030C65E6C;
	Sun,  4 Dec 2022 18:29:25 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A53FCC65E6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Dec 2022 18:29:24 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id c1so15347450lfi.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Dec 2022 10:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ryJoqPUtDVrF6ZMuGugpVvxdT6Olzct3tNuDLcoDxHw=;
 b=IfFkxwrP2J1yEUneey53OCR0QJMYN7AzZLeaCBqufcp2eaE4MYqTHjtFVJYQhKFAGq
 CS5dL2cp1T0WrQl2ZmyrY4UhTGKIs8hm+R0sw5rumVaswUPmoSGfp0NQFUxwtbllt8+u
 XAhbonsl8ib/T9GefJ6b3q0xb4S01g2gXehEpQmFcSkH4vBfvn8ZJHlcQDxiK+oGxepR
 hBk+Mujnls2YCaYsqvN2Ek9vwuGtD5hq5RsXRKpKtof3vu0oYVgTI95GbFK/sc43hlzC
 ErsbXezeV//52O9fCKNc1nCaUNLbGlbWEc1N3D/Q3Ughd6BS7soYqwCOWSulvuIJ507h
 qRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ryJoqPUtDVrF6ZMuGugpVvxdT6Olzct3tNuDLcoDxHw=;
 b=zN8k4H8Njs+WstzyS9X9DzmTBa+ci+EV+vXBsf0dYUoESPh6X79QSGBe8LTcTgGSK3
 IhNsFMeQ4v2/mwdG9rL9RREA1xYDgeEuAGpbDi0JtaDW0xG4E9zl+N3Rq/pfuHK5S3Um
 121q86joC+gammdMATr6qTVgMQND/72rTgou9KFmZrtIVNtLzKTvlaYEJjEy2/++/b7Q
 zFrmcjSrimcSvDwkhBuVZteVly2rUWi3nsst2wqSzOqQU4SlzYeRP/s8VOs/r8R715xW
 CWDEgIg2ENMjjbVeTCku7OHcl1LKzz+L8CTeJsYqQyYrtVKX0j5Cdr7W8e52P6es2l+O
 dlmg==
X-Gm-Message-State: ANoB5pkxpYT+IuKlLXwU7Ce33s9+AnhbkR8c4WAwVC78S9owrCXQnRoq
 WfbgeCcgdbXrWX6XlI2+nYUk+A==
X-Google-Smtp-Source: AA0mqf7nxPRzYRU2hJOcxiFhlwNOAUgO8BwHiwE2ub621XQoE8wygLtenUJp9XS49uHrcaozZgRRpg==
X-Received: by 2002:a19:6903:0:b0:499:8e29:2763 with SMTP id
 e3-20020a196903000000b004998e292763mr29560291lfc.137.1670178564112; 
 Sun, 04 Dec 2022 10:29:24 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a056512340f00b004b3b2a9f506sm1838996lfr.4.2022.12.04.10.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 10:29:23 -0800 (PST)
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
Date: Sun,  4 Dec 2022 19:29:04 +0100
Message-Id: <20221204182908.138910-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 5/9] media: dt-bindings: chrontel,
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
have only one place of definition for common properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/i2c/chrontel,ch7322.yaml   | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
index 63e5b89d2e0b..50937bf5ebda 100644
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
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
