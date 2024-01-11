Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B3182AC7F
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jan 2024 11:53:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93391C6DD73;
	Thu, 11 Jan 2024 10:53:21 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FCBAC6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 10:53:20 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-50e7d6565b5so5837499e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 02:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704970399; x=1705575199;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZHp7o9P6sSCcRzfgnf9GmPoPPKRvORDv/jTzo46w2U=;
 b=mFMeDLKmXfqqL+xQ/2Xxn6EXU6JbpyCTBRs5uNJWnvCzl7pk3LxNbAm/zrhEfrwtYR
 4LqS+sVW90wlaBgkCmQ43G4inWPnhZIA1+zAgEmbtDVmoaMYjsgvqbvDZFJ2s5FkPq9P
 gwFKsAujPdLeinfGkB+9SCR6h5rJKXYvbbdmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704970399; x=1705575199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZHp7o9P6sSCcRzfgnf9GmPoPPKRvORDv/jTzo46w2U=;
 b=fgjAxRBxt23D69KgkLviQlWd1t8qZjnUJxaTLBDUKi3zcycT9rATdjfo3tZOuofA75
 RtiMlN/DwPKyWXossuVGrUApjhuRj44nHT7ivybHLUywyufWJg0zR0TZzW/C2j3Lwdhd
 /xY4qRSPA5gu56LFegcdsSEywxWLaNweE+8ryqy6p42v6YcXghDDjkRBf4A7HWsJDMxh
 AwBEOFLVe/b3FuXWxc+5GUWTN2RMQv/8uuKy2fVNsIgi82zLfqIp9TqWthivkpsHj0FF
 wm8yVzMSSMIUsw7JS/sjOKc41a64E1GdLC2RzvWjFsCXY/FqPP85vLWnuRrE3/ZVuhJq
 Cp7A==
X-Gm-Message-State: AOJu0Yw787m33AP9unnSWtWCNPG6GXGY1rAw8QBTn4Mvbkh5v2Fi0WXq
 jatNkd8NEIwWJUV5nsZ2+sDqlTPLDZw5Sg==
X-Google-Smtp-Source: AGHT+IFWSjXByH6ZKx/v1vTqMtJ7fp1k2eHQ6huyT0Q3lwRrsx9pvciok9UGoesseA9JTkKiNriD0w==
X-Received: by 2002:a05:6512:47a:b0:50b:c57e:1418 with SMTP id
 x26-20020a056512047a00b0050bc57e1418mr452684lfd.16.1704970399508; 
 Thu, 11 Jan 2024 02:53:19 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 ([95.236.91.90]) by smtp.gmail.com with ESMTPSA id
 eo9-20020a056402530900b00557b0f8d906sm459774edb.70.2024.01.11.02.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 02:53:19 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 11 Jan 2024 11:53:07 +0100
Message-ID: <20240111105314.8186-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111105314.8186-1-dario.binacchi@amarulasolutions.com>
References: <20240111105314.8186-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v6 1/5] dt-bindings: mfd: stm32f7: Add
	binding definition for DSI
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
