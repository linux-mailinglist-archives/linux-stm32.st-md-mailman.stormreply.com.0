Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15506821451
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jan 2024 17:16:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B07A7C03FC1;
	Mon,  1 Jan 2024 16:16:10 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8ACB0C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jan 2024 16:16:09 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a27e824d65aso154852266b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jan 2024 08:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704125769; x=1704730569;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YyS2KeYOl/WGbPcbzpxJ7ikencveX5QceRVMiCrFg1s=;
 b=ZAwUlOKFYb/IKnEl/vnvgu6AoHxY1+NBIN2dGxoc8FrYoG9S3pZurjgHlJ8EDQzjuO
 zD3fT5QMn3u9UHa2iOEHK4O7VQTatOAInmepyR9M2MCtfHKN+XOd4uf9AHN7q3659sEW
 YID5OcDCUz46mMfiTTBNJukWZqnFcAABVfkP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704125769; x=1704730569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YyS2KeYOl/WGbPcbzpxJ7ikencveX5QceRVMiCrFg1s=;
 b=bgrsDcLG8zjphZQ1qYdJyzBxgQIq0FbBRc03NBhd0z949Eq9F3JiOR0LsCG1FvmQZc
 kWKxfiP4l4a5vWV3UFpoF9v4kFsiu6cDifwMgsbwfoIe7swUzK+/wJ/o9h8GcU4NtezB
 e6HDqJ47Cl41vbQseH8oimmtjVlA6Kb0CCZ8p7aytcfMmlh02KykflWJDB9/yd2GWZ87
 sPrrK+umo0tp/v4ocGh6gH+mYeYYbcoY1eTrrPaLZLmdo+DBrMLY9NHJwMFqGQESpR1v
 aqgVBG95KEk6klOccF15MJgtOkDIU0EclAXGbFvEKdaORMpxtD5o6sREu4xiEjAJ/rj/
 zB3A==
X-Gm-Message-State: AOJu0Yyny915gV2IelVOeCdtnOntOLnO4+6VSDdlJTu9SJ9BCYF5OubN
 j6WIcFNZNYepIDfOsW/eOaNttPlGX5zXBQ==
X-Google-Smtp-Source: AGHT+IGOZyuwSgxZuo92l15nHbn+chqMjAocBeDlr3/i+QUnPeNN4cNOy6nmgJlZB2iHT6AHgnsrLg==
X-Received: by 2002:a17:907:c9a1:b0:a23:3653:832a with SMTP id
 uj33-20020a170907c9a100b00a233653832amr12536261ejc.17.1704125769083; 
 Mon, 01 Jan 2024 08:16:09 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-48-44-179.retail.telecomitalia.it. [82.48.44.179])
 by smtp.gmail.com with ESMTPSA id
 ep16-20020a1709069b5000b00a27d5e9b3ebsm1897857ejc.105.2024.01.01.08.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 08:16:08 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  1 Jan 2024 17:15:44 +0100
Message-ID: <20240101161601.2232247-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240101161601.2232247-1-dario.binacchi@amarulasolutions.com>
References: <20240101161601.2232247-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/8] dt-bindings: mfd: stm32f7: Add binding
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
