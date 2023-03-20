Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9596C2278
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 21:22:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF878C6A603;
	Mon, 20 Mar 2023 20:22:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B05FEC6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 20:22:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76465617EC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 20:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5DDC4339E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 20:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679343762;
 bh=DsQcH8xwycCkHIQ8QfvnCvZGiwQiVzM3IGKlFw3c6vs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=C0iv1Wn2Pa5vHsqdFDR6zw0f6xRpMK70/N1T2glolnKQ3YLIxVa9NLi/VD/MuIgDD
 AMlrJgSTLVgGIpOVJF1+Ghunoe4Mbsb67QPp53znrKW3xqS69cxFryb/04xLE/z2UL
 cYlidr2lmoh4xOWy5u90QTZdPEyL7HL6T0jBjSwd5lfJMMfoBUHFNLgIBWf0S+srxu
 QZQgZ6OIkcxVFR1EjRm8zUOSHLQaN3IU6e6CbVR9+h6qLlj6H177msFp2UNHRvKiJl
 8K9FZ0cUgUsllPY3vklbGfqakT/9Rif52mfARdFAsLbORk70Elf2bjYltEQCF1V5q6
 z2BOKHQPJU6XQ==
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-5418d54d77bso244277577b3.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 13:22:42 -0700 (PDT)
X-Gm-Message-State: AO0yUKXr4gCXXxSggcBfiX9/VYQ9MWA56Is/uqZjJOeAphPdRDz0mgJm
 MtAzTvK/47NZB/TEJXrSpYB0ZoK2hro3W6+tYA==
X-Google-Smtp-Source: AK7set9FJ+m1VwanpiAMfxA818L7HV/dPyhWg6DYQSadevXyKErLiGfJvZlidEnREDYwVbhCFXXRZvTZAhJh0VfOM4I=
X-Received: by 2002:a1f:28c4:0:b0:436:2fa4:e25d with SMTP id
 o187-20020a1f28c4000000b004362fa4e25dmr363729vko.3.1679343741554; Mon, 20 Mar
 2023 13:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233605.3967621-1-robh@kernel.org>
In-Reply-To: <20230317233605.3967621-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 20 Mar 2023 15:22:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK+Q5HS=0PqnA60gV43O7ymxhPH-WHKFJKpQMYe5KfEfg@mail.gmail.com>
Message-ID: <CAL_JsqK+Q5HS=0PqnA60gV43O7ymxhPH-WHKFJKpQMYe5KfEfg@mail.gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>, 
 Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 Wolfgang Grandegger <wg@grandegger.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Michal Simek <michal.simek@xilinx.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 Tobias Waldekranz <tobias@waldekranz.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, 
 UNGLinuxDriver@microchip.com, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-can@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: net: Drop unneeded quotes
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

T24gRnJpLCBNYXIgMTcsIDIwMjMgYXQgNjozNuKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gQ2xlYW51cCBiaW5kaW5ncyBkcm9wcGluZyB1bm5lZWRlZCBxdW90
ZXMuIE9uY2UgYWxsIHRoZXNlIGFyZSBmaXhlZCwKPiBjaGVja2luZyBmb3IgdGhpcyBjYW4gYmUg
ZW5hYmxlZCBpbiB5YW1sbGludC4KPgo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9hY3Rpb25z
LG93bC1lbWFjLnlhbWwgIHwgIDIgKy0KPiAgLi4uL2JpbmRpbmdzL25ldC9hbGx3aW5uZXIsc3Vu
NGktYTEwLWVtYWMueWFtbCAgICAgfCAgMiArLQo+ICAuLi4vYmluZGluZ3MvbmV0L2FsbHdpbm5l
cixzdW40aS1hMTAtbWRpby55YW1sICAgICB8ICAyICstCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL25ldC9hbHRyLHRzZS55YW1sICAgICAgICAgIHwgIDIgKy0KPiAgLi4uL2JpbmRpbmdzL25l
dC9hc3BlZWQsYXN0MjYwMC1tZGlvLnlhbWwgICAgICAgICAgfCAgMiArLQo+ICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9uZXQvYnJjbSxhbWFjLnlhbWwgICAgICAgICB8ICAyICstCj4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9icmNtLHN5c3RlbXBvcnQueWFtbCAgIHwgIDIgKy0KPiAg
Li4uL2JpbmRpbmdzL25ldC9icm9hZGNvbS1ibHVldG9vdGgueWFtbCAgICAgICAgICAgfCAgMiAr
LQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvY2FuL3hpbGlueCxjYW4ueWFtbCAgICB8
ICA2ICsrKy0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvZHNhL2JyY20sc2YyLnlh
bWwgICAgICB8ICAyICstCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9kc2EvcWNhOGsu
eWFtbCAgICAgICAgIHwgIDIgKy0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2VuZ2xl
ZGVyLHRzbmVwLnlhbWwgICAgfCAgMiArLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQv
ZXRoZXJuZXQtcGh5LnlhbWwgICAgICB8ICAyICstCj4gIC4uLi9iaW5kaW5ncy9uZXQvZnNsLHFv
cmlxLW1jLWRwbWFjLnlhbWwgICAgICAgICAgIHwgIDIgKy0KPiAgLi4uL2JpbmRpbmdzL25ldC9p
bnRlbCxpeHA0eHgtZXRoZXJuZXQueWFtbCAgICAgICAgfCAgOCArKysrLS0tLQo+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9uZXQvaW50ZWwsaXhwNHh4LWhzcy55YW1sICB8IDE0ICsrKysrKyst
LS0tLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9tYXJ2ZWxsLG12dXNiLnlhbWwg
ICAgIHwgIDIgKy0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L21kaW8tZ3Bpby55YW1s
ICAgICAgICAgfCAgMiArLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvbWVkaWF0ZWss
bmV0LnlhbWwgICAgICB8ICAyICstCj4gIC4uLi9iaW5kaW5ncy9uZXQvbWVkaWF0ZWssc3Rhci1l
bWFjLnlhbWwgICAgICAgICAgIHwgIDIgKy0KPiAgLi4uL2JpbmRpbmdzL25ldC9taWNyb2NoaXAs
bGFuOTY2eC1zd2l0Y2gueWFtbCAgICAgfCAgMiArLQo+ICAuLi4vYmluZGluZ3MvbmV0L21pY3Jv
Y2hpcCxzcGFyeDUtc3dpdGNoLnlhbWwgICAgICB8ICA0ICsrLS0KPiAgLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvbmV0L21zY2MsbWlpbS55YW1sICAgICAgICAgfCAgMiArLQo+ICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9uZXQvbmZjL21hcnZlbGwsbmNpLnlhbWwgICB8ICAyICstCj4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9uZmMvbnhwLHBuNTMyLnlhbWwgICAgIHwgIDIgKy0KPiAg
Li4uL2JpbmRpbmdzL25ldC9wc2UtcGQvcG9kbC1wc2UtcmVndWxhdG9yLnlhbWwgICAgfCAgMiAr
LQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcWNvbSxpcHE0MDE5LW1kaW8ueWFtbCB8
ICAyICstCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9xY29tLGlwcTgwNjQtbWRpby55
YW1sIHwgIDIgKy0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3JvY2tjaGlwLGVtYWMu
eWFtbCAgICAgfCAgMiArLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21h
Yy55YW1sICAgICAgICB8ICAyICstCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zdG0z
Mi1kd21hYy55YW1sICAgICAgIHwgIDQgKystLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9u
ZXQvdGksY3Bzdy1zd2l0Y2gueWFtbCAgICB8IDEwICsrKysrLS0tLS0KPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvbmV0L3RpLGRhdmluY2ktbWRpby55YW1sICAgfCAgMiArLQo+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9uZXQvdGksZHA4MzgyMi55YW1sICAgICAgICB8ICAyICstCj4gIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC90aSxkcDgzODY3LnlhbWwgICAgICAgIHwgIDIgKy0K
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3RpLGRwODM4NjkueWFtbCAgICAgICAgfCAg
MiArLQo+ICAzNiBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCA1MyBkZWxldGlvbnMo
LSkKClNlbmRpbmcgYSB2MiBhcyB0aGVyZSBhcmUgYSBmZXcgbW9yZSBjYXNlcyB3aXRoICRpZCBh
bmQgJHNjaGVtYSBxdW90ZWQuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
