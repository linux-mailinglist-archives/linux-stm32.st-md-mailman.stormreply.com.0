Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5565D9A11DD
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 20:50:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05283C78032;
	Wed, 16 Oct 2024 18:50:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2722FC78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 18:50:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 855525C5669
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 18:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC2BC4CED1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 18:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729104639;
 bh=L6XHu4FtlGacMcWbxzLjmXjFmMokOmuXuUJaQfV8FBs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cQcYz1SrUMtZnuULX9/VHkciXXbeLuwfwhNVXj9at80MMmjjlef3Q8cdK/9FNAJaW
 txZQLSWvM2AFkPFS9P+8VlmHXZ7zeZha+XjDk0Wf3cuWPPttdbgzGOuxX8wHaIAiM+
 LvVbPn8sRkQCrFSSM3T41B57ZyHyhr2LTIGLCeStsGRjUvw3QqlLfE4l7YOKt7Eb27
 crirxna7+lc+RvlJCMfHIlbXkk0BLxLyWeVSnKAz3EnFiUUsABYic1Nz41T4KrEduG
 b9izFi7tTZQ3EpaLmTPMYLAjq7/rf+j+loXH+rY2oljMROpmrV3C24b3z/itpmf4cr
 J04XptSVv30kw==
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-539f8490856so164150e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 11:50:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXNR8yH/M+kpQRObtmcbhXR9fV6ZdK3X/duC/VnwgTEv2tiKmJW10PofTgkBowAQl45KbX6o/Z6ib/BAA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxJoZoOIkI7JUkYWKrf/Xa0KDEfcqosE5CJJqnRuwynp2K9ckKn
 7o7hq9Kcjr7vvkA3ebvqzlu17cZ8ft+Jr72skHwhBNKR+rDWnuA2jKMh7NZVaZ4FgvzcQ6WKA7B
 ACE0v33N8fDmsTDopBvbN5dWlSsI=
X-Google-Smtp-Source: AGHT+IGJGDssr9uVJTLE6jB1f3Nuog+tjAvDKy3jYqTbpcvp+KymNCSVjvyuzrQo6U3A4w7yQVMXCVc3SZR2YJTJTsA=
X-Received: by 2002:a05:6512:4009:b0:52c:dc6f:75a3 with SMTP id
 2adb3069b0e04-539da58697fmr9901673e87.40.1729104637783; Wed, 16 Oct 2024
 11:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241015-arm-kasan-vmalloc-crash-v1-0-dbb23592ca83@linaro.org>
 <20241015-arm-kasan-vmalloc-crash-v1-1-dbb23592ca83@linaro.org>
 <CAMj1kXHuJ9JjbxcG0LkRpQiPzW-BDfX+LoW3+W_cfsD=1hdPDg@mail.gmail.com>
 <CACRpkdZp84MzXEC7i8K2FCnR3pEc05wPBVX=mMO5s6j1tJTm_A@mail.gmail.com>
In-Reply-To: <CACRpkdZp84MzXEC7i8K2FCnR3pEc05wPBVX=mMO5s6j1tJTm_A@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 16 Oct 2024 20:50:26 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGHsexspqKfewL3i7M1aqZJwkb6D_kO_UCoAvoSF24Wrg@mail.gmail.com>
Message-ID: <CAMj1kXGHsexspqKfewL3i7M1aqZJwkb6D_kO_UCoAvoSF24Wrg@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>,
 Russell King <linux@armlinux.org.uk>, stable@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] ARM: ioremap: Flush PGDs for VMALLOC
	shadow
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

T24gV2VkLCAxNiBPY3QgMjAyNCBhdCAyMDozOCwgTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVp
akBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDE2LCAyMDI0IGF0IDE6MzPigK9Q
TSBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPiB3cm90ZToKPgo+ID4gPiBAQCAtMTI1
LDYgKzEyNiwxMiBAQCB2b2lkIF9fY2hlY2tfdm1hbGxvY19zZXEoc3RydWN0IG1tX3N0cnVjdCAq
bW0pCj4gKC4uLikKPiA+IFRoZW4sIHRoZXJlIGlzIGFub3RoZXIgcGFydCB0byB0aGlzOiBpbiBh
cmNoL2FybS9rZXJuZWwvdHJhcHMuYywgd2UKPiA+IGhhdmUgdGhlIGZvbGxvd2luZyBjb2RlCj4g
Pgo+ID4gdm9pZCBhcmNoX3N5bmNfa2VybmVsX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgc3RhcnQs
IHVuc2lnbmVkIGxvbmcgZW5kKQo+ID4gewo+ID4gICAgIGlmIChzdGFydCA8IFZNQUxMT0NfRU5E
ICYmIGVuZCA+IFZNQUxMT0NfU1RBUlQpCj4gPiAgICAgICAgIGF0b21pY19pbmNfcmV0dXJuX3Jl
bGVhc2UoJmluaXRfbW0uY29udGV4dC52bWFsbG9jX3NlcSk7Cj4gPiB9Cj4gPgo+ID4gd2hlcmUg
d2Ugb25seSBidW1wIHZtYWxsb2Nfc2VxIGlmIHRoZSB1cGRhdGVkIHJlZ2lvbiBvdmVybGFwcyB3
aXRoIHRoZQo+ID4gdm1hbGxvYyByZWdpb24sIHNvIHRoaXMgd2lsbCBuZWVkIGEgc2ltaWxhciB0
cmVhdG1lbnQgYWZhaWN0Lgo+Cj4gTm90IHJlYWxseSwgcmlnaHQ/IFdlIGJ1bXAgaW5pdF9tbS5j
b250ZXh0LnZtYWxsb2Nfc2VxIGlmIHRoZSBhZGRyZXNzCj4gb3ZlcmxhcHMgdGhlIGVudGlyZSB2
bWFsbG9jIGFyZWEuCj4KPiBUaGVuIHRoZSBwcmV2aW91c2x5IHBhdGNoZWQgX19jaGVja192bWFs
bG9jX3NlcSgpIHdpbGwgY2hlY2sgdGhhdAo+IGF0b21pYyBjb3VudGVyIGFuZCBjb3B5IHRoZSBQ
R0QgZW50cmllcywgYW5kIHdpdGggdGhlIGNvZGUgaW4gdGhpcwo+IHBhdGNoIGl0IHdpbGwgYWxz
byBjb3B5IChzeW5jKSB0aGUgY29ycmVzcG9uZGluZyBzaGFkb3cgbWVtb3J5Cj4gYXQgdGhhdCBw
b2ludC4KPgoKWWVzLCBzbyB3ZSByZWx5IG9uIHRoZSBmYWN0IHRoYXQgY2hhbmdlcyB0byB0aGUg
dm1hbGxvYyBhcmVhIGFuZApjaGFuZ2VzIHRvIHRoZSBhc3NvY2lhdGVkIHNoYWRvdyBtYXBwaW5n
cyBhbHdheXMgb2NjdXIgaW4gY29tYmluYXRpb24sCnJpZ2h0PwoKSSB0aGluayB0aGF0IHNob3Vs
ZCBwcm9iYWJseSBiZSBzYWZlLCBidXQgd2UgaGF2ZSB0byBiZSBzdXJlLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
