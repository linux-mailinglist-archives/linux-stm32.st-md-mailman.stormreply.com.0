Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 247C1D1CBA0
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 07:50:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE71FC8F26F;
	Wed, 14 Jan 2026 06:50:48 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78003C0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 12:37:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 14FD1442D5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 12:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF01CC2BC87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 12:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768307828;
 bh=/jEbcQNNf+2y5DghSoCRU+Htja2/wQhqeKPPtGlgrS8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ComgjcI5VNR9q3dPbYO78SELFnXvnbFO3a2D+MW7vnjF21y21j+R6bjEBdIqVKVyI
 rBaal5wvdHui7U8Vn1fb6UXphD7tmYI7EbURPOenXwtO/8BFJOXF4fYhwMIid5IDPQ
 n4Yv61wK0o8M4u6SAR0BNoMHD6N03YK94He8dfhIOxwaNymlEtAjpOfVcMe+61HySM
 dx/kdO75/NGB5MC8dfbtjbSLuJZUVYIwS474XlBn/9h4vbDBOoraoVTtiEwsoBzBrz
 Qgte2rouu6eR1GVZeWVhX7P5t8Svn2VeDz2MRnzSYh2JwcXq9n4q8ACQ8N5eM139iR
 s+7GlbXdpnT1A==
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-383010b77b8so50189811fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 04:37:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXpknnMVAWJL+JaD/SSCLXMS0MQSWrAB0N9eaV+eXuPqg6pIwKsLLNnBZodbLl4homhUu96OojmLb4N3A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyWNY4hIWcVFh0LafbpLffXXhuHYvBhNZzB/0uXw7XZ1bytVh3T
 JaD/1Lh8vr7dEuu304sYAWFKqGGiinL6XNuASr88M0TxeZbfxj0aIcijz0fITI+F/HDuPSq2ahP
 KBsasCU3AkzfzPGBz4cb4Pj3lR9dM4MGNkKGJHP15nw==
X-Received: by 2002:a2e:ab19:0:b0:37b:9361:711d with SMTP id
 38308e7fff4ca-38350a55384mr8601501fa.8.1768307826023; Tue, 13 Jan 2026
 04:37:06 -0800 (PST)
MIME-Version: 1.0
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
 <20260112-qcom-sa8255p-emac-v6-2-86a3d4b2ad83@oss.qualcomm.com>
 <a2a610a3-aead-4e85-8a4c-7b83ccf276dc@lunn.ch>
In-Reply-To: <a2a610a3-aead-4e85-8a4c-7b83ccf276dc@lunn.ch>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 13 Jan 2026 13:36:53 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf8TTTcU9A3gc_LQF3Ow6Ww0omVJH6x-DQEnOSPXfaUQw@mail.gmail.com>
X-Gm-Features: AZwV_QhI9rebW3ffX0n9A2EUYniK94gLsNSjXRbzl9peLeeXv9eI-nHhZ9l6ybY
Message-ID: <CAMRc=Mf8TTTcU9A3gc_LQF3Ow6Ww0omVJH6x-DQEnOSPXfaUQw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH RESEND net-next v6 2/7] net: stmmac:
 qcom-ethqos: use generic device properties
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

T24gTW9uLCBKYW4gMTIsIDIwMjYgYXQgMjo0NeKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiBPbiBNb24sIEphbiAxMiwgMjAyNiBhdCAxMToxNTo0MUFNICswMTAw
LCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3Nr
aSA8YnJnbEBrZXJuZWwub3JnPgo+ID4KPiA+IEluIG9yZGVyIHRvIGRyb3AgdGhlIGRlcGVuZGVu
Y3kgb24gQ09ORklHX09GLCBjb252ZXJ0IGFsbCBkZXZpY2UgcHJvcGVydHkKPiA+IGdldHRlcnMg
ZnJvbSBPRi1zcGVjaWZpYyB0byBnZW5lcmljIGRldmljZSBwcm9wZXJ0aWVzIGFuZCBzdG9wIHB1
bGxpbmcKPiA+IGluIGFueSBsaW51eC9vZi5oIHN5bWJvbHMuCj4KPiBJcyB0aGUgaW50ZW50aW9u
IHRvIHJlYWQgdGhlc2UgcHJvcGVydGllcyBmcm9tIEFDUEkgdGFibGVzPwo+CgpOby4gT3RoZXIg
dGhhbiBhIGNvdXBsZSBwcm9wZXJ0eSBnZXR0ZXJzIHdoaWNoIGNhbiB1c2UgdGhlIGZ3bm9kZQph
YnN0cmFjdGlvbiwgdGhlcmUncyBub3RoaW5nIGhlcmUgdGhhdCByZXF1aXJlcyB0aGUgT0YgZGVw
ZW5kZW5jZS4KCkJhcnRvc3oKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
