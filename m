Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4D589D4CF
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 10:47:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CF99C71299;
	Tue,  9 Apr 2024 08:47:04 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 035F7C7128B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Apr 2024 15:53:24 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a51ddc783e3so120949166b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Apr 2024 08:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712591603; x=1713196403;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hWg1ENlXHc+/PDZHBiKvXmfM9dCYHYF/K16ZOemXbZc=;
 b=V/v+es9MVahRG6HUDg8XTocBuPSquEmHYgsV5/hyyYEhfmmEQXepgcr4R38sPkOgDW
 ieEsIDb3dmxkenlLCMqCiWczY6OysVnQ0qJFp6GpOqBba7t6tZgfK8d1pC1Igd6wz9yD
 jxjhPFlm9mBQbGueM/27nTWswwWNOIOTnNtkglBNyUbm84wOLX3Brqn4FVK2+a8OjQaL
 yj4ZTsnpv7JZqr9HIu8oZbUzRKckdb2AD1X1q3+UaUQS3o6JpQ2US5CBa/WDqHGIw/Xc
 Tw8v1jugLp0bZgSCU160TpWxlEThaomcG1NbyeglV+uKvC4FRz7hNJQf5SK6bQ60HyF+
 CSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712591603; x=1713196403;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hWg1ENlXHc+/PDZHBiKvXmfM9dCYHYF/K16ZOemXbZc=;
 b=JCmV6Mg1E4CNVA7/Q+e7938IJ3b/gldWDcLjBaPUseTYShzFnYy8m11cee9Xul4kwD
 Q+mRwqKsbB6I82/nXan2my7lkdIV9Bf6iUd927LWFRdR+LLKu4P2KGK6ZZ8Va8FaJ00K
 KzEbcUfCfUx4y560ioXDpFGYXK/fDXGwYN6/SFi2XInNpTFy7LcxdOZzBlFG8/C9Eufl
 fCiEyxFGB7VFA+bwiu+cHRTMGe3uAivmCGXZR4W+HjXFd20snoIinB8r5AK5rc6itIDE
 DorsoUHm4ICuhX6j/1W4mUCaBq12MYAI6p/lSQHIKOVWY456EIQOcZIuIwncMS+Yl1Qg
 yqzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFZkSTldj6Gxy5/3crBrFTosJ8yS02NTHD/0JmnH4iJGHpx00x7Mu2aHofJhSKLNlcfTEUOk9XzXPa1rkKF+1bhuc4oqjHdGdR8qHsWFpqa4mLS8A3QTKr
X-Gm-Message-State: AOJu0YzYWb0MWa1PzLCYW6oAvuy8oUZeYV7YYmDkfYvOHmpTpHKBr4sF
 tKUuyRUvd9NDWL6NlJqaX0bR22Kunzb9tJVCkqEUQ2H8n0Rhj9zo
X-Google-Smtp-Source: AGHT+IFepnQDpHcqTbdYQgYMHbQ520Q8WNttr0OK2ZunJaGOwvtIFCl5cwFDkeGXluI9lcMo/d7pvw==
X-Received: by 2002:a17:906:e08d:b0:a51:aec8:eae9 with SMTP id
 gh13-20020a170906e08d00b00a51aec8eae9mr4956245ejb.10.1712591603486; 
 Mon, 08 Apr 2024 08:53:23 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67]) by smtp.gmail.com with ESMTPSA id
 l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 08:53:23 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:07 +0200
MIME-Version: 1.0
Message-Id: <20240408-rtc_dtschema-v1-7-c447542fc362@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=1628;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=GFvvp+NJ4mdI7BDHKwvdqRInm14P4YsnxCRqORkt+n4=;
 b=bs3zfnUcz5gwpaUPlz/wrRwcwYBcEGy6bYrrJTdSHbRau10DwIlYJxoxpsBmwPdugAX+didWp
 Edw33B+ngJbCvBBtLqoFKH6Nttpgzn3gnZWBbsX7feyzl34c8LGzx9F
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Mailman-Approved-At: Tue, 09 Apr 2024 08:47:02 +0000
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 7/9] dt-bindings: rtc: spear-rtc: move to
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

The RTC documented in this binding requires a compatible, a reg
and a single interrupt, which makes it suitable for a direct
conversion into trivial-rtc.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 Documentation/devicetree/bindings/rtc/spear-rtc.txt    | 15 ---------------
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml |  2 ++
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/spear-rtc.txt b/Documentation/devicetree/bindings/rtc/spear-rtc.txt
deleted file mode 100644
index fecf8e4ad4b4..000000000000
--- a/Documentation/devicetree/bindings/rtc/spear-rtc.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-* SPEAr RTC
-
-Required properties:
-- compatible : "st,spear600-rtc"
-- reg : Address range of the rtc registers
-- interrupt: Should contain the rtc interrupt number
-
-Example:
-
-	rtc@fc000000 {
-		compatible = "st,spear600-rtc";
-		reg = <0xfc000000 0x1000>;
-		interrupt-parent = <&vic1>;
-		interrupts = <12>;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 0f773167d32a..d75c93ad2e92 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -81,6 +81,8 @@ properties:
       - ricoh,rv5c387a
       # 2-wire CMOS real-time clock
       - sii,s35390a
+      # ST SPEAr Real-time Clock
+      - st,spear600-rtc
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
       - whwave,sd3078
       # Xircom X1205 I2C RTC

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
