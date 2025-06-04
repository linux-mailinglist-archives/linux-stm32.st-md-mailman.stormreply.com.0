Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9B3ACEBFD
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jun 2025 10:33:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67D0FC3F943;
	Thu,  5 Jun 2025 08:33:03 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF99BC32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Jun 2025 03:43:26 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-32a72e61a3fso5584191fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Jun 2025 20:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749008606; x=1749613406;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sf/4+POn7BVTFHEDrs6asZumcOeQmLNTI7IjWHUUShg=;
 b=oIPedu7jwJbJMDC1p4jjo6rxrihvM9dhZNGbj9TsA2ngoPtTzrc3qVqeGUx0PyaUad
 M61lj7iFa8AudEQX/yZaLYLKKOkVQk0uNssVCdyL3bMzVhU2DeYR6aP1tEJ80F1QSZRj
 QZ3sQcc9TdnKTAM5JPyjv6bBhSZ+PZuqCgwmdIctWgdFcUXN3peKlXICEZXH7dUpGNnZ
 2yn3Bzt01GbCTQkakoxVXpqBBOmWh9zVKr9UZgAp1R7tHHVuS4d7atKNVHmynHP3Saef
 X/QJv0PtkK/ajWVLV4hkpPEDPqqacy3uajRr1W3ceUmS8162KN6LNGq/mES7DqKXPEnd
 MZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749008606; x=1749613406;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sf/4+POn7BVTFHEDrs6asZumcOeQmLNTI7IjWHUUShg=;
 b=ZuKTJvAPS6uDE7IxPbE0jet7Mt6qIbUv8ALnEWGOizpofHB3sB0M+mGR9lgSalkEjt
 QeNdu59IUAsasB+M/XjCWDyZcIw/POzHne6pIsxnC3zdce2YbhUPMHZWyYGi2QOPxBkd
 M8nCxyoJZCNBQS6cKJE5rtO6hI58O4+Y3adGSR0j5OfMop7lk8PLxWeOSpu+q5u8vuzF
 thmeteIhsuhgImYJr2D/V3PCZ4ZVM8dWiLd2Xeo4zszHdZ1IquS8q5TBJwFKeOFIkoV+
 b7EHDw9Lq/84epT08V0hI+ANv9PmnihESSmeUrhKNRhq/tMzF371wcBA2U6txPexXKQz
 X48g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtE/jiVvM/tfZ+Fqcbf4MMeqp6B61pIRau7Wyv7WOFOZ7q2d50RgJq/gdgUr96Sl/6tBLsC9jQmQYI2A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx9rcxPX79BbXxV0kwFKGcihsJfI0dMJJhVF47DnHQt2ui4h22m
 lL3/1WoiIRQtjSaBDw3y3IOwKa6pAoVprQbwBILh2NhzcPAO4gucIPOI6hgxEBD+57WvqjuGPEP
 k5LvC4ggiORDadBIt5NbNMSKKIrwcVtOoRduFrmY=
X-Gm-Gg: ASbGnctDqWs89OzUQadvQqiQaUQ/GX2cNKIpidf+60wAMlIP5uWPJH/1u6BnA7zplcq
 vz4AOA7S831ztN3OAeJIpjOGndBHbbmIUESp2menBHlDyLXN85bH8OsU5Odp3ENp45DOw4oRGfM
 KNH5GYdQHQ6T8EyHZBei9uKrRCsyAz030veQce7RYk7ROVWVuZUbw1I9gUhzvm2yikQ0No8rzW
X-Google-Smtp-Source: AGHT+IH8ZR09cOwjQWxlzzIIzvv/qRTFHJMY8a37VDJ4S/kE7pfdaVMCEhiK2Gv1YMR2kEbER3eXRAurwmgsUUQyZRY=
X-Received: by 2002:a05:6512:1110:b0:549:8c0c:ea15 with SMTP id
 2adb3069b0e04-553530e6bddmr1432974e87.0.1749008605694; Tue, 03 Jun 2025
 20:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-8-daniel.lezcano@linaro.org>
In-Reply-To: <20250602151853.1942521-8-daniel.lezcano@linaro.org>
From: John Stultz <jstultz@google.com>
Date: Tue, 3 Jun 2025 20:43:12 -0700
X-Gm-Features: AX0GCFvc7MVw8hFnvp1SKu5kFSFas_79C7UyjmOU1fxABMnJcu53irlnUJ9Jiw0
Message-ID: <CANDhNCpngvSEC1bXP_djk2957n-_LF1CUXNgZ-eEQ8vcCsizMw@mail.gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
X-Mailman-Approved-At: Thu, 05 Jun 2025 08:33:01 +0000
Cc: Nam Cao <namcao@linutronix.de>, Marco Elver <elver@google.com>,
 Will McVicker <willmcvicker@google.com>, Saravan Kanna <saravanak@google.com>,
 Samuel Holland <samuel@sholland.org>, Jim Cromie <jim.cromie@gmail.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra@vger.kernel.org,
 tglx@linutronix.de, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 7/7] time: Export symbol for
	sched_clock register function
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

T24gTW9uLCBKdW4gMiwgMjAyNSBhdCA4OjE54oCvQU0gRGFuaWVsIExlemNhbm8gPGRhbmllbC5s
ZXpjYW5vQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gVGhlIHRpbWVyIGRyaXZlcnMgY291bGQgYmUg
Y29udmVydGVkIGludG8gbW9kdWxlcy4gVGhlIGRpZmZlcmVudAo+IGZ1bmN0aW9ucyB0byByZWdp
c3RlciB0aGUgY2xvY2tzb3VyY2Ugb3IgdGhlIGNsb2NrZXZlbnQgYXJlIGFscmVhZHkKPiBleHBv
cnRpbmcgdGhlaXIgc3ltYm9scyBmb3IgbW9kdWxlcyBidXQgdGhlIHNjaGVkX2Nsb2NrX3JlZ2lz
dGVyKCkKPiBmdW5jdGlvbiBpcyBtaXNzaW5nLgo+Cj4gRXhwb3J0IHRoZSBzeW1ib2xzIHNvIHRo
ZSBkcml2ZXJzIHVzaW5nIHRoaXMgZnVuY3Rpb24gY2FuIGJlIGNvbnZlcnRlZAo+IGludG8gbW9k
dWxlcy4KClRoYW5rcyBmb3IgY2hhc2luZyBkb3duIGFsbCB0aGUgZGV0YWlscyBhcm91bmQgdGhp
cyBpc3N1ZSBEYW5pZWwhCgpBY2tlZC1ieTogSm9obiBTdHVsdHogPGpzdHVsdHpAZ29vZ2xlLmNv
bT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
