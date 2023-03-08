Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5BB6B13A5
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 22:20:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EDCCC6A5EB;
	Wed,  8 Mar 2023 21:20:03 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98AA7C6907D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Mar 2023 21:20:01 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id n18so15998468ybm.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Mar 2023 13:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678310400;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PSIFsDTreEMYqWcBFFFldz/NuhtBdSadwLg4qO3dsHg=;
 b=rO4Jn0Y8Ac4hNa1cvz1yejx0BwU/1MVMCboeLj4QLHe+hkbsRSvlXb7/mMXDeKpE1P
 mKo37lLX9JHQvegWc8xOd0kBtAOdnpDhq58RkfGlNdmLwqnkovHpGPQBaJ+qUbCKy43Y
 JLXSrHYRuB8aHwGZiMo8p8vGt8fWsbZ0qsBVuG0FxFogLxD9SDlETZ80O/85oNqXcJOZ
 ObT4h7ffKmPOTv6RgMfnkRvgUUEiKx1qxAbZqrBR40o8SmHCgLGHEKzSC01OVlRQCRp9
 yYJb8avhxsn92/lzgij4ChE5jJ2BQQUbduL/l14X97cKHbyqttVwsnaaIBY6at4ZabjU
 hZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678310400;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PSIFsDTreEMYqWcBFFFldz/NuhtBdSadwLg4qO3dsHg=;
 b=7+DxwsGBrTo7CWHQinCfL+DAkt58LHR+vPhl5UX9amcQ4lO0K6CIdMZ2br1RHiKDZz
 HKlu5LWu1UpVkVzGcPVxI5wGb/4NrfDDPway42+z+BFaFL9soLuLw+BxMobgO3EuoCgd
 UzeJT2r57d4QBdShClJARQLULoLwkuj8euty974jKHE/fIHgAN6G7GvGrmD14c16mPhz
 rVKMnIcRAZxVDE+S8zk9FZ15kQS6g65xOb5sigU/ys9wL2ism5MlhYi/t4S12elGYXGp
 kx6LXc5dyQxUM8CTRBy1aHiEUv7CUVkhMHYUYpDJ7MwPR3j1KsvCF2tm5dbVMNUBUf+G
 4nRQ==
X-Gm-Message-State: AO0yUKW1f6v1q4iMWr3JhpD4x+KpbP3kEG4q9KIvyioflOslHYIoLHMG
 iP/vNtN7pVg3+xulo6rJYsXCVYT60c06w1TFXIL4oQ==
X-Google-Smtp-Source: AK7set+grXEhSPe+la+RXfwW6OHLLiBy3oLCvvV+ccPRPmXC4zZYvHHbtIgJYOJjfhNO0i29VmndKFORJELmtcXtc9A=
X-Received: by 2002:a5b:1cb:0:b0:a6b:bc64:a0af with SMTP id
 f11-20020a5b01cb000000b00a6bbc64a0afmr11827487ybp.4.1678310400455; Wed, 08
 Mar 2023 13:20:00 -0800 (PST)
MIME-Version: 1.0
References: <ZAVu/XHbL9IR5D3h@gondor.apana.org.au>
 <E1pZ2fs-000e27-4H@formenos.hmeau.com>
 <CACRpkdY8iN_ga0VuQ-z=8KUWaJ6=5rh2vZEwcp+oNgcBuPFk=g@mail.gmail.com>
 <ZAcNhtm/+mik1N2m@gondor.apana.org.au>
 <CACRpkdbcrCa9v82xVWtixWdDPvCu6E6Rkw-3Vg3APisdvYGwqQ@mail.gmail.com>
 <ZAf/rAbc3bMIwBcr@gondor.apana.org.au> <ZAgDku9htWcetafb@gondor.apana.org.au>
 <CACRpkdZ-zPZG4jK-AF2YF0wUFb8qrKBeoa4feb1qJ9SPusjv+Q@mail.gmail.com>
 <ZAhfBmlNHUpGEwW3@gondor.apana.org.au> <ZAhhGch6TtI8LA6x@gondor.apana.org.au>
In-Reply-To: <ZAhhGch6TtI8LA6x@gondor.apana.org.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 8 Mar 2023 22:19:48 +0100
Message-ID: <CACRpkdabjrpsiVgm=EyGrTK7PGXth6FdvxSp=QULA+LyqtdBgg@mail.gmail.com>
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

T24gV2VkLCBNYXIgOCwgMjAyMyBhdCAxMToxOeKAr0FNIEhlcmJlcnQgWHUgPGhlcmJlcnRAZ29u
ZG9yLmFwYW5hLm9yZy5hdT4gd3JvdGU6Cj4gT24gV2VkLCBNYXIgMDgsIDIwMjMgYXQgMDY6MTA6
MTRQTSArMDgwMCwgSGVyYmVydCBYdSB3cm90ZToKPiA+Cj4gPiBJZiBpdCdzIGp1c3QgZW1wdHkg
bWVzc2FnZXMsIHdoaWNoIHdlIGtub3cgYXJlIGJyb2tlbiB3aXRoIHV4NTAwCj4gPiB0byBiZWdp
biB3aXRoLCB0aGVuIHdlIGNhbiBzaW1wbHkgbm90IGRvIHRoZSBoYXNoIGF0IGFsbCAoZG9pbmcK
PiA+IGl0IGFuZCB0aGVuIHRocm93aW5nIGl0IGF3YXkgc2VlbXMgcG9pbnRsZXNzKS4KPgo+IEhl
cmUgaXMgYSBwYXRjaCB0byBub3QgcHJvY2VzcyBlbXB0eSBtZXNzYWdlcyBhdCBhbGwuCgpIZXkg
aXQgd29ya3MgOkQKCkkgaGFkIHRvIHR3ZWFrIGl0IHNsaWdodGx5IGJlY2F1c2Ugd2UgbmVlZCB0
byBzZXQgdGhlIHN0YXRlIHJpZ2h0OgoKQEAgLTM3NCw5ICszODcsMjAgQEAgc3RhdGljIGludCBz
dG0zMl9oYXNoX3htaXRfY3B1KHN0cnVjdCBzdG0zMl9oYXNoX2RldiAqaGRldiwKICAgICAgICBj
b25zdCB1MzIgKmJ1ZmZlciA9IChjb25zdCB1MzIgKilidWY7CiAgICAgICAgdTMyIHJlZzsKCi0g
ICAgICAgaWYgKGZpbmFsKQorICAgICAgIGlmIChmaW5hbCkgewogICAgICAgICAgICAgICAgaGRl
di0+ZmxhZ3MgfD0gSEFTSF9GTEFHU19GSU5BTDsKCisgICAgICAgICAgICAgICAvKiBEbyBub3Qg
cHJvY2VzcyBlbXB0eSBtZXNzYWdlcyBpZiBodyBpcyBidWdneS4gKi8KKyAgICAgICAgICAgICAg
IGlmICghKGhkZXYtPmZsYWdzICYgSEFTSF9GTEFHU19JTklUKSAmJiAhbGVuZ3RoICYmCisgICAg
ICAgICAgICAgICAgICAgaGRldi0+cGRhdGEtPmJyb2tlbl9lbXB0eW1zZykgeworICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3Qgc3RtMzJfaGFzaF9yZXF1ZXN0X2N0eCAqcmN0eCA9CmFoYXNo
X3JlcXVlc3RfY3R4KGhkZXYtPnJlcSk7CisgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBz
dG0zMl9oYXNoX3N0YXRlICpzdGF0ZSA9ICZyY3R4LT5zdGF0ZTsKKworICAgICAgICAgICAgICAg
ICAgICAgICBzdGF0ZS0+ZmxhZ3MgfD0gSEFTSF9GTEFHU19FTVBUWTsKKyAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIDA7CisgICAgICAgICAgICAgICB9CisgICAgICAgfQorCiAgICAgICAg
bGVuMzIgPSBESVZfUk9VTkRfVVAobGVuZ3RoLCBzaXplb2YodTMyKSk7CgogICAgICAgIGRldl9k
YmcoaGRldi0+ZGV2LCAiJXM6IGxlbmd0aDogJXpkLCBmaW5hbDogJXggbGVuMzIgJWlcbiIsCgoK
QWZ0ZXIgdGhpcyBpdCBXT1JLUyEKCkZvciB0aGUgInY1LjUiIHBhdGNoIGFuZCB0aGlzIChhbmQg
bXkgb3RoZXIgcGF0Y2gpIGZvbGRlZCBpbjoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxp
bnVzLndhbGxlaWpAbGluYXJvLm9yZz4KVGVzdGVkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53
YWxsZWlqQGxpbmFyby5vcmc+CgpTbyBub3cgdGhlIGRyaXZlciBpcyBmaXhlZCBmcm9tIGEgVXg1
MDAgcG9pbnQgb2Ygdmlldy4KCkkgYWN0dWFsbHkgaGF2ZSB0aGUgU1RNMzJNUCBib2FyZCwgSSBj
YW4gdHJ5IHRvIGZpbmQgc29tZQp0aW1lIHRvIHRlc3QgdGhlIGZpbmFsIHBhdGNoIHNldCBvbiBp
dCBhcyB3ZWxsIGlmIGl0IGhhcyB0aGUgc2FtZQpoYXMgYXMgdGhlIG90aGVyIFNUTTMyIFNvQ3Mu
CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
