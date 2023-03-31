Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3236D1A03
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 10:34:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66C4EC6A5F2;
	Fri, 31 Mar 2023 08:34:57 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9044DC6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 08:34:55 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id h17so21570787wrt.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 01:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680251695;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0V8nry5kWVC4/7uVK2TIBPivIea0+SnMt7iP0mU4Cw8=;
 b=chZXAA03Ktj6cCYt4xjrNnHn2g3CbaZsDusqs4uU9Vhv0+pAm8jD8YNmIH6rxRpV+h
 vZbIeRwPEq02v7H1BQWanP2WxcrxIeZKG+trsgqWf+VelBUfmK5t3LKEmSAqUKxTZ13L
 +G9CVycFJ35xf9hcvHQ/5mpMm4vgT5JJt3pCOGXggW1pTaO5/XGxwGfSkh0l2D4lx3xm
 CdU9FttI+BGLbTmFYxZ4WJMPU0cKt87qQLmEz7fPijrzLc+aEfpd2hBm32tMeL2yzewe
 wa8ggH+56W4skf84z3SrfyGgzpsmcwI8xPuwXPLIfYxeKh5XiRGPo7geoXtpM7Y1dKG0
 wv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680251695;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0V8nry5kWVC4/7uVK2TIBPivIea0+SnMt7iP0mU4Cw8=;
 b=pSxJp9N/wScc1zsyVosiODncLigsbvD1aT6R0CaS0oyb8dFy70tDLkZhlNHbpsxlG+
 p10irOJ6z0kQauK1pWxMIsJ6AbnTCfS+Y+KtoknhjvzWOv7mFfWunvdnyljkyvt0eNXl
 nrQtm5gBmpmZRSbqK3jvwvzddknzkVblLkvE6YwMxWR2MxDX1AqmGBNfAcLbodwHUD0k
 Tu7UVDLF37qDcVpcCRjjyQT8E2uD2UbG8QlF440pRzMMAYl1IEnoS+hM1HG6c0WHADcF
 bdWKRR4xvwVHgrf1+qx+P/KtPvjxVOlPKc2HrZ8iTHlSZFhVRgW5EyP0bhu4ZkemX2Fv
 6Dmg==
X-Gm-Message-State: AAQBX9ep89SV0hJREnni7mOff9fscDTru5ScDPmLC1cp/1H4q1LANYmK
 e3Jjio6sHPoNgw95LOSCHCjy8w==
X-Google-Smtp-Source: AKy350bhK+x7s++84IOWEFVO/gMXDRH9T/LCqh08NqEq24KOmp+VFPEpoLewHAutg0wJysva85qmrQ==
X-Received: by 2002:a5d:550c:0:b0:2d9:5608:ee0 with SMTP id
 b12-20020a5d550c000000b002d956080ee0mr20654106wrv.69.1680251695160; 
 Fri, 31 Mar 2023 01:34:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 01:34:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:46 +0200
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-8-5bd58fd1dd1f@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
X-Mailer: b4 0.12.1
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 netdev@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 08/20] dt-bindings: timer: oxsemi,
 rps-timer: remove obsolete bindings
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

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
OX810 and OX820 timer bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/timer/oxsemi,rps-timer.txt      | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt b/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt
deleted file mode 100644
index d191612539e8..000000000000
--- a/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Oxford Semiconductor OXNAS SoCs Family RPS Timer
-================================================
-
-Required properties:
-- compatible: Should be "oxsemi,ox810se-rps-timer" or "oxsemi,ox820-rps-timer"
-- reg : Specifies base physical address and size of the registers.
-- interrupts : The interrupts of the two timers
-- clocks : The phandle of the timer clock source
-
-example:
-
-timer0: timer@200 {
-	compatible = "oxsemi,ox810se-rps-timer";
-	reg = <0x200 0x40>;
-	clocks = <&rpsclk>;
-	interrupts = <4 5>;
-};

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
