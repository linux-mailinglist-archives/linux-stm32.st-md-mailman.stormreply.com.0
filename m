Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 939DA72FA0B
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 12:05:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D054C6A61A;
	Wed, 14 Jun 2023 10:05:28 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE58AC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 10:05:27 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-bb3a77abd7bso488208276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 03:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686737126; x=1689329126;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Ae9OtuHFGy8oX3kZN3aX8TWXzvhsHlOVNH6KwSyYBM=;
 b=Us3KLmpNbztLlFCIjBK6FlhIA/8GqQHlxb2CJAzLSQRLPgKDI+kNEqXTXp8Xuj5653
 QZJv3UO+4NuEwpZGrkib9IyooWgmoU/mlyZna2WXaGCcmjg8wEZbzKw4X5XpPICcZuMf
 Suya2xCPWOHXf2HhsicifeUAwPeSJ4oFAQosGda/vbIzPeoXH6edMBZMWN6Qc6119Bn3
 6KDgmUIVNRvg4DQWDLJgLNVkFQjS5Db9O05GcSlvRw6xoMjAcHCgq3BjI3NcVCd1JJud
 FshL4YgjrfGQrAJhGXVfsEl+8OYoOp6zaipUwmTqFjIaUwi64ma1tN/eURV296E0K8ew
 LqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686737126; x=1689329126;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Ae9OtuHFGy8oX3kZN3aX8TWXzvhsHlOVNH6KwSyYBM=;
 b=BU3Dtj4ZUPhUmaZGkuOI3lPzrOkeRo1X9HiWHEsEZCWX6jz3Jzpp6rtD6es1isSovB
 q7e9W48cNdDCExrXIwzhGuv5qWlbOASvtD571bGhcESDHSb93G/5gc787ERE8LHMpYl4
 tLz8IMKREzpbhAFfVL/F/zE+iLN1jijWDvH8P00ArxL7nRyfXBSD+ygfA7ltc0N22Fdc
 Lets1ivTHVTYit2ZNFkNw9ItWYH9thpoJkaZ1U+P4Te4H6ajgswFldf7KFHQby4zm7jM
 ZZw+VWNZQ0B+XXyJBxRMv5siEmuO+BIiwvp9MQ1fEa3wBeF9aiTZ12Q2fUNzcJTYGYWZ
 izsw==
X-Gm-Message-State: AC+VfDykpGfMHfNPfvKntoDD/dOpNOHyZAsxJMQoRU4dimVrIkhS8FhG
 V7vuCSEbS84CACcZCo/2Gd7R3ZSt7HNUHtTMKgzo4g==
X-Google-Smtp-Source: ACHHUZ5ad4U15u9oHllT+swudTjsUEgS/M1+l81Mj6ke6PqhJHG8wnH1wdeT3A7kGOBvquZXrkoAPtmpbErc66rd6hQ=
X-Received: by 2002:a25:acd3:0:b0:bcd:3379:11b2 with SMTP id
 x19-20020a25acd3000000b00bcd337911b2mr1443925ybd.52.1686737126656; Wed, 14
 Jun 2023 03:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
 <20230405-pl180-busydetect-fix-v3-10-cd3d5925ae64@linaro.org>
 <CAPDyKFqxvNxFqLdpj15Gz+zDNT04YzxEAh-svKvRuaM52dCV3g@mail.gmail.com>
 <CACRpkdbg5UXnU=WcQa2HoGH54UK-C8+vU8t+7iLChvd__iJiMg@mail.gmail.com>
In-Reply-To: <CACRpkdbg5UXnU=WcQa2HoGH54UK-C8+vU8t+7iLChvd__iJiMg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 14 Jun 2023 12:04:50 +0200
Message-ID: <CAPDyKFoMNPHs3td-UBnqDdEK4i7aHybWfsba796BEXPQC-bzUQ@mail.gmail.com>
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

T24gVHVlLCAxMyBKdW4gMjAyMyBhdCAyMjozMiwgTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVp
akBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDEzLCAyMDIzIGF0IDI6MDjigK9Q
TSBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiA+IFR5cGlj
YWxseSwgdGhlIGNtZC0+YnVzeV90aW1lb3V0IGNvbnRhaW5zIHRoZSBjdXJyZW50IHZhbHVlIG9m
IHRoZQo+ID4gdGltZW91dCB0aGF0IHNob3VsZCBiZSB1c2VkIGZvciB0aGUgY29tbWFuZHMgdGhh
dCBoYXZlIHRoZSBmbGFncwo+ID4gTU1DX1JTUF9CVVNZIHNldCBmb3IgaXQuCj4gPgo+ID4gVGhl
IHN0bSB2YXJpYW50IGFscmVhZHkgdXNlcyBjbWQtPmJ1c3lfdGltZW91dCwgYnV0IGFsc28gYXNz
aWducyBhCj4gPiBkZWZhdWx0IHRpbWVvdXQsIGp1c3QgdG8gbWFrZSBzdXJlIGlmIHRoZSBjb3Jl
IGhhcyBmYWlsZWQgdG8gc2V0Cj4gPiBjbWQtPmJ1c3lfdGltZW91dCAoaXQgc2hvdWxkbid0IGJ1
dCB3aG8ga25vd3MpLgo+Cj4gSSBnZW5lcmFsaXplZCB0aGUgU1RNMzIgc29sdXRpb24gd2l0aCB0
aGUgY29yZS1zcGVjaWZpZWQgdGltZW91dAo+IGFuZCBkZWZhdWx0IGFuZCB1c2VkIHRoYXQuCj4K
PiBJZiB3ZSBrbm93IHRoZSBjb3JlIHdpbGwgYWx3YXlzIHByb3ZpZGUgY29ycmVjdCB0aW1lb3V0
cyB3ZSBzaG91bGQKPiBwcm9iYWJseSBkZWxldGUgaGFja3MgbGlrZSB0aGlzIHRob3VnaCAoYnV0
IHRoYXQgd291bGQgYmUgYSBzZXBhcmF0ZQo+IHBhdGNoKS4KPgo+ID4gPiArc3RhdGljIHZvaWQg
YnVzeV90aW1lb3V0X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ID4gPiArewo+ID4g
PiArICAgICAgIHN0cnVjdCBtbWNpX2hvc3QgKmhvc3QgPQo+ID4gPiArICAgICAgICAgICAgICAg
Y29udGFpbmVyX29mKHdvcmssIHN0cnVjdCBtbWNpX2hvc3QsIGJ1c3lfdGltZW91dF93b3JrLndv
cmspOwo+ID4gPiArICAgICAgIHUzMiBzdGF0dXM7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBkZXZf
ZGJnKG1tY19kZXYoaG9zdC0+bW1jKSwgInRpbWVvdXQgd2FpdGluZyBmb3IgYnVzeSBJUlFcbiIp
Owo+ID4gPiArICAgICAgIHN0YXR1cyA9IHJlYWRsKGhvc3QtPmJhc2UgKyBNTUNJU1RBVFVTKTsK
PiA+ID4gKyAgICAgICBtbWNpX2NtZF9pcnEoaG9zdCwgaG9zdC0+Y21kLCBzdGF0dXMpOwo+ID4K
PiA+IFRoZXJlJ3Mgbm8gbG9ja2luZyBoZXJlLiBJIGFzc3VtZSB0aGF0J3MgYmVjYXVzZSB3ZSBj
YWxsCj4gPiBjYW5jZWxfZGVsYXllZF93b3JrX3N5bmMoKSBmcm9tIGFuIGF0b21pYyBjb250ZXh0
IGFuZCB3ZSBkb24ndCB3YW50Cj4gPiB0aGF0IHRvIGhhbmcuCj4gPgo+ID4gSG93ZXZlciwgY2Fu
J3QgdGhlIGNhbGwgdG8gbW1jaV9jbWRfaXJxKCkgcmFjZSB3aXRoIGEgcHJvcGVyIGlycSBiZWlu
Zwo+ID4gbWFuYWdlZCBpbiBwYXJhbGxlbD8KPgo+IEl0IHdpbGwgbm90IGJlIGEgcHJvYmxlbSBB
RkFJQzogdGhlIE1NQ0kgaXMgdXNpbmcgbGV2ZWwgSVJRcywgbWVhbmluZyBpdAo+IHdpbGwgaGFu
ZGxlIGFsbCBmbGFncyB0aGF0IGFyZSBzZXQgZm9yIGNvbW1hbmQgb3IgZGF0YSBJUlFzIGJlZm9y
ZSBleGl0aW5nCj4gdGhlIElSUSBoYW5kbGVyLCB0aGUgb3JkZXIgb2YgdGhlIElSUSBoYW5kbGlu
ZyBpZiBzZXZlcmFsIGZpcmUgYXQgdGhlIHNhbWUKPiB0aW1lIGlzIGFjdHVhbGx5IGRlcGVuZGVu
dCBvbiB0aGUgb3JkZXIgdGhlIElSUSBmbGFncyBhcmUgY2hlY2tlZCBpbiB0aGUKPiBjb2RlLgo+
Cj4gV2hlbiB0aGUgaW50ZXJydXB0IGhhbmRsZXIgZXhpdHMsIGFsbCBJUlFzIHNob3VsZCBiZSBo
YW5kbGVkIGFuZCB0aGUKPiByZXNwZWN0aXZlIElSUSBsaW5lcyBhbmQgdGh1cyB0aGUgSVJRIGZy
b20gdGhlIE1NQ0kgc2hvdWxkIGJlCj4gZGUtYXNzZXJ0ZWQuCgpSaWdodCwgSSB0aGluayBJIGZv
bGxvdy4KCj4KPiBJbiB0aGlzIGNhc2UsIG91ciBwcm9ibGVtIGlzIHRoYXQgYW4gaW50ZXJydXB0
IGlzIG5vdCBmaXJlZCBhdCBhbGwsIGJ1dCBpZgo+IHRoZSBhY3R1YWwgSVJRICh0aGF0IHNob3Vs
ZCBoYXZlIGJlZW4gZmlyZWQpIG9yIGEgdG90YWxseSBkaWZmZXJlbnQgSVJRCj4gKHN1Y2ggYXMg
YW4gZXJyb3IpIGlzIGZpcmVkIGF0IHRoZSBzYW1lIHRpbWUgZG9lc24ndCBtYXR0ZXI6IHRoZSBw
ZW5kaW5nCj4gSVJRcyB3aWxsIGJlIGhhbmRsZWQsIGFuZCBpZiB0aGUgdGltZXIgdGhlbiBmaXJl
cyBhbiBhZGRpdGlvbmFsIElSUQo+IHRoZSBJUlEgaGFuZGxlciB3aWxsIGNoZWNrIGlmIHRoZXJl
IGFyZSBhbnkgSVJRcyB0byBoYW5kbGUgYW5kIHRoZW4KPiBjb25jbHVkZSB0aGVyZSBpc24ndCBh
bmQgdGhlbiBqdXN0IHJldHVybi4KClRvIGNsYXJpZnksIEkgYW0gbm90IHdvcnJpZWQgYWJvdXQg
dGhlIElSUSBoYW5kbGluZyBhcyBzdWNoLgoKSG93ZXZlciwgd2UgdXNlIHRoZSBzcGluX2xvY2sg
dG8gcHJvdGVjdCBzb21lIG1lbWJlcnMgaW4gdGhlIHN0cnVjdAptbWNpX2hvc3QuIEluIHRoaXMg
Y2FzZSwgdGhlIG1tY2lfY21kX2lycSgpIGlzIHVzaW5nICJob3N0LT5jbWQiIHRvCnVuZGVyc3Rh
bmQgd2hldGhlciB0aGVyZSBpcyBhbiBhY3RpdmUgY29tbWFuZCB0byBtYW5hZ2UuIFdoZW4gdGhl
CmNvbW1hbmQgaGFzIGJlZW4gY29tcGxldGVkLCB3ZSBzZXQgaG9zdC0+Y21kIHRvIE5VTEwuCgpb
Li4uXQoKS2luZCByZWdhcmRzClVmZmUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
