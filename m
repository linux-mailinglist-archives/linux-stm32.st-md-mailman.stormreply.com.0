Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C89D9AD705D
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 14:29:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CB4AC32E8E;
	Thu, 12 Jun 2025 12:29:16 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E724C36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 12:29:15 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ad883afdf0cso187153166b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 05:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749731355; x=1750336155;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NEJs2y5lh32zGmKZ8Qzhu9KFrGD77yTrgBvMh7VvKkA=;
 b=Ab8s1qOWksFok8hcc6gYk6uNPQJFHsd3Fosh7oXVWqF4jUGRStmS1rvL42SUhc9VbN
 O6GVDJIzK9ITd4XLuWrOyuz4+k7DGQ9DbnV6WXT/MMXNm72cV1cLJIbZAIR32yooIvwO
 RZzao2hMePSOR+KqHRMh0MaeMxnI7jN49/tLlk0ipCdz1/LhxjpZGy0yf0UbnRUPf1JL
 4BYvvFvjSIpYBsPhdkME8FsZAnTwr9MonV1oyTe+SlOi3zDFnsJk/NknliL/nm48T0km
 XWev2b2eU/wypPHo/7qXZJOTE4ammK1hN13gM6A9gFu0E8pUmjvMxqpwAg/KtJ1ayenm
 AHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749731355; x=1750336155;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NEJs2y5lh32zGmKZ8Qzhu9KFrGD77yTrgBvMh7VvKkA=;
 b=Ri8CyM6FZBHrU72y2+xR/37VkCZgZWW/E5kfRo3ODJ5Vh1JHbfHWQKC7YRUPFhJa1O
 BJX2I1Vkx3lILr2I4Ykva9DtH0um02Y6XVkb8M6N9sukOZwA9bj6ZJC8txsxbWEgAouX
 f9RWN+Tj6jncPSuuNoc5JVzWa+ZLDl/mUBcrNUAarz71PysBc+umNyjiDNpX2UOHJx/u
 pmnnFRPDR0xdplz9bpS9ZKGyHUD4xDsnw++6iDwTyRaZ1884AJ52IEb2Fpwr8TKcQUxP
 Sou6KBA3awfoUpiukGHwYLzlGjUlH09JOQUnmLpIKsGhqGnZKp4h6Cp2rIu+5UydVy+5
 EPYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAF06cVJQvcfpuCElEHGmjUVRxGQR3IaqLRfhwIgEHelFmnTaGbiaQduogkI/x6jET3Qmoih/ME/bWkg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy15F0w3hyMLt1QTc660YvTvCYMUnI3MJcIeTBnR+OlGORrZP5r
 FTN+AiGbzBrQYMpmHhqXKPiGGZIrK5xX61M99XsaeSmdTupktlONpN+VYcq+71rPpOp3hs3KINu
 RE5tqI2DvoSmHLgHlMQgXioLzwg+9+7Q=
X-Gm-Gg: ASbGncvFMgA1LEeha6FwkXUEOWxxxXYJaF7slBLjx4DqPOAZlOIJV/qdG8Opphtov9m
 rUxcIiRNwlwQplbwHpVRL5jWUfzjvNykNxiKD4dsCiS/tIKYxCh1yZPxiGsfdFwjhKAjGqouSoZ
 gzkyZSCRrzBIVfPEjQBW36+CjsHyuSV70ZzDR2Of6889Q=
X-Google-Smtp-Source: AGHT+IGlkqMkspvLMpeTjF8aN4KiUGRrevrrBMyqe/WGI6YMF5fU2+dVwFdEvs12L1YJUL60yY3huaWNWMMfCo5r7oM=
X-Received: by 2002:a17:907:1c9e:b0:ade:5ba:40e1 with SMTP id
 a640c23a62f3a-adea270e2f5mr330585366b.0.1749731354468; Thu, 12 Jun 2025
 05:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
 <aEqbQPvz0FsLXt0Z@duo.ucw.cz> <2243943.irdbgypaU6@workhorse>
In-Reply-To: <2243943.irdbgypaU6@workhorse>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 12 Jun 2025 15:28:37 +0300
X-Gm-Features: AX0GCFscYljXh7LJwJGoGDo8-EH4wvCa4kp802_hSw1Ko3S3oAJ3o3w3MKMG3Hc
Message-ID: <CAHp75VdVB1OogZay+FDYVY0XajxcOx6t8T8LJSs+zSZg8TkaDQ@mail.gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-iio@vger.kernel.org,
 Petre Rodan <petre.rodan@subdimension.ro>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Francesco Dolcini <francesco@dolcini.it>, linux-rockchip@lists.infradead.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>,
 David Lechner <dlechner@baylibre.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
 Michael Hennerich <michael.hennerich@analog.com>, Pavel Machek <pavel@ucw.cz>,
 Mudit Sharma <muditsharma.info@gmail.com>, linux-mediatek@lists.infradead.org,
 Andreas Klinger <ak@it-klinger.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
 Roan van Dijk <roan@protonic.nl>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/28] iio: zero init stack with { }
	instead of memset()
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

T24gVGh1LCBKdW4gMTIsIDIwMjUgYXQgMzoxMuKAr1BNIE5pY29sYXMgRnJhdHRhcm9saQo8bmlj
b2xhcy5mcmF0dGFyb2xpQGNvbGxhYm9yYS5jb20+IHdyb3RlOgoKPiBJIHRob3VnaHQgSSdkIGNo
aW1lIGluIGFzIHNvbWVvbmUgdW5pbnZvbHZlZCBiZWNhdXNlIHRoaXMgc2VlbWVkCj4gaW50ZXJl
c3RpbmcuCgpXZWxjb21lISBPdGhlciBvcGluaW9ucyBvbiBzdWNoIGEgdG9waWMgYXJlIGFsd2F5
cyBhcHByZWNpYXRlZC4KCj4gT24gVGh1cnNkYXksIDEyIEp1bmUgMjAyNSAxMToxNzo1MiBDZW50
cmFsIEV1cm9wZWFuIFN1bW1lciBUaW1lIFBhdmVsIE1hY2hlayB3cm90ZToKPiA+Cj4gPiA+IEpv
bmF0aGFuIG1lbnRpb25lZCByZWNlbnRseSB0aGF0IGhlIHdvdWxkIGxpa2UgdG8gZ2V0IGF3YXkg
ZnJvbSB1c2luZwo+ID4gPiBtZW1zZXQoKSB0byB6ZXJvLWluaXRpYWxpemUgc3RhY2sgbWVtb3J5
IGluIHRoZSBJSU8gc3Vic3lzdGVtLiBBbmQgd2UKPiA+ID4gaGF2ZSBpdCBvbiBnb29kIGF1dGhv
cml0eSB0aGF0IGluaXRpYWxpemluZyBhIHN0cnVjdCBvciBhcnJheSB3aXRoID0geyB9Cj4gPiA+
IGlzIHRoZSBwcmVmZXJyZWQgd2F5IHRvIGRvIHRoaXMgaW4gdGhlIGtlcm5lbCBbMV0uIFNvIGhl
cmUgaXMgYSBzZXJpZXMKPiA+ID4gdG8gdGFrZSBjYXJlIG9mIHRoYXQuCj4gPgo+ID4gMSkgSXMg
aXQgd29ydGggdGhlIGNodXJuPwo+ID4KPiA+IDIpIFdpbGwgdGhpcyBmYWlsIHRvIGluaXRpYWxp
emUgcGFkZGluZyB3aXRoIHNvbWUgb2JzY3VyZSBjb21waWxlcj8KPgo+IGFzIG9mIHJpZ2h0IG5v
dywgdGhlIG9ubHkgdHdvIEMgY29tcGlsZXJzIHRoYXQgYXJlIHN1cHBvcnRlZCBhcmUKPiBHQ0Mg
Pj0gOC4xLCBhbmQgQ2xhbmcgPj0gMTMuMC4xLiBJZiBhbnlvbmUgZXZlbiBtYW5hZ2VzIHRvIGdl
dCB0aGUga2VybmVsCj4gdG8gZmluaXNoIGEgYnVpbGQgd2l0aCBzb21ldGhpbmcgZWxzZSwgSSB0
aGluayB0aGUgY29tcGlsZXIgbm90Cj4gaW1wbGVtZW50aW5nIHRoZSBDIHN0YW5kYXJkIGNvcnJl
Y3RseSBpcyB0aGUgbGVhc3Qgb2YgdGhlaXIgd29ycmllcy4KPgo+IE15IGJpZ2dlciB3b3JyeSBp
cyB0aGF0ID0geyB9IGlzIG9ubHkgZ3VhcmFudGVlZCB0byBiZSBhcyBjb3JyZWN0IGFzCj4gbWVt
c2V0IG9uIEMyMywgYW5kIHRoZSBrZXJuZWwncyBzdGFuZGFyZCByaWdodCBub3cgaXMgQzExLiBG
b3IgdGhhdAo+IHJlYXNvbiBhbG9uZSwgSSBkb24ndCB0aGluayBtZW1zZXQgc2hvdWxkIGJlIG1v
dmVkIGF3YXkgZnJvbSBmb3Igbm93LAo+IHVubGVzcyBzb21lb25lIGNhbiB2ZXJpZnkgdGhhdCBl
dmVyeSBHQ0MgcmVsZWFzZSA+PSA4LjEgYW5kIGV2ZXJ5Cj4gQ2xhbmcgcmVsZWFzZSA+PSAxMy4w
LjEgZG9lcyB0aGUgcmlnaHQgdGhpbmcgaGVyZSByZWdhcmRsZXNzLgo+Cj4gPgo+ID4gMykgV2h5
IGRvIHlvdSBiZWxpZXZlIHRoYXQge30gaXMgdGhlIHByZWZmZXJlZCB3YXk/IEFsbCB3ZSBoYXZl
IGlzCj4gPiBLZWVzJyBlbWFpbCB0aGF0IGV4cGxhaW5zIHRoYXQgPSB7fSBtYXliZSB3b3JrcyBp
biBjb25maWdzIGhlIHRlc3RlZC4KPgo+ID0geyB9IGlzIGd1YXJhbnRlZWQgdG8gd29yayBpbiBD
MjMsIGFzIHBlciB0aGUgc3RhbmRhcmQsIGJ1dCBhZ2FpbiB3ZSdyZQo+IG5vdCBvbiBDMjMuCj4K
PiBUaGUgcmVhc29uIHRvIHByZWZlciB0aGlzIGlzIGxpa2VseSB0aGF0IGl0J3MgZWFzaWVyIGZv
ciBzdGF0aWMgYW5hbHlzaXMKPiB0byBzZWUgdGhlIHN0cnVjdCBhcyBpbml0aWFsaXNlZCwgYnV0
IHRoYXQncyBtZSBtYWtpbmcgYXNzdW1wdGlvbnMgaGVyZS4KPgo+IEEgbW9yZSBodW1hbi1jZW50
cmljIGFyZ3VtZW50IGlzIHRoYXQgb25jZSB3ZSdyZSBvbiBhIEMgc3RhbmRhcmRzIHZlcnNpb24K
PiB3aGVyZSA9IHsgfSBpcyBndWFyYW50ZWVkIHRvIGJlIGNvcnJlY3QsIHRoZW4gPSB7IH0gaXMg
bXVjaCBtb3JlIG9idmlvdXNseQo+IGNvcnJlY3QgdG8gYSByZWFkZXIgdGhhbiBhIG1lbXNldCB3
aXRoIGEgdmFsdWUgYW5kIGEgc2l6ZSBzb21ld2hlcmUgbGF0ZXIKPiBpbiB0aGUgY29kZS4gVGhp
cyBhcmd1bWVudCBpcyBldmlkZW50IGZyb20gdGhlIG51bWJlciBvZiBwYXRjaGVzIGluIHRoaXMK
PiBzZXJpZXMgd2hlcmUgdGhlIG1lbXNldCBhbmQgdGhlIGRlY2xhcmF0aW9uIGFyZSBub3QgaW4g
dGhlIHNhbWUgaHVuay4KPiBUaGF0J3MgdGhlIGtpbmQgb2Ygc3R1ZmYgdGhhdCBrZWVwcyBtZSBh
d2FrZSBhdCBuaWdodCwgc3dlYXRpbmcgcHJvZnVzZWx5LgoKV2hpbGUgYWxsIHlvdSBzYWlkIHNl
ZW1zIHRydWUgYW5kIEkgYWdyZWUgd2l0aCwgdGhlIHBlZGFudGlzbSBoZXJlIGlzCm5vdCBuZWVk
ZWQgYXMgaW4gdGhlIExpbnV4IGtlcm5lbCB3ZSBoYXZlIHt9IHVzZWQgZm9yIGFnZXMgaW4gdG9u
cyBvZgpjb2RlIGFuZCBpZiBzb21ldGhpbmcgd2VudCB3cm9uZyB3aXRoIHRoYXQgd2Ugc2hvdWxk
IGhhdmUgaGFkIGJ1ZwpyZXBvcnRzIGFscmVhZHkuIEFyZSB5b3UgYXdhcmUgb2Ygc3VjaD8gUGVy
c29uYWxseSBJIGhhdmVuJ3QgaGVhcmQKZXZlbiBvbmUgcmVsYXRlZCB0byB0aGlzLiBCdXQgaWYg
eW91IGtub3csIEkgYW0gcmVhbGx5IG1vcmUgdGhhbgppbnRlcmVzdGVkIHRvIHJlYWQgYWJvdXQg
KHBsZWFzZSwgZ2l2ZSBwb2ludGVycyB0byBzdWNoIGEgZGlzY3Vzc2lvbikuCgotLSAKV2l0aCBC
ZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
