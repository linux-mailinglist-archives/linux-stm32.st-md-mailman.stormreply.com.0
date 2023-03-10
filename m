Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B606B3816
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Mar 2023 09:07:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3861C6A60D;
	Fri, 10 Mar 2023 08:07:18 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22C1DC6A609
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 08:07:18 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-536b7ffdd34so83236507b3.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 00:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678435637;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jw1klYT9RaIWxpFazeGMYob5ys/brYArmV5raMNaLPc=;
 b=Gyc+E3EVSuLRdPKcP7zO4yGyJhJPPLrVEpotEuxtrRoeDB5XL15J8EAqBlwRFVeCxY
 cuqAMfGM6nFKWutRwH4Q9WkgWvYK0o7yLqO94zXVS75wP/r/74/+ED4gpHdwexm4s3fb
 wkulb28BmXAbcjbuTKSFN+wT+eRn9ooHM1NOyzKk3RXTDc3xzba6fdcBAPXWH5Bw8nqt
 oXEfhxYQW1kVfNWskUbDHg/ijZLc49YYo1sTgwFtoz5YTyxOJ6K0TGqSMLGq1gRTt9ur
 sgK/LGn6LH7z43r0U2sSlCeJA/pl1nnPat9xu70I5YDlvHlmeg7fwvpOdjpPiB0sRB4k
 zb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678435637;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jw1klYT9RaIWxpFazeGMYob5ys/brYArmV5raMNaLPc=;
 b=R8wdvDN47i2KI0kaiLCT62RM9mz4J7naIocX2d11+0DvFKVfkbxzVXQyBTivMaIi66
 yByu+8rXLSIFfMPUSRulBQgn7kDk3lHQl/S9jAMwh3Yc54/dWxnNSSUSoOiYKs2VOelr
 L4n8krYYiUN/yfZqPEJ2E5i2vdUHNKmRLVkqzv1wquV2kPZQtn516anZzgN8qleLjO2x
 HmorhFdb5LxxVBfhLauUCM3LrUDkEVfZkOLPfcAPtneepzHykMcgS15zAJ23LzAS/j4l
 +Oq0OSaqYySXEceowluquSkAa3q0/wlGX8Th6td2jNXCBHChla8OcZvisaIKlNMjxlfk
 7R2A==
X-Gm-Message-State: AO0yUKU9aOHiL3kqZ74tMutKUIyg9dNOQwEGoJ4gM1iAjxPWmA62zjQs
 6Za0Nt2JyKUf2uiUkha8Nm1Y2geowZfAwRIcULZycQ==
X-Google-Smtp-Source: AK7set/1koA4JEyi13DQbf+nUH3Kr7dvQ7DrCg729Ix0wUh5BWCsFSbfKhGq3T1AbjISUEnBRDgBCNrqZ05XlO9SRII=
X-Received: by 2002:a81:4317:0:b0:52e:dddf:82b9 with SMTP id
 q23-20020a814317000000b0052edddf82b9mr16304287ywa.10.1678435636785; Fri, 10
 Mar 2023 00:07:16 -0800 (PST)
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
 <CACRpkdY4gAT7RUtL6ctcsqxEX2_rZMyjMktPta7e4UB19OyGow@mail.gmail.com>
 <dac62e9452a5417e9de00546d1aae1f4@AcuMS.aculab.com>
In-Reply-To: <dac62e9452a5417e9de00546d1aae1f4@AcuMS.aculab.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 10 Mar 2023 09:07:04 +0100
Message-ID: <CACRpkdZZ8ZoKjo-inJi7pwxF8FvfVn_ow1rgo0gdMCnok7ZmCw@mail.gmail.com>
To: David Laight <David.Laight@aculab.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Li kunyu <kunyu@nfschina.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

T24gVGh1LCBNYXIgOSwgMjAyMyBhdCAxMToxOeKAr1BNIERhdmlkIExhaWdodCA8RGF2aWQuTGFp
Z2h0QGFjdWxhYi5jb20+IHdyb3RlOgoKPiA+IEJ1dCBhY3R1YWxseSBJIHRoaW5rIHRoZSBidWcg
d2lsbCBuZXZlciB0cmlnZ2VyLCBiZWNhdXNlIHRoZSBkYXRhc2hlZXQKPiA+IGZvciB0aGUgREI4
NTAwIChVeDUwMCkgc2F5cyB0aGlzOgo+ID4KPiA+ICJUaGVuIHRoZSBtZXNzYWdlIGNhbiBiZSBz
ZW50LCBieSB3cml0aW5nIGl0IHdvcmQgcGVyIHdvcmQgaW50byB0aGUKPiA+IEhBU0hfRElOIHJl
Z2lzdGVyLgo+ID4gV2hlbiBhIGJsb2NrIG9mIDUxMiBiaXRzLCBpLmUuIDE2IHdvcmRzIGhhdmUg
YmVlbiB3cml0dGVuLCBhIHBhcnRpYWwKPiA+IGRpZ2VzdCBjb21wdXRhdGlvbiB3aWxsCj4gPiBz
dGFydCB1cG9uIHdyaXRpbmcgdGhlIGZpcnN0IGRhdGEgb2YgdGhlIG5leHQgYmxvY2suIFRoZSBB
SEIgYnVzIHdpbGwKPiA+IGJlIGJ1c3kgZm9yIDgyIGN5Y2xlcyBmb3IKPiA+IFNIQS0xIGFsZ29y
aXRobSAoNjYgY3ljbGVzIGZvciBTSEEtMjU2IGFsZ29yaXRobSkuIgo+Cj4gV2hhdCBzcGVlZCBj
bG9jayBpcyB0aGF0PwoKMTMzIE1Iei4KCj4gNCBvciA1IGV4dHJhIGNsb2Nrcy93b3JkIG1heSAo
b3IgbWF5IG5vdCkgYmUgc2lnbmlmaWNhbnQuCj4KPiBJbiB0ZXJtcyBvZiBsYXRlbmN5IGl0IG1h
eSBiZSBub2lzZSBjb21wYXJlZCB0byBzb21lIFBDSWUKPiByZWFkcyBkb25lIGJ5IGhhcmR3YXJl
IGludGVycnVwdCBoYW5kbGVycy4KPiBTb21lIHNsb3cgUENJZSB0YXJnZXRzIChsaWtlIHRoZSBm
cGdhIG9uZSB3ZSB1c2UpIHByZXR0eQo+IG11Y2ggdGFrZSAxdXMgdG8gaGFuZGxlIGEgcmVhZCBj
eWNsZS4KClNvIGluIHRoaXMgY2FzZSBpdCdzIDEvMTMzTSBzID0gOG5zIGN5Y2xlIHRpbWUsIDgy
IGluIHdvcnN0IGNhc2UsCnNvIDgyKjggPSA2NTYgbnMgPCAxIHVzLgoKWW91cnMsCkxpbnVzIFdh
bGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
