Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B41046E4D7F
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Apr 2023 17:45:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AB3DC6A5FA;
	Mon, 17 Apr 2023 15:45:14 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3088C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 15:45:12 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id m14so8902215ybk.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 08:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681746312; x=1684338312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uANFHxB7VX4MKOqAT03m5zUc2hsluyqpfayDw7cl3qo=;
 b=PZF34qnfyoYRJcFP1ogjCGlY/ygSGtZD9bteKHJ8KnexMd9CA9BlfGDrXXU225+Xd3
 F+RLg+bFv5zNZ2mcKtB4HrNeKZzT3GYAVsHP7yi12puMtybiUufzFVovZDDSpUgr/Rhs
 FcsNOdqTdZmqIiiJvZnmANp3uQPcqHnqgSea1qe2tidkcDd1Cozx+tprAUwl0p8VsLA4
 WlXjeMLyV9NWblb5+o0pFHlb4GDF4kw8+HOD3RdoC2sJn9gcf0+OtCxGYND0m+ksXM3X
 Ia1wK9DN2Z3qTTDzn3jQFClR/2F3ybiqCx0DyxaVjlXsi894JBxeoWzRFrGpMbH98j4k
 192g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681746312; x=1684338312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uANFHxB7VX4MKOqAT03m5zUc2hsluyqpfayDw7cl3qo=;
 b=X8XDv5pbpW9woCCpLI/4dSpCTCoMBWOwwTVeqgnsM2A9a3k8c47aGDUvuYRwcz0pZd
 +YqIs8+JaFx10kRA0k5+4+/JQIDa60N+pUXhaCRQi+lQlXtkch1KqhnBq9WJT41ah1DU
 Ei7VSaIZm+O3f7YfrQT8xWd/x+fkqAzuGOm6QPL29xUdaZ0kWqa725vIFlaMvKV0BZRv
 L2HdUWyE8s7en2pF75jObPispG0pguNzT/1Qwlq0IADAzJQTam87g4vuSUaaHuRi5MeD
 UIs90CpYDInHGJnwqaHfHxjzZ5n70rYxzdpxjB3mRcEt9kAkvYcv+kdWpXsVpqZZiABh
 6SjQ==
X-Gm-Message-State: AAQBX9c38z8hgK6kBg7/IPDFpNMNbelDYp9hz+leRb6yIqvtldCEviV3
 x5BMBpFrP3G60kRBLXLZGN8PH58cBI8r0CBwaw0F4w==
X-Google-Smtp-Source: AKy350aP3QOBtKNOKLMPeIj6ZU5lTp6Gy8tKj3WVIbX8o1x6LPTFlznGCtNCfBQvT4N4le9tSNlg9CG3O6I67WJchGY=
X-Received: by 2002:a25:76c4:0:b0:b75:8ac3:d5d2 with SMTP id
 r187-20020a2576c4000000b00b758ac3d5d2mr9968546ybc.4.1681746311834; Mon, 17
 Apr 2023 08:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
 <20230405-pl180-busydetect-fix-v2-4-eeb10323b546@linaro.org>
 <CAPDyKFpoboq68_ysEJXCWLV8k77+ULGpF6AzcnjvUqO96r5FHw@mail.gmail.com>
In-Reply-To: <CAPDyKFpoboq68_ysEJXCWLV8k77+ULGpF6AzcnjvUqO96r5FHw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Apr 2023 17:45:00 +0200
Message-ID: <CACRpkdbwD2hO7f5VWZubYoDXFHA0Zx3k9cYYG841361zFqEFYQ@mail.gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 04/12] mmc: mmci: Break out error check
	in busy detect
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

T24gTW9uLCBBcHIgMTcsIDIwMjMgYXQgMzoyNOKAr1BNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3Nv
bkBsaW5hcm8ub3JnPiB3cm90ZToKPiBPbiBTdW4sIDkgQXByIDIwMjMgYXQgMDA6MDAsIExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPgo+ID4gVGhlIGJ1
c3kgZGV0ZWN0IGNhbGxiYWNrIGZvciBVeDUwMCBjaGVja3MgZm9yIGFuIGVycm9yCj4gPiBpbiB0
aGUgc3RhdHVzIGluIHRoZSBmaXJzdCBpZigpIGNsYXVzZS4gVGhlIG9ubHkgcHJhY3RpY2FsCj4g
PiByZWFzb24gaXMgdGhhdCBpZiBhbiBlcnJvciBvY2N1cnMsIHRoZSBpZigpLWNsYXVzZSBpcyBu
b3QKPiA+IGV4ZWN1dGVkLCBhbmQgdGhlIGNvZGUgZmFsbHMgdGhyb3VnaCB0byB0aGUgbGFzdAo+
ID4gaWYoKS1jbGF1c2UgaWYgKGhvc3QtPmJ1c3lfc3RhdHVzKSB3aGljaCB3aWxsIGNsZWFyIGFu
ZAo+ID4gZGlzYWJsZSB0aGUgaXJxLiBNYWtlIHRoaXMgZXhwbGljaXQgaW5zdGVhZDogaXQgaXMg
ZWFzaWVyCj4gPiB0byByZWFkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWog
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiA+IC0tLQo+ID4gQ2hhbmdlTG9nIHYxLT52MjoK
PiA+IC0gTm8gY2hhbmdlcwo+ID4gLS0tCj4gPiAgZHJpdmVycy9tbWMvaG9zdC9tbWNpLmMgfCAx
MSArKysrKysrKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvbW1jaS5jIGIv
ZHJpdmVycy9tbWMvaG9zdC9tbWNpLmMKPiA+IGluZGV4IGU3NDJkZWRhY2ExYS4uN2Q0MjYyNWYy
MzU2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9tbWNpLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvbW1jL2hvc3QvbW1jaS5jCj4gPiBAQCAtNjY1LDYgKzY2NSwxNSBAQCBzdGF0aWMgYm9v
bCB1eDUwMF9idXN5X2NvbXBsZXRlKHN0cnVjdCBtbWNpX2hvc3QgKmhvc3QsIHUzMiBzdGF0dXMs
IHUzMiBlcnJfbXNrKQo+ID4gIHsKPiA+ICAgICAgICAgdm9pZCBfX2lvbWVtICpiYXNlID0gaG9z
dC0+YmFzZTsKPiA+Cj4gPiArICAgICAgIGlmIChzdGF0dXMgJiBlcnJfbXNrKSB7Cj4gPiArICAg
ICAgICAgICAgICAgLyogU3RvcCBhbnkgb25nb2luZyBidXN5IGRldGVjdGlvbiBpZiBhbiBlcnJv
ciBvY2N1cnMgKi8KPiA+ICsgICAgICAgICAgICAgICB3cml0ZWwoaG9zdC0+dmFyaWFudC0+YnVz
eV9kZXRlY3RfbWFzaywgYmFzZSArIE1NQ0lDTEVBUik7Cj4gPiArICAgICAgICAgICAgICAgd3Jp
dGVsKHJlYWRsKGJhc2UgKyBNTUNJTUFTSzApICYKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
fmhvc3QtPnZhcmlhbnQtPmJ1c3lfZGV0ZWN0X21hc2ssIGJhc2UgKyBNTUNJTUFTSzApOwo+ID4g
KyAgICAgICAgICAgICAgIGhvc3QtPmJ1c3lfc3RhdHVzID0gMDsKPiA+ICsgICAgICAgICAgICAg
ICByZXR1cm4gdHJ1ZTsKPgo+IEkgYWdyZWUgdGhhdCB0aGlzIG1ha2VzIHRoZSBjb2RlIG1vcmUg
ZXhwbGljaXQsIGJ1dCB1bmZvcnR1bmF0ZWx5IGl0Cj4gYWxzbyBtZWFucyBkdXBsaWNhdGluZyB0
aGUgY29kZSBmcm9tIHRoZSBib3R0b20gb2YgdGhpcyBmdW5jdGlvbi4KPgo+IENhbiB5b3UgaW5z
dGVhZCBhZGQgYSBoZWxwZXIgZnVuY3Rpb24gYW5kIGNhbGwgaXQgZnJvbSBoZXJlIGFuZCBmcm9t
Cj4gdGhlIHBhcnQgYXQgdGhlIGJvdHRvbT8KCkkgYnJlYWsgdGhhdCBvdXQgYXMgYSBzZXBhcmF0
ZSBmdW5jdGlvbiBpbiBwYXRjaCA5LCBjYW4geW91IGNoZWNrIGlmCnRoYXQgc29sdmVzIHRoZSBw
cm9ibGVtPyBUaGUgZW5kIHJlc3VsdCBhZnRlciBhbGwgdGhlIHBhdGNoZXMgc2hvdWxkCmJlIGZp
bmUuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
