Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C026189D4CB
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 10:47:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51658C71297;
	Tue,  9 Apr 2024 08:47:04 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C262FC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Apr 2024 15:53:21 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a51c6e91793so268173866b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Apr 2024 08:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712591601; x=1713196401;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vDBj+TCOT5An3iT1ZW/BVrmcXlQmpT8xuPifrvWWcJQ=;
 b=kCpBCfxJ66vopOZjzJBmAp2aeI/p6dFQEolmJB6sYw6Ma76dQ9byCKqmNsUaaGWYnv
 ESONVlEvARvh7PML+NV2iI/FmQ2mxapQI9aInHzdqJD8zD2JUqCSFmoCLC0KeGlAyrle
 E4ZE06k0Z4I35cJ+9nuZ/hx4MCxaVQLl3yd2JU0lIE89jQWmyBB1F/zswT8ek1hRgQVv
 ioOtGrLx8ssqPEfgkdoDr/WInwy/LiOBIkBk4C0nBpBwaWACSNBYqrpMCNJIMFDqvayH
 YMtO7BQEhZJvYq22PZTLSJ7gZvOGb/fW5F0wXbd8hHPAKRxOfJjJKHSkHV1XO8lhn2f/
 oAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712591601; x=1713196401;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vDBj+TCOT5An3iT1ZW/BVrmcXlQmpT8xuPifrvWWcJQ=;
 b=jLBaGZAtiZ6WXvbEQEo9ZFl4RfCgoUbv45Tptr0/atcIUgNJ3R2fGWYuS6JKyNHq/b
 fynVpAr8SOJrJYMaD6b5MoIRUsw9WMvdn2CLg5/JDq4313rH5OctW6XtR9Qk/078g21Y
 pZ3eLWORAEhKhqKZNlT9MCK1PIaWinjzf8AQ+mUis7PU9+invFTfRSQlQDyVYW65g46u
 GQmiFYk3SowVnkj5Hlz7iE2mRVVnJ3aAn25eqX0DHHwqfJrguQozRFIxN18hmx45WI7j
 llTyXT6MRJhxVP4yYJMzUJIABKN0DhHCY/wlKYbdLtnSl4fecBk2n/wzCZU1k5EyTnuU
 Q2/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXykeElrRzP5d/RYKK/j+hrwwJdShaRmt5GRZhzecGfhCfoxJS4FtNpcoDaW2TkPyYtY+dtbxp2VnNaoJL3Uj9aEC4ZOB5IcJAL53EgpPW6gJGbrxefwuOc
X-Gm-Message-State: AOJu0YyRpIN1tiTpzz8Jsz5zKPIsCrGUrFREg1C0AHFX0DBN/hHaPiAT
 TlMAMfowVeELxP/0TegLX8u/a6Tn0LsEankgdR+tRGV4DdqOi77D
X-Google-Smtp-Source: AGHT+IHo3PjOjthzlX7he+eTIQsbLTIBOyRGKiO637648HaP0Ncp071D/7W6Vx2fN1EcekWna6nuhQ==
X-Received: by 2002:a17:906:af16:b0:a51:c1f7:93 with SMTP id
 lx22-20020a170906af1600b00a51c1f70093mr75351ejb.13.1712591601329; 
 Mon, 08 Apr 2024 08:53:21 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67]) by smtp.gmail.com with ESMTPSA id
 l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 08:53:20 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:06 +0200
MIME-Version: 1.0
Message-Id: <20240408-rtc_dtschema-v1-6-c447542fc362@gmail.com>
References: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
In-Reply-To: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=2057;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=XuizmZ/AsI4sUrNbkhEaUlA+sS0KeXhc44fqmRoI0ks=;
 b=TEcS/yNABbU+N66YYIMs81/pFUYAYXLO65ZbwiLZUk8cK0LytDNhrbnd05Bbryb15/GpV6iW2
 jf1CGGu8AmBA3oq3KEyQFN5EDyUUA0/E99wDgmrlSsZqOp61i9vtUnd
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Mailman-Approved-At: Tue, 09 Apr 2024 08:47:02 +0000
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/9] dt-bindings: rtc: pxa-rtc: convert to
	dtschema
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

Convert existing binding to dtschema to support validation.

The missing 'reg' and 'interrupts' properties have been added, taking
the 2 supported interrupts into account to fix the example.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/rtc/marvell,pxa-rtc.yaml   | 40 ++++++++++++++++++++++
 Documentation/devicetree/bindings/rtc/pxa-rtc.txt  | 14 --------
 2 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/marvell,pxa-rtc.yaml b/Documentation/devicetree/bindings/rtc/marvell,pxa-rtc.yaml
new file mode 100644
index 000000000000..43d68681a1bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/marvell,pxa-rtc.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/marvell,pxa-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PXA Real Time Clock
+
+maintainers:
+  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: marvell,pxa-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: 1 Hz
+      - description: Alarm
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    rtc@40900000 {
+        compatible = "marvell,pxa-rtc";
+        reg = <0x40900000 0x3c>;
+        interrupts = <30>, <31>;
+    };
diff --git a/Documentation/devicetree/bindings/rtc/pxa-rtc.txt b/Documentation/devicetree/bindings/rtc/pxa-rtc.txt
deleted file mode 100644
index 8c6672a1b7d7..000000000000
--- a/Documentation/devicetree/bindings/rtc/pxa-rtc.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-* PXA RTC
-
-PXA specific RTC driver.
-
-Required properties:
-- compatible : Should be "marvell,pxa-rtc"
-
-Examples:
-
-rtc@40900000 {
-	compatible = "marvell,pxa-rtc";
-	reg = <0x40900000 0x3c>;
-	interrupts = <30 31>;
-};

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
