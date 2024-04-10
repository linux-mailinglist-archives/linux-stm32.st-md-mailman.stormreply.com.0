Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 663E889FC18
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Apr 2024 17:55:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28D5EC6DD66;
	Wed, 10 Apr 2024 15:55:51 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63B70C6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 15:55:50 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-56e2c1650d8so5408491a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Apr 2024 08:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712764550; x=1713369350;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1jSeqduTcQGsgyy//ksgmL2wkqDSRJ2+W9of4aqh+v0=;
 b=HP0eqkZI3HfHfrYGu5/fCXQN6flLi3DZ6bYNMk0m4J6sCLPw7CGpu8QNvhygwL9pX+
 RIEwAWzzDY6W9dKSJMi5/OzNFOXgCehhBp+EFMJthOgYB5VozzgBJAvs4mWdkKVZ+lYF
 CN8lt83vh0OTQr9p2BUrlKhtil7SPLZidjC9CfjaGECvb8eHpw3g69t3V/6MbNE9CgeP
 fHGu70R5NkWchU5RXZeVqvcoSc/5/0O1AB2spo3P29zVwsRdSfYxqpWs3N0Wx2NsZaH8
 4Tojx8tc3dxPw/h7gRgsKjptKqQKBHIfCGOo7oZ7EW4ZrVEmb3MdekdsB80VmtxHC65s
 cprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712764550; x=1713369350;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1jSeqduTcQGsgyy//ksgmL2wkqDSRJ2+W9of4aqh+v0=;
 b=XefFMDT+tNa8okQ1H3htmG1PnoXoV3kdz/01IAlBMsz99KjwAP/huIYr8C7taBuPzU
 LyG2UStxxElW0Ezs/5uZSuFwuDPQfCQorbyO17QQuAxhjQctM2n11yc0tZ3zOYUvoWpV
 vT+TzKWjoErgA+8DtmvvyknAqLDASbTZrpgQE/b638UM6K2j1SM8oD32ds1g8kCJenDk
 ULJjChIbx4UCvlEHxPPhfL5MrPxYDaZ6HpxP71kYj2OeZnup4xqdzbmAYmtxJAP/Cc4b
 V2Ta6ao+KCqUmuD60U1ILataKpUrR3vEFS69q5TR4R52V9eoT+TejRfy+HgHWbn7OK30
 Q6ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJvCDFiG1eVjUrEtwuWLxA15XyYrQmHWEotz54YQNFhmXl6cQpijOFuwcr5qA1aRJAuyH08jzEjPTdZjC/JvELvtLJhRcN99z17tPyFxtHJPC8fEGqlzdH
X-Gm-Message-State: AOJu0YyNYIEpqXvvzP8eLnazTEfltSjfcLGNFTWr3SrckpO4GUvr5HkK
 Uc6z6U3kQ/hUxSJCmfFtgkxWBMhHT9Ru0PfTNX6Z1c/akif1sjLe
X-Google-Smtp-Source: AGHT+IHpKcHkzaocAzKrmqOnvknnOqrXFgO2SiOZTgXtv8v+e/D+kmcUtUHf56S5Bi+ZgUEYHg907g==
X-Received: by 2002:a17:906:fb11:b0:a51:9f5b:b659 with SMTP id
 lz17-20020a170906fb1100b00a519f5bb659mr1789622ejb.34.1712764549870; 
 Wed, 10 Apr 2024 08:55:49 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37]) by smtp.gmail.com with ESMTPSA id
 qw6-20020a1709066a0600b00a52172808c9sm279884ejc.56.2024.04.10.08.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 08:55:49 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 10 Apr 2024 17:55:35 +0200
MIME-Version: 1.0
Message-Id: <20240410-rtc_dtschema-v2-3-d32a11ab0745@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712764543; l=2124;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=MljIxyWTISU+l2odfMzkGB6VwOiZuuSwves7xqGR7H0=;
 b=+KJHEjpPSKgc0aYcDAt7jz8cMXuHaOsYXEx5xaxeDu98Mi3pAhR8m4a1H7J9Gj9c95Iq1CkTX
 C3b9IAdDAlrBY7JmKPRwT4zrKX9Ox8dBgU+omNT/BdB/TfsjCFwU3O4
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/4] dt-bindings: rtc: pxa-rtc: convert to
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
