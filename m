Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B08D6AE4BF
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Mar 2023 16:32:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 055CFC65E73;
	Tue,  7 Mar 2023 15:32:00 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF94FC65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Mar 2023 15:31:57 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id t39so11778692ybi.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Mar 2023 07:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678203117;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ej1wMX0xmC5g1dxLkHmNOArc3+7GOqB/eA4DE4RyK4c=;
 b=dZkA6PzJvWsX5mEy6t5JDiwxiahiFz/4Eawhp1d/Bcqk+dR2z7JNj2riwjQyAzKAAe
 ciH0PyY6MAb2wVOkmIiDO4+CKoUZnw1pfewuR8t2OziaNck88JqQL7ydiWq25OX7An9w
 7PgZKQJ1Gbr+HTlUYfGmoHQrRSl5Y2rfdaWC0ZuJJjKOagyHZBWNc+gaiPlUWmRU7Yte
 f+GlwwdjXVHydKtRFbgCoLUzkM71TNc35lZ5Co+HcPeF79NXdhE04gxghtFxXLlZSD17
 CgP1oOjXIDM8OxEh+VvDxMQkhkCtgRbQ0SpAz3xnxIk95wo11cIqS98nHkXmheLpfRh2
 wfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678203117;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ej1wMX0xmC5g1dxLkHmNOArc3+7GOqB/eA4DE4RyK4c=;
 b=id8GUVHwlgPQerz6i/rpz8LJNTQwq77fJHZ2Kg6x9uEwrTYklZcm2mlBLGosmfd98I
 y3cpKTuZaksECttZyQvol2JaImubmfuoSE3uyBySG6uVa3UjQCk3v4CEno1+EftJ5F43
 vbCOMMU+48U9zWR8HczVQrxoGUZJ+vu+h2MQgQ+Zc7SOJ52oidlD21JKH0dRwxQuDCxv
 MRt51x5C2YPJQUqdyiV3FlIr5uvDEXF//Efu7jC1SmlNJvIt72Kq0m6GFNAOxO93xRM+
 mdR/NfxeMh7/CbLgkfOeIQbt9I2QMUiLQ4/rGf/0CyIS7JKWjVSwWYbBDJOd19McXIVV
 RLkw==
X-Gm-Message-State: AO0yUKWwBq4U0AYJLsoJ1j6DIwaPWQoRBa15LwnnaDC6xiJ+KcaZ5Gf0
 jhLBRsan/mqphc5uh2jKRmm69W6PKN5rK6YriMY+Rg==
X-Google-Smtp-Source: AK7set9/2bK3mUzyiRzESQsU6pjbcNV8AIUilPKmGcvAAgOXm1cAbDz62p+1ObNkkp4uRo5v+YJxbxzZR5pLCAEFUKE=
X-Received: by 2002:a25:e90b:0:b0:9fc:e3d7:d60f with SMTP id
 n11-20020a25e90b000000b009fce3d7d60fmr6590460ybd.5.1678203116816; Tue, 07 Mar
 2023 07:31:56 -0800 (PST)
MIME-Version: 1.0
References: <ZAVu/XHbL9IR5D3h@gondor.apana.org.au>
 <E1pZ2fs-000e27-4H@formenos.hmeau.com>
 <CACRpkdY8iN_ga0VuQ-z=8KUWaJ6=5rh2vZEwcp+oNgcBuPFk=g@mail.gmail.com>
 <ZAcNhtm/+mik1N2m@gondor.apana.org.au>
In-Reply-To: <ZAcNhtm/+mik1N2m@gondor.apana.org.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Mar 2023 16:31:44 +0100
Message-ID: <CACRpkdbcrCa9v82xVWtixWdDPvCu6E6Rkw-3Vg3APisdvYGwqQ@mail.gmail.com>
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

T24gVHVlLCBNYXIgNywgMjAyMyBhdCAxMToxMOKAr0FNIEhlcmJlcnQgWHUgPGhlcmJlcnRAZ29u
ZG9yLmFwYW5hLm9yZy5hdT4gd3JvdGU6Cj4gT24gTW9uLCBNYXIgMDYsIDIwMjMgYXQgMTE6MDg6
MTNBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiA+Cj4gPiBUaGlzIHBhcnRseSB3b3Jr
cyAoYWZ0ZXIgbXkgZm9sZGVkIGluIGZpeCBpbiBwYXRjaCA1KSEKPiA+Cj4gPiBDbGVhbiBTSEEx
IGFuZCBTSEEyNTYgd29ya3MgZmxhd2xlc3NseS4KPiA+IEhNQUMgc3RpbGwgZmFpbHMsIGJ1dCBu
b3QgdW50aWwgd2Ugc3RhcnQgdGVzdGluZyByYW5kb20gdmVjdG9yczoKPiA+Cj4gPiBbICAgIDcu
NTQxOTU0XSBhbGc6IGFoYXNoOiBzdG0zMi1obWFjLXNoYTI1NiBkaWdlc3QoKSBmYWlsZWQgb24g
dGVzdAo+ID4gdmVjdG9yICJyYW5kb206IHBzaXplPTAga3NpemU9ODAiOyBleHBlY3RlZF9lcnJv
cj0wLAo+ID4gYWN0dWFsX2Vycm9yPS0xMTAsIGNmZz0icmFuZG9tOiBtYXlfc2xlZXAiCj4gPiBb
ICAgIDcuNTY3MjEyXSBhbGc6IHNlbGYtdGVzdHMgZm9yIGhtYWMoc2hhMjU2KSB1c2luZwo+ID4g
c3RtMzItaG1hYy1zaGEyNTYgZmFpbGVkIChyYz0tMTEwKQo+Cj4gU28gaXQncyB0aW1pbmcgb3V0
LiAgSSB3b25kZXIgaWYgdGhlIHRpbWVvdXQgaW4gc3RtMzJfaGFzaF93YWl0X2J1c3kKPiBpcyBs
b25nIGVub3VnaC4gIFBlcmhhcHMgdHJ5IGFkZGluZyBhIHplcm8gc28gdGhhdCB0aGUgdGltZW91
dCBiZWNvbWVzCj4gMTAwLDAwMHVzIGFuZCBzZWUgaWYgaXQgc3RpbGwgYnJlYWtzPwoKU2FkbHkg
dGhpcyBkb2Vzbid0IHdvcmsuCgpJIHRyaWVkIGluY3JlYXNpbmcgd2l0aCBvbmUgYW5kIGV2ZW4g
dHdvIG9yZGVycyBvZiBtYWduaXR1ZGUsCmJ1dCB0aGUgdGltZW91dHMgc3RpbGwgaGFwcGVuLCB1
c3VhbGx5IHR3byBvZiB0aGVtLCBzb21ldGltZXMKb25lIHNvbWV0aW1lcyB0aHJlZSwgZGVwZW5k
aW5nIG9uIHJhbmRvbW5lc3MsIGFzIGNhbiBiZQpleHBlY3RlZC4KCkkgdGhpbmsgeW91IG1lbnRp
b25lZCBzb21ldGhpbmcgYWJvdXQgdGhhdCB3ZSBuZWVkIHRvIHN0b3JlCnRoZSBrZXkgaW4gdGhl
IHN0YXRlIGFzIHdlbGwgdGhvdWdoPwoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
