Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EEFA6DA61
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Mar 2025 13:53:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 728C5C7802F;
	Mon, 24 Mar 2025 12:53:21 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7BB6C78037
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 12:53:19 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3978ef9a778so211384f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 05:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742820799; x=1743425599;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oDq573A1DEo78oa8q5EaQH/G4SAW0wK6UJ6KkottKQQ=;
 b=jVcUyHq9HzpmxF8iWZHXXNQfoXI1e57DZGTQcE0v1uzt9OdaWB30s8K3+qxW5Pl7F7
 3tcXPrqKU1rbG3+QgT932THfscTltsEygallkzhnFrg67F9+1aaOZKi4yWsi+YQmNDJW
 6Qb7B6Ur997IJvxQopt5keg3KCtqF7lSkcjJXlZh61s9hrzWxTeNPuRhvy4wpVvkn+2U
 jOUfA6pjDx4HR+nHkOhoHcwGUZv/glbFBEvQuuEig64/X7jg0Wc+LZdmQs3dwLCC5gS4
 aBITqrYtp85K5LkNMJJULVMLo+fbo6WOclvL3gQcEXBhpSDfHCx9iCdkGoIlBd8JdpCg
 zzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742820799; x=1743425599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oDq573A1DEo78oa8q5EaQH/G4SAW0wK6UJ6KkottKQQ=;
 b=TwP+60kCNy86+Ahp8kG8fKQ0rRBC0ZUBrpEtKvRg5EYR3q9Yxa9szJtGj/3X05bRfa
 p2xSbHg4tIdpvY7RFb4exaVcx9t2n22SmeZhUN1CElNT5C2SxFWLRYm5bzo7NpzoD7ck
 /sbW+4JF5pNsD5NN8ch1qw63Z6BvJlpwaGmMJCTVL41aA/sAytYsevnNwg2YTLlKQ9Pi
 JDglqxoCyAzGo4efYIsrEtP7WYbHHhXgyQA95+yiHnuJapXDKMWlNLhfB3be5fsUbpSV
 IpfrLeCyo76hwJi+GKL4CSG74Ad7V+lB87NGfgL6vu6P1ZDlQ8/Dpbp0jWb1kSao0OJL
 ngNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDuHRg8YSUAXx/FhSXLoJXloIls+dYKgRQcuE4uD1k+S9+2GVGOTGhrkrA8z7MW5TOHKjGtWKCbeOwXA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxLrJDYQOzUzBV90Ory00bO3G7kwAo14XvLsQPReR/SSoI+aSHJ
 Px3F6W4FrESn7zCkKu5aBT6kJ1/MwOK9Ne6+JPlm+pmsLC5T+5csaYJT2V2vUBQ=
X-Gm-Gg: ASbGncsDEdgjLY/kqBViOQb5RKxXceSRhutuvd0JggaaagGGrJmUT8Jgkg2lS6jLHcD
 b2jule0+bjS/vQrCDLsLkLAjBuAZhrSMa5sBS7Kbd0H0zZKjCgMhaJ1NLpOFpaK1TjfLhXxaHtN
 tcDd5TRnRBnp5MtYVUBFwPASdZJ8UMtsYX3/yDlkWftoX1o5MYlsRlzIlvpTpWc95BvNj6gmcgw
 leVOg0wxcDtMn0xxIe07dMyaeyDgR+2T6ZYaHbX7XyVEhfWKYgv+YCKUBKJ/CVC0Xv72DRuSvdx
 U/oMZit0BXZYDvIQQnzg2VCVcXXyXc/wVNob8UFKvEpb9KfNzXYaHfOOxA==
X-Google-Smtp-Source: AGHT+IEyXr4XfE4jQQNiBxD85qyqtlDpxh8WZZdKdE91l17CgQn/QudC/yJi3NGWG6c+9LLhlw/Xcg==
X-Received: by 2002:a5d:6c61:0:b0:38d:be5e:b2a7 with SMTP id
 ffacd0b85a97d-3997f937550mr4866832f8f.10.1742820799028; 
 Mon, 24 Mar 2025 05:53:19 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9efd61sm11017167f8f.91.2025.03.24.05.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 05:53:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Anshul Dalal <anshulusr@gmail.com>,
 Ramona Gradinariu <ramona.gradinariu@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Robert Budai <robert.budai@analog.com>,
 Petre Rodan <petre.rodan@subdimension.ro>,
 Andreas Klinger <ak@it-klinger.de>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 24 Mar 2025 13:53:13 +0100
Message-ID: <20250324125313.82226-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324125313.82226-1-krzysztof.kozlowski@linaro.org>
References: <20250324125313.82226-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 2/2] dt-bindings: iio: Use
	unevaluatedProperties for SPI devices
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

SPI devices should use unevaluatedProperties:false instead of
additionalProperties:false, to allow any SPI device properties listed in
spi-peripheral-props.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml      | 2 +-
 Documentation/devicetree/bindings/iio/dac/adi,ltc2664.yaml      | 2 +-
 Documentation/devicetree/bindings/iio/dac/adi,ltc2672.yaml      | 2 +-
 .../devicetree/bindings/iio/dac/microchip,mcp4821.yaml          | 2 +-
 Documentation/devicetree/bindings/iio/dac/rohm,bd79703.yaml     | 2 +-
 Documentation/devicetree/bindings/iio/imu/adi,adis16550.yaml    | 2 +-
 .../devicetree/bindings/iio/pressure/honeywell,hsc030pa.yaml    | 2 +-
 .../devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml
index 2d2561a52683..547044b8e246 100644
--- a/Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml
@@ -217,7 +217,7 @@ required:
   - reg
   - spi-max-frequency
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ltc2664.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ltc2664.yaml
index 33490853497b..1aece3392b77 100644
--- a/Documentation/devicetree/bindings/iio/dac/adi,ltc2664.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/adi,ltc2664.yaml
@@ -144,7 +144,7 @@ required:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ltc2672.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ltc2672.yaml
index c8c434c10643..3c8e5781e42c 100644
--- a/Documentation/devicetree/bindings/iio/dac/adi,ltc2672.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/adi,ltc2672.yaml
@@ -124,7 +124,7 @@ required:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml b/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
index 0dc577c33918..26011b5639d8 100644
--- a/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
@@ -64,7 +64,7 @@ required:
   - reg
   - vdd-supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/iio/dac/rohm,bd79703.yaml b/Documentation/devicetree/bindings/iio/dac/rohm,bd79703.yaml
index 941a49c93943..188b00333dfb 100644
--- a/Documentation/devicetree/bindings/iio/dac/rohm,bd79703.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/rohm,bd79703.yaml
@@ -43,7 +43,7 @@ required:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/iio/imu/adi,adis16550.yaml b/Documentation/devicetree/bindings/iio/imu/adi,adis16550.yaml
index a4c273c7a67f..cf5324de4fd6 100644
--- a/Documentation/devicetree/bindings/iio/imu/adi,adis16550.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/adi,adis16550.yaml
@@ -53,7 +53,7 @@ required:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/iio/pressure/honeywell,hsc030pa.yaml b/Documentation/devicetree/bindings/iio/pressure/honeywell,hsc030pa.yaml
index 89977b9f01cf..412c7bcc310f 100644
--- a/Documentation/devicetree/bindings/iio/pressure/honeywell,hsc030pa.yaml
+++ b/Documentation/devicetree/bindings/iio/pressure/honeywell,hsc030pa.yaml
@@ -102,7 +102,7 @@ required:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml
 
-additionalProperties: false
+unevaluatedProperties: false
 
 dependentSchemas:
   honeywell,pmin-pascal:
diff --git a/Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml b/Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml
index 6994b30015bd..c756aa863103 100644
--- a/Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml
+++ b/Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml
@@ -115,7 +115,7 @@ allOf:
         honeywell,pmin-pascal: false
         honeywell,pmax-pascal: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
