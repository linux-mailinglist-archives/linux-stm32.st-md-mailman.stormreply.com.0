Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE19C57FC4
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Nov 2025 15:40:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 353F9C628D4;
	Thu, 13 Nov 2025 14:40:03 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8218FC1A977
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 14:40:01 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-37a2dced861so18517761fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 06:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763044800; x=1763649600;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wl4571SxJAzignqkvu+iEEF0Pe+/jqH/UWVoWMdIiw4=;
 b=iK/Fojxscl0nzvFqp7i1NZb8vX7Pj5O3Bk8XH2zJDot3Pn8B524LGNclhyUFzd7Uev
 5TpXPAaP2pWZd0YZOMYzaWgDoAWukTt1TWVMWacDR8BpsmErj60w9JOMTCEyJHpU0VhP
 44X3BCm+zlViKQrsXzYb9inKe1vNJLnT8iQlEz2l0IJeMaqNvL43P1x8oZIQ0fska2JB
 fqnTjalyWNrs9BxhRNAT8gN6JVZZM1iVLrWCOOj/NkdeZ++guBaLUhw/0XDhIV37TRjl
 SzVDSxHMPSkLponOAJAVePxMv4LJK25Qu/ROmSvC6RmgGAOUizuPv484qRVnL1U2i791
 TGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763044800; x=1763649600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wl4571SxJAzignqkvu+iEEF0Pe+/jqH/UWVoWMdIiw4=;
 b=DPICP+w4D//kHX0jgF5OKI1UFP/DI8XSYen/r1V6yN1+8GnNYPCRtNMd2p4LD2B9RJ
 PnP+Szdox5n2gcbOcdXanVRc2QsXYQQCHFba2vFOAKXIw3l7HBRMC+1wHA674itU4Aqt
 Q+LQ67hQOBctSdMI69TJDoccH1MyWUGtlLyGQIQilfleaV92fTPMJYIZdsVLR0i7tKqg
 AKG6iPkbzeo0haaaWQ31kINGDtZCX/1FqOgQIE4iYO9PmwKCZSCcc19U5DVy5TbMu6Fp
 sDr4Bz3uKCmUp4QW1sS0HRlToWbaSYUsJs6zyjFHdBrc676iNJIGRmuIJcfpm7i+acGn
 oRdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzrGkbOP/KJVJ3IKCmHDLyYOceJe7a+cuU23Il7ufdDrhT7EFO9nHuWWQsk+l6Ixww+1dvSiFgnsdF9g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyD6xc8hgErDCSamf9rEoTPLTC0GPp/GAaNB0Kgsqj8jpDFmW46
 iuE5BiLtR3VrHaVNGres0NM5P8t2ZM2GRtCc2uOi2C+tKAmSvfH9eM1DnS8ZZ8Nwrwoz+69CYgG
 vMBhHy3iT2IvVDv0fYu+OaXJ/X5N9NyYzgqM9Q5Ud5g==
X-Gm-Gg: ASbGncswLTwLjVe0MpPwoCHGhEE4uH79e7tl5I2BrWIQWXPZ1WMANjd8NX0mszO9c01
 aNLed8ya2njnVzGftry7SKBU7wYynqtaF7QIn7Eb6hqFGQotDetn0tFx6CUKOm//a+jW7B+T/fO
 p4mg5z4svUgxzH9rxjzSd88SfFoDibTSX4KgW8SuZ28yzelCRNT9SVpbFgDNtpS5kEM7Qayt8f6
 AReucUx+E6kHXm2JaZ0EWetSjxJpDL3AeyjY0/psJLNEtc7PNKFgxU7cq9z+v9LmZFnOa9fmGqx
 tClSyN77QjOODTRU
X-Google-Smtp-Source: AGHT+IHcp5RL49BzQ/EwQ2Jax7wwd/a8PEM1WoZpid3JGwwdtlpJzBmzwt/P9jvyh9TplD5Nus8fFpsIw/K4cuDWoP0=
X-Received: by 2002:a05:6512:104f:b0:594:2876:c901 with SMTP id
 2adb3069b0e04-5957ececcc7mr1012811e87.25.1763044799557; Thu, 13 Nov 2025
 06:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-8-01d3e3aaf388@linaro.org>
 <aRMiafCQNPVDOljU@horms.kernel.org>
In-Reply-To: <aRMiafCQNPVDOljU@horms.kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 15:39:45 +0100
X-Gm-Features: AWmQ_bmyO0__RPwdcHgOIMRaFCfnIoYFER6JzR_p2Qqf8fR68sQPWn6kw1o5zWY
Message-ID: <CAMRc=MfEuAhichw-tPJkj_BKxy7AzvfmVJJyXzHsqa2wf=2EKw@mail.gmail.com>
To: Simon Horman <horms@kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH v5 8/8] net: stmmac: qcom-ethqos: add
	support for sa8255p
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

T24gVHVlLCBOb3YgMTEsIDIwMjUgYXQgMTI6NDjigK9QTSBTaW1vbiBIb3JtYW4gPGhvcm1zQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBOb3YgMDcsIDIwMjUgYXQgMTE6Mjk6NThBTSAr
MDEwMCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiA+IEZyb206IEJhcnRvc3ogR29sYXN6
ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KPgo+IC4uLgo+Cj4gPiArc3Rh
dGljIGludCBxY29tX2V0aHFvc19wZF9pbml0KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYs
IHZvaWQgKnByaXYpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IHFjb21fZXRocW9zICpldGhxb3Mg
PSBwcml2Owo+ID4gKyAgICAgaW50IHJldDsKPiA+ICsKPiA+ICsgICAgIC8qCj4gPiArICAgICAg
KiBFbmFibGUgZnVuY3Rpb25hbCBjbG9jayB0byBwcmV2ZW50IERNQSByZXNldCBhZnRlciB0aW1l
b3V0IGR1ZQo+ID4gKyAgICAgICogdG8gbm8gUEhZIGNsb2NrIGJlaW5nIGVuYWJsZWQgYWZ0ZXIg
dGhlIGhhcmR3YXJlIGJsb2NrIGhhcyBiZWVuCj4gPiArICAgICAgKiBwb3dlciBjeWNsZWQuIFRo
ZSBhY3R1YWwgY29uZmlndXJhdGlvbiB3aWxsIGJlIGFkanVzdGVkIG9uY2UKPiA+ICsgICAgICAq
IGV0aHFvc19maXhfbWFjX3NwZWVkKCkgaXMgY2FsbGVkLgo+ID4gKyAgICAgICovCj4gPiArICAg
ICBldGhxb3Nfc2V0X2Z1bmNfY2xrX2VuKGV0aHFvcyk7Cj4gPiArCj4gPiArICAgICByZXQgPSBx
Y29tX2V0aHFvc19kb21haW5fb24oZXRocW9zLCBFVEhRT1NfUERfQ09SRSk7Cj4gPiArICAgICBp
ZiAocmV0KQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKwo+ID4gKyAgICAgcmV0
ID0gcWNvbV9ldGhxb3NfZG9tYWluX29uKGV0aHFvcywgRVRIUU9TX1BEX01ESU8pOwo+ID4gKyAg
ICAgaWYgKHJldCkgewo+ID4gKyAgICAgICAgICAgICBxY29tX2V0aHFvc19kb21haW5fb2ZmKGV0
aHFvcywgRVRIUU9TX1BEX0NPUkUpOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4g
KyAgICAgfQo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRp
YyB2b2lkIHFjb21fZXRocW9zX3BkX2V4aXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwg
dm9pZCAqZGF0YSkKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgcWNvbV9ldGhxb3MgKmV0aHFvcyA9
IGRhdGE7Cj4gPiArCj4gPiArICAgICBxY29tX2V0aHFvc19kb21haW5fb2ZmKGV0aHFvcywgRVRI
UU9TX1BEX01ESU8pOwo+ID4gKyAgICAgcWNvbV9ldGhxb3NfZG9tYWluX29mZihldGhxb3MsIEVU
SFFPU19QRF9DT1JFKTsKPiA+ICt9Cj4gPiArCj4gPiAgc3RhdGljIHZvaWQgZXRocW9zX3B0cF9j
bGtfZnJlcV9jb25maWcoc3RydWN0IHN0bW1hY19wcml2ICpwcml2KQo+ID4gIHsKPiA+ICAgICAg
IHN0cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQgPSBwcml2LT5wbGF0Owo+Cj4g
Li4uCj4KPiA+IEBAIC04NTIsMjggKzk5Myw2MyBAQCBzdGF0aWMgaW50IHFjb21fZXRocW9zX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAgICBldGhxb3MtPnJnbWlp
X2NvbmZpZ19sb29wYmFja19lbiA9IGRydl9kYXRhLT5yZ21paV9jb25maWdfbG9vcGJhY2tfZW47
Cj4gPiAgICAgICBldGhxb3MtPmhhc19lbWFjX2dlXzMgPSBkcnZfZGF0YS0+aGFzX2VtYWNfZ2Vf
MzsKPiA+ICAgICAgIGV0aHFvcy0+bmVlZHNfc2dtaWlfbG9vcGJhY2sgPSBkcnZfZGF0YS0+bmVl
ZHNfc2dtaWlfbG9vcGJhY2s7Cj4gPiAtCj4gPiAtICAgICBldGhxb3MtPnBtLmxpbmtfY2xrID0g
ZGV2bV9jbGtfZ2V0KGRldiwgY2xrX25hbWUpOwo+ID4gLSAgICAgaWYgKElTX0VSUihldGhxb3Mt
PnBtLmxpbmtfY2xrKSkKPiA+IC0gICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2
LCBQVFJfRVJSKGV0aHFvcy0+cG0ubGlua19jbGspLAo+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiRmFpbGVkIHRvIGdldCBsaW5rX2Nsa1xuIik7Cj4gPiAtCj4gPiAtICAg
ICByZXQgPSBldGhxb3NfY2xrc19jb25maWcoZXRocW9zLCB0cnVlKTsKPiA+IC0gICAgIGlmIChy
ZXQpCj4gPiAtICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiAtCj4gPiAtICAgICByZXQgPSBk
ZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBldGhxb3NfY2xrc19kaXNhYmxlLCBldGhxb3Mp
Owo+ID4gLSAgICAgaWYgKHJldCkKPiA+IC0gICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+IC0K
PiA+IC0gICAgIGV0aHFvcy0+cG0uc2VyZGVzX3BoeSA9IGRldm1fcGh5X29wdGlvbmFsX2dldChk
ZXYsICJzZXJkZXMiKTsKPiA+IC0gICAgIGlmIChJU19FUlIoZXRocW9zLT5wbS5zZXJkZXNfcGh5
KSkKPiA+IC0gICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGV0
aHFvcy0+cG0uc2VyZGVzX3BoeSksCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJGYWlsZWQgdG8gZ2V0IHNlcmRlcyBwaHlcbiIpOwo+ID4gLQo+ID4gLSAgICAgZXRocW9z
LT5zZXRfc2VyZGVzX3NwZWVkID0gZXRocW9zX3NldF9zZXJkZXNfc3BlZWRfcGh5Owo+ID4gICAg
ICAgZXRocW9zLT5zZXJkZXNfc3BlZWQgPSBTUEVFRF8xMDAwOwo+ID4gLSAgICAgZXRocW9zX3Vw
ZGF0ZV9saW5rX2NsayhldGhxb3MsIFNQRUVEXzEwMDApOwo+ID4gKwo+ID4gKyAgICAgaWYgKHBt
X2RhdGEgJiYgcG1fZGF0YS0+dXNlX2RvbWFpbnMpIHsKPiA+ICsgICAgICAgICAgICAgZXRocW9z
LT5zZXRfc2VyZGVzX3NwZWVkID0gZXRocW9zX3NldF9zZXJkZXNfc3BlZWRfcGQ7Cj4gPiArCj4g
PiArICAgICAgICAgICAgIHJldCA9IGRldm1fcG1fZG9tYWluX2F0dGFjaF9saXN0KGRldiwgJnBt
X2RhdGEtPnBkLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmZXRocW9zLT5wZC5wZF9saXN0KTsKPiA+ICsgICAgICAgICAgICAgaWYgKHJldCA8IDAp
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQs
ICJGYWlsZWQgdG8gYXR0YWNoIHBvd2VyIGRvbWFpbnNcbiIpOwo+ID4gKwo+ID4gKyAgICAgICAg
ICAgICBwbGF0X2RhdC0+Y2xrc19jb25maWcgPSBldGhxb3NfcGRfY2xrc19jb25maWc7Cj4gPiAr
ICAgICAgICAgICAgIHBsYXRfZGF0LT5zZXJkZXNfcG93ZXJ1cCA9IHFjb21fZXRocW9zX3BkX3Nl
cmRlc19wb3dlcnVwOwo+ID4gKyAgICAgICAgICAgICBwbGF0X2RhdC0+c2VyZGVzX3Bvd2VyZG93
biA9IHFjb21fZXRocW9zX3BkX3NlcmRlc19wb3dlcmRvd247Cj4gPiArICAgICAgICAgICAgIHBs
YXRfZGF0LT5leGl0ID0gcWNvbV9ldGhxb3NfcGRfZXhpdDsKPgo+IEhpIEJhcnRvc3osCj4KPiBJ
dCBzZWVtcyB0aGF0IHRoZSBpbnRlbnRpb24gb2YgdGhpcyBpcyB0byBlbnN1cmUKPiB0aGF0IGRv
bWFpbnMgdHVybmVkIG9uIGJ5IHFjb21fZXRocW9zX3BkX2luaXQoKQo+IGFyZSB0dXJuZWQgb2Zm
IGFnYWluIG9uIGV4aXQgb3IgY2xlYW4tdXAgaW4gZXJyb3IgcGF0aHMuCj4KPiA+ICsgICAgICAg
ICAgICAgcGxhdF9kYXQtPmluaXQgPSBxY29tX2V0aHFvc19wZF9pbml0Owo+ID4gKyAgICAgICAg
ICAgICBwbGF0X2RhdC0+Y2xrX3B0cF9yYXRlID0gcG1fZGF0YS0+Y2xrX3B0cF9yYXRlOwo+ID4g
Kwo+ID4gKyAgICAgICAgICAgICByZXQgPSBxY29tX2V0aHFvc19wZF9pbml0KHBkZXYsIGV0aHFv
cyk7Cj4gPiArICAgICAgICAgICAgIGlmIChyZXQpCj4gPiArICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIHJldDsKPgo+IEFuZCBoZXJlIHRob3NlIGRvbWFpbnMgYXJlIHR1cm5lZCBvbi4KPgo+
ID4gKwo+ID4gKyAgICAgICAgICAgICByZXQgPSBxY29tX2V0aHFvc19kb21haW5fb24oZXRocW9z
LCBFVEhRT1NfUERfU0VSREVTKTsKPiA+ICsgICAgICAgICAgICAgaWYgKHJldCkKPgo+IEJ1dCBp
dCBzZWVtcyB0aGF0IGlmIHdlIHJlYWNoIHRoaXMgZXJyb3IgcGF0aCB0aGVuIHRoZSBjbGVhbnVw
IGlzIG5vdAo+IHBlcmZvcm1lZC4gVGhpcyBpcyBiZWNhdXNlIHBsYXRfZGF0IGFuZCB0aHVzIGl0
J3MgZXhpdCBjYWxsYmFjayBhcmUKPiByZWdpc3RlcmVkIHVudGlsIHRoZSBjYWxsIHRvIGRldm1f
c3RtbWFjX3BsdGZyX3Byb2JlKCkgdG93YXJkcyB0aGUgZW5kIG9mCj4gdGhpcyBmdW5jdGlvbi4K
CldlIGNhbiBvbmx5IHJlYWNoIHRoaXMgaWYgZGV2bV9zdG1tYWNfcGx0ZnJfcHJvYmUoKSBmYWls
cy4gWWVhaCBpdApwcm9iYWJseSB3YXJyYW50cyBhIGRldnJlcyBhY3Rpb24uCgpCYXJ0b3N6Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
