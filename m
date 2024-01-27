Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C9F83EDE9
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Jan 2024 16:28:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49E8EC6DD95;
	Sat, 27 Jan 2024 15:28:59 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 041DEC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Jan 2024 15:28:58 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-55783b7b47aso1207111a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Jan 2024 07:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1706369337; x=1706974137;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a87Eb/9UHW4xhpeCgDcrODCTwbLMJ8A3Dzblk+B1akM=;
 b=hUrylk0Cfs+ftWNdmyhesUXdCZ7rIxLlKfRbWRyj0/d256AaeW2JA6pV/l66f5AaM1
 3entK+4JdgYD1NlKn+kQ6g/qelwVriJZ9kSe+V0+kOSVRYyRq7gNCSR0b/O76uHnqNpa
 GbtPyEoido+CxiP2uGp33THZQTi/n4wZwxvNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706369337; x=1706974137;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a87Eb/9UHW4xhpeCgDcrODCTwbLMJ8A3Dzblk+B1akM=;
 b=bmzFm2nQf22gnqPV4dUaip1u6QyDD9ImAzlJgCESsjNdVqGAIYJ1ArK0aZFkfGHRua
 rn+Nuvs/CY5ZquSIlQssk++FgA4h2kA9RJBbn/5zr7G2MfiC44lGzAEPtOC9FYWCw+Pg
 Rwl4VXKN/FnCgcJhudjzFoqYa27YZOHDFkDXAEfrLt/Xu7r+eWYLmc7pzJ+Fa1jwDXOp
 urDju6GLO+WsWZJBUYD8G4AWlrdFWoGHGYCuP1dkSZSTZJfgQp250mvFf3/3P/FxUs+e
 PftNNOMJUN9czbVpgIdX2+gK6weztb8AUCZILrrvePCJdoQVsZ4L1dAGJDhbJsJOREr3
 L5pw==
X-Gm-Message-State: AOJu0YxJa0LTA/WAFOdBv1LenYb3pfiId/aXjHU26kIEuUfvndQus+zK
 JRYpmHihnsie5YfJXTopaWiQi86FKIw4fQCnI20IIemBSEU9KV56//CVpTLpFSg=
X-Google-Smtp-Source: AGHT+IFok2DS1I2uZ0WZjZt30o3ToZii3URXONkgx9zDXYEfhMksN5xbCHBviWnSywDeom/HxchUmA==
X-Received: by 2002:a05:6402:26ce:b0:55d:eaaf:847d with SMTP id
 x14-20020a05640226ce00b0055deaaf847dmr1292495edd.6.1706369337636; 
 Sat, 27 Jan 2024 07:28:57 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-21-103-141.retail.telecomitalia.it. [79.21.103.141])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a056402344500b0055974a2a2d4sm1745220edc.39.2024.01.27.07.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jan 2024 07:28:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 27 Jan 2024 16:28:45 +0100
Message-ID: <20240127152853.65937-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240127152853.65937-1-dario.binacchi@amarulasolutions.com>
References: <20240127152853.65937-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v10 1/5] dt-bindings: mfd: stm32f7: Add
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
Acked-by: Lee Jones <lee@kernel.org>
Reviewed-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

---

(no changes since v8)

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
