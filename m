Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF16B6C054D
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Mar 2023 22:15:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2F0CC6A5E7;
	Sun, 19 Mar 2023 21:15:01 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E76ADC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 21:15:00 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id x198so1167977ybe.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 14:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679260500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o0iorqXQgWfUsmZ323+Wyn0oeyKtqb16TQ+B351+3qA=;
 b=PqJlDX0gTYbEtn8Inp0Uq9s7u/HTYqGjD1dgyn2nK1HN81qzYpJ9YK87P3/GK9pyjS
 NIox5xD6dYqMCgOx32vaNV7CStlqriTHBcn+xVBoWVHv64f9OkeU7yqIs+ePEjrucDlf
 hLYQeSFr+uU2/M2tfVJ5lrNZIIQBGZMUOQR/x/Pb64/87ScadQHktjIXmYzf0soAd8Cm
 1/vXcIPIvmyXhvwjyg9zJXzO53/CrLg2sarThltEBai116bRrT//SIC4+loKJSCgmFoX
 qFt40qfje7rzwaijTzBX1bDxUpXmUPSUnzUEnrOEFINsNM2XFX8efE0qIlI4ANoUsKOX
 jQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679260500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o0iorqXQgWfUsmZ323+Wyn0oeyKtqb16TQ+B351+3qA=;
 b=ryeodKqQoDWTDMMduRO4DWjNWnBy0BpbJGGHUKnj4ZiQfNfjll1lR9tQLW+wKRSj/6
 iol5W9rCknU4kzPXk2yylPHjFVlV09hbz4VGLBkTRwZjIXFEPiU5kFrDUwYOT9jFRGGO
 FrtC8aA74UTOoiIAIMdGcQv3nJtxbeCOryk6GisjUiiyZfnNQzspXT4umBK2m1u2rxJw
 Nvi3uxZmFg34ojKSREW3GG2EGyVHZAWH6jPW+MQ1NQIydKK6Pk69ohk52I/GmmWENQFU
 6FqjQR4gxj5roemE1Z73/ysRboxYk5WCP6LWQ4y8c/18gqOLq/V8nDzyh3X2TSBxoXo9
 EkHA==
X-Gm-Message-State: AO0yUKU5+mm1SyjkY6E8XpRRs1VsFMR+BwKtKTyIp7sJ3SjKpggoB/5m
 Lgc7bkyF4RaQLjtQNA6DIY7JnRgLuAU3cvRTPHa/Dw==
X-Google-Smtp-Source: AK7set88lgxJVA166ieuR2TTLZeS1J0rp7AfomiAt3xMAZzNkfr7DVMxQnogtWZ9zBjTSPGk/rTQReVq7hLkbmXRmbU=
X-Received: by 2002:a05:6902:1143:b0:aa9:bd2e:3746 with SMTP id
 p3-20020a056902114300b00aa9bd2e3746mr2997588ybu.4.1679260499808; Sun, 19 Mar
 2023 14:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233623.3968172-1-robh@kernel.org>
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 19 Mar 2023 22:14:48 +0100
Message-ID: <CACRpkdYFJ-q9OT2b7U-CP08XGfdoD-qN3k3C2KBHhnuBdfSi7A@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
X-Topics: 
Cc: alsa-devel@alsa-project.org, Sean Wang <sean.wang@kernel.org>,
 Jacky Bai <ping.bai@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomasz Figa <tomasz.figa@gmail.com>, linux-aspeed@lists.ozlabs.org,
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

T24gU2F0LCBNYXIgMTgsIDIwMjMgYXQgMTI6MzbigK9BTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKCj4gQ2xlYW51cCBiaW5kaW5ncyBkcm9wcGluZyB1bm5lZWRlZCBxdW90
ZXMuIE9uY2UgYWxsIHRoZXNlIGFyZSBmaXhlZCwKPiBjaGVja2luZyBmb3IgdGhpcyBjYW4gYmUg
ZW5hYmxlZCBpbiB5YW1sbGludC4KPgo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+CgpMZXNzIGJhZCBleGFtcGxlcyA9IGdvb2QuCgpSZXZpZXdlZC1ieTogTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxl
aWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
