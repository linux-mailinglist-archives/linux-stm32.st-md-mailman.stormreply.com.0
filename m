Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA20B72FE5D
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 14:22:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77A27C6A61A;
	Wed, 14 Jun 2023 12:22:19 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C03F8C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 12:22:17 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-b9a6eec8611so870129276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 05:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686745336; x=1689337336;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CHdjEjrtCdpZyiizDN/ie3cwcnch5LfPuYdQaiOTIAg=;
 b=LVRQnZcEgWtK2LpBkWBxcXb4bX2U29PkGGS8cZBMZoQZl22CXGMiJ+SJ0HAyDNR7Cy
 v4Koqh4BFBPybWr4fFnnlWAWlYKcu6De6V3HPN8zVc9Soll60+bh8CM0C+GR1gAQKUJv
 JAfkwT6qycr64w9HO5PCcBdV5MmkAQi7C+AjaodJJ67oz5FTSyXRMV1VmQ4943wTV5FZ
 dAnr/C7jMRLVIyZIjeHRLTM2+xoX64YV9kV24OJDJOMCFXiE3F67cOjHHkFbt+BycFz2
 eLQrP+MYS+kfpwXUVMd7rCI74E57dhsH4hGGHsFSfsYmZtqv8YtOBA9omzloEAg1Y7el
 jmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686745336; x=1689337336;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHdjEjrtCdpZyiizDN/ie3cwcnch5LfPuYdQaiOTIAg=;
 b=eSyx9OZGQc7Slm26HY4rEC+wLQsXP1IMxdD0+5pXw/FWogMTbOo6xklT4c4xBpjPCH
 Q1jmh/24PdC8hjSucr+eLJ0bd0Z+UZYuk3CmTcMZeKhn0uXyIIIWzWAFIt2Al+zKJlxi
 eEIbXpRIXzHHqO82m/Ffeor0UJ67qZQs5piUNnCw/V79EssptsbISKjVZlcPFHoWj/En
 Q7ZmPTR45x9BY626HiY7e+2rmi6bePUpztYAneWwcZEvpHsUDMNDBZyZBOKVLBxUWcrq
 eSy5OqsHb8OKlqWajCkn0amxmArS+kTorT5ZMJ+VMGyB2+iANxCXyc7Had5RO0FeB77x
 1p6Q==
X-Gm-Message-State: AC+VfDxJmRdHsHn1c8rHawusECO9poHuMoTDCz2Ey8ROvum3H5YGCsi0
 thCjtRE/ZV7OTrBksGWPHa5qqCUUnDjFp3xHIz3B2Q==
X-Google-Smtp-Source: ACHHUZ7agZuy3/Y1zHNX0/AKRTma1MumQbVPRJCI/cQ4hMsuAx0VjmuLvI3ZIVmGS0lRTBMrgi87SYklphIen6Pzfsk=
X-Received: by 2002:a25:2d10:0:b0:bab:8be5:697d with SMTP id
 t16-20020a252d10000000b00bab8be5697dmr1535020ybt.32.1686745336679; Wed, 14
 Jun 2023 05:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
 <20230405-pl180-busydetect-fix-v3-10-cd3d5925ae64@linaro.org>
 <CAPDyKFqxvNxFqLdpj15Gz+zDNT04YzxEAh-svKvRuaM52dCV3g@mail.gmail.com>
 <CACRpkdbg5UXnU=WcQa2HoGH54UK-C8+vU8t+7iLChvd__iJiMg@mail.gmail.com>
 <CAPDyKFoMNPHs3td-UBnqDdEK4i7aHybWfsba796BEXPQC-bzUQ@mail.gmail.com>
 <CACRpkdbYNn0S7AXn_sbPb+o8L_DcffKat=tR0mLtNiBhgy7UEg@mail.gmail.com>
In-Reply-To: <CACRpkdbYNn0S7AXn_sbPb+o8L_DcffKat=tR0mLtNiBhgy7UEg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 14 Jun 2023 14:21:40 +0200
Message-ID: <CAPDyKFqZsQ+wHdh1FYZwBxiar=9SeobiucaTVhPyQzHgAq-CWQ@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 10/10] mmc: mmci: Add busydetect timeout
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

T24gV2VkLCAxNCBKdW4gMjAyMyBhdCAxMzoxNywgTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVp
akBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVuIDE0LCAyMDIzIGF0IDEyOjA14oCv
UE0gVWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gPiBIb3dl
dmVyLCB3ZSB1c2UgdGhlIHNwaW5fbG9jayB0byBwcm90ZWN0IHNvbWUgbWVtYmVycyBpbiB0aGUg
c3RydWN0Cj4gPiBtbWNpX2hvc3QuIEluIHRoaXMgY2FzZSwgdGhlIG1tY2lfY21kX2lycSgpIGlz
IHVzaW5nICJob3N0LT5jbWQiIHRvCj4gPiB1bmRlcnN0YW5kIHdoZXRoZXIgdGhlcmUgaXMgYW4g
YWN0aXZlIGNvbW1hbmQgdG8gbWFuYWdlLiBXaGVuIHRoZQo+ID4gY29tbWFuZCBoYXMgYmVlbiBj
b21wbGV0ZWQsIHdlIHNldCBob3N0LT5jbWQgdG8gTlVMTC4KPgo+IEhtIHJpZ2h0Li4uCj4KPiBJ
J20gbGVhbmluZyB0b3dhcmQgc29tZSBjYXRjaC1hbGwgbGlrZToKPgo+IGlmICghaG9zdC0+Y21k
KQo+ICAgc3RhdGUgPSBNTUNJX0JVU1lfRE9ORTsKPgo+IGFzIGlmIHRoZXJlIGlzIG5vIGNvbW1h
bmQgZ29pbmcgb24gdGhlbiBzdXJlbHkgbm90aGluZyBpcyBidXN5IG9uIHRoZQo+IGhvc3QgY29u
dHJvbGxlci4KClJpZ2h0LCBzbyBhdCB3aGF0IHBvaW50IGRvIHlvdSB3YW50IHRvIGFkZCB0aGlz
IGNoZWNrPwoKS2luZCByZWdhcmRzClVmZmUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
