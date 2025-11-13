Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C28C579CC
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Nov 2025 14:19:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6665AC628B7;
	Thu, 13 Nov 2025 13:19:02 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6A72C1A977
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 13:19:00 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-594516d941cso888012e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 05:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763039940; x=1763644740;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VZfCaucUzkZTNK+50YPVLfmUuvxNRaVom6NqjpdOeAc=;
 b=O4dFjPJ69/mokHk/KtDtjToip/XgpnT17+CieaIIo4trBbHdqMoQRt1AOVpm34b9R7
 8wS+cAlvL66dAv0Lcn0FWFjzkrN3LoS69r3MRDy1kFOQVDD70blqCevs67O0tA9l+OoH
 INDON4wvPlEoYO5aL2kdHMWLZ9PEbH/WB6lhRqG9w32oVxuxZYF/Xrw1Zl4uu6HfzxsU
 L/S9/S5NCN1YEqtSlTvVjR51TgNhbXlpCl/wZixXA9MTz9HZlWdUdCfBq4rpuEcMk5b4
 iB+ul2FknSGFVkKYnpnylmZc5XPTrAZJjPeWpjx5bp/JcwsLefR0Z3yVc2IIQ7UO4UA/
 hqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763039940; x=1763644740;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VZfCaucUzkZTNK+50YPVLfmUuvxNRaVom6NqjpdOeAc=;
 b=fKwaORY4A3bhLPWP7Zy8D20YuLoIh5sJyS5QBIs+8Ld0EAPmYVyQfFWNLOtQ7Wczay
 V5i7iyQvQ45xs3SjHDgNNtxvH5rmTzj6LHMorZTz6o60nQXZGMr9LE220FaoDiHkHQxc
 hS/GzeOOsA7k/97bcooVDH5fD65kkIX2kk+mOgWW45PonP1GJbmhdDUeskbA1x2UqF+Z
 Q1aMm19fiy/BZhafBsFb230gs09fZDNumrSHyzOvZj6R9QwjgNZiVxcKDAnxdcVdLJDS
 +I3UCk+/HBHWMmMEiyUy7UE7A6FDF2qA7YQ/LyGcPCHoSBb5knzxjugV23pyxvUSqUez
 9Zhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVnwWJ2uCAJhsa8OBthaOvXgpGcDEpuzZ5BquW2CKuo1WL48FGipkdxrpFiq7XU/nZIwM1/YkXi0dQbg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw0Ai0udjAgwNf4/R2Rn5QMQ6nf9Rki1LF7O44Dat3hLmmkZ/OV
 1PprARnnSs726/18gqyEA12Fw6G9ZIx8WYWKkgEUQLCUYisI01D3MzBTQLB6EGJ+ryRCFxLgAQX
 B5pdKQrTwYDKCmdKwDscM9byr33Bd4+9GnVstDEGlaw==
X-Gm-Gg: ASbGnctnBH65Tv1C2QCiD3AzSTbPCI2K6P2OVul1+zlo2qcUc7PtevZjUuiZRAiOi5e
 w6SeJ81PWrFZbvvLB3Bnv/LYOfMrryacAvpjSwNXlJMFjeIhWjk55Rlzvjrr+WucFA+gME94jXM
 irC8E2b0L32OfoDJ7dtHqfWJZeKkpFKvt1AwP7vFRPDpyP0gm3Rkfv5bRyBT26l4np/YdRyd5i+
 qZ1JH5O9nZ+oVVgc3jrli34LRqWkXOclAe/oaDOC1bxKo5nk53K2rP0RWIHuIROZhXolqB9L7xK
 iWJUE/CEMl8buLhB
X-Google-Smtp-Source: AGHT+IHeVzTuj43c2XKQpZBw2ErEf3YOWTRFAtQ1vaZEEtKBTkEs3tR1Hd50SIgH+QjYllZZcXodcrSS9KZ8vRhrh3k=
X-Received: by 2002:a05:6512:3152:b0:595:7b24:d36e with SMTP id
 2adb3069b0e04-5957b24d58cmr1396653e87.7.1763039939830; Thu, 13 Nov 2025
 05:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
 <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
In-Reply-To: <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:18:48 +0100
X-Gm-Features: AWmQ_bkdL6yYgjauNyydNchJ2jLFj9s46UQ7WB4-Hc5rFElcxZ0Jmq78mNjUwDc
Message-ID: <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
 Samin Guo <samin.guo@starfivetech.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
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
Subject: Re: [Linux-stm32] [PATCH v5 2/8] net: stmmac: qcom-ethqos: use
	generic device properties
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCAxMTo0OeKAr0FNIEtvbnJhZCBEeWJjaW8KPGtvbnJhZC5k
eWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMS83LzI1IDExOjI5IEFNLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8
YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IEluIG9yZGVyIHRvIGRyb3Ag
dGhlIGRlcGVuZGVuY3kgb24gQ09ORklHX09GLCBjb252ZXJ0IGFsbCBkZXZpY2UgcHJvcGVydHkK
PiA+IGdldHRlcnMgZnJvbSBPRi1zcGVjaWZpYyB0byBnZW5lcmljIGRldmljZSBwcm9wZXJ0aWVz
IGFuZCBzdG9wIHB1bGxpbmcKPiA+IGluIGFueSBsaW51eC9vZi5oIHN5bWJvbHMuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBs
aW5hcm8ub3JnPgo+ID4gLS0tCj4KPiBbLi4uXQo+Cj4gPiAtICAgICBpZiAob2ZfcHJvcGVydHlf
cmVhZF9ib29sKG5wLCAic25wcyx0c28iKSkKPiA+ICsgICAgIGlmIChkZXZpY2VfcHJvcGVydHlf
cHJlc2VudChkZXYsICJzbnBzLHRzbyIpKQo+Cj4gVGhpcyBpcyBhIGNoYW5nZSBpbiBiZWhhdmlv
ciAtICJzbnBzLHRzbyA9IDwwPiIgd291bGQgaGF2ZSBwcmV2aW91c2x5Cj4gcmV0dXJuZWQgZmFs
c2UsIGl0IG5vdyByZXR1cm5zIHRydWUKPgoKVGhpcyBwcm9wZXJ0eSBpcyBhIGJvb2xlYW4gZmxh
ZywgaXQgY2Fubm90IGhhdmUgYSB2YWx1ZS4KCkJhcnRvc3oKCj4gYWx0aG91Z2ggaXQgc2VlbXMg
bGlrZSBpdCdzIHRoZSBwbGF0IGRyaXZlciBjbHVua2lseSB3b3JraW5nIGFyb3VuZAo+IG5vdCBp
bmNsdWRpbmcgdGhlIGNvbW1vbiBjb21wYXRpYmxlIGFuZCBpbmxpbmluZyBwYXJ0cyBvZiB0aGUg
Y29tbW9uCj4gcHJvYmUgZnVuY3Rpb25zLi4KPgo+IEtvbnJhZAo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
