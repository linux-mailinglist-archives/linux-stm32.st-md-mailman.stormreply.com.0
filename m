Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B5D8278F8
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 21:16:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CF41C6DD73;
	Mon,  8 Jan 2024 20:16:25 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 105A9C6DD74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 20:16:24 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-50ec948ad31so356207e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jan 2024 12:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704744983; x=1705349783;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZHp7o9P6sSCcRzfgnf9GmPoPPKRvORDv/jTzo46w2U=;
 b=MuxmDcNShIFCAXHCv07D8R9OAACJBgEXpVq3/2a+HQp5a6rcmbK0/7MgHb+WKp767B
 u1o+2/bsA0mCPvfj5TaCzvovNPQMoks5pKlYzlyLdKc2TMGLETioJRsc0ZeIMdPQ9b5t
 YdS6JA0ABr3s85lDvG5jiraPwUviR5z4wv4j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704744983; x=1705349783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZHp7o9P6sSCcRzfgnf9GmPoPPKRvORDv/jTzo46w2U=;
 b=ooG607tGpWsdXWyotwcJTZoexKAz1ysX8GRWzrq3puPvkC1P3Ml3hrAUz4legUbbYU
 Ccw+bup5kr3lNaN/e+XzyZSZLANV9qsa7FPIcbyFxOeVbgnazXBk1AVvRf4hea/Yb9qb
 YRVh35A7pVxpLCCTOVKtxHpW8GVKmtTV82kRzDO6THFTFG37Xr4rXaje8MqThGiqsUNs
 YUpEe81HQak8vf6n9bFz44F4BkGmAhSZougWIzBPDmcAG9bU8t/cWjGPuNdlB+ETlgZe
 51hqKTJEPSDEmUCV1ujKRZ3DfW99wnhO0Lp4vpBxGkONxTzOY0GzDXLUnb8LOveobc4A
 dIOQ==
X-Gm-Message-State: AOJu0YwCyr9LdRmdu6yQUTEXPzASOhSXJ2gG2YvxOUZkuzIQbxELaLSC
 wEjNpyAAZn44DQ6wqnPAw6JLfQRntNW60g==
X-Google-Smtp-Source: AGHT+IG+bnMS+c8tiYQ5DRcgpg4/in0j4YpErDzhA91O3wWg4FpcIE3GXCuL7kfF9HOWzE4sOP3CtA==
X-Received: by 2002:a05:6512:3f01:b0:50e:73b8:e8b5 with SMTP id
 y1-20020a0565123f0100b0050e73b8e8b5mr1890614lfa.74.1704744983333; 
 Mon, 08 Jan 2024 12:16:23 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-2-38-81.retail.telecomitalia.it. [87.2.38.81])
 by smtp.gmail.com with ESMTPSA id
 by26-20020a0564021b1a00b00555fd008741sm173699edb.95.2024.01.08.12.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 12:16:22 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  8 Jan 2024 21:15:46 +0100
Message-ID: <20240108201618.2798649-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240108201618.2798649-1-dario.binacchi@amarulasolutions.com>
References: <20240108201618.2798649-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 1/8] dt-bindings: mfd: stm32f7: Add binding
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
