Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF51DAAC162
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 12:32:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73C78C78F7B;
	Tue,  6 May 2025 10:32:03 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FBB5C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 10:32:01 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a07a7b4ac7so2419110f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 May 2025 03:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746527521; x=1747132321;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OerV0UxutKOzCYvF95TGs6Kvaz5IA/e67MGn1c0G1iQ=;
 b=krznEO2cK2QEQ70NVEtYov5Snj3nmz0lcu80JEMSlUpF82hL3VLHfLYSxnkniPhITA
 b8DZQ2c4BRyJ4GJGjokC2CDFYgSgAKmVa1h4Vn+3hvOG1cnqamKz+hmNktX8P7Tju2PW
 h61jtkJPoGi14p327nGAevDR7YZeHjfipNbbhL012cdBDcYRC0TVlTc0/KV3kBQC2P5M
 dF+bSoQj6Uw+RXCWW717s00g+4SGR49eJf4gyKzhnrydnKxhUtuYmIbi7rGEPadCAsmQ
 VraNDgAKAAFX/8sTIP2ktro2tr2gitxZRjhyo/gyPvK6+a3A6gjdCzBzeivEESxibFxi
 H5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746527521; x=1747132321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OerV0UxutKOzCYvF95TGs6Kvaz5IA/e67MGn1c0G1iQ=;
 b=le0HzB7//cr+KBbqS3TC0ByqwAYPQ5xy6VGUQSy93AdcgD9B6zDgjJp4UjzneBeIYc
 fw7acYANvMQ7dX0wQIYJ091+ho/wECZCyNmJA0111t4DDHnP7Zh3r5Nb2yfbqW0Tzyef
 vzsdasCba5rhr88PSjmPoJXiCX5YrnzEX0YcSxSYKPLSyec5gRe89X2Ql+br56KsMN/F
 5upS6TBqHhrhrizI9GIFNt8MDc2gAuSjLpgb2kdopk42WHlEXX4ozZ5g1ep8Xy6nqkQf
 CrhMKyjpnXNc9jrDS13o2D2S9p11BRFJ2nUig6H0+IfBFRY1pqnfe22tG1NVfTolSJ3m
 bcOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiw/JR1PciI63BQB01yAnwpRl3aCOveJPl7lhiQjKJ1INk42auqjgrAiOZLUKvxXuRWOilC14Fz5sb6A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxQKJ1eqjJcVUeIwL1Z/FLFNORj97cVTE56kXb+voPHLim5KUxU
 6lYYAfJK+axw9AefuK1f4hD7ZRgYkzzgxr1fbBJJkxzhXIGt/q+V
X-Gm-Gg: ASbGncshvjF7evFT7FKbaAb9fkN74FyjHmF4RT8wCM/zPsh3O/nx02f8stK1TThRIHa
 R7fo71NNGtS3zJ2K7BrjlXcmt5MCcw54vn97/g7TE+yt+m21WUTJ0ZB25dTX71oB9IlUYyYRk8r
 iANPqjUQS1tUeA90t4ByImJxg+gP13qzlkb3cmUzM+T3DFKwOLqIXWZORZsWXDro7sCY5TKXSBV
 ugesTRR1DCKC1wLTb9s9rMqTTWKhmcWtmDS/IzrqEraGiXpKOziGY6xGiOHtrQqLc/+/lgMSadF
 TTxa0HboE9mZ/SHl6L4/TAGFEbMpSn18ykFL/OAW5RX41R0Jbq9B0Y51rxOLges/zQ==
X-Google-Smtp-Source: AGHT+IErh7yQXsQGDQe0taMpsU2js1b5QKttN2MDxoVzQ3fdYdk82BR9U6VsLRzI3uXhnHgTjePkyw==
X-Received: by 2002:a5d:5f41:0:b0:3a0:85b5:463b with SMTP id
 ffacd0b85a97d-3a09fdd83bamr7522458f8f.48.1746527520309; 
 Tue, 06 May 2025 03:32:00 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:26ec:c7bf:3d4f:d8ea])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89cc469sm166148695e9.6.2025.05.06.03.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 03:31:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Chris Brandt <chris.brandt@renesas.com>
Date: Tue,  6 May 2025 11:31:52 +0100
Message-ID: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506103152.109525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250506103152.109525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/2] clocksource/drivers/renesas-ostm:
	Unconditionally enable reprobe support
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Previously, the OSTM driver's platform probe path was only enabled for
selected SoCs (e.g., RZ/G2L and RZ/V2H) due to issues on RZ/Ax (ARM32)
SoCs, which encountered IRQ conflicts like:

    /soc/timer@e803b000: used for clock events
    genirq: Flags mismatch irq 16. 00215201 (timer@e803c000) vs. 00215201 (timer@e803c000)
    Failed to request irq 16 for /soc/timer@e803c000
    renesas_ostm e803c000.timer: probe with driver renesas_ostm failed with error -16

These issues have since been resolved by commit 37385c0772a4
("clocksource/drivers/renesas-ostm: Avoid reprobe after successful early
probe"), which prevents reprobe on successfully initialized early timers.

With this fix in place, there is no longer a need to restrict platform
probing based on SoC-specific configs. This change unconditionally enables
reprobe support for all SoCs, simplifying the logic and avoiding the need
to update the configuration for every new Renesas SoC with OSTM.

RZ/A1 and RZ/A2 remain unaffected with this change.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Dropped config check and unconditionally enabled reprobe support for all
  SoCs.
- Dropped Reviewed-by tag from Geert

v1->v2:
- Instead of adding config for new SoC, changed the probe condition to
  `CONFIG_ARM64`.
- Updated commit message
- Added a Reviewed-by tag from Geert.
---
 drivers/clocksource/renesas-ostm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 3fcbd02b2483..fcf7ac35a9f1 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -225,7 +225,6 @@ static int __init ostm_init(struct device_node *np)
 
 TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
 
-#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
 static int __init ostm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -246,4 +245,3 @@ static struct platform_driver ostm_device_driver = {
 	},
 };
 builtin_platform_driver_probe(ostm_device_driver, ostm_probe);
-#endif
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
