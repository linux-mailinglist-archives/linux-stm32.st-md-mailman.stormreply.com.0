Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4A5853C87
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 21:56:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42751C6DD69;
	Tue, 13 Feb 2024 20:56:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFCA7C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 20:56:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 966FD61218
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 20:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC4FC433F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 20:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707857798;
 bh=D4LSaj+s1Zug+tnZej27exr9mIRN2BETmj/yUE3GRW0=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=M009CAqx6Zq+bU3B0slxzBX4LYSGGAZlLcuMORtlOdd1kPRADV0yPtV0MDcvh/71i
 eKKoQaL4IsBOouhURFlM7bXuQ1D+e7yiNAbxs/G05NqAm2BjmuGEY/P1HIx/MQdVN6
 9/uohBcFpABqa62lO3DqYEuiChWq5V/oECVXlNWCANYY5X9R/C9Nws/8iKKgLLeHWI
 q+gvXX6qfTY1DgMimsbt8BAPRBa8NoqLAC1nvSX6dK0At+XS3rq+B5Tk0i6eLbMBEH
 N59MOVh1jaHbHqW0UyPdMbEaABRBPAKSbb1MqwD1LTiA0FoW4hgfJEmvHJ/Elhf/J6
 Trj6bzLhSmhMg==
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5116063585aso6154647e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 12:56:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU5OVUocVMUDTfgXimFzI5ypYNTShnM+xXfLtDSuHcCHV/yL1COQyclMN1Y/GQpAMMtwDTGxjgoL35PekIn7G/hHKYntUZiYtlOmLFFKF6XWsrLdwk7mrSd
X-Gm-Message-State: AOJu0YzHjxFO9va4qlO55z3EFCky5ecwcDoR7A70h8NCvjEcj4VvxwvS
 EeBrcRhrS7RRrH6oBJlsIqza6VEzwlrX8SF+KwkF4opXuiVw56eW0b8ba4zLpxytx1sgguDpmGU
 EeErcdfD5tWfNiVn6AWjZyPrsDA==
X-Google-Smtp-Source: AGHT+IHaVnixOZOBNn0WypWTPscuLN4ELDvcVIU+BZ+gCn9OLEVbEJc+WSHECitxZrPyjoAQls55JHpdFFIbqmURVBc=
X-Received: by 2002:a2e:9bc7:0:b0:2d1:107b:3bbd with SMTP id
 w7-20020a2e9bc7000000b002d1107b3bbdmr506655ljj.9.1707857776326; Tue, 13 Feb
 2024 12:56:16 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
 <20240213-wafer-garnish-88287bc5d4a5@spud>
In-Reply-To: <20240213-wafer-garnish-88287bc5d4a5@spud>
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Feb 2024 20:56:03 +0000
X-Gmail-Original-Message-ID: <CAL_Jsq+9BwYyV9Vu1gfCnK_QjdRHvw2anM==Z6fsJvjyqLYFLw@mail.gmail.com>
Message-ID: <CAL_Jsq+9BwYyV9Vu1gfCnK_QjdRHvw2anM==Z6fsJvjyqLYFLw@mail.gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, linux-arm-msm@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>, Chanho Min <chanho.min@lge.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Schier <nicolas@fjasle.eu>, Bjorn Andersson <andersson@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-aspeed@lists.ozlabs.org,
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

T24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgMjoyN+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEZlYiAxMywgMjAyNCBhdCAwMTozNDoyNFBNIC0w
NjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+IEkgaGFkIGEgYnJhbmNoIHdpdGggbW9zdCBvZiB0
aGVzZSBjaGFuZ2VzIHNpdHRpbmcgaW4gbXkgdHJlZSBmb3Igc29tZQo+ID4gdGltZS4gR2VlcnQn
cyBhc2tpbmcgYWJvdXQgc29tZSBlcnJvcnMgbm90IGdldHRpbmcgZm91bmQgcHJvbXB0ZWQgbWUg
dG8KPiA+IGNsZWFuIGl0IHVwIGFuZCBzZW5kIGl0IG91dC4gVGhpcyBzZXJpZXMgZml4ZXMgYWxs
KiBpbnRlcnJ1cHQgcmVsYXRlZAo+ID4gd2FybmluZ3MgYW5kIGVuYWJsZXMgdGhlIGNoZWNrIGJ5
IGRlZmF1bHQuCj4gPgo+ID4gU29DIG1haW50YWluZXJzLCBDYW4geW91IHBsZWFzZSB0YWtlIHRo
aXMgc2VyaWVzIGRpcmVjdGx5Lgo+ID4KPiA+IFJvYgo+ID4KPiA+ICpUaGVyZSdzIGEgZmV3IFJl
bmVzYXMgd2FybmluZ3Mgc3RpbGwgR2VlcnQgc2FpZCBoZSB3b3VsZCBmaXguCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gUm9i
IEhlcnJpbmcgKDYpOgo+ID4gICAgICAgYXJtNjQ6IGR0czogZnJlZXNjYWxlOiBEaXNhYmxlIGlu
dGVycnVwdF9tYXAgY2hlY2sKPiA+ICAgICAgIGFybTogZHRzOiBGaXggZHRjIGludGVycnVwdF9w
cm92aWRlciB3YXJuaW5ncwo+ID4gICAgICAgYXJtNjQ6IGR0czogRml4IGR0YyBpbnRlcnJ1cHRf
cHJvdmlkZXIgd2FybmluZ3MKPiA+ICAgICAgIGFybTogZHRzOiBGaXggZHRjIGludGVycnVwdF9t
YXAgd2FybmluZ3MKPiA+ICAgICAgIGFybTY0OiBkdHM6IHFjb206IEZpeCBpbnRlcnJ1cHQtbWFw
IGNlbGwgc2l6ZXMKPiA+ICAgICAgIGR0YzogRW5hYmxlIGR0YyBpbnRlcnJ1cHRfcHJvdmlkZXIg
Y2hlY2sKPgo+IE9ubHkgZml4aW5nIGl0IGZvciBhcm0sIFNhZGdlLgoKSSB3YXMgYXNzdW1pbmcg
eW91IGhhZCB0aGluZ3MgaW4gb3JkZXIuIDspCgo+IENvLWluY2lkZW50YWxseSBJIG5vdGljZWQg
dGhlcmUgd2FzIG9uZSBmb3IgcmlzY3Ygd2hpbGUgbG9va2luZyBhdAo+IEtyenlzenRvZidzIHVu
ZGVyc2NvcmUgaW4gbm9kZSBuYW1lIHBhdGNoIGVhcmxpZXIsIHNvIEknZCBhbHJlYWR5Cj4gd3Jp
dHRlbiBhIHBhdGNoIHRvIGZpeCBpdCA6KQoKU2VlLCBJIHdhcyByaWdodC4KCkFjdHVhbGx5LCBJ
IGRpZCByZW1lbWJlciB0byBjaGVjayByaWdodCBhZnRlciBJIHNlbnQgdGhpcyBhbmQgbm90aWNl
ZCB0aGUgc2FtZS4KCkZvciBwb3dlcnBjLCBubyBvbmUgZWxzZSBjYW4gYmUgYm90aGVyZWQgdG8g
Y2FyZSwgc28gbmVpdGhlciBkbyBJLiBJCnRoaW5rIHBvd2VycGMgaGFzIGJlZW4gc3Bld2luZyBk
dGMgd2FybmluZ3MgYnkgZGVmYXVsdCBmb3Igc29tZSB0aW1lCm5vdy4KClJvYgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
