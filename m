Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2282F917DB6
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 12:22:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7599C71287;
	Wed, 26 Jun 2024 10:22:28 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23C1DC71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 10:22:21 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ec595d0acbso44261991fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 03:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719397340; x=1720002140;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YQQUVeIK7k0d9MgtOJcxNr56RS5eoBT5sfu3gWH8b0g=;
 b=t9NBwYNXq6/7x5TtZaUzPLrsmutYv3p6rnzH+GPqvbekyQN4MpQ78+BB2FCvIRKJdO
 /49+tkXySpJuMCib0XdJjLQHxd7DQC3JoqdI6GK7P4RLcSU8wccua8sDaKnR15ML1gfd
 DdosuY8by6t3kvl4/i/Kjwifija7hjz9880DSMMsTk7LJvKn1PQkE8Dgj+iPhSe0xNX+
 61NmbGUg5CzdLhAKnG3gnXLvs6Mb6+6Dh1BRfB15s+sVSeCHAyj1X9BzamVfDKARyXZP
 2K6yZZKeExcPViYRB6xPVNlUa6sIBNyzV8JWSbCDX/AGoQgKDTuX4hlWL4VPUJ8TDrbS
 IUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719397340; x=1720002140;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YQQUVeIK7k0d9MgtOJcxNr56RS5eoBT5sfu3gWH8b0g=;
 b=DJ7Hlkgn68jw4FqMPNWNcMG2Mjrfj0meULIACQqQ7sE4SzoWWZQHJASJ1tCU75h+0B
 lI6Z6wOJvRY/f3KcmcTkIXyc/K+7EjNImFdZ8T+GJ80JKG57RIRrNWwP138RbAvxVXyC
 xeBSoUcri8ZpM8pA6KiGpuhyd/7Sl+zni40dMY23lfnJrC54Qsi+z1Rcu+cPA5++KUsy
 gedCrbAPAo+zwXoXadX21DK3S1HVwbnqcdY1GlsgHoeHr8IHgxmxEC2JlpdEx+jeB+yJ
 3G1GwULT93OaRac+21G+aAezd6u1JerGOtlf9SFBBR2EebFwM+8xqkujOMWPobE7Koe6
 yylg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNQVdlGFBe+OMQH/E/otynGuJCgV76jcr36sz/MA2XrVGMaJ7dCliKFa5YUthg2g6JVfyU9jhoVL5y2w9rpzJJnFuxli4PkVQg4pwUSW0AgrHNXq48Bx/r
X-Gm-Message-State: AOJu0Ywbm4IzIxVW9snuucK2mpPFrWHsnSkDRlVNl+psLsyZcOfRDg8S
 Ss6VdW6YJu+2USFt1BZ4T11/xqNnMTpy3pTKZfcVlZbXWnKdnGz3Lc2a5qnuJLA=
X-Google-Smtp-Source: AGHT+IF66geCJ+IDyk7DWlk8gVgabzMqbrOvnz5dxF4G+PQuP7P1Yu2mU/puCcrZCVWhA+b+phfFGg==
X-Received: by 2002:a19:6b03:0:b0:52c:dba6:b4c8 with SMTP id
 2adb3069b0e04-52ce183265emr8209671e87.13.1719397340267; 
 Wed, 26 Jun 2024 03:22:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c8245e87sm20498075e9.9.2024.06.26.03.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 03:22:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, 
 Wells Lu <wellslutw@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Heiko Stuebner <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Tony Lindgren <tony@atomide.com>, 
 Stephen Warren <swarren@wwwdotorg.org>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-20-26c5f2dc1181@nxp.com>
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-20-26c5f2dc1181@nxp.com>
Message-Id: <171939733731.25849.13373950874840419376.b4-ty@linaro.org>
Date: Wed, 26 Jun 2024 12:22:17 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.0
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH v2 20/20] pinctrl: samsung: Use
 scope based of_node_put() cleanups
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


On Sat, 04 May 2024 21:20:18 +0800, Peng Fan (OSS) wrote:
> Use scope based of_node_put() cleanup to simplify code.
> 
> 

Applied, thanks!

[20/20] pinctrl: samsung: Use scope based of_node_put() cleanups
        https://git.kernel.org/pinctrl/samsung/c/707807f4c1128e39442519e849e4ce0b7c29b110

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
