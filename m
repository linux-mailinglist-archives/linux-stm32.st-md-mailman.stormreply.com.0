Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA8DCCC1D2
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Dec 2025 14:53:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 650F1C5663A;
	Thu, 18 Dec 2025 13:53:50 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3DCDC030AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Dec 2025 13:53:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DECB91A22CD;
 Thu, 18 Dec 2025 13:53:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A4BEE606B6;
 Thu, 18 Dec 2025 13:53:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 66249102F0B2D; Thu, 18 Dec 2025 14:53:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766066026; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=RhgSGQYStNGcdPoB3dTlM/CB5TE2tva/NS/z3ptd3wM=;
 b=qFohZZY8adtmwbRo28+tcgXOIuD5T9ZV6GmStiiS0ZAEXQPvVe9Zcnoe53YsCQv7j9c1kT
 pTrvVf3pcUkunP7HW/oQvdBg/Lk3nsGsCiYCx3SHIHn49cINe+SDypYYTUNdpwsJxK0JVh
 ocSroqcU2Nk7str55AMgKkPgbWDRxk2+yhvbttnAqOzQlGRqdP2i4+xde+ODjyK3Zpm5be
 ZSBh2N3dOdtUob6QOjlSHuVExl0oaNjoD8HBgFGaCPqRDPAFBwnRVvZxfM0UXeEISM/0Op
 YG/ULfUWn7tCLkV8LWmaP9dHfiDTFdsnlQ2sM6hNfJi3OczZvwptkZvMOkvVJQ==
Date: Thu, 18 Dec 2025 14:53:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Message-ID: <20251218135332f323fa91@mail.local>
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
 <CAHUa44FrDZbvRvfN8obf80_k=Eqxe9YxHpjaE5jU7nkxPUwfag@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHUa44FrDZbvRvfN8obf80_k=Eqxe9YxHpjaE5jU7nkxPUwfag@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: linux-efi@vger.kernel.org, linux-doc@vger.kernel.org,
 Jan Kiszka <jan.kiszka@siemens.com>, Mimi Zohar <zohar@linux.ibm.com>,
 linux-mips@vger.kernel.org, David Howells <dhowells@redhat.com>,
 keyrings@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>,
 Ard Biesheuvel <ardb@kernel.org>, linux-rtc@vger.kernel.org,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 James Morris <jmorris@namei.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jason Gunthorpe <jgg@ziepe.ca>, Cristian Marussi <cristian.marussi@arm.com>,
 arm-scmi@vger.kernel.org,
 =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, op-tee@lists.trustedfirmware.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Sumit Garg <sumit.garg@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Michael Chan <michael.chan@broadcom.com>, linux-arm-kernel@lists.infradead.org,
 Paul Moore <paul@paul-moore.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-integrity@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 00/17] tee: Use bus callbacks instead
 of driver callbacks
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

T24gMTgvMTIvMjAyNSAwODoyMToyNyswMTAwLCBKZW5zIFdpa2xhbmRlciB3cm90ZToKPiBIaSwK
PiAKPiBPbiBNb24sIERlYyAxNSwgMjAyNSBhdCAzOjE34oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcK
PiA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGVsbG8sCj4g
Pgo+ID4gdGhlIG9iamVjdGl2ZSBvZiB0aGlzIHNlcmllcyBpcyB0byBtYWtlIHRlZSBkcml2ZXIg
c3RvcCB1c2luZyBjYWxsYmFja3MKPiA+IGluIHN0cnVjdCBkZXZpY2VfZHJpdmVyLiBUaGVzZSB3
ZXJlIHN1cGVyc2VkZWQgYnkgYnVzIG1ldGhvZHMgaW4gMjAwNgo+ID4gKGNvbW1pdCA1OTRjODI4
MWY5MDUgKCJbUEFUQ0hdIEFkZCBidXNfdHlwZSBwcm9iZSwgcmVtb3ZlLCBzaHV0ZG93bgo+ID4g
bWV0aG9kcy4iKSkgYnV0IG5vYm9keSBjYXJlZCB0byBjb252ZXJ0IGFsbCBzdWJzeXN0ZW1zIGFj
Y29yZGluZ2x5Lgo+ID4KPiA+IEhlcmUgdGhlIHRlZSBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQuIFRo
ZSBmaXJzdCBjb21taXQgaXMgc29tZXdoYXQKPiA+IHVucmVsYXRlZCwgYnV0IHNpbXBsaWZpZXMg
dGhlIGNvbnZlcnNpb24gKGFuZCB0aGUgZHJpdmVycykuIEl0Cj4gPiBpbnRyb2R1Y2VzIGRyaXZl
ciByZWdpc3RyYXRpb24gaGVscGVycyB0aGF0IGNhcmUgYWJvdXQgc2V0dGluZyB0aGUgYnVzCj4g
PiBhbmQgb3duZXIuIChUaGUgbGF0dGVyIGlzIG1pc3NpbmcgaW4gYWxsIGRyaXZlcnMsIHNvIGJ5
IHVzaW5nIHRoZXNlCj4gPiBoZWxwZXJzIHRoZSBkcml2ZXJzIGJlY29tZSBtb3JlIGNvcnJlY3Qu
KQo+ID4KPiA+IHYxIG9mIHRoaXMgc2VyaWVzIGlzIGF2YWlsYWJsZSBhdAo+ID4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsL2NvdmVyLjE3NjU0NzIxMjUuZ2l0LnUua2xlaW5lLWtvZW5pZ0Bi
YXlsaWJyZS5jb20KPiA+Cj4gPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ID4KPiA+ICAtIHJlYmFzZSB0
byB2Ni4xOS1yYzEgKG5vIGNvbmZsaWN0cykKPiA+ICAtIGFkZCB0YWdzIHJlY2VpdmVkIHNvIGZh
cgo+ID4gIC0gZml4IHdoaXRlc3BhY2UgaXNzdWVzIHBvaW50ZWQgb3V0IGJ5IFN1bWl0IEdhcmcK
PiA+ICAtIGZpeCBzaHV0ZG93biBjYWxsYmFjayB0byBzaHV0ZG93biBhbmQgbm90IHJlbW92ZQo+
ID4KPiA+IEFzIGFscmVhZHkgbm90ZWQgaW4gdjEncyBjb3ZlciBsZXR0ZXIsIHRoaXMgc2VyaWVz
IHNob3VsZCBnbyBpbiBkdXJpbmcgYQo+ID4gc2luZ2xlIG1lcmdlIHdpbmRvdyBhcyB0aGVyZSBh
cmUgcnVudGltZSB3YXJuaW5ncyB3aGVuIHRoZSBzZXJpZXMgaXMKPiA+IG9ubHkgYXBwbGllZCBw
YXJ0aWFsbHkuIFN1bWl0IEdhcmcgc3VnZ2VzdGVkIHRvIGFwcGx5IHRoZSB3aG9sZSBzZXJpZXMK
PiA+IHZpYSBKZW5zIFdpa2xhbmRlcidzIHRyZWUuCj4gPiBJZiB0aGlzIGlzIGRvbmUgdGhlIGRl
cGVuZGVuY2llcyBpbiB0aGlzIHNlcmllcyBhcmUgaG9ub3JlZCwgaW4gY2FzZSB0aGUKPiA+IHBs
YW4gY2hhbmdlczogUGF0Y2hlcyAjNCAtICMxNyBkZXBlbmQgb24gdGhlIGZpcnN0IHR3by4KPiA+
Cj4gPiBOb3RlIHRoaXMgc2VyaWVzIGlzIG9ubHkgYnVpbGQgdGVzdGVkLgo+ID4KPiA+IFV3ZSBL
bGVpbmUtS8O2bmlnICgxNyk6Cj4gPiAgIHRlZTogQWRkIHNvbWUgaGVscGVycyB0byByZWR1Y2Ug
Ym9pbGVycGxhdGUgZm9yIHRlZSBjbGllbnQgZHJpdmVycwo+ID4gICB0ZWU6IEFkZCBwcm9iZSwg
cmVtb3ZlIGFuZCBzaHV0ZG93biBidXMgY2FsbGJhY2tzIHRvIHRlZV9jbGllbnRfZHJpdmVyCj4g
PiAgIHRlZTogQWRhcHQgZG9jdW1lbnRhdGlvbiB0byBjb3ZlciByZWNlbnQgYWRkaXRpb25zCj4g
PiAgIGh3cm5nOiBvcHRlZSAtIE1ha2UgdXNlIG9mIG1vZHVsZV90ZWVfY2xpZW50X2RyaXZlcigp
Cj4gPiAgIGh3cm5nOiBvcHRlZSAtIE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9kcwo+ID4gICBy
dGM6IG9wdGVlOiBNaWdyYXRlIHRvIHVzZSB0ZWUgc3BlY2lmaWMgZHJpdmVyIHJlZ2lzdHJhdGlv
biBmdW5jdGlvbgo+ID4gICBydGM6IG9wdGVlOiBNYWtlIHVzZSBvZiB0ZWUgYnVzIG1ldGhvZHMK
PiA+ICAgZWZpOiBzdG1tOiBNYWtlIHVzZSBvZiBtb2R1bGVfdGVlX2NsaWVudF9kcml2ZXIoKQo+
ID4gICBlZmk6IHN0bW06IE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9kcwo+ID4gICBmaXJtd2Fy
ZTogYXJtX3NjbWk6IG9wdGVlOiBNYWtlIHVzZSBvZiBtb2R1bGVfdGVlX2NsaWVudF9kcml2ZXIo
KQo+ID4gICBmaXJtd2FyZTogYXJtX3NjbWk6IE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9kcwo+
ID4gICBmaXJtd2FyZTogdGVlX2JueHQ6IE1ha2UgdXNlIG9mIG1vZHVsZV90ZWVfY2xpZW50X2Ry
aXZlcigpCj4gPiAgIGZpcm13YXJlOiB0ZWVfYm54dDogTWFrZSB1c2Ugb2YgdGVlIGJ1cyBtZXRo
b2RzCj4gPiAgIEtFWVM6IHRydXN0ZWQ6IE1pZ3JhdGUgdG8gdXNlIHRlZSBzcGVjaWZpYyBkcml2
ZXIgcmVnaXN0cmF0aW9uCj4gPiAgICAgZnVuY3Rpb24KPiA+ICAgS0VZUzogdHJ1c3RlZDogTWFr
ZSB1c2Ugb2YgdGVlIGJ1cyBtZXRob2RzCj4gPiAgIHRwbS90cG1fZnRwbV90ZWU6IE1ha2UgdXNl
IG9mIHRlZSBzcGVjaWZpYyBkcml2ZXIgcmVnaXN0cmF0aW9uCj4gPiAgIHRwbS90cG1fZnRwbV90
ZWU6IE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9kcwo+ID4KPiA+ICBEb2N1bWVudGF0aW9uL2Ry
aXZlci1hcGkvdGVlLnJzdCAgICAgICAgICAgICB8IDE4ICstLS0tCj4gPiAgZHJpdmVycy9jaGFy
L2h3X3JhbmRvbS9vcHRlZS1ybmcuYyAgICAgICAgICAgfCAyNiArKy0tLS0KPiA+ICBkcml2ZXJz
L2NoYXIvdHBtL3RwbV9mdHBtX3RlZS5jICAgICAgICAgICAgICB8IDMxICsrKysrLS0tCj4gPiAg
ZHJpdmVycy9maXJtd2FyZS9hcm1fc2NtaS90cmFuc3BvcnRzL29wdGVlLmMgfCAzMiArKystLS0t
LQo+ID4gIGRyaXZlcnMvZmlybXdhcmUvYnJvYWRjb20vdGVlX2JueHRfZncuYyAgICAgIHwgMzAg
KystLS0tLQo+ID4gIGRyaXZlcnMvZmlybXdhcmUvZWZpL3N0bW0vdGVlX3N0bW1fZWZpLmMgICAg
IHwgMjUgKystLS0tCj4gPiAgZHJpdmVycy9ydGMvcnRjLW9wdGVlLmMgICAgICAgICAgICAgICAg
ICAgICAgfCAyNyArKy0tLS0tCj4gPiAgZHJpdmVycy90ZWUvdGVlX2NvcmUuYyAgICAgICAgICAg
ICAgICAgICAgICAgfCA4NCArKysrKysrKysrKysrKysrKysrKwo+ID4gIGluY2x1ZGUvbGludXgv
dGVlX2Rydi5oICAgICAgICAgICAgICAgICAgICAgIHwgMTIgKysrCj4gPiAgc2VjdXJpdHkva2V5
cy90cnVzdGVkLWtleXMvdHJ1c3RlZF90ZWUuYyAgICAgfCAxNyArKy0tCj4gPiAgMTAgZmlsZXMg
Y2hhbmdlZCwgMTY0IGluc2VydGlvbnMoKyksIDEzOCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBiYXNl
LWNvbW1pdDogOGYwYjRjY2U0NDgxZmIyMjY1MzY5N2NjZWQ4ZDBkMDQwMjdjYjFlOAo+ID4gLS0K
PiA+IDIuNDcuMwo+ID4KPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBuaWNlIGNsZWFudXAsIFV3ZS4K
PiAKPiBJJ3ZlIGFwcGxpZWQgcGF0Y2ggMS0zIHRvIHRoZSBicmFuY2ggdGVlX2J1c19jYWxsYmFj
a19mb3JfNi4yMCBpbiBteQo+IHRyZWUgYXQgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvamVuc3dpL2xpbnV4LXRlZS5naXQvCj4gCj4gVGhlIGJyYW5jaCBp
cyBiYXNlZCBvbiB2Ni4xOS1yYzEsIGFuZCBJJ2xsIHRyeSB0byBrZWVwIGl0IHN0YWJsZSBmb3IK
PiBvdGhlcnMgdG8gZGVwZW5kIG9uLCBpZiBuZWVkZWQuIExldCdzIHNlZSBpZiB3ZSBjYW4gYWdy
ZWUgb24gdGFraW5nCj4gdGhlIHJlbWFpbmluZyBwYXRjaGVzIHZpYSB0aGF0IGJyYW5jaC4KCjYg
YW5kIDcgY2FuIGdvIHRocm91Z2ggeW91ciBicmFuY2guCgotLSAKQWxleGFuZHJlIEJlbGxvbmks
IGNvLW93bmVyIGFuZCBDT08sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
