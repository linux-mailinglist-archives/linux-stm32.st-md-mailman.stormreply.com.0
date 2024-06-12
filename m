Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D96904E35
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jun 2024 10:34:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83E07C712A3;
	Wed, 12 Jun 2024 08:34:26 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 973D0C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2024 08:34:19 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-5b52b0d0dfeso3261498eaf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2024 01:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=melexis.com; s=google; t=1718181258; x=1718786058;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GRlEpNQ1vOAfspdoLRmjbH1WiL/9+2xtBIbJoKzaPig=;
 b=RgjbsPmWpSOgegqz4h10JzN/5vBzzOhQjV7AHFkN4hDu+Mp1YVAr7iDky25DhQMM8G
 GsuPy27gvpowsljOhr3OvyoJ3/dMWuTVCq3U5bmgDI3rlSFwcE2S9xmrlQ5F5W+t5/Jk
 e1qV6fjxbnp9CVVcY8XvfVBWRKtCUw47lLF9swEh2bIfjyarRtQl7BQCQC2Z41KGwuT1
 GWbgjGsiRH0J/XKR30+oasy7GhFAoX6/qWGlHHuDhWdztSuKe5h2y7RujRg8WBH4uuSd
 GKfM442fQNz/PagS/Xvhi769PQF0SsHqDxmlJcR6fpq2q+fj/PSTTvo6FzXF2KX2Dcti
 +RZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718181258; x=1718786058;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GRlEpNQ1vOAfspdoLRmjbH1WiL/9+2xtBIbJoKzaPig=;
 b=hgCtUq5cXG6i8HCxtuCixUTdNZVVyM830ycJolncrk+NbTUCXCXWbTukwWumw2Lyeb
 47bqwCQnTAKHcysIW0On/otfubnUNZN5ur8T+nN6Q1YZAUicycON56vDdjPGyVWhIiJk
 4q96Dai7PnywlNwnq09OeY+sIfA2SO8dY1p8fdNr+EVONmBvQLmnB6rI+tfEUEIOC30x
 ElwnK74VxX299i4p+fJzOACwCJTYoWw7u9sE59wzjqMTM2GePUiwDdSn1rULsy9AB38c
 yfADE9nqAAWdwrDoI/JDsNODMq90lSr4yRd/SAsiwJLRgFLSJRhYLgqbhLuZJJqgKb/g
 WMzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWekAozuubXKfiHROAi+pD3bAt2JJPiocOkVv5x21cwb4tZ1r7C1FsuR9GKKGEO6i6d/4dk+mSSgNBLfWO/gTb64ZnyaDG2f3CNuPvh0X1WSBXx7qPQZVq3
X-Gm-Message-State: AOJu0YyoAB94f8df7kVaCNNiwTYJ2Aeia4UbB0DRNGab3EnJrzKJrFQ/
 RksaoGwgix2peTCwXMT98PPjf4ZEe9iKDj9U9r5/FaLqk22z7esWGH7EOJQ/ITlXwZUYuAQHIfQ
 Ib+aDzYb2fMwh5iyEfOY8HPWBtSNkcy7ngQL6
X-Google-Smtp-Source: AGHT+IF2c1FL0fqOMuwGFXItue1Pz8K0VY5CQ9QXgEnYWVlMd7GYFa+wcDzIz9YylVcb2zSif5XgvNLrC8xGpqwxyEQ=
X-Received: by 2002:a05:6870:b625:b0:250:7973:8092 with SMTP id
 586e51a60fabf-25514ef5f86mr1113389fac.56.1718181257361; Wed, 12 Jun 2024
 01:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240611165214.4091591-1-tgamblin@baylibre.com>
In-Reply-To: <20240611165214.4091591-1-tgamblin@baylibre.com>
From: Crt Mori <cmo@melexis.com>
Date: Wed, 12 Jun 2024 10:33:40 +0200
Message-ID: <CAKv63usQDFuz9s06GNTq=3fzYm-OVPAxgxwxTNEw6zw2rYxyig@mail.gmail.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-amlogic@lists.infradead.org,
 Lucas Stankus <lucas.p.stankus@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [RESEND][PATCH] iio: simplify with
	regmap_set_bits(), regmap_clear_bits()
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

Rm9yIG1seDkwNjMyIHBhcnQKQWNrZWQtYnk6IENydCBNb3JpIDxjbW9AbWVsZXhpcy5jb20+CgpU
aGFua3MgZm9yIHRoZSB1cGRhdGUuCgpPbiBUdWUsIDExIEp1biAyMDI0IGF0IDE4OjUyLCBUcmV2
b3IgR2FtYmxpbiA8dGdhbWJsaW5AYmF5bGlicmUuY29tPiB3cm90ZToKPgo+IFNpbXBsaWZ5IHRo
ZSB3YXkgcmVnbWFwIGlzIGFjY2Vzc2VkIGluIGlpbyBkcml2ZXJzLgo+Cj4gSW5zdGVhZCBvZiB1
c2luZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB0aGUgbWFzayB0d2ljZSwgdXNl
Cj4gcmVnbWFwX3NldF9iaXRzKCkuCj4KPiBJbnN0ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRhdGVf
Yml0cygpIGFuZCBwYXNzaW5nIHZhbCA9IDAsIHVzZQo+IHJlZ21hcF9jbGVhcl9iaXRzKCkuCj4K
PiBTdWdnZXN0ZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5bGli
cmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJy
ZS5jb20+Cj4gLS0tCj4gQ0MgbGlzdCBnb3Qgc3VwcHJlc3NlZCBvbiBmaXJzdCBzdWJtaXNzaW9u
LCBzbyByZXNlbmRpbmcuIFNvcnJ5IGFib3V0Cj4gdGhhdC4KPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
