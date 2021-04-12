Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF0735BC0D
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Apr 2021 10:25:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA7B7C57B6F;
	Mon, 12 Apr 2021 08:25:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2795FC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 08:25:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F372C611C9;
 Mon, 12 Apr 2021 08:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1618215942;
 bh=o2FA/cIfp81ieww6cQ4V8vdIeDnkjNOcliiu7ETQHpk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DHnMsNneetAzNDdLcS/md0lm9nlFNbK5iX6CMGjtvhvCkGUXfhTDBvSbjuuVA7ZKF
 qj8b8plBSB1bCVGVKT3k1hD1GZPdAYg+zHdgMjyGxf84Un7uA5Qw46RoIFDoTwhm1J
 4acu6SGUE6kN+llel9jRLE7HGsVR6ayGkJ7OmNcM=
Date: Mon, 12 Apr 2021 10:25:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: dillon min <dillon.minfei@gmail.com>
Message-ID: <YHQEA9jn5uXQCtrN@kroah.com>
References: <1618202061-8243-1-git-send-email-dillon.minfei@gmail.com>
 <YHPgGI6EmTzmVH7g@kroah.com>
 <CAL9mu0Lt-3_O7V5HLxd5Hbt9afx9ryBUzWqmsc+2n3SP7JS6ig@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL9mu0Lt-3_O7V5HLxd5Hbt9afx9ryBUzWqmsc+2n3SP7JS6ig@mail.gmail.com>
Cc: linux-serial@vger.kernel.org,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, jirislaby@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] serial: stm32: optimize spin lock usage
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

T24gTW9uLCBBcHIgMTIsIDIwMjEgYXQgMDI6NTA6MjBQTSArMDgwMCwgZGlsbG9uIG1pbiB3cm90
ZToKPiBIaSBHcmVn77yMCj4gCj4gVGhhbmtzIGZvciB0aGUgcXVpY2sgcmVzcG9uc2UsIHBsZWFz
ZSBpZ25vcmUgdGhlIGxhc3QgcHJpdmF0ZSBtYWlsLgo+IAo+IE9uIE1vbiwgQXByIDEyLCAyMDIx
IGF0IDE6NTIgUE0gR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+
ID4KPiA+IE9uIE1vbiwgQXByIDEyLCAyMDIxIGF0IDEyOjM0OjIxUE0gKzA4MDAsIGRpbGxvbi5t
aW5mZWlAZ21haWwuY29tIHdyb3RlOgo+ID4gPiBGcm9tOiBkaWxsb24gbWluIDxkaWxsb24ubWlu
ZmVpQGdtYWlsLmNvbT4KPiA+ID4KPiA+ID4gVG8gYXZvaWQgcG90ZW50aWFsIGRlYWRsb2NrIGlu
IHNwaW5fbG9jayB1c2FnZSwgY2hhbmdlIHRvIHVzZQo+ID4gPiBzcGluX2xvY2tfaXJxc2F2ZSgp
LCBzcGluX3VubG9ja19pcnFyZXN0b3JlKCkgaW4gcHJvY2Vzcyh0aHJlYWRfZm4pIGNvbnRleHQu
Cj4gPiA+IHNwaW5fbG9jaygpLCBzcGluX3VubG9jaygpIHVuZGVyIGhhbmRsZXIgY29udGV4dC4K
PiA+ID4KPiA+ID4gcmVtb3ZlIHVudXNlZCBsb2NhbF9pcnFfc2F2ZS9yZXN0b3JlIGNhbGwuCj4g
PiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IGRpbGxvbiBtaW4gPGRpbGxvbi5taW5mZWlAZ21haWwu
Y29tPgo+ID4gPiAtLS0KPiA+ID4gV2FzIHZlcmlmaWVkIG9uIHN0bTMyZjQ2OS1kaXNjbyBib2Fy
ZC4gbmVlZCBtb3JlIHRlc3Qgb24gc3RtMzJtcCBwbGF0Zm9ybS4KPiA+ID4KPiA+ID4gIGRyaXZl
cnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jIHwgMjcgKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNh
cnQuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jCj4gPiA+IGluZGV4IGIzNjc1
Y2YyNWE2OS4uYzRjODU5YjM0MzY3IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJp
YWwvc3RtMzItdXNhcnQuYwo+ID4gPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNh
cnQuYwo+ID4gPiBAQCAtMjE0LDcgKzIxNCw3IEBAIHN0YXRpYyB2b2lkIHN0bTMyX3VzYXJ0X3Jl
Y2VpdmVfY2hhcnMoc3RydWN0IHVhcnRfcG9ydCAqcG9ydCwgYm9vbCB0aHJlYWRlZCkKPiA+ID4g
ICAgICAgc3RydWN0IHR0eV9wb3J0ICp0cG9ydCA9ICZwb3J0LT5zdGF0ZS0+cG9ydDsKPiA+ID4g
ICAgICAgc3RydWN0IHN0bTMyX3BvcnQgKnN0bTMyX3BvcnQgPSB0b19zdG0zMl9wb3J0KHBvcnQp
Owo+ID4gPiAgICAgICBjb25zdCBzdHJ1Y3Qgc3RtMzJfdXNhcnRfb2Zmc2V0cyAqb2ZzID0gJnN0
bTMyX3BvcnQtPmluZm8tPm9mczsKPiA+ID4gLSAgICAgdW5zaWduZWQgbG9uZyBjOwo+ID4gPiAr
ICAgICB1bnNpZ25lZCBsb25nIGMsIGZsYWdzOwo+ID4gPiAgICAgICB1MzIgc3I7Cj4gPiA+ICAg
ICAgIGNoYXIgZmxhZzsKPiA+ID4KPiA+ID4gQEAgLTI3Niw5ICsyNzYsMTcgQEAgc3RhdGljIHZv
aWQgc3RtMzJfdXNhcnRfcmVjZWl2ZV9jaGFycyhzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0LCBib29s
IHRocmVhZGVkKQo+ID4gPiAgICAgICAgICAgICAgIHVhcnRfaW5zZXJ0X2NoYXIocG9ydCwgc3Is
IFVTQVJUX1NSX09SRSwgYywgZmxhZyk7Cj4gPiA+ICAgICAgIH0KPiA+ID4KPiA+ID4gLSAgICAg
c3Bpbl91bmxvY2soJnBvcnQtPmxvY2spOwo+ID4gPiArICAgICBpZiAodGhyZWFkZWQpCj4gPiA+
ICsgICAgICAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcG9ydC0+bG9jaywgZmxhZ3Mp
Owo+ID4gPiArICAgICBlbHNlCj4gPiA+ICsgICAgICAgICAgICAgc3Bpbl91bmxvY2soJnBvcnQt
PmxvY2spOwo+ID4KPiA+IFlvdSBzaG91bGRuJ3QgaGF2ZSB0byBjaGVjayBmb3IgdGhpcywgc2Vl
IHRoZSBvdGhlciBwYXRjaGVzIG9uIHRoZSBsaXN0Cj4gPiByZWNlbnRseSB0aGF0IGZpeGVkIHRo
aXMgdXAgdG8gbm90IGJlIGFuIGlzc3VlIGZvciBpcnEgaGFuZGxlcnMuCj4gQ2FuIHlvdSBoZWxw
IHRvIGdpdmUgbW9yZSBoaW50cywgb3IgdGhlIGNvbW1pdCBpZCBvZiB0aGUgcGF0Y2ggd2hpY2gK
PiBmaXhlZCB0aGlzLiB0aGFua3MuCj4gCj4gSSdtIHN0aWxsIGNvbmZ1c2VkIHdpdGggdGhpcy4K
PiAKPiBUaGUgc3RtMzJfdXNhcnRfdGhyZWFkZWRfaW50ZXJydXB0KCkgaXMgYSBrdGhyZWFkIGNv
bnRleHQsIG9uY2UKPiBwb3J0LT5sb2NrIGhvbGRzIGJ5IHRoaXMgZnVuY3Rpb24sIGFub3RoZXIg
c2VyaWFsIGludGVycnVwdHMgcmFpc2VkLAo+IHN1Y2ggYXMgVVNBUlRfU1JfVFhFLHN0bTMyX3Vz
YXJ0X2ludGVycnVwdCgpIGNhbid0IGdldCB0aGUgbG9jaywKPiB0aGVyZSB3aWxsIGJlIGEgZGVh
ZGxvY2suIGlzbid0IGl0Pwo+IAo+ICBTbywgc2hvdWxkbid0IEkgdXNlIHNwaW5fbG9ja3tfaXJx
c2F2ZX0gYWNjb3JkaW5nIHRvIHRoZSBjYWxsZXIncyBjb250ZXh0ID8KClBsZWFzZSBzZWUgODFl
MjA3M2MxNzViICgiZ2VuaXJxOiBEaXNhYmxlIGludGVycnVwdHMgZm9yIGZvcmNlIHRocmVhZGVk
CmhhbmRsZXJzIikgZm9yIHdoZW4gdGhyZWFkZWQgaXJxIGhhbmRsZXJzIGhhdmUgaXJxcyBkaXNh
YmxlZCwgaXNuJ3QgdGhhdAp0aGUgY2FzZSB5b3UgYXJlIHRyeWluZyB0byAicHJvdGVjdCIgZnJv
bSBoZXJlPwoKV2h5IGlzIHRoZSAidGhyZWFkZWQiIGZsYWcgdXNlZCBhdCBhbGw/ICBUaGUgZHJp
dmVyIHNob3VsZCBub3QgY2FyZS4KCkFsc28gc2VlIDliYWVkYjdiYWVkYSAoInNlcmlhbDogaW14
OiBkcm9wIHdvcmthcm91bmQgZm9yIGZvcmNlZCBpcnEKdGhyZWFkaW5nIikgaW4gbGludXgtbmV4
dCBmb3IgYW4gZXhhbXBsZSBvZiBob3cgdGhpcyB3YXMgZml4ZWQgdXAgaW4gYQpzZXJpYWwgZHJp
dmVyLgoKZG9lcyB0aGF0IGhlbHA/Cgp0aGFua3MsCgpncmVnIGstaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
