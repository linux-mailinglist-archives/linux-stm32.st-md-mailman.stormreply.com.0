Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7475994CBDC
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Aug 2024 10:08:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29655C7801E;
	Fri,  9 Aug 2024 08:08:59 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EEFAC7801D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Aug 2024 08:08:52 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a7ad02501c3so229410966b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Aug 2024 01:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723190931; x=1723795731;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7UOjCAID+UZ2tEQeZhluoBp+qMsVXiycrhYlTzLnVcU=;
 b=lymbWdRWLIdMiDX34cP6VToPev0s1SjHABFLcWi1dnsXBqv+v2lSES6J2yFTZgic3M
 OgbJyhi+YKQC8JW5h9PfqbcxxPrq9N27f4EbfjIffQ+QMU9SKP5HWSK5+2ml0SdOXyrX
 E/IQGpfR0SFXPneGveRx82wr3oXfabsmxcTR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723190931; x=1723795731;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7UOjCAID+UZ2tEQeZhluoBp+qMsVXiycrhYlTzLnVcU=;
 b=jDRaTLiA4gaLI3MWxH+U8156FKrdCssAZ0/Rjsyk9/pgOGx8UghppoNPE3EvvVVGtm
 6NahrNYSfUOc8BvmNWQSQabpnPPxy+3XLw07PcB+Tz3xoKlodEUQAlPfEsqGtp0vm3Ij
 Hszr2m7aX9HcEhDICIMLmD9s24KPUboDUmtKpN/GzbrYGLc+aq1m2SlF2/6RMTKzIWfc
 iTvj9SZF5UYeTXoHxoZhy2MvKX/Hbnh4Y0ClrSHFYjAX14O7zeqCgmOw829xZDb8cBqu
 Dp3ZEQguS43gSOtbF5MoNW1UFl/NTv9PUAnM90M6ItIrZg4dnSEtqr0g1ZI3bRVOkXNr
 KWtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH5+702hoJyzvT+k686sMOvYOXJemIQHBNqqDzz94/hr/g8KzPN5Abi+j9tAk3efZK32iKliEt/G3Bj11SHhF/XpJX7T32EjgZchy25lq3omElyePMpPHi
X-Gm-Message-State: AOJu0Yxs8DBjzL18SIbSTDarmql+QwHFgqjTen9RazWXA+/At+BEIcvX
 pBTj/gmb7NaqvFP/PkqKK1hfQn42nJEpSwnv/wJA4wqodD7J4oU5Mkb4volcdfGc6W7xOEoTCyB
 zSmd7
X-Google-Smtp-Source: AGHT+IG1ccColuGkObyGJgCkdNBgZyoLv0579XGZEyDnaZZtxRJPF68HJK9thFFPm6UQ/bNszOn3Zg==
X-Received: by 2002:a17:907:1b27:b0:a7a:ab1a:2d71 with SMTP id
 a640c23a62f3a-a80aa6d3cfemr62460766b.59.1723190931466; 
 Fri, 09 Aug 2024 01:08:51 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9eca4f4sm815145166b.218.2024.08.09.01.08.51
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 01:08:51 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a7aac70e30dso213484266b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Aug 2024 01:08:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUes+23Oihkt95T7NLu/BrHqUjODDgHrcRvhUOv0KXsuq77Tx27GHbJY1oje4b+4EY1/mNZDPRgicop7d5eLN08HvRVpMIdLOTiXyS5O+qq/vqwmADDAbyy
X-Received: by 2002:a05:6512:3e1c:b0:530:adfe:8607 with SMTP id
 2adb3069b0e04-530ee9f3594mr770871e87.51.1723190567467; Fri, 09 Aug 2024
 01:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org>
 <20240503112758.763d8d31@sal.lan>
 <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain>
 <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
 <fe95e3c3a89de4566a4eb53ca8b26c25@manjaro.org>
 <CANiDSCswvsTh+0oJmHkYC=-qE8g09bHr44amBsUXkK6j1eCMWA@mail.gmail.com>
 <CAOcJUbwJkbEG6+u==de7CzXDUPGj6J3-p-7E3o+iAzjgSgybSg@mail.gmail.com>
In-Reply-To: <CAOcJUbwJkbEG6+u==de7CzXDUPGj6J3-p-7E3o+iAzjgSgybSg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 9 Aug 2024 10:02:35 +0200
X-Gmail-Original-Message-ID: <CANiDSCt=HOKwAT2zBg1tTbGbD-U-2K8+hi5WbdCM9ULWJvZ_Lw@mail.gmail.com>
Message-ID: <CANiDSCt=HOKwAT2zBg1tTbGbD-U-2K8+hi5WbdCM9ULWJvZ_Lw@mail.gmail.com>
To: Michael Ira Krufky <mkrufky@linuxtv.org>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dmitry Osipenko <digetx@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sergey Kozlov <serjk@netup.ru>,
 Samuel Holland <samuel@sholland.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>
Subject: Re: [Linux-stm32] [PATCH v3 26/26] media: dvb-frontends: tda10048:
 Make the range of z explicit.
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

SGkKCkl0IGRvZXMgbm90IHNlZW0gdGhhdCB3ZSB3aWxsIGZpbmQgdGhlIGRhdGFzaGVldC4KCkFu
eSBvYmplY3Rpb24gdG8gbGFuZCB0aGUgcGF0Y2ggYXMgaXQ/IEl0IGlzIGFzIGluY29ycmVjdCBh
cyB0aGUKb3JpZ2luYWwgY29kZSA7KQoKUmVnYXJkcyEKCk9uIE1vbiwgMTMgTWF5IDIwMjQgYXQg
MTY6MjYsIE1pY2hhZWwgSXJhIEtydWZreSA8bWtydWZreUBsaW51eHR2Lm9yZz4gd3JvdGU6Cj4K
PiBPbiBNb24sIE1heSAxMywgMjAyNCBhdCA5OjM44oCvQU0gUmljYXJkbyBSaWJhbGRhIDxyaWJh
bGRhQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCAzIE1heSAyMDI0IGF0IDE2
OjA4LCBEcmFnYW4gU2ltaWMgPGRzaW1pY0BtYW5qYXJvLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IEhlbGxvIFJpY2FyZG8sCj4gPiA+Cj4gPiA+IE9uIDIwMjQtMDUtMDMgMTM6NTYsIFJpY2FyZG8g
UmliYWxkYSB3cm90ZToKPiA+ID4gPiBJIGFtIHRyeWluZyB0byBnZXQgdGhlIERTLCBidXQKPiA+
ID4gPiBodHRwczovL3d3dy5ueHAuY29tL2Fjcm9iYXRfZG93bmxvYWQvbGl0ZXJhdHVyZS85Mzk3
Lzc1MDE1OTMxLnBkZiBpcyBhCj4gPiA+ID4gZGVhZCBsaW5rcyBub3cuCj4gPiA+ID4KPiA+ID4g
PiBBbnlvbmUgaGF2ZSBhY2Nlc3MgdG8gdGhlIGRhdGFzaGVldD8KPiA+ID4KPiA+ID4gSXQncyBr
aW5kIG9mIGF2YWlsYWJsZSBvbiB0aGUgbGluayBiZWxvdywgYnV0IGZvciBzb21lIHN0cmFuZ2Ug
cmVhc29uCj4gPiA+IHRoZSBkb3dubG9hZCBmYWlscyBhZnRlciBkb3dubG9hZGluZyB0aGUgZmly
c3QgMTI4IEtCIG9yIHNvLgo+ID4gPgo+ID4gPiBodHRwczovL3dlYi5hcmNoaXZlLm9yZy93ZWIv
MjAwODA5MDcxODU1MzIvaHR0cHM6Ly93d3cubnhwLmNvbS9hY3JvYmF0X2Rvd25sb2FkL2xpdGVy
YXR1cmUvOTM5Ny83NTAxNTkzMS5wZGZcCj4gPgo+ID4gTWlrZSwgYnkgYW55IGNoYW5jZSBkbyB5
b3UgaGF2ZSBhIGNvcHkgb2YgdGhlIERTPwo+ID4KPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+ID4gT24g
RnJpLCAzIE1heSAyMDI0IGF0IDEzOjU1LCBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQGxp
bmFyby5vcmc+Cj4gPiA+ID4gd3JvdGU6Cj4gPiA+ID4+Cj4gPiA+ID4+IE9uIEZyaSwgTWF5IDAz
LCAyMDI0IGF0IDExOjI3OjU4QU0gKzAxMDAsIE1hdXJvIENhcnZhbGhvIENoZWhhYiB3cm90ZToK
PiA+ID4gPj4gPiBFbSBNb24sIDI5IEFwciAyMDI0IDE1OjA1OjA1ICswMDAwCj4gPiA+ID4+ID4g
UmljYXJkbyBSaWJhbGRhIDxyaWJhbGRhQGNocm9taXVtLm9yZz4gZXNjcmV2ZXU6Cj4gPiA+ID4+
ID4KPiA+ID4gPj4gPiA+IFdlIGRvIG5vdCBleHBlY3QgdGhlIHNhbXBsZV9mcmVxIHRvIGJlIG92
ZXIgNjEzTUh6Lgo+ID4gPiA+PiA+ID4KPiA+ID4gPj4gPiA+IEZvdW5kIGJ5IGNvY2NpOgo+ID4g
PiA+PiA+ID4gZHJpdmVycy9tZWRpYS9kdmItZnJvbnRlbmRzL3RkYTEwMDQ4LmM6MzQ1OjEtNzog
V0FSTklORzogZG9fZGl2KCkgZG9lcyBhIDY0LWJ5LTMyIGRpdmlzaW9uLCBwbGVhc2UgY29uc2lk
ZXIgdXNpbmcgZGl2NjRfdTY0IGluc3RlYWQuCj4gPiA+ID4+ID4gPgo+ID4gPiA+PiA+ID4gU2ln
bmVkLW9mZi1ieTogUmljYXJkbyBSaWJhbGRhIDxyaWJhbGRhQGNocm9taXVtLm9yZz4KPiA+ID4g
Pj4gPiA+IC0tLQo+ID4gPiA+PiA+ID4gIGRyaXZlcnMvbWVkaWEvZHZiLWZyb250ZW5kcy90ZGEx
MDA0OC5jIHwgNCArKystCj4gPiA+ID4+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+PiA+ID4KPiA+ID4gPj4gPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL2R2Yi1mcm9udGVuZHMvdGRhMTAwNDguYyBiL2RyaXZlcnMvbWVkaWEv
ZHZiLWZyb250ZW5kcy90ZGExMDA0OC5jCj4gPiA+ID4+ID4gPiBpbmRleCAzZTcyNWNkY2M2NmIu
LjE4ODZmNzMzZGJiZiAxMDA2NDQKPiA+ID4gPj4gPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvZHZi
LWZyb250ZW5kcy90ZGExMDA0OC5jCj4gPiA+ID4+ID4gPiArKysgYi9kcml2ZXJzL21lZGlhL2R2
Yi1mcm9udGVuZHMvdGRhMTAwNDguYwo+ID4gPiA+PiA+ID4gQEAgLTMyOCw3ICszMjgsOCBAQCBz
dGF0aWMgaW50IHRkYTEwMDQ4X3NldF93cmVmKHN0cnVjdCBkdmJfZnJvbnRlbmQgKmZlLCB1MzIg
c2FtcGxlX2ZyZXFfaHosCj4gPiA+ID4+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgdTMy
IGJ3KQo+ID4gPiA+PiA+ID4gIHsKPiA+ID4gPj4gPiA+ICAgICBzdHJ1Y3QgdGRhMTAwNDhfc3Rh
dGUgKnN0YXRlID0gZmUtPmRlbW9kdWxhdG9yX3ByaXY7Cj4gPiA+ID4+ID4gPiAtICAgdTY0IHQs
IHo7Cj4gPiA+ID4+ID4gPiArICAgdTMyIHo7Cj4gPiA+ID4+ID4gPiArICAgdTY0IHQ7Cj4gPiA+
ID4+ID4gPgo+ID4gPiA+PiA+ID4gICAgIGRwcmludGsoMSwgIiVzKClcbiIsIF9fZnVuY19fKTsK
PiA+ID4gPj4gPiA+Cj4gPiA+ID4+ID4gPiBAQCAtMzQxLDYgKzM0Miw3IEBAIHN0YXRpYyBpbnQg
dGRhMTAwNDhfc2V0X3dyZWYoc3RydWN0IGR2Yl9mcm9udGVuZCAqZmUsIHUzMiBzYW1wbGVfZnJl
cV9oeiwKPiA+ID4gPj4gPiA+ICAgICAvKiB0ICo9IDIxNDc0ODM2NDggb24gMzJiaXQgcGxhdGZv
cm1zICovCj4gPiA+ID4+ID4gPiAgICAgdCAqPSAoMjA0OCAqIDEwMjQpOwo+ID4gPiA+PiA+ID4g
ICAgIHQgKj0gMTAyNDsKPiA+ID4gPj4gPiA+ICsgICAvKiBTYW1wbGUgZnJlcXVlbmN5IGlzIHVu
ZGVyIDYxM01IeiAqLwo+ID4gPiA+PiA+Cj4gPiA+ID4+ID4gQXJlIHlvdSBzdXJlIGFib3V0IHRo
YXQ/IFNvbWUgRFZCIGRldmljZXMgaGF2ZSB2ZXJ5IGhpZ2ggZnJlcXVlbmN5Cj4gPiA+ID4+ID4g
Y2xvY2tzLCBzcGVjaWFsbHkgaWYgdGhleSdyZSBhbHNvIHVzZWQgZm9yIHNhdGVsbGl0ZSwgc28g
SSBjYW4ndAo+ID4gPiA+PiA+IGJlIHN1cmUgYnkganVzdCBsb29raW5nIGF0IHRoZSBkcml2ZXIn
cyBjb2RlLgo+ID4gPiA+PiA+Cj4gPiA+ID4+ID4gQWxzbywgd2UgaGFkIGFscmVhZHkgYSBidW5j
aCBvZiByZWdyZXNzaW9ucyB3aXRoICJmaXhlcyIgbGlrZSB0aGlzCj4gPiA+ID4+ID4gdGhhdCBh
Y3R1YWxseSBicm9rZSBmcm9udGVuZCBkcml2ZXJzLgo+ID4gPiA+Pgo+ID4gPiA+PiBUaGlzIHBh
dGNoIHByZXNlcnZlcyB0aGUgZXhpc3RpbmcgYmVoYXZpb3IuIFRoZSBzYW1wbGVfZnJlcV9oego+
ID4gPiA+PiB2YXJpYWJsZQo+ID4gPiA+PiBpcyBhIHUzMiBzbywgaW4gdGhlIG9yaWdpbmFsIGNv
ZGUsIHogY291bGRuJ3QgaGF2ZSBiZWVuIG1vcmUgdGhhbgo+ID4gPiA+PiBVMzJfTUFYIGV2ZW4g
dGhvdWdoIGl0IHdhcyBkZWNsYXJlZCBhcyBhIHU2NC4KPiA+Cj4gPgo+ID4gSSBhZ3JlZSB3aXRo
IERhbiwgd2Uga2VlcCB0aGUgZXhpc3RpbmcgYmVoYXZpb3VyLiBTbyBpdCB3b250IGh1cnQgdG8K
PiA+IG1lcmdlIHRoZSBjb2RlLi4uCj4gPgo+ID4gQWxsICB0aGF0IHNhaWQsIGlmIHNvbWVvbmUg
aGFzIGFjY2VzcyB0byB0aGUgRFMsIEkgZG8gbm90IG1pbmQgcmV2aWV3aW5nIGl0Lgo+ID4KPiA+
Cj4gPiA+ID4+Cj4gPiA+ID4+IEl0J3MgcG9zc2libGUgdGhhdCB0aGUgb3JpZ2luYWwgY29kZSB3
YXMgd3JvbmcuICBXZSBoYXZlIHNlZW4gdGhhdCBpbgo+ID4gPiA+PiBvdGhlciBwbGFjZXMgaW4g
dGhpcyBwYXRjaHNldC4gIEFkZGluZyBhIG5vdGUgYWJvdXQgdGhlIGRhdGFzaGVldCBpcwo+ID4g
PiA+PiBhbHNvIGEgZ29vZCBpZGVhLgo+ID4gPiA+Pgo+ID4gPiA+PiByZWdhcmRzLAo+ID4gPiA+
PiBkYW4gY2FycGVudGVyCj4gPiA+ID4+Cj4gPgo+ID4KPiA+Cj4gPiAtLQo+ID4gUmljYXJkbyBS
aWJhbGRhCj4gPgo+Cj4gTmljZSB0byBoZWFyIGZyb20geW91ISAgOi0pCj4KPiBJIGJlbGlldmUg
dGhhdCBJIG1heSBoYXZlIGEgY29weSBvZiBpdCBvbiBhbiBvbGQgInNwaW5ueSIgaGFyZCBkcml2
ZQo+IHNvbWV3aGVyZSBpbiBvbmUgb2YgdGhlIGFuY2llbnQgZGVza3RvcCBjb21wdXRlcnMgSSBo
YXZlIGxpbmluZyBteQo+IGJhc2VtZW50IHdhbGxzLCBsb2wuICBJdCB3aWxsIHRha2UgbWUgc29t
ZSB0aW1lIHRvIGxvY2F0ZSBpdC4gIEkgaG9wZQo+IHRoaXMgaXNuJ3QgdXJnZW50IG86LSkKPgo+
IC4uLkl0IHNvIGhhcHBlbnMgdGhhdCB0aGUgZGV2IGJveCBJIHVzZWQgd2hlbiBJIHdvcmtlZCBv
biB0aGF0IGRyaXZlcgo+IGlzIHVwIHJpZ2h0IG5vdywgYnV0IHRoZSBkYXRhc2hlZXQgaXNuJ3Qg
aW4gbXkgaG9tZSBkaXJlY3RvcnkuICBUaGVyZQo+IGFyZSB0d28gb3RoZXIgZHJpdmVzIGluIHRo
ZSBjaGFzc2lzIGJ1dCBub3QgY29ubmVjdGVkIC8gcG93ZXJlZCAtIEknbGwKPiBnaXZlIHRoZXNl
IGEgbG9vayBhbmQgbGV0IHlvdSBrbm93IGlmIEkgZmluZCBhbnl0aGluZy4KPgo+IEJlc3QsCj4g
TWljaGFlbCBLcnVma3kKCgoKLS0gClJpY2FyZG8gUmliYWxkYQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
