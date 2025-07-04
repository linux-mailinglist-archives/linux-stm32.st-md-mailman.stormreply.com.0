Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B3EAF8C3D
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jul 2025 10:42:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 376EFC36B2F;
	Fri,  4 Jul 2025 08:42:57 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81347C36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jul 2025 08:42:55 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-553ba7f11cbso860532e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Jul 2025 01:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751618575; x=1752223375;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
 b=LcbPbugAGiQhrinb1jdGJhb0dMRlOXhU7CW10vjlpKlkGaIt9dVoH1Pgd+9hIn4rFQ
 OTkADCFnmjgEP2LOvnl7jObfWuPvT30fCx+ubWtglpDoZ/+AaFuTpQtIQQ6i8kfDb09+
 ppOyah6zukRQiaqrp8WGVRw49KhY4ez3JLqRJjdI7aYi8wT9hfn9iT9PEzSJ9q/uvtjP
 TfLCd8qo7yuI7TvvwONvzHJHV931jK70bO5/vujbWrzHeDsnxc/EQQmYfXl5ckiQizX4
 043zXboLV0IH6JU7VQoxSfxh5BCezpYWj7sqSDiDF087ZN/vPIzVtBDDbShILV6929RN
 AqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751618575; x=1752223375;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
 b=biuASMXu5Mcv27A13ejyRNP00+Lb6E05UEx3Pta6Nnx1trN7UiSBWvo3sHF1npWC8s
 oT1Q0vVZarsj9H5Rl3KEKM63oMEOHE0pKKL8viXRTLGnqjxW36bnt51l7GOXRwYElOk4
 qTQITy6urpyGfdQKDgUCWTDbTdxx8qkyIHvRDxl1E/rdDXx0Hc0Ui1HolRWBwsNcXTpT
 swdrHJUteCfINe8HVjXYMzWhMFZpBPsn0lIbecP/x1AWE/njT8yzgUZQYg7K6eD4y63+
 p0eyKhvUuDiO0GDCu/uCxu/cTUhewQZfBKD9DaZUB+PzeTWCyZrWIqLD5iTg2jCuSwGI
 uG1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXetLifGtRcUL5rHuoWEq6P30puFgPnWFbmItAWaBpQzxUZgnSgxd3A8jh/5I15tI5BOskLBlPN+RCriA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw7msnU1toxqdYJ7pBKL52vaGc/4rK7j/K3+K4gAO0NF5TLSfcz
 Zb1LJpE/DZGaeXxBi82y7H6OvSuAVdhHGIXJwdswVNk9P6spBPZNJwbeR1VW+7bEJJxd+ok02JC
 LbR0PATnjgIasl2c1iAraFsNijWmwXzdDF7IcDnmolw==
X-Gm-Gg: ASbGncs95VYol51tobcI2sAvdx3pMgXaDD4eeEa+JltDAp2qn7XJSSechxNUhourSy3
 T0/bIG/VwBcKe5SiK27v55oVXxQvIevd60w6dCGSU3bH2959C6rbvIkhofAwIWCx4AM3QWb/6QJ
 8+MPDOko1HWBudogTin3cF+M22BdkSQf1fmf4GGw9GeZQ=
X-Google-Smtp-Source: AGHT+IGodMjqDkDesQdG4Hjakhr0TOM9xUbyJgILsRTpZGqTHkPFTfySztIXo8nEvUZyWt2JWT7aRKctMeet0pwrsBw=
X-Received: by 2002:a05:6512:3e1b:b0:553:35e6:393b with SMTP id
 2adb3069b0e04-556e684bda8mr524787e87.45.1751618574621; Fri, 04 Jul 2025
 01:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075420.3219092-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075420.3219092-1-sakari.ailus@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:42:43 +0200
X-Gm-Features: Ac12FXznXJQ0ImElx8AS_65o16qEpHJnw8V0OHvMEe3Y5zyTtUuH2rGO4fQjXsY
Message-ID: <CACRpkdb8Z3oLwmB26q1xdHMwa2xTm1sz5g8_a0BHMK8oHsiF1g@mail.gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-iio@vger.kernel.org,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "Rob Herring \(Arm\)" <robh@kernel.org>,
 Francesco Dolcini <francesco@dolcini.it>, Samuel Holland <samuel@sholland.org>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 David Lechner <dlechner@baylibre.com>, linux-sunxi@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Julien Stephan <jstephan@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andy@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 28/80] iio: adc: Remove redundant
 pm_runtime_mark_last_busy() calls
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

T24gRnJpLCBKdWwgNCwgMjAyNSBhdCA5OjU04oCvQU0gU2FrYXJpIEFpbHVzCjxzYWthcmkuYWls
dXNAbGludXguaW50ZWwuY29tPiB3cm90ZToKCj4gcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQo
KSwgcG1fcnVudGltZV9wdXRfc3luY19hdXRvc3VzcGVuZCgpLAo+IHBtX3J1bnRpbWVfYXV0b3N1
c3BlbmQoKSBhbmQgcG1fcmVxdWVzdF9hdXRvc3VzcGVuZCgpIG5vdyBpbmNsdWRlIGEgY2FsbAo+
IHRvIHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKS4gUmVtb3ZlIHRoZSBub3ctcmVkdW50YW50
IGV4cGxpY2l0IGNhbGwgdG8KPiBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+CgpS
ZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
