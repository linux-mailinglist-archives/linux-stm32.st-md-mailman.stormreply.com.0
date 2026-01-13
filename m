Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C72AD1CBA1
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 07:50:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0E28C8F271;
	Wed, 14 Jan 2026 06:50:48 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79C5FC0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 12:38:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 31DC844428
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 12:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B60C2BCB7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 12:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768307901;
 bh=qXScHYuCzd215t8hnmVMyfAJzYu9LaTDkfUenYtogos=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DMKO3wDOQyqAMkRsF3KjP1QgKWLmG/bIgkwkqikQWX7/JxeRnNe7RTYQnbhOkMfPE
 G+G+GVnK7BcA67OKp/w9uYGtoDKb6gYsPJFta0W9o3WbrjYSxf+gdK+PIoWXEDVRpB
 Q5EBZu76fgMusQwSmXX/liK7piEEVzbTmPGCiEh5Np1ueLICoCxv+JeymLWcnk+8zE
 HJZlIdI9MFRGAndmHTk7bTK8js1iFU5lIaAW8gyi5nhPAB7QNOe9kboOVP1zt4i3+k
 wUKGh42sKh+F35XHH38iMuMWdGE+RTZk9+LCDvYE3jVMx6N3ZypoG2kBxgAbxjzKHh
 WESRwPJzz6AdA==
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-382fceabddfso52610721fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 04:38:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVdVBjYYEvi/H8iMeHdhXpRjRCZuUdyu0CsIESZOmWs75VwCVnQypghxweXJTWh99B7G5Sfqu4p5ECVEQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxcTfLGKTwxkHOQn1JbUbTVllowbGdUBpn4oQVD/38f9E07Czqr
 NBNJpliS2Z8sF73ELqXwU/HyuHEknIDNCHN5huWVJPd8d7NUYZ7uGEapIqymC6CaS2GIg+C0pPg
 75Lf1j+Z7EKtnX6WGabmQh8O7BDMycbPUkgkeRfmSvA==
X-Google-Smtp-Source: AGHT+IHqazDCuLxwH7Iu/G2PkGJgVTJ7/k1UTcZwajhZd9YF9n/CenHYLasZcuGAB0SV4lL43Mgtox5RINYhxwkIRxc=
X-Received: by 2002:a05:651c:30c9:b0:37b:967e:d73 with SMTP id
 38308e7fff4ca-382ff8115efmr73607701fa.29.1768307899461; Tue, 13 Jan 2026
 04:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
 <20260112-qcom-sa8255p-emac-v6-7-86a3d4b2ad83@oss.qualcomm.com>
 <41b9a414-55a0-4602-9be5-54137a691d9f@lunn.ch>
In-Reply-To: <41b9a414-55a0-4602-9be5-54137a691d9f@lunn.ch>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 13 Jan 2026 13:38:07 +0100
X-Gmail-Original-Message-ID: <CAMRc=McP7vt2VS=2FpzYcXNG_+beb9O0AAvAJ9E2g8DT2WTfPA@mail.gmail.com>
X-Gm-Features: AZwV_QhJCTDCGsC5t4RHVGQlo_Vyd1Okk9vVsia2jA5DJVHGvVefyoWQdJ752O4
Message-ID: <CAMRc=McP7vt2VS=2FpzYcXNG_+beb9O0AAvAJ9E2g8DT2WTfPA@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
X-Mailman-Approved-At: Wed, 14 Jan 2026 06:50:46 +0000
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
 Rob Herring <robh@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>,
 Shuang Liang <liangshuang@eswincomputing.com>,
 Samuel Holland <samuel@sholland.org>, sophgo@lists.linux.dev,
 Kevin Hilman <khilman@baylibre.com>, Chen Wang <unicorn_wang@outlook.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
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
Subject: Re: [Linux-stm32] [PATCH RESEND net-next v6 7/7] net: stmmac:
 qcom-ethqos: add support for sa8255p
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

T24gTW9uLCBKYW4gMTIsIDIwMjYgYXQgMjo1NeKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiBPbiBNb24sIEphbiAxMiwgMjAyNiBhdCAxMToxNTo0NkFNICswMTAw
LCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3Nr
aSA8YnJnbEBrZXJuZWwub3JnPgo+ID4KPiA+IEV4dGVuZCB0aGUgZHJpdmVyIHRvIHN1cHBvcnQg
YSBuZXcgbW9kZWwgLSBzYTgyNTVwLiBVbmxpa2UgdGhlCj4gPiBwcmV2aW91c2x5IHN1cHBvcnRl
ZCB2YXJpYW50cywgdGhpcyBvbmUncyBwb3dlciBtYW5hZ2VtZW50IGlzIGRvbmUgaW4KPiA+IHRo
ZSBmaXJtd2FyZSB1c2luZyBTQ01JLiBUaGlzIGlzIG1vZGVsZWQgaW4gbGludXggdXNpbmcgcG93
ZXIgZG9tYWlucyBzbwo+ID4gYWRkIHN1cHBvcnQgZm9yIHRoZW0uCj4KPiA+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBxY29tX2V0aHFvc19tYXRjaFtdID0gewo+ID4gICAgICAg
eyAuY29tcGF0aWJsZSA9ICJxY29tLHFjczQwNC1ldGhxb3MiLCAuZGF0YSA9ICZlbWFjX3FjczQw
NF9kYXRhfSwKPiA+ICsgICAgIHsgLmNvbXBhdGlibGUgPSAicWNvbSxzYTgyNTVwLWV0aHFvcyIs
IC5kYXRhID0gJmVtYWNfc2E4MjU1cF9kYXRhfSwKPgo+IElzIHRoaXMgZGV2aWNlIGJlaW5nIHBy
b2JlZCB2aWEgRFQgb3IgQUNQST8KPgoKT24gdGhlIHNhODI1NXAgaXQncyBwcm9iZWQgdmlhIERU
IGJ1dCBhbGwgaXRzIHJlc291cmNlcyBhcmUgbWFuYWdlZCBpbgpmaXJtd2FyZSBvdmVyIFNDTUku
CgpCYXJ0b3N6Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
