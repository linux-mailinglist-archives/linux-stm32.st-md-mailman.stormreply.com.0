Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C564489D4CC
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 10:47:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4688FC71295;
	Tue,  9 Apr 2024 08:47:04 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A902CC7128B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Apr 2024 15:53:19 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a4644bde1d4so646350066b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Apr 2024 08:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712591599; x=1713196399;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4rI91zKEHaZphCjid+rr3ztF+AksAKCVPYsgJBuGJSE=;
 b=edG5ZHVFqw2ccW7svtOPoZs/B55Tv6w2wjp88STaLqtWxuuUHW+WoFKisebSh1oH+1
 mlHmekZU92H7DatCNNV4snacBp6Ho45xLnXqwPQk8rzO0VCXhqJyvHcjbw0xClPqAyAe
 7k79FyUKW+60tYkY60JqReRBRzlU7PbK3VRO3bRE8CuWrrDK35HsLVFBhCaVmdFOUP2E
 pC781G86qsWOBDnLYNvPBDqA8Byb2H5+nF9x6Sd3v5lh1FyABPVy2Y/7sZCYAmg65Ju6
 U4H2VwfgtaqAoBoVxd9X0xREWrJSvQvz0/8FRRF6RVGJJ1m46U67x2l8brPXpP5yBd1C
 uhpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712591599; x=1713196399;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4rI91zKEHaZphCjid+rr3ztF+AksAKCVPYsgJBuGJSE=;
 b=Ze4nCMMuXg0L09o3tcEd+HaUYAVAuFpTjwH4AYQLsoKKzNa9p1B6d1kyaDqJM5Idr8
 /ZP4xZmq7R631Q2VH31jIWdiJs7Vm5imukVV1JEaEhEtV5e08nee148poMeRKQpBNCFB
 7PrxNeBgirN1a5sB2lGmARAc+5S4Y7iABquPuYOw62ttjvbPi086JlWaBo6eLyR3WkHo
 agR9uBj0FgThtuAZTeztQ33OznfupxsQD2lCREtoyuNDE+BiBv5YwKhFlu/kzbyxUPjf
 oiSpXmIFxBN+k/Wt8ewRZl18SGcual16NEmQv/Ea1QQ9tiOPgHxzpKTKqmWq/TrIs02n
 wwoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK4r+FcgzKsgJfv/h3BUTsvcG7/ZZRN/P/zKakCfgvuOOd7oze/EKBeCbHfG/DBpfDY9iGBhkJOMT8Sy89ZCZGunVJg/bwZEV9y9wh0mwxUtJjyRSFEKJp
X-Gm-Message-State: AOJu0Yx8+L8tYBwfFzVexHGDUktO1LOm5oO5Lm2PLMXD6WXqTw6Z1dsf
 QTJhmc2afEKV2BkGnfeU7/TvOT+J+7/BFrRGr3NOrIX/hWUsWYJ/
X-Google-Smtp-Source: AGHT+IHimdaFx4mr+fd5liP9CQQHQfUAme+YF2mKZ7a1UnXQ6iSPME0h09ObN08oeUq6W9IgNv/UPA==
X-Received: by 2002:a17:906:cd03:b0:a47:4a32:604 with SMTP id
 oz3-20020a170906cd0300b00a474a320604mr5925265ejb.26.1712591599181; 
 Mon, 08 Apr 2024 08:53:19 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67]) by smtp.gmail.com with ESMTPSA id
 l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 08:53:18 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:05 +0200
MIME-Version: 1.0
Message-Id: <20240408-rtc_dtschema-v1-5-c447542fc362@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=2126;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=UiEej7wlBRi/pLQoBrweryeFGNwfjKuxoShA6lE5rgI=;
 b=EpHnh+7FpXHoZNz9WVmqztAU819VB3IfAfjePtPHE33EfG9pOWc64lH5c4iJGsPPAkiXfkCFM
 67eNi1/nowwB6ktD5i9GayFdEXGoC8VcQqXJvBH2aLTYW752caeJ2Ze
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Mailman-Approved-At: Tue, 09 Apr 2024 08:47:02 +0000
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/9] dt-bindings: rtc: rtc-aspeed: move to
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

The RTCs documented in this binding require a compatible, a reg
and a single interrupt, which make them suitable for a direct
conversion into trivial-rtc.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/rtc/rtc-aspeed.txt         | 22 ----------------------
 .../devicetree/bindings/rtc/trivial-rtc.yaml       |  6 ++++++
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-aspeed.txt b/Documentation/devicetree/bindings/rtc/rtc-aspeed.txt
deleted file mode 100644
index 2e956b3dc276..000000000000
--- a/Documentation/devicetree/bindings/rtc/rtc-aspeed.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-ASPEED BMC RTC
-==============
-
-Required properties:
- - compatible: should be one of the following
-   * aspeed,ast2400-rtc for the ast2400
-   * aspeed,ast2500-rtc for the ast2500
-   * aspeed,ast2600-rtc for the ast2600
-
- - reg: physical base address of the controller and length of memory mapped
-   region
-
- - interrupts: The interrupt number
-
-Example:
-
-   rtc@1e781000 {
-           compatible = "aspeed,ast2400-rtc";
-           reg = <0x1e781000 0x18>;
-           interrupts = <22>;
-           status = "disabled";
-   };
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 710b096fe6f7..0f773167d32a 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -24,6 +24,12 @@ properties:
       - abracon,abb5zes3
       # AB-RTCMC-32.768kHz-EOZ9: Real Time Clock/Calendar Module with I2C Interface
       - abracon,abeoz9
+      # ASPEED BMC ast2400 Real-time Clock
+      - aspeed,ast2400-rtc
+      # ASPEED BMC ast2500 Real-time Clock
+      - aspeed,ast2500-rtc
+      # ASPEED BMC ast2600 Real-time Clock
+      - aspeed,ast2600-rtc
       # I2C, 32-Bit Binary Counter Watchdog RTC with Trickle Charger and Reset Input/Output
       - dallas,ds1374
       # Dallas DS1672 Real-time Clock

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
