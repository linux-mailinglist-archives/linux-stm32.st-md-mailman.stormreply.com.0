Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AE5CF88E7
	for <lists+linux-stm32@lfdr.de>; Tue, 06 Jan 2026 14:40:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C8A4C8F277;
	Tue,  6 Jan 2026 13:40:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD269C60463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jan 2026 13:40:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA5E7497;
 Tue,  6 Jan 2026 05:40:24 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D1043F6A8;
 Tue,  6 Jan 2026 05:40:25 -0800 (PST)
Date: Tue, 6 Jan 2026 13:40:23 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Message-ID: <aV0Qx5BOso5co3tm@bogus>
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
 <CAHUa44FrDZbvRvfN8obf80_k=Eqxe9YxHpjaE5jU7nkxPUwfag@mail.gmail.com>
 <20251218135332f323fa91@mail.local>
 <CAHUa44GpW5aO26GDyL9RZub9vVYvVcJ7etwO0yXBN_mUi0W4AA@mail.gmail.com>
 <CAHUa44HqRbCJTXsrTCm0G5iwtkQtq+Si=yOspCjpAn-N2uVSVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHUa44HqRbCJTXsrTCm0G5iwtkQtq+Si=yOspCjpAn-N2uVSVg@mail.gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-efi@vger.kernel.org, linux-doc@vger.kernel.org,
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

T24gTW9uLCBKYW4gMDUsIDIwMjYgYXQgMTA6MTY6MDlBTSArMDEwMCwgSmVucyBXaWtsYW5kZXIg
d3JvdGU6Cj4gSGksCj4gCj4gT24gVGh1LCBEZWMgMTgsIDIwMjUgYXQgNToyOeKAr1BNIEplbnMg
V2lrbGFuZGVyCj4gPGplbnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+IE9u
IFRodSwgRGVjIDE4LCAyMDI1IGF0IDI6NTPigK9QTSBBbGV4YW5kcmUgQmVsbG9uaQo+ID4gPGFs
ZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gMTgvMTIv
MjAyNSAwODoyMToyNyswMTAwLCBKZW5zIFdpa2xhbmRlciB3cm90ZToKPiA+ID4gPiBIaSwKPiA+
ID4gPgo+ID4gPiA+IE9uIE1vbiwgRGVjIDE1LCAyMDI1IGF0IDM6MTfigK9QTSBVd2UgS2xlaW5l
LUvDtm5pZwo+ID4gPiA+IDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPiB3cm90ZToKPiA+
ID4gPiA+Cj4gPiA+ID4gPiBIZWxsbywKPiA+ID4gPiA+Cj4gPiA+ID4gPiB0aGUgb2JqZWN0aXZl
IG9mIHRoaXMgc2VyaWVzIGlzIHRvIG1ha2UgdGVlIGRyaXZlciBzdG9wIHVzaW5nIGNhbGxiYWNr
cwo+ID4gPiA+ID4gaW4gc3RydWN0IGRldmljZV9kcml2ZXIuIFRoZXNlIHdlcmUgc3VwZXJzZWRl
ZCBieSBidXMgbWV0aG9kcyBpbiAyMDA2Cj4gPiA+ID4gPiAoY29tbWl0IDU5NGM4MjgxZjkwNSAo
IltQQVRDSF0gQWRkIGJ1c190eXBlIHByb2JlLCByZW1vdmUsIHNodXRkb3duCj4gPiA+ID4gPiBt
ZXRob2RzLiIpKSBidXQgbm9ib2R5IGNhcmVkIHRvIGNvbnZlcnQgYWxsIHN1YnN5c3RlbXMgYWNj
b3JkaW5nbHkuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSGVyZSB0aGUgdGVlIGRyaXZlcnMgYXJlIGNv
bnZlcnRlZC4gVGhlIGZpcnN0IGNvbW1pdCBpcyBzb21ld2hhdAo+ID4gPiA+ID4gdW5yZWxhdGVk
LCBidXQgc2ltcGxpZmllcyB0aGUgY29udmVyc2lvbiAoYW5kIHRoZSBkcml2ZXJzKS4gSXQKPiA+
ID4gPiA+IGludHJvZHVjZXMgZHJpdmVyIHJlZ2lzdHJhdGlvbiBoZWxwZXJzIHRoYXQgY2FyZSBh
Ym91dCBzZXR0aW5nIHRoZSBidXMKPiA+ID4gPiA+IGFuZCBvd25lci4gKFRoZSBsYXR0ZXIgaXMg
bWlzc2luZyBpbiBhbGwgZHJpdmVycywgc28gYnkgdXNpbmcgdGhlc2UKPiA+ID4gPiA+IGhlbHBl
cnMgdGhlIGRyaXZlcnMgYmVjb21lIG1vcmUgY29ycmVjdC4pCj4gPiA+ID4gPgo+ID4gPiA+ID4g
djEgb2YgdGhpcyBzZXJpZXMgaXMgYXZhaWxhYmxlIGF0Cj4gPiA+ID4gPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvY292ZXIuMTc2NTQ3MjEyNS5naXQudS5rbGVpbmUta29lbmlnQGJheWxp
YnJlLmNvbQo+ID4gPiA+ID4KPiA+ID4gPiA+IENoYW5nZXMgc2luY2UgdjE6Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gIC0gcmViYXNlIHRvIHY2LjE5LXJjMSAobm8gY29uZmxpY3RzKQo+ID4gPiA+ID4g
IC0gYWRkIHRhZ3MgcmVjZWl2ZWQgc28gZmFyCj4gPiA+ID4gPiAgLSBmaXggd2hpdGVzcGFjZSBp
c3N1ZXMgcG9pbnRlZCBvdXQgYnkgU3VtaXQgR2FyZwo+ID4gPiA+ID4gIC0gZml4IHNodXRkb3du
IGNhbGxiYWNrIHRvIHNodXRkb3duIGFuZCBub3QgcmVtb3ZlCj4gPiA+ID4gPgo+ID4gPiA+ID4g
QXMgYWxyZWFkeSBub3RlZCBpbiB2MSdzIGNvdmVyIGxldHRlciwgdGhpcyBzZXJpZXMgc2hvdWxk
IGdvIGluIGR1cmluZyBhCj4gPiA+ID4gPiBzaW5nbGUgbWVyZ2Ugd2luZG93IGFzIHRoZXJlIGFy
ZSBydW50aW1lIHdhcm5pbmdzIHdoZW4gdGhlIHNlcmllcyBpcwo+ID4gPiA+ID4gb25seSBhcHBs
aWVkIHBhcnRpYWxseS4gU3VtaXQgR2FyZyBzdWdnZXN0ZWQgdG8gYXBwbHkgdGhlIHdob2xlIHNl
cmllcwo+ID4gPiA+ID4gdmlhIEplbnMgV2lrbGFuZGVyJ3MgdHJlZS4KPiA+ID4gPiA+IElmIHRo
aXMgaXMgZG9uZSB0aGUgZGVwZW5kZW5jaWVzIGluIHRoaXMgc2VyaWVzIGFyZSBob25vcmVkLCBp
biBjYXNlIHRoZQo+ID4gPiA+ID4gcGxhbiBjaGFuZ2VzOiBQYXRjaGVzICM0IC0gIzE3IGRlcGVu
ZCBvbiB0aGUgZmlyc3QgdHdvLgo+ID4gPiA+ID4KPiA+ID4gPiA+IE5vdGUgdGhpcyBzZXJpZXMg
aXMgb25seSBidWlsZCB0ZXN0ZWQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gVXdlIEtsZWluZS1Lw7Zu
aWcgKDE3KToKPiA+ID4gPiA+ICAgdGVlOiBBZGQgc29tZSBoZWxwZXJzIHRvIHJlZHVjZSBib2ls
ZXJwbGF0ZSBmb3IgdGVlIGNsaWVudCBkcml2ZXJzCj4gPiA+ID4gPiAgIHRlZTogQWRkIHByb2Jl
LCByZW1vdmUgYW5kIHNodXRkb3duIGJ1cyBjYWxsYmFja3MgdG8gdGVlX2NsaWVudF9kcml2ZXIK
PiA+ID4gPiA+ICAgdGVlOiBBZGFwdCBkb2N1bWVudGF0aW9uIHRvIGNvdmVyIHJlY2VudCBhZGRp
dGlvbnMKPiA+ID4gPiA+ICAgaHdybmc6IG9wdGVlIC0gTWFrZSB1c2Ugb2YgbW9kdWxlX3RlZV9j
bGllbnRfZHJpdmVyKCkKPiA+ID4gPiA+ICAgaHdybmc6IG9wdGVlIC0gTWFrZSB1c2Ugb2YgdGVl
IGJ1cyBtZXRob2RzCj4gPiA+ID4gPiAgIHJ0Yzogb3B0ZWU6IE1pZ3JhdGUgdG8gdXNlIHRlZSBz
cGVjaWZpYyBkcml2ZXIgcmVnaXN0cmF0aW9uIGZ1bmN0aW9uCj4gPiA+ID4gPiAgIHJ0Yzogb3B0
ZWU6IE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9kcwo+ID4gPiA+ID4gICBlZmk6IHN0bW06IE1h
a2UgdXNlIG9mIG1vZHVsZV90ZWVfY2xpZW50X2RyaXZlcigpCj4gPiA+ID4gPiAgIGVmaTogc3Rt
bTogTWFrZSB1c2Ugb2YgdGVlIGJ1cyBtZXRob2RzCj4gPiA+ID4gPiAgIGZpcm13YXJlOiBhcm1f
c2NtaTogb3B0ZWU6IE1ha2UgdXNlIG9mIG1vZHVsZV90ZWVfY2xpZW50X2RyaXZlcigpCj4gPiA+
ID4gPiAgIGZpcm13YXJlOiBhcm1fc2NtaTogTWFrZSB1c2Ugb2YgdGVlIGJ1cyBtZXRob2RzCj4g
PiA+ID4gPiAgIGZpcm13YXJlOiB0ZWVfYm54dDogTWFrZSB1c2Ugb2YgbW9kdWxlX3RlZV9jbGll
bnRfZHJpdmVyKCkKPiA+ID4gPiA+ICAgZmlybXdhcmU6IHRlZV9ibnh0OiBNYWtlIHVzZSBvZiB0
ZWUgYnVzIG1ldGhvZHMKPiA+ID4gPiA+ICAgS0VZUzogdHJ1c3RlZDogTWlncmF0ZSB0byB1c2Ug
dGVlIHNwZWNpZmljIGRyaXZlciByZWdpc3RyYXRpb24KPiA+ID4gPiA+ICAgICBmdW5jdGlvbgo+
ID4gPiA+ID4gICBLRVlTOiB0cnVzdGVkOiBNYWtlIHVzZSBvZiB0ZWUgYnVzIG1ldGhvZHMKPiA+
ID4gPiA+ICAgdHBtL3RwbV9mdHBtX3RlZTogTWFrZSB1c2Ugb2YgdGVlIHNwZWNpZmljIGRyaXZl
ciByZWdpc3RyYXRpb24KPiA+ID4gPiA+ICAgdHBtL3RwbV9mdHBtX3RlZTogTWFrZSB1c2Ugb2Yg
dGVlIGJ1cyBtZXRob2RzCj4gPiA+ID4gPgo+ID4gPiA+ID4gIERvY3VtZW50YXRpb24vZHJpdmVy
LWFwaS90ZWUucnN0ICAgICAgICAgICAgIHwgMTggKy0tLS0KPiA+ID4gPiA+ICBkcml2ZXJzL2No
YXIvaHdfcmFuZG9tL29wdGVlLXJuZy5jICAgICAgICAgICB8IDI2ICsrLS0tLQo+ID4gPiA+ID4g
IGRyaXZlcnMvY2hhci90cG0vdHBtX2Z0cG1fdGVlLmMgICAgICAgICAgICAgIHwgMzEgKysrKyst
LS0KPiA+ID4gPiA+ICBkcml2ZXJzL2Zpcm13YXJlL2FybV9zY21pL3RyYW5zcG9ydHMvb3B0ZWUu
YyB8IDMyICsrKy0tLS0tCj4gPiA+ID4gPiAgZHJpdmVycy9maXJtd2FyZS9icm9hZGNvbS90ZWVf
Ym54dF9mdy5jICAgICAgfCAzMCArKy0tLS0tCj4gPiA+ID4gPiAgZHJpdmVycy9maXJtd2FyZS9l
Zmkvc3RtbS90ZWVfc3RtbV9lZmkuYyAgICAgfCAyNSArKy0tLS0KPiA+ID4gPiA+ICBkcml2ZXJz
L3J0Yy9ydGMtb3B0ZWUuYyAgICAgICAgICAgICAgICAgICAgICB8IDI3ICsrLS0tLS0KPiA+ID4g
PiA+ICBkcml2ZXJzL3RlZS90ZWVfY29yZS5jICAgICAgICAgICAgICAgICAgICAgICB8IDg0ICsr
KysrKysrKysrKysrKysrKysrCj4gPiA+ID4gPiAgaW5jbHVkZS9saW51eC90ZWVfZHJ2LmggICAg
ICAgICAgICAgICAgICAgICAgfCAxMiArKysKPiA+ID4gPiA+ICBzZWN1cml0eS9rZXlzL3RydXN0
ZWQta2V5cy90cnVzdGVkX3RlZS5jICAgICB8IDE3ICsrLS0KPiA+ID4gPiA+ICAxMCBmaWxlcyBj
aGFuZ2VkLCAxNjQgaW5zZXJ0aW9ucygrKSwgMTM4IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4KPiA+
ID4gPiA+IGJhc2UtY29tbWl0OiA4ZjBiNGNjZTQ0ODFmYjIyNjUzNjk3Y2NlZDhkMGQwNDAyN2Ni
MWU4Cj4gPiA+ID4gPiAtLQo+ID4gPiA+ID4gMi40Ny4zCj4gPiA+ID4gPgo+ID4gPiA+Cj4gPiA+
ID4gVGhhbmsgeW91IGZvciB0aGUgbmljZSBjbGVhbnVwLCBVd2UuCj4gPiA+ID4KPiA+ID4gPiBJ
J3ZlIGFwcGxpZWQgcGF0Y2ggMS0zIHRvIHRoZSBicmFuY2ggdGVlX2J1c19jYWxsYmFja19mb3Jf
Ni4yMCBpbiBteQo+ID4gPiA+IHRyZWUgYXQgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvamVuc3dpL2xpbnV4LXRlZS5naXQvCj4gPiA+ID4KPiA+ID4gPiBU
aGUgYnJhbmNoIGlzIGJhc2VkIG9uIHY2LjE5LXJjMSwgYW5kIEknbGwgdHJ5IHRvIGtlZXAgaXQg
c3RhYmxlIGZvcgo+ID4gPiA+IG90aGVycyB0byBkZXBlbmQgb24sIGlmIG5lZWRlZC4gTGV0J3Mg
c2VlIGlmIHdlIGNhbiBhZ3JlZSBvbiB0YWtpbmcKPiA+ID4gPiB0aGUgcmVtYWluaW5nIHBhdGNo
ZXMgdmlhIHRoYXQgYnJhbmNoLgo+ID4gPgo+ID4gPiA2IGFuZCA3IGNhbiBnbyB0aHJvdWdoIHlv
dXIgYnJhbmNoLgo+ID4KPiA+IEdvb2QsIEkndmUgYWRkZWQgdGhlbSB0byBteSBicmFuY2ggbm93
Lgo+IAo+IFRoaXMgZW50aXJlIHBhdGNoIHNldCBzaG91bGQgZ28gaW4gZHVyaW5nIGEgc2luZ2xl
IG1lcmdlIHdpbmRvdy4gSQo+IHdpbGwgbm90IHNlbmQgYW55IHB1bGwgcmVxdWVzdCB1bnRpbCBJ
J20gc3VyZSBhbGwgcGF0Y2hlcyB3aWxsIGJlCj4gbWVyZ2VkLgo+IAo+IFNvIGZhciAoaWYgSSdt
IG5vdCBtaXN0YWtlbiksIG9ubHkgdGhlIHBhdGNoZXMgSSd2ZSBhbHJlYWR5IGFkZGVkIHRvCj4g
bmV4dCBoYXZlIGFwcGVhcmVkIG5leHQuIEkgY2FuIHRha2UgdGhlIHJlc3Qgb2YgdGhlIHBhdGNo
ZXMsIHRvbywgYnV0Cj4gSSBuZWVkIE9LIGZvciB0aGUgZm9sbG93aW5nOgo+IAoKWy4uLl0KCj4g
Cj4gU3VkZWVwLCB5b3Ugc2VlbSBoYXBweSB3aXRoIHRoZSBmb2xsb3dpbmcgcGF0Y2hlcwo+IC0g
ZmlybXdhcmU6IGFybV9zY21pOiBvcHRlZTogTWFrZSB1c2Ugb2YgbW9kdWxlX3RlZV9jbGllbnRf
ZHJpdmVyKCkKPiAtIGZpcm13YXJlOiBhcm1fc2NtaTogTWFrZSB1c2Ugb2YgdGVlIGJ1cyBtZXRo
b2RzCj4gT0sgaWYgSSB0YWtlIHRoZW0gdmlhIG15IHRyZWUsIG9yIHdvdWxkIHlvdSByYXRoZXIg
dGFrZSB0aGVtIHlvdXJzZWxmPwo+CgpJIGFtIGhhcHB5IGlmIHlvdSB3YW50IHRvIHRha2UgYWxs
IG9mIHRoZW0gaW4gb25lIGdvLiBJIHRoaW5rIEkgaGF2ZQphbHJlYWR5IGFja2VkIGl0LiBQbGVh
c2Ugc2hvdXQgaWYgeW91IG5lZWQgYW55dGhpbmcgZWxzZSBmcm9tIG1lLCBoYXBweSB0bwpoZWxw
IGluIGFueXdheSB0byBtYWtlIGl0IGVhc2llciB0byBoYW5kbGUgdGhpcyBjaGFuZ2Ugc2V0LgoK
LS0gClJlZ2FyZHMsClN1ZGVlcApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
