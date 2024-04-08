Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7244E89D4C6
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 10:47:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C7B7C7128C;
	Tue,  9 Apr 2024 08:47:04 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4647C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Apr 2024 15:53:11 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a51a7d4466bso356549666b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Apr 2024 08:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712591591; x=1713196391;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qMMzpPgaja57dJ/QOl1X3xfBEKxBkGZzp3htau/BjRY=;
 b=UYy3IIod66QW59/Jey/aNfjgGN2SCmmR33j9GPe+oh3U66zYU8ml5CmBQ+RGXDgkAv
 AQ6ccDlxhDiAZpe8QolvyfoEDhifsPp2UQxKWoPOESnSBxLdVxz6b0M3VFkA0mxSV0q8
 uIXlYBBvtcHTnFbp9HrNVr+frRJBRmdA0vzqUq0pBlyKvjtAMF9OolqibIMnOAU/4wsI
 brr2DuI9Fq8JL69ZscAcgY5Pki2g0QP8hzuMu6T5h3KxVmzVPznv84D+Apg5Ur3Blsnd
 GU9knZ4LpsU3I0j9Uq7k4Qcux4lnLH50eblR+LwH9Jmcf9z8yLkWvQ898j28W2r/l662
 gzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712591591; x=1713196391;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qMMzpPgaja57dJ/QOl1X3xfBEKxBkGZzp3htau/BjRY=;
 b=gnfmEUnGEJgPfFv4gUVeB0x2kgHyoPuHZNenkfSZt5TUz5u5tfFEeL6UxyEItCP34T
 oCC2JtP4KkUb+nD06BbDZ8bBEWkZ/ei7l8+a1vm0aM2kTifalrC0th+O64YySLfBMQvf
 7l8EatqfOuXXKSHcNqxT3ZIRFe0E9mD9me5MzvnMIwYv+3YHg0l0PEn2atNk7KDsRJzp
 cAYXTJ38dJK9TnUBxpl78CWdwt63JKQO11oDuh+/5nBsEo0Ldz4oSynwdO3oGdIRbqYO
 teTC9MqHnzVUHltfODsIzT2RA7+Y9RRWkJcXxgTlG+z9TJbpGovN5RhM4X1o0Qv9LrR6
 pRzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu/f+oYnp5ojzvlAjWh4KcT/DxgCGGaQEZ/FhEjM+Sf1dEdHBeZxt0Wjqmrn98RJe6xwE+1d7m+4i7/1G58yKXh2oQVdR9EZ36a6xaaKpzzKOd8FJE3ZcS
X-Gm-Message-State: AOJu0YzBFZ7RFRWN3N7Clssttlx5PpPpbo3HC0A2yi8vbV1J0MypqQfS
 K3vGw7dPRmz6wl2CLV2x1oEg6Js7aiwthyfAs801xR9dGrmzQV/C
X-Google-Smtp-Source: AGHT+IFLOo9Lg9B3qIOklTKOZd0LvNU1njK/wu05Sxkr5yVm3kefeiWUgywKL7V+AzBxsRaFEqHPcg==
X-Received: by 2002:a17:906:b19:b0:a51:d19c:aba8 with SMTP id
 u25-20020a1709060b1900b00a51d19caba8mr2466641ejg.20.1712591591195; 
 Mon, 08 Apr 2024 08:53:11 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67]) by smtp.gmail.com with ESMTPSA id
 l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 08:53:10 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:01 +0200
MIME-Version: 1.0
Message-Id: <20240408-rtc_dtschema-v1-1-c447542fc362@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=1761;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=hBd9i56nvCzyVs8yanPT9S2Cyv5djpJ1RLlYTOAQDRk=;
 b=7fLnaSy2d1QTC1X9rDdRmPK4NxyIq/8k0OfRmCyhOdL4+L4l6InroboEy3X1aqCBh1Yh2+xlS
 q5z7AlDDx3nB+S8LjphJkGb7U1aUoHLT6vOelE+aTDV7mVFf8o3lo5A
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Mailman-Approved-At: Tue, 09 Apr 2024 08:47:02 +0000
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/9] dt-bindings: rtc: orion-rtc: move to
	trivial-rtc
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

This RTC requires a compatible, a reg and a single interrupt,
which makes it suitable for a direct conversion into trivial-rtc.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 Documentation/devicetree/bindings/rtc/orion-rtc.txt    | 18 ------------------
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml |  2 ++
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/orion-rtc.txt b/Documentation/devicetree/bindings/rtc/orion-rtc.txt
deleted file mode 100644
index 3bf63ffa5160..000000000000
--- a/Documentation/devicetree/bindings/rtc/orion-rtc.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-* Mvebu Real Time Clock
-
-RTC controller for the Kirkwood, the Dove, the Armada 370 and the
-Armada XP SoCs
-
-Required properties:
-- compatible : Should be "marvell,orion-rtc"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: IRQ line for the RTC.
-
-Example:
-
-rtc@10300 {
-        compatible = "marvell,orion-rtc";
-        reg = <0xd0010300 0x20>;
-        interrupts = <50>;
-};
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index c9e3c5262c21..5e63c8f7f618 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -45,6 +45,8 @@ properties:
       - isil,isl1208
       # Intersil ISL1218 Low Power RTC with Battery Backed SRAM
       - isil,isl1218
+      # Mvebu Real-time Clock
+      - marvell,orion-rtc
       # SPI-BUS INTERFACE REAL TIME CLOCK MODULE
       - maxim,mcp795
       # Real Time Clock Module with I2C-Bus

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
