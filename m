Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2E091E95C
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2024 22:16:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D94CFC6DD9E;
	Mon,  1 Jul 2024 20:16:10 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05D41C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jul 2024 20:16:04 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ec002caeb3so40967891fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jul 2024 13:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719864963; x=1720469763;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L/7AZmTT+AVERGwwpJNjGUJrmrBTr7GP14K4O8EWIlY=;
 b=LTL4W/u6NgmEtYfFhwnmZm2hHjoyUYlqUNQ/GsR0YDfR8G1DspibSymb1kyws91uYy
 9s1TalY/oZFp19BTqhsBu7sSr8tpn59bdTJi0vqD+4kAduN2n01x05ihiJ25i1mPGcdg
 ew/kftoPNEdSQrXeKN1RSSSLAiOarD+9seavYbGf5lqUjMv7GNKpzR0RSb2WfpQcdDgc
 9PavidRQEqJwkB39IYLS9RwvN9mX8PD/yFZo6SF374wh7Tz3zosWzAyUr0Z1P11pY3Km
 Z4kvP6PY8PEltLQNWJD/9iMH9mZQMg496hXFVeLsiB//+CLTGA9X2AiSfVCSGTX0b1s+
 Cy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719864963; x=1720469763;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L/7AZmTT+AVERGwwpJNjGUJrmrBTr7GP14K4O8EWIlY=;
 b=Mh1sIrS1ybRSWpJubSFUKJzZj1JqfsyNUZHh605vmHXuKt29bPTYs30sZwjoQWvRlR
 y1bXkNFPl/+vMfoPFClVNhYDgEYrmUvtcG0SdYidp7s9u8Ldr9WLUxl+AUgwGR7sE11c
 oqtOcd6cL79uIqVRFV/1zvWojCfj1Df9UbVgMD7WPBpixqXJf9qjHdkxSgHp9OYquCgV
 nKBcn/GDBQWPDu7L00NcwJVv0f4nFg91sM+lkXS2IE2eiGUZJs411selVx6Q2gPPMTYs
 Scy9Lozxocbiz0EelgOuvBrVfUjRIypf2da1w1ASxSQ1dm54BGm5GjbCNi09099o/YMO
 liZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWYE2lpYRy7ljT+ClNlgLih+sE8BXdidn7yqacdYFghZW5D3ugm286H/ET71k49AFAq/kw83htsF07F42LO1gqejZaF+hQHIDEoXq4+X3OWRv9+CMRmsH/
X-Gm-Message-State: AOJu0YwnyMv9D678k4PCQ3wdF/nNW+icI3rZhoyhDO/OALKbBkiemvB7
 vfqkZjOHmOSuKLz1VM5PEN78/LHJzAVW3K0h7Gn+9Tf/sc0sOKoXvlhVo72qo1p/TE69cPPeVl8
 S7hfZxHEvk+QBxeA2nf0sDeBSwYsUXkwpVFit1A==
X-Google-Smtp-Source: AGHT+IEKAZ0mm0RcxwgLcfbN1Y6EDGlhonP962JD5DjNt0v+wIWUTtByp8xBB5E9Sy3ozcPBuqs8cSZzA/gNt5LZ0dQ=
X-Received: by 2002:a05:651c:b0b:b0:2ec:5c94:3d99 with SMTP id
 38308e7fff4ca-2ee5e3810b7mr44548691fa.2.1719864963002; Mon, 01 Jul 2024
 13:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240627113948.25358-1-brgl@bgdev.pl>
 <20240627113948.25358-3-brgl@bgdev.pl>
 <td5jbseo7gtu6d4xai6q2zkfmxw4ijimyiromrf52he5hze3w3@fd3kayixf4lw>
 <f416e06e-e354-4628-883b-07850f05e276@lunn.ch>
In-Reply-To: <f416e06e-e354-4628-883b-07850f05e276@lunn.ch>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Jul 2024 22:15:51 +0200
Message-ID: <CAMRc=MdSte_7MSfR1DAH8fHpHWcOfgPX2SO9DR1UnXrgvMDbdg@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v2 net-next 2/2] net: stmmac: qcom-ethqos:
 add a DMA-reset quirk for sa8775p-ride
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

T24gVGh1LCBKdW4gMjcsIDIwMjQgYXQgOTozN+KAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1biAyNywgMjAyNCBhdCAxMjowNzoyMlBNIC0wNTAw
LCBBbmRyZXcgSGFsYW5leSB3cm90ZToKPiA+IE9uIFRodSwgSnVuIDI3LCAyMDI0IGF0IDAxOjM5
OjQ3UE0gR01ULCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gPiBGcm9tOiBCYXJ0b3N6
IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4gPiA+Cj4gPiA+
IE9uIHNhODc3NXAtcmlkZSB0aGUgUlggY2xvY2tzIGZyb20gdGhlIEFRUjExNUMgUEhZIGFyZSBu
b3QgYXZhaWxhYmxlIGF0Cj4gPiA+IHRoZSB0aW1lIG9mIHRoZSBETUEgcmVzZXQgc28gd2UgbmVl
ZCB0byBsb29wIFRYIGNsb2NrcyB0byBSWCBhbmQgdGhlbgo+ID4gPiBkaXNhYmxlIGxvb3BiYWNr
IGFmdGVyIGxpbmstdXAuIFVzZSB0aGUgZXhpc3RpbmcgY2FsbGJhY2tzIHRvIGRvIGl0IGp1c3QK
PiA+ID4gZm9yIHRoaXMgYm9hcmQuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3og
R29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KPiA+Cj4gPiBTb3Jy
eSwgbm90IGJlaW5nIHZlcnkgaGVscGZ1bCBidXQgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlc2Ug
Y2hhbmdlcwo+ID4gYW5kIHRoZSBnZW5lcmFsIGNsZWFudXAgb2Ygc3RtbWFjLi4uIHNvIEknbGwg
cG9pbnQgb3V0IHRoYXQgSSdtIHN0aWxsCj4gPiBjb25mdXNlZCBieSB0aGlzIGJhc2VkIG9uIFJ1
c3NlbGwncyBsYXN0IHJlc3BvbnNlOgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2
L1puUUxFRCUyRkMzT3BlaW01cUBzaGVsbC5hcm1saW51eC5vcmcudWsvCj4gPgo+ID4gUXVvdGU6
Cj4gPgo+ID4gICAgIElmIHlvdSdyZSB1c2luZyB0cnVlIENpc2NvIFNHTUlJLCB0aGVyZSBhcmUg
X25vXyBjbG9ja3MgdHJhbnNmZXJyZWQKPiA+ICAgICBiZXR3ZWVuIHRoZSBQSFkgYW5kIFBDUy9N
QUMuIFRoZXJlIGFyZSB0d28gYmFsYW5jZWQgcGFpcnMgb2YgZGF0YQo+ID4gICAgIGxpbmVzIGFu
ZCB0aGF0IGlzIGFsbCAtIG9uZSBmb3IgdHJhbnNtaXQgYW5kIG9uZSBmb3IgcmVjZWl2ZS4gU28g
dGhpcwo+ID4gICAgIGV4cGxhbmF0aW9uIGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBtZS4KPiA+Cj4K
PiBBZ3JlZWQuIFdlIG5lZWQgYSBkZWVwZXIgdW5kZXJzdGFuZGluZyBvZiB0aGUgY2xvY2tpbmcg
dG8gZmluZCBhbgo+IGFjY2VwdGFibGUgc29sdXRpb24gdG8gdGhpcyBwcm9ibGVtLgo+Cj4gSXMg
dGhlIE1BQyBleHRyYWN0aW5nIGEgY2xvY2sgZnJvbSB0aGUgU0VSREVTIGxpbmVzPwo+Cj4gSXMg
dGhlIFBIWSBub3QgZHJpdmluZyB0aGUgU0VSREVTIGxpbmVzIHdoZW4gdGhlcmUgaXMgbm8gbGlu
az8KPgo+IEZvciBSR01JSSBQSFlzLCB0aGV5IG9mdGVuIGRvIGhhdmUgYSBjbG9jayBvdXRwdXQg
YXQgMjUgb3IgNTBNSHogd2hpY2gKPiB0aGUgTUFDIHVzZXMuIEFuZCBzb21lIFBIWSBkcml2ZXJz
IG5lZWQgYXNraW5nIHRvIG5vdCB0dXJuIHRoaXMgY2xvY2sKPiBvZmYuICBNYXliZSB3ZSBuZWVk
IHRoZSBzYW1lIGhlcmUsIGJ5IGFza2luZyB0aGUgUEhZIHRvIGtlZXAgdGhlCj4gU0VSREVTIGxp
bmVzIHJ1bm5pbmcgd2hlbiB0aGVyZSBpcyBubyBsaW5rPwo+CgpZZXMsIHRoZXJlIGFyZSB0d28g
NTBNSHogb3V0cHV0cyBvbiB0aGlzIFBIWSBidXQgdGhleSBhcmUgbm90CmNvbm5lY3RlZCBvbiB0
aGlzIGJvYXJkLgoKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xMC1yYzUv
c291cmNlL2luY2x1ZGUvbGludXgvcGh5LmgjTDc4MQo+Cj4gSSBhbHNvIHdvdW5kZXIgd2h5IHRo
aXMgaXMgbm90IGFuIGlzc3VlIHdpdGggcGxhaW4gU0dNSUksIHJhdGhlciB0aGFuCj4gb3ZlcmNs
b2NrZWQgU0dNSUk/IE1heWJlIHRoZXJlIGlzIGFscmVhZHkgYSB3b3JrYXJvdW5kIGZvciBTR01J
SSBhbmQKPiBpdCBqdXN0IG5lZWRzIGV4dGVuZGVkIHRvIHRoaXMgbm90IHF1aWV0IDI1MDBCYXNl
WCBtb2RlLgo+CgpXZWxsLCB5b3UgcG9pbnRlZCBvdXQgdGhhdCB0aGVyZSBpcyBhIERNQS1yZXNl
dC1yZWxhdGVkIHdvcmthcm91bmQgaW4KcGxhY2UgZm9yIGV0aHFvcyBzbyBJIHRyaWVkIHRvIHJl
dXNlIGl0IGluIHRoaXMgdmVyc2lvbi4gRG9lcyBpdApjb3VudD8gOikgV2UgZGlkIGVzdGFibGlz
aCB0aGF0IHRoaXMgbW9kZSBoYXMgbm8gaW4tYmFuZCBzaWduYWxsaW5nLApzbyB3ZSBzaG91bGQg
YmUgZmluZSB3aXRoIHRoZSBhYm92ZSBzb2x1dGlvbiBhZnRlciBhbGwuCgpBbHNvIHJlZ2FyZGlu
ZyB0aGUgUEhZIG1vZGU6IG9uIGEgcmF0aGVyIG5vbi10ZWNobmljYWwgZGlhZ3JhbSBJCmZvdW5k
LCB0aGUgZm91ciBTR01JSSBzaWduYWxzIGdvaW5nIHRvIHRoZSBNQUMgYXJlIHJlZmVycmVkIHRv
IGFzIDIuNUcKSFNHTUlJLCBub3QgT0NTR01JSSBidXQgSSdtIG5vdCBzdXJlIGlmIHRoYXQncyBq
dXN0IG5hbWluZyBjb252ZW50aW9uLgoKSSdtIHN0aWxsIHRyeWluZyB0byBnZXQgbW9yZSBpbmZv
IGJ1dCBpdCdzIHRha2luZyB0aW1lLi4uIDooCgpCYXJ0b3N6Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
