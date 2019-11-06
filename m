Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DADF22B5
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Nov 2019 00:35:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71633C36B0B;
	Wed,  6 Nov 2019 23:35:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D9B1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 23:35:34 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12D542187F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 23:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573083333;
 bh=acYkWuh1lxFHEeKgrIYJ5Yd9kylQa/fKIKHitMgaldM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=y8CyCGFD6r8Yx6zd8knD2LQGyvkkPbvxiV5bsc2HYW4xX9s6Q2f6KRkfGPv+YyaXp
 FL+lDZrxyuN6rJfajkygkBM5zlGJFoIlw3psHHScwjPnUh1cD59AsZ4CvJsvDxyGi6
 lBe3FoyN2A149QlMILkLty2lw6pSRaSAMVjATGlg=
Received: by mail-qt1-f174.google.com with SMTP id o11so280688qtr.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Nov 2019 15:35:33 -0800 (PST)
X-Gm-Message-State: APjAAAU0pqU2WAwwzwa6dqtmCIXQXEh18hvradEXLFDoXvvaFDEBJ0tc
 KOibK1uGi3w6sbtI9drYy424arNEZcAcC4ZUdg==
X-Google-Smtp-Source: APXvYqwNuYTsv7zmDJbGaopPUrmmqNxKU8Cj804+ATwfmxxu9034v+A6BQ+Qmo8CGUNIZgx7qrGV1CetGwfhUmZEvmQ=
X-Received: by 2002:ac8:7612:: with SMTP id t18mr653216qtq.143.1573083332254; 
 Wed, 06 Nov 2019 15:35:32 -0800 (PST)
MIME-Version: 1.0
References: <20191031123040.26316-1-benjamin.gaignard@st.com>
 <20191031123040.26316-3-benjamin.gaignard@st.com>
 <20191103110841.3ad3ecfb@archlinux>
 <CA+M3ks5sZ6wwV-V+HCLC8OLdeLqrxK0Ga-pXTsdktQErbMOk4g@mail.gmail.com>
 <20191106040657.GA5294@bogus> <d0196570-9140-c775-742c-89092056e651@st.com>
In-Reply-To: <d0196570-9140-c775-742c-89092056e651@st.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 Nov 2019 17:35:20 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+b_e1MbXx6918+iKfrTgqoozxOZ2rEYgogChZDWR_+iQ@mail.gmail.com>
Message-ID: <CAL_Jsq+b_e1MbXx6918+iKfrTgqoozxOZ2rEYgogChZDWR_+iQ@mail.gmail.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 Fabrice GASNIER <fabrice.gasnier@st.com>, Lee Jones <lee.jones@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 2/4] dt-bindings: iio: timer: Convert
 stm32 IIO trigger bindings to json-schema
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

T24gV2VkLCBOb3YgNiwgMjAxOSBhdCAxOjUyIFBNIEJlbmphbWluIEdBSUdOQVJECjxiZW5qYW1p
bi5nYWlnbmFyZEBzdC5jb20+IHdyb3RlOgo+Cj4KPiBPbiAxMS82LzE5IDU6MDYgQU0sIFJvYiBI
ZXJyaW5nIHdyb3RlOgo+ID4gT24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMTE6MDc6MTZBTSArMDEw
MCwgQmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6Cj4gPj4gTGUgZGltLiAzIG5vdi4gMjAxOSDDoCAx
MjowOCwgSm9uYXRoYW4gQ2FtZXJvbiA8amljMjNAa2VybmVsLm9yZz4gYSDDqWNyaXQgOgo+ID4+
PiBPbiBUaHUsIDMxIE9jdCAyMDE5IDEzOjMwOjM4ICswMTAwCj4gPj4+IEJlbmphbWluIEdhaWdu
YXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+IHdyb3RlOgo+ID4+Pgo+ID4+Pj4gQ29udmVy
dCB0aGUgU1RNMzIgSUlPIHRyaWdnZXIgYmluZGluZyB0byBEVCBzY2hlbWEgZm9ybWF0IHVzaW5n
IGpzb24tc2NoZW1hCj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR2FpZ25h
cmQgPGJlbmphbWluLmdhaWduYXJkQHN0LmNvbT4KPiA+Pj4gSSdtIGZhciBmcm9tIGdyZWF0IG9u
IHRoZXNlIGFzIHN0aWxsIGhhdmVuJ3QgdGFrZW4gdGhlIHRpbWUgSSBzaG91bGQgdG8gbGVhcm4K
PiA+Pj4gdGhlIHlhbWwgc3ludGF4IHByb3Blcmx5LiAgQSBmZXcgY29tbWVudHMgaW5saW5lIGhv
d2V2ZXIgYmFzZWQgbW9zdGx5IG9uIHRoaXMKPiA+Pj4gZG9lc24ndCBxdWl0ZSBsb29rIGxpa2Ug
b3RoZXIgb25lcyBJJ3ZlIHNlZW4gcmVjZW50bHkuCj4gPj4+Cj4gPj4+IFRoYW5rcywKPiA+Pj4K
PiA+Pj4gSm9uYXRoYW4KPiA+Pj4KPiA+Pj4+IC0tLQo+ID4+Pj4gICAuLi4vYmluZGluZ3MvaWlv
L3RpbWVyL3N0LHN0bTMyLXRpbWVyLXRyaWdnZXIueWFtbCB8IDQ0ICsrKysrKysrKysrKysrKysr
KysrKysKPiA+Pj4+ICAgLi4uL2JpbmRpbmdzL2lpby90aW1lci9zdG0zMi10aW1lci10cmlnZ2Vy
LnR4dCAgICAgfCAyNSAtLS0tLS0tLS0tLS0KPiA+Pj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0NCBp
bnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKPiA+Pj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vdGltZXIvc3Qsc3RtMzItdGlt
ZXItdHJpZ2dlci55YW1sCj4gPj4+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaWlvL3RpbWVyL3N0bTMyLXRpbWVyLXRyaWdnZXIudHh0Cj4g
Pj4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9paW8vdGltZXIvc3Qsc3RtMzItdGltZXItdHJpZ2dlci55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2lpby90aW1lci9zdCxzdG0zMi10aW1lci10cmlnZ2VyLnlhbWwK
PiA+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjFj
OGM4YjU1ZThjZAo+ID4+Pj4gLS0tIC9kZXYvbnVsbAo+ID4+Pj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby90aW1lci9zdCxzdG0zMi10aW1lci10cmlnZ2VyLnlh
bWwKPiA+Pj4+IEBAIC0wLDAgKzEsNDQgQEAKPiA+Pj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+Pj4+ICslWUFNTCAxLjIKPiA+
Pj4+ICstLS0KPiA+Pj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2lpby90
aW1lci9zdCxzdG0zMi10aW1lci10cmlnZ2VyLnlhbWwjCj4gPj4+PiArJHNjaGVtYTogaHR0cDov
L2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPj4+PiArCj4gPj4+PiAr
dGl0bGU6IFNUTWljcm9lbGVjdHJvbmljcyBTVE0zMiBUaW1lcnMgSUlPIHRpbWVyIGJpbmRpbmdz
Cj4gPj4+PiArCj4gPj4+PiArbWFpbnRhaW5lcnM6Cj4gPj4+PiArICAtIEJlbmphbWluIEdhaWdu
YXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+Cj4gPj4+PiArICAtIEZhYnJpY2UgR2Fzbmll
ciA8ZmFicmljZS5nYXNuaWVyQHN0LmNvbT4KPiA+Pj4+ICsKPiA+Pj4+ICtwcm9wZXJ0aWVzOgo+
ID4+Pj4gKyAgJG5vZGVtYW5lOgo+ID4+PiBub2RlbmFtZT8KPiA+PiBUaGF0IHdpbGwgYmUgaW4g
djIKPiA+IE5vLCAkbm9kZW5hbWUgaXMgY29ycmVjdC4gVGhlICckJyBzaWduaWZpZXMgc29tZXRo
aW5nIHdlIGdlbmVyYXRlIGFuZAo+ID4gYWRkIGluLiBJT1csIG5vdCBhIHJlYWwgcHJvcGVydHku
IEkgZ3Vlc3Mgd2UgY291bGQgaGF2ZSB1c2VkICduYW1lJyBoZXJlCj4gPiBhbmQgc3R1Y2sgd2l0
aCB0cmFkaXRpb25hbCBPcGVuRmlybXdhcmUuCj4gbGV0J3MgZ28gZm9yICRuYW1lCgpObywgJG5v
ZGVuYW1lIGlzIGNvcnJlY3QuIFlvdSBkb24ndCBoYXZlIGEgY2hvaWNlLiBUaGF0IGlzIHdoYXQg
dGhlCnRvb2xpbmcgZ2VuZXJhdGVzLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
