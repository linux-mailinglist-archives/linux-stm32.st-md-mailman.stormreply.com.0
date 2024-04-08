Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A52E589D4CA
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 10:47:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C872C71293;
	Tue,  9 Apr 2024 08:47:04 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0370C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Apr 2024 15:53:17 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a51c6e91793so268158066b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Apr 2024 08:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712591597; x=1713196397;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pSuQkBcadOBIFzAv5VWT53mPgt24650g8Yc46Jnu+po=;
 b=ciEXqSDiZ1SPuYjL0u+9Y2yprzVICREiBJk7tbuxcE7bFLpx952FyE7kv2ayqOgh/t
 d/U6GYETfsx9P6ncZPVjUpTA3z9pVLzQ4ri3Ysm9krqDq/FmXXMnzsTWlLd2ncAsC6m8
 xrJ0Hc0iWyskk/VZzX8zgnq4I4ec/X2B8RCa6hmA1/oaPy31V/B9enVkgrDrLXQkGJn7
 J94X293OE6cpCx8TPXSuRQMxV+J7hhGasKRcIrCjK/NXblLtEMhy6AKczjBIcdAbFhxC
 HLuqkPEpZSYMd0RATiGvF1v2ZoJCTDRwgPpqVLPVCC98MGaaWbZPQ/2LZODQUPcKwTJ5
 wvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712591597; x=1713196397;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pSuQkBcadOBIFzAv5VWT53mPgt24650g8Yc46Jnu+po=;
 b=RSDnUB569uWuwuyDPUy823hYWSfGBfuy1TP6eyhYNh0mk+vplXkCk89w7SH84Y0sjs
 L+2aq4vA42fXzHRb3VQjfNAxN2x+75DqfGum65Y1neWcmllZSZiiPffZiRzncIQuOc6v
 ULeLmFFV79Pc3C0lnYe21svZQEUBERzhk8fk9lr/0vI7a9l+cYTdhxIn9gibya34LjO+
 rkOsZGvhpHBtIp5rG7+76Kp4XNgpaxWVXEhsY/657W3uoqHaWGEWFsEug0fXwRl15zP8
 2DzxwKH38f79tJJZzJexPyGtxJeh+spcmc4+v2KGBe+/2wzRudhThJMVBX90FISHJMzY
 GV2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZkADauKddkehOo6FvzFF/LliCO6hb7VSJ4SLIlR/BN/xJ1m+uOYfNVpWfGrZd/yuskKbYJcZIEOEZCMVFy2li4ZuskaPdE8AlzmlR8TWyt4Gzdk2NrNiD
X-Gm-Message-State: AOJu0YzzgcB3NM6UWnx+kHv90OeG9FtXFZSQiF7blM2kZ5fbWp9uXwrW
 5NJFuFOTp7j5g9Wfioq3LWIQKlERtMXugw33sd4igxzbLn6raFv3
X-Google-Smtp-Source: AGHT+IG+xooPJVfqxdhFca/m9VCSLYMJBFoaSR9jS3Fdk4ttcukr9i773eeoHIdSGYXmNnF/nymuPQ==
X-Received: by 2002:a17:906:fd8d:b0:a51:e188:bced with SMTP id
 xa13-20020a170906fd8d00b00a51e188bcedmr48379ejb.37.1712591596913; 
 Mon, 08 Apr 2024 08:53:16 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67]) by smtp.gmail.com with ESMTPSA id
 l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 08:53:16 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:04 +0200
MIME-Version: 1.0
Message-Id: <20240408-rtc_dtschema-v1-4-c447542fc362@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=1594;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=zOZomgntzrvpzwsWCTBIKhRP00SpDrEpbkluseuFse8=;
 b=VG/4RZspITvXhEWAGam4EeebdbdnRgZkL5lRkdQjPLh+WlxRCuzFnJI7lPUjmco9VoyuOiVXq
 akjKl/hvaUaBliOoiWRR9Z/+c9DEfQXxUVCqUVbp5NFNzefeTmLd4wH
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Mailman-Approved-At: Tue, 09 Apr 2024 08:47:02 +0000
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/9] dt-bindings: rtc: maxim,
	ds1742: move to trivial-rtc
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

This RTC only requires the compatible a reg and properties,
which makes it suitable for a direct conversion into trivial-rtc.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 Documentation/devicetree/bindings/rtc/maxim,ds1742.txt | 12 ------------
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml |  2 ++
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/maxim,ds1742.txt b/Documentation/devicetree/bindings/rtc/maxim,ds1742.txt
deleted file mode 100644
index d0f937c355b5..000000000000
--- a/Documentation/devicetree/bindings/rtc/maxim,ds1742.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-* Maxim (Dallas) DS1742/DS1743 Real Time Clock
-
-Required properties:
-- compatible: Should contain "maxim,ds1742".
-- reg: Physical base address of the RTC and length of memory
-  mapped region.
-
-Example:
-	rtc: rtc@10000000 {
-		compatible = "maxim,ds1742";
-		reg = <0x10000000 0x800>;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index d6ce7ac29033..710b096fe6f7 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -49,6 +49,8 @@ properties:
       - isil,isl1218
       # Mvebu Real-time Clock
       - marvell,orion-rtc
+      # Maxim DS1742/DS1743 Real-time Clock
+      - maxim,ds1742
       # SPI-BUS INTERFACE REAL TIME CLOCK MODULE
       - maxim,mcp795
       # Real Time Clock Module with I2C-Bus

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
