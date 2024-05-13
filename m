Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 991128C56D5
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2024 15:18:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20EF7C6DD9A;
	Tue, 14 May 2024 13:18:51 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04117C5E2CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 14:25:58 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-36cc579fd48so13514235ab.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 07:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715610358; x=1716215158;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sK9xvJl9XrjIJPbZCGnymwZFnfbvziAIa+Da/Sad12w=;
 b=HBCQBaZ5poPZ4s9QQlLnvEBDME/nM3v91J7JfKGvhpfapjvxLizfvcYvHutVT6Mx2J
 sDr/AHIIKqLSxVQcPljKBfOZE871QvHt0Vr3Jf0dFBIGgQyLpWwgnR6ONjc0BZvehRSC
 QdUZPtsbuT5eZUcfo+xvpwIDD7O3mbJJA96fMUKtWLMjaSU2PpnVkiT7zjCiaVkuSp7Q
 0AmtRN8iwBtwh6sefwOnU3a5LFn6piRWMYHNzNr6ZR5J6BPQfkmp1HqobOTkXSXGzsL+
 G/oJC81FluiilcipkuMvUduxOIO8JEgYIGcCEuGgjuSNQWi00r795hohmn+6WO42uPkW
 Ml6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgyK4WgFDTYcdt43AJ5zTDwPPfutEbG9PUdUx0nNDlfjCVOOY47F00il8dz709L+UXyLpvTfUB7gDrrCiSqspyR17M7MSMSxGbHKjAISxlp4plJfN9qEvr
X-Gm-Message-State: AOJu0YwITxBiPSlU9jbF9qiePlWb0L7bHkXRt32dwIHoXtNWvt1gLvvZ
 QflNmB1c2uUKE4hAp1nhQUvGxS18htuUkD3GeA575a9vNvkuvQzCsiHzWg4z6M7uo7IPSTTTnDJ
 NwFPvMOUAr8TScFa4JWXuAeTaUnI=
X-Google-Smtp-Source: AGHT+IFyOfQnbA9ms39YA3JnidYP9+rIgusb4dXRdT9AsrFWsuAAy/tDhx5o7DbKhUv0mKkeQIsYNZzXtRA/E0XxIpU=
X-Received: by 2002:a05:6e02:1c84:b0:36c:f0b:4f54 with SMTP id
 e9e14a558f8ab-36cc14e788cmr123202195ab.21.1715610357786; Mon, 13 May 2024
 07:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org>
 <20240503112758.763d8d31@sal.lan>
 <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain>
 <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
 <fe95e3c3a89de4566a4eb53ca8b26c25@manjaro.org>
 <CANiDSCswvsTh+0oJmHkYC=-qE8g09bHr44amBsUXkK6j1eCMWA@mail.gmail.com>
In-Reply-To: <CANiDSCswvsTh+0oJmHkYC=-qE8g09bHr44amBsUXkK6j1eCMWA@mail.gmail.com>
From: Michael Ira Krufky <mkrufky@linuxtv.org>
Date: Mon, 13 May 2024 10:25:46 -0400
Message-ID: <CAOcJUbwJkbEG6+u==de7CzXDUPGj6J3-p-7E3o+iAzjgSgybSg@mail.gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
X-Mailman-Approved-At: Tue, 14 May 2024 13:18:49 +0000
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

T24gTW9uLCBNYXkgMTMsIDIwMjQgYXQgOTozOOKAr0FNIFJpY2FyZG8gUmliYWxkYSA8cmliYWxk
YUBjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCAzIE1heSAyMDI0IGF0IDE2OjA4LCBE
cmFnYW4gU2ltaWMgPGRzaW1pY0BtYW5qYXJvLm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGVsbG8gUmlj
YXJkbywKPiA+Cj4gPiBPbiAyMDI0LTA1LTAzIDEzOjU2LCBSaWNhcmRvIFJpYmFsZGEgd3JvdGU6
Cj4gPiA+IEkgYW0gdHJ5aW5nIHRvIGdldCB0aGUgRFMsIGJ1dAo+ID4gPiBodHRwczovL3d3dy5u
eHAuY29tL2Fjcm9iYXRfZG93bmxvYWQvbGl0ZXJhdHVyZS85Mzk3Lzc1MDE1OTMxLnBkZiBpcyBh
Cj4gPiA+IGRlYWQgbGlua3Mgbm93Lgo+ID4gPgo+ID4gPiBBbnlvbmUgaGF2ZSBhY2Nlc3MgdG8g
dGhlIGRhdGFzaGVldD8KPiA+Cj4gPiBJdCdzIGtpbmQgb2YgYXZhaWxhYmxlIG9uIHRoZSBsaW5r
IGJlbG93LCBidXQgZm9yIHNvbWUgc3RyYW5nZSByZWFzb24KPiA+IHRoZSBkb3dubG9hZCBmYWls
cyBhZnRlciBkb3dubG9hZGluZyB0aGUgZmlyc3QgMTI4IEtCIG9yIHNvLgo+ID4KPiA+IGh0dHBz
Oi8vd2ViLmFyY2hpdmUub3JnL3dlYi8yMDA4MDkwNzE4NTUzMi9odHRwczovL3d3dy5ueHAuY29t
L2Fjcm9iYXRfZG93bmxvYWQvbGl0ZXJhdHVyZS85Mzk3Lzc1MDE1OTMxLnBkZlwKPgo+IE1pa2Us
IGJ5IGFueSBjaGFuY2UgZG8geW91IGhhdmUgYSBjb3B5IG9mIHRoZSBEUz8KPgo+Cj4gPgo+ID4K
PiA+ID4gT24gRnJpLCAzIE1heSAyMDI0IGF0IDEzOjU1LCBEYW4gQ2FycGVudGVyIDxkYW4uY2Fy
cGVudGVyQGxpbmFyby5vcmc+Cj4gPiA+IHdyb3RlOgo+ID4gPj4KPiA+ID4+IE9uIEZyaSwgTWF5
IDAzLCAyMDI0IGF0IDExOjI3OjU4QU0gKzAxMDAsIE1hdXJvIENhcnZhbGhvIENoZWhhYiB3cm90
ZToKPiA+ID4+ID4gRW0gTW9uLCAyOSBBcHIgMjAyNCAxNTowNTowNSArMDAwMAo+ID4gPj4gPiBS
aWNhcmRvIFJpYmFsZGEgPHJpYmFsZGFAY2hyb21pdW0ub3JnPiBlc2NyZXZldToKPiA+ID4+ID4K
PiA+ID4+ID4gPiBXZSBkbyBub3QgZXhwZWN0IHRoZSBzYW1wbGVfZnJlcSB0byBiZSBvdmVyIDYx
M01Iei4KPiA+ID4+ID4gPgo+ID4gPj4gPiA+IEZvdW5kIGJ5IGNvY2NpOgo+ID4gPj4gPiA+IGRy
aXZlcnMvbWVkaWEvZHZiLWZyb250ZW5kcy90ZGExMDA0OC5jOjM0NToxLTc6IFdBUk5JTkc6IGRv
X2RpdigpIGRvZXMgYSA2NC1ieS0zMiBkaXZpc2lvbiwgcGxlYXNlIGNvbnNpZGVyIHVzaW5nIGRp
djY0X3U2NCBpbnN0ZWFkLgo+ID4gPj4gPiA+Cj4gPiA+PiA+ID4gU2lnbmVkLW9mZi1ieTogUmlj
YXJkbyBSaWJhbGRhIDxyaWJhbGRhQGNocm9taXVtLm9yZz4KPiA+ID4+ID4gPiAtLS0KPiA+ID4+
ID4gPiAgZHJpdmVycy9tZWRpYS9kdmItZnJvbnRlbmRzL3RkYTEwMDQ4LmMgfCA0ICsrKy0KPiA+
ID4+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
ID4gPj4gPiA+Cj4gPiA+PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvZHZiLWZyb250
ZW5kcy90ZGExMDA0OC5jIGIvZHJpdmVycy9tZWRpYS9kdmItZnJvbnRlbmRzL3RkYTEwMDQ4LmMK
PiA+ID4+ID4gPiBpbmRleCAzZTcyNWNkY2M2NmIuLjE4ODZmNzMzZGJiZiAxMDA2NDQKPiA+ID4+
ID4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL2R2Yi1mcm9udGVuZHMvdGRhMTAwNDguYwo+ID4gPj4g
PiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvZHZiLWZyb250ZW5kcy90ZGExMDA0OC5jCj4gPiA+PiA+
ID4gQEAgLTMyOCw3ICszMjgsOCBAQCBzdGF0aWMgaW50IHRkYTEwMDQ4X3NldF93cmVmKHN0cnVj
dCBkdmJfZnJvbnRlbmQgKmZlLCB1MzIgc2FtcGxlX2ZyZXFfaHosCj4gPiA+PiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgIHUzMiBidykKPiA+ID4+ID4gPiAgewo+ID4gPj4gPiA+ICAgICBz
dHJ1Y3QgdGRhMTAwNDhfc3RhdGUgKnN0YXRlID0gZmUtPmRlbW9kdWxhdG9yX3ByaXY7Cj4gPiA+
PiA+ID4gLSAgIHU2NCB0LCB6Owo+ID4gPj4gPiA+ICsgICB1MzIgejsKPiA+ID4+ID4gPiArICAg
dTY0IHQ7Cj4gPiA+PiA+ID4KPiA+ID4+ID4gPiAgICAgZHByaW50aygxLCAiJXMoKVxuIiwgX19m
dW5jX18pOwo+ID4gPj4gPiA+Cj4gPiA+PiA+ID4gQEAgLTM0MSw2ICszNDIsNyBAQCBzdGF0aWMg
aW50IHRkYTEwMDQ4X3NldF93cmVmKHN0cnVjdCBkdmJfZnJvbnRlbmQgKmZlLCB1MzIgc2FtcGxl
X2ZyZXFfaHosCj4gPiA+PiA+ID4gICAgIC8qIHQgKj0gMjE0NzQ4MzY0OCBvbiAzMmJpdCBwbGF0
Zm9ybXMgKi8KPiA+ID4+ID4gPiAgICAgdCAqPSAoMjA0OCAqIDEwMjQpOwo+ID4gPj4gPiA+ICAg
ICB0ICo9IDEwMjQ7Cj4gPiA+PiA+ID4gKyAgIC8qIFNhbXBsZSBmcmVxdWVuY3kgaXMgdW5kZXIg
NjEzTUh6ICovCj4gPiA+PiA+Cj4gPiA+PiA+IEFyZSB5b3Ugc3VyZSBhYm91dCB0aGF0PyBTb21l
IERWQiBkZXZpY2VzIGhhdmUgdmVyeSBoaWdoIGZyZXF1ZW5jeQo+ID4gPj4gPiBjbG9ja3MsIHNw
ZWNpYWxseSBpZiB0aGV5J3JlIGFsc28gdXNlZCBmb3Igc2F0ZWxsaXRlLCBzbyBJIGNhbid0Cj4g
PiA+PiA+IGJlIHN1cmUgYnkganVzdCBsb29raW5nIGF0IHRoZSBkcml2ZXIncyBjb2RlLgo+ID4g
Pj4gPgo+ID4gPj4gPiBBbHNvLCB3ZSBoYWQgYWxyZWFkeSBhIGJ1bmNoIG9mIHJlZ3Jlc3Npb25z
IHdpdGggImZpeGVzIiBsaWtlIHRoaXMKPiA+ID4+ID4gdGhhdCBhY3R1YWxseSBicm9rZSBmcm9u
dGVuZCBkcml2ZXJzLgo+ID4gPj4KPiA+ID4+IFRoaXMgcGF0Y2ggcHJlc2VydmVzIHRoZSBleGlz
dGluZyBiZWhhdmlvci4gVGhlIHNhbXBsZV9mcmVxX2h6Cj4gPiA+PiB2YXJpYWJsZQo+ID4gPj4g
aXMgYSB1MzIgc28sIGluIHRoZSBvcmlnaW5hbCBjb2RlLCB6IGNvdWxkbid0IGhhdmUgYmVlbiBt
b3JlIHRoYW4KPiA+ID4+IFUzMl9NQVggZXZlbiB0aG91Z2ggaXQgd2FzIGRlY2xhcmVkIGFzIGEg
dTY0Lgo+Cj4KPiBJIGFncmVlIHdpdGggRGFuLCB3ZSBrZWVwIHRoZSBleGlzdGluZyBiZWhhdmlv
dXIuIFNvIGl0IHdvbnQgaHVydCB0bwo+IG1lcmdlIHRoZSBjb2RlLi4uCj4KPiBBbGwgIHRoYXQg
c2FpZCwgaWYgc29tZW9uZSBoYXMgYWNjZXNzIHRvIHRoZSBEUywgSSBkbyBub3QgbWluZCByZXZp
ZXdpbmcgaXQuCj4KPgo+ID4gPj4KPiA+ID4+IEl0J3MgcG9zc2libGUgdGhhdCB0aGUgb3JpZ2lu
YWwgY29kZSB3YXMgd3JvbmcuICBXZSBoYXZlIHNlZW4gdGhhdCBpbgo+ID4gPj4gb3RoZXIgcGxh
Y2VzIGluIHRoaXMgcGF0Y2hzZXQuICBBZGRpbmcgYSBub3RlIGFib3V0IHRoZSBkYXRhc2hlZXQg
aXMKPiA+ID4+IGFsc28gYSBnb29kIGlkZWEuCj4gPiA+Pgo+ID4gPj4gcmVnYXJkcywKPiA+ID4+
IGRhbiBjYXJwZW50ZXIKPiA+ID4+Cj4KPgo+Cj4gLS0KPiBSaWNhcmRvIFJpYmFsZGEKPgoKTmlj
ZSB0byBoZWFyIGZyb20geW91ISAgOi0pCgpJIGJlbGlldmUgdGhhdCBJIG1heSBoYXZlIGEgY29w
eSBvZiBpdCBvbiBhbiBvbGQgInNwaW5ueSIgaGFyZCBkcml2ZQpzb21ld2hlcmUgaW4gb25lIG9m
IHRoZSBhbmNpZW50IGRlc2t0b3AgY29tcHV0ZXJzIEkgaGF2ZSBsaW5pbmcgbXkKYmFzZW1lbnQg
d2FsbHMsIGxvbC4gIEl0IHdpbGwgdGFrZSBtZSBzb21lIHRpbWUgdG8gbG9jYXRlIGl0LiAgSSBo
b3BlCnRoaXMgaXNuJ3QgdXJnZW50IG86LSkKCi4uLkl0IHNvIGhhcHBlbnMgdGhhdCB0aGUgZGV2
IGJveCBJIHVzZWQgd2hlbiBJIHdvcmtlZCBvbiB0aGF0IGRyaXZlcgppcyB1cCByaWdodCBub3cs
IGJ1dCB0aGUgZGF0YXNoZWV0IGlzbid0IGluIG15IGhvbWUgZGlyZWN0b3J5LiAgVGhlcmUKYXJl
IHR3byBvdGhlciBkcml2ZXMgaW4gdGhlIGNoYXNzaXMgYnV0IG5vdCBjb25uZWN0ZWQgLyBwb3dl
cmVkIC0gSSdsbApnaXZlIHRoZXNlIGEgbG9vayBhbmQgbGV0IHlvdSBrbm93IGlmIEkgZmluZCBh
bnl0aGluZy4KCkJlc3QsCk1pY2hhZWwgS3J1Zmt5Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
