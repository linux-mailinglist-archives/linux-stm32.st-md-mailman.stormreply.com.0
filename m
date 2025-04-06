Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AFAA7D04F
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Apr 2025 22:32:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64600C78F85;
	Sun,  6 Apr 2025 20:32:07 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C60C1CFAC4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Apr 2025 20:32:05 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-227d6b530d8so29840145ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Apr 2025 13:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1743971524; x=1744576324;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/QKe2abRQc2yYg8840jEvGySXkfzcfSJKHrjRel0tUY=;
 b=RTZPDxBjSUUjSmeb4u/hXAPssGv4YaMxIbhLaN8NfseM0Zh0rOMtzPTbvQNdMavyeK
 Dqu35+11b+Y1MgdwIJGqS2gVQTQHVSuJEHAi86lSmwwAvQ+s75d8hUivUiLSBlP837ax
 dPx2ccKHGACK78/fE4DhsX5WvtS/lUHy4BySnzDfaICMMfea98ZO0Ybi2dQVwkPYuqlf
 I7AgS/v5uU/TABchZjvE/M0/qU+N7UEH7+NG2UK1FD/KjGMYODFTlg5b697/eS3Q029r
 JMUDgaOu4Fz5ZfqWDcu0hVz3S7VE3zaWGSowAahkBJ2WZ7rtZajGYe4kQU6DbgEpvf6U
 yvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743971524; x=1744576324;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/QKe2abRQc2yYg8840jEvGySXkfzcfSJKHrjRel0tUY=;
 b=PnFnu5dF6+BazH5lrbDncAoQ6LjXIvs7LxPZ15HtlksQVRbgbKfcw2D2zrCdETHR2S
 x7AMYSYod/yLkQlh15hTO9svIFnA/IwPRdDvhh1NG9KtuxQeunfF32gsBdqUF9GC2A5v
 o7kCSUTBqXwXQss2to3VLyPLfWfm/YxEFnderLRn3jZOd5H8rZivYbWAH94S2MiWqj7N
 7iI1gz6LJZayyOYkXVL4n+EnrxIekB3/FE8hyQUoLchUhN9YrJ4szJKkoSzaVCsFxROf
 yQWCoj9xRG6/sB+XdcFUmFpp6ZVk/8W1DyDauJIwwyI0uLSqUxam+93XqSTUI99L6RcS
 tHfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwtiR/Q5JO8IeDauB41bohZ79aL7zhUeVxZyi+YSWy0KNnksUh282Pn4fS+sCtjgncvOdF8Elkjp7BCg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YymVlFsqPOSdxJvRCujGFO3fidaVO7qY+nztQ2oVa6owO/NGaOT
 P+2DH2iHrauz6FIZGdnNccofFJR4VFpAts62B1pZwh+jPIZ+vLNMRVNHT+1qTMdz+Y51M66pHUW
 6D8MsLaSpVUuEZAaWOf+ZRmsASPo=
X-Gm-Gg: ASbGncuDHTIOEJD36hJ2bcILCTv+79l8QfOEld1MRETSIw8dh737CTxvOXK8vrCr/x6
 TvuEC+12cCSmnKDwFjCuB58JauZ3KQllyM9Ut01Eq2iZH4Bteakas6PXXj3CQw5kAVvESIEW4nB
 B5UeCEDtdTc09R0tyRpzAfzmd/Vmg3n6y/Qbjn/uS8
X-Google-Smtp-Source: AGHT+IHT9v90+iSAiZXg5CI9I2oqKoRX4lqsSVS1Jifp+TsFpnk0GJAUF4rHe1Z3iO76l1ihTjaQBPryFYN0akQAcDI=
X-Received: by 2002:a17:902:e546:b0:216:410d:4c53 with SMTP id
 d9443c01a7336-22a8a0a24f1mr155808815ad.41.1743971524234; Sun, 06 Apr 2025
 13:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
 <20250404-kconfig-defaults-clk-v1-1-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-1-4d2df5603332@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 6 Apr 2025 22:31:53 +0200
X-Gm-Features: ATxdqUGuzCGyUj4WFxWudQ3GalFFdus2VKUZdP35pUaLUbjhJd9NZclZR-cjauk
Message-ID: <CAFBinCB00HsScB6d4UboQkp8HPQ3pbDwbbwnzwgqJOvHwBDSdA@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH 1/5] clk: meson: Do not enable by default
	during compile testing
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

T24gRnJpLCBBcHIgNCwgMjAyNSBhdCAxOjU34oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQo8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEVuYWJsaW5nIHRoZSBjb21w
aWxlIHRlc3Qgc2hvdWxkIG5vdCBjYXVzZSBhdXRvbWF0aWMgZW5hYmxpbmcgb2YgYWxsCj4gZHJp
dmVycy4KPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1h
cnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
