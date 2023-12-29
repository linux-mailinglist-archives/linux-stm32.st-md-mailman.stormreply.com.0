Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF27481FFC3
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Dec 2023 14:52:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FEBDC6B47E;
	Fri, 29 Dec 2023 13:52:21 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB338C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Dec 2023 13:52:20 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5537dd673e5so5544077a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Dec 2023 05:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703857940; x=1704462740;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dANREROD+IgEOoBD9HuNETn+rArj87c15/xEZ3DaVGI=;
 b=HhTtxuIvSO4zdHaRwAmHlYiJFldF0ghUaa6E7skBEsrRMWKGLdpDWarURixR9pSC1N
 qMbuKUqrz+hN7H8TVzPN0kv9g2c6nNLS+sLarmBM3OK7+0Zuf/Q3mcqtxgU8r5kB0g4f
 kNUyAWJYpcM+Aj+wkSbeoivxdNUdWW08g0Ez4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703857940; x=1704462740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dANREROD+IgEOoBD9HuNETn+rArj87c15/xEZ3DaVGI=;
 b=PirQS4nquyT4QMrHRTuwvLrlVpDXsK3LUw+SMCejaTfvX6Q0etsExebm9OnqCt2Mnj
 SKJn/WBN5TMQFG7RK93dGs6H/lNF0CCpZ09lA51xJgWN+eAnFpkVWzrkrPVwupimyp+U
 hpOhvwcOvmQuT0cT4C2Uyd3i4OKRTDksJaEegRc1JbgmgRhUxT9OzEVYy4nKrN5D4/Qr
 4bkvpYvJ/gP9WqpGaU01C/uI1k7gLnRnm01QKQssx85sfvDDkBDCXiEUc9r3hyCKlwCS
 HLGoX8nuYInbFsqaoCWAwgTvdvpj1c8E2uGBTcFLpWr3elYJAuN3wIjxkwmvoRWZ7PyH
 +Fkg==
X-Gm-Message-State: AOJu0Yx1La7FbPu4jIbon3O8mbGjmWBDjiDXo4MCofM0ked340yJsoS+
 YjsS/kP/uRFjIyDN5CnYlNAzyjfww65W9w==
X-Google-Smtp-Source: AGHT+IHyVOWOBfNDlo4mol1vW1dAUbg8qeIE2UPa9VsA43TGgnuDO8rSloKG/nmcBd59a5nddE3kxA==
X-Received: by 2002:a50:b404:0:b0:554:9bef:a1e9 with SMTP id
 b4-20020a50b404000000b005549befa1e9mr5407202edh.22.1703857940388; 
 Fri, 29 Dec 2023 05:52:20 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-49-57-70.retail.telecomitalia.it. [79.49.57.70])
 by smtp.gmail.com with ESMTPSA id
 i16-20020aa7c710000000b00553b243b1a8sm11019160edq.92.2023.12.29.05.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 05:52:20 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 29 Dec 2023 14:51:16 +0100
Message-ID: <20231229135154.675946-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
References: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/8] dt-bindings: mfd: stm32f7: Add binding
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
---

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
