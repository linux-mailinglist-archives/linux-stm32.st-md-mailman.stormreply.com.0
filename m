Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F8D744074
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jun 2023 18:59:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFBFDC6B456;
	Fri, 30 Jun 2023 16:59:01 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C2FFC6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jun 2023 16:58:59 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-313e742a787so1907119f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jun 2023 09:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688144339; x=1690736339;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7RE5534hcGxVn/KNo4nNaHNAogiNWte5Y38IgWgMeyE=;
 b=gR6XOYdMaz4svBnafrAt8z5G3LWrxkXx+DHTJ3rnahYVDf05L/uW7OhXWeAWIqfQVo
 edwrNpWAfmHD/o9eGOgjuDipftZKWa8FzAaHW58dpkijnk56ldCGxmyCK6cPs3guGGFG
 s+8itEyQW84sAG5APGIGylBvPZKRmcrwxH0KM5ZIyKwbUsq0A7pSt4qK5PVnT04kSTbx
 8SH3WgcUUyG2AGIiwSEzrlBfALSCgC+x36PgqYPgBFdktRGSShh5gO4yLrlJRvfmPbji
 GbCP6PJZqhbajC2s8LN0ysfkZ67Cx07Wy20YrtJUyJ9WhQKPBLq2r88Z/kj7Auc6BBjE
 GJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688144339; x=1690736339;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7RE5534hcGxVn/KNo4nNaHNAogiNWte5Y38IgWgMeyE=;
 b=kor9vKprd9Vqo+/xGjqz52JgPIxA3T+miV5b9FBt5HHWhnLwPsz/vl1vregq8yr5WA
 rIb17T27LIO3dxOK2kDZkDk+UCUSHg4HOhS6YdQwnFrgicfAQDlWlstG8wxRc8mMJS14
 vDFcB/ACKsD43z8bkosXBmD02W6q+EhcKBfyXKczB3h++zcNIV5AsHv5X7LZpuUEaDRE
 yCHBugAuVZxkL8qUklUSOKFQr3+lWaOPTtFGYfWfe2QaRS5/xGna7hNnvSpssLFLR/hl
 wV+SDle5kENA70e6+F2cPIxtItM/j1mZ53Wk54i2tWdu1r14lFIVT+4meGjuol7JIMdd
 Tz5g==
X-Gm-Message-State: AC+VfDwtxH9KTDUsdahVnXFfE9exPP6KOy23pmsTdDQvZucwVB58rR/w
 eYlPTf/L35wRRiHcIMycABuZ7g09kMsgrPkeLfi3lA==
X-Google-Smtp-Source: ACHHUZ67VHZg4s+SYrTR6+84c/ufKS7Q01De9EVEy+1Ktnx9SqhFoXMa/ALr5i7wOY4YYAh12zGPEA==
X-Received: by 2002:a05:6000:104d:b0:314:2c4:9fea with SMTP id
 c13-20020a056000104d00b0031402c49feamr7004552wrx.29.1688144339127; 
 Fri, 30 Jun 2023 09:58:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 09:58:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:39 +0200
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-14-fb6ab3dea87c@linaro.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
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
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Marc Zyngier <maz@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=KAyf/uprdG2/Uxev0fRE9woiE1KO/ssntpRa1SRTGCE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm5ebaeq5y28ag1NJPXsR2UMRtXo/2vvtxyaCAH
 q7bNYGyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JuQAKCRB33NvayMhJ0a00D/
 949YBvowHmFLhM/PIxv1RNwEMg/gXdoG/wZrUvr3PALas1Cu0FQTMj4xevGv3DdfS8uo3ctM9oWYV6
 By90JIc1WSNQmG+KCH4hm+/qf5oE+Gw0Z3wEBD3rsvElYFEQ3fwuPrztim6PnbGy8QDBwms1IQIfzf
 h7RLWvZ+E8qGp3eltGC12OHkBIePX0rXXrxjdedr/j5FIw6tA75yvupH2hOl4NrPRBMFysio3ZkDWc
 9M8CG8/5lKHq46Y0YQxGe33JYEliELgFeuQZ2F2wAa8691MAj/qQgGvNkK+p0d3QC8ffPUSwyr3VmH
 5Q25o0x6lw7sIETB+MEPAkNIHmB/T6nlcBZXSf8KPxekM9p89ERPpyZVYu6fgo7AgnHZ2ViAWfT0aK
 vJMjzlAtrNbHtCUfuytjC+4kbC3bDd9vNFE29dLvMuhuZD+DnsX/UoP/WyAgt28L2k8BVEWwSbyCaQ
 2eYdh4Y+6SFl4s5/eClwjOvqKjGKgqEhW8aOec1A+m1QS5VYIk8pHdk0RSKLAMbNrghtIhbKMyQhU5
 860pnYTW31uqEHzSrRV62sO4Jd841tMmNAuImfY91tf2tLKDPYfECYF1tRp4lhsqUy9s8lxoRc4IJV
 mozMYh/oDrg2/3lH8mszi0QhKB4BvSDNTDFh/hQrDLMyXPR5es8ILH2xAzcg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>,
 linux-oxnas@groups.io, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 14/15] dt-bindings: interrupt-controller:
 arm, versatile-fpga-irq: mark oxnas compatible as deprecated
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

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, mark the
OX810 and OX820 IRQ compatible as deprecated.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/interrupt-controller/arm,versatile-fpga-irq.txt          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
index 2a1d16bdf834..ea939f54c5eb 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
@@ -6,7 +6,7 @@ controllers are OR:ed together and fed to the CPU tile's IRQ input. Each
 instance can handle up to 32 interrupts.
 
 Required properties:
-- compatible: "arm,versatile-fpga-irq" or "oxsemi,ox810se-rps-irq"
+- compatible: "arm,versatile-fpga-irq"
 - interrupt-controller: Identifies the node as an interrupt controller
 - #interrupt-cells: The number of cells to define the interrupts.  Must be 1
   as the FPGA IRQ controller has no configuration options for interrupt
@@ -19,6 +19,8 @@ Required properties:
   the system till not make it possible for devices to request these
   interrupts.
 
+The "oxsemi,ox810se-rps-irq" compatible is deprecated.
+
 Example:
 
 pic: pic@14000000 {

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
