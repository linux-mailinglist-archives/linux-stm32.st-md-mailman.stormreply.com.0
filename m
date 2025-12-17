Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEF0CC6711
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Dec 2025 08:56:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA30BC01FBF;
	Wed, 17 Dec 2025 07:55:59 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8A81C35E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 07:55:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1C1A44435B;
 Wed, 17 Dec 2025 07:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B78C4CEF5;
 Wed, 17 Dec 2025 07:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765958157;
 bh=Xo9c1qEYiQMSvCEooBFQkEOr2bYPsShQNIttr2X1DG8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ELlSPoe46Vp/wKpVK3LLNZx61ZRTeN9a8aiwZ+dBOq6JSgu8lT1rxJ3wY80rxeXhw
 OZrPCLpEBFk6TLKFBA5pONUweIEe6/iPED+L08U/dXepE25vl89hRZiQ/FCns7UqdC
 coya/6tg0ImJ/cGQDCryPzjE8vQi9Nqu3aUuHEAmYgRVp1m3qEkelGkvr/TPOrnFV9
 yhPHmKfYuEbW8BihXNYfIx3rYzf4yaVAhlcte6H35pz0VG5SbKINKXAIGTAmOGvHIK
 XqbbXlo5Mxru1Gcnu0BaAUfhCIDC3t50dTRFkXYmmP/w7QngJootP/5QLOgvwTke2k
 Z91VDTNTIflIw==
Date: Wed, 17 Dec 2025 13:25:39 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Message-ID: <aUJh--HGVeJWIilS@sumit-xelite>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <aT--ox375kg2Mzh-@sumit-X1>
 <dhunzydod4d7vj73llpuqemxb5er2ja4emxusr66irwf77jhhb@es4yd2axzl25>
 <CAGptzHOOqLhBnAXDURAzkgckUvRr__UuF1S_7MLV0u-ZxYEdyA@mail.gmail.com>
 <ayebinxqpcnl7hpa35ytrudiy7j75u5bdk3enlirkp5pevppeg@6mx6a5fwymwf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ayebinxqpcnl7hpa35ytrudiy7j75u5bdk3enlirkp5pevppeg@6mx6a5fwymwf>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-efi@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>, Ard Biesheuvel <ardb@kernel.org>,
 linux-rtc@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-security-module@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 James Morris <jmorris@namei.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jason Gunthorpe <jgg@ziepe.ca>, Cristian Marussi <cristian.marussi@arm.com>,
 arm-scmi@vger.kernel.org,
 =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, op-tee@lists.trustedfirmware.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Olivia Mackall <olivia@selenic.com>, Michael Chan <michael.chan@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Paul Moore <paul@paul-moore.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>,
 linux-integrity@vger.kernel.org, Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v1 00/17] tee: Use bus callbacks instead
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

T24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgMTI6MDg6MzhQTSArMDEwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gSGVsbG8sCj4gCj4gT24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgMDE6MDg6MzhQ
TSArMDUzMCwgU3VtaXQgR2FyZyB3cm90ZToKPiA+IE9uIE1vbiwgRGVjIDE1LCAyMDI1IGF0IDM6
MDLigK9QTSBVd2UgS2xlaW5lLUvDtm5pZwo+ID4gPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5j
b20+IHdyb3RlOgo+ID4gPiBPbiBNb24sIERlYyAxNSwgMjAyNSBhdCAwNDo1NDoxMVBNICswOTAw
LCBTdW1pdCBHYXJnIHdyb3RlOgo+ID4gPiA+IEZlZWwgZnJlZSB0byBtYWtlIHRoZSB0ZWVfYnVz
X3R5cGUgcHJpdmF0ZSBhcyB0aGUgbGFzdCBwYXRjaCBpbiB0aGUgc2VyaWVzCj4gPiA+ID4gc3Vj
aCB0aGF0IGFueSBmb2xsb3d1cCBkcml2ZXIgZm9sbG93cyB0aGlzIGNsZWFuIGFwcHJvYWNoLgo+
ID4gPgo+ID4gPiBUaGVyZSBpcyBhIGJpdCBtb3JlIHRvIGRvIGZvciB0aGF0IHRoYW4gSSdtIHdp
bGxpbmcgdG8gaW52ZXN0LiBXaXRoIG15Cj4gPiA+IHBhdGNoIHNlcmllcyBhcHBsaWVkIGB0ZWVf
YnVzX3R5cGVgIGlzIHN0aWxsIHVzZWQgaW4KPiA+ID4gZHJpdmVycy90ZWUvb3B0ZWUvZGV2aWNl
LmMgYW5kIGRyaXZlcnMvdGVlL3RlZV9jb3JlLmMuCj4gPiAKPiA+IE9oIEkgc2VlLCBJIGd1ZXNz
IHdlIG5lZWQgdG8gY29tZSB3aXRoIHNvbWUgaGVscGVycyBhcm91bmQgZGV2aWNlCj4gPiByZWdp
c3Rlci91bnJlZ2lzdGVyIGZyb20gVEVFIHN1YnN5c3RlbSBhcyB3ZWxsLiBMZXQncyBwbGFuIHRo
YXQgZm9yIGEKPiA+IGZvbGxvd3VwIHBhdGNoLXNldCwgSSBkb24ndCB3YW50IHRoaXMgcGF0Y2gt
c2V0IHRvIGJlIGJsb2F0ZWQgbW9yZS4KPiAKPiBEb24ndCBjb25zaWRlciBtZSBpbiBmb3IgdGhh
dC4gQnV0IGl0IHNvdW5kcyBsaWtlIGEgbmljZSBhZGRpdGlvbi4KPgoKTm8gd29ycmllcywgdGhl
IGN1cnJlbnQgY2xlYW51cCBpcyBmaW5lIGZvciBub3cuCgo+ID4gPiBNYXliZSBpdCdzCj4gPiA+
IHNlbnNpYmxlIHRvIG1lcmdlIHRoZXNlIHR3byBmaWxlcyBpbnRvIGEgc2luZ2xlIG9uZS4KPiA+
IAo+ID4gSXQncyBub3QgcG9zc2libGUgYXMgdGhlIGRlc2lnbiBmb3IgVEVFIGJ1cyBpcyB0byBo
YXZlIFRFRQo+ID4gaW1wbGVtZW50YXRpb24gZHJpdmVycyBsaWtlIE9QLVRFRSwgQU1ELVRFRSwg
VFMtVEVFLCBRVEVFIGFuZCBzbyBvbiB0bwo+ID4gcmVnaXN0ZXIgZGV2aWNlcyBvbiB0aGUgYnVz
Lgo+IAo+IFNvIG9ubHkgT1AtVEVFIHVzZXMgdGhlIGJ1cyBmb3IgZGV2aWNlcyBhbmQgdGhlIG90
aGVyICotVEVFIGRvbid0LiBBbHNvCj4gc291bmRzIGxpa2Ugc29tZXRoaW5nIHdvcnRoIHRvIGJl
IGZpeGVkLgoKVGhlIFRFRSBidXMgaXMgY29tbW9uIGZvciBhbGwgdGhlIFRFRSBpbXBsZW1lbnRh
dGlvbiBkcml2ZXJzIHdoaWNoIG5lZWQKdG8gc3VwcG9ydCBrZXJuZWwgVEVFIGNsaWVudCBkcml2
ZXJzLiBJIGFtIGF3YXJlIHRoZXJlIHdpbGwgYmUgUVRFRSBhbmQKVFMtVEVFIGZyb20gcGFzdCBk
aXNjdXNzaW9uIHRoYXQgdGhleSB3aWxsIGJlIGV4cG9zaW5nIGRldmljZXMgb24gdGhlClRFRSBi
dXMuCgo+IAo+ID4gPiBUaGUgdGhpbmdzIEkgd29uZGVyIGFib3V0IGFkZGl0aW9uYWxseSBhcmU6
Cj4gPiA+Cj4gPiA+ICAtIGlmIENPTkZJR19PUFRFRT1uIGFuZCBDT05GSUdfVEVFPXl8bSB0aGUg
dGVlIGJ1cyBpcyBvbmx5IHVzZWQgZm9yCj4gPiA+ICAgIGRyaXZlcnMgYnV0IG5vdCBkZXZpY2Vz
Lgo+ID4gCj4gPiBZZWFoIHNpbmNlIHRoZSBkZXZpY2VzIGFyZSByYXRoZXIgYWRkZWQgYnkgdGhl
IFRFRSBpbXBsZW1lbnRhdGlvbiBkcml2ZXIuCj4gPiAKPiA+ID4KPiA+ID4gIC0gb3B0ZWVfcmVn
aXN0ZXJfZGV2aWNlKCkgY2FsbHMgZGV2aWNlX2NyZWF0ZV9maWxlKCkgb24KPiA+ID4gICAgJm9w
dGVlX2RldmljZS0+ZGV2IGFmdGVyIGRldmljZV9yZWdpc3Rlcigmb3B0ZWVfZGV2aWNlLT5kZXYp
Lgo+ID4gPiAgICAoQXR0ZW50aW9uIGhhbGYta25vd2xlZGdlISkgSSB0aGluayBkZXZpY2VfY3Jl
YXRlX2ZpbGUoKSBzaG91bGQgbm90Cj4gPiA+ICAgIGJlIGNhbGxlZCBvbiBhbiBhbHJlYWR5IHJl
Z2lzdGVyZWQgZGV2aWNlIChvciB5b3UgaGF2ZSB0byBzZW5kIGEKPiA+ID4gICAgdWV2ZW50IGFm
dGVyd2FyZHMpLiBUaGlzIHNob3VsZCBwcm9iYWJseSB1c2UgdHlwZSBhdHRyaWJ1dGUgZ3JvdXBz
Lgo+ID4gPiAgICAoT3IgdGhlIG5lZWRfc3VwcGxpY2FudCBhdHRyaWJ1dGUgc2hvdWxkIGJlIGRy
b3BwZWQgYXMgaXQgaXNuJ3QgdmVyeQo+ID4gPiAgICB1c2VmdWwuIFRoaXMgd291bGQgbWF5YmUg
YmUgY29uc2lkZXJlZCBhbiBBQkkgY2hhbmdlIGhvd2V2ZXIuKQo+ID4gCj4gPiBUaGUgcmVhc29u
aW5nIGZvciB0aGlzIGF0dHJpYnV0ZSBzaG91bGQgYmUgZXhwbGFpbmVkIGJ5IGNvbW1pdDoKPiA+
IDcyNjljYmE1M2Q5MCAoInRlZTogb3B0ZWU6IEZpeCBzdXBwbGljYW50IGJhc2VkIGRldmljZSBl
bnVtZXJhdGlvbiIpLgo+ID4gSW4gc3VtbWFyeSBpdCdzIGR1ZSB0byBhIHdlaXJkIGRlcGVuZGVu
Y3kgZm9yIGRldmljZXMgd2UgaGF2ZSB3aXRoIHRoZQo+ID4gdXNlci1zcGFjZSBkYWVtb246IHRl
ZS1zdXBwbGljYW50Lgo+IAo+IEZyb20gcmVhZGluZyB0aGF0IG9uY2UgSSBkb24ndCB1bmRlcnN0
YW5kIGl0LiAoQnV0IG5vIG5lZWQgdG8gZXhwbGFpbgo+IDotKQo+IAo+IFN0aWxsIHRoZSBmaWxl
IHNob3VsZCBiZXR0ZXIgYmUgYWRkZWQgYmVmb3JlIGRldmljZV9hZGQoKSBpcyBjYWxsZWQuCgpO
b3RlZCwgbGV0IG1lIHNlZSBpZiBJIGNhbiBnZXQgdG8gZml4IHRoaXMgdW50aWwgc29tZW9uZSBq
dW1wcyBpbiBiZWZvcmUKbWUuCgo+IAo+ID4gPiAgLSBXaHkgZG9lcyBvcHRlZV9wcm9iZSgpIGlu
IGRyaXZlcnMvdGVlL29wdGVlL3NtY19hYmkuYyB1bnJlZ2lzdGVyIGFsbAo+ID4gPiAgICBvcHRl
ZSBkZXZpY2VzIGluIGl0cyBlcnJvciBwYXRoIChvcHRlZV91bnJlZ2lzdGVyX2RldmljZXMoKSk/
Cj4gPiAKPiA+IFRoaXMgaXMgbW9zdGx5IHRvIHRha2UgY2FyZSBvZiBpZiBhbnkgZGV2aWNlIGdv
dCByZWdpc3RlcmVkIGJlZm9yZSB0aGUKPiA+IGZhaWx1cmUgb2NjdXJlZC4gTGV0IG1lIGtub3cg
aWYgeW91IGhhdmUgYSBiZXR0ZXIgd2F5IHRvIGFkZHJlc3MgdGhhdC4KPiAKPiBXaXRob3V0IHVu
ZGVyc3RhbmRpbmcgdGhlIHRlZSBzdHVmZiwgSSdkIHNheTogRG9uJ3QgYm90aGVyIGFuZCBvbmx5
IHVuZG8KPiB0aGUgdGhpbmdzIHRoYXQgcHJvYmUgZGlkIGJlZm9yZSB0aGUgZmFpbHVyZS4KPiAK
ClRydWUsIGJ1dCB0aGlzIGlzIHNwZWNpYWwgY2FzZSB3aGVyZSBpZiB0aGVyZSBpcyBhbnkgbGVm
dG92ZXIgZGV2aWNlCnJlZ2lzdGVyZWQgZnJvbSB0aGUgVEVFIGltcGxlbWVudGF0aW9uIHRoZW4g
aXQgaXMgbGlrZWx5IGdvaW5nIHRvIGNhdXNlCnRoZSBjb3JyZXNwb25kaW5nIGtlcm5lbCBjbGll
bnQgZHJpdmVyIGNyYXNoLgoKLVN1bWl0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
