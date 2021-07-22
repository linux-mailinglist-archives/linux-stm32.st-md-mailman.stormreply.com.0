Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 651D23D1EB0
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jul 2021 09:10:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15614C5A4C0;
	Thu, 22 Jul 2021 07:10:50 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6F0AC597BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 07:10:48 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id y6so4445150ilj.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 00:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9R4GbaLb7x9qYxl2DeK7+TAwKctElQJWbiwEkX5Kzhk=;
 b=drEckRBoqNpLV7KnpEQDsBNrKsL1z88qdiMBOWSN+inGx/IgPK3kZh7HLjL9eQIZCf
 gcWfT3C1MXhCkjax7snHv0jZb9oMnWW6KhFukvrSe0qSYniu1DeGbaBadXCECKfexHJx
 cwbDJA8SXdVqOSmAuNuW+1QE23ZLEJcaOc8FT/JGdyOMZvXV82BH67J4Td+pquObDxAc
 TR6wY660uZ0NHlZZgMQKG07iOZgqu8oi/t8RKbcKnKOpeL7XaB029Hx4zZQ0+44UsYgF
 aUdqhrlTqEeZLrnvU87iwYWINJwFzSrAS9cyj5M1NHUvmWKZEbgB0qDSZJJYNLi6Ea09
 +eBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9R4GbaLb7x9qYxl2DeK7+TAwKctElQJWbiwEkX5Kzhk=;
 b=q1ICydW+qFXShUowXG1oPa1241MkGPPNcvFSYLdrL1NQOzoAg5SRMxf8OIilj5dNvk
 ZOwpSGix1qyInLrhyAHZ/HO1ZtGOdp321boRrCnvvjj+qLECvcTIRJEDJXheukPIjlr+
 3uuNvIe1nu63Qs5OxJYod6CyqCdd1PK/L5/M9ZASaRU7z+GBP229qLHyDN++HhWxj1Dd
 BSy+5TqstmEwSjlnhvNfgd1A1h7cY6lCq2fj2sjxHbe8F77TE8ytm7iRoRpy7d/qmXP0
 /iy9cUQCwjIHVKSHdl0mXqAVtXpM1HuOO/ln6GyeIJqDdNHepJV3pSyfDLBbRsFRaGfF
 kPGQ==
X-Gm-Message-State: AOAM532PHnEDvGSXR9HqALBNKHvkkQaoQlvGnTil+1/rulB1Qqhay148
 LpZBetU5kHjvWLkcvSvzXclm19mP+UC09/fFCk8=
X-Google-Smtp-Source: ABdhPJwTjhAu6xTfG+QL54ZvXhMm9gqmN62x3piyRaO10skkcefHcASreEjbQs9lCGvv4P+2iukaRJZFPQezISZZX9g=
X-Received: by 2002:a92:ddcf:: with SMTP id d15mr13786756ilr.184.1626937847507; 
 Thu, 22 Jul 2021 00:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
 <1626853288-31223-4-git-send-email-dillon.minfei@gmail.com>
 <8e091b9c-764d-d410-559e-3c5e25de2a3c@tronnes.org>
 <CAL9mu0K2yLsG0MXOd4ke8N8zn7311CJ54hL-JcbocJOK+H7W9A@mail.gmail.com>
 <1e4743b0-250f-975a-f83d-5d000c6496e3@tronnes.org>
In-Reply-To: <1e4743b0-250f-975a-f83d-5d000c6496e3@tronnes.org>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Thu, 22 Jul 2021 15:10:11 +0800
Message-ID: <CAL9mu0J-1=bSG6bXqwHOefYtgK5mn7vwcN4tnf82z0crdERCfQ@mail.gmail.com>
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] drm/panel: Add ilitek ili9341
	panel driver
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

SGkgTm9yYWxmLAoKT24gVGh1LCAyMiBKdWwgMjAyMSBhdCAxNTowMywgTm9yYWxmIFRyw7hubmVz
IDxub3JhbGZAdHJvbm5lcy5vcmc+IHdyb3RlOgo+Cj4KPgo+IERlbiAyMi4wNy4yMDIxIDA0LjA3
LCBza3JldiBEaWxsb24gTWluOgo+ID4gSGkgTm9yYWxmCj4gPgo+ID4gVGhhbmtzIGZvciB5b3Vy
IHRpbWUgdG8gcmV2aWV3IG15IHBhdGNoLgo+ID4KPiA+IE9uIFRodSwgMjIgSnVsIDIwMjEgYXQg
MDE6NDIsIE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPiB3cm90ZToKPiA+Pgo+
ID4+Cj4gPj4KPiA+PiBEZW4gMjEuMDcuMjAyMSAwOS40MSwgc2tyZXYgZGlsbG9uLm1pbmZlaUBn
bWFpbC5jb206Cj4gPj4+IEZyb206IERpbGxvbiBNaW4gPGRpbGxvbi5taW5mZWlAZ21haWwuY29t
Pgo+ID4+Pgo+ID4+PiBUaGlzIGRyaXZlciBjb21iaW5lIHRpbnkvaWxpOTM0MS5jIG1pcGlfZGJp
X2ludGVyZmFjZSBkcml2ZXIKPiA+Pj4gd2l0aCBtaXBpX2RwaV9pbnRlcmZhY2UgZHJpdmVyLCBj
YW4gc3VwcG9ydCBpbGk5MzQxIHdpdGggc2VyaWFsCj4gPj4+IG1vZGUgb3IgcGFyYWxsZWwgcmdi
IGludGVyZmFjZSBtb2RlIGJ5IHJlZ2lzdGVyIGNvbmZpZ3VyYXRpb24uCj4gPj4+Cj4gPj4+IENj
OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gPj4+IFNpZ25lZC1v
ZmYtYnk6IERpbGxvbiBNaW4gPGRpbGxvbi5taW5mZWlAZ21haWwuY29tPgo+ID4+PiAtLS0KPiA+
Pgo+ID4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgaWxpOTM0MV9vZl9tYXRj
aFtdID0gewo+ID4+PiArICAgICB7Cj4gPj4+ICsgICAgICAgICAgICAgLmNvbXBhdGlibGUgPSAi
c3Qsc2YtdGMyNDB0LTkzNzAtdCIsCj4gPj4+ICsgICAgICAgICAgICAgLmRhdGEgPSAmaWxpOTM0
MV9zdG0zMmY0MjlfZGlzY29fZGF0YSwKPiA+Pj4gKyAgICAgfSwKPiA+Pj4gKyAgICAgewo+ID4+
PiArICAgICAgICAgICAgIC8qIHBvcnRpbmcgZnJvbSB0aW55L2lsaTkzNDEuYwo+ID4+PiArICAg
ICAgICAgICAgICAqIGZvciBvcmlnaW5hbCBtaXBpIGRiaSBjb21waXRhYmxlCj4gPj4+ICsgICAg
ICAgICAgICAgICovCj4gPj4+ICsgICAgICAgICAgICAgLmNvbXBhdGlibGUgPSAiYWRhZnJ1aXQs
eXgyNDBxdjI5IiwKPiA+Pgo+ID4+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzLCBub3cgdGhlcmUg
d2lsbCBiZSAyIGRyaXZlcnMgdGhhdCBzdXBwb3J0IHRoZQo+ID4+IHNhbWUgZGlzcGxheT8KPiA+
Cj4gPiBUaGVyZSBpcyBubyByZWFzb24gdG8gY3JlYXRlIHR3byBkcml2ZXJzIHRvIHN1cHBvcnQg
dGhlIHNhbWUgZGlzcGxheS4KPiA+Cj4gPiBUbyBzdXBwb3J0IG9ubHktZGJpIGFuZCBkYmkrZHBp
IHBhbmVsIGF0IGRybS9wYW5lbCBvciBkcm0vdGlueSBib3RoCj4gPiBmaW5lIHdpdGggbWUuCj4g
Pgo+ID4+Cj4gPj4gQUZBSUNUIGRybS90aW55L2lsaTkzNDEuYyBpcyBqdXN0IGNvcGllZCBpbnRv
IHRoaXMgZHJpdmVyLCBpcyB0aGUgcGxhbgo+ID4+IHRvIHJlbW92ZSB0aGUgdGlueS8gZHJpdmVy
PyBJZiBzbyBJIGNvdWxkbid0IHNlZSB0aGlzIG1lbnRpb25lZCBhbnl3aGVyZS4KPiA+Cj4gPiBZ
ZXMsIEknZCBsaWtlIHRvIG1lcmdlIHRoZSBjb2RlIGZyb20gZHJtL3RpbnkvaWxpOTM0MS5jIHRv
IHRoaXMgZHJpdmVyCj4gPiAodG8gbWFrZSBhIHNpbmdsZSBkcml2ZXIgdG8gc3VwcG9ydCBkaWZm
ZXJlbnQgYnVzKS4KPiA+Cj4gPiBJIGhhdmUgdHdvIHB1cnBvc2UgdG8gZXh0ZW5kIHRoZSBmZWF0
dXJlIGRybS90aW55L2lsaTkzNDEuYwo+ID4KPiA+IC0ga2VlcCBjb21wYXRpYmxlID0gImFkYWZy
dWl0LHl4MjQwcXYyOSIsIGFkZCBidXMgbW9kZSBkdHMgYmluZGluZ3MgKHBhbmVsX2J1cykKPiA+
ICAgdG8gZGVmaW5lIHRoZSBpbnRlcmZhY2Ugd2hpY2ggaG9zdCB3YW50cyB0byB1c2UuIHN1Y2gg
YXMKPiA+IHBhbmVsX2J1cz0iZGJpIiBvciAicmdiIgo+ID4gICBvciAiaTgwIiBmb3IgdGhpcyBj
YXNlLCBpIHdpbGwgYWRkIGRwaSBjb2RlIHRvIGRybS90aW55L2lsaTkzNDEuYy4KPiA+Cj4gPiAt
IG1lcmdlIHRpbnkvaWxpOTM0MS5jIHRvIHRoaXMgZHJpdmVyLHJlbW92ZSBkcm0vdGlueS9pbGk5
MzQxLmMsIGFkZAo+ID4gbmV3IGR0cyBjb21wYXRpYmxlCj4gPiAgIHN0cmluZyB0byBzdXBwb3J0
IG90aGVyIGludGVyZmFjZXMuIGp1c3QgbGlrZSB3aGF0IGknbSBkb2luZyBub3cuCj4gPgo+ID4g
SSBoYXZlIG5vIGlkZWEgYWJvdXQgeW91ciBwbGFuIG9uIGRybS90aW55IGRyaXZlcnMsIGFjdHVh
bGx5IHNvbWUgb2YKPiA+IHRoZXNlIHBhbmVscyB1bmRlcgo+ID4gdGhlIGRpbnkgZm9sZGVyIGNh
biBzdXBwb3J0IGJvdGggZGJpIGFuZCBkYmkrZHBpIChtdWNoIGZhc3RlciwgbmVlZAo+ID4gbW9y
ZSBwaW5zKS4gbm8KPiA+IGRvdWJ0IHRoZSByZXF1aXJlbWVudCB0byBzdXBwb3J0IGRwaSBpcyBh
bHdheXMgdGhlcmUuCj4gPgo+ID4gV2hhdCBpcyB5b3VyIHByZWZlcmVuY2U/Cj4gPgo+Cj4gSSBo
YXZlIG5vIHBsYW5zIGZvciB0aW55LywgaXQncyBqdXN0IGEgcGxhY2UgdG8gcHV0IHRpbnkgRFJN
IGRyaXZlcnMgb2YKPiBhbGwgc29ydHMuCgpUaGFua3MgZm9yIGNsYXJpZnlpbmcuCgo+Cj4gV2hl
dGhlciBvciBub3QgdG8gaGF2ZSAiZnVsbCIgRFJNIGRyaXZlcnMgaW4gcGFuZWwvIGlzIHVwIHRv
IFNhbSBhbmQKPiBMYXVyZW50IEkgZ3Vlc3MsIGN1cnJlbnRseSB0aGVyZSdzIG9ubHkgZHJtX3Bh
bmVsIGRyaXZlcnMgaW4gdGhlcmUuIEkKPiBoYXZlIG5vIG9iamVjdGlvbnMgdG8gZG9pbmcgdGhh
dCB0aG91Z2guCj4KPiBJIGp1c3Qgd2FudGVkIHRvIG1ha2Ugc3VyZSB3ZSBkb24ndCBoYXZlIDIg
ZHJpdmVycyBmb3IgdGhlIHNhbWUgZGlzcGxheS4KClN1cmUsIGFncmVlIHdpdGggeW91LCBzb3Jy
eSBmb3Igbm90IG1lbnRpb25pbmcgaXQgaW4gdGhlIGNvdmVyIGxldHRlci4KSSdtIHdhaXRpbmcg
Zm9yIFNhbSBhbmQgTGF1cmVudCdzIGZlZWRiYWNrLCB0aGVuIHN1Ym1pdCB2MyBhZnRlciB0aGF0
LgoKQmVzdCByZWdhcmRzLgpEaWxsb24KCj4KPiBOb3JhbGYuCj4KPiA+IFRoYW5rcyAmIFJlZ2Fy
ZHMKPiA+IERpbGxvbgo+ID4KPiA+Pgo+ID4+IE5vcmFsZi4KPiA+Pgo+ID4+PiArICAgICAgICAg
ICAgIC5kYXRhID0gTlVMTCwKPiA+Pj4gKyAgICAgfSwKPiA+Pj4gK307Cj4gPj4+ICtNT0RVTEVf
REVWSUNFX1RBQkxFKG9mLCBpbGk5MzQxX29mX21hdGNoKTsKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
