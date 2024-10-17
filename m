Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6CA9A2D01
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 21:01:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1016C78032;
	Thu, 17 Oct 2024 19:01:15 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D96F0C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 19:01:08 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso14205561fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 12:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729191668; x=1729796468;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lU3mObs7ZaU0oOzXWh6lZdlXzB4eGdGSPMvLDf83xnY=;
 b=eVdcWT6z+J5AsR7St91g8iwUuC1B1PvsXm+oipq+vutOX1PGfJH5nfVEbOTm7jT8sH
 xsz6xGGajy7WtFVvhpqeKT9BVzf6xXAd1WY/DT95dWQikd8pF7siY99/tNxjzH5a9Mzg
 UoUQTT8GXabW4duoTYE3HRsc8oUG1lTDjrEE1tkP5OWNfUov+Ff8+XXJX+WTafAoAkIo
 HhG4wIajB8ZSy/cgWmGsI+XgAhFZplss4ioQDhhC11+UpquHHoDkM5bhqZZrzFELhshg
 cVYehvLTR6ku9CDMvzap9u/nTqyIEpEGlWN0NShePz9arbItqqE0wQh9dc3coH9Uku/r
 B8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729191668; x=1729796468;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lU3mObs7ZaU0oOzXWh6lZdlXzB4eGdGSPMvLDf83xnY=;
 b=i6tLjecQhlSu576ZMXYgBiIGHEAeccu9/z0ZtW6qaojfZtToSvFZu7UF+LYolDOI0z
 vMj+UbRNaAfG+bc854TVJgOk0qnUDOKdMDt9QN6tBOl9vKxN2R7e6bPliflwWx4eEp/k
 D11Bmk87+lr1+pjzU+lnBI6URGZC+vbANDBx2EGGkSQO5Rkl177VqqQ/9ag0GWI/rteR
 BUghu5CoxIkJ8OVgdKxx4bLM5n5IG43Q5F3BPjqP0ZxxyZhZGIt09nKJhV3Z6vl52G5+
 SLN4LrbHMMfTd0h7zbbe25xSKK587xZjPeu4IV0CG9aXou4tuUea7UsKtlga+3XDitap
 K+Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3/6EWszFAEN0M16V2yZHFwCs+06eLghD+Baf9nQzpbO4qWftub2fW6RF/Nsbf/HgDlgYS6L/7gsR1GA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzGWHPwxEzKIGe0wPprEcvEiLt6SCMzBAz1xvOa+6vbzksrdiRd
 Dj6VGCdKnpOXt1yZIGwHCSOi6s4w6Qn5dfzm/AqixoAGhFlMpGIqas//ivKMDlB86vtETGMVxLL
 bcBrp07Kijsd+o2Y6Q8FD+ng+UJbPfHcKwRR1og==
X-Google-Smtp-Source: AGHT+IHJeyGHoEdVg5gahAtoLC5kb1XqCmrujO8GrsKJdhQBIrzNdth5nou9m05kGz6+prHxUELbU3wCqlAmf39VMTs=
X-Received: by 2002:a05:651c:b25:b0:2fb:5740:9f9a with SMTP id
 38308e7fff4ca-2fb5740a18dmr82304681fa.29.1729191667969; Thu, 17 Oct 2024
 12:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20241017-arm-kasan-vmalloc-crash-v3-0-d2a34cd5b663@linaro.org>
 <20241017-arm-kasan-vmalloc-crash-v3-1-d2a34cd5b663@linaro.org>
 <69f71ac8-4ba6-46ed-b2ab-e575dcada47b@foss.st.com>
In-Reply-To: <69f71ac8-4ba6-46ed-b2ab-e575dcada47b@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Oct 2024 21:00:55 +0200
Message-ID: <CACRpkdYvgZj1R4gAmzFhf4GmFOxZXhpHVTOio+hVP52OBAJP0A@mail.gmail.com>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 kasan-dev <kasan-dev@googlegroups.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>,
 Russell King <linux@armlinux.org.uk>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Mark Brown <broonie@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v3 1/2] ARM: ioremap: Sync PGDs for
	VMALLOC shadow
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

T24gVGh1LCBPY3QgMTcsIDIwMjQgYXQgNDoyMuKAr1BNIENsZW1lbnQgTEUgR09GRklDCjxjbGVt
ZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPiB3cm90ZToKPgo+IE9uIDEwLzE3LzI0IDE0OjU5LCBM
aW51cyBXYWxsZWlqIHdyb3RlOgo+ID4gWy4uLl0KPiA+Cj4gPiArc3RhdGljIHVuc2lnbmVkIGxv
bmcgYXJtX2thc2FuX21lbV90b19zaGFkb3codW5zaWduZWQgbG9uZyBhZGRyKQo+ID4gK3sKPiA+
ICsgICAgIHJldHVybiAodW5zaWduZWQgbG9uZylrYXNhbl9tZW1fdG9fc2hhZG93KCh2b2lkICop
YWRkcik7Cj4gPiArfQo+ID4gKwo+Cj4gYGthc2FuX21lbV90b19zaGFkb3dgIGZ1bmN0aW9uIHN5
bWJvbCBpcyBvbmx5IGV4cG9ydGVkIHdpdGggOgo+IENPTkZJR19LQVNBTl9HRU5FUklDIG9yIGRl
ZmluZWQoQ09ORklHX0tBU0FOX1NXX1RBR1MpIGZyb20ga2FzYW4uaAo+Cj4gVG8gbWUsIHRoZSBp
ZiBjb25kaXRpb24geW91IGFkZGVkIGJlbG93IHNob3VsZCBiZSBleHBhbmRlZCB3aXRoIHRob3Nl
Cj4gdHdvIG1hY3Jvcy4KKC4uLikKPiA+ICsgICAgICAgICAgICAgaWYgKElTX0VOQUJMRUQoQ09O
RklHX0tBU0FOX1ZNQUxMT0MpKSB7CgpMZXQncyBjaGVjayB0aGlzIHdpdGggdGhlIEtBU0FOIGF1
dGhvcnMsIEkgdGhpbmsgbG9va2luZyBmb3IKQ09ORklHX0tBU0FOX1ZNQUxMT0MKc2hvdWxkIGJl
IGVub3VnaCBhcyBpdCBpcyBpbnNpZGUgdGhlIGlmIEtBU0FOIGNsYXVzZSBpbgpsaWIvS2NvbmZp
Zy5rYXNhbiwgaS5lLiB0aGUgc3ltYm9sIEtBU0FOIG11c3QgYmUgZW5hYmxlZCBmb3IKQ09ORklH
X0tBU0FOX1ZNQUxMT0MgdG8gYmUgZW5hYmxlZCwgYW5kIGlmIEtBU0FOIGlzIGVuYWJsZWQKdGhl
biBlaXRoZXIgS0FTQU5fR0VORVJJQyBvciBLQVNBTl9TV19UQUdTIGlzIGVuYWJsZWQKKHRoZSB0
aGlyZCBvcHRpb24gS0FTQU5fSFdfVEFHUywgYWxzbyBrbm93biBhcyBtZW1vcnkgdGFnZ2luZwpp
cyBvbmx5IGF2YWlsYWJsZSBvbiBBUk02NCBhbmQgd2UgYXJlIG5vdCBBUk02NC4pCgpCdXQgSSBt
aWdodCBiZSB3cm9uZyEgS2NvbmZpZyByZWd1bGFybHkgYml0ZXMgbWUgaW4gdGhlIGZvb3QuLi4K
CllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
