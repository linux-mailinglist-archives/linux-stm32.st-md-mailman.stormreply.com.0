Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C79C6EC14E
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Apr 2023 19:25:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F830C69063;
	Sun, 23 Apr 2023 17:25:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99E46C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Apr 2023 17:25:40 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-2fa0ce30ac2so3293502f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Apr 2023 10:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682270740; x=1684862740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6edtHrRUhMOVgTrX/B7WTyKMw10ZM0V+1t1+5ZMKBJE=;
 b=JADuU+heM2MwZW61nEJP7BxXxJ+uBDr7C7gBiY+1WKF53GSrll27l31QhAAv//vNCR
 MyIIGRdjzcwFduWH0m5lY+8JVthfsqqXnx2kdG91PzmYiJzR0ew21vv1f8YkRcg+udXY
 2gynCLOKAD0aiNiUmStVQHwLXFIDDuKHPct+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682270740; x=1684862740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6edtHrRUhMOVgTrX/B7WTyKMw10ZM0V+1t1+5ZMKBJE=;
 b=VZHL9XMSjHVqLlCY8jRe5k+sUsjQnSDTeR0omiGgTgY1pAzzaYgLthlIaD5IAutRlb
 HqBCaF5DUhqeHngP5K8qPvH6QE9qgnHmgntbXoBKWZXq674Upsb3zQZSDbMgqdKIY1WC
 c9MpG3DfsnU3PbtWEkU7UOPS76DEYqsqtxzbStVxynd9+ZQwW0yojhgcvjBJtXXw2y3P
 ux5B8Ltq7bHzU5FVoVZA8po3gS8KCASPPUmA5c88iUIydlcA1uIzHanzDtR0t73zlBp1
 4byKDB1GRx764zMsWA/HJPwLVWRpw4Qc1eTsX9HkfJY4NFSLyx7eAHGw6Iz5fI7el5OQ
 9qdQ==
X-Gm-Message-State: AAQBX9e5euYCSl7+JAvqDOeMdPrVkYg5JvIRCJi8JmeE0+5qzdS9rnte
 BUc2yqKQ9OtjjunuPTI3kv9RQA==
X-Google-Smtp-Source: AKy350aVRAXW4ATQqNQqvDdR+BpDs/g0j3TnW8XRhPkWLSn+glwqdMA7cgWlU85pvQIpoYnPzL9ovQ==
X-Received: by 2002:adf:e28b:0:b0:2f8:24f7:cc4a with SMTP id
 v11-20020adfe28b000000b002f824f7cc4amr7634427wri.57.1682270740105; 
 Sun, 23 Apr 2023 10:25:40 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([37.159.119.249])
 by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b003f173987ec2sm13511653wms.22.2023.04.23.10.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 10:25:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 23 Apr 2023 19:25:25 +0200
Message-Id: <20230423172528.1398158-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230423172528.1398158-1-dario.binacchi@amarulasolutions.com>
References: <20230423172528.1398158-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/4] dt-bindings: mfd: stm32f7: add binding
	definition for CAN3
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

Add binding definition for CAN3 peripheral.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 include/dt-bindings/mfd/stm32f7-rcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/mfd/stm32f7-rcc.h b/include/dt-bindings/mfd/stm32f7-rcc.h
index a90f3613c584..8d73a9c51e2b 100644
--- a/include/dt-bindings/mfd/stm32f7-rcc.h
+++ b/include/dt-bindings/mfd/stm32f7-rcc.h
@@ -64,6 +64,7 @@
 #define STM32F7_RCC_APB1_TIM14		8
 #define STM32F7_RCC_APB1_LPTIM1		9
 #define STM32F7_RCC_APB1_WWDG		11
+#define STM32F7_RCC_APB1_CAN3		13
 #define STM32F7_RCC_APB1_SPI2		14
 #define STM32F7_RCC_APB1_SPI3		15
 #define STM32F7_RCC_APB1_SPDIFRX	16
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
