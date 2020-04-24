Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AAE1B7279
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 12:50:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 793D5C36B0B;
	Fri, 24 Apr 2020 10:50:59 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7CBCC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 10:50:56 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u127so10184378wmg.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 03:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=yf9tP3sNXUsAB/rOddBDtkpZustuUZCD7ZROOWh0ox4=;
 b=VmBbirVEjOgVcz1iLrCDuO5VLXN1951W8re/zO0nzgFYuwEMxoMSE1+bJi8VD1ugrt
 k100zGpG94719MgmRICqnQneLX0yv58hh5Eu4UMybV0Ju088At0DHXnNLHBrNZ3wd4ir
 ZD7sb8FxKGceNRllh8lWxRQJM921TSzHLF/sh9jCuOzooAWoNv9Y8c0eNgG9iXPQJcHo
 UI6hKLFOmog5ICyxUJVBFWjTf1rn4Ep1qEVB2jzkZbhzpnSyDGeM4ygUy/LNdLZriX7H
 9r9BKf31beIDyCBTLhxqlxcPdXdY26KNmj2nRe+DueEx2j8TvXDVpgjU/HC402cddZWP
 tV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yf9tP3sNXUsAB/rOddBDtkpZustuUZCD7ZROOWh0ox4=;
 b=BsN6CWM4T1wJxFZ9m16UBvwNvvmWrmzEBfImQemD4tjkkFxJW5lzJNCRDrZVB+U2pG
 2BS6fwRRQzIeo3YURteFc41nvsyQ21UM11e/urS+zDsgKzOjrXx7o7jxY5v8Ox4gADEF
 wdpHJ43P44En3wvFGWVZKkVkuwzQ8Yfk1dQrZaEfHR9uOyvEAVcpqiLtFXBFCbNwaavA
 Al0I83qNX/OZyMZhm+cbUj9Xzb9GgaMsq6wlO51+uSzQB/6TSgdNmM9Vd6aERAMzwwef
 qf5pW8IxeMs0Eq7qpBATqNnjL/qe1fMzqzhIZlzNjhV1CebJKslzb19DF1aKHRsSspgY
 iABA==
X-Gm-Message-State: AGi0PuYxvv41wSG4UJHFn2lhI2HpOEfGFhLA3VY4pCI4IdaOG74LCZSJ
 Ysq0nMF0U1pFsJT1s/x/h3d/jg==
X-Google-Smtp-Source: APiQypIA21ZhRcvVCjZ27PG/4HY/Hpz6nTlXLW+I8YNTy6MMWXH+2KzYqqh4CqqJzSqriZ3BH6X/kw==
X-Received: by 2002:a1c:7d90:: with SMTP id
 y138mr10044348wmc.121.1587725455891; 
 Fri, 24 Apr 2020 03:50:55 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id o18sm7595925wrp.23.2020.04.24.03.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 03:50:55 -0700 (PDT)
Date: Fri, 24 Apr 2020 11:50:53 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200424105053.GC8414@dell>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-3-git-send-email-christophe.kerello@st.com>
 <20200424074517.GN3612@dell>
 <8b625f1c-9ded-c07a-a20e-8cd44c1ca46d@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b625f1c-9ded-c07a-a20e-8cd44c1ca46d@denx.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 tony@atomide.com, richard@nod.at, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 02/12] mfd: stm32-fmc2: add STM32 FMC2
 controller driver
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

T24gRnJpLCAyNCBBcHIgMjAyMCwgTWFyZWsgVmFzdXQgd3JvdGU6Cgo+IE9uIDQvMjQvMjAgOTo0
NSBBTSwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gV2VkLCAxNSBBcHIgMjAyMCwgQ2hyaXN0b3Bo
ZSBLZXJlbGxvIHdyb3RlOgo+ID4gCj4gPj4gVGhlIGRyaXZlciBhZGRzIHRoZSBzdXBwb3J0IGZv
ciB0aGUgU1RNaWNyb2VsZWN0cm9uaWNzIEZNQzIgY29udHJvbGxlcgo+ID4+IGZvdW5kIG9uIFNU
TTMyTVAgU09Dcy4KPiA+Pgo+ID4+IFRoZSBGTUMyIGZ1bmN0aW9uYWwgYmxvY2sgbWFrZXMgdGhl
IGludGVyZmFjZSB3aXRoOiBzeW5jaHJvbm91cyBhbmQKPiA+PiBhc3luY2hyb25vdXMgc3RhdGlj
IG1lbW9yaWVzIChzdWNoIGFzIFBTTk9SLCBQU1JBTSBvciBvdGhlcgo+ID4+IG1lbW9yeS1tYXBw
ZWQgcGVyaXBoZXJhbHMpIGFuZCBOQU5EIGZsYXNoIG1lbW9yaWVzLgo+ID4+Cj4gPj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPgo+
ID4+IC0tLQo+ID4+IENoYW5nZXMgaW4gdjI6Cj4gPj4gIC0gcmVtb3ZlIG9wcyBmcm9tIHN0bTMy
X2ZtYzIgc3RydWN0dXJlCj4gPj4gIC0gYWRkIDIgQVBJcyB0byBtYW5hZ2UgRk1DMiBlbmFibGUv
ZGlzYWJsZQo+ID4+ICAtIGFkZCAyIEFQSXMgdG8gbWFuYWdlIEZNQzIgTldBSVQgc2hhcmVkIHNp
Z25hbAo+ID4+Cj4gPj4gIGRyaXZlcnMvbWZkL0tjb25maWcgICAgICAgICAgICB8ICAxMiArKysK
PiA+PiAgZHJpdmVycy9tZmQvTWFrZWZpbGUgICAgICAgICAgIHwgICAxICsKPiA+PiAgZHJpdmVy
cy9tZmQvc3RtMzItZm1jMi5jICAgICAgIHwgMTM2ICsrKysrKysrKysrKysrKysrKysrKysrKysK
PiA+PiAgaW5jbHVkZS9saW51eC9tZmQvc3RtMzItZm1jMi5oIHwgMjI1ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPj4gIDQgZmlsZXMgY2hhbmdlZCwgMzc0IGlu
c2VydGlvbnMoKykKPiA+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWZkL3N0bTMyLWZt
YzIuYwo+ID4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQvc3RtMzItZm1j
Mi5oCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvS2NvbmZpZyBiL2RyaXZlcnMv
bWZkL0tjb25maWcKPiA+PiBpbmRleCAyYjIwMzI5Li41MjYwNTgyIDEwMDY0NAo+ID4+IC0tLSBh
L2RyaXZlcnMvbWZkL0tjb25maWcKPiA+PiArKysgYi9kcml2ZXJzL21mZC9LY29uZmlnCj4gPj4g
QEAgLTE5MjIsNiArMTkyMiwxOCBAQCBjb25maWcgTUZEX1JPSE1fQkQ3MTgyOAo+ID4+ICAJICBB
bHNvIGluY2x1ZGVkIGlzIGEgQ291bG9tYiBjb3VudGVyLCBhIHJlYWwtdGltZSBjbG9jayAoUlRD
KSwgYW5kCj4gPj4gIAkgIGEgMzIuNzY4IGtIeiBjbG9jayBnYXRlLgo+ID4+ICAKPiA+PiArY29u
ZmlnIE1GRF9TVE0zMl9GTUMyCj4gPj4gKwl0cmlzdGF0ZSAiU3VwcG9ydCBmb3IgRk1DMiBjb250
cm9sbGVycyBvbiBTVE0zMk1QIFNvQ3MiCj4gPj4gKwlkZXBlbmRzIG9uIE1BQ0hfU1RNMzJNUDE1
NyB8fCBDT01QSUxFX1RFU1QKPiA+PiArCXNlbGVjdCBNRkRfQ09SRQo+ID4+ICsJc2VsZWN0IFJF
R01BUAo+ID4+ICsJc2VsZWN0IFJFR01BUF9NTUlPCj4gPj4gKwloZWxwCj4gPj4gKwkgIFNlbGVj
dCB0aGlzIG9wdGlvbiB0byBlbmFibGUgU1RNMzIgRk1DMiBkcml2ZXIgdXNlZCBmb3IgRk1DMiBF
eHRlcm5hbAo+ID4+ICsJICBCdXMgSW50ZXJmYWNlIGNvbnRyb2xsZXIgYW5kIEZNQzIgTkFORCBm
bGFzaCBjb250cm9sbGVyLiBUaGlzIGRyaXZlcgo+ID4+ICsJICBwcm92aWRlcyBjb3JlIHN1cHBv
cnQgZm9yIHRoZSBTVE0zMiBGTUMyIGNvbnRyb2xsZXJzLCBpbiBvcmRlciB0byB1c2UKPiA+PiAr
CSAgdGhlIGFjdHVhbCBmdW5jdGlvbmFsaXR5IG9mIHRoZSBkZXZpY2Ugb3RoZXIgZHJpdmVycyBt
dXN0IGJlIGVuYWJsZWQuCj4gPiAKPiA+IE5vdCBzdXJlIGhvdyBtYW55IHRpbWVzIEkgaGF2ZSB0
byBzYXkgdGhpcyBiZWZvcmUgcGVvcGxlIHN0b3AKPiA+IGF0dGVtcHRpbmcgdG8gcGFzcyB0aGVz
ZSBraW5kcyBvZiByZWxhdGlvbnNoaXBzIG9mZiBhcyBNRkRzOgo+ID4gCj4gPiBBIG1lbW9yeSBk
ZXZpY2UgYW5kIGl0cyBidXMgaXMgbm90IGFuIE1GRC4gIEluIGEgc2ltaWxhciB2YWluIHRvIHRo
ZQo+ID4gdGhvdXNhbmRzIG9mIFVTQiwgSTJDLCBTUEksIFBDSSBhbmQgdGhlIGxpa2UgZGV2aWNl
cyB0aGF0IGFyZW4ndCBNRkRzCj4gPiBlaXRoZXIuCj4gPiAKPiA+IFBsZWFzZSBmaW5kIGFub3Ro
ZXIgd2F5IHRvIGFzc29jaWF0ZSB5b3VyIGRldmljZSB3aXRoIGl0cyBidXMuCj4gCj4gVGhpcyBG
TUMyIGlzIGhvd2V2ZXIgYW4gSVAgd2hpY2ggY2FuIGVpdGhlciBvcGVyYXRlIGV4dGVybmFsIGRl
dmljZXMKPiAobGlrZSBldGhlcm5ldCBjaGlwIG9uIHRoaXMgcGFyYWxsZWwgYnVzKSBvciBleHRl
cm5hbCBmbGFzaGVzIChsaWtlIE5PUgo+IGFuZCBOQU5EIGNoaXBzKS4KCkknbSBzdXJlIHRoYXQg
aXQgKmNhbiouICBBbHRob3VnaCB0aGF0J3Mgbm90IGl0cyBtYWluIHB1cnBvc2UuICBUaGUKY2x1
ZSBpcyBpbiB0aGUgbm9tZW5jbGF0dXJlICgiRmxleGlibGUgKk1lbW9yeSogQ29udHJvbGxlciIp
LiAgTm9yIGlzCml0IGhvdyB0aGUgZGV2aWNlIGlzIGJlaW5nIHVzZWQgaW4gdGhpcyBzdWJtaXNz
aW9uOgoKICAiVGhlIEZNQzIgZnVuY3Rpb25hbCBibG9jayBtYWtlcyB0aGUgaW50ZXJmYWNlIHdp
dGg6IHN5bmNocm9ub3VzIGFuZAogICBhc3luY2hyb25vdXMgc3RhdGljIG1lbW9yaWVzIChzdWNo
IGFzIFBTTk9SLCBQU1JBTSBvciBvdGhlcgogICBtZW1vcnktbWFwcGVkIHBlcmlwaGVyYWxzKSBh
bmQgTkFORCBmbGFzaCBtZW1vcmllcy4iCgpBcyBJIG1lbnRpb25lZCwgdGhpcyBpcyBqdXN0IGFu
b3RoZXIgbWVtb3J5IGRldmljZSBhbmQgaXRzIGJ1cy4KCj4gQ2FuIHlvdSBwcm92aWRlIGEgc3Vn
Z2VzdGlvbiBob3cgdGhpcyBzaG91bGQgYmUgaGFuZGxlZCwgaWYgbm90IGFzIE1GRD8KPiBJdCBz
ZWVtcyB0byBtZSwgdGhhdCB0aGlzIGlzIGEgTXVsdGktRnVuY3Rpb24gRGV2aWNlIC4KClNpbXBs
eSBtb3ZlIGl0IGludG8gdGhlIE1URCBvciBNZW1vcnkgc3Vic3lzdGVtcyBhbmQgc2V0IHVwIHRo
ZQpkZXBlbmRlbmNpZXMgdmlhIEtjb25maWcuCgo+IElmIHRoaXMgZGlzY3Vzc2lvbiBpcyBhIHJl
Y3VycmluZyB0b3BpYywgaXMgdGhlcmUgc29tZSBkb2N1bWVudGF0aW9uCj4gd2hpY2ggZXhwbGFp
bnMgaG93IHN1Y2ggZGV2aWNlcyBzaG91bGQgYmUgaGFuZGxlZCA/CgpOb3QgdGhhdCBJJ20gYXdh
cmUgb2YuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmlj
YWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MK
Rm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
