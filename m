Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F12646CCE
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Dec 2022 11:31:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 270C7C65E6E;
	Thu,  8 Dec 2022 10:31:38 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33656C65E63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Dec 2022 10:31:36 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id cf42so1394515lfb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Dec 2022 02:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d5ptnyM8tU9KK9vuHrqJhLp9kBHzmtP8NOjNL98W6O0=;
 b=Zqdk9FLKb1U+056szYPwGwZZOCtduYqr9pYvnZ70agJ8neRKwJbE/0KXoVf9PGud/3
 WUUDU/fEZhoXXFg7hf9+IhzSsBiP64yONaa7u5T8aNsgIJdYGPQuba+HXXhMaeC6D5H1
 Rzilnv2cjG1wKqajm+kC9DBF9p2SAL4WDD6JNKqCfElln9GeZVsjaVwzyTVyYJgeipEM
 Csnc1Cy9CHiwtzHyu5sOypvruVbwF4Dckt6L8lOKrui5Ts4xiBE0rlgNDnP/yJ71x/Ep
 QUzxoCtns51f5ylw3SjAEvbdbMCGK16oDkOSKEiYp88amzXcDBhw+o3cDnWsXTLx/n5r
 A1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d5ptnyM8tU9KK9vuHrqJhLp9kBHzmtP8NOjNL98W6O0=;
 b=IwgiVEcRovF/Dh8Px/kAkSCHpioagiVpcELNePFMTnrGIdrMTTITkxs/NFOSTPJSZb
 PaTLDEvyVHUS1kypwINgQahSw1LdHqGqqP2K6aLm8LYNF3Crqj+Ni81OFScw5p4jf91v
 qp78OGyZNnnaUcjT/mSB80PvM4tErHH2RaXx5r4mIY8ZleVfRY0q2QqJMpC620w/1qQk
 xqGpswoT2FWhaoL12Wmvf8GNaqoJGMgwlxRgWoWF6PyuUN5tIVykupKiB1lTaJnFxo4w
 dwnATGjyAAbN540CslUlZ0ZTEMnaF9R7fQWoFTR/17OeVwuQgxCU6GzgqNS9j/xplAuK
 oy6w==
X-Gm-Message-State: ANoB5pmtffqf/OrffRhZA66gXl6di5am8HBUKYxBElezOfbOqqSDP3Ny
 rZx0BEjgf1jbrSrfiksRgRDiGg==
X-Google-Smtp-Source: AA0mqf5tpHiPpZHCEhpkHs1cV3jMDIzMzb1k+nZXnOkFjY2FhmuCd2fWYcDhxvNhmKNesC4O0TZ6CA==
X-Received: by 2002:ac2:4acc:0:b0:4b4:10ca:5240 with SMTP id
 m12-20020ac24acc000000b004b410ca5240mr34308930lfp.482.1670495495875; 
 Thu, 08 Dec 2022 02:31:35 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a2eb0f2000000b00279e5247dabsm1699580ljl.18.2022.12.08.02.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 02:31:35 -0800 (PST)
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
Date: Thu,  8 Dec 2022 11:31:11 +0100
Message-Id: <20221208103115.25512-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
References: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v4 5/9] media: dt-bindings: chrontel,
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
