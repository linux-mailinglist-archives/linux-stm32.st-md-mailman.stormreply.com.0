Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8862DC57AAC
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Nov 2025 14:31:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FD72C628D4;
	Thu, 13 Nov 2025 13:31:36 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01F00C628B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 13:31:34 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-59577c4c7c1so1806009e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 05:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763040694; x=1763645494;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=73kr7nUrOWZMw2Xrq3JK7B68+7C7ERu+i4U/2oSeqZY=;
 b=03o3HmZAKQ5XqHYhYMUS+nrek8hxdEYaTkkIDzo9kAj/MGbZQ0+462ksa8Wv//RGD/
 1C1k0UQGD/qxHJmASZWGWrheQXcM2DSe+PN2MQFdlqxrAYVyCXG9RG7+hKEReHbftTzy
 yq3WQ1JCYSZdi86S4ESdcRqk2MPclof+URGTjMD/nGMyaWKuHE+pp8AZhsfyjN7OyZ8n
 7kSOCV+zVp+8etfak/GlHNDDNuCkAnmSQKKS8wsIFBRBmvpwM8Sdo0BALqC67yiHWI9N
 hikLivb2XSIIxA3MymAM+azNGvdovqdw2kbWEQSiGfWUkp0vUxOV3HvbeZ/OaqG3GrFg
 rW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763040694; x=1763645494;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=73kr7nUrOWZMw2Xrq3JK7B68+7C7ERu+i4U/2oSeqZY=;
 b=PpxWCPgWlmqZ9aA1RakIxcBF6aRwJoUVj1KY/aWJY/hCZkg34I6SXx83isUFhC2ngl
 jQHdT3L39MNc6rL1T1Koy9PF88T/x6i4EbLccX7OBgAVcZOyA9/qyLf5D6V34OoohLTM
 hhfelBft5QjvzmW5CCf0LyuWkse4IhGBc2aFL7Ar+Ets9vx7FmaKDpqzLhqGecvGOTD2
 C119BJPfAHIpV8ijy0joA1RmBmwcf9MxbEV48Q+mHSwfgjEQOhWBTI8rtpYcqPEJbhx1
 LXyeXfu/TZc2O8cIRNlJ+Etr5aH4Whua4WiOUh+1s30oTn2SOM9ppqBKQA66dicnXbEW
 aYNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMVqXkOb0Wx9cNP76M1KzoNxPeg4R8TjMve32SuQOR6SgWb7ak6PoDM1zHHZToHYHcj84Y+ZhlaCKLnw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxYVBSI6AYDn9hrl8xTkJFtTP5+SUHAsHWsJAYdNicr1LreVJV0
 jIcjSmrKPjTR3qenH0beLeBgkkcjIfFooBNkx+1fmtPhKgfL33szAg+dUlrrV3y8kND9JpJgIYX
 WRoAIcptViWkImZs3WgRTeJaINCszESY/anUVKW7Zfg==
X-Gm-Gg: ASbGncuhQtv4CWpbxJlf/c8hIVduRmd+koLZKEY8a/KIhjTMph/9BYD2kkKPcHak9wK
 9VsQNjoDOdDbzgSOIkxYLO/tUV7QWkgDkm9R1sZJc1t2rq2M6f1guagV5ip7Zmqbp5MJ4qQ+qlq
 oiPcAVWSjsoYC54xriLKRf+skrNk6/LQD34zbvKp1DvlN7S8ze31julnv288Yk92RSYKffPHDVT
 GYusRhiuoo4apjBZ/FD9iwmoU3Hxtg3H12YECsdQy9PrkXoNr4x//WoMhFZpXDwwcJQZHAJdDnR
 MiX3Bpwrc4DGT50G
X-Google-Smtp-Source: AGHT+IFmYGYaNrPxFWU0ghXUofhzNye14/5vushtgIFDWSfgA/MklzOW/JNoBE9rLO+zgbK8iJzH+WbW5agg2UGK7Co=
X-Received: by 2002:a05:6512:144d:20b0:595:7b24:d352 with SMTP id
 2adb3069b0e04-5957ececb1fmr730185e87.24.1763040694032; Thu, 13 Nov 2025
 05:31:34 -0800 (PST)
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-3-01d3e3aaf388@linaro.org>
 <9805b902-95bb-4b18-b65f-f6efdfb6807a@oss.qualcomm.com>
In-Reply-To: <9805b902-95bb-4b18-b65f-f6efdfb6807a@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:31:22 +0100
X-Gm-Features: AWmQ_bmfo87z1zTXv8LP-M-WOLEoIFCS2S60P9_2zq_qXBjBuZTULdbiMAAMcS0
Message-ID: <CAMRc=MdWu5x5bgh4CfPsowJnF0Qh1W770KTDtTFMkGkQf4_LKg@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v5 3/8] net: stmmac: qcom-ethqos: improve
	typing in devres callback
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCAxMTo1MOKAr0FNIEtvbnJhZCBEeWJjaW8KPGtvbnJhZC5k
eWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMS83LzI1IDExOjI5IEFNLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8
YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IEl0J3MgYmFkIHByYWN0aWNl
IHRvIGp1c3QgZGlyZWN0bHkgcGFzcyB2b2lkIHBvaW50ZXJzIHRvIGZ1bmN0aW9ucyB3aGljaAo+
ID4gZXhwZWN0IGNvbmNyZXRlIHR5cGVzLiBNYWtlIGl0IG1vcmUgY2xlYXIgd2hhdCB0eXBlIGV0
aHFvc19jbGtzX2NvbmZpZygpCj4gPiBleHBlY3RzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJh
cnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KPiA+IC0t
LQo+ID4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRo
cW9zLmMgfCA0ICsrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jCj4gPiBpbmRleCA4NTc4YTJkZjhjZjBkMWQ4
ODA4YmNmN2U3YjU3YzkzZWIxNGM4N2RiLi44NDkzMTMxY2EzMmY1YzZjYTdlMTY1NGRhMGJiZjRm
ZmExZWVmYTRlIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwo+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwo+ID4gQEAgLTcyNiw3ICs3MjYsOSBA
QCBzdGF0aWMgaW50IGV0aHFvc19jbGtzX2NvbmZpZyh2b2lkICpwcml2LCBib29sIGVuYWJsZWQp
Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIGV0aHFvc19jbGtzX2Rpc2FibGUodm9pZCAqZGF0YSkKPiA+
ICB7Cj4gPiAtICAgICBldGhxb3NfY2xrc19jb25maWcoZGF0YSwgZmFsc2UpOwo+ID4gKyAgICAg
c3RydWN0IHFjb21fZXRocW9zICpldGhxb3MgPSBkYXRhOwo+ID4gKwo+ID4gKyAgICAgZXRocW9z
X2Nsa3NfY29uZmlnKGV0aHFvcywgZmFsc2UpOwo+Cj4gZXRocW9zX2Nsa3NfY29uZmlnKCkgdGFr
ZXMgYSB2b2lkcHRyIHRvbwo+Cj4gS29ucmFkCgpSaWdodC4gSSB0aGluayBJIGhhZCBzb21ldGhp
bmcgaW4gbWluZCB3aGVuIEkgd3JvdGUgaXQgYnV0IEknbSBub3QKc3VyZSB3aGF0IGFueW1vcmUu
IEJlc3QgZHJvcCB0aGlzLgoKQmFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
