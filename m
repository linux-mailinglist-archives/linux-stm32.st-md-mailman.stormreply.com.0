Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCE2889394
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Mar 2024 08:32:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5013C6B444;
	Mon, 25 Mar 2024 07:32:09 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94A6AC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Mar 2024 17:05:12 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-430d3fcc511so6931cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Mar 2024 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1711127111; x=1711731911;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v4N44CMN5oCIe/XAnwlaVauiT1tmi9O/mBbrMgK8XAg=;
 b=kiOp8lZK+oRUSAg7Dj9FuWn0nYDdq6c0NM9ihWUY9HrJhDeX3MO8wIKXSwn9MozlhT
 +W2CJqiZSEXYs30KLO9LYtaisK1ARHOpUAasn2Y024i+izhKOv/P0560Ielz+i3Cqid/
 9btzF4qvwHGHNvk2mw7klM+q0jW6WqLQhjc2JfIFxhR1HIgOkXpKTFfD/iVM9voLV2VO
 1fJ3QiYNcbr/XjaCm7QzsPxQCV6Gq0PCpIW7OhZKlswYso5/JbTYyDGjwrpci89iUlyV
 /OjhPyzoYfMxKAk3fzRYq7v3iugt0wNXBV6WoaiEo5aB6OMweJrlAAzAaGL2OYL1h3E+
 D5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711127111; x=1711731911;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v4N44CMN5oCIe/XAnwlaVauiT1tmi9O/mBbrMgK8XAg=;
 b=mh3x0u1/YqEyuz4oNI1cGGVRIPsY2M0sBoMnA0AgpPS8lCISY+fKKKAVFytdGWxo1h
 mAD5jsUH6mGOTF/FsYWDl1PIub2hJz4RrUkcPWc/Aikbm4hPoX6PYxdji7A5XMoCow/9
 lk6qVl+BmAZ1zuCnlaq9jKPMTF9BLAIkPue+fWbGWic5dPjmXNX00xLPkgSvuy+L1Hw1
 xZpdD67cnSvaAPqwO5nNO0mruFIfD6i1SDti8lsjBareP42+Q6Qgo7kKxA8fFTpEuSJr
 e6Ry3J3gRg4PDUKzpivtPvl1J6DEjK50+D5Vmu5zoRyW1BRjdEPdBllarADNM3srf1/A
 6c4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeiS8OVg0935FlaUtU6JfzvY64JjyHKe4Wis3uNeOxtjrsIZP467wAA2UfvsvKPDR/TZ9bcp8PW0ICc1r2Wrd+fOdNHHra5QgD+ExUbGSGdrJ06IhfBP+4
X-Gm-Message-State: AOJu0Yyakkx4yhu/o0mgdfaNfHYZr36J07Ae15YsjlYARtsS/3SKPSyd
 60rnJ2oYCARDrPdRPlfyF4QsqJc8421iMX5BNOr9l0MxeQdLXbsXu/h9OslYx6kwIStSbSoht3a
 oZwXYdRqEFfxx4hgUdAP1VKzY6EAU5c7h3VRJ
X-Google-Smtp-Source: AGHT+IEMXRAiaxzgPudCV28IsnfTo93KghidIO1NcmkDbiSOepYGnBba5CPcjtadamz0IWr8XSq/M+NvnzVf5opCbEA=
X-Received: by 2002:a05:622a:2486:b0:431:3c48:a65b with SMTP id
 cn6-20020a05622a248600b004313c48a65bmr12492qtb.11.1711127111085; Fri, 22 Mar
 2024 10:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
 <e8dff9d4-ed15-44e9-ae9a-2e77845ec40b@microchip.com>
 <Zf22G4jC2gIlzhi_@shikoro>
In-Reply-To: <Zf22G4jC2gIlzhi_@shikoro>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 22 Mar 2024 10:05:00 -0700
Message-ID: <CABXOdTc14kfPpkF96KG-oeLRTLvjxAD_gtOO2TQFLnHMLNoU_Q@mail.gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-i2c@vger.kernel.org, 
 Elie Morisse <syniurge@gmail.com>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Krzysztof Adamski <krzysztof.adamski@nokia.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, 
 Yicong Yang <yangyicong@hisilicon.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Paul Cercueil <paul@crapouillou.net>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Khalil Blaiech <kblaiech@nvidia.com>, 
 Asmaa Mnebhi <asmaa@nvidia.com>, Qii Wang <qii.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, Ajay Gupta <ajayg@nvidia.com>, 
 Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>,
 Robert Richter <rric@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Vladimir Zapolskiy <vz@mleia.com>, Loic Poulain <loic.poulain@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Conghui Chen <conghui.chen@intel.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 Ryan Wanner <Ryan.Wanner@microchip.com>
X-Mailman-Approved-At: Mon, 25 Mar 2024 07:32:08 +0000
Subject: Re: [Linux-stm32] [PATCH 64/64] i2c: reword i2c_algorithm in
 drivers according to newest specification
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gRnJpLCBNYXIgMjIsIDIwMjQgYXQgOTo0N+KAr0FNIFdvbGZyYW0gU2FuZwo8d3NhK3JlbmVz
YXNAc2FuZy1lbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Cj4KPiA+IEFja2VkLWJ5OiBOaWNvbGFz
IEZlcnJlIDxuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb20+ICMgZm9yIGF0OTEKPiA+IFByb2Jh
Ymx5IGZpbGUgbmFtZXMgdGhlbXNlbHZlcyB3aWxsIG5lZWQgc29tZSBjYXJlLCBpbiBhIHNlY29u
ZCB0aW1lLgo+Cj4gVG90YWxseSB0cnVlLiBJIGFtIGF3YXJlIG9mIHRoYXQuIEJ1dCBvbmUgc3Rl
cCBhZnRlciB0aGUgb3RoZXIuLi4KPgoKS2luZCBvZiBvZGQgdGhvdWdoIHRvIGNoYW5nZSBmdW5j
dGlvbiBuYW1lcyBidXQgbm90IHBhcmFtZXRlciBuYW1lcyBvZgp0aG9zZSB2ZXJ5IHNhbWUgZnVu
Y3Rpb25zLgoKR3VlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
