Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB17889D4CE
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 10:47:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D412C7129D;
	Tue,  9 Apr 2024 08:47:04 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF188C7128B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Apr 2024 15:53:31 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-56e56ee8d5cso1879619a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Apr 2024 08:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712591611; x=1713196411;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=j3jReaO8bBGw6JBZ1RkUcA4thqN9iUeRzORfBO64Zek=;
 b=gGOTaysDZNPlBXsidPsPrwcODuX+ZfHHA4D7xFfegkpSBz8xm2VYxp/q7PhvwUPOgy
 hSkHE3p8yOmcJpI6k9V8Ru50SAx83h9hB6Haj32yuwZ/PDHMKHSZ2l1LPRB0PQW34FVH
 eImZ4tw+rc3AZP6eQcpuQMikbXPIGtxGiULN+Ryzn6piNpGN6ggFJGv1xLIl+iMjzZui
 nrI/mBcq3npPmxfyXx+49l1E4ie1pNbpQhWeg7kSBXxaoVMrFpJa5FlvvZ1a/33mzq9B
 4TOVKmo4cGF9YIx3eCUKK1G6F44LgWcO+6Eh+9VELnxlA+OBnWFqTHyJR0Ahj46VWZXs
 9Bsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712591611; x=1713196411;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j3jReaO8bBGw6JBZ1RkUcA4thqN9iUeRzORfBO64Zek=;
 b=DRhzBAtV4dGqUIRmDRzBI4USVffA98PIpSxFC/uD7SOUAnDPdCVe6DxE0sAUeDgT08
 8sIPyLYDLMNvsKsphwce7jni3JNXyKBz0mPLxJ9sWuDtIvdmIJ1SxGDUcANm6gL9VThJ
 f/2Qv+rEPfthTuSmguRiaoyc+QI3vFzGBMlv5qatcqHNodn6G1m+digHcUiLl4uWs+hy
 q9sbCKoHSzwng8j4Cqu3fnntn5dyw1w9k/zSxGo0ZUdmOhBdl0yAxy3CY/nArm/hHQec
 ZyYYvyTnL6554ABu7WtNMlIszdH8RkxxQZew0qPyH6/9zjZMVXXLXBvkobd+hI1642BE
 xF8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv6rGzkgJQQkJrTLL5VvksD42Oiva3eu9kPG9VoxilY0SSDJO5mjdabbpGDrdP1K9TbUWrnHg6fsVLYSFZNq8nGM6CsGkw8KNlCPeJHzIuL3Uy57CZB6Kf
X-Gm-Message-State: AOJu0YwXhnBrgURvosQJQ08wt+ArUp0nNNOIHdhqF/Ts2P+DlIvOSiDY
 v3rM6sbjNGlqz5acroTcm/tuiN7TWEEUZ5Gm2PHf8D2+4HPrX/1g
X-Google-Smtp-Source: AGHT+IHDUn7lM+m3JJro1I7sX1HqWbE56mUHHewyuVneCeBjUwlfT2HuBoGiCiRi+8XMgC8ngOpekg==
X-Received: by 2002:a17:907:9485:b0:a4e:375d:2573 with SMTP id
 dm5-20020a170907948500b00a4e375d2573mr9215871ejc.37.1712591611213; 
 Mon, 08 Apr 2024 08:53:31 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67]) by smtp.gmail.com with ESMTPSA id
 l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 08:53:30 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:09 +0200
MIME-Version: 1.0
Message-Id: <20240408-rtc_dtschema-v1-9-c447542fc362@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=1714;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=vM6749OZUGmuUGhDa/POZy+5vZeS+6APRIR0QdxNkUs=;
 b=g1Gbrdrf/K3DdsRveFmOObYxG1SgqzZ8jrKc7OFyd6Mhf+VVcEjwfoBwytdkuegPork4KUfuS
 X+/UsMcNJb0DUbXRodaJxuNiEAk9sWd0n6FZbuyavNg+PpigpZoRRlR
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Mailman-Approved-At: Tue, 09 Apr 2024 08:47:02 +0000
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 9/9] dt-bindings: rtc: via,
	vt8500-rtc: move to trivial-rtc
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
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml   |  2 ++
 Documentation/devicetree/bindings/rtc/via,vt8500-rtc.txt | 15 ---------------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index d75c93ad2e92..c48d0dfa28b2 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -83,6 +83,8 @@ properties:
       - sii,s35390a
       # ST SPEAr Real-time Clock
       - st,spear600-rtc
+      # VIA/Wondermedia VT8500 Real-time Clock
+      - via,vt8500-rtc
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
       - whwave,sd3078
       # Xircom X1205 I2C RTC
diff --git a/Documentation/devicetree/bindings/rtc/via,vt8500-rtc.txt b/Documentation/devicetree/bindings/rtc/via,vt8500-rtc.txt
deleted file mode 100644
index 3c0484c49582..000000000000
--- a/Documentation/devicetree/bindings/rtc/via,vt8500-rtc.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-VIA/Wondermedia VT8500 Realtime Clock Controller
------------------------------------------------------
-
-Required properties:
-- compatible : "via,vt8500-rtc"
-- reg : Should contain 1 register ranges(address and length)
-- interrupts : alarm interrupt
-
-Example:
-
-	rtc@d8100000 {
-		compatible = "via,vt8500-rtc";
-		reg = <0xd8100000 0x10000>;
-		interrupts = <48>;
-	};

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
