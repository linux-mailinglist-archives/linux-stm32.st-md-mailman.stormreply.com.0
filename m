Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2959A954A7
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Apr 2025 18:42:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A240C7802F;
	Mon, 21 Apr 2025 16:42:25 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46964CFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Apr 2025 16:42:24 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ac2963dc379so615488666b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Apr 2025 09:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745253743; x=1745858543;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L1I3cbwltjOGElOuVsLVlgvPqjddyD9qAtM+fs2VWpA=;
 b=gb4b4FdrLoluCACBPkcRqJXrvraPYvW6DlPpxQEMRRUOKSeXSwcK2fwjEo2Rt1Jhff
 QPl7lmpZFW/LyOO8WKNODOuXuMYpyMGVYLhzfLPfTSK6MwN3YfZvUNOdAEBGO14rp9hL
 Z9eunkX/jGVonZcYzLt+IqwDrBcMDGfAJE24FNXChwOp2yG9a2nXuaoF9ImOrnL6VDsd
 rapqWVOQaLjiptoTSFBhMXdziliM8fWEuVv127qYZJBH/VStD8YUvACzTpboDPvfAqVV
 Cw2gIT//HuPUrCpvHAYf6IGRnGvkOkfX0OV68pkLIFbCwjS+7ZNsO7niL2GcK4fp/18i
 TtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745253743; x=1745858543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L1I3cbwltjOGElOuVsLVlgvPqjddyD9qAtM+fs2VWpA=;
 b=ecTEr4xY/n6GFwdCLDWNccOiX6AbIIAn9JoyIvYAhzD7U/Ddkhi8VzZ06QuFO1sQ4l
 KWnWXqv6dC+C5HwJfyvLRODRPZ+Gcb9LiFAoYNKujTs2jnZxgqAJ3/rf548m1y5BF+Gx
 VlWjrDAHVyUNuFFGsfRr3v0tbVd2WK9KScqQmFsJob1ez5Tme08y5tHxWcaMIE2PiE0J
 I8BUsqdXsuFiUVaHjIXwJFM3RZq9hAIQtmzNTv29HZRlgbvAUD/Qf6Q/0L9j5cMZlrgf
 og+p+h5GqSTP2vw/CgEMBS6qfM1DaHMKxBA3efFNTvHvjJwMvLA/cQrLCKqwxnhFFZv+
 qKRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWex3bkJotmlTkeLWMReMrmHKnlaxpYmZSgHat/swWjHfFO+sMpE3+pT92HE1RTbdvcuBVyxhuhb4lXvw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyNQ3P5u+5rOd2YkQUgnbSg6AMZWXBgTVzFiWKqiMYHOFBx3Vs5
 VOXGHfPAe5hX+Zx/Tj0RuMHkxr1Cr/wk/ShLV/vQXmz2zUjWWJwVs0HrebhYh/xuP1cdwoVlb88
 RY/4+YB6XQpT2hfONUKCCNi9sqPo=
X-Gm-Gg: ASbGncvJwgQot5xC2y9IQQI2brQr7y05P5hLvzdQKyvEjYXn2rKgHzMTdIHEC0G72tR
 8UHASB1Jodz6nDoYl2q37Vj0gYwaq0d+AM6SKTqrn96k8AkpyI+ecwar73CqDfR5BAfxoOWJV/l
 zUbNrcT33VVgFkE2uLxpApNA==
X-Google-Smtp-Source: AGHT+IGOkY/7PisAD2oLp8QqIo0O9LumO+tYusSVEov8PZqxdtzgsegmull0yalfq2NuFZ5JO7zCd3FO9FZrDniI0y8=
X-Received: by 2002:a17:907:1b1f:b0:ac1:f19a:c0a0 with SMTP id
 a640c23a62f3a-acb74b1ca7cmr1191466066b.20.1745253743466; Mon, 21 Apr 2025
 09:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
 <20250418-iio-prefer-aligned_s64-timestamp-v1-4-4c6080710516@baylibre.com>
 <20250421121341.49e28ddf@jic23-huawei>
In-Reply-To: <20250421121341.49e28ddf@jic23-huawei>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 21 Apr 2025 19:41:46 +0300
X-Gm-Features: ATxdqUH5lMC16PsOqzsa5gclyWSAtg59GNIHcNrRLuTnmqVLHUh5EH6DsroQl_c
Message-ID: <CAHp75VcAHZV4zGMvR-xVuVhhBJMCmo7A0w0fnwASw3iAWU5wdw@mail.gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, imx@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, linux-iio@vger.kernel.org,
 Eugen Hristev <eugen.hristev@linaro.org>, Andreas Klinger <ak@it-klinger.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 David Lechner <dlechner@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 04/10] iio: adc: mxs-lradc-adc: use struct
 with aligned_s64 timestamp
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

T24gTW9uLCBBcHIgMjEsIDIwMjUgYXQgMjoxM+KAr1BNIEpvbmF0aGFuIENhbWVyb24gPGppYzIz
QGtlcm5lbC5vcmc+IHdyb3RlOgo+IE9uIEZyaSwgMTggQXByIDIwMjUgMTQ6NTg6MjMgLTA1MDAK
PiBEYXZpZCBMZWNobmVyIDxkbGVjaG5lckBiYXlsaWJyZS5jb20+IHdyb3RlOgoKLi4uCgo+ID4g
KyAgICAgICAgICAgICBhbGlnbmVkX3U2NCB0czsKPiBhbGlnbmVkX3M2NAo+Cj4gSSd2ZSBub3Qg
aWRlYSB3aHkgdGltZXN0YW1wcyBhcmUgc2lnbmVkLCBidXQgdGhleSBhbHdheXMgaGF2ZSBiZWVu
IQoKQmVjYXVzZSAwIChjZW50ZXIgcG9pbnQpIHdhcyBjaG9zZW4gYXMgMTk3MC0wMS0wMT8KCi0t
IApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
