Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDCD854CC5
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 16:31:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63C5CC57194;
	Wed, 14 Feb 2024 15:31:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AFD4C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 15:31:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D67526190C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 15:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76FF4C43399
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 15:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707924694;
 bh=4JlFA01oQWdtvRaP+CnWQqdwr1cP142uEyw13TLrbN8=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=REdAzMQNUKQthunqIYd1xXRZvyRazfzeeHO6U9IdkqpQocmGPZO0MqL1dce3y5y1b
 PFeEIPsWTolML15+QzASJcdeWR5n3IAnWbJf7gcLrasH+H8HI8o4G8CRjOmNuEAXXZ
 JPJN0CaZp3PLCjJjy61EfrhMHYHUHlJL+wd+mTzJYfZGvX6odSfmQZTFtUVb0aybMe
 ViowSODx6riqYuR9wKjBYsEm3o3VxzwN8Mp3sn9zRKC3cerkcEYU/VGXs0MoG5uQuI
 g6xuLSibBrZHt98G3dsRPMywRLrzlLMAc3Dp44/uxlOpcqrH3cKuiu41UkhGcoS0W2
 /cPQAX+TUIULg==
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a3d0d26182dso204408266b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 07:31:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWMZcgZa9cpUyRH/7kFsTMUGbI2ypgpSr2u36g6FiS4IusIW4CXwSEhn8ivF1DDLJLf131nWF1YsYr2kb6CgJtGsMMIkCRNO1t5KjRPbDiUXTTTFd239RlN
X-Gm-Message-State: AOJu0YzRGJSUatsZ5LA5k22q/3LMzq/U4Q3/wUbkOxAN9VZYAHsWxFns
 YUG01tDtdUTUjkFJaeG7zjCAZUD9Q4UUyeCO/a5SJwsTKs9Tf2iSIuFbOayxFXnSM6rRsPcN1TP
 qqqAlBfgOroolEhBld6XJt4PhnA==
X-Google-Smtp-Source: AGHT+IH8/isML9jhNTe8vUWU49jrNm4p0HUKpD8NeE7Izp0zgWowWPvoVR9vvZmOadC5fdJrnpVWN3J0XGbdjt6xmGE=
X-Received: by 2002:a2e:b888:0:b0:2d0:dfad:2863 with SMTP id
 r8-20020a2eb888000000b002d0dfad2863mr2522106ljp.46.1707924672118; Wed, 14 Feb
 2024 07:31:12 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
 <CAMuHMdWgvD9szXksK+jzyvwLQ8ufWWf1TPQ7s-5z4JWgrvXmkg@mail.gmail.com>
In-Reply-To: <CAMuHMdWgvD9szXksK+jzyvwLQ8ufWWf1TPQ7s-5z4JWgrvXmkg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 14 Feb 2024 15:30:57 +0000
X-Gmail-Original-Message-ID: <CAL_JsqKbDdUzkuSBrBTYm0PF8KehK0DnUwTBHqJ6tZfaE=B2_w@mail.gmail.com>
Message-ID: <CAL_JsqKbDdUzkuSBrBTYm0PF8KehK0DnUwTBHqJ6tZfaE=B2_w@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org,
 Tony Lindgren <tony@atomide.com>, linux-arm-msm@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>, Chanho Min <chanho.min@lge.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Schier <nicolas@fjasle.eu>, Bjorn Andersson <andersson@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, linux-renesas-soc@vger.kernel.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linusw@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-kbuild@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Nathan Chancellor <nathan@kernel.org>, soc@kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Imre Kaloz <kaloz@openwrt.org>, Scott Branden <sbranden@broadcom.com>,
 openbmc@lists.ozlabs.org, Antoine Tenart <atenart@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Tsahee Zidenberg <tsahee@annapurnalabs.com>
Subject: Re: [Linux-stm32] [PATCH 0/6] dts: Fix dtc interrupt warnings
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

T24gV2VkLCBGZWIgMTQsIDIwMjQgYXQgOTowMeKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+Cj4gSGkgUm9iLAo+Cj4gT24gVHVlLCBGZWIgMTMs
IDIwMjQgYXQgODozNeKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+
ID4gSSBoYWQgYSBicmFuY2ggd2l0aCBtb3N0IG9mIHRoZXNlIGNoYW5nZXMgc2l0dGluZyBpbiBt
eSB0cmVlIGZvciBzb21lCj4gPiB0aW1lLiBHZWVydCdzIGFza2luZyBhYm91dCBzb21lIGVycm9y
cyBub3QgZ2V0dGluZyBmb3VuZCBwcm9tcHRlZCBtZSB0bwo+ID4gY2xlYW4gaXQgdXAgYW5kIHNl
bmQgaXQgb3V0LiBUaGlzIHNlcmllcyBmaXhlcyBhbGwqIGludGVycnVwdCByZWxhdGVkCj4gPiB3
YXJuaW5ncyBhbmQgZW5hYmxlcyB0aGUgY2hlY2sgYnkgZGVmYXVsdC4KPgo+ID4gKlRoZXJlJ3Mg
YSBmZXcgUmVuZXNhcyB3YXJuaW5ncyBzdGlsbCBHZWVydCBzYWlkIGhlIHdvdWxkIGZpeC4KPgo+
IFRoYW5rcywgZml4IHNlbnQKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yL2EzNTFlNTAzZWE5
N2ZiMWFmNjgzOTU4NDNmNTEzOTI1ZmYxYmRmMjYuMTcwNzkyMjQ2MC5naXQuZ2VlcnQrcmVuZXNh
c0BnbGlkZXIuYmUKPgo+ID4gICAgICAgZHRjOiBFbmFibGUgZHRjIGludGVycnVwdF9wcm92aWRl
ciBjaGVjawo+Cj4gPiAgc2NyaXB0cy9NYWtlZmlsZS5saWIgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMyArLS0KPgo+IEp1c3Qgd29uZGVyaW5nLCBjYW4gdGhlIHJlbWFpbmlu
ZyBkaXNhYmxlciBiZSByZW1vdmVkLCB0b28/Cj4KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvTWFrZWZpbGU6ICAgICAtV25vLWludGVycnVwdF9wcm92aWRlciBcCgpJIHdhcyB0
b28uIFNob2NraW5nbHksIHRoYXQgdG9vIHdpbGwgcmVxdWlyZSBzb21lIGZpeGVzLiBUaG91Z2gg
SQpyZW1lbWJlciB3aGVuIGNvbmZpZ3VyaW5nIHRoZSB3YXJuaW5ncyBmb3IgYmluZGluZ3MsIHRy
eWluZyB0byBtYWtlCnRoZW0gc3RyaWN0ZXIuIFNvIHRoZXJlIG11c3QgaGF2ZSBiZWVuIHNvbWUg
Y2FzZSB3aGVyZQpuby1pbnRlcnJ1cHRfcHJvdmlkZXIgd2FzIG5lZWRlZC4gSXQgbWF5IGhhdmUg
YmVlbiByZWxhdGVkIHRvIGhvdyB3ZQpwYXJzZSBpbnRlcnJ1cHRzIGluIGV4YW1wbGVzLCBidXQg
dGhhdCBjaGFuZ2VkIGJhY2sgd2hlbiBzd2l0Y2hpbmcgdG8KdmFsaWRhdGUgZHRicyBkaXJlY3Rs
eS4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
