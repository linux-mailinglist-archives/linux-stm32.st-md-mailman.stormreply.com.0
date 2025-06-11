Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4606AD4AFE
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jun 2025 08:15:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87FAEC30883;
	Wed, 11 Jun 2025 06:14:51 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 409AFC3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 06:14:50 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45306433f71so247655e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 23:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749622490; x=1750227290;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=;
 b=mjHOmnbjf2Aai6UthhfmGTI7RyzyIBeQyijKKCbhflfZDuaPTXW6ZU7RFDaQ5v+4EL
 tXhB9nmiM52U7Y9q0euad9t2PgvYkb69phEF8J0k45jxEu9b2vvGQ0TqTFlEy3kuvV25
 n+yYIUFhNnBWNnhba2uOi9r7zzSN5WCWG8KXHA/VWWq02NPh3EsQ1Vv+OSP/9WblsSFq
 Zo/ZtP6gb0I1d2P1rn6nIBJ95YD0hzwnIwrVTxs1bz9IKbUrgkf7hyF6Vqp6dWybBxzT
 0+Lihs+b0bicxD5zkQ677/1sp1y8yryHMJZnwmX+OcE/icxv0NF/6vlLlyxUQYEkqicB
 Hqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749622490; x=1750227290;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1HiVP0QLPKsIA8n0UdjT0lSqiGDAH6vDC2S5+J4fhwA=;
 b=tw2I8K1Xj4WTlgsbftc04qCSZf4es3LeAyFJot71hu9YEMKTfGqnGQxEl4t7jYPTDk
 Xk0oW5sVOZVrwyS3InSPMDFIxASFlhoiWuxklaFkj+PzIpFaQOFjDnnHqDuA6Kz5gTMo
 zjp21QNkZqByJMccgGVSv0bXoUCVVQAWRHxpUgF5U++lfX3g9MAI1sFJqo0d07+oHkXQ
 oaqjJQY/I7Y7CzmdUaPO0wVzCskAHdvTxV1SjJ0He2z7kwmaXegQ8bIXiVbYzw183FrL
 THE3smrDSf7lj5gs0jq28yXg/50r6SwQvEpt5S3JhfMdp6Dw6Ht8TYweUXr3J7UBUw2B
 Si/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV73FZ4Pp0zMkK/QeKEwN/54fgEXNGnNwip8HUtzpSNrM3WPL8d18BbQg0wTPFyAe4tI8//EDs/hQeHNg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxKQHp01dgF0DCcdlsYgjuyjtMZFWuNxj06ZbbUjofrZCX8cQOP
 8MBLksh25ED0gkF4jwVuqByShLr8wxfsKCCJA0w7EY5e62jAS9JuPYgPxrZwbvoIlW4=
X-Gm-Gg: ASbGnctX9PsBAZVOZLJBvYzuwCETnmp99OevBTIcPb9j0PU5cdX3MO58654JLI8dW4G
 Kg0vA0OyJzcrJ6Qnp2auzU+I2hZKYjOw6DXvJU4ljmgyARxUGrzksAhVIyk20m8aGHonM9EVnfD
 on8CAEslwVKdEyG8yz5kZj+0wxctaZQGhujufadBnacE2SFtKNTYAkxFlcu95GWFROp0/CyZLK3
 bhmVLyNPl3yytfq4qOqdyY35bqFpYxPUcSoLJZ9tzxFD6qvS9fO4E5jyn0K6voDDaQCf+aqUqjY
 rlBuJiam8K+He1BEOJB/BckbDfZtTYl826/KWakcpqQA55X4/U9tqnB5Ofqcj31MjftxWOLkH7+
 TnPwpw9U=
X-Google-Smtp-Source: AGHT+IGAMOnxxwJh6k3dhRiX61q7MpOsBjEBq59fXcuOB6WHX3+BJjfe7T2i67oqLzVzIqJNLPxm7Q==
X-Received: by 2002:a05:6000:1788:b0:3a3:5c97:70c with SMTP id
 ffacd0b85a97d-3a558822cffmr480215f8f.14.1749622489659; 
 Tue, 10 Jun 2025 23:14:49 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 23:14:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:43 +0200
MIME-Version: 1.0
Message-Id: <20250611-pinctrl-const-desc-v2-11-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qi1eWzTJCENFCt5JAU6Fe0rVNJeWQChdweXO2MJK0eI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6oRdItqT9sxon4qbZGkWGmSQh5LLhdyjslx
 Lrhu2XhwFqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeqAAKCRDBN2bmhouD
 1zqVD/9ltJexCdYC0zqX0/CADjrrprRtZoxnsBy1fZlMCSHM//l6RgsH+zTI3L4z8D6hoXjSN7+
 kCqzJiEtHxlNkIPRSofpxJdMN4X7bnalI2zDd6X/0XwoGaFls+DBLvGym8L/PCBsw2XF6cR3Y/r
 vpnXKGcuteokGneH3wAP8Wpef9N8QOEKtMiJgtAGa7mfmPf62QTORx1Zkeyh+u+BcEHykALKzL/
 Noyc7nXEB+ywMlt91FmmpwdT0bGGf9FjGJmjXa8Hri/2a11cypStJu8pW9p0HkP0MylQcHwxAGf
 jgwyFEj9f563zIfknjjRmB07L+vhdZjrMHYuRBDARPoDCUZ/wAtWSzS013IH8KTY605CHDkDDXg
 W7tSAeJ8dfweOfmy/LVBOJVtADslkpV4zDk6Ou7cBz3IT1L3JWzytd49gj2sQZFwH8ptj+6LG/f
 hsGg4yTdoyR4r/xZyN/skZHugzysRD1LuBvV/hx+QjJaSJHmmMw9cwX8jnWFkrFO+jtWYrWNehF
 DXTusW4HtBT4feez8bRSM2jUI5kSqnYHNa4Er2ZlPLiOyqdLWrMd0AQMTP4SRLBmhsJQCbfTvHt
 GEjwdyXAIiLXyaogHeIulwyIiEw52cJ/3DShLuesPqxk/vnnajXOS+ikRv6n+kyLnyNEybCOgxA
 x214zblWxgJp17A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-rtc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 patches@opensource.cirrus.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 11/17] pinctrl: as3722: Move fixed
 assignments to 'pinctrl_desc' definition
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

Assign 'struct pinctrl_desc' .pins and .npins members in definition to
make clear that number of pins is fixed and have less code in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-as3722.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 0d8c75ce20eda97627aef773342a0b63ff6114a1..ed7b2c482ff0bb6a546955c083ef7046701527b0 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -422,6 +422,8 @@ static struct pinctrl_desc as3722_pinctrl_desc = {
 	.pmxops = &as3722_pinmux_ops,
 	.confops = &as3722_pinconf_ops,
 	.owner = THIS_MODULE,
+	.pins = as3722_pins_desc,
+	.npins = ARRAY_SIZE(as3722_pins_desc),
 };
 
 static int as3722_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -550,8 +552,6 @@ static int as3722_pinctrl_probe(struct platform_device *pdev)
 	as_pci->pin_groups = as3722_pingroups;
 	as_pci->num_pin_groups = ARRAY_SIZE(as3722_pingroups);
 	as3722_pinctrl_desc.name = dev_name(&pdev->dev);
-	as3722_pinctrl_desc.pins = as3722_pins_desc;
-	as3722_pinctrl_desc.npins = ARRAY_SIZE(as3722_pins_desc);
 	as_pci->pctl = devm_pinctrl_register(&pdev->dev, &as3722_pinctrl_desc,
 					     as_pci);
 	if (IS_ERR(as_pci->pctl)) {

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
