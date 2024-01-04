Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBFE823D9B
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jan 2024 09:42:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 109D0C6C83C;
	Thu,  4 Jan 2024 08:42:16 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BE4AC6C83B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jan 2024 08:42:15 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5555f9061b9so357468a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Jan 2024 00:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704357735; x=1704962535;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZHp7o9P6sSCcRzfgnf9GmPoPPKRvORDv/jTzo46w2U=;
 b=kWWY4MlrfV3AQbCoD9DKjW7q8lpyw5ItzDOvDSuRYJXkNWi7b5hf8AmvFn10MrWBD0
 3nhaOSUGrwjrfXgXQjpMLECXqNy1sMl7sfhS43ZYQrLlfLGqjBe8BFBqFK9WkMq4vSaF
 jYC8Pdr/f88g4jQ9G++tPwj0CxcUm4fe86a+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704357735; x=1704962535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZHp7o9P6sSCcRzfgnf9GmPoPPKRvORDv/jTzo46w2U=;
 b=DZoTdZzu6+tgj4HoEzTAVGdYsCt+3CGKfPBqllm+QkOWCxGvzlTG0mFMUAvlyRikMW
 ePbvWYju8Z+QhKIYwy6pBwKDnyTLROtF1ihlThimJTX7hU3li2aL2WL6lHRq9Gere55S
 bmuqpnJMyFGeroa6VAeXQJO2eGRGJSfGISkH78HxanZNGFDmmloyL5RRQWIDFNBtYDEn
 i+Ni9zAua2lUxLVOqPgDJoIfBH1j+yeUGID2KTki7aY1X7TlH9+a7+yVxWKxlmDihmXy
 AvjqrHq05GhOknVI3DV0J+I4J1Vy0z8Sacun+LMJjNPpN2vxZJLgiT2JW3Ojbaph/WFp
 ebHQ==
X-Gm-Message-State: AOJu0YxMn8imwM904UqNDXevfPWzizixekgvxDi4h5w5es6IvtZZoWgp
 JpgHC9kR0c4O73Nmk76Cyn1ZpK18adQneQ==
X-Google-Smtp-Source: AGHT+IEgjg6OXhxaGFS6AoqJMMElnHIe5/EC7kG/2rh205kCzPflc399WybxDe97Efqnv/xAvhfCjA==
X-Received: by 2002:a17:906:3185:b0:a28:6801:4a81 with SMTP id
 5-20020a170906318500b00a2868014a81mr143573ejy.71.1704357734691; 
 Thu, 04 Jan 2024 00:42:14 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (net-93-150-255-34.cust.vodafonedsl.it. [93.150.255.34])
 by smtp.gmail.com with ESMTPSA id
 wh14-20020a170906fd0e00b00a233efe6aa7sm13495704ejb.51.2024.01.04.00.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 00:42:14 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu,  4 Jan 2024 09:41:41 +0100
Message-ID: <20240104084206.721824-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104084206.721824-1-dario.binacchi@amarulasolutions.com>
References: <20240104084206.721824-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 1/8] dt-bindings: mfd: stm32f7: Add binding
	definition for DSI
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

Add binding definition for MIPI DSI Host controller.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

(no changes since v2)

Changes in v2:
- Add Acked-by tag of Conor Dooley

 include/dt-bindings/mfd/stm32f7-rcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/mfd/stm32f7-rcc.h b/include/dt-bindings/mfd/stm32f7-rcc.h
index 8d73a9c51e2b..a4e4f9271395 100644
--- a/include/dt-bindings/mfd/stm32f7-rcc.h
+++ b/include/dt-bindings/mfd/stm32f7-rcc.h
@@ -108,6 +108,7 @@
 #define STM32F7_RCC_APB2_SAI1		22
 #define STM32F7_RCC_APB2_SAI2		23
 #define STM32F7_RCC_APB2_LTDC		26
+#define STM32F7_RCC_APB2_DSI		27
 
 #define STM32F7_APB2_RESET(bit)	(STM32F7_RCC_APB2_##bit + (0x24 * 8))
 #define STM32F7_APB2_CLOCK(bit)	(STM32F7_RCC_APB2_##bit + 0xA0)
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
