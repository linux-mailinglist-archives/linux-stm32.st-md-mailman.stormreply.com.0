Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B9699F043
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 16:55:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A4C2C78030;
	Tue, 15 Oct 2024 14:55:44 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1E6FC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 14:55:36 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2fb58980711so16931931fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 07:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729004136; x=1729608936;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VeHVtin04YMbNdDANnwUhAhwv4ZW4ddx4mf/rqjQ9vo=;
 b=KvyBBifBshZ5WuCoX6eHie5jezGB0Cs0MMPaeyCk6GDwBmNMsGZ8NjY1C+nWovVh6/
 yALOt4a2o0zRsNQpaSqTPEQ+aCwq/7KZ0YCGXaZMs/fJsohxAOlocUB+v2r9LTkz536O
 tKT0V0ebeKJQNx5f+06TJE1ZcwjGIenkYAkZInW01HhBKRUcahz8VC0NAKP1Io7oPzRP
 z5KTGzf3UB20Co3axgAyquY62uOirEgOHBSL8qca+Z2aqZiCzYbjhgn8o8x1GtnlQbS9
 mwrRkDxvoh2nK0+xOj00MtmPgxyyxla5gsnOD4K3TE9FfHNUCCCNDJKC0/y+XSgXhH2D
 qgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729004136; x=1729608936;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VeHVtin04YMbNdDANnwUhAhwv4ZW4ddx4mf/rqjQ9vo=;
 b=hC1EH4vdHcwi6/2QEwbuSr+GvxDb6/fK0YqtSyK+tFi/JqtTzn3ayiEh6+UQkamqKk
 T1+Q3PWZx/9z/acpD4nz0rNOe25uTYU0G1KLWRtFcN/u56P5IEyy0GVDoMJwFvnFqJic
 jItZEiaZd+GuYoEM/7lgQyOsGOjM2w3HLYAgCag7S3pnSynuNqodc2zIFMYkFvDsd2fx
 OHvYt5/CYUeS4bXyjbaCM0Sf5CrAyEmN5hDQ7h2KhDiCoi5kdd+fq2Cci3TDpWMF6eK2
 TYlMALCaeZw7y/fGX4zvrjR+rg0TZB87VYhZJ4JylZ8aAfdM9/l/l1ebpAi/JQtiFZK/
 cjug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyzQY/BNk48iZikcYJQ5B8oTch4FJaNEoPHneJXhoCn4D/F3qhU/w6hK3zKtljNMN2E5vpK1KrBPpitA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxiC1yAdM4aaBNEvehNR8ssdg2imiDufu61c+rh/6XvmSL/Bat5
 1hEK/xz/V+C+5xY2xkJu1kbMkACulxHejOgxS9TeGMByeYraXgI5IueChEy6TxGaHmJDtYRC4Bv
 oZEodtRe0saAT2g9ILfUIXQOGfpOx3BIZN5MZ3g==
X-Google-Smtp-Source: AGHT+IHe1hepoC1K7fGWGmywx94Jj36HM8McPm3iSpQxje7/hhxzz3+rcx6aXTe1IeAO7GFfcjjO1asR7o77DGG5xN0=
X-Received: by 2002:a2e:5109:0:b0:2fb:60d8:744d with SMTP id
 38308e7fff4ca-2fb61b585cemr4274281fa.19.1729004135784; Tue, 15 Oct 2024
 07:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com>
 <Zw5D2aTkkUVOK89g@J2N7QTR9R3>
 <CACRpkdY79nbBoaHe6ijuyJS9dDduNw_sv1J90pz121YDgCvC3Q@mail.gmail.com>
 <Zw51fhCkmCYrTOeV@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEcLD3PWd-9osjo9AOe5Jg-NMOmJ8afB_x7VeboueLoeQ@mail.gmail.com>
 <Zw59x0LVS-kvs9Jv@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEnhHkxywh8TH1i=fmyAR8cXZ8D-rvV43X-N7GpCf2Axw@mail.gmail.com>
In-Reply-To: <CAMj1kXEnhHkxywh8TH1i=fmyAR8cXZ8D-rvV43X-N7GpCf2Axw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Oct 2024 16:55:24 +0200
Message-ID: <CACRpkdbwS8L9_O_paqiW3B3x_-CmrQeYajhO7jBW4-c2+D9gyg@mail.gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] Crash on armv7-a using KASAN
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

T24gVHVlLCBPY3QgMTUsIDIwMjQgYXQgNDo0NeKAr1BNIEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtl
cm5lbC5vcmc+IHdyb3RlOgo+IE9uIFR1ZSwgMTUgT2N0IDIwMjQgYXQgMTY6MzUsIE1hcmsgUnV0
bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgT2N0IDE1
LCAyMDI0IGF0IDA0OjIyOjIwUE0gKzAyMDAsIEFyZCBCaWVzaGV1dmVsIHdyb3RlOgo+ID4gPiBP
biBUdWUsIDE1IE9jdCAyMDI0IGF0IDE2OjAwLCBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBh
cm0uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFR1ZSwgT2N0IDE1LCAyMDI0IGF0IDAz
OjUxOjAyUE0gKzAyMDAsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gPiA+ID4gPiBPbiBUdWUsIE9j
dCAxNSwgMjAyNCBhdCAxMjoyOOKAr1BNIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5j
b20+IHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBNb24sIE9jdCAxNCwgMjAyNCBhdCAwMzoxOTo0OVBN
ICswMjAwLCBDbGVtZW50IExFIEdPRkZJQyB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEkg
dGhpbmsgd2hhdCdzIGhhcHBlbmluZyBoZXJlIGlzIHRoYXQgd2hlbiBzd2l0Y2hpbmcgZnJvbSBw
cmV2IHRvIG5leHQKPiA+ID4gPiA+ID4gaW4gdGhlIHNjaGVkdWxlciwgd2Ugc3dpdGNoIHRvIG5l
eHQncyBtbSBiZWZvcmUgd2UgYWN0dWFsbHkgc3dpdGNoIHRvCj4gPiA+ID4gPiA+IG5leHQncyBy
ZWdpc3RlciBzdGF0ZSwgYW5kIHRoZXJlJ3MgYSB0cmFuc2llbnQgd2luZG93IHdoZXJlIHByZXYg
aXMKPiA+ID4gPiA+ID4gZXhlY3V0ZWQgdXNpbmcgbmV4dCdzIG1tLiBBRkFJQ1Qgd2UgZG9uJ3Qg
bWFwIHByZXYncyBLQVNBTiBzdGFjayBzaGFkb3cKPiA+ID4gPiA+ID4gaW50byBuZXh0J3MgbW0g
YW55d2hlcmUsIGFuZCBzbyBpbmxpbmVkIEtBU0FOX1NUQUNLIGNoZWNrcyByZWN1cnNpdmVseQo+
ID4gPiA+ID4gPiBmYXVsdCBvbiB0aGlzIHVudGlsIHdlIHN3aXRjaCB0byB0aGUgb3ZlcmZsb3cg
c3RhY2suCj4gPgo+ID4gWy4uLl0KPiA+Cj4gPiA+ID4gPiBZZWFoIGl0IGxvb2tzIGxpa2UgYSBz
cG90LW9uIGlkZW50aWZpY2F0aW9uIG9mIHRoZSBwcm9ibGVtLCBJIGNhbiB0cnkgdG8KPiA+ID4g
PiA+IHRoaW5rIGFib3V0IGhvdyB3ZSBjb3VsZCBmaXggdGhpcyBpZiBJIGNhbiByZXByb2R1Y2Ug
aXQsIEkga2VlcCB0cnlpbmcKPiA+ID4gPiA+IHRvIHByb3Zva2UgdGhlIGNyYXNoIDovCj4gPiA+
ID4KPiA+ID4gPiBJdCdzIGEgYml0IGdyb3R0eSAtLSBBRkFJQ1QgeW91J2QgZWl0aGVyIG5lZWQg
dG8gcHJlZmF1bHQgaW4gdGhlCj4gPiA+ID4gc3BlY2lmaWMgcGFydCBvZiB0aGUgdm1hbGxvYyBz
cGFjZSB3aGVuIHN3aXRjaGluZyB0YXNrcywgb3Igd2UnZCBuZWVkIHRvCj4gPiA+ID4gcHJlYWxs
b2NhdGUgYWxsIHRoZSBzaGFyZWQgdm1hbGxvYyB0YWJsZXMgYXQgdGhlIHN0YXJ0IG9mIHRpbWUg
c28gdGhhdAo+ID4gPiA+IHRoZXkncmUgYWx3YXlzIHVwLXRvLWRhdGUuCj4gPiA+ID4KPiA+ID4g
PiBXaGlsZSB3ZSBjb3VsZCBkaXNhYmxlIEtBU0FOX1NUQUNLLCB0aGF0J3Mgb25seSBnb2luZyB0
byBtYXNrIHRoZQo+ID4gPiA+IHByb2JsZW0gdW50aWwgdGhpcyBoYXBwZW5zIGZvciBhbnkgb3Ro
ZXIgdm1hbGxvYyBzaGFkb3cuLi4KPiA+ID4KPiA+ID4gSXMgdGhlIG90aGVyIHZtYWxsb2Mgc2hh
ZG93IG5vdCBjb3ZlcmVkIGJ5IHRoZSBvcmRpbmFyeSBvbi1kZW1hbmQgZmF1bHRpbmc/Cj4gPgo+
ID4gSXQgZGVwZW5kcyBvbiB3aGF0IHRoZSB2bWFsbG9jIG1lbW9yeSBpcyB1c2VkIGZvcjsgaWYg
aXQncyBhbnl0aGluZyBlbHNlCj4gPiB1c2VkIGluIHRoZSBmYXVsdCBoYW5kbGluZyBwYXRoLCB0
aGF0J2xsIGZhdWx0IHJlY3Vyc2l2ZWx5LCBhbmQgaXQncwo+ID4gcG9zc2libGUgdGhhdCdsbCBo
YXBwZW4gaW5kaXJlY3RseSB2aWEgb3RoZXIgaW5zdHJ1bWVudGF0aW9uLgo+ID4KPiA+ID4gV2hl
biBJIGltcGxlbWVudGVkIFZNQVBfU1RBQ0sgZm9yIEFSTSwgSSBhZGRlZCBhbiBleHBsaWNpdCBs
b2FkIGZyb20KPiA+ID4gdGhlIG5ldyBzdGFjayB3aGlsZSBzdGlsbCBydW5uaW5nIGZyb20gdGhl
IG9sZCBvbmUgKGluIF9fc3dpdGNoX3RvKSBzbwo+ID4gPiB0aGF0IHRoZSBvcmRpbmFyeSBmYXVs
dGluZyBjb2RlIGNhbiBkZWFsIHdpdGggaXQuIENvdWxkbid0IHdlIGRvIHRoZQo+ID4gPiBzYW1l
IGZvciB0aGUgdm1hbGxvYyBzaGFkb3cgb2YgdGhlIG5ldyBzdGFjaz8KPiA+Cj4gPiBXZSBjb3Vs
ZCBkbyBzb21ldGhpbmcgc2ltaWxhciwgYnV0IG5vdGUgdGhhdCBpdCdzIGJhY2t3YXJkczogd2Ug
bmVlZCB0bwo+ID4gZW5zdXJlIHRoYXQgdGhlIG9sZC9jdXJyZW50IHN0YWNrIHNoYWRvdyB3aWxs
IGJlIG1hcHBlZCBpbiB0aGUgbmV3IG1tLgo+ID4KPiA+IFNvIHRoZSB1c3VhbCBmYXVsdCBoYW5k
bGluZyBjYW4ndCBoYW5kbGUgdGhhdCBhcy1pcywgYmVjYXVzZSB5b3UgbmVlZCB0bwo+ID4gZmF1
bHQtaW4gcGFnZXMgZm9yIGFuIG1tIHdoaWNoIGlzbid0IHlldCBpbiB1c2UuIFRoYXQgbG9naWMg
Y291bGQgYmUKPiA+IGZhY3RvcmVkIG91dCBhbmQgc2hhcmVkLCB0aG91Z2guCj4gPgo+Cj4gTm90
IHN1cmUgSSBmb2xsb3cgeW91IGhlcmUuIFRoZSBjcmFzaCBpcyBpbiB0aGUga2VybmVsLCBubz8K
Pgo+IFNvIHRoZXJlIGlzIG9ubHkgYSBzaW5nbGUgdm1hbGxvYyBzcGFjZSB3aGVyZSBhbGwgdGhl
IG1hcHBpbmdzIHNob3VsZAo+IHJlc2lkZSwgYnV0IGVhY2ggcHJvY2VzcyBoYXMgaXRzIG93biBj
b3B5IG9mIHRoZSB0b3AgbGV2ZWwgcGFnZSB0YWJsZSwKPiB3aGljaCBuZWVkcyB0byBiZSBzeW5j
ZWQgdXAgd2hlbiBpdCBnb2VzIHN0YWxlLgoKVGhhdCdzIGhvdyBpdCB3b3JrcyBBRkFJQ1QuCgpU
aGUgdm1hbGxvYy9rZXJuZWwgc3BhY2UgaXMgbWFwcGVkIHVzaW5nIHRoZSB2ZXJ5IHNhbWUKYWN0
dWFsIHBhZ2UgdGFibGVzIGluIGFsbCBwZXItcHJvY2VzcyBNTSBjb250ZXh0cywgc28gSSBhbHNv
CnRoaW5rIGl0J3MganVzdCBhIG1hdHRlciBvZiBzeW5jaW5nIHRoZSB0b3AtbGV2ZWwgcGFnZSB0
YWJsZSAoUEdEKSwKc28gSSB3aWxsIHRyeSB0byBkbyB0aGF0LgoKWW91cnMsCkxpbnVzIFdhbGxl
aWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
