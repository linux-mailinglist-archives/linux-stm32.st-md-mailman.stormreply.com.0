Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB65B9D79B
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2019 22:45:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 528BEC35E01;
	Mon, 26 Aug 2019 20:45:07 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 391F1C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2019 20:45:05 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v15so813202wml.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2019 13:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FoQUNs6EXC98c6qNkjKAv+h1NQz6LneBfiroF9aLlEY=;
 b=jPW1jRGNr3AnUe8RjuZmRCXkYAzsbzMhz32nq0OWWy1zpvhbhiDiAAuRPeiyVl491V
 cCLcdpNtFLqim8SyephS7b9b9ko8sszl0kvNj9BUd6h/QBPgHXF6o+PKgNQPiVfYIRFH
 B5PaOVC29nRY9kNRjKZOXYVORKwkhwB4w6wIQfyh5qoOxK8zLHitQH33/0d6bWm9f+Hp
 jXHkDDm3osu6MOCTwW7J2wI7rENToUJpJEwajOTRQlt9CP252Ej6QkLEf/vKr4EMYtlw
 qSq1d5xHTNDG2TjA+3gjsTNtCTSGd3PgMPfHdHP33PAXjh10wjQNIX5E0VjydN1qN6wD
 2U1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FoQUNs6EXC98c6qNkjKAv+h1NQz6LneBfiroF9aLlEY=;
 b=CbkoOEe/y8HoSGH2Tucak2Alr3QRSqfoG35rFDHc28bxRbyCLtoX+hvUs7Fq8kI8+J
 bAym386R0jRS1W1rSBheF/rIkday52PGTeXnUy7Qv1gYuxWOI+GgfAm+GfRA1d5c4dYv
 1BUI9Y9FEMDftlwYYXiPNTnQIV2R6X2OnzLW5KDJJfCPQFR4dnOwaENSMdYFjG/dIwno
 ShBDuGJqn5/rGlK/qShE4l/cwIR7Zi48u3QcvY53mQpMlPzGCYeVIdmpDKzpe52e/GqC
 QaVUlX7hMmevLdPepjz+SB3SFJHQXAEEgCbiVJaAzHLDPITMe1E7MpDj+rQkSYRmNBh1
 7nRA==
X-Gm-Message-State: APjAAAXRgwg4rnVGHupmD4b4h82pLy9n1gfyNKDBfK7QaaLlgEeiC5rN
 IZ7ODhuv+dtVAug9rC0XO+yUVQ==
X-Google-Smtp-Source: APXvYqyHbekAIjbL3EcGUIK26+5NTPt6HqD6js8hW+tX33ban4SVbg0ypMkdOAVMDSLQmyTu6FbxxA==
X-Received: by 2002:a7b:c8c1:: with SMTP id f1mr21953351wml.87.1566852304570; 
 Mon, 26 Aug 2019 13:45:04 -0700 (PDT)
Received: from mai.imgcgcw.net ([2a01:e34:ed2f:f020:f881:f5ed:b15d:96ab])
 by smtp.gmail.com with ESMTPSA id 20sm549557wmk.34.2019.08.26.13.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 13:45:03 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: tglx@linutronix.de
Date: Mon, 26 Aug 2019 22:43:57 +0200
Message-Id: <20190826204407.17759-10-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826204407.17759-1-daniel.lezcano@linaro.org>
References: <df27caba-d9f8-e64d-0563-609f8785ecb3@linaro.org>
 <20190826204407.17759-1-daniel.lezcano@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH 10/20] clocksource/drivers/renesas-ostm: Use
	DIV_ROUND_CLOSEST() helper
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Use the DIV_ROUND_CLOSEST() helper instead of open-coding the same
operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/renesas-ostm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 61d5f3b539ce..37c39b901bb1 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -221,7 +221,7 @@ static int __init ostm_init(struct device_node *np)
 	}
 
 	rate = clk_get_rate(ostm_clk);
-	ostm->ticks_per_jiffy = (rate + HZ / 2) / HZ;
+	ostm->ticks_per_jiffy = DIV_ROUND_CLOSEST(rate, HZ);
 
 	/*
 	 * First probed device will be used as system clocksource. Any
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
