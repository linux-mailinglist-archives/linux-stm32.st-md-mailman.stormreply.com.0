Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 807E66D1A23
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 10:35:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43552C6A5F6;
	Fri, 31 Mar 2023 08:35:12 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A26FDC6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 08:35:09 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id h17so21571414wrt.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 01:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680251709;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=A5/X3/1Tx5hLaqv79uU7wuySkv7lfnq2I4RAVqFuiIk=;
 b=JRJQX3qf6nbWRRhjPQNrARTIyJRjN85WbOZTRhfjLkq95loPYQtmcz9uuRtmXD+gF0
 pbjlvjWUpM5s35eLwCfaIEAjNdqCVJqUbIoJ0QQ+NUMzZjtV7Kxbb9qHdGemp2rn+kMY
 Iogew4j3vSCvnnTWMPSv3pUmltFB4eJLvdhtB7DgxhbLKFxRNR7Kae+MW+amWDOuGH+K
 0TIBTDavzQ/ATWYsYCgjlgvssAy0cZ+yRGjNI/IOQWRKqbCot7nTCcwYctdEE3g9Fhow
 0GHMU5sij/cF06KleMdx4uNj5gz06aYrtqcKb/iZZ8GuVraLGpO2QvwZWp3MdMXVyQ6A
 wvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680251709;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A5/X3/1Tx5hLaqv79uU7wuySkv7lfnq2I4RAVqFuiIk=;
 b=y59fmPLTkEpk+KN7BEJiRwk9sL1ooEjs2w4JbD2ZO2ucU6L67zN4/lEo75dEtiiAuK
 zbGOhyIHp7mZuuaF3BalS1uj9tyYDMcJg5KKilwYnPpRPlLP9fH2AN3tW9QTfeJckyyr
 N2+6ga26/nn81N3/p8dJjsxbI8L9IjvHhGu5rqXoOxVi+4hmMqYQCIyvS/pTavJB+VIQ
 xrh4LTktuJ+8aswHLBxl4f40b03GA3QE0a0EXpsVgHWINCxvYcRovfjsRU2zSVvKdLWb
 uZd57eifuj1FkLaZo7LxAUsZ4RHQS2ZyaVpJzRsvGun759CLWaMzEz87ocRH0Ukzaevn
 khEw==
X-Gm-Message-State: AAQBX9evZaPiUPC6DIYSGeVx/eicmX50voWe3FJ2kTMvVsyvLR8I2cJZ
 LdU4KbDoNkJTKVxC0IHPyb6Inw==
X-Google-Smtp-Source: AKy350aYemXoWmOPKcUW9zRssljXvnRo5Q8xdKbF8v8OuSCqLpxJ51RrFOLM7mEYYMCY0HOKI4STBA==
X-Received: by 2002:adf:f04b:0:b0:2d8:57b1:db6c with SMTP id
 t11-20020adff04b000000b002d857b1db6cmr18990831wro.9.1680251709411; 
 Fri, 31 Mar 2023 01:35:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 01:35:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:56 +0200
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-18-5bd58fd1dd1f@linaro.org>
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
Subject: [Linux-stm32] [PATCH RFC 18/20] irqchip: irq-versatile-fpga: remove
 obsolete oxnas compatible
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
and since no new features will ever be added upstream, remove support
for OX810 and OX820 IRQ controller.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/irqchip/irq-versatile-fpga.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-versatile-fpga.c
index ba543ed9c154..5018a06060e6 100644
--- a/drivers/irqchip/irq-versatile-fpga.c
+++ b/drivers/irqchip/irq-versatile-fpga.c
@@ -242,5 +242,4 @@ static int __init fpga_irq_of_init(struct device_node *node,
 }
 IRQCHIP_DECLARE(arm_fpga, "arm,versatile-fpga-irq", fpga_irq_of_init);
 IRQCHIP_DECLARE(arm_fpga_sic, "arm,versatile-sic", fpga_irq_of_init);
-IRQCHIP_DECLARE(ox810se_rps, "oxsemi,ox810se-rps-irq", fpga_irq_of_init);
 #endif

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
