Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 419D483A7EA
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jan 2024 12:33:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05615C6DD76;
	Wed, 24 Jan 2024 11:33:45 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DBD6C6DD74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 11:33:43 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-40e87d07c07so67089925e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 03:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1706096022; x=1706700822;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a87Eb/9UHW4xhpeCgDcrODCTwbLMJ8A3Dzblk+B1akM=;
 b=kdrLMlzxJziuTwjlvF6ab64NiDzU32lnxxqBTo+oaOvEg+p8vYfAQf5bAWq+zh1YLa
 p54OHT+bWyp4uBZmjIESTw9PTC3l+uPVPLpO+pLmfmN/3lK26fxFFRa5107SkaLD3twg
 yW5hrS52e+mubHtcni4E8Z5pPBVukCqbLcshQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706096022; x=1706700822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a87Eb/9UHW4xhpeCgDcrODCTwbLMJ8A3Dzblk+B1akM=;
 b=wY6cuPSBVQkYhsPfXYo5N6VEmcDYmIkFMtNSCmdbMcsN4FAifO5gb8PT/bzy98luOJ
 HaIUguGP8c0RLHwda7TefxjTUO35whmNl7FLUmLmO7BhS5UDhQm4V/sWzbzAieQCqV8b
 ZcUOPxVEVVs3evHzSfuYYJDaI7sKekQq0j+Tt/Jl4fZ6okUnWh0RJWx98XPUjU9jOnh2
 ximp8nYzMKvj4c36C/pYNMVv7/KY2lS12LKHX3dhViogFOwaTyfuOVa1Qk8HSKGV0vjW
 +NXkP462w8qSxPrkH0iUyuMrczisf+uZy4taxwFy++p2EqKVr2mWEdKICJCFREab7xhh
 HHbw==
X-Gm-Message-State: AOJu0YxgXRL1zSt68llZjmu5dWt8OLkrsyWGrAFJN0U15Lh+MZB++bXH
 76vgOemMYTBUDk//obRMddVxRkr4w+uk80Fh5dhwTQd96unpg6/Wlbg8m7/hag8=
X-Google-Smtp-Source: AGHT+IHhC7Xk71DCFuIqvgcVaL/Kb8lFavZF3/EWWYo8FxE3kkEBMz4MmfbX/pgqHTKlP0HESOFPUA==
X-Received: by 2002:a05:600c:300c:b0:40e:66cf:4d96 with SMTP id
 j12-20020a05600c300c00b0040e66cf4d96mr1225243wmh.130.1706096022667; 
 Wed, 24 Jan 2024 03:33:42 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. (mob-5-90-60-192.net.vodafone.it.
 [5.90.60.192]) by smtp.gmail.com with ESMTPSA id
 i18-20020adffdd2000000b003393249d5dbsm8447950wrs.4.2024.01.24.03.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 03:33:42 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 24 Jan 2024 12:33:10 +0100
Message-ID: <20240124113336.658198-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124113336.658198-1-dario.binacchi@amarulasolutions.com>
References: <20240124113336.658198-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v9 1/5] dt-bindings: mfd: stm32f7: Add binding
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
