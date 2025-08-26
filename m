Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFA7B3565D
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Aug 2025 10:06:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 219D4C3F92F;
	Tue, 26 Aug 2025 08:06:14 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18FF7C3F92E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 08:06:12 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-afcb7a3a085so832921166b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 01:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756195572; x=1756800372;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7wjbO+/CzvSzhggdBHtlSBiSOrC+TN4SiqbwtSU008o=;
 b=Gl4MP7zZAZf+3v6svhtL6ShrB8WG7b/CUijN5fPCZqZvHtNkXu5nAG69qfVTvESojn
 9qtX3IOeENT9khL3QcGKm5KJ61xMAwxI1wyLbcNPxuhGJpiS1beNG8mvvhe4/MbQ2MnM
 NXgYH0sZ6JL/tBhOqI+duWLwneu0Eo1VPf24H9kho7jjRR2aV98jagF0frtjRC/226Ea
 0EcfaAa1tCzcwq6JbWzKwE99r8nlbWrLE6CQ33UwNCcWZZW6xhwiqEGuW2/igz65avUR
 iDKg/ojxeE8R3a8bakLusc20yvTaZWyCKpkPuMyDkUtpug4OIuS8qbllgOX81eLjdOw7
 Y/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756195572; x=1756800372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7wjbO+/CzvSzhggdBHtlSBiSOrC+TN4SiqbwtSU008o=;
 b=mCyBqkduus/Jsmr9inb9zlBP5F3Y63+9VJjrz+a4ZF50AnyN27Gn0d0rn80IN6OwV/
 8vhLEnCGscr7BxTIgs4fkotDtq14zcz3sg7/7Gr3iyqVHvjz5VfCJRBd6PUbxemHG+U6
 ihPaYevYtp2kYo1dZHliOd4KpI5Mk1fPXAHXdqiCwD6Y1CFLyJPOX2W9KYk5I00NZtpv
 8IsIKCrjYZo8ZG7YpPjZcjF51PbfNpQzq3lLrsmotv6wRMDMA3/nna8fKPlEnT8FHHcF
 b6UNc6ymUPZOcuLABbXHcNSbMHTnXqpUIuA8SY6u8fEbWhrcFOud4wayUvOFwisBayYH
 roDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0rOZFd1Kxo1gHAEUihUT3UV2TxPB2CKxx5WSpN5FlvSY57Qvl+tQRsZsbRBaRgzTLO3iP75DoHjpjHg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy08bnOkb4lQlAiI49W0Qz0jpwCnpNpHzhJsP/aC7oAjzlssMra
 JxRlNA6SabJqBwZQ3FUHbPVAAHBZgu4SaihyaN+kK4oJPcKf/llAXvvv7eBP9ES9MhncBndOwnQ
 jrS3ZIwluv/ivrC5OheffdgYWeKt6mb8=
X-Gm-Gg: ASbGnct5pyX7KJfrrmHki0wZw9z9FajQRuzHCePGlDq0UqcpFHpRdvhzJ56vC5XRSuX
 Sw7KL+xbdHTN4vB9fa2I5KJUphk9C0kLAZo+PqJuj0rH6IRC8BgfUkeNFzTkW9YPtvuCSwvzk7n
 MWmhPeUvxWTEbyKtzqderetOx+8jWI7LayMoi6NyFJjEozKFtB+oCgBYP4GRybwr/XRCjPYWKjY
 T9e/ic=
X-Google-Smtp-Source: AGHT+IET95gesPsImlWxfCSqXy/xiG2n7VC6emkdon2TKt+AHqmFUOCd9ze1yaM/komtsJdO29Rh9lxV5vuG/ZzJHKo=
X-Received: by 2002:a17:906:ef05:b0:afe:8761:e77a with SMTP id
 a640c23a62f3a-afe8761fad3mr537764766b.19.1756195572104; Tue, 26 Aug 2025
 01:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250825205235.1766401-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250825205235.1766401-1-sakari.ailus@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 Aug 2025 11:05:35 +0300
X-Gm-Features: Ac12FXwdLHPHoVmXYor1LPriFlV0142umbIIkjkJQym6xu1Er8B2ZfjAPn-xRkY
Message-ID: <CAHp75Vcyr2gQ_Z7BV5nEJCSb1taWnBOfCfTWMQtMG-65Z+D0Dg@mail.gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v4 1/1] iio: dac: Remove redundant
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

T24gTW9uLCBBdWcgMjUsIDIwMjUgYXQgMTE6NTPigK9QTSBTYWthcmkgQWlsdXMKPHNha2FyaS5h
aWx1c0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gcG1fcnVudGltZV9wdXRfYXV0b3N1c3Bl
bmQoKSwgcG1fcnVudGltZV9wdXRfc3luY19hdXRvc3VzcGVuZCgpLAo+IHBtX3J1bnRpbWVfYXV0
b3N1c3BlbmQoKSBhbmQgcG1fcmVxdWVzdF9hdXRvc3VzcGVuZCgpIG5vdyBpbmNsdWRlIGEgY2Fs
bAo+IHRvIHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKS4gUmVtb3ZlIHRoZSBub3ctcmVkdW50
YW50IGV4cGxpY2l0IGNhbGwgdG8KPiBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkuCj4KPiBB
bHNvIGNsZWFuIHVwIGVycm9yIGhhbmRsaW5nIGluIHN0bTMyX2RhY19zZXRfZW5hYmxlX3N0YXRl
KCkuCgpUTDtEUjogSSB0aGluayB0aGlzIGNoYW5nZSBtYWtlcyBpdCBoYXJkZXIgdG8gZm9sbG93
IChkdWUgdG8gY29tcGxleApjb25kaXRpb25hbCkuCgouLi4KCj4gICAgICAgICByZXQgPSByZWdt
YXBfdXBkYXRlX2JpdHMoZGFjLT5jb21tb24tPnJlZ21hcCwgU1RNMzJfREFDX0NSLCBtc2ssIGVu
KTsKPiAgICAgICAgIG11dGV4X3VubG9jaygmZGFjLT5sb2NrKTsKPiAtICAgICAgIGlmIChyZXQg
PCAwKSB7Cj4gKyAgICAgICBpZiAocmV0KSB7Cj4gICAgICAgICAgICAgICAgIGRldl9lcnIoJmlu
ZGlvX2Rldi0+ZGV2LCAiJXMgZmFpbGVkXG4iLCBzdHJfZW5hYmxlX2Rpc2FibGUoZW4pKTsKPiAt
ICAgICAgICAgICAgICAgZ290byBlcnJfcHV0X3BtOwo+ICsgICAgICAgICAgICAgICBnb3RvIGVy
cl9wbV9wdXQ7CgpUaGlzIGlzIG9uZSB0aW1lIHVzZSBmb3IgdGhlIGxhYmVsIGFuZCB3ZSBrbm93
IHRoYXQgcmV0IGlzIHNldCBoZXJlLgoKSnVzdAoKICBpZiAoZW5hYmxlKQogICAgcG1fcnVudGlt
ZV9wdXRfYXV0b3N1c3BlbmQoZGV2KTsKICByZXR1cm4gcmV0OwoKc2hvdWxkIHdvcmsuCgo+ICAg
ICAgICAgfQoKLi4uCgo+IC0gICAgICAgaWYgKCFlbmFibGUpIHsKPiAtICAgICAgICAgICAgICAg
cG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShkZXYpOwo+IC0gICAgICAgICAgICAgICBwbV9ydW50
aW1lX3B1dF9hdXRvc3VzcGVuZChkZXYpOwo+IC0gICAgICAgfQo+IC0KPiAtICAgICAgIHJldHVy
biAwOwo+IC0KPiAtZXJyX3B1dF9wbToKPiAtICAgICAgIGlmIChlbmFibGUpIHsKPiAtICAgICAg
ICAgICAgICAgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShkZXYpOwo+ICtlcnJfcG1fcHV0Ogo+
ICsgICAgICAgaWYgKCFlbmFibGUgfHwgKGVuYWJsZSAmJiByZXQpKQo+ICAgICAgICAgICAgICAg
ICBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChkZXYpOwo+IC0gICAgICAgfQo+Cj4gICAgICAg
ICByZXR1cm4gcmV0OwoKCkFuZCBoZXJlIGlzIGFzIHNpbXBsZSBhcwoKaWYgKCFlbmFibGUpCiAg
cG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoZGV2KTsKCnJldHVybiAwOwoKYW5kIHJlbW92ZSB0
aGUgdW5uZWVkZWQgbGFiZWwgYWx0b2dldGhlciB3aXRoIHRoZSBlcnJvciBwYXRoLgoKLS0gCldp
dGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
