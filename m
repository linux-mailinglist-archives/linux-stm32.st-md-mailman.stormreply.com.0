Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DA0CD9402
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Dec 2025 13:29:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDD0CC8F272;
	Tue, 23 Dec 2025 12:29:47 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EDBFC8F271
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Dec 2025 12:29:46 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-37a3d86b773so39297031fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Dec 2025 04:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1766492985; x=1767097785;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h6OXWNpcTZmo3fq5/Hn/HjwTOV2GaxRDyFEHGkPfSDM=;
 b=YQRgIETtyBHTW5uA6DwWbzwZR0s5nAlJcUdx6ehva5o8XzbD5BtIBgdUQVDldsnVz+
 +PSKx9fvY8icnhdeSFlKBBTTe2YxeDwAuIpsC9Z+9Deb47B6qYPlf2jbc9Bd3WkaauS4
 pFyyxdOyAFZ1aKqylrgxpsv5WyKRpxTwJVj3AcDkfGquBTzx3Al74B1tdarVZS3EprQd
 sjfpdDyWkdzXnUsmtkZxQiU8A8Sg8iji4jhzTlk8ZpbmMYvth9gAkinBMd5zDm3ygusI
 g7eEpja2RVDcOC5uhhccTwonNZOw2ES49kd1EMmOF7GzJUVIw1yddzAtcNz6VANIHg4y
 Bw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766492985; x=1767097785;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=h6OXWNpcTZmo3fq5/Hn/HjwTOV2GaxRDyFEHGkPfSDM=;
 b=oYMYYiEzCV4qj2DcuggikNCoEOWjrgJMnBVZK1XGgdaf1ZPAD3irn+1TNdNvAihgVc
 ++bLdIL6RWmzynhAX4ZldIBnFsD95TifYyWrqEx9QWcmk0j+qScVNXR8PIstvnLw3m4U
 cE37BJHUWvOw/iTirSYC/CV/O5iRnD32JnImlv9zz4/aCVC+LkXUIN47Y3KDP38+jiN9
 W0YzdHdTzin+2BC22SYBRX4gIuYsalb2ev9YRYlFFA+Y2DnfeVyIEF+IT1PSnifUW1Dk
 0nwbFNFkFT0hLnhas1jd8Zolr1IgSX0KKMtcnl2KoU1DrLLUkOtHTqHRSILRREOlv7Q8
 Zwlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiXl1JuIriWGXT+2NYt76V/Uz+hgkR7ph1TijPvuyJvn75haB7F0eoghcUllDjcIzpufP5amNLvWLmQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwY1GIIBRBYAFMGEQM4zAePuKFEkHwoVLeFitUslewNDumC7XRm
 SUlotWeldJC52Y9Nww73zcbLYfmkPGib9qvIL7c/mGOra28NvwpN2/axifTlPUbNMhAzC3GKc3b
 JypTLexBaEpe1TpJdiXEX3rPac2JngLRQDXwUSZVJaA==
X-Gm-Gg: AY/fxX6YFntkzN5Kb5K2pD/bIJ31CkV0a9r2R5sPflb6WDOjHUPMSHDUXbLKgxkoZCn
 K33wmjyJJJ6HzCTN2LPNg/g+K/oWpvYEVKieMKXUqII5HcrIsfyHenD/qnpNEsXf+86QAwcGVin
 qHt2WiXDq8zvO7JhR0dt+pVAna7S60YMVEQUr4vmPmNqWcVDsuKYJuW5/VVnqug08GcdAisbyie
 D5Nei2cjeAXI8F7+CTOVBlS3nF/OKjCXmnmwrtlFKyobMsYwOjQABy7SAh2ml21LR3WohNZbOS2
 Q//yE6b94yah3X4mH/f2NCFZDWaHp/C77VpOJQ==
X-Google-Smtp-Source: AGHT+IEBOhkGPqyyAQ1vT8Z9LQwcalYcPegEonjbT0vsHKYCaYN4/Y7HunNV2ZOFRdC/NVauUA6SJStJulcaNDLUuvw=
X-Received: by 2002:a2e:a7cf:0:b0:37a:45b0:467a with SMTP id
 38308e7fff4ca-3812158ffe9mr48663611fa.5.1766492985167; Tue, 23 Dec 2025
 04:29:45 -0800 (PST)
MIME-Version: 1.0
References: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
 <51c7048a-52dc-47e1-97c3-2aa0d6555643@redhat.com>
In-Reply-To: <51c7048a-52dc-47e1-97c3-2aa0d6555643@redhat.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 23 Dec 2025 13:29:32 +0100
X-Gm-Features: AQt7F2oUd4L6z6INXPzdFurDETLUQbJOAVCbMRjbjb79EkFyrJjgdrXB0o2w2nA
Message-ID: <CAMRc=Me7++jcT8SpA309F-0XoZvHPQF2Hfr17+Kt=Jmdy635pg@mail.gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
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
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Chen Wang <unicorn_wang@outlook.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-rockchip@lists.infradead.org, Jose Abreu <joabreu@synopsys.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
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
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, sophgo@lists.linux.dev,
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
Subject: Re: [Linux-stm32] [PATCH v6 0/7] net: stmmac: qcom-ethqos: add
 support for SCMI power domains
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

T24gVHVlLCBEZWMgMjMsIDIwMjUgYXQgMTI6NDLigK9QTSBQYW9sbyBBYmVuaSA8cGFiZW5pQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gMTIvMTkvMjUgMTI6NDIgUE0sIEJhcnRvc3ogR29sYXN6
ZXdza2kgd3JvdGU6Cj4gPiBBZGQgc3VwcG9ydCBmb3IgdGhlIGZpcm13YXJlLW1hbmFnZWQgdmFy
aWFudCBvZiB0aGUgRGVzaWduV2FyZSBNQUMgb24KPiA+IHRoZSBzYTgyNTVwIHBsYXRmb3JtLiBU
aGlzIHNlcmllcyBjb250YWlucyBuZXcgRFQgYmluZGluZ3MgYW5kIGRyaXZlcgo+ID4gY2hhbmdl
cyByZXF1aXJlZCB0byBzdXBwb3J0IHRoZSBNQUMgaW4gdGhlIFNUTU1BQyBkcml2ZXIuCj4gPgo+
ID4gSXQgYWxzbyByZW9yZ2FuaXplcyB0aGUgZXRocW9zIGNvZGUgcXVpdGUgYSBiaXQgdG8gbWFr
ZSB0aGUgaW50cm9kdWN0aW9uCj4gPiBvZiBwb3dlciBkb21haW5zIGludG8gdGhlIGRyaXZlciBh
IGJpdCBlYXNpZXIgb24gdGhlIGV5ZS4KPiA+Cj4gPiBUaGUgRFRTIGNoYW5nZXMgd2lsbCBnbyBp
biBzZXBhcmF0ZWx5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kg
PGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IEJhcnRv
c3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4KPgo+
IFF1aXRlIHVudXN1YWwgU29CIGNoYWluLi4uIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIGlm
IHlvdSBjb3VsZCBzdGljawo+IHRvIG9uZSBvciB0aGUgb3RoZXI7IGFsc28gdGhlIHN1YmogcHJl
Zml4IHNob3VsZCBpbmNsdWRlIHRoZSB0YXJnZXQgdHJlZQo+IChuZXQtbmV4dCBpbiB0aGlzIGNh
c2UpOyBmaW5hbGx5Li4uCj4KClRoYXQncyB0b3RhbGx5IG5vcm1hbC4gSSBkaWQgbW9zdCBvZiB0
aGUgd29yayBvbiB0aGlzIHNlcmllcyB3aGlsZQpzdGlsbCBvbiBMaW5hcm8gcGF5cm9sbCBhbmQg
Y3JlZGl0IGlzIGR1ZS4gSG93ZXZlciBJJ20gcmVzcGlubmluZyB0aGVtCm5vdyBhcyBhIFF1YWxj
b21tIGVtcGxveWVlIGFuZCBpdCdzIG5vIGRpZmZlcmVudCB0aGFuIHRha2luZyBzb21lb25lCmVs
c2UncyBwYXRjaGVzIGFuZCByZXNlbmRpbmcgdGhlbSAtIHlvdSBoYXZlIHRvIGFkZCB5b3VyIFNv
Qi4KCj4gIyMgRm9ybSBsZXR0ZXIgLSBuZXQtbmV4dC1jbG9zZWQKPgo+IFRoZSBuZXQtbmV4dCB0
cmVlIGlzIGNsb3NlZCBmb3IgbmV3IGRyaXZlcnMsIGZlYXR1cmVzLCBjb2RlIHJlZmFjdG9yaW5n
Cj4gYW5kIG9wdGltaXphdGlvbnMgZHVlIHRvIHRoZSBtZXJnZSB3aW5kb3cgYW5kIHRoZSB3aW50
ZXIgYnJlYWsuIFdlIGFyZQo+IGN1cnJlbnRseSBhY2NlcHRpbmcgYnVnIGZpeGVzIG9ubHkuCj4K
PiBQbGVhc2UgcmVwb3N0IHdoZW4gbmV0LW5leHQgcmVvcGVucyBhZnRlciBKYW4gMm5kLgoKU3Vy
ZSwgdGhhbmtzLgoKQmFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
