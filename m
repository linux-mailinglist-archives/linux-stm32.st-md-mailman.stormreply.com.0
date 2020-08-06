Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BAB23DA37
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Aug 2020 14:16:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1289BC36B3A;
	Thu,  6 Aug 2020 12:16:19 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCDC8C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Aug 2020 12:16:16 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f1so43238392wro.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Aug 2020 05:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wxM29TwDHDOi09iTaSOPQGfSxUGOXNj7j2gjsd4TQfE=;
 b=BVNhyhIhBZcp3MQjd+BjJcvay6eusBgAidX82CObNMbrcL7KU5LNebuhruoU1aKi55
 3LiQpqc6xdraEbHNQ2YvrLEXDMhbWH9uvUmEez235oh0LRMJLTx4/DLQ78nPL5Snu22l
 IJtKuzhM6OANcymWND7qWxUr6OMrwUcb1yFDH6hPPC404vU8nt+nVYe0x+csgzestJGw
 dxx09xKPWRaFbD1uKkZwtEzTlwoibtFXNwItxR3eJCjTVhQw7DHEFFczJimyO58efion
 IYQRU5/ZlNzcYeDO75KgB8Ooamsz5HS7xe0D7AtmyFc9aiZ30Z+bDMxNNpjzNxt5g+GV
 C3Gw==
X-Gm-Message-State: AOAM531u9pHKDlUolyJN6LrL0PJ4GVGxaVb+AIkilz6aYptG8wERN1Gn
 +ozUCkTefLf9lKmgWVVT7BQ=
X-Google-Smtp-Source: ABdhPJyUQGyc1Q+OrLmSrAWCBHqXKmBIT46iWjNVnHFun64JY2oBRGkx7MPtpucz/RGYqbRu580iKw==
X-Received: by 2002:a5d:4407:: with SMTP id z7mr7057870wrq.404.1596716175808; 
 Thu, 06 Aug 2020 05:16:15 -0700 (PDT)
Received: from pi3 ([194.230.155.117])
 by smtp.googlemail.com with ESMTPSA id e4sm6307243wru.55.2020.08.06.05.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 05:16:14 -0700 (PDT)
Date: Thu, 6 Aug 2020 14:16:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lihua Yao <ylhuajnu@outlook.com>
Message-ID: <20200806121612.GA7617@pi3>
References: <20200804192654.12783-1-krzk@kernel.org>
 <BY5PR13MB30639E16691A4A601A1D7070C44B0@BY5PR13MB3063.namprd13.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BY5PR13MB30639E16691A4A601A1D7070C44B0@BY5PR13MB3063.namprd13.prod.outlook.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-watchdog@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>,
 Cedric Roux <sed@free.fr>, Russell King <linux@armlinux.org.uk>,
 linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Guenter Roeck <linux@roeck-us.net>, Sergio Prado <sergio.prado@e-labworks.com>,
 Arnd Bergmann <arnd@arndb.de>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Simtec Linux Team <linux@simtec.co.uk>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 00/13] clk/watchdog/ARM: Cleanup of
	various S3C bits
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

T24gV2VkLCBBdWcgMDUsIDIwMjAgYXQgMDQ6MTg6MzJQTSArMDgwMCwgTGlodWEgWWFvIHdyb3Rl
Ogo+IEhpIEtyenlzenRvZu+8jAo+IAo+IE9uIDUvOC8yMDIwIDM6MjYgYW0sIEtyenlzenRvZiBL
b3psb3dza2kgd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBJIHRyaWVkIHRvIGNsZWFudXAgZmV3IHdh
cm5pbmdzIGluIFMzQyBtYWNoaW5lIGNvZGUgd2hpY2ggbGVhZCB0bwo+ID4gZmluZGluZyBzb21l
IGJpZ2dlciBpc3N1ZXMuCj4gPgo+ID4gVGhlIHBhdGNoc2V0IHRvdWNoZXMgY2xrIGFuZCB3YXRj
aGRvZyB0cmVlcy4gSSB3b3VsZCBhcHByZWNpYXRlIGFja3Mgc28KPiA+IEkgY2FuIHRha2UgZXZl
cnl0aGluZyB0aHJvdWdoIFNhbXN1bmcgU29DIHRyZWUuIEkgaGF2ZSBsYXRlciBhIGJpZ2dlcgo+
ID4gc2V0IHdoaWNoIHdvdWxkIGNyZWF0ZSBjb25mbGljdHMgd2l0aCBpdCBbMV0uCj4gPgo+ID4K
PiA+IENoYW5nZXMgc2luY2UgdjE6Cj4gPiAxLiBGZXcgbmV3IHBhdGNoZXMsCj4gPiAyLiBBZGRy
ZXNzZWQgcmV2aWV3IGFyb3VuZCBjbGsgYW5kIHdhdGNoZG9nIGNoYW5nZXMgKHNlZSBjaGFuZ2Ug
bG9ncyBpbgo+ID4gICAgaW5kaXZpZHVhbCBwYXRjaGVzKS4KPiA+Cj4gPgo+ID4gWzFdIHYyIG9m
IEFybmQncyB3b3JrIGZvciBtYWtpbmcgUzNDMjR4eCBtdWx0aXBsYXRmb3JtOgo+ID4gaHR0cHM6
Ly9naXRodWIuY29tL2tyemsvbGludXgvdHJlZS9mb3ItbmV4dC9zM2MtbXVsdGlwbGF0Zm9ybS1j
bGVhbnVwLXcxLXdhcm5pbmdzLXYyCj4gSSBnYXZlIGEgYnVpbGQgYW5kIGJvb3QgdGVzdC4gTXkg
VElOWTY0MTAgYm9hcmQgc3RpbGwgd29ya3MhCj4gQWN0dWFsbHkgSSBoYWQgZGlkIHRoZSBzYW1l
IHRlc3QgZm9yIEFybmQncyBicmFuY2ggd2l0aCBsaW51eCB2NS41Cj4gYW5kIGl0IHdvcmtzIHRv
byEKCkdyZWF0ISBUaGFua3MgZm9yIHRlc3RpbmcuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
