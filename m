Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E02853A6D
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 19:59:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 904E2C6DD69;
	Tue, 13 Feb 2024 18:59:14 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2594C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 18:59:13 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2d109e7bed2so10952911fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 10:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707850753; x=1708455553;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4VnESsGdbuiV1eQP3Vr6/roBrvwRGALjsgHY+lb97YU=;
 b=F2nKpoMK2hy4h4mfBqEC1zadRB02MxiPGU6AW1jGDb01U1HWDnwPxHARw5kGW39+jj
 uzZZyiX9agGp9KU8eYlSR6Rj+qqYZyWopJEfBlYNe8PVL2WndhDS4DIM1CWbJYNR2950
 MdwQ71xbQgtPVWz0H8yILxB3TNK9KV1P+aw1h7WS2vvKuxYGsdNcI7fvrzR2NFBdsl7t
 9GAdaSESCM86A/7ayRpCW2p8nhKxGmrORyDAgcbwR9o7r04xJisq1XVVI54sqP2meJxW
 GF9io+4D+QbBa+izjF+CYUbtAtQ5BPu8FY7yuk1oMju51u5sKccrNqhveNF9+cxFvnAZ
 BXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707850753; x=1708455553;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4VnESsGdbuiV1eQP3Vr6/roBrvwRGALjsgHY+lb97YU=;
 b=pExDDux5XXZjzulS4fWTU7AqQQT1Qam95rziFDitaOK7tXg2ByRAR73d7FyW4UvyL2
 nxT7yk46uOnvoLwnXZDLNFn/JH/pSgmSUJ0GKDpTI+1lOke5uIDYrmlQk/p9opl8jvlo
 23wSMH/qovTtXALcPfJqhwl1RWdYEIr0+c1zmcT2wHDtxtkFevrIwQ2sgIVZaUzbCnLq
 ridLdQbKDN1qIQvokquPmRjFcIxHKqVAG57Hl/lQMFp80AxWp/zhUeoP+BqkiuvEhOGP
 lI9zw36GnPB5T4vn//V4P3pBfZ4mSL/iDiwGRBLTy8ZLDOl55lUTxyQBCrKzZsx+8Eaa
 NNJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcYeydCbECfN3A9WmCb2xWjZ/heOit05TZ6SAHaDYopRcE1iN7+jH0zNediwpRI+IQFU6suQCtHn35TBXHRSUrxj/qA89X0mZCjC4Uf+ypU8VvSwjZhi4V
X-Gm-Message-State: AOJu0Yxy9AHzfhWuFkH2fFdOtquQx2A/ouDNqFZrHxmYD+Eq0FwHC/lc
 j1pw5Fgob1/siYpiTliDch3jI7JRh7sCnqmj+FcZIRdcum7o/gKL+iiA5CgQSrvx26cB4S22sJI
 5F8/Hg87ajK+ELkvb6AWaIdfw37cv7VLDPD405Q==
X-Google-Smtp-Source: AGHT+IEtyexlJPLvXLppQIs8o5kxOpPSJJHow6m6YouTlGPB5XovHjo+6+/VKzvuzKVXU9NzOsCafaWIzasoUDAtQ/4=
X-Received: by 2002:a05:651c:545:b0:2d0:a6d3:56c6 with SMTP id
 q5-20020a05651c054500b002d0a6d356c6mr406995ljp.32.1707850752870; Tue, 13 Feb
 2024 10:59:12 -0800 (PST)
MIME-Version: 1.0
References: <20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com>
 <20240212-mainline-spi-precook-message-v1-5-a2373cd72d36@baylibre.com>
 <c06dfa1ecf88b07ef467ad7c08667d0cab400613.camel@gmail.com>
 <CAMknhBEU=iMzpE_P0KePL4cZZktBOGHRXaEox5a7XcVjXDT+Dg@mail.gmail.com>
 <e03968102b92b3711808eb532685bc9e05fc3c8d.camel@gmail.com>
 <20240213173110.00007855@Huawei.com>
In-Reply-To: <20240213173110.00007855@Huawei.com>
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 13 Feb 2024 12:59:01 -0600
Message-ID: <CAMknhBFQLvaTcFAt_LqEsDYvMDOwFo3u0xkt7fOsgL0tcmoX6Q@mail.gmail.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>,
 David Jander <david@protonic.nl>, Martin Sperl <kernel@martin.sperl.org>,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 5/5] iio: adc: ad7380: use
	spi_optimize_message()
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

T24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgMTE6MzHigK9BTSBKb25hdGhhbiBDYW1lcm9uCjxKb25h
dGhhbi5DYW1lcm9uQGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCAxMyBGZWIgMjAyNCAx
NzowODoxOSArMDEwMAo+IE51bm8gU8OhIDxub25hbWUubnVub0BnbWFpbC5jb20+IHdyb3RlOgo+
Cj4gPiBPbiBUdWUsIDIwMjQtMDItMTMgYXQgMDk6MjcgLTA2MDAsIERhdmlkIExlY2huZXIgd3Jv
dGU6Cj4gPiA+IE9uIFR1ZSwgRmViIDEzLCAyMDI0IGF0IDM6NDfigK9BTSBOdW5vIFPDoSA8bm9u
YW1lLm51bm9AZ21haWwuY29tPiB3cm90ZToKPiA+ID4gPgoKLi4uCgo+ID4gPiA+IEFtIEkgbWlz
c2luZyBzb21ldGhpbmc/Cj4gPiA+Cj4gPiA+IE5vLCB5b3VyIHVuZGVyc3RhbmRpbmcgaXMgY29y
cmVjdCBmb3IgdGhlIGN1cnJlbnQgc3RhdGUgb2YgZXZlcnl0aGluZwo+ID4gPiBpbiB0aGlzIHNl
cmllcy4gU28sIHdlIGNvdWxkIGRvIGFzIHlvdSBzdWdnZXN0LCBidXQgSSBoYXZlIGEgZmVlbGlu
Zwo+ID4gPiB0aGF0IGZ1dHVyZSBhZGRpdGlvbnMgdG8gdGhpcyBkcml2ZXIgbWlnaHQgcmVxdWly
ZSB0aGF0IGl0IGdldHMKPiA+ID4gY2hhbmdlZCBiYWNrIHRoaXMgd2F5IGV2ZW50dWFsbHkuCj4g
Pgo+ID4gSG1tLCBub3QgcmVhbGx5IHN1cmUgYWJvdXQgdGhhdCBhcyBjaGlwX2luZm8gc3R1ZmYg
aXMgYWx3YXlzIG91ciBmcmllbmQgOikuIEFuZAo+ID4gSSdtIGFueXdheXMgb2YgdGhlIG9waW5p
b24gb2Yga2VlcGluZyB0aGluZ3Mgc2ltcGxlciBhbmQgc3RhcnQgdG8gZXZvbHZlIHdoZW4KPiA+
IHJlYWxseSBuZWVkZWQgKGJlY2F1c2Ugb2Z0ZW4gd2UgbmV2ZXIgcmVhbGx5IG5lZWQgdG8gZXZv
bHZlKS4gQnV0IGJhaCwgYXMgSQo+ID4gc2FpZC4uLiB0aGlzIGlzIHJlYWxseSBub3QgYSBiaWcg
ZGVhbC4KPiA+Cj4gT29wcyBzaG91bGQgaGF2ZSByZWFkIE51bm8ncyByZXZpZXcgYmVmb3JlIHJl
cGx5aW5nIQo+Cj4gSSdkIHJhdGhlciB3ZSBlbWJlZGRlZCBpdCBmb3Igbm93IGFuZCBkaWQgdGhl
IG9wdGltaXphdGlvbiBhdCBwcm9iZS4KPiBXaGlsc3QgaXQncyBhIGxvdCBvZiB3b3JrIHBlciB0
cmFuc2ZlciBpdCdzIG5vdCBlbm91Z2ggdG8gd29ycnkgYWJvdXQgZGVsYXlpbmcKPiBpdCB1bnRp
bCBwcmVlbmFibGUoKS4gIEVhc3kgdG8gbWFrZSB0aGF0IG1vdmUgYW5kIHRha2UgaXQgZHluYW1p
YyB3aGVuCj4gZHJpdmVyIGNoYW5nZXMgbmVlZCBpdC4gIEluIG1lYW50aW1lLCBJIGRvbid0IHdh
bnQgbG90cyBvZiBvdGhlciBkcml2ZXJzCj4gcGlja2luZyB1cCB0aGlzIHBhdHRlcm4gd2hlbiB0
aGV5IG1heSBuZXZlciBuZWVkIHRoZSBjb21wbGV4aXR5IG9mCj4gbWFraW5nIHRoaW5ncyBtb3Jl
IGR5bmFtaWMuCj4KCk5vdGVkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
