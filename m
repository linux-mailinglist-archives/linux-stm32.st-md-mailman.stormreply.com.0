Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D753490B294
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 16:43:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CCB0C69067;
	Mon, 17 Jun 2024 14:43:13 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9133C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 14:43:11 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a6f09eaf420so519064966b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 07:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718635391; x=1719240191;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZBRYz0XGpXpv2eraO3GUW2itTwP+yglswHfa4pbL/RI=;
 b=kx6/GjGCYqwiB5EQNK9/iLk3hlXH29tM649HuKu/OGOCa91TmN1zMaccQP9JrqRaMW
 Bfo2oZQhWeo1aksf7yaijzbrN7ZtcK2z/F4d12Z5Dg3seXvGRsFqRDpU/+ubKxfdcPkG
 U6aYnzMzAqzNf6xhCdJK+TYp2gEPwiMAThtQt/Z8N+CawrspBeDVH1KW2aNmo4Fkq4Sb
 7Qf3Mf8pwJmdne8jCn1CZQX/APZ5VqEqh1M1fpTP4nr/Rt6wSXE1H5vPO2J7bgbT7JiJ
 toa/N7Wk2DSnynoa3a4lMYskHSoT8xkW1nSXm9K3MSQtmMAHs5es2zjrJRdoXLNM9zsi
 U4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718635391; x=1719240191;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZBRYz0XGpXpv2eraO3GUW2itTwP+yglswHfa4pbL/RI=;
 b=B2ootr0AaxzR5gqBPpXamINhngpuiHjp0L7qSRSYQXvs/ZNtnIgG+Rf+h0lE1uQUEB
 6UEXSsRdXiJc4wEJVzz0y8bAvrsvRIXsqpFmWLEuqWkucdMfmPVWA3aM6UuGaNnATV6C
 hLNcyPVLOTor4vpBquBwFd8/O6aSf4fMErddRPnf1GLz2q8O8adF2p/pOCiuk6tZTw5f
 peYSkwOhZBldSnQ/oQfIwL1GuuR52ypVFxav/kyG8nC4oVH/slkgIkoZLJRUVc6OiKbM
 c5JL7oYUeONxI5IhVyZF9HiUnk5xXRv8ZZpEK5JYHu4LkXVtDCoWNlh2pb6/dGAQ6Vve
 cO+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhdZ2pYPE7Ei7m9xY4Md/oRUYEBtBJOc/zT0j9bNnVQBs07pE9+JtrNdCTehP/1QaBXGmyUd/EuSU5azUV1zYDzzCGhKgYG1jSepka43g2pzV1ha1g3BuO
X-Gm-Message-State: AOJu0YxVd47+QTkYf8XvMlbV1hI3vM6IBbBaaH3HAlnz2q4imjGbVWmv
 kYjYnYm9hVYewsoThIItPcybc9yomQ/zaJoM4y1ik0CqYNrtpHgo
X-Google-Smtp-Source: AGHT+IFZCLJUyzlf8fNXs1wSr7SW5vQG+3gjx8K9mMt6pzU9bVkMHLl1SBxe9dWS51TWvl5kQfUcKQ==
X-Received: by 2002:a17:907:970b:b0:a59:b590:5d71 with SMTP id
 a640c23a62f3a-a6f60bc9ac8mr839107966b.0.1718635391235; 
 Mon, 17 Jun 2024 07:43:11 -0700 (PDT)
Received: from ?IPv6:2001:a61:35f9:9001:40df:88bb:5090:7ab6?
 ([2001:a61:35f9:9001:40df:88bb:5090:7ab6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f427a5sm514062766b.180.2024.06.17.07.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 07:43:11 -0700 (PDT)
Message-ID: <63cd8d0e250a77c1201945ebe13e19ab0fb59ce9.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Trevor Gamblin <tgamblin@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>,  Lars-Peter Clausen <lars@metafoo.de>, Dmitry Rokosov
 <ddrokosov@sberdevices.ru>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>,  Chen-Yu Tsai <wens@csie.org>, Hans de Goede
 <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>,  Scott Branden
 <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Saravanan Sekar
 <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>,  Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Crt Mori
 <cmo@melexis.com>
Date: Mon, 17 Jun 2024 16:43:09 +0200
In-Reply-To: <20240617-review-v3-19-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
 <20240617-review-v3-19-88d1338c4cca@baylibre.com>
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 19/41] iio: dac: ltc2688: make use of
 regmap_set_bits()
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

T24gTW9uLCAyMDI0LTA2LTE3IGF0IDA5OjQ5IC0wNDAwLCBUcmV2b3IgR2FtYmxpbiB3cm90ZToK
PiBJbnN0ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRhdGVfYml0cygpIGFuZCBwYXNzaW5nIHRoZSBt
YXNrIHR3aWNlLCB1c2UKPiByZWdtYXBfc2V0X2JpdHMoKS4KPiAKPiBTdWdnZXN0ZWQtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Cj4gLS0tCgpSZXZp
ZXdlZC1ieTogTnVubyBTYSA8bnVuby5zYUBhbmFsb2cuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
