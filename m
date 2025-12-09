Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B679CB052F
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Dec 2025 15:46:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E3C9C1A97C;
	Tue,  9 Dec 2025 14:46:09 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58380C1A97B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Dec 2025 14:46:07 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b79ea617f55so1090183566b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Dec 2025 06:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765291566; x=1765896366;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4fmZfYSUNdsaSTLHpM8yeyepmqTOQi5Ko0nHpOXwYuc=;
 b=fALTJw5QfJ2PPcdcavmZeh/l0vLcBkUDsZxwYvRV6E4lnsq2dJzn1QngYCDjAQkM/B
 jtSHHIMmKW08K1szLSSiQpwVLUB+XqNZnjsVfCQRSJv0f4RywTh/KX7S7RFVlj3EE9A+
 Uxqi2NQW/b+9lb49/V9Qi8kbnXZTXSDqWXHKDk+T/HE5P0HqeCkZmpFo3GvHp+50PUCW
 wQhHJiLV1Ds8si08cACDCKiFvYypQniW8nPHGtUGRWfkX/rkX0eiJ620mNrsrCKJ5jhs
 PAdtekYSpH42W82yKZjnPAEEmBxcd84rsrK0SrPHjr4vMfkoIO9r7ZTehc2eXB0OwTc2
 MX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765291566; x=1765896366;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4fmZfYSUNdsaSTLHpM8yeyepmqTOQi5Ko0nHpOXwYuc=;
 b=ApEA2YX0HaI4/KQuXRP0tTat5O+GPWlZ70ymqUTt942ZvemmmZXZXkzjVr7w8SjLMn
 tqbgRrKJ0jJux14ShbSwmEmwXh78Gg7AVtmqSVmu5zPhFVcCifcoW0B/Yhysokgf9tUN
 qyLpVZHWbPCMVcGxwszHiYYVfe7q3v2enIGQS8ay5UPJGEYjof41bJysJXOabnc7igzd
 IBqe6EZGiZnQPh+Yt+to2/clUicy4hC4bzVFpjfjXyEQMOb99lTck9lMwNLFhR/xcXkA
 wE7b+crQFY+5ubz1e4DDyJx9VpKa3q6fVVSJey2qnnw2v4A2zbrAwLN/4C9XSsJ2K9mo
 B/ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgrXiSnk79cTzWcT30u/mN1wVWLSvjVQKGHOMJyZfLPVh0BQJE+4kudWrZpf/wC20HLOKNZRkPtq/odQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxzEXfUNHemYqyhU0z8tyiQVEPgTejCLGhwRIcIv3EO43VGj01d
 bwVtnyV182YYCdtMerkuLiC2jFAs4HSzX9jkTE2udf6bpHboieW4hNiXT4gcLe6Hx8chMiWhbz9
 GhLDcPrHTzBUmchZhr1x/k4R9FUxnjz0=
X-Gm-Gg: ASbGncutTClsTzMZCCJGQ2Pr9e5spHGBGF3kqDpFVMYOu1gkpTWtUIiXf3hEPuvaOy1
 6joZVPytR+DjIZjgWNscjJUx5JZ7yI6CNQSXBcWBRjhL5hIrDYTRlHr4QPHIko/PVwQe340OL/U
 CKi8gzryZ6iSB7roLQ7YsyItaOi0ker+8SeGDEfNHm0dQ68Bk17RqogkBPad7/b8eAW52326eWP
 WqlW/lFx0zyzH4E3tFxPJJ3EC4BzrvmaieAw/kr+1X+Oi1IzSiDVSl1L3Wk0IpJyHA0/g8cywad
 GsIk40Q4Suh7uNYkPImvt/gAd7uzGolL0EIa3dJxng+/xfXQU7j75SyXQKXu276htuzjsYo=
X-Google-Smtp-Source: AGHT+IGlXu3dCFc83X6xkCFhuuTuzxpgBAzwDgILyS6ZUDAbBGi1U97b1Qfz8jIne/sjhUc3CyUOVqmVWZN3jo3XIyM=
X-Received: by 2002:a17:907:d9e:b0:b73:845f:4432 with SMTP id
 a640c23a62f3a-b7a2455d577mr1325347966b.32.1765291566315; Tue, 09 Dec 2025
 06:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
 <20251209-iio-inkern-use-namespaced-exports-v2-1-9799a33c4b7f@bootlin.com>
In-Reply-To: <20251209-iio-inkern-use-namespaced-exports-v2-1-9799a33c4b7f@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Dec 2025 16:45:29 +0200
X-Gm-Features: AQt7F2rGwi5_TocOmRGciLvaWe8Y7Fghi7KYuOXmk6PhKTOAwIFDPQlb6Jsx554
Message-ID: <CAHp75VcX_z6q879gmWcb76SeFHtqMvpZ=y9PwNn0=eVFb06wAw@mail.gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-phy@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-input@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, David Lechner <dlechner@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, Mariel Tinaco <Mariel.Tinaco@analog.com>,
 linux-hwmon@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matheus Castello <matheus@castello.eng.br>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 linux-mips@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Iskren Chernev <me@iskren.info>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-arm-msm@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org, Kevin Tsai <ktsai@capellamicro.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Peter Rosin <peda@axentia.se>,
 Hans de Goede <hansg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/2] iio: dac: ds4424: drop unused
	include IIO consumer header
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

T24gVHVlLCBEZWMgOSwgMjAyNSBhdCAxMDoyNuKAr0FNIFJvbWFpbiBHYW50b2lzCjxyb21haW4u
Z2FudG9pc0Bib290bGluLmNvbT4gd3JvdGU6Cj4KPiBUbyBwcmVwYXJlIGZvciB0aGUgaW50cm9k
dWN0aW9uIG9mIG5hbWVzcGFjZWQgZXhwb3J0cyBmb3IgdGhlIElJTyBjb25zdW1lcgo+IEFQSSwg
cmVtb3ZlIHRoaXMgaW5jbHVkZSBkaXJlY3RpdmUgd2hpY2ggaXNuJ3QgYWN0dWFsbHkgdXNlZCBi
eSB0aGUgZHJpdmVyLgoKUmV2aWV3ZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5keUBrZXJuZWwu
b3JnPgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
