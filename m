Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 964F189D4C9
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 10:47:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32B15C71291;
	Tue,  9 Apr 2024 08:47:04 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DD6EC7128E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Apr 2024 15:53:16 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-516cbf3fe68so5658347e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Apr 2024 08:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712591595; x=1713196395;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OZNPSolpsyW2BBt4Cv9G0c69Pzyf7OGHTEy9xs9+O7A=;
 b=Dmd6Aa6rWiN8N79cZYIYbMJMXZbCnP9bMefOFvLyK2QlS/ZpIY3Ep58t6cIYM2D+CE
 BmKX1wQJ4m53JTDL5VogI2VGrkkwYOZB5gG2RJBUe6taTrUALE/ADClrjWKGqsB5OYZH
 yL7hQgJzBUkRE/Ky5HsxdlDRDauX/dOPKgsTBN554rnbkLZlLimvNC3afqCJzxQCDTk/
 MhEgcA+F9P7wyyhkZ738liglexiT6V0Ba+eXmVm3S6O1b2FucJStu+CmD/mtA14e/4qy
 sygnAiI2ZZqYajrKnoDMhyZwpdM+aAvsV+4diRnSAs8OVnsASyrjEyBs5FdOmUZaVTik
 L49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712591595; x=1713196395;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OZNPSolpsyW2BBt4Cv9G0c69Pzyf7OGHTEy9xs9+O7A=;
 b=gQsR0SXCX9tB6bHedWtIXphiYVDKQbgHBj3d2rEEPyY+srMnToHjb8ErZtBRdPwp70
 36a4tIy3FQhdhs1U6YbnQYkoYO2Oou3gtS9xT9JtIQr/RZ1bNjJFzsWw0hnn9GArnTYE
 z+ep5krQeM1BJncmnwL8qrvBMMqdtaNV2D2BacjKkkx6arDdRgRt2ZfEx1EC/UbiqHlH
 fX51Xep2jdLffAh2eFaVy3fCalGlHzIFyZxz+2SH/LvCYlpfM1FhNEGRB7gD/FrdcySz
 QbMi3ZJp7oNljyj/R5/v3FzQLPCrdh9QnioVIDey6cbA/x6RIkjTUwv1uS0ILPdgP+rt
 9PDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSwE0nQ8dj2C2i5tk+M9YU4eeKNRM/CGdD7+ISe2KsdqKCdKhIFoZdJ0xaHhq+lw0eoI7wBoLdWCNj3eaHGDRZpCihw4YZqLocxE7XF6okqwizbdk5h+uy
X-Gm-Message-State: AOJu0YwnASJVYmCx3RvJ1WJn+0EPYkjvP31GKEy9sEat+HTl/XhCK+Ne
 3Tj+vuBFrrCsG+l6oweZfoDNkJHJ6+Jk2Opwk2PwKEzdbcmYb7JN
X-Google-Smtp-Source: AGHT+IHHjnlpbYGoVoRBTjaLp6Pq3A5BQFRFuLX80oSlH+nvQTdtLncSAg4Fv6oSY2gm4yEe75RZ0g==
X-Received: by 2002:ac2:5f1c:0:b0:516:ce06:ac8e with SMTP id
 28-20020ac25f1c000000b00516ce06ac8emr5820717lfq.51.1712591595088; 
 Mon, 08 Apr 2024 08:53:15 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67]) by smtp.gmail.com with ESMTPSA id
 l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 08:53:14 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:03 +0200
MIME-Version: 1.0
Message-Id: <20240408-rtc_dtschema-v1-3-c447542fc362@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=1653;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=oXF0IOpDbbU06OjI6OgtSVdRvz0EfEWAr+7KUKC2fPo=;
 b=cXwmCtklzwmwm52UDPVuk6WWDHgL1i0zzCtfIEhsTmu1EI8lNZwtM2+GXUd9vnJCrPPqUZ8mZ
 dM7tV4/p9z9AnwXdlchsL+guM1nOVq79TSHnwxlzcL0CuAAe0Fn8NP7
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Mailman-Approved-At: Tue, 09 Apr 2024 08:47:02 +0000
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/9] dt-bindings: rtc: lpc32xx-rtc: move to
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
 Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt  | 15 ---------------
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml |  2 ++
 2 files changed, 2 insertions(+), 15 deletions(-)

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
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index b889b9317a41..d6ce7ac29033 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -55,6 +55,8 @@ properties:
       - microcrystal,rv3029
       # Real Time Clock
       - microcrystal,rv8523
+      # NXP LPC32xx SoC Real-time Clock
+      - nxp,lpc3220-rtc
       # Real-time Clock Module
       - pericom,pt7c4338
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
