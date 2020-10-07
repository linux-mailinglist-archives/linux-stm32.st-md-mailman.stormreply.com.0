Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAFD285C53
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Oct 2020 12:04:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 095D4C32EA8;
	Wed,  7 Oct 2020 10:04:04 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD374C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 10:04:01 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13E59212CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 10:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602065040;
 bh=MC7ueB1e/HcDjLEXXXivK15vF7wcTOnOf1wMHSa4/kE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ds3SU5SgxDmoZ7N1/Kf52McZBUfzER2SrS8L2n4JjR0ACDyjy7L04Prh080wMpaKp
 bDYfiyD8ng6KPUrjG71g1NZeP24WcyQd5f/gqjL4xli+LhE2LIyyuU33w8DopQuUv9
 /ID5dVP3ThcTbG6IBGaHPXX8JNnF+Plo6qX30NCo=
Received: by mail-ej1-f47.google.com with SMTP id md26so2076360ejb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Oct 2020 03:04:00 -0700 (PDT)
X-Gm-Message-State: AOAM5326/sGr2XcEvww5apNOWxxkJGzi4D/MrHHVIih1GNjI3EMqr4mT
 1XVJ+5HP/yBGgRwjTBiC/fsFiPS16wkGquAkLbA=
X-Google-Smtp-Source: ABdhPJwY3H9UKmpfG+K/L30qRXvWtUVJPPFubw7jMRswxHqZLul7Hj2vmJISYNWQOzKFs8ryldZeYG+0fyTXaoIP6Y0=
X-Received: by 2002:a17:906:8401:: with SMTP id
 n1mr2394731ejx.215.1602065038501; 
 Wed, 07 Oct 2020 03:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-3-post@lespocky.de>
 <20201007100213.GA12224@duo.ucw.cz>
In-Reply-To: <20201007100213.GA12224@duo.ucw.cz>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 7 Oct 2020 12:03:46 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdFOgJ=9BgbR2Bq=QHf00SjdScMPOKPF0OAy6TVgJkkRA@mail.gmail.com>
Message-ID: <CAJKOXPdFOgJ=9BgbR2Bq=QHf00SjdScMPOKPF0OAy6TVgJkkRA@mail.gmail.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Rob Herring <robh@kernel.org>, Alexander Dahl <ada@thorsis.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>,
 Alexander Dahl <post@lespocky.de>, Dan Murphy <dmurphy@ti.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v7 02/12] dt-bindings: leds: Convert pwm
	to yaml
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

T24gV2VkLCA3IE9jdCAyMDIwIGF0IDEyOjAyLCBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5jej4g
d3JvdGU6Cj4KPiBPbiBNb24gMjAyMC0xMC0wNSAyMjozNDo0MSwgQWxleGFuZGVyIERhaGwgd3Jv
dGU6Cj4gPiBUaGUgZXhhbXBsZSB3YXMgYWRhcHRlZCBpbiB0aGUgZm9sbG93aW5nIHdheXM6Cj4g
Pgo+ID4gLSBtYWtlIHVzZSBvZiB0aGUgbm93IHN1cHBvcnRlZCAnZnVuY3Rpb24nIGFuZCAnY29s
b3InIHByb3BlcnRpZXMKPiA+IC0gcmVtb3ZlIHB3bSBub2RlcywgdGhvc2UgYXJlIGRvY3VtZW50
ZWQgZWxzZXdoZXJlCj4gPiAtIGFsaWduIG5vZGUgbmFtZXMgdG8gbmV3IGR0IHNjaGVtYSBydWxl
cyBhbmQgZHQgcmVjb21tZW5kYXRpb25zCj4gPgo+ID4gTGljZW5zZSB3YXMgbm90IGV4cGxpY2l0
bHkgc2V0IGJlZm9yZS4gIFRoZSBsaWNlbnNlIHNldCBub3cgaXMKPiA+IHJlY29tbWVuZGVkIGJ5
IERUIHByb2plY3QuCj4gPgo+ID4gU3VnZ2VzdGVkLWJ5OiBKYWNlayBBbmFzemV3c2tpIDxqYWNl
ay5hbmFzemV3c2tpQGdtYWlsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBEYWhs
IDxwb3N0QGxlc3BvY2t5LmRlPgo+ID4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kg
PGtyemtAa2VybmVsLm9yZz4KPiA+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPgo+ID4gQ2M6IFBldGVyIFVqZmFsdXNpIDxwZXRlci51amZhbHVzaUB0aS5jb20+Cj4g
PiBDYzogUnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+Cj4gPiAtLS0KPiA+Cj4g
PiBOb3RlczoKPiA+ICAgICBOT1RFOiBEdWUgdG8gbGljZW5zZSBzZXQvY2hhbmdlIHRoaXMgbmVl
ZHMgQWNrZWQtYnkgb3IgU2lnbmVkLW9mZi1ieSBmcm9tOgo+ID4gICAgICAgKiBQZXRlciBVamZh
bHVzaQo+ID4gICAgICAgKiBSdXNzZWxsIEtpbmcKPgo+IFJ1c3NlbGwgS2luZyBhdXRob3JlZCB0
d28gbGluZXMgb2YgdGhlIGRvY3VtZW50YXRpb24uIEhlIGNhbiBzdGF0ZQo+IG9iamVjdGlvbnMg
bm93LCBidXQgSSdsbCBub3Qgd2FpdCBmb3IgaGlzIEFja2VkLWJ5Lgo+Cj4gPiAgICAgVGhhdCB3
YXMgZGlzY3Vzc2VkIGFscmVhZHkgd2l0aCBQZXRlciAob3JpZ2luYWwgYXV0aG9yKSwgc3RpbGwg
d2FpdGluZwo+ID4gICAgIGZvciBBY2tlZC1ieSB0aG91Z2gg4oCmCj4KPiBJZiBQZXRlciB3YXMg
b2theSB3aXRoIGxpY2Vuc2UgY2hhbmdlLCBJIGd1ZXNzIHdlIGNhbiBjb250aW51ZSBoZXJlLgoK
SGF2aW5nIGFuIEFjayBpcyBub3QgdG9vIG11Y2ggdG8gYXNrIHRvIHJlbGljZW5zZSB0aGUgY29w
eXJpZ2h0cy4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
