Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACC374570F
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jul 2023 10:14:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7260C6B45A;
	Mon,  3 Jul 2023 08:14:18 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CD2FC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jul 2023 08:14:17 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-471b3ad20e1so1023362e0c.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Jul 2023 01:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688372056; x=1690964056;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=11QJYwMbaUBpF9NueY3t6DsMt9/06w7p8RRvTfLIaJc=;
 b=L0Xoku72iyScuyAAlvdURXBApKe96vcZyauApjEXYrGVlSdQ5+Noqx/dJGtVL5x6q/
 jlFR5a9BhO9sA8f3jeglFFz63W5kpnijEXV3GbujV4lA4VrnyUUly7d3Wcix3txlUZKX
 0zTnULX0ieClGA2akWPTDF84ad2rXwBO7fEXhu1OYcHAAKgyVmkRs6hX/zxDaek+K+yy
 +Dq303IKCVITitnmnDhFbe5F+dSDTjXUpTQlniD7u22PH7eeed9b8JO4qs6ZdKwCYj/I
 dMxjHx7kBRx/dGnktAFbMiPelHl/QS1H0Ujo5z344HSwUz0dNoig8gIxg/cBlzWUnRon
 rbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688372056; x=1690964056;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=11QJYwMbaUBpF9NueY3t6DsMt9/06w7p8RRvTfLIaJc=;
 b=K0H1yMovFZHx2/fk/UOertO8XSmG1g1IiKBRr3FGBe13vhHbbwYX+t8HawKz5Zfafc
 4B4/bLQiK62CbNoQ/jQ9+xM3TJisM+tbTARj1t5HRt9tv2maeWa4UXsaW9E4s8pmI9XP
 VUEWe83SCNeCo/WXOZxRLTHjQAaP7K7pS5l2i4GC1Zy14lqYEkOKS2S24brhk8j5ytQJ
 COBl24r5R1/0H8l2Th0Ne8im2XysKInbgnkEoMRlsT2zuLxEJGHWm/E5Hfbv3VK3GttK
 Dtn4CEiIVG4hKDf3U1iHnx5PFdUcqrf/n9BOtdS6TAWM7Z12qJiumTj1oeHBL51cexxh
 9y7g==
X-Gm-Message-State: ABy/qLbPtdDkIq11JU5VV7Y+6P+zOyvRfirlSRAuTopXiHF6+6bDB+wy
 a+AYy4RaRLGA0BvUx8VySa09clpEqrqQlZU1EJqAgA==
X-Google-Smtp-Source: APBJJlGUXmmzazOU3H2rwPItzzs5yY59Pr2doU3bzs7pqr02Nwa0JTfP80SKVHXrdbTVZhHGNnsVQtkzPqxhjzQX+Tw=
X-Received: by 2002:a1f:c1d0:0:b0:471:5939:f4f2 with SMTP id
 r199-20020a1fc1d0000000b004715939f4f2mr3056599vkf.8.1688372056011; Mon, 03
 Jul 2023 01:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-11-fb6ab3dea87c@linaro.org>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-11-fb6ab3dea87c@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Jul 2023 10:14:04 +0200
Message-ID: <CAMRc=McTEPt_gb5HX98khmxvQDX-VQQ62uBF=p4dr_QqouL0kQ@mail.gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Daniel Golle <daniel@makrotopia.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andy@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-oxnas@groups.io,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 11/15] dt-bindings: gpio: gpio_oxnas:
	remove obsolete bindings
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

T24gRnJpLCBKdW4gMzAsIDIwMjMgYXQgNjo1OOKAr1BNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IER1ZSB0byBsYWNrIG9mIG1haW50ZW5hbmNl
IGFuZCBzdGFsbCBvZiBkZXZlbG9wbWVudCBmb3IgYSBmZXcgeWVhcnMgbm93LAo+IGFuZCBzaW5j
ZSBubyBuZXcgZmVhdHVyZXMgd2lsbCBldmVyIGJlIGFkZGVkIHVwc3RyZWFtLCByZW1vdmUgdGhl
Cj4gT1g4MTAgYW5kIE9YODIwIGdwaW8gYmluZGluZ3MuCj4KPiBBY2tlZC1ieTogS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+IEFja2VkLWJ5OiBM
aW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gQWNrZWQtYnk6IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gQWNrZWQtYnk6IERhbmllbCBHb2xsZSA8ZGFuaWVs
QG1ha3JvdG9waWEub3JnPgo+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPgo+IC0tLQoKQWNrZWQtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kg
PGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
