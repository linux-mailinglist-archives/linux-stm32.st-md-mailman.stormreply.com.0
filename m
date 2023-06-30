Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C9D744072
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jun 2023 18:58:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A13D5C6B45A;
	Fri, 30 Jun 2023 16:58:59 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01881C6B456
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jun 2023 16:58:58 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-314118623d5so2371295f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jun 2023 09:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688144337; x=1690736337;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=safrMj4vy3+0ORPoAOcHGXU9yJdkC+AfKJ9DByswV9U=;
 b=lLnVdrw2EiSYW0TzS5oXpXUn00LFUe5uWezU6Knq3a+K5EfgjWi3VLLM93y7J4J8C+
 M0pw6AKbbhMm4vPquXrsqqvMYa9nxJlrpAoxOGQGp3HZtNHqszxo4s9fctQz7IUO7mtM
 Bd8yHsc9Iw7jFE7JQYq0uvCATVQ0ZT/KA1Fz2Qfc13038jdpksmKW4VyfbGLfT1oi62V
 444cv4OU6WcOT2oDcWtibODh7coMduW5w+z+CO22s/94ex6kjrQ7fiWC0oTbuVD80o/y
 VyRZaU6E5AAbCNhUr1B7dLPtMMF37+w5JppHPZspuG+mRwhXtKCoSUrXMnrrqe9xt4Rl
 Q5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688144337; x=1690736337;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=safrMj4vy3+0ORPoAOcHGXU9yJdkC+AfKJ9DByswV9U=;
 b=QePw8q7pg2vEzOuZ+vPZaJuHvzIO2bZsXKJO8xr131E4lTrdoTUbytMvYiYfqSc5Q3
 1++26IZk59GBXm5HVz3oYCmD6zTWw5Mo6ZqpeSumCuXKH6vEfwWf6bRaBFB6PntieW6A
 yQXK2p32lY+QtXtS3lQxxpxHKi/p9NfLB9p0DHOaxyotayyf7nEFJRKMqe5nCjH2Vz+C
 Kd5+NlpVPn8gi5TnLF5516PomwT1hUu2phtksrM2lm26ZklYgj78z+fZXHAd6Uz31Hem
 WEhSIP5FJkAjRybjlaG1V7JqMAcIzgjF3NibMV1jeezVlz9dIWfKT7N9aXpoCnbvLezf
 qwiQ==
X-Gm-Message-State: ABy/qLY56RYLNk1TdgfK0KyiR4mVphvKZ6eQy+XAks/eWofchGTHvEph
 T0Y/Br7StoDeKDVxvv9fINfASQ==
X-Google-Smtp-Source: APBJJlEKyEGgCYGMVtZF4uOEb2+kQTTFHk1HYk7zoA+qJfRnhfllehuKYiRJedUqKHunCJKD/gD5YA==
X-Received: by 2002:adf:ed0a:0:b0:314:13e2:2f6c with SMTP id
 a10-20020adfed0a000000b0031413e22f6cmr2444572wro.58.1688144337623; 
 Fri, 30 Jun 2023 09:58:57 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 09:58:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:38 +0200
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-13-fb6ab3dea87c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1082;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Hwq/1nyBJbIaeaNsvFzhDu1oXx5gpF7OJ2azvf7yeno=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm5eVilyz5juesTZ+I8YEmM7E2RHfvZxVYP1ZZV
 mwVWJPmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JuQAKCRB33NvayMhJ0dq1EA
 Cn2KcT1QQ1o1T7+RYh3kPUyZMDiiOc1DSphO3W/uzuy17B2do61hFjY0ldTR9LVnga9ZpODHRUkIR7
 XY925yWYXfnrJgPmf02FEU37ju1/RJ424oSZMlsZ99qOyF0Gd4/pCCGcSwDiVhFH6+gx4ASuiOTZc9
 UNHnfQjGBOcD/HnhgwB38S+QSpueoaTYDT6Mjc5cX0SBcGXjGp9Bx+Md99BODkp4Hd9Y5mJ+CY/+8/
 w1GO8w/7Dmb7m79QwPWi6c/G5/i5MHFpAl9kc2QU/6ynyI5xPJUoJiFFLZAlNngwtVPWJENg0Q1UBw
 YN7jBh7yKomkrlxp6NW4WKFYSEFaKt4ybYtjmo+3DmpbQO/yc6r1k1bl46qufJJWzK1fE7phMItHf/
 1EO6h4/9HG5YhAEmtw4VuXyotDSG7xHUX84iTUqisRFHtkh3aq+vcCh42Glx+/g9amw3FUDvIQw9lm
 B7w/d/CgDk94Qs0gp/nKv8v/o1/fZMhTgS2mZbSXar3CcvfJEaoG3oNjk0VIK8iHwEbgROuQgEGKbz
 evwteKmyZKDOO1c/lCrJmD/4h3CnxXB9HxUynW1SZXjBIpchVe5SetsPfmEo1WkJzkyQvNovTcLpaJ
 rjkszeLvxd0rHZrpvV22nNfMyHRdmt4uWeyFu7fIz0koHI40RGLbE+d44/5Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mtd@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>,
 linux-oxnas@groups.io, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 13/15] irqchip: irq-versatile-fpga: remove
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

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, remove support
for OX810 and OX820 IRQ controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
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
