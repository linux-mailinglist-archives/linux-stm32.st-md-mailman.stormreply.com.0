Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7B1B32B1D
	for <lists+linux-stm32@lfdr.de>; Sat, 23 Aug 2025 18:50:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7348C3089D;
	Sat, 23 Aug 2025 16:50:52 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3239BC36B0F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Aug 2025 16:50:51 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-6188b668b52so413670a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Aug 2025 09:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755967850; x=1756572650;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rswAVyuJvRa6TX9BXHZuTzZwEBPSMziKik/9EoWIi4w=;
 b=N7BGpRyfvoj9qnOZCe/OjLeucYX9XZXy0G3YtHdjpQhAM3d3wL+stFUS8/d8sOiC+I
 +jGfRs5lhryA7Kneh1G8Op02UG392i2/rj9IwECySojf7QJfwxAuesyWIvkRvUjZV4R6
 gQgAO8SJc5jcdo5DkdQxKceakCY7oAfbrLy7Wj40QuIkstsOPf2U6+S2L/CZ6i294e8r
 xQd4JVMUq9CkBDlU2y83U/Vx4ifRg6eHwCR6s8bYRBFdxwKaajaSfVYE1QRTBjq+zIqq
 EztU7RLhLpauzgQTQBusWg3gKTwp9Th4wLAWENhKdHFYHhGTkVeqBMStAi42Msev5uSy
 NlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755967850; x=1756572650;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rswAVyuJvRa6TX9BXHZuTzZwEBPSMziKik/9EoWIi4w=;
 b=UtSlVFg3SLL1PnuaTlJEgptq2Bb3H3Ww2RGu3Iq3LH1AnR7Bvg3X63bew70Od3cvmA
 tqid3R54juBU55yzulIEUMFJ49s0yp7ko+QPTquJff50Ogz/JkNQS6A6dy9M8GnarIbq
 Jz9VomFwFleDzPITkIlesgtXgxSdWtCTcQY/ZGcPbAv2RSr292fvbsMuMuSVdYgjzwJk
 yfJctN639DMaCBq3OJsHMFzFtrjvUTFkDsKuNWuj5JFcYtzwtU+p2t0IlpvSjYRRkHG7
 beSfyAcZHX43J8zFtmBp6wIluZ3XH59X7LcsgbqcZG/6lfdQWLVDCEDV2aRUK1YApDLs
 YMAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzeco9nUC1ceahxbqarVM1iGfZLICGWkbMEsIV3jdCBvn+ERF0PCcsOpE3uL62jtFJhUM/x3SSt4Gtog==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwqEn4A8L2bxs841ZVfvrH/T759Cud8CZQl+m5saW8kuTIxbxRz
 rfcEJGS039SwelhRiFLpAjXXavLXturJCFBVIg2lmiCFFhwI1nA9tfZbQo+XaLocAf8=
X-Gm-Gg: ASbGncs8JrIrHjbqAucSOdb1Dfhaie/VaWGgx4S+9SrtAlkJ0fWKma5WYpgx1apKzal
 u2puzLjBL708LhGSeJzy5dUTztTbg/2biME/sA/CMV6qoay0L1RuxTITfT9zNqkE1rQmIF+TIT9
 4qQ1uIOGvMX2CatJqKNucEzyRExtqVjZXbrKpm+H2urtmwS7Ogu8xVzwI1PV0sBoH2i9rgi2Bx2
 Ss10ZGECQ5v3QHp0Z6AnZ5sqV3XXJ4sCBXBU33CxItvJLjPss7gH40JGH5mZ7QcfZrHgfVAS37S
 dZ0mKWoG8uZXVVCBmImVNtEhz36rf5/WqC67TLtsvO9MENyKg3RefPFs6GWfJJb9eOZO7KxZncH
 jUGI/K+EarZyocAupXYa8N4ZH7mjoMDwYjQabaE0=
X-Google-Smtp-Source: AGHT+IHjBstjuzxQsJVLkeGYHgOE3wWdKaHmumAPQvcdN50PYZzwBsMeGzXzhJUjnQCkGBQZZA30xg==
X-Received: by 2002:a05:6402:274e:b0:61a:927b:a79c with SMTP id
 4fb4d7f45d1cf-61c1b703ddfmr2766014a12.8.1755967850448; 
 Sat, 23 Aug 2025 09:50:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c312c4cdesm1797880a12.23.2025.08.23.09.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 09:50:49 -0700 (PDT)
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
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-99-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-99-b3bf97b038dc@redhat.com>
Message-Id: <175596784601.52468.3851559862193091574.b4-ty@linaro.org>
Date: Sat, 23 Aug 2025 18:50:46 +0200
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
Subject: Re: [Linux-stm32] (subset) [PATCH 099/114] clk: samsung: pll:
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


On Mon, 11 Aug 2025 11:19:31 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> 

Applied, thanks!

[099/114] clk: samsung: pll: convert from round_rate() to determine_rate()
          https://git.kernel.org/krzk/linux/c/e278e39b014d789fb670695d422ff33c3ef56040

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
