Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE96E6B1C73
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 08:35:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A7A3C6A60C;
	Thu,  9 Mar 2023 07:35:35 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98DCCC65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 07:35:34 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-536c02eea4dso19650037b3.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Mar 2023 23:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678347333;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BdV+4ekYzEX2zluka+Ae9nWocB3Egh4fr8hk8d8QYXw=;
 b=EKqMsvpzCXKMI5aX8f3xs8CPEOPXJewyVNUUcFc3G1GZMv/azP+RNWKyKqL46InX6N
 hFsidcfiHk+6LTbg40j/pNi4FctywQqkqtTldJuHmmK2wWJn1CGiyvwXmPNFUd7MYS9s
 yBIzGzMnbRqvgBdI7k7BBCzZDBOLSa/MEd7XCq0eV4vRemoZEtoIyNo9ZhllagHDMGt+
 SvISprl8K2ROh7M+n/VGk22USiGzWlY90WvsynSqZ+IBRcJ0XEMrVx57kv/19euyyO3r
 pQtwcGlJksyL4OyHuGAloXQOjiSLg3amE7olnED8VAI2gGJ59whqvSJjl9YCF/g9Uhrm
 8lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678347333;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BdV+4ekYzEX2zluka+Ae9nWocB3Egh4fr8hk8d8QYXw=;
 b=6edjtMT4ATMluxoFCy/y6WoIg2OrTU8pA2TFrHwfd+EDQhTgqtL5hNFzBM1yKrIb5V
 ArQYDEFK1KOEY6qMNF9ZGxBQ3ck/CfznQY7zoP9PF2bwiXT3cwndUjPOz6CeHsZ9QODG
 +tKNUpGr2phPNYbQhDyvz7pn878TRd9WYBd6pdu+y3sNtf3N5IkXDkwQTU7BLAckFZvp
 UO3JyYk+kIcssNP2O464VXjh00XhI0WSfRliGcg3q7yTiRimSauAn5F1nWw9uaXAElEo
 rD5GdNB43z5/U4E3lZZBF2fdZzZlIdAt7NGX7LXrZmlFfqHNOUuQdP8qiIK9KVWgNVIw
 lW1w==
X-Gm-Message-State: AO0yUKUBDpZTgoxvdfTQ7zNDWHuuhCmaUyRgbetcKeEn/Z2p2MYciDQi
 JV08ZMJKMPZsZuHFaQTa/nMe0o4SthePmJgzXIuJYzklGzATPMWo6sI=
X-Google-Smtp-Source: AK7set9Ja/GCRaDydWCAyQwBS9jZIATgAx4CvCrcuDDV4SJYEpzXZqeohZJdyNwu6e4Mu4KnpP+hODHjLJmyQAVNWdQ=
X-Received: by 2002:a81:b149:0:b0:530:b21f:d604 with SMTP id
 p70-20020a81b149000000b00530b21fd604mr5782757ywh.9.1678347333493; Wed, 08 Mar
 2023 23:35:33 -0800 (PST)
MIME-Version: 1.0
References: <E1pZ2fs-000e27-4H@formenos.hmeau.com>
 <CACRpkdY8iN_ga0VuQ-z=8KUWaJ6=5rh2vZEwcp+oNgcBuPFk=g@mail.gmail.com>
 <ZAcNhtm/+mik1N2m@gondor.apana.org.au>
 <CACRpkdbcrCa9v82xVWtixWdDPvCu6E6Rkw-3Vg3APisdvYGwqQ@mail.gmail.com>
 <ZAf/rAbc3bMIwBcr@gondor.apana.org.au> <ZAgDku9htWcetafb@gondor.apana.org.au>
 <CACRpkdZ-zPZG4jK-AF2YF0wUFb8qrKBeoa4feb1qJ9SPusjv+Q@mail.gmail.com>
 <ZAhfBmlNHUpGEwW3@gondor.apana.org.au> <ZAhhGch6TtI8LA6x@gondor.apana.org.au>
 <CACRpkdabjrpsiVgm=EyGrTK7PGXth6FdvxSp=QULA+LyqtdBgg@mail.gmail.com>
 <ZAl1gGCv51FKOXtm@gondor.apana.org.au>
In-Reply-To: <ZAl1gGCv51FKOXtm@gondor.apana.org.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Mar 2023 08:35:21 +0100
Message-ID: <CACRpkdY4gAT7RUtL6ctcsqxEX2_rZMyjMktPta7e4UB19OyGow@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v5 PATCH 7/7] crypto: stm32 - Save and restore
	between each request
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

T24gVGh1LCBNYXIgOSwgMjAyMyBhdCA2OjU44oCvQU0gSGVyYmVydCBYdSA8aGVyYmVydEBnb25k
b3IuYXBhbmEub3JnLmF1PiB3cm90ZToKPiBPbiBXZWQsIE1hciAwOCwgMjAyMyBhdCAxMDoxOTo0
OFBNICswMTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+ID4KPiA+IFNvIG5vdyB0aGUgZHJpdmVy
IGlzIGZpeGVkIGZyb20gYSBVeDUwMCBwb2ludCBvZiB2aWV3Lgo+Cj4gSSB0aGluayB0aGVyZSBp
cyBhY3R1YWxseSBhIG5hc3R5IGJ1ZyBpbiBpdCB0aGF0IG1heSBiZSBoYXJkIHRvCj4gdHJpZ2dl
ci4KPgo+IFRoZSBzdG0zMiBkcml2ZXIgYXMgaXQgc3RhbmRzIHdpbGwgd3JpdGUgdXAgdG8gMjU2
IGJ5dGVzIGludG8KPiB0aGUgRklGTyB3aGljaCBvbiB0aGUgdXg1MDAgaXMgbGltaXRlZCB0byA2
NCBieXRlcy4gIFdlIG5lZWQgdG8KPiBjaGFuZ2UgdGhlIGZpeGVkIDI1Ni1ieXRlIHNpemUgdG8g
YmUgZGVwZW5kZW50IG9uIHRoZSBoYXJkd2FyZQo+IHR5cGUuCgpSaWdodCBzbyB0aGF0IGlzIGRv
bmUgaW1wbGljaXRseSBieSB1c2luZyBhIGJ1ZmZlciBvZiAyNTYgYnl0ZXMuCgpCdXQgYWN0dWFs
bHkgSSB0aGluayB0aGUgYnVnIHdpbGwgbmV2ZXIgdHJpZ2dlciwgYmVjYXVzZSB0aGUgZGF0YXNo
ZWV0CmZvciB0aGUgREI4NTAwIChVeDUwMCkgc2F5cyB0aGlzOgoKIlRoZW4gdGhlIG1lc3NhZ2Ug
Y2FuIGJlIHNlbnQsIGJ5IHdyaXRpbmcgaXQgd29yZCBwZXIgd29yZCBpbnRvIHRoZQpIQVNIX0RJ
TiByZWdpc3Rlci4KV2hlbiBhIGJsb2NrIG9mIDUxMiBiaXRzLCBpLmUuIDE2IHdvcmRzIGhhdmUg
YmVlbiB3cml0dGVuLCBhIHBhcnRpYWwKZGlnZXN0IGNvbXB1dGF0aW9uIHdpbGwKc3RhcnQgdXBv
biB3cml0aW5nIHRoZSBmaXJzdCBkYXRhIG9mIHRoZSBuZXh0IGJsb2NrLiBUaGUgQUhCIGJ1cyB3
aWxsCmJlIGJ1c3kgZm9yIDgyIGN5Y2xlcyBmb3IKU0hBLTEgYWxnb3JpdGhtICg2NiBjeWNsZXMg
Zm9yIFNIQS0yNTYgYWxnb3JpdGhtKS4iCgpUaGUgd2F5IEkgaW50ZXJwcmV0IGl0IGlzIHRoYXQg
aWYgeW91IHdyaXRlIDY0IGJ5dGVzICgxNiAzMmJpdCB3b3JkcykKdGhlIEFIQiBidXMgd2lsbCBz
aW1wbHkKc3RhbGwgdW50aWwgdGhlIGRhdGEgaXMgcHJvY2Vzc2VkLCBzbyB0aGUgd3JpdGVsKCkg
aGFuZ3MgdGhlcmUgYW5kCnRoZW4gNjYvODIgYnVzIGN5Y2xlcwpsYXRlciBpdCB3aWxsIGNvbnRp
bnVlLgoKVGhpcyBpc24ndCB0aGUgcHJldHRpZXN0IGZyb20gYSBzeXN0ZW0gUG9WLCBhcyBpdCBj
YW4gc3RhbGwgaW50ZXJydXB0CmhhbmRsaW5nIGFuZApjYXVzZSBsYXRlbmN5IGppdHRlciwgYnV0
IGl0J3Mgbm90IGFjdHVhbGx5IGEgYnVnLiBJdCdzIGtpbmQgb2YKc2ltaWxhciB0byB0aGF0IHVz
ZXIKZXhwZXJpZW5jZSAiYnVnIiBvbiB4ODYgUENzIHdoZXJlIHRoZSBzb3VuZCBzdGFydHMgYnJl
YWtpbmcgdXAgaWYgeW91IGhhdmUgdG9vCmludGVuc2UgZ3JhcGhpY3MgZ29pbmcgb24sIGJlY2F1
c2UgdGhlIGJ1cyBpcyB0b28gYnVzeSBzbyB0aGUgc291bmQgRklGTyBnb2VzCmVtcHR5LgoKQnV0
IEkgY2FuIGNlcnRhaW5seSBtYWtlIGEgcGF0Y2ggdG8gc2hyaW5rIHRoZSBidWZmZXIgZnJvbSAy
NTYgdG8gNjQgYnl0ZXMgb24KVXg1MDAgaWYgaXQncyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8uCgpZ
b3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
