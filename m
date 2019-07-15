Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E44B8684C8
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jul 2019 10:02:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AAC2C61A39
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jul 2019 08:02:38 +0000 (UTC)
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93441C59C9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jul 2019 08:02:35 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id h28so10731673vsl.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jul 2019 01:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iuvLGLsstyrfvORfrha76hOJIbaEdkc5waXCSHT3U28=;
 b=oIEVkRA2iKUiSROtP71CyA8BYybIftJW4gJE9GU+nIJm0SBaF5fp5l5vvUbNiXyw60
 42SCo5/Nj3mgoSpXo0t4tGsWjSAW6ZqxeyHcTbzvWydbI/DniEzHsE5m2ZfW9OVRxThJ
 olOiag19xKLJz6CAhLt0oqgOwCp+NPFNmlqkZABFsPn0/vI3LVKcjknVz0RiR+Ywltsi
 wjVCMktkiUC+J8Fq+C3nNKI6uC1eTZDxPosS7z6OSwCED1MM4Yy/n1MC/pBaR9kCd4I6
 k6qrMdPKcCGxS8Zp4Roi//B1ZYvQqxBCF2Ht+8BYpRW1an4f+rYdKo98YdHSoAFUX1hZ
 9LlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iuvLGLsstyrfvORfrha76hOJIbaEdkc5waXCSHT3U28=;
 b=diJRbZjuy/Jsa432H8W6YCXMY2DJbUoD8NLevEsiiKGqshp6QXf2UNMbCkG8jTXMhl
 hEt5YffK76BbkD4FeR893J5Gpxk0iXOIYx43E5wxF6Eyn/ywrOsQEOzFu9Uf4hQuKPKB
 o9grcGqQhC8zp1CTsz9CUqov6+TywyWeiu24UfmiHx3bSUsFCnEfS1tZN+OTH0QuiRb2
 ukHr8+VOxPVwHNMmLfYZQ4Gtujq+XaOqzm6ktdGVUGhZJnqu9cjpLTqCh0n/eeCRXMxQ
 0dCqodSpDQw+J7Jb8rTrX39AGClX/jn7nJ983nLUFp5BbYlC/shVbBHnoOPByES9cKZW
 R85g==
X-Gm-Message-State: APjAAAUmd2LwnGOM+QFVIDo3iEUvKAFgYxybFoa4L5zzeN/Kkg+Wx1dB
 D/PXbSCOUWk6m8AFxGZRmEcyHsxda+e/NsuCOAQaWg==
X-Google-Smtp-Source: APXvYqz9I5YBxjFFkO53VilAz3vY9qzYuKTKMoBVSx7wkqVdfBCSqxzgYb9P6olM18c/3fom7byG6FaKIJC0UxNoLH4=
X-Received: by 2002:a67:7a90:: with SMTP id
 v138mr15572454vsc.200.1563177754346; 
 Mon, 15 Jul 2019 01:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <1559577325-19266-1-git-send-email-ludovic.Barre@st.com>
 <5b7e1ae5-c97e-5a21-fc3e-7cc328087f04@st.com>
 <CAPDyKFrULRk=cHzVodU9aa6LDX9ip-VPHNwG7QXhmNZrMpPjGw@mail.gmail.com>
 <CAPDyKFr_KNpNY-xgGdKXdAnmmD5OD1=wxgs2LmBAUJOn0mZwqg@mail.gmail.com>
 <1563176363071.36427@st.com>
In-Reply-To: <1563176363071.36427@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Jul 2019 10:01:58 +0200
Message-ID: <CAPDyKFpLoqZxX=nnivt-8zF_Azen+Vyf6vE4acB+r=LGOcz=5Q@mail.gmail.com>
To: Ludovic BARRE <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V3 0/3] mmc: mmci: add busy detect for
	stm32 sdmmc variant
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

T24gTW9uLCAxNSBKdWwgMjAxOSBhdCAwOTozOSwgTHVkb3ZpYyBCQVJSRSA8bHVkb3ZpYy5iYXJy
ZUBzdC5jb20+IHdyb3RlOgo+Cj4gSGkgVWxmCj4KPiBsaWtlIHNjaGVkdWxlZCwgSSBzZW5kIHlv
dSBhICJnZW50bGVtYW4gcGluZyIgYWJvdXQgdGhpcyBzZXJpZXMuCgpUaGFua3MsIEkgYW0ganVz
dCBsb29raW5nIGF0IGl0LCBhZ2Fpbi4KCktpbmQgcmVnYXJkcwpVZmZlCgo+Cj4gUmVnYXJkcywK
PiBMdWRvCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IERlIDog
VWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxpbmFyby5vcmc+Cj4gRW52b3nDqSA6IGpldWRpIDIw
IGp1aW4gMjAxOSAxNTo1MAo+IMOAIDogTHVkb3ZpYyBCQVJSRQo+IENjIDogUm9iIEhlcnJpbmc7
IFNyaW5pdmFzIEthbmRhZ2F0bGE7IE1heGltZSBDb3F1ZWxpbjsgQWxleGFuZHJlIFRPUkdVRTsg
TGludXggQVJNOyBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0OyBEVE1MOyBsaW51eC1tbWNAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4g
T2JqZXQgOiBSZTogW1BBVENIIFYzIDAvM10gbW1jOiBtbWNpOiBhZGQgYnVzeSBkZXRlY3QgZm9y
IHN0bTMyIHNkbW1jIHZhcmlhbnQKPgo+IEhpIEx1ZG92aWMsCj4KPiBPbiBUaHUsIDEzIEp1biAy
MDE5IGF0IDE1OjEzLCBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4gd3JvdGU6
Cj4gPgo+ID4gT24gVGh1LCAxMyBKdW4gMjAxOSBhdCAxNTowMiwgTHVkb3ZpYyBCQVJSRSA8bHVk
b3ZpYy5iYXJyZUBzdC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBoaSBVbGYKPiA+ID4KPiA+ID4g
SnVzdCBhICJnZW50bGVtYW4gcGluZyIgYWJvdXQgdGhpcyBzZXJpZXMuCj4gPiA+IEkga25vdyB5
b3UgYXJlIGJ1c3ksIGl0J3MganVzdCB0byBiZSBzdXJlIHlvdSBkbyBub3QgZm9yZ2V0IG1lIDot
KQo+ID4KPiA+IFRoYW5rcyEgSSBzdGFydGVkIGJyaWVmbHkgdG8gcmV2aWV3LCBidXQgZ290IGRp
c3RyYWN0ZWQgYWdhaW4uIEkgd2lsbAo+ID4gY29tZSB0byBpdCwgYnV0IGl0IGp1c3Qgc2VlbXMg
dG8gdGFrZSBtb3JlIHRpbWUgdGhhbiBpdCBzaG91bGQsIG15Cj4gPiBhcG9sb2dpZXMuCj4KPiBB
bHJpZ2h0LCBzbyBJIHBsYW5uZWQgdG8gcmV2aWV3IHRoaXMgdGhpcyB3ZWVrIC0gYnV0IGZhaWxl
ZC4gSSBoYXZlCj4gYmVlbiBvdmVyd2hlbG1lZCB3aXRoIHdvcmsgbGF0ZWx5IChhcyB1c3VhbCB3
aGVuIHZhY2F0aW9uIGlzIGdldHRpbmcKPiBjbG9zZXIpLgo+Cj4gSSBuZWVkIHRvIGdlbnRseSBy
ZXF1ZXN0IHRvIGNvbWUgYmFjayB0byB0aGlzIGFzIG9mIHdlZWsgMjgsIHdoZW4gSQo+IHdpbGwg
Z2l2ZSB0aGlzIHRoZSBoaWdoZXN0IHByaW8uIEFnYWluIGFwb2xvZ2l6ZSBmb3IgdGhlIGRlbGF5
cyEKPgo+IEtpbmQgcmVnYXJkcwo+IFVmZmUKPgo+ID4KPiA+IEJyCj4gPiBVZmZlCj4gPgo+ID4g
Pgo+ID4gPiBSZWdhcmRzCj4gPiA+IEx1ZG8KPiA+ID4KPiA+ID4gT24gNi8zLzE5IDU6NTUgUE0s
IEx1ZG92aWMgQmFycmUgd3JvdGU6Cj4gPiA+ID4gRnJvbTogTHVkb3ZpYyBCYXJyZSA8bHVkb3Zp
Yy5iYXJyZUBzdC5jb20+Cj4gPiA+ID4KPiA+ID4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIGJ1
c3kgZGV0ZWN0IGZvciBzdG0zMiBzZG1tYyB2YXJpYW50Lgo+ID4gPiA+IFNvbWUgYWRhcHRhdGlv
bnMgYXJlIHJlcXVpcmVkOgo+ID4gPiA+IC1DbGVhciBidXN5IHN0YXR1cyBiaXQgaWYgYnVzeV9k
ZXRlY3RfZmxhZyBhbmQgYnVzeV9kZXRlY3RfbWFzayBhcmUKPiA+ID4gPiAgIGRpZmZlcmVudC4K
PiA+ID4gPiAtQWRkIGhhcmR3YXJlIGJ1c3kgdGltZW91dCB3aXRoIE1NQ0lEQVRBVElNRVIgcmVn
aXN0ZXIuCj4gPiA+ID4KPiA+ID4gPiBWMzoKPiA+ID4gPiAtcmViYXNlIG9uIGxhdGVzdCBtbWMg
bmV4dAo+ID4gPiA+IC1yZXBsYWNlIHJlLXJlYWQgYnkgc3RhdHVzIHBhcmFtZXRlci4KPiA+ID4g
Pgo+ID4gPiA+IFYyOgo+ID4gPiA+IC1tbWNpX2NtZF9pcnEgY2xlYW51cCBpbiBzZXBhcmF0ZSBw
YXRjaC4KPiA+ID4gPiAtc2ltcGxpZnkgdGhlIGJ1c3lfZGV0ZWN0X2ZsYWcgZXhjbHVkZQo+ID4g
PiA+IC1yZXBsYWNlIHNkbW1jIHNwZWNpZmljIGNvbW1lbnQgaW4KPiA+ID4gPiAibW1jOiBtbWNp
OiBhdm9pZCBmYWtlIGJ1c3kgcG9sbGluZyBpbiBtbWNpX2lycSIKPiA+ID4gPiB0byBmb2N1cyBv
biBjb21tb24gYmVoYXZpb3IKPiA+ID4gPgo+ID4gPiA+IEx1ZG92aWMgQmFycmUgKDMpOgo+ID4g
PiA+ICAgIG1tYzogbW1jaTogZml4IHJlYWQgc3RhdHVzIGZvciBidXN5IGRldGVjdAo+ID4gPiA+
ICAgIG1tYzogbW1jaTogYWRkIGhhcmR3YXJlIGJ1c3kgdGltZW91dCBmZWF0dXJlCj4gPiA+ID4g
ICAgbW1jOiBtbWNpOiBhZGQgYnVzeSBkZXRlY3QgZm9yIHN0bTMyIHNkbW1jIHZhcmlhbnQKPiA+
ID4gPgo+ID4gPiA+ICAgZHJpdmVycy9tbWMvaG9zdC9tbWNpLmMgfCA0OSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gPiA+ID4gICBkcml2ZXJzL21t
Yy9ob3N0L21tY2kuaCB8ICAzICsrKwo+ID4gPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4gPiA+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
