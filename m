Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A46A9C4135
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2024 15:47:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0596C78F66;
	Mon, 11 Nov 2024 14:47:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D1CAC78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 14:47:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A9491CE0;
 Mon, 11 Nov 2024 06:47:44 -0800 (PST)
Received: from [10.57.79.116] (unknown [10.57.79.116])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C84D03F66E;
 Mon, 11 Nov 2024 06:47:12 -0800 (PST)
Message-ID: <a4168463-98e3-4048-bb38-ffc96983766f@arm.com>
Date: Mon, 11 Nov 2024 14:47:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20241111110922.334610-2-u.kleine-koenig@baylibre.com>
 <87h68duaez.fsf@ubik.fi.intel.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <87h68duaez.fsf@ubik.fi.intel.com>
Cc: coresight@lists.linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 James Clark <james.clark@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] hwtracing: Switch back to struct
 platform_driver::remove()
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkKCk9uIDExLzExLzIwMjQgMTQ6MTIsIEFsZXhhbmRlciBTaGlzaGtpbiB3cm90ZToKPiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4gd3JpdGVzOgo+IAo+
PiBBZnRlciBjb21taXQgMGVkYjU1NWE2NWQxICgicGxhdGZvcm06IE1ha2UgcGxhdGZvcm1fZHJp
dmVyOjpyZW1vdmUoKQo+PiByZXR1cm4gdm9pZCIpIC5yZW1vdmUoKSBpcyAoYWdhaW4pIHRoZSBy
aWdodCBjYWxsYmFjayB0byBpbXBsZW1lbnQgZm9yCj4+IHBsYXRmb3JtIGRyaXZlcnMuCj4+Cj4+
IENvbnZlcnQgYWxsIHBsYXRmb3JtIGRyaXZlcnMgYmVsb3cgZHJpdmVycy9od3RyYWNpbmcgdG8g
dXNlIC5yZW1vdmUoKSwKPj4gd2l0aCB0aGUgZXZlbnR1YWwgZ29hbCB0byBkcm9wIHN0cnVjdCBw
bGF0Zm9ybV9kcml2ZXI6OnJlbW92ZV9uZXcoKS4gQXMKPj4gLnJlbW92ZSgpIGFuZCAucmVtb3Zl
X25ldygpIGhhdmUgdGhlIHNhbWUgcHJvdG90eXBlcywgY29udmVyc2lvbiBpcyBkb25lCj4+IGJ5
IGp1c3QgY2hhbmdpbmcgdGhlIHN0cnVjdHVyZSBtZW1iZXIgbmFtZSBpbiB0aGUgZHJpdmVyIGlu
aXRpYWxpemVyLgo+Pgo+PiBBbHNvIGFkYXB0IHNvbWUgd2hpdGVzcGFjZSB0byBtYWtlIGluZGVu
dGlvbiBjb25zaXN0ZW50Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8
dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KPiAKPiBBY2tlZC1ieTogQWxleGFuZGVyIFNo
aXNoa2luIDxhbGV4YW5kZXIuc2hpc2hraW5AbGludXguaW50ZWwuY29tPgo+IAo+PiAtLS0KPj4g
SGVsbG8sCj4+Cj4+IEkgZGlkIGEgc2luZ2xlIHBhdGNoIGZvciBhbGwgb2YgZHJpdmVycy9od3Ry
YWNpbmcuIFdoaWxlIEkgdXN1YWxseQo+PiBwcmVmZXIgdG8gZG8gb25lIGxvZ2ljYWwgY2hhbmdl
IHBlciBwYXRjaCwgdGhpcyBzZWVtcyB0byBiZQo+PiBvdmVyZW5naW5lZXJpbmcgaGVyZSBhcyB0
aGUgaW5kaXZpZHVhbCBjaGFuZ2VzIGFyZSByZWFsbHkgdHJpdmlhbCBhbmQKPj4gc2hvdWxkbid0
IGJlIG11Y2ggaW4gdGhlIHdheSBmb3Igc3RhYmxlIGJhY2twb3J0cy4gQnV0IEknbGwgaGFwcGls
eQo+PiBzcGxpdCB0aGUgcGF0Y2ggaWYgeW91IHByZWZlciBpdCBzcGxpdC4gTWF5YmUgc3BsaXQg
Zm9yIGNvcmVzaWdodCB2cy4KPj4gaW50ZWxfdGg/IEFsc28gaWYgeW91IG9iamVjdCB0aGUgaW5k
ZW50YXRpb24gc3R1ZmYsIEkgY2FuIHJld29yayB0aGF0Lgo+IAo+IEknbSBmaW5lIHdpdGggaXQg
YXMgaXMuCj4gCj4+IFRoaXMgaXMgYmFzZWQgb24gdG9kYXkncyBuZXh0LCBpZiBjb25mbGljdHMg
YXJpc2Ugd2hlbiB5b3UgYXBwbHkgaXQgYXQKPj4gc29tZSBsYXRlciB0aW1lIGFuZCBkb24ndCB3
YW50IHRvIHJlc29sdmUgdGhlbSwgZmVlbCBmcmVlIHRvIGp1c3QgZHJvcAo+PiB0aGUgY2hhbmdl
cyB0byB0aGUgY29uZmxpY3RpbmcgZmlsZXMuIEknbGwgbm90aWNlIGFuZCBmb2xsb3d1cCBhdCBh
Cj4+IGxhdGVyIHRpbWUgdGhlbi4gT3IgYXNrIG1lIGZvciBhIGZpeGVkIHJlc2VuZC4gKEhhdmlu
ZyBzYWlkIHRoYXQsIEkKPj4gcmVjb21tZW5kIGI0IGFtIC0zICsgZ2l0IGFtIC0zIHdoaWNoIHNo
b3VsZCByZXNvbHZlIG1vc3QgY29uZmxpY3RzIGp1c3QKPj4gZmluZS4pCj4gCj4gRG9lcyBhbnli
b2R5IHdhbnQgdG8gcGljayB0aGlzIHVwIG9yIHNob3VsZCBJPyBJJ20gZmluZSBlaXRoZXIgd2F5
LCBidXQKPiBpZiB0aGVyZSBhcmUgYW55IGNvbmZsaWN0cyB0aGV5IHdvbid0IGJlIGZyb20gbXkg
ZW5kIG9mIHRoaW5ncywgc28gaXQKPiBtaWdodCBtYWtlIHNlbnNlIHRvIHRha2UgaXQgdmlhIHRo
ZSBjb3Jlc2lnaHQgcGF0aC4KCkkgYW0gaGFwcHkgdG8gdGFrZSB0aGVtIHZpYSBjb3Jlc2lnaHQg
dHJlZSBhbmQgcXVldWUgdGhlbSBmb3IgdjYuMTQKClN1enVraQoKPiAKPiBUaGFua3MsCj4gLS0K
PiBBbGV4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
