Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A3FADE9E4
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jun 2025 13:27:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C91E1C36B30;
	Wed, 18 Jun 2025 11:27:21 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BA4FC36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 11:27:21 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54b10594812so7023434e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 04:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750246040; x=1750850840;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hC/rxmNEx7lBs7LXqlf7wlayqnKtYiiYbKP9iLo7bEA=;
 b=xORKGAfFKpQ5q9jicKsDHoth4PAVDFbwzosb5Auspw2req9B4GTFIvX4KJbdM63oc+
 9MntxhZ514ApwC7uqrQ2PAJU7Lpuvg+LQC2xl+A3etetB2i8jdgXEgQVrb6QHd7zJyNl
 myIM2GCbOHhtQ38gwHl1h2pRdBI31EMtMVwvZ58mRvVtr4sfdBEXsVLDwTaOja6dyeKc
 DB5J3rVCq6ebWpquNVy6+3L/9Up7kL5bD/MY4i1d6bkUfCYh+e5TrMr7GQoWNv2lVZ9m
 MzkoyFLYjilTIAYPhuk7SY962yv6/XACgDV1KsH9op2n4gZU6syrfsQpORL/pzyuqAHZ
 Et8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750246040; x=1750850840;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hC/rxmNEx7lBs7LXqlf7wlayqnKtYiiYbKP9iLo7bEA=;
 b=wydYWrMTPQ4ZIJIWdbyQIxB5Da5WlgDfpptru4lnzgLXFFWA3oiaVxri75RozxuqhI
 5NgYoKgOcXcfPDhkE/mz4mXyyhG4ztX9atsKVlMfXsdL9nPnoCT7gmMgT29JcAxuZIdm
 wc6MbRyo1aNPonAZDK6ZOesKRyAeUCpOwJYdK8IjV/pAR6IjrVAOPzp8rfNSxTBsIWdw
 imK7yLOQhYedhu5oUNI1r5+T+ED3c0Usoi2ONLFiB/AnmXaJBDBA+7g5JnrhcaegL2LO
 1lkm2i7kQsZsQ7bHeFW6r5CeP0EZPHauZGa5JrCoqYp4dhd22lYGZFpzKigF7QxN57sN
 kB0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbdHInvJEq+tMIwhjzzTDVw8EnEeiS8ug0Cp5QK1Ce9tMCZZsNMCSq8XyPZy8VV+WYoVUhElaESY/eIg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzwW65iUkBrJg0KSpfd7IszqiMAdtQ1AOSPAUqh9DPwGOwEcuOd
 AAdmbIUOMzgN82UZW0xxP39K82reKpwAhB1JCTXBx+L9K0G22tL8eR5JAP94XzZnsckhd1IdFUj
 fffXnL6eVNHTaPjYWCA45SgYFLp9adtIGns0IXV0mqA==
X-Gm-Gg: ASbGncsWDOT5CoZdaCUHbq/jkAGT1wfIv1EOxIDkNvtyBkTlyW3ngOL08462G8ivsxN
 mNQs8enwnh0i2UI5OJ+4cvXo91h6vAGL8uUKnJRaVm8HYfbkwRps78s7vNteRTrvDt/taFQy3Ql
 K71kIu2NKrMlK2Qaa+eNB2cumYAmhYTjjQC621FqHeJtM=
X-Google-Smtp-Source: AGHT+IH9N3s8eV4QAoWcV3ZISC8T6rNpJ4leRaY7YHuJFlZ4bPXaxx7Hzh/4jfbIVAzp1tapzbe+4WLXZFpaeF/7BEk=
X-Received: by 2002:a05:6512:39c8:b0:553:2bf7:77ac with SMTP id
 2adb3069b0e04-553b6f15af6mr5016567e87.41.1750246040209; Wed, 18 Jun 2025
 04:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 13:27:09 +0200
X-Gm-Features: AX0GCFuhKOslIDouO5PgG3-FBiOJa3cs6VfF8AgbesblIRkK52-2f8uLA9uvwos
Message-ID: <CACRpkdb1YqS00tEeyAUTjjJ-EQQbH5wfE8QzZt-UFwQYCfNHRg@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Tali Perry <tali.perry1@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-aspeed@lists.ozlabs.org, Emil Renner Berthing <kernel@esmil.dk>,
 linux-rtc@vger.kernel.org, Jesper Nilsson <jesper.nilsson@axis.com>,
 Benjamin Fair <benjaminfair@google.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, Hal Feng <hal.feng@starfivetech.com>,
 Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
 linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org,
 Lars Persson <lars.persson@axis.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Scott Branden <sbranden@broadcom.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com
Subject: Re: [Linux-stm32] [PATCH v2 00/17] pinctrl: Constify pointers to
	'pinctrl_desc' and more
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgODoxNOKAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IENoYW5nZXMgaW4gdjI6Cj4g
LSBBZGQgUmIgdGFncwo+IC0gUGF0Y2ggIzE6IHJlcGhyYXNlIGNvbW1pdCBtc2cgKEdlZXJ0KQo+
IC0gUGF0Y2ggIzI6IGZpeC9yZXF1aXJlIGRlcGVuZGVuY3kgb24gT0YKPiAtIExpbmsgdG8gdjE6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA1MjgtcGluY3RybC1jb25zdC1kZXNjLXYx
LTAtNzZmZTk3ODk5OTQ1QGxpbmFyby5vcmcKPgo+IERlc2NyaXB0aW9uOgo+IC0tLS0tLS0tLS0t
LQo+IEluIHNldmVyYWwgZHJpdmVycyBwb2ludGVycyB0byAnc3RydWN0IHBpbmN0cmxfZGVzYycg
aXMgbm90IG1vZGlmaWVkLCBzbwo+IHNpbmNlIGNvcmUgZG9lcyBub3QgbW9kaWZ5IGl0LCBpdCBj
YW4gYmUgbWFkZSBhcyBjb25zdC4KPgo+IERlcGVuZGVuY2llcy9tZXJnaW5nOgo+IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+IFBhdGNoICM0ICJwaW5jdHJsOiBDb25zdGlmeSBwb2ludGVycyB0byAn
cGluY3RybF9kZXNjJyIgaXMgYQo+IHByZXJlcXVpc2l0ZSBmb3IgYWxsIGZ1cnRoZXIgcGF0Y2hl
cywgaW5jbHVkaW5nIFJUQyBwYXRjaCwgdGhlcmVmb3JlCj4gcHJvYmFibHkgZXZlcnl0aGluZyBz
aG91bGQgYmUgdmlhIG1haW4gcGluY3RybCB0cmVlLgoKUGF0Y2hlcyBhcHBsaWVkIQoKWW91cnMs
CkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
