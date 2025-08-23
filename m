Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68740B32B1C
	for <lists+linux-stm32@lfdr.de>; Sat, 23 Aug 2025 18:50:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFE65C3089D;
	Sat, 23 Aug 2025 16:50:47 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC357C36B0F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Aug 2025 16:50:46 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-afcb78d1695so39714566b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Aug 2025 09:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755967846; x=1756572646;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sNq2Nibqdx+evdv5zNaDNJtsHifnmrRlp9CMMl4pZuI=;
 b=AyIENCFu3Gw57KsRAMrVQ/GQSufKfpiaz4lor9RVbdHKgbhZ7/D/QjR8kJxdbBjMzY
 trtnxXfaDgnvucYD7j6PMDjeZpQnzyh5vul0/BLPDkN2AxXklcH2rcNOViEjuTdgdHyX
 TjFtGorSbGlKoXWQVIYTPDjFeP9AdbY9teuQGOrqKjF91lP9BMw+klDyU5Zku08DxzVv
 OfgxCGc9FmmbpUbyF2WWLSB0SL3DUJe49d6IkMJ3nItdKhTN+jfqQ/o3nIf/vgzpDEHe
 /A1dRLdesK3WYFPxO30efGQr+c3Aeh4CQcjWNCNRmF4AeBn6Xph1RteSyPVEovIvGN1S
 2bRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755967846; x=1756572646;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sNq2Nibqdx+evdv5zNaDNJtsHifnmrRlp9CMMl4pZuI=;
 b=c5ml+JLRPd72LbL902QgPR1tUptt/GrPPw2ThUqredYce5KelLrWuimtkarra6Zjl+
 eMKQLlNSdg9XGPuOjmbYQV9f1oMxjQ5gmGWtI1BUoS61G5FA47Ah5mzMRtlCQHrCBz2q
 eX4BcjboSfVfvuV9koynFsjZHY1mRR/Pz0+poBrRu1cMiy+Ksf/yrAwrWYvfAdh4f2Iu
 bBuU1MUJg3me4YHmatMEPAy1EQmxmQ8I23OyiIntFhSgSjy2KvDrLX5/GEl9mJtd1Lzs
 asji9G9GtlWeoLD4lE1MacAmmdSkLLHgzBgk/wIFffE7HCm0xaU7jtjNA3Ogobu6g3kR
 zWeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3yGMexVLL/vg13y2IEFqG/IoEl9DMLLz8WAz+l1VhStZMloQSNVliduFuCvVs0LA0UHVWhWmH1g6bUg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyI+XYC1L8WyhCYBVj+6uDRFe//Z8qjSErXXh9KTxBurZiUqu8o
 +lfY+3JzFf6LUfwoFYl1NYCXP3s39jT8nXPTl1Gm2BvEaoXq+IhPwPQDx2hlsjx9cxA=
X-Gm-Gg: ASbGnctkbzAwFL59oY0eJWkztWxlIENayK/SD0YUjaf4N1vP8QjX983TwgJn2z5rdvN
 pDMZ4odtK4D9s8Ij7Wz9YOA4CozLbapc+ivwMs18WMqGZ2ifqeKOUQOko7XHHPtZnOKB3OsdSVD
 Zon3eNOxSOu+CUSNMKxuFYAAb0DGTKdgQZWdNsc9agde8tvqleDyCMeiX+nDGQGlSdfXjyH5bGb
 qK+cdMqSCBec4mjITDTAJ2/++rdZji16d7VOHyhjqrNMwMwgWT3sOKBQ/HzxlJOxTfJFEmLF/eN
 q5yrkMoPeSiAhiPI7nFBUia8aZgVPnJRVSBWs1M1K5gMo6yPmUdbmxmOPWmSuyXCVf7URilYD36
 2W68Pcn8+rLIZyrOb+oITzLXF66W88706YldEffI=
X-Google-Smtp-Source: AGHT+IHHFRcZ2uWc450cm6YGSWLLm41zFn8yMlhrRzRS5mz16K/9Ne7EtPYoZsI+yYfZ3MDyCa6PPQ==
X-Received: by 2002:a05:6402:358d:b0:615:7ba6:4876 with SMTP id
 4fb4d7f45d1cf-61c1b91089cmr2916571a12.8.1755967845817; 
 Sat, 23 Aug 2025 09:50:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c312c4cdesm1797880a12.23.2025.08.23.09.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 09:50:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Alex Helms <alexander.helms.jy@renesas.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-98-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-98-b3bf97b038dc@redhat.com>
Message-Id: <175596784123.52468.6703738128182958997.b4-ty@linaro.org>
Date: Sat, 23 Aug 2025 18:50:41 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: imx@lists.linux.dev, soc@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 arm-scmi@vger.kernel.org, patches@opensource.cirrus.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-actions@lists.infradead.org,
 asahi@lists.linux.dev, sophgo@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH 098/114] clk: samsung: cpu:
 convert from round_rate() to determine_rate()
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


On Mon, 11 Aug 2025 11:19:30 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> 

Applied, thanks!

[098/114] clk: samsung: cpu: convert from round_rate() to determine_rate()
          https://git.kernel.org/krzk/linux/c/05c58c9415d1369387aedd28518fd0fdaeabd178

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
