Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5A489FC17
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Apr 2024 17:55:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20F77C6C820;
	Wed, 10 Apr 2024 15:55:50 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD590C6C858
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 15:55:48 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-56e6646d78bso3702796a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 08:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712764548; x=1713369348;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HzWm9MO6MRh2JhYRh9d9r60JurAw8zbzSiBG8Vp4F7A=;
 b=Mxi3Mj7QxYKSMFYhtvetzXB5Y/mGVZ4A19/iITrsr9xRf7w5VVfsHIT7pi9tiIyAbu
 jgEqkrjjRRbP+SLHYi/BCoo3FYw2Vp0601wFS9GJkskfjbiqCO7gXLSSrJFdFHgBpz5r
 vv9qS+CMicJRZPL+jpkeyvGuPkP2MSqrbuOZ3jAZA1AZJhk7Od6UCrMFv1g6X1kybjBv
 60vX9RhKVgUOO+Shv2XMuCS2HOK3VWhyo4MOG/Ph18Zc5Udw6pzpP60nSe+T+M4liYGf
 rN1EMRQSOBYtq1pk6F/YmuHmbiHkzrjBYozjcyxcWEZemHWFcA7Kx6rWftdcajheGOTC
 ffrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712764548; x=1713369348;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HzWm9MO6MRh2JhYRh9d9r60JurAw8zbzSiBG8Vp4F7A=;
 b=AZl1Rfn0rnnpWid/Efpkh1E2RguH/cm1TkrAVM6HCdd5wEBd3xVaXK/ntANzFe3t46
 e8DvQHd6ijHb5R5Kj1ZK0OcmdgOG+W0dFYZCW6QIjUz0skFljIOT7h7W52bYOdaWYqrd
 0QPP/ybLZk0icM75DvpOGJFOHhNKfcN943gp4D/nc2UAeYoNIHThe/+ILLap0Stog4IA
 bOL2fTbQjZ6LNMXUISrhbG5ZlduuXlz04E4pWiRXb7Be4toPioapM2wf5LIhtrS4i84A
 ZAS4A0ZDSTccZPL0QwOwZiO6PKTSD+P0mU8cXgdlXjGd9HRtQ9uqh6xywRMP+Twk14kC
 ISEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqfu04o8LFiOnw1SaRvRqOEBBH+BXzGXMSLUQ8Af+zeFR7YOxX1zl8MTcTwZwaxL0Ij5jEm/1v1zsEn2yXr5EoJkZc5sJSjOL/pcN16vygXwpRgXN3BZb6
X-Gm-Message-State: AOJu0YyYKB2lP3IK8q6DaxGQ1MEhbRTSRhTkaANR59O160rKT8fzuVec
 h0+a83xYNLfslTSFjDiqF8lcBsyyG99wDuP03t8JGcva8HQ1bRVn
X-Google-Smtp-Source: AGHT+IGWT0zg2GfhSFE2SOFKfpvXgozYERgxjlvwRfCaQ5TT835wuPhVMQ4kvDupf6tnP6/hPhy/bQ==
X-Received: by 2002:a17:906:ee87:b0:a51:962d:cf0d with SMTP id
 wt7-20020a170906ee8700b00a51962dcf0dmr2330371ejb.12.1712764548277; 
 Wed, 10 Apr 2024 08:55:48 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37]) by smtp.gmail.com with ESMTPSA id
 qw6-20020a1709066a0600b00a52172808c9sm279884ejc.56.2024.04.10.08.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 08:55:47 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 10 Apr 2024 17:55:34 +0200
MIME-Version: 1.0
Message-Id: <20240410-rtc_dtschema-v2-2-d32a11ab0745@gmail.com>
References: <20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com>
In-Reply-To: <20240410-rtc_dtschema-v2-0-d32a11ab0745@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712764543; l=2099;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=ZJ06gPeNSTQ2DySuOzdESjyZIxHEy/NT6VtQopAeiQc=;
 b=OWv7GNhwJh5KCDkRW7ERfspAklaTpWgWcxbYfHhi4SlqF6l+Dk6ATof15wOpkwnTCDEg8Vawt
 6TzRRYUgVEgA0j8sdfATE22NOBeslYc9HH6g4bJakYvCUttKWqZHKL9
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/4] dt-bindings: rtc: lpc32xx-rtc: convert
	to dtschema
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

Add the undocumented 'clocks' property.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/rtc/lpc32xx-rtc.txt        | 15 --------
 .../devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml   | 41 ++++++++++++++++++++++
 2 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt b/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt
deleted file mode 100644
index a87a1e9bc060..000000000000
--- a/Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-* NXP LPC32xx SoC Real Time Clock controller
-
-Required properties:
-- compatible: must be "nxp,lpc3220-rtc"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: The RTC interrupt
-
-Example:
-
-	rtc@40024000 {
-		compatible = "nxp,lpc3220-rtc";
-		reg = <0x40024000 0x1000>;
-		interrupts = <52 0>;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml
new file mode 100644
index 000000000000..62ddeef961e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,lpc32xx-rtc.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,lpc32xx-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32xx SoC Real Time Clock
+
+maintainers:
+  - Javier Carrasco <javier.carrasco.cruz@gmail.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: nxp,lpc3220-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
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
+    rtc@40024000 {
+        compatible = "nxp,lpc3220-rtc";
+        reg = <0x40024000 0x1000>;
+        interrupts = <52 0>;
+    };

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
