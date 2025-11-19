Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F38FC6FBF8
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Nov 2025 16:47:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4B70C36B30;
	Wed, 19 Nov 2025 15:47:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9B7DC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 15:47:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D376360172;
 Wed, 19 Nov 2025 15:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B901DC4AF4D;
 Wed, 19 Nov 2025 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763567252;
 bh=vicgZe2Av/U4KqK6bau+u9mHI2W4ZvV0ci7Vd1xAaJg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m/iaFsAPw27Vo7KL+xOhpzChl9HwgPS91l9ZE9SkAkJCY2UaBQjQUzZhvNSIU0aTR
 mjUaPeN+1DpNB9Eu/vA1eUJYgT/Pfoz+V8332karyPbvh9E4dsexBeWKPFw55pyc5w
 HOGrzUy9f5ifz0axsOzC6LhDxNWcDYaObz3ObyauHXxPC+VgMvQ70Q1eU9tbDf32hH
 WGrz9JsHF69HhZs+dekb6hrSb9slrHLfcIHBv4S1HO+h5iw9cAoF4bPD8b5OP2vbtO
 SRL79BsrKKpcZJXfElkS5n7zaxeL8O3UTaUS7UCPqvj9+IRbu++GiYLfOBTOWVIqKP
 yj4TrAxEVZH9Q==
Date: Wed, 19 Nov 2025 21:17:18 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <k72rxq2j5hbpotgmshwau6tvvem3jnldahxxgg54qoxjs7jaxb@bgh4cgs5j25h>
References: <20251118212818.GA2591668@bhelgaas>
 <7053f336-59c9-47cc-ac97-eb2f0916ac4f@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7053f336-59c9-47cc-ac97-eb2f0916ac4f@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] PCI: stm32: Fix LTSSM EP race with start
	link.
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

T24gV2VkLCBOb3YgMTksIDIwMjUgYXQgMDQ6MTM6NDdQTSArMDEwMCwgQ2hyaXN0aWFuIEJydWVs
IHdyb3RlOgo+IAo+IAo+IE9uIDExLzE4LzI1IDIyOjI4LCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+
ID4gWytjYyBMdWthcyBpbiBjYXNlIEkgZ290IHRoZSBwY2llaHAgcGFydCB3cm9uZ10KPiA+IAo+
IAo+ID4gCj4gPiBUbyBiYWNrIHVwIGhlcmUsIEknbSB0cnlpbmcgdG8gdW5kZXJzdGFuZCB0aGUg
cmFjZS4KPiA+IAo+ID4gSUlVQyB0aGUgcmVsZXZhbnQgZXZlbnRzIGFyZSBsaW5rIHRyYWluaW5n
IGFuZCByZWdpc3RlciBpbml0LiAgSW4gdGhlCj4gPiBjdXJyZW50IHN0bTMyIEVQIGRyaXZlciwg
bGluayB0cmFpbmluZyBjYW4gc3RhcnQgd2hlbiB0aGUgRVAgdXNlcnNwYWNlCj4gPiB3cml0ZXMg
dG8gdGhlICdzdGFydCcgY29uZmlnZnMgZmlsZS4gIEFuZCB0aGUgcmVnaXN0ZXIgaW5pdCBoYXBw
ZW5zCj4gPiB3aGVuIHN0bTMyX3BjaWVfZXBfcGVyc3RfaXJxX3RocmVhZCgpIGNhbGxzCj4gPiBk
d19wY2llX2VwX2luaXRfcmVnaXN0ZXJzKCkuCj4gPiAKPiA+IFNvIEkgZ3Vlc3MgdGhlIHByb2Js
ZW0gaXMgd2hlbiB0aGUgRVAgdXNlcnNwYWNlIGVuYWJsZXMgdGhlIExUU1NNCj4gPiBiZWZvcmUg
dGhlIGhvc3QgZGVhc3NlcnRzIFBFUlNUIz8gIEFuZCB0aGUgbGluayB0cmFpbiBtYXkgY29tcGxl
dGUKPiA+IGJlZm9yZSBzdG0zMl9wY2llX2VwX3BlcnN0X2lycV90aHJlYWQoKSBydW5zPwo+IAo+
IFRoZSBzZXF1ZW5jZSBhbHNvIHZpb2xhdGVkIHRoZSBzcGVjICg0LjAsIFNlY3Rpb24gNi42LjEg
IkNvbnZlbnRpb25hbAo+IFJlc2V0IiksIGJlY2F1c2UgaXQgYWxsb3dlZCB0aGUgZW5kcG9pbnQg
dG8gZW50ZXIgdGhlIERldGVjdCBzdGF0ZSBiZWZvcmUKPiBQRVJTVCMgaXMgZGVhc3NlcnRlZAo+
IAo+ID4gCj4gPiBBbmQgdGhlIGZpeCBoZXJlIGlzIHRvIGRlbGF5IGVuYWJsaW5nIHRoZSBFUCBM
VFNTTSB1bnRpbCBhZnRlcgo+ID4gc3RtMzJfcGNpZV9wZXJzdF9kZWFzc2VydCgpIGNhbGxzIGR3
X3BjaWVfZXBfaW5pdF9yZWdpc3RlcnMoKT8KPiA+IAo+IAo+ID4gCj4gPiBJIHRoaW5rIHdlIHdv
dWxkIHByZWZlciBpZiB0aGUgaG9zdCB3b3VsZCBlbnVtZXJhdGUgdGhlIGVuZHBvaW50Cj4gPiB3
aGVuZXZlciB0aGUgZW5kcG9pbnQgYmVjb21lcyByZWFkeSwgZXZlbiBpZiB0aGF0IGlzIGFmdGVy
IHRoZSBob3N0J3MKPiA+IGluaXRpYWwgZW51bWVyYXRpb24sIGJ1dCBJIGd1ZXNzIHRoYXQncyBv
bmx5IHBvc3NpYmxlIGlmIHRoZSBob3N0IGlzCj4gPiBub3RpZmllZCB3aGVuIHRoZSBsaW5rIGNv
bWVzIHVwLgo+ID4gCj4gPiBUaGUgbWFpbiBtZWNoYW5pc20gZm9yIHRoYXQgaXMgaG90cGx1Zywg
aS5lLiwgcGNpZWhwIGhhbmRsZXMgcHJlc2VuY2UKPiA+IGRldGVjdCBhbmQgbGluayBsYXllciBz
dGF0ZSBjaGFuZ2VkIGV2ZW50cywgYm90aCBvZiB3aGljaCBhcmUgbWFuYWdlZAo+ID4gYnkgdGhl
IFBDSWUgU2xvdCByZWdpc3RlciBzZXQuICBUaG9zZSByZWdpc3RlcnMgYXJlIG9wdGlvbmFsIGFu
ZCBtYXkKPiA+IG5vdCBiZSBpbXBsZW1lbnRlZCwgZS5nLiwgaWYgYSBSb290IFBvcnQgaXMgY29u
bmVjdGVkIHRvIGEKPiA+IHN5c3RlbS1pbnRlZ3JhdGVkIGRldmljZS4KPiA+IAo+ID4gQnV0IGlm
IHRoZXkgKmFyZSogaW1wbGVtZW50ZWQsIEkgaG9wZSB0aGF0IHBjaWVocCBtYWtlcyBpdCBzbyBu
byB1c2VyCj4gPiBpbnRlcnZlbnRpb24gb24gdGhlIGhvc3Qgc2lkZSBpcyByZXF1aXJlZC4KPiA+
IAo+IAo+IAo+IEkgc3VwcG9zZSB0aGF0IGhvdHBsdWcgY2Fubm90IGJlIGltcGxlbWVudGVkIHdp
dGhvdXQgc29tZSBraW5kIG9mIHByZXNlbmNlCj4gZGV0ZWN0aW9uIHNpZ25hbCBmcm9tIHRoZSBF
UCAoUFJTTlQjLCAuLi4pID8gRm9yIG5vdyB3ZSBoYXZlIG5vCj4gaW1wbGVtZW50YXRpb24gdG8g
c3VwcG9ydCB0aGlzIChmcm9tIGdwaW8gb3Igb3RoZXIpLgo+IAoKTW9zdCBvZiB0aGUgbm9uLVBD
L1NlcnZlciBwbGF0Zm9ybXMgZG8gbm90IGhhdmUgaG90IHBsdWdnYWJsZSBjb25uZWN0b3JzLiBT
byB0aGUKbGFjayBvZiBQUlNOVCMgc2lnbmFsIGlzIHZlcnkgY29tbW9uLgoKPiBIb3dldmVyLCB1
c2luZyBhIFBDIGhvc3QsIEkgb2JzZXJ2ZSB0aGF0IHdoZW4gSSByZXN1bWUgdGhlIGhvc3QgZnJv
bSBQQ0llCj4gYXV0b3N1c3BlbmQsIGZvciBleGFtcGxlLCB3aXRoICdsc3BjaScsIFBFUlNUIyBp
cyBkZWFzc2VydGVkLCBhbmQgdGhlIHN0bTMyCj4gUENJZSBFUCBkZXZpY2UgaXMgY29ycmVjdGx5
IGVudW1lcmF0ZWQgd2l0aG91dCBhIG1hbnVhbCByZXNjYW4uIFNvIHRoYW5rcyB0bwo+IHBvd2Vy
IG1hbmFnZW1lbnQsIGEgZGV2aWNlIGNhbiBiZSBlbnVtZXJhdGVkIGFzeW5jaHJvbm91c2x5IGJ1
dCB3aGVuCj4gcmVxdWVzdGVkLCBub3Qgd2hlbiByZWFkeS4KPiAKCkkgd291bGQgYXNzdW1lIHRo
YXQgYW55IGhvc3Qgd2lsbCBkZWFzc2VydCBQRVJTVCMgZHVyaW5nIGJvb3QgaXRzZWxmLCBhbmQg
a2VlcAp0aGUgTFRTU00gaW4gTGluay5EZXRlY3QuIEJ1dCBpZiB0aGUgbGluayBpcyBub3QgZGV0
ZWN0ZWQsIGEgaG9zdCAqbWF5KiBhc3NlcnQKUEVSU1QjLiBBbmQgZHVyaW5nIHJlc3VtZSwgaXQg
d2lsbCB0cnkgdGhlIHNhbWUgc2VxdWVuY2UgYW5kIGlmIHlvdXIgZGV2aWNlIGlzCmNvbm5lY3Rl
ZCwgaXQgd2lsbCBnZXQgZW51bWVyYXRlZC4KCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+CuteCuo+Cv
jeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
