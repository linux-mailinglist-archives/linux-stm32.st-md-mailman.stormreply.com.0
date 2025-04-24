Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 939E6A9B4E7
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 19:02:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 440AEC78F70;
	Thu, 24 Apr 2025 17:02:18 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BFAFC78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 17:02:17 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-ac339f53df9so249709966b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 10:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745514136; x=1746118936;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WkcCSbDN/ZU2oZjime5zidqS1XL1m5hB3C//OeBt6zc=;
 b=eY94qbbXQaCKym7d/+keM0LnNByZqyHSx7yMnWVub49P1FRmeOSiKizCqxFGgWxk9p
 xNYDd67lGJ2gMOfMpSJP0pEO5AN5lPUtL+UY2zR46mRdHP4t8OXBBGugQ5PzE0mesTak
 BAMNbXPoRS1jpDQxZpW+zKs/FevtoJJYrKw2PGZFx1b8FZ7sDquldBTDQWmSD7FOH7L9
 ZBnHxWp+cmT3cpGGHPj3Bre+sHNKMnj6nbEZI/rvR64YUANfjjcjul4CuSRK0Z+8BGlU
 ndiOL14mkT8L9o4BxrDMmLr5wTVDMmRhO4HALVlsieVeGMYkwh5JocTClD98aSNZiQoH
 zVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745514136; x=1746118936;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WkcCSbDN/ZU2oZjime5zidqS1XL1m5hB3C//OeBt6zc=;
 b=tRzDpS4sjqswXn4EXbRteVkFBQyIfLLXKBUY0IDHJBvWaS6KPZ4s3JQcRQctaQwTIG
 UR8QNf7fXxQkQPRpg6be9MvFPXntkRbhoQ/BAQ8iT2fIi/FnY4z3bq9k54iuIHk3TIaB
 KtdKDQhpkRmE0tXvVsZQ9aVWAYF3IFCS92ujtfomlxscNvi4kZbNZQErIhwLzeM6ODwd
 kSff7QcxfTxm55NL1joHbXU945VBaj/l+mrstnaSvncuEwgHSDsIkfob0yaiuyqfort1
 DjRzRhFg8O2Z+ZSJ2kBlA/XvvBmQVQ1Plog9I6p14nfndlXZ6NsQHNnqNjRggc//3eHb
 6y0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDcq7QTtXEuK6Bf5tc/pSKtu24i2uuBgIRUTPjYx0mhz55XMCeAwUv/r3PoU7eb7RjqBQ6ZJT+OOTAaw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyeEDkxfEjTp4Y0PWqYKZ0Ja2yK68hZ4/MUXv4QBtLCHG9NJp31
 EZyjSkqWrN9zrfkIiXwC2AszoySaC8nvEkigsPw9it8E+wm55Ox33v155GveCZzAG3y9bokidtJ
 85B7imNI5w907ZYMqsBpDWTSxIwk=
X-Gm-Gg: ASbGncucxwNiUKVV0txeNkXSet+17n46Beh04Bl4yfY5xMliOWM0T+3KICR3XsXA2Ap
 kYqy82o+pemP5KM0JgVw4P4PXPFVa+0AEjzDCR2LSzjK5fVGy7UlJuzLlG0hNMod7plKaNGA7ON
 2o8bqhxJ7bkBEqfVsfFPesz5tt
X-Google-Smtp-Source: AGHT+IEHxo13L0sXvAke4ty9b+v4Z7Y0lEATPj2aXj/69ooRG7KecObOYygckKmL5PhgxgGc7inKBrIS/BRos9kUdGc=
X-Received: by 2002:a17:906:6a1f:b0:ac4:76d:6d2c with SMTP id
 a640c23a62f3a-ace6b54761amr31197866b.40.1745514136147; Thu, 24 Apr 2025
 10:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250424151604.626758-1-olivier.moysan@foss.st.com>
In-Reply-To: <20250424151604.626758-1-olivier.moysan@foss.st.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Apr 2025 20:01:40 +0300
X-Gm-Features: ATxdqUEBDL7z20qNs0yG_M2X9nqYMo67214nlsnEXBB5e6fuFVOwBd_KZJdSur0
Message-ID: <CAHp75VfwiMAa+y+_sHpJ27D34=PtMG=nskXbV+GuNgWpH-85KQ@mail.gmail.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5] iio: adc: stm32: add oversampling
	support
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgNjoyMuKAr1BNIE9saXZpZXIgTW95c2FuCjxvbGl2aWVy
Lm1veXNhbkBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4KPiBBZGQgb3ZlcnNhbXBsaW5nIHN1cHBvcnQg
Zm9yIFNUTTMySDcsIFNUTTMyTVAxNSAmIFNUTTMyTVAxMy4KPiBTVE0zMkY0IEFEQyBoYXMgbm8g
b3ZlcnNhbXBsaW5nIGZlYXR1cmUuCj4KPiBUaGUgY3VycmVudCBzdXBwb3J0IG9mIHRoZSBvdmVy
c2FtcGxpbmcgZmVhdHVyZSBhaW1zIGF0IGluY3JlYXNpbmcgdGhlCj4gZGF0YSBTTlIsIHdpdGhv
dXQgY2hhbmdpbmcgdGhlIGRhdGEgcmVzb2x1dGlvbi4KPiBBcyB0aGUgb3ZlcnNhbXBsaW5nIGJ5
IGl0c2VsZiBpbmNyZWFzZXMgZGF0YSByZXNvbHV0aW9uLCBhIHJpZ2h0IHNoaWZ0Cj4gaXMgYXBw
bGllZCB0byBrZWVwIHRoZSBpbml0aWFsIHJlc29sdXRpb24uCj4gT25seSB0aGUgb3ZlcnNhbXBs
aW5nIHJhdGlvIGNvcnJlc3BvbmRpbmcgdG8gYSBwb3dlciBvZiB0d28gYXJlCj4gc3VwcG9ydGVk
IGhlcmUsIHRvIGdldCBhIGRpcmVjdCBsaW5rIGJldHdlZW4gcmlnaHQgc2hpZnQgYW5kCj4gb3Zl
cnNhbXBsaW5nIHJhdGlvLiAoMl5uIHJhdGlvIDw9PiBuIHJpZ2h0IHNoaWZ0KQo+Cj4gVGhlIG92
ZXJzYW1wbGluZyByYXRpbyBpcyBzaGFyZWQgYnkgYWxsIGNoYW5uZWxzLCB3aGF0ZXZlciBjaGFu
bmVsIHR5cGUuCj4gKGUuZy4gc2luZ2xlIGVuZGVkIG9yIGRpZmZlcmVudGlhbCkuCj4KPiBPdmVy
c2FtcGxpbmcgY2FuIGJlIGNvbmZpZ3VyZWQgdXNpbmcgSUlPIEFCSToKPiAtIG92ZXJzYW1wbGlu
Z19yYXRpb19hdmFpbGFibGUKPiAtIG92ZXJzYW1wbGluZ19yYXRpbwoKVGhpcyB2ZXJzaW9uIExH
VE0sClJldmlld2VkLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHlAa2VybmVsLm9yZz4KCi0tIApX
aXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
