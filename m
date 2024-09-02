Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2765D9686CD
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2024 13:55:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D02E5C6DD6B;
	Mon,  2 Sep 2024 11:55:24 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C541DCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2024 11:55:17 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5334879ba28so5792911e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Sep 2024 04:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725278117; x=1725882917;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9J7GkouTbYRkiXQCeY02KWRx8IwFXPUu0A8xf8Lp4u0=;
 b=zDOjSHiIDYWfPdbU5iVChDQnabH41r14zXH2skdZqoRE1HD/Hj7Xe80kzLz6AyTyOO
 1TgfSq3cee9UD+rDSWIHCwvUtt6BluMSzQcjrtihLTWZnzz6J1xbrrfXpVA03APBnmIN
 eA0vuCkcn860QpPOw0n9c8WTvXC3roMbJoSfYNXT7ziVb+zlsDtI5tRjg0n7/XrU5hpx
 Do6cjzV50cpYuMRl1WWtyazyJVBJhHN+zlMbXq4N3iaYrdFQNqtXyb5ifjlQSPFssQRq
 Heos3ZM4pWgHLzzdAKxIa12/lod1RiZYxTFmXGrLx4YllIUGAWQhxTuawRSlJ0HiFTbj
 d7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725278117; x=1725882917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9J7GkouTbYRkiXQCeY02KWRx8IwFXPUu0A8xf8Lp4u0=;
 b=vZ6KUOn69K/Y6TYdRTF9zetb6fnenwZ1NEoemNheFnUCSjQcvKwtWdHSWNIOw324t8
 HbEpdVPaKmcNa17cfDXLoznftzMltHL5rLYlg0gbKJPAKSZcSOvonjLhIqRde1eFRJUP
 YASWMSUmDD9FhoA5cI39aaW4mduVJvXFyGJRgemAmAsnFUywviq1tQBPgj1H2bfAFhAv
 yT8VE+XtOjDvgSt7QYKK8Dj0sDlcX9fvlZTHFhJLWuI7UbysupgJ4j2U8kdynX2YajzC
 lsyUcDawZqpTsVojfwxD/C0cetBPT+oZn6RDKvCXhjXJTz0Fn2Q9GL5XMYN3WUD1YIG0
 /trA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwxWJsJHwvJvV0oOaXpusNx+KobbJZo0H0vHkWum42zHsl5NCJvU7kqIHc4nyQWiV2FHn3nAYL9q0vXQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzxKHcYShLHQPOFoGTwEWwO4Pm3TGTLRbFa+iJVDz8HjpyN/5H2
 VCSVECCubIw4QHqxLgZeS+vrdQvkAXpQOsGrkptHWAAQtr3CeZifNpJAplSv6Zr2FJR+oWde7Yd
 AKrlApJf3wpKjDk75P/uyzbjY0J1WXy6Ow3p1og==
X-Google-Smtp-Source: AGHT+IEGE12FfStnUdBGy/2dKVU5vyf2aKrdPnQfwMUTc+zGFDGNenYTlMLP89onXE8zV0IWCEadu5GfRUaSGbS+0XM=
X-Received: by 2002:a05:6512:3b2b:b0:533:71f:3a53 with SMTP id
 2adb3069b0e04-53546b053admr8752543e87.19.1725278116390; Mon, 02 Sep 2024
 04:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240829131051.43200-1-shenlichuan@vivo.com>
 <172527039219.21144.385699965145763717.b4-ty@linaro.org>
 <ZtWWoT75zCSB4g1x@smile.fi.intel.com>
In-Reply-To: <ZtWWoT75zCSB4g1x@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Sep 2024 13:55:05 +0200
Message-ID: <CAMRc=McgnoZz0TuwB0nWAdiRyZ0tNkX9NUKq9THH1Hh0rPk9CA@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: opensource.kernel@vivo.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linus.walleij@linaro.org,
 Shen Lichuan <shenlichuan@vivo.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] gpio: stmpe: Simplify with
	dev_err_probe()
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

T24gTW9uLCBTZXAgMiwgMjAyNCBhdCAxMjo0MuKAr1BNIEFuZHkgU2hldmNoZW5rbwo8YW5kcml5
LnNoZXZjaGVua29AaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgU2VwIDAyLCAyMDI0IGF0
IDExOjQ2OjM0QU0gKzAyMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiBGcm9tOiBC
YXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4gPiBP
biBUaHUsIDI5IEF1ZyAyMDI0IDIxOjEwOjUxICswODAwLCBTaGVuIExpY2h1YW4gd3JvdGU6Cj4K
PiBbLi4uXQo+Cj4gPiBBcHBsaWVkLCB0aGFua3MhCj4KPiBCZSBjYXJlZnVsIHdpdGggcGF0Y2hl
cyBmcm9tIEB2aXZvLmNvbSBbMV0hCj4KClRoYW5rcyBmb3IgdGhlIGhlYWRzLXVwIQoKPiBUaGlz
IG9uZSBpbiBwYXJ0aWN1bGFyIG1pc3NlZCAnXG4nIChhbmQgeWVzLCBJIGtub3cgdGhhdCBpdCdz
IG5vdCBhbiBpc3N1ZQo+IGZvciB0aGUgZXZfKigpIGNhc2VzKS4KPgoKYjQgZGlkbid0IGNvbXBs
YWluIHNvIEkgZGlkbid0IHBheSBhdHRlbnRpb24uCgpCYXJ0Cgo+IFsxXTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtc3BpLzIwMjQwODI5MDMzNTExLjE5MTcwMTUtMS0xMTE2MjU3MUB2
aXZvLmNvbS8KPiAocmVhZCBmdWxsIGRpc2N1c3Npb24pCj4KPiAtLQo+IFdpdGggQmVzdCBSZWdh
cmRzLAo+IEFuZHkgU2hldmNoZW5rbwo+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
