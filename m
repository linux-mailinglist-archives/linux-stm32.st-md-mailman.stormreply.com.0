Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9A882C20E
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jan 2024 15:49:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E86CC6DD7A;
	Fri, 12 Jan 2024 14:49:10 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3187C6DD79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jan 2024 14:49:09 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-50e7ddd999bso7289812e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jan 2024 06:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705070949; x=1705675749;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hBytSUC/4Scw/6M7MDSEKF2OisRATxG4/2WDOpsmueA=;
 b=Yreo24ppzTAn7TS84EpHh5EovL6Th7tX2AuKgkqnlmiJAoEA0QEImBAP1sGoqLLLGc
 0BPrHqD0HSi5aCGm8lKmmlSc6qTzn3h+m5RfPEBj0bFiV7Mv8Q243tvcBxX0wmASgcIu
 +YzUkhyG7CtNmjaKnY1zxP8T9y+s0N1a+KjQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705070949; x=1705675749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hBytSUC/4Scw/6M7MDSEKF2OisRATxG4/2WDOpsmueA=;
 b=so8vkWvFaFiRSV6voR577JxvAPapikvMvvFvG9aRLzbJ2LewQZRWO4r8/mdUQg+mvf
 fOuaKTS4Zu7vuqNHJr+wFWcEL/EU+0bnwBqcQQGpBFN1tprtgeSH+oq77e6wqKOdClxe
 fEbHJ9aTaXURDKXbs611NHP1xYlj/JNazolFzoUJuWRPqCtD6vQwRPve2I/IjkW/ye9X
 xxmtHXftf2uUh1TKGb05I8CyRFHXR1hHaW0b7nECf0AmmvE2yVt3fnDkgrrhrQNTqP85
 zaA3znZ47X3yeQpcMXQXQRUGxZd+/UNNeEeP062t75Dx4QBj+QfnH9D4uOIWQRzudChz
 zvPQ==
X-Gm-Message-State: AOJu0YzsYE3D9xJhgnzwRBCfe4WZ/1zXgQoI2djRX1duJBSwSdZlOrNg
 M99XHVJ1/Uxpz1bOp/CAHf7xwpQs4/DNvA==
X-Google-Smtp-Source: AGHT+IHvD0o4uSsKQg/JFN33shK9eCTUk71p6NdviePAGeTDnD9r/WlHm8g9/EXSqnfgkxKsztjN4Q==
X-Received: by 2002:ac2:4a7c:0:b0:50e:76d1:f02b with SMTP id
 q28-20020ac24a7c000000b0050e76d1f02bmr688423lfp.39.1705070948808; 
 Fri, 12 Jan 2024 06:49:08 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 ([95.236.91.90]) by smtp.gmail.com with ESMTPSA id
 y11-20020a170906524b00b00a233515c39esm1869372ejm.67.2024.01.12.06.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 06:49:08 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 12 Jan 2024 15:48:21 +0100
Message-ID: <20240112144902.40044-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112144902.40044-1-dario.binacchi@amarulasolutions.com>
References: <20240112144902.40044-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 1/5] dt-bindings: mfd: stm32f7: Add binding
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
Acked-by: Lee Jones <lee@kernel.org>
Reviewed-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

---

Changes in v8:
- Add Acked-by tag of Lee Jones
- Add Reviewed-by tag of Raphael Gallais-Pou

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
