Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4825AD1FF1F
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 16:51:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 138EDC8F270;
	Wed, 14 Jan 2026 15:51:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EC49C8F261
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 15:51:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1E5D34442B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 15:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BFAC2BCB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 15:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768405885;
 bh=o+OEjagxl3Dsp9tfzVfdkpH30i7BI82gz0LPNnSdpig=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FY1rCh7BTXtSgy430K1ImGXJbRWQzGMOIBH1z9f+jJLEcsC6lEv7EHrApo9FSgliZ
 y0vYkLCGAkjw4diqSoI/z84wIWno1qymsG+z8s8CZ6aSqUZ0RnZelrZf1g+YX7mLLh
 qSWBQht+cKzp68EJB5t86KporBJBJ9GcgcbofoXC29jfh+aE38gIMQRAmoTLZ8csqL
 8CiGMfRZ1AThkmhU05KnfGCf7/WLdpvIhIRUDlq1p2+Vt99cFPyGWWI0cRZ5k49u3b
 5UN6n7pRVDOGM0VuPvT8IyO5aPhYhSk4RCI6Pkkop+R+uEJMM/8YQut2l3/OrjM2ix
 G2m18gRBN2lZw==
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-59b7b27ebf2so5696315e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 07:51:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWOqJV+JpEe1TB87SUD2r3kQGspZjURaPtt8mpssP8a1MCH94AvOpREuPcgR5aCzFSRALZVBH/PuywK2w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwIfe0ohV0wn3xE7CvHYcfR7IzNTe0T9i3eA111HU4OZL+wpQMB
 XBpnOMFcx8ZLiCVOWTvNstGWcVusa+vaslT7QtCFodPD9xT7Afrk4wQdtcqilLyu2GO4ZhRckIL
 s7vWuJ9quxJ736VhWF0glNrXKpT251fPqIFJbr0mm6g==
X-Received: by 2002:a05:6512:2316:b0:59b:8472:48ca with SMTP id
 2adb3069b0e04-59ba0f63088mr1131918e87.12.1768405882412; Wed, 14 Jan 2026
 07:51:22 -0800 (PST)
MIME-Version: 1.0
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
 <20260112-qcom-sa8255p-emac-v6-2-86a3d4b2ad83@oss.qualcomm.com>
 <a2a610a3-aead-4e85-8a4c-7b83ccf276dc@lunn.ch>
 <CAMRc=Mf8TTTcU9A3gc_LQF3Ow6Ww0omVJH6x-DQEnOSPXfaUQw@mail.gmail.com>
 <7865a1fb-91bb-4aec-ab3a-b53050d992e8@lunn.ch>
In-Reply-To: <7865a1fb-91bb-4aec-ab3a-b53050d992e8@lunn.ch>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 14 Jan 2026 16:51:10 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md-z9+RdVPB9kKeVwWWJni7se7HfbhwGmvQ9Wd3CwJqeQ@mail.gmail.com>
X-Gm-Features: AZwV_QiTx85beob9IcsRkXcH-FzLKf11MkfoXrcsCiRgQ4kLBhgc1kcRpkaBWZY
Message-ID: <CAMRc=Md-z9+RdVPB9kKeVwWWJni7se7HfbhwGmvQ9Wd3CwJqeQ@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
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

T24gVHVlLCBKYW4gMTMsIDIwMjYgYXQgMTE6MDbigK9QTSBBbmRyZXcgTHVubiA8YW5kcmV3QGx1
bm4uY2g+IHdyb3RlOgo+Cj4gT24gVHVlLCBKYW4gMTMsIDIwMjYgYXQgMDE6MzY6NTNQTSArMDEw
MCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiA+IE9uIE1vbiwgSmFuIDEyLCAyMDI2IGF0
IDI6NDXigK9QTSBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+IHdyb3RlOgo+ID4gPgo+ID4g
PiBPbiBNb24sIEphbiAxMiwgMjAyNiBhdCAxMToxNTo0MUFNICswMTAwLCBCYXJ0b3N6IEdvbGFz
emV3c2tpIHdyb3RlOgo+ID4gPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAa2Vy
bmVsLm9yZz4KPiA+ID4gPgo+ID4gPiA+IEluIG9yZGVyIHRvIGRyb3AgdGhlIGRlcGVuZGVuY3kg
b24gQ09ORklHX09GLCBjb252ZXJ0IGFsbCBkZXZpY2UgcHJvcGVydHkKPiA+ID4gPiBnZXR0ZXJz
IGZyb20gT0Ytc3BlY2lmaWMgdG8gZ2VuZXJpYyBkZXZpY2UgcHJvcGVydGllcyBhbmQgc3RvcCBw
dWxsaW5nCj4gPiA+ID4gaW4gYW55IGxpbnV4L29mLmggc3ltYm9scy4KPiA+ID4KPiA+ID4gSXMg
dGhlIGludGVudGlvbiB0byByZWFkIHRoZXNlIHByb3BlcnRpZXMgZnJvbSBBQ1BJIHRhYmxlcz8K
PiA+ID4KPiA+Cj4gPiBOby4gT3RoZXIgdGhhbiBhIGNvdXBsZSBwcm9wZXJ0eSBnZXR0ZXJzIHdo
aWNoIGNhbiB1c2UgdGhlIGZ3bm9kZQo+ID4gYWJzdHJhY3Rpb24sIHRoZXJlJ3Mgbm90aGluZyBo
ZXJlIHRoYXQgcmVxdWlyZXMgdGhlIE9GIGRlcGVuZGVuY2UuCj4KPiBTbyB3aGF0IGlzIHRoZSBu
ZWVkIGZvciBub3QgdXNpbmcgT0Y/IFdoeSBkbyB5b3Ugd2FudCB0aGlzIHBhdGNoPwo+CgpXZSd2
ZSBoYWQgYSBoaWdoZXItbGV2ZWwgYWJzdHJhY3Rpb24gZm9yIE9GIG5vZGVzIGZvciB5ZWFycyBu
b3cuIFNpbmNlCkknbSBhbHJlYWR5IHRvdWNoaW5nIHRoZSBkcml2ZXIsIGl0IG1ha2VzIHNlbnNl
IHRvIHN3aXRjaCB0byB1c2luZyBpdCwKYXMgT0YtY2VudHJpYyBBUElzIGFyZSBub3QgcmVjb21t
ZW5kZWQgaW4gbmV3IGNvZGUgZXZlbiBpZiBpdCdzIGFuCk9GLW9ubHkgZHJpdmVyLgoKQmFydG9z
egpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
