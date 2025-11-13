Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3806CC57C09
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Nov 2025 14:44:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF60DC628D4;
	Thu, 13 Nov 2025 13:44:24 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B89EC628B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 13:44:24 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-594330147efso697156e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 05:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763041464; x=1763646264;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gHk2bNA1OTHNC9vr3z2H2JeUdyy+rk3RBEHgiTzG238=;
 b=qRH83sbAJwa+jFfMYVNSO9dkvPEgFLUpKJvDsXUkVjh/ZNMt3duzJtWbm/+1Cv+dwS
 CE+GXsmKFspf6aDQDgzyEfO9XmQRSnnMt+TYTXn895EXLxM6N/p6ihO6EvHyBuL1u7RF
 SJKtNDwptbKntRd9H0kUryv4cTnSiH23JLpbmSZaQoV9yrVX4j1jr+YFl/AxNeCH2JpP
 HBOPHj3D7dSs+G+On/bgd1p4dgYFnE0cSE2jcn5JNTF0Gf3w98ZHiVvdaNtROclXtyx/
 DWjy1XJLupa1f5P/tE+EsxLlWuBteD9Vv0ZbWYYW0BZm4xhr/r4h0PNAaAVF7Nb+BLJP
 g4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763041464; x=1763646264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gHk2bNA1OTHNC9vr3z2H2JeUdyy+rk3RBEHgiTzG238=;
 b=IqeP17dUSwoY4GGA7vBjPSvXZvSxX9/5CAtQ7oMOlRqpm8EiapLuOh2+Xn1PhNE9UM
 aWpKeaL52w3fBLG/1waY00NOEdK//NMV1xLOxkRo11WUCW0B2SOSIDcOKr+ajkossJoZ
 ClBmhNQeySV1nrrUO+Xry6oDuuJ6lQ2TL1WrhRfyFPAZ0a9eKeIjHKqVqJAXJjHsGGnW
 vGrgAaDNM2wXr120NA8x5z2XPWjRBUdzvtcFf+h58Ub71rAztddo0f2QjSmAeDCvI8fU
 cUJlq5ETJj6l6K70V8Xj71vJx8Qgq9TYnGQl7bFF+GKQ1Yxja412gzD1g0LVEI1Q6HMh
 hrWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSVP0feDKtWacuUOnZAkQRW5c83oec2cCgW1NadPj9VMBfbcFo8f4coQPeg+RQaayE1lV31Rf27nDsHw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyHcR+HE6ku8+EkvxluuLG7vbhmJ8taimufi0WdrTI1EZFeHIPL
 6ge3abMw7rFnuRrCzM91bep++VfrsWxOPZXZERe2540nYrWwzkN3yFPOEXTD1JSxGYtI7j+lK2v
 RWMj8J38vP+P8Nx7IsXOOUuxDU3O/ynjARSP6+rolDw==
X-Gm-Gg: ASbGnctzuF7HCQIWk+zH/SWC29NEzu529SI+Jbdz1j8A4NCE+5aMXXxpnQkHpzS0XFV
 KS2Y3I7txOchUbc6OHKO9Nya1/P9hUwzijxy+xkpaLle2GBHpgfzhFsNBsygHIpbTXbUUHhWtec
 3kK7US679I1Z6kxpQBNwhwlXJ5dRtN3LFejk0HE9vsbaIZ6bE4/SAM/epJr1ObMqsxnoHluUjE5
 Vxt8cZGblSWTDgohpZS9A+Krco/WoFmDhPC5yHhhy/wEpGRlWvX9KsjBYv+qEPy84D1Tk74VzRp
 POndPy+KTokzNQnV
X-Google-Smtp-Source: AGHT+IF9+pE/QXln9/ghLnXjpwA3j+ZQdhSMaqAds1VqCnmNiZvVcKXj+XjAJW9rczSh1FwGivl5ToawEe+J2/Cq7qU=
X-Received: by 2002:a05:6512:6d4:b0:592:f7cf:9f6f with SMTP id
 2adb3069b0e04-59576df5dfemr2184445e87.14.1763041463584; Thu, 13 Nov 2025
 05:44:23 -0800 (PST)
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-6-01d3e3aaf388@linaro.org>
 <14f95efb-0eb0-48ee-9132-df35abddfcc7@oss.qualcomm.com>
In-Reply-To: <14f95efb-0eb0-48ee-9132-df35abddfcc7@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:44:12 +0100
X-Gm-Features: AWmQ_blnqOG7JKELYBN2x3sW4StFzPpU8xniVnWCV7D_4z_I3CQNMw3VuWKeQ6A
Message-ID: <CAMRc=Mf03rYoi-C+kMic9RYZdk2vtAW5LDMYNMqg-H5vJccUhA@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v5 6/8] net: stmmac: qcom-ethqos: split
 power management context into a separate struct
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCAxMjowMOKAr1BNIEtvbnJhZCBEeWJjaW8KPGtvbnJhZC5k
eWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMS83LzI1IDExOjI5IEFNLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8
YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IFdpdGggbWF0Y2ggZGF0YSBz
cGxpdCBpbnRvIGdlbmVyYWwgYW5kIHBvd2VyLW1hbmFnZW1lbnQgc2VjdGlvbnMsIGxldCdzCj4g
PiBub3cgZG8gdGhlIHNhbWUgd2l0aCBydW50aW1lIGRldmljZSBkYXRhLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJv
Lm9yZz4KPiA+IC0tLQo+ID4gIC4uLi9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29t
LWV0aHFvcy5jICAgIHwgNDYgKysrKysrKysrKysrLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAyNSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3Mu
YyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9z
LmMKPiA+IGluZGV4IDFmMDA1NTZiYmFkOTk3ZTJlYzc2YjUyMWNmZmUyZWIxNGZhYmI3OWUuLjA5
ZjEyMjA2MmRlYzg3YWExMTgwNGFmMjc2OWRkZmY0OTY0ZTY1OTYgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jCj4g
PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0
aHFvcy5jCj4gPiBAQCAtMTA1LDE3ICsxMDUsMjEgQEAgc3RydWN0IGV0aHFvc19lbWFjX21hdGNo
X2RhdGEgewo+ID4gICAgICAgY29uc3Qgc3RydWN0IGV0aHFvc19lbWFjX3BtX2RhdGEgKnBtX2Rh
dGE7Cj4gPiAgfTsKPiA+Cj4gPiArc3RydWN0IGV0aHFvc19lbWFjX3BtX2N0eCB7Cj4gPiArICAg
ICBzdHJ1Y3QgY2xrICpsaW5rX2NsazsKPiA+ICsgICAgIHVuc2lnbmVkIGludCBsaW5rX2Nsa19y
YXRlOwo+ID4gKyAgICAgc3RydWN0IHBoeSAqc2VyZGVzX3BoeTsKPgo+IFdoYXQgaXMgdGhlIGJl
bmVmaXQgb2YgZG9pbmcgdGhpcz8gUEhZIEFQSXMgaGFwcGlseSBjb25zdW1lIGEgbnVsbHB0cgo+
IGFuZCBOT1Agb3V0LCBhbmQgdGhlIFBIWSBpcyBhbHJlYWR5IHJldHJpZXZlZCB3aXRoIF9vcHRp
b25hbCgpLAo+IHNpbWlsYXJseSB3aXRoIGNsawo+Cj4gS29ucmFkCgpCZWNhdXNlIGl0IGNsZWFy
bHkgZGl2aWRlcyB0aGUgZHJpdmVyJ3MgbG9naWMgaW50byB0aGUgbWFudWFsIGFuZApmaXJtd2Fy
ZS1kcml2ZW4gdmFyaWFudHMuIEp1c3QgYmVjYXVzZSB3ZSBjb3VsZCwgZG9lc24ndCBuZWNlc3Nh
cmlseQptZWFuIHdlIHNob3VsZCBqdXN0IGNhbGwgUEhZIEFQSXMgd2l0aCBhIG51bGxwdHIgaWYg
cmVhZGFiaWxpdHkgaXMKYmV0dGVyIHdoZW4gd2UgZG9uJ3QuCgpCYXJ0b3N6Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
