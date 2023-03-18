Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 182976BF8E6
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Mar 2023 09:21:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8841C69073;
	Sat, 18 Mar 2023 08:21:10 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28A5CC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Mar 2023 08:21:09 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 a23-20020a4ad5d7000000b005250867d3d9so1131880oot.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Mar 2023 01:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679127668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ok0/fcUUjYf3VJvre1cNZ96FcwH4JhSJwBxsOnlRNhc=;
 b=rI/3mCs4GvQtcY0YGO2CDRgjYKkO19YPybUjTD2H/YU0zWRkc4A/mW4OcUngtpqiHo
 2/+Yywbqr11ZwicXhYkiW7uzty6DzTgHnBs6BwNNSiBqy5wA/YqyygRueXSjHIGy/DZ9
 yok8H8GTCT+hS4eC5uucxyLUFfDLQ3aaTEK8wp2o3HGwr394pMYRDtpt6u0zl7bYWfOG
 2RrcYoreDfPSwYCF7wvc4NQwoITvnE2S7BEKLdBPBWjoELHb+CwRe+I2/dRj/Dat/d8t
 k51JZPPLB8vRd/vKhMM1QmqTmK2+59pA5pvbLRci5wWhYB+yzw6E4GL6zw6SB/PQ1gkW
 XK+A==
X-Gm-Message-State: AO0yUKUo8b3Vwlm/LqFIBHdwm0vWAz1lJmgeQu9wC4hTrSUDLtg7ZNVU
 TZx6OHC4rm3mfynunYKTtQACkGm4+fjntw==
X-Google-Smtp-Source: AK7set+fex5DlNu3MvQAfi1nr0BRqWebznMr/piYleSmGd7sS2Bx+aMWqxVbgRzg/Hh+O8FBxze5UQ==
X-Received: by 2002:a4a:1e42:0:b0:525:1e3d:220c with SMTP id
 63-20020a4a1e42000000b005251e3d220cmr747666ooq.6.1679127667576; 
 Sat, 18 Mar 2023 01:21:07 -0700 (PDT)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com.
 [209.85.167.180]) by smtp.gmail.com with ESMTPSA id
 y1-20020a4ad641000000b00525270c233asm1621542oos.39.2023.03.18.01.21.06
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Mar 2023 01:21:07 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id bj30so5461309oib.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Mar 2023 01:21:06 -0700 (PDT)
X-Received: by 2002:a5b:c47:0:b0:b56:1f24:7e9f with SMTP id
 d7-20020a5b0c47000000b00b561f247e9fmr897441ybr.12.1679127645593; Sat, 18 Mar
 2023 01:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233623.3968172-1-robh@kernel.org>
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 18 Mar 2023 09:20:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU8uu=2EZ1dmtY-eGj+ORGdepsKgpNcL7qKfW3FkVJw7g@mail.gmail.com>
Message-ID: <CAMuHMdU8uu=2EZ1dmtY-eGj+ORGdepsKgpNcL7qKfW3FkVJw7g@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
X-Topics: 
Cc: alsa-devel@alsa-project.org, Sean Wang <sean.wang@kernel.org>,
 Jacky Bai <ping.bai@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 linux-aspeed@lists.ozlabs.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, asahi@lists.linux.dev,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Fabio Estevam <festevam@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Heiko Stuebner <heiko@sntech.de>,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Samuel Holland <samuel@sholland.org>, openbmc@lists.ozlabs.org,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-sunxi@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sven Peter <sven@svenpeter.dev>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Andrew Jeffery <andrew@aj.id.au>, Dvorkin Dmitry <dvorkin@tibbo.com>,
 Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 linux-riscv@lists.infradead.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com,
 Wells Lu <wellslutw@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
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

T24gU2F0LCBNYXIgMTgsIDIwMjMgYXQgMTI6MzfigK9BTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IENsZWFudXAgYmluZGluZ3MgZHJvcHBpbmcgdW5uZWVkZWQgcXVv
dGVzLiBPbmNlIGFsbCB0aGVzZSBhcmUgZml4ZWQsCj4gY2hlY2tpbmcgZm9yIHRoaXMgY2FuIGJl
IGVuYWJsZWQgaW4geWFtbGxpbnQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgoKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yZW5lc2Fz
LHBmYy55YW1sICAgICAgIHwgIDIgKy0KPiAgLi4uL2JpbmRpbmdzL3BpbmN0cmwvcmVuZXNhcyxy
emExLXBvcnRzLnlhbWwgICAgICAgICAgIHwgIDIgKy0KPiAgLi4uL2JpbmRpbmdzL3BpbmN0cmwv
cmVuZXNhcyxyemEyLXBpbmN0cmwueWFtbCAgICAgICAgIHwgIDIgKy0KPiAgLi4uL2JpbmRpbmdz
L3BpbmN0cmwvcmVuZXNhcyxyemcybC1waW5jdHJsLnlhbWwgICAgICAgIHwgIDIgKy0KPiAgLi4u
L2JpbmRpbmdzL3BpbmN0cmwvcmVuZXNhcyxyem4xLXBpbmN0cmwueWFtbCAgICAgICAgIHwgIDIg
Ky0KPiAgLi4uL2JpbmRpbmdzL3BpbmN0cmwvcmVuZXNhcyxyenYybS1waW5jdHJsLnlhbWwgICAg
ICAgIHwgIDIgKy0KCkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNA
Z2xpZGVyLmJlPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
