Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD9E823CA0
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jan 2024 08:24:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BE2EC6C83C;
	Thu,  4 Jan 2024 07:24:16 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B3F5C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jan 2024 07:24:15 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-50ea9daac4cso204249e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jan 2024 23:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704353054; x=1704957854;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZHp7o9P6sSCcRzfgnf9GmPoPPKRvORDv/jTzo46w2U=;
 b=ovzwkssWhK6qtyvVkpMkmy53kHmrz4du4TNZd7FYTZcS9fw+EAUAkZ3Ahqqru4dGhD
 pbgNLqJdGchmde2MLEh3vE5tWytGD7HPuDh1KoRXk4w+DHZW4+EgebxGfHZn2mVLT4Jl
 yYsZ9VxOMU7q8cCNtdVZG6jagaRTVEX4uwo9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704353054; x=1704957854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZHp7o9P6sSCcRzfgnf9GmPoPPKRvORDv/jTzo46w2U=;
 b=ALNifIlRu4umngZsvFdKM+bTcnX3v1R6xCMtiHcc9IzTuCz+27/5sNG1fVBO0mFu6M
 UDSEpQ1wl4GD8yoQl0lGPjPVxGSkYO6lrqoQRuHUz/mGd5ARrDie5e83uxuwgS8mwD1D
 LHpDxrAmgPbZRrhON3h5r1hzfS3e/av73kbDNgUkNDz7uXioLAVUzpR3Oatxpqakthqh
 /Tfg9ItoEAn4DjHmKl03E0ErdeqLJ4xoXhCP/awzQnI6UFXMPWpVEyTKtwd59Ubz0Fo9
 R+fZp6Az3JQ6pNPuHrOsRtknFqK4Uy/ASuXtpcTkg4r1mj0xEWVMer1Dm4FJdgC5n6/l
 gzLQ==
X-Gm-Message-State: AOJu0YztYZoSiy8m2FN2BcqxojpFaafSWDvGqbwPoRBJ2Vv3oL7kQRTN
 WrCePMgOg6uuEyX+Ahqc5dcFxNQ0nghaKw==
X-Google-Smtp-Source: AGHT+IG4i/97hJ8aDZ8aV7oljAPTtFLXwe5GU9eipdE578f3Arlwv9CTDaie3sHsTnqpOAseTOaxdg==
X-Received: by 2002:a05:6512:3c81:b0:50e:aa96:73ed with SMTP id
 h1-20020a0565123c8100b0050eaa9673edmr145525lfv.136.1704353054338; 
 Wed, 03 Jan 2024 23:24:14 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 (net-93-150-255-34.cust.vodafonedsl.it. [93.150.255.34])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056402000300b00553772c2968sm18530735edu.82.2024.01.03.23.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 23:24:13 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu,  4 Jan 2024 08:23:37 +0100
Message-ID: <20240104072407.41290-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104072407.41290-1-dario.binacchi@amarulasolutions.com>
References: <20240104072407.41290-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/8] dt-bindings: mfd: stm32f7: Add binding
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
