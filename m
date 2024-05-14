Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 548BB8C4D18
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2024 09:33:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03CBFC5E2D1;
	Tue, 14 May 2024 07:33:23 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 653E0C5E2CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2024 07:33:16 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-61af74a010aso49563817b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2024 00:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715671995; x=1716276795;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C4wW5aa4W2kv01Iu3rTlOfBD8ed5XWvkaDVuJNLIYTA=;
 b=gc1/oPv4/7wO2f2SQC/xeu2eYHb1Pf7WKb78MNM+8+mWN+2C9s6EPRXW7OEwr4mPBu
 MaBguzbb799BLCCIpW2yytZapSGV9eSNrbEK+wtALksu82piUOGyvJmq4T/ZYAABJlaU
 yVYEK48MvW50SAHeYd4QgxrkSB3YS2UHnTtQjMEAi64ajsUv/MCkxICSd/pTdVXlB/A3
 8cTq+j68wwdBKUmJcYAZOFKD5A9np2ymZeZBqXgFI4TNvn05q7xURmyWqM+N1GJNUikC
 om5k6UOid+R7lJh0JTdDlKQbTFfDQAyaKjLhumtfDTdUFnij4tAnVmhI/BzEP9EA/DMy
 Pbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715671995; x=1716276795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C4wW5aa4W2kv01Iu3rTlOfBD8ed5XWvkaDVuJNLIYTA=;
 b=MoT22VXZPIa2uW0aCHJBsMPpTy5LQed6FjyF+WC5vtz8cKINcTe6nQ4VWXy6/tzZTJ
 J8viR3zc5VROHCm8DI+x9VwgwdYn7o+a7P0yNNeVKFCwTWYXnGVheuNwB4BAU/yiu1oQ
 620g/5Nl23B5CGp3OkEUornXdwl4qO5tbU2W8w8JNd//ZG4dlsGGRmAq5ScmV7NEx5zV
 hDp94cyek+955jeDrEexaPjOJiIb8Mh9pqLTmAwbISCbFyFb54xIwlA38UPPIgQuWNxV
 5+ixkm3ly1/0XRytEzkkFPiuxJrYTdxiUzv3vMFN3SQixcP9RoAgCh03b0Q7f2EkdSTN
 dIgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBF+hrbxIMsQEyWJ39rv8QjlzXeo60nPuDmvYikUSYzRHsN7tib844pPfpki/DbGKVfZVMYiGcSNIIqk2G6R8+STCHpBZ/X0cBEni4p6HRPl/a+EHtPyok
X-Gm-Message-State: AOJu0YycIUQW0FQCt42EMlgnNXn/ueUQYswB22iOdqzc0dm78V8Skkfl
 jQ4u9OZvP07nPvjBPSqD3WgewPieulaNiws9/Ag0zg6jtoCvGh3Py1erzAqDVdu7qbRZu4c2ECj
 qlWxVwZ+uASu4moS6ITUdp/e2EzTbJzC78OVCgQ==
X-Google-Smtp-Source: AGHT+IEj9rSUWA94F6VFaCC7a26gta7P6jlgI2cpDV7q9j/kgYnlADA3j4AJ721URmKt02c8jgw6oM4ErSC0l+EyUGQ=
X-Received: by 2002:a0d:cbd1:0:b0:61b:3356:d28c with SMTP id
 00721157ae682-622aff92355mr116464607b3.2.1715671995199; Tue, 14 May 2024
 00:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
 <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
 <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
In-Reply-To: <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 May 2024 09:33:03 +0200
Message-ID: <CACRpkdYS8=cHT=7tGbzWZ73jbLhjqdpssbaHH-qREe=bcHYe2A@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Peng Fan <peng.fan@nxp.com>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-samsung-soc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jacky Bai <ping.bai@nxp.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chester Lin <chester62515@gmail.com>,
 "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>,
 Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, soc@kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 linux-riscv@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 07/20] pinctrl: renesas: Use scope
	based of_node_put() cleanups
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

T24gVHVlLCBNYXkgMTQsIDIwMjQgYXQgODozNuKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgoKPiA+IERvZXMgdGhpcyBnbyBpbnRvIHRoZSBSZW5l
c2FzIHBhdGNoIHN0YWNrPwo+ID4KPiA+IEkgdGhpbmsgdGhlIHBhdGNoIHN0YW5kcyBmaW5lIHdp
dGhvdXQgdGhlIHJlc3Qgb2YgdGhlIHNlcmllcy4KPgo+IFN1cmUsIEkgY2FuIGRvIHRoYXQuCgpQ
bGVhc2UgYXBwbHkgaXQhCgo+IEZyb20geW91ciBwb3NpdGl2ZSByZXNwb25zZSB0byB2MSwgSSB0
aG91Z2h0IHRoYXQgcGVyaGFwcyB5b3UganVzdAo+IHdhbnRlZCB0byB0YWtlIHRoZSBmdWxsIHNl
cmllcyB5b3Vyc2VsZj8KClNvcnJ5LCBJIGFsd2F5cyBwcmVmZXIgc3VibWFpbnRhaW5lcnMgdG8g
cGljayB0aGVpciBzdHVmZiwgdGhleQprbm93IHdoYXQgdGhleSBhcmUgZG9pbmcgYW5kIHRoZXkg
Y2FuIHRlc3QgdGhlIGVudGlyZSBwYXRjaApzdGFjayBwcm9wZXJseS4KCllvdXJzLApMaW51cyBX
YWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
