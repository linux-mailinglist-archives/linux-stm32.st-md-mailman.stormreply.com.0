Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 005AECD2EC4
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Dec 2025 13:46:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2A23C8F269;
	Sat, 20 Dec 2025 12:46:57 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9196C1A97C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Dec 2025 12:46:55 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2a0c09bb78cso18163845ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Dec 2025 04:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1766234814; x=1766839614;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PnLeQHT6gKO5LrS+1ND5Ys5FEsU3x/z5LzPcGERhZEM=;
 b=TDMxmDr7wRiWq/nby2gZjE4h6n+d3McOuMCBjQfen5yY2jaSPyMF7RHl/hHjkYC2mY
 IZ7YQOGmcLpFwByiHZEcWFR3JdytJiHR7p6eT4ejhoRlLQOOSoDeOG7Dmtin2kMptCba
 H2he8idgBZoCrfgTLIZET+WJlGSuwKMU5g2tSq4kmm6yWJXWp891Hc14YQ5T/gapOkA+
 lG9KkZqSR44XC434n5hjTjpcFT3orrnc3C5Gn7xh0HOObGgTfkgDAKb9ZZLUAhzNbQ+/
 lAdkjStxUnusMXLBpJPZDlCaCF1emmA98wdKcYumDdzF2Dz8L2OKgdFaMsNIAaZRMqzH
 cOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766234814; x=1766839614;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PnLeQHT6gKO5LrS+1ND5Ys5FEsU3x/z5LzPcGERhZEM=;
 b=by+pPbGOPuf00n9jA4vXwO3FBI1nUXnCiWReYdo5LDRhzbSzv9lVhmkMYxdkVXZSVb
 Ov6vlswUHrX59EYYKQTxV8ydYPRwPBTQgJd5Yj5N3rxw41YvqFKTMG9nwDCQbpQJcZ3t
 yYqBHus83sumATRChB4ZIpb5cSutTklTmeyWBBku417Q5VjP6xVsu8VioZG0L0hxhkYz
 nlCxDdXpWqzElM94chEJYQ+rdnbXc7FG6zlr3qhFdnsHh6Kir8PsYaOaVNmoGd5weBBZ
 jpY9k54QDr8ASA6fcbatbLwCTl7Se3d6FlZDraUVUVtu/pr8BFdpICXGNLZfBG6pGe5k
 FX2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYoE8ljr9G2wGkR+bjXMWBbHQjAF3Kz8Cop7J1VYxZOQ/BCm5Uri7Q+hqsRWkeaR/5Vytcv9WeV71ppw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy7NwZjkU5iRcvNlTHtsk9kpFbMtWvnbFPnyM1JXPd73XvEBktc
 hRJowKOC3mi7HEuetrbf3dYmDWh9FQud7HsszjSizVcBRhKYFGhtyGPZAg0q7S3aypIjWVEjHmn
 Q2l+4holIlB0s7zqd0wiFMCSNIWVZAIs=
X-Gm-Gg: AY/fxX6qb5gtkqf5ryK2ku7ZXVtLQ0vHn8cfqAkJfcjSKPZ+2EtZ2RlfVQi9alX5aWv
 5G5LyNGnRJr3bXQPQTuPVv8xvef+6olErGFYW4d51iqaC86OvLmnIgW4cLiIHC+p8MQ9JqnQPOV
 zG8HaDPipb2Th4nL7F86QfNivp8Slvq/S5OghvNZ4dqNNzAt/jkalIzLRbbVT8N1QuLo8UURRCP
 IfvedjeLYnT1ZkW7KB0kPPExSC8B1sQRHWSZ4pyb1lnroBwkeNXWRmLdFIGdse2IgzmYvHGZ8h7
 hmeoj+SZj5MjXj3YXBEEauiXN2qZAs3A06QrhSg=
X-Google-Smtp-Source: AGHT+IGTZVFXf6rAC1bEGZmO7YaQs0mj72/Bxua6dbMs1yZR8CidcfGRl/4LVrNe9mb+pBaCXI6UiiHmEjBYB9UahrA=
X-Received: by 2002:a17:903:198e:b0:2a0:99f7:67b4 with SMTP id
 d9443c01a7336-2a2f0cbc904mr55199135ad.8.1766234813931; Sat, 20 Dec 2025
 04:46:53 -0800 (PST)
MIME-Version: 1.0
References: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
 <20251219-qcom-sa8255p-emac-v6-1-487f1082461e@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-sa8255p-emac-v6-1-487f1082461e@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 20 Dec 2025 13:46:43 +0100
X-Gm-Features: AQt7F2qpxOToWQKPYlABMJwLqho0Xychdf9rQln23uKf9MMkpqj4U-v6YeXkrYo
Message-ID: <CAFBinCAXb87FKwA_=UEx5YTekevVUun1gieUfMux=oQAgjZS7w@mail.gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Drew Fustini <fustini@kernel.org>, s32@nxp.com,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-amlogic@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Rob Herring <robh@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>,
 Shuang Liang <liangshuang@eswincomputing.com>,
 Samuel Holland <samuel@sholland.org>, sophgo@lists.linux.dev,
 Kevin Hilman <khilman@baylibre.com>, Chen Wang <unicorn_wang@outlook.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-rockchip@lists.infradead.org, Jose Abreu <joabreu@synopsys.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-arm-msm@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, David Wu <david.wu@rock-chips.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, Minda Chen <minda.chen@starfivetech.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-sunxi@lists.linux.dev,
 linux-mips@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Zhi Li <lizhi2@eswincomputing.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Inochi Amaoto <inochiama@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v6 1/7] dt-bindings: net: qcom: document
 the ethqos device for SCMI-based systems
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

T24gRnJpLCBEZWMgMTksIDIwMjUgYXQgMTI6NDLigK9QTSBCYXJ0b3N6IEdvbGFzemV3c2tpCjxi
YXJ0b3N6LmdvbGFzemV3c2tpQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQmFy
dG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+Cj4gRGVz
Y3JpYmUgdGhlIGZpcm13YXJlLW1hbmFnZWQgdmFyaWFudCBvZiB0aGUgUUNvbSBEZXNpZ25XYXJl
IE1BQy4gQXMgdGhlCj4gcHJvcGVydGllcyBoZXJlIGRpZmZlciBhIGxvdCBmcm9tIHRoZSBITE9T
LW1hbmFnZWQgdmFyaWFudCwgbGV0cyBwdXQgaXQKPiBpbiBhIHNlcGFyYXRlIGZpbGUuIFNpbmNl
IHdlIG5lZWQgdG8gdXBkYXRlIHRoZSBtYXhpbXVtIG51bWJlciBvZiBwb3dlcgo+IGRvbWFpbnMs
IGxldCdzIHVwZGF0ZSBleGlzdGluZyBiaW5kaW5ncyByZWZlcmVuY2luZyB0aGUgdG9wLWxldmVs
Cj4gc25wcyxkd21hYy55YW1sIGFuZCBsaW1pdCB0aGVpciBtYXhJdGVtcyBmb3IgcG93ZXItZG9t
YWlucyB0byAxLgo+Cj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9z
ei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6
ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4KPiAtLS0KPiAgLi4u
L2JpbmRpbmdzL25ldC9hbGx3aW5uZXIsc3VuN2ktYTIwLWdtYWMueWFtbCAgICAgfCAgMyArCj4g
IC4uLi9iaW5kaW5ncy9uZXQvYWx0cixzb2NmcGdhLXN0bW1hYy55YW1sICAgICAgICAgIHwgIDMg
Kwo+ICAuLi4vYmluZGluZ3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFtbCAgICAgICAgICB8
ICAzICsKQW1sb2dpYyBTb0NzIGhhdmUgdXAgdG8gb25lIHBvd2VyIGRvbWFpbiwgc28gZm9yIHRo
ZSBBbWxvZ2ljIHBhcnQ6ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
