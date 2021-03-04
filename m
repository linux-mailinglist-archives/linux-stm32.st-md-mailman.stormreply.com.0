Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFD332CC18
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Mar 2021 06:43:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3F42C57B64;
	Thu,  4 Mar 2021 05:43:10 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29625C56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Mar 2021 05:43:07 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id i8so28451555iog.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 21:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a+Oav42c1HOCCRMgaozVb9Gm8OFZUHNfLbYCK2+bU1w=;
 b=XIG2QobFS1KqxGmKjapup5ZoCxXETYCmErSLolTk7Hcog7ZhSw8W3I6DBZqX3o6+RU
 vxgWHyb+lLuEi5kNWGS/SVduSgZfN9dZqTCXV2BP9pJMKqAX7rcvW9kuPA//Rs2zExy6
 4gb5urKkrKfJSoVjGaWLBO5ZAyEU7ouR4qzjCGMrxryDD+FkonY782t8A5RB4nLxts4N
 OSaXjl7K3fBWxulpbTOJ90Eb621pKfI2Njs6ZWgsf5S49szaZVvlKkkrjmhwn+3cp0Nd
 Y0Z8+uHX53CC6O8PgDRS6KedKX9i+70YOJQCJkHhjChjaFF/jV0V79glvc84PGTxtiRH
 LFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a+Oav42c1HOCCRMgaozVb9Gm8OFZUHNfLbYCK2+bU1w=;
 b=PWx4F9Ii38eycBva+PQlBbvgNOna3uU93wlJQBFUdaFd2R0GR6Ftui3Vv0qbsTuNQG
 jraIfI9/AOtpATgCY8KpTTobWYQWkJX3IDdcT7AKckZqAIa4do7YOJgHIaVq1Fl30PBt
 TXO6tVuiE/VHq6iYMEFO0n0hdgpC4Z9YdwUAFb8oUhzRcRo2CZWg1EESFwmJp0YWeshR
 9txMEMAKJy0FpFqmCi+sTHDubb4lPCOleCxNZkgiYgF+f3WEs0TTu85XiKaEyaRPiGGI
 KzofSqJt2++VnpMCcwN7QUaR2upa5KyzmWdubjJ8uis4mNELHaHadThEy4mct1mVd7sa
 EZPA==
X-Gm-Message-State: AOAM5338XVhCBWrtUuyCAptqvTed3gw7EpWiJlHmbinnjRlHiCXw9FJb
 rytRJe3rnrzsylz77uY9Gv3d52oBtLIaY4yo1k8=
X-Google-Smtp-Source: ABdhPJyOqaEjluM4fpjA/jSUFcjs5N4iiwvyANhz3BbXknSEZx5uEIr07uovuUygdxM372Ed1UJ4CcqqjBDtrX4KOGw=
X-Received: by 2002:a05:6638:e93:: with SMTP id
 p19mr2578361jas.10.1614836586605; 
 Wed, 03 Mar 2021 21:43:06 -0800 (PST)
MIME-Version: 1.0
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
 <1614758717-18223-2-git-send-email-dillon.minfei@gmail.com>
 <5284d390-c03a-4035-df5a-10d6cd60e47b@arm.com>
 <CAL9mu0KUhctbBzmem1ZSgEwf5CebivHOSUr9Q7VTyzib8pW=Cw@mail.gmail.com>
 <5efe3d44-8045-e376-003e-3ccbff54fb23@arm.com>
In-Reply-To: <5efe3d44-8045-e376-003e-3ccbff54fb23@arm.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 4 Mar 2021 13:42:30 +0800
Message-ID: <CAL9mu0JoHqo_wnpNN9ZqRnzzKjhOwEktZ5yPtO8-6WBh51g1BQ@mail.gmail.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux@armlinux.org.uk, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, afzal.mohd.ma@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/8] ARM: ARMv7-M: Fix register restore
	corrupt after svc call
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

T24gV2VkLCBNYXIgMywgMjAyMSBhdCAxMDoxOSBQTSBWbGFkaW1pciBNdXJ6aW4gPHZsYWRpbWly
Lm11cnppbkBhcm0uY29tPiB3cm90ZToKPgo+IE9uIDMvMy8yMSAxOjM1IFBNLCBkaWxsb24gbWlu
IHdyb3RlOgo+ID4gSGkgVmxhZGltaXIsCj4gPgo+ID4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+
ID4KPiA+IE9uIFdlZCwgTWFyIDMsIDIwMjEgYXQgNTo1MiBQTSBWbGFkaW1pciBNdXJ6aW4gPHZs
YWRpbWlyLm11cnppbkBhcm0uY29tPiB3cm90ZToKPiA+Pgo+ID4+IE9uIDMvMy8yMSA4OjA1IEFN
LCBkaWxsb24ubWluZmVpQGdtYWlsLmNvbSB3cm90ZToKPiA+Pj4gRnJvbTogZGlsbG9uIG1pbiA8
ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20+Cj4gPj4+Cj4gPj4+IEZvciBzb21lIGNhc2UsIGtlcm5l
bCBub3QgYm9vdCBieSB1LWJvb3Qoc2luZ2xlIHRocmVhZCksCj4gPj4+IGJ1dCBieSBydG9zICwg
YXMgbW9zdCBydG9zIHVzZSBwZW5kc3YgdG8gZG8gY29udGV4dCBzd2l0Y2guCj4gPj4KPiA+Pgo+
ID4+IEhtbSwgZG9lcyBpdCBtZWFuIHRoYXQgaXQgc3RhcnRzIGtlcm5lbCBmcm9tIHByb2Nlc3Mg
Y29udGV4dD8KPiA+ICAgIFllcywga2VybmVsIG1pZ2h0IGJlIHN0YXJ0ZWQgZnJvbSBwcm9jZXNz
IGNvbnRleHQsIHNpbmNlIHUtYm9vdCBub3QKPiA+IHN3aXRjaCBjb250ZXh0LCBzbyBrZXJuZWwg
YWx3YXlzIHN0YXJ0dXAgdW5kZXIgbXNwLgo+ID4+Cj4gPj4gSSdkIGFzc3VtZSB0aGF0IGl0IGlz
IG5vdCBvbmx5IGtlcm5lbCB3aG8gZXhwZWN0cyBNU1AuIFNvLCB3aGF0Cj4gPj4gaWYgUlRPUyB5
b3UgbWVudGlvbmVkIHdhbnQgdG8gYm9vdCBvdGhlciBSVE9TIChldmVuIGl0c2VsZik/IFdoYXQK
PiA+PiBpZiB5b3UgaGF2ZSBubyBhY2Nlc3MgdG8gdGhlIHNvdXJjZSBjb2RlIGZvciB0aG9zZSBS
VE9TKGVzKSB0bwo+ID4+IHBhdGNoIE1TUC9QU1Agc3dpdGNoPwo+ID4KPiA+IE15IGNhc2UgaXMg
YSBsaXR0bGUgY29tcGxpY2F0ZWQuCj4gPiBzdG0zMmg3IG9ubHkgaGF2ZSAxMjhLYnl0ZXMgaW50
ZXJuYWwgZmxhc2gsIGNhbid0IHN0b3JlIHUtYm9vdC5iaW4gKD4yMDBLKSwKPiA+IHNvLCBzZXQg
YSBib290bG9hZGVyIChydC10aHJlYWQgcnRvcykgdG8gaW50ZXJuYWwgZmxhc2gsIGxvYWQKPiA+
IGxpbnV4L3UtYm9vdCBmcm9tIHNlcmlhbCBwb3J0IHZpYSB5bW9kZW0KPiA+IHN0b3JlIHRvIHFz
cGkgZmxhc2goOE1ieXRlcyksIHRoZW4ganVtcCB0byB1LWJvb3QuCj4gPgo+ID4gcXNwaSBmbGFz
aCBsYXlvdXQ6Cj4gPiAwIC0gNTEySzogICAgdS1ib290Cj4gPiA1MTJLLSA4TSA6IGtlcm5lbCh4
aXApCj4gPgo+ID4gbG9hZCBwcm9jZXNzIDogcnQtdGhyZWFkIC0+IHUtYm9vdCAtPiBsaW51eAo+
ID4KPiA+IGJlZm9yZSBhZGQgcHNwL21zcCBjaGVjayBhZnRlciBzdmMgY2FsbCwgcmVnaXN0ZXIg
cmVzdG9yZSBjb3JydXB0Lgo+ID4gYWRkIGEgcHJpbnRoZXg4IGFyb3VuZCBzdmMgY2FsbCwgZm91
bmQgdGhlIHNwIHN0YWNrIGlzIDB4MjQwNDAwMDBjMGZmY2ZmOAo+ID4gaXQgc2hvdWxkIGJlIDB4
YzBmZmNkZjhjMGZmY2ZmOC4gMHgyNDA0MDAwMCBpcyB0aGUgc3Agc3RhY2sgYWRkcmVzcwo+ID4g
YXNzaWduZWQgYnkgdS1ib290Cj4gPiBpJ3ZlIG5vIGlkZWEgaG93IGl0J3MgYmVjb21lIHRvIHUt
Ym9vdCdzIHNwLgo+ID4KPiA+IEkgaGF2ZSB0aGUgcnRvcyBjb2RlLCBhbmQgd2lsbCB0cnkgdG8g
Zml4IGl0IG9uIHRoZSBydG9zIHNpZGUuCj4KPiBUaGF0IHdvdWxkIGJlIGdyZWF0IQo+Cj4gPgo+
ID4gQ2FuIHlvdSBnaXZlIG1vcmUgZXhwbGFuYXRpb24gYWJvdXQgd2h5IGxpbnV4IHJlbGllcyBv
biBNU1AgPyB0aGFua3MKPgo+IE1TUCBpcyB3aGF0IHNldCBmcm9tIGJvb3QsIHRodXMgaXQgaXMg
bmF0dXJhbCBhc3N1bXB0aW9uIHRoYXQgYm9vdCBjb2RlCj4gd291bGQgcHJlc2VydmUgdGhhdCBp
bGx1c2lvbi4KPgo+IEknZCBndWVzcyB0aGF0IGtlcm5lbCBpcyBpbiBsaW5lIGluIHN1Y2ggYXNz
dW1wdGlvbiBhY3Jvc3MgZGlmZmVyZW50Cj4gKFJUKU9TIGNhcGFibGUgdG8gcnVuIG9uIE0tY2xh
c3MgY29yZXMgKHBsZWFzZSwgbm90ZSB0aGF0IHNvbWUgdmFyaWFudHMKPiBtaWdodCBub3QgaGF2
ZSB0d28gc3RhY2sgcG9pbnRlcnMpCj4KT2thee+8jCBnb3QgaXQuIGFmdGVyIGFkZGluZyBtc3Av
cHNwIHN3aXRjaCBjb2RlIGluIFJUT1MsIG5vdyB0aGUga2VybmVsCmNhbiBiZSBsb2FkZWQgbm9y
bWFsbHkKd2l0aG91dCBhbnkgbW9kaWZpY2F0aW9uLgoKU28sIGp1c3QgZHJvcCB0aGUgY2hhbmdl
cyBpbiBwcm9jLXY3bS5TLgoKVGhhbmtzLgo+IENoZWVycwo+IFZsYWRpbWlyCj4KPiA+Cj4gPj4K
PiA+PiBJJ2QgdmVyeSBtdWNoIHByZWZlciB0byBrZWVwIHN0YWNrIHN3aXRjaGluZyBsb2dpYyBv
dXRzaWRlIGtlcm5lbCwKPiA+PiBzYXksIGluIHNvbWUgc2hpbSB3aGljaCBSVE9TL2Jvb3Rsb2Fk
ZXIgY2FuIG1haW50YWluLgo+ID4+Cj4gPj4gQ2hlZXJzCj4gPj4gVmxhZGltaXIKPiA+Pgo+ID4+
Pgo+ID4+PiBTbywgd2UgbmVlZCBhZGQgYW4gbHIgY2hlY2sgYWZ0ZXIgc3ZjIGNhbGwsIHRvIGZp
bmQgb3V0IHNob3VsZAo+ID4+PiB1c2UgcHNwIG9yIG1zcC4gZWxzZSByZWdpc3RlciByZXN0b3Jl
IGFmdGVyIHN2YyBjYWxsIG1pZ2h0IGJlCj4gPj4+IGNvcnJ1cHRlZC4KPiA+Pj4KPiA+Pj4gRml4
ZXM6IGI3MGNkNDA2ZDdmZSAoIkFSTTogODY3MS8xOiBWN006IFByZXNlcnZlIHJlZ2lzdGVycyBh
Y3Jvc3Mgc3dpdGNoIGZyb20gVGhyZWFkIHRvIEhhbmRsZXIgbW9kZSIpCj4gPj4+IFNpZ25lZC1v
ZmYtYnk6IGRpbGxvbiBtaW4gPGRpbGxvbi5taW5mZWlAZ21haWwuY29tPgo+ID4+PiAtLS0KPiA+
Pj4gIGFyY2gvYXJtL21tL3Byb2MtdjdtLlMgfCA1ICsrKystCj4gPj4+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQg
YS9hcmNoL2FybS9tbS9wcm9jLXY3bS5TIGIvYXJjaC9hcm0vbW0vcHJvYy12N20uUwo+ID4+PiBp
bmRleCA4NDQ1OWMxZDMxYjguLmM5M2QyNzU3MzEyZCAxMDA2NDQKPiA+Pj4gLS0tIGEvYXJjaC9h
cm0vbW0vcHJvYy12N20uUwo+ID4+PiArKysgYi9hcmNoL2FybS9tbS9wcm9jLXY3bS5TCj4gPj4+
IEBAIC0xMzcsNyArMTM3LDEwIEBAIF9fdjdtX3NldHVwX2NvbnQ6Cj4gPj4+ICAxOiAgIGNwc2lk
ICAgaQo+ID4+PiAgICAgICAvKiBDYWxjdWxhdGUgZXhjX3JldCAqLwo+ID4+PiAgICAgICBvcnIg
ICAgIHIxMCwgbHIsICNFWENfUkVUX1RIUkVBRE1PREVfUFJPQ0VTU1NUQUNLCj4gPj4+IC0gICAg
IGxkbWlhICAgc3AsIHtyMC1yMywgcjEyfQo+ID4+PiArICAgICB0c3QgICAgIGxyLCAjRVhDX1JF
VF9TVEFDS19NQVNLCj4gPj4+ICsgICAgIG1yc25lICAgcjQsIHBzcAo+ID4+PiArICAgICBtb3Zl
cSAgIHI0LCBzcAo+ID4+PiArICAgICBsZG1pYSAgIHI0ISwge3IwLXIzLCByMTJ9Cj4gPj4+ICAg
ICAgIHN0ciAgICAgcjUsIFtyMTIsICMxMSAqIDRdICAgICAgQCByZXN0b3JlIHRoZSBvcmlnaW5h
bCBTVkMgdmVjdG9yIGVudHJ5Cj4gPj4+ICAgICAgIG1vdiAgICAgbHIsIHI2ICAgICAgICAgICAg
ICAgICAgQCByZXN0b3JlIExSCj4gPj4+Cj4gPj4+Cj4gPj4KPiA+Cj4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
