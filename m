Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A64ADBF0125
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Oct 2025 11:00:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59261C5A4DD;
	Mon, 20 Oct 2025 09:00:58 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C943C56616
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 09:00:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 41B524E411E3;
 Mon, 20 Oct 2025 09:00:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 14310606D5;
 Mon, 20 Oct 2025 09:00:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7EABE102F0848; 
 Mon, 20 Oct 2025 11:00:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760950851; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tPSoQs2CvGi5u9WAZU9trHNjsn5O33QJQeQZz6ZOGo8=;
 b=FWCLp+LymzTBtoxTpwCzYeqpC03RM5EI7AN7m04pAvK1k+3K7S9RkJKa6pxKOrt+rYFmhC
 TzdH1nu7WX2+ytv8jxRU37msTsvka2trXNIPTurDBqWBzyXvGqX4DPlZ3HD/aDIcvyOeMW
 EBmZzwmJStLSpTECQHbKP4h17C0oNr8BJCSaFRR2VINwm/jdSU+0RnPA9fqHOQuebw5zFg
 kamhtAmJBEGnhwkcK5Da+rZXiArfdes8X5DCXTBN/RPTjSaetFawm4FK4Yq5JF6clVjy8O
 I85axUH+b6Xe0ojYvTG7FwBzfKttPZzsrtiS/emYYBx+WPKDIXEJAPw0HvX/zQ==
Date: Mon, 20 Oct 2025 11:00:40 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20251020110040.18cf60c9@kmaincent-XPS-13-7390>
In-Reply-To: <d40cbc17-22fa-4829-8eb0-e9fd26fc54b1@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015102725.1297985-3-maxime.chevallier@bootlin.com>
 <20251017182358.42f76387@kernel.org>
 <d40cbc17-22fa-4829-8eb0-e9fd26fc54b1@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: Allow
 supporting coarse adjustment mode
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

T24gU2F0LCAxOCBPY3QgMjAyNSAwOTo0Mjo1NyArMDIwMApNYXhpbWUgQ2hldmFsbGllciA8bWF4
aW1lLmNoZXZhbGxpZXJAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBIaSBKYWt1YiwKPiAKPiBPbiAx
OC8xMC8yMDI1IDAzOjIzLCBKYWt1YiBLaWNpbnNraSB3cm90ZToKPiA+IE9uIFdlZCwgMTUgT2N0
IDIwMjUgMTI6Mjc6MjIgKzAyMDAgTWF4aW1lIENoZXZhbGxpZXIgd3JvdGU6ICAKPiA+PiBUaGUg
RFdNQUMxMDAwIHN1cHBvcnRzIDIgdGltZXN0YW1waW5nIGNvbmZpZ3VyYXRpb25zIHRvIGNvbmZp
Z3VyZSBob3cKPiA+PiBmcmVxdWVuY3kgYWRqdXN0bWVudHMgYXJlIG1hZGUgdG8gdGhlIHB0cF9j
bG9jaywgYXMgd2VsbCBhcyB0aGUgcmVwb3J0ZWQKPiA+PiB0aW1lc3RhbXAgdmFsdWVzLgo+ID4+
Cj4gPj4gVGhlcmUgd2FzIGEgcHJldmlvdXMgYXR0ZW1wdCBhdCB1cHN0cmVhbWluZyBzdXBwb3J0
IGZvciBjb25maWd1cmluZyB0aGlzCj4gPj4gbW9kZSBieSBPbGl2aWVyIERhdXRyaWNvdXJ0IGFu
ZCBKdWxpZW4gQmVyYXVkIGEgZmV3IHllYXJzIGJhY2sgWzFdCj4gPj4KPiA+PiBJbiBhIG51dHNo
ZWxsLCB0aGUgdGltZXN0YW1waW5nIGNhbiBiZSBlaXRoZXIgc2V0IGluIGZpbmUgbW9kZSBvciBp
bgo+ID4+IGNvYXJzZSBtb2RlLgo+ID4+Cj4gPj4gSW4gZmluZSBtb2RlLCB3aGljaCBpcyB0aGUg
ZGVmYXVsdCwgd2UgdXNlIHRoZSBvdmVyZmxvdyBvZiBhbiBhY2N1bXVsYXRvcgo+ID4+IHRvIHRy
aWdnZXIgZnJlcXVlbmN5IGFkanVzdG1lbnRzLCBidXQgYnkgZG9pbmcgc28gd2UgbG9zZSBwcmVj
aXNpb24gb24gdGhlCj4gPj4gdGltZXRhbXBzIHRoYXQgYXJlIHByb2R1Y2VkIGJ5IHRoZSB0aW1l
c3RhbXBpbmcgdW5pdC4gVGhlIG1haW4gZHJhd2JhY2sKPiA+PiBpcyB0aGF0IHRoZSBzdWItc2Vj
b25kIGluY3JlbWVudCB2YWx1ZSwgdXNlZCB0byBnZW5lcmF0ZSB0aW1lc3RhbXBzLCBjYW4ndAo+
ID4+IGJlIHNldCB0byBsb3dlciB0aGFuICgyIC8gcHRwX2Nsb2NrX2ZyZXEpLgo+ID4+Cj4gPj4g
VGhlICJmaW5lIiBxdWFsaWZpY2F0aW9uIGNvbWVzIGZyb20gdGhlIGZyZXF1ZW50IGZyZXF1ZW5j
eSBhZGp1c3RtZW50cyB3ZQo+ID4+IGFyZSBhYmxlIHRvIGRvLCB3aGljaCBpcyBwZXJmZWN0IGZv
ciBhIFBUUCBmb2xsb3dlciB1c2VjYXNlLgo+ID4+Cj4gPj4gSW4gQ29hcnNlIG1vZGUsIHdlIGRv
bid0IGRvIGZyZXF1ZW5jeSBhZGp1c3RtZW50cyBiYXNlZCBvbiBhbgo+ID4+IGFjY3VtdWxhdG9y
IG92ZXJmbG93LiBXZSBjYW4gdGhlcmVmb3JlIGhhdmUgdmVyeSBmaW5lIHN1YnNlY29uZAo+ID4+
IGluY3JlbWVudCB2YWx1ZXMsIGFsbG93aW5nIGZvciBiZXR0ZXIgdGltZXN0YW1waW5nIHByZWNp
c2lvbi4gSG93ZXZlcgo+ID4+IHRoaXMgbW9kZSB3b3JrcyBiZXN0IHdoZW4gdGhlIHB0cCBjbG9j
ayBmcmVxdWVuY3kgaXMgYWRqdXN0ZWQgYmFzZWQgb24KPiA+PiBhbiBleHRlcm5hbCBzaWduYWws
IHN1Y2ggYXMgYSBQUFMgaW5wdXQgcHJvZHVjZWQgYnkgYSBHUFMgY2xvY2suIFRoaXMKPiA+PiBt
b2RlIGlzIHRoZXJlZm9yZSBwZXJmZWN0IGZvciBhIEdyYW5kLW1hc3RlciB1c2VjYXNlLgo+ID4+
Cj4gPj4gV2UgdGhlcmVmb3JlIGF0dGVtcHQgdG8gbWFwIHRoZXNlIDIgbW9kZXMgd2l0aCB0aGUg
bmV3bHkgaW50cm9kdWNlZAo+ID4+IGh3dGltZXN0YW1wIHF1YWxpZmllcnMgKHByZWNpc2UgYW5k
IGFwcHJveCkuCj4gPj4KPiA+PiBQcmVjaXNlIG1vZGUgaXMgbWFwcGVkIHRvIHN0bW1hYyBmaW5l
IG1vZGUsIGFuZCBpcyB0aGUgZXhwZWN0ZWQgZGVmYXVsdCwKPiA+PiBzdWl0YWJsZSBmb3IgYWxs
IGNhc2VzIGFuZCBwZXJmZWN0IGZvciBmb2xsb3dlciBtb2RlCj4gPj4KPiA+PiBBcHByb3ggbW9k
ZSBpcyBtYXBwZWQgdG8gY29hcnNlIG1vZGUsIHN1aXRhYmxlIGZvciBHcmFuZC1tYXN0ZXIuICAK
PiA+IAo+ID4gSSBmYWlsZWQgdG8gdW5kZXJzdGFuZCB3aGF0IHRoaXMgZGV2aWNlIGRvZXMgYW5k
IHdoYXQgdGhlIHByb2JsZW0gaXMgOigKPiA+IAo+ID4gV2hhdCBpcyB5b3VyIHB0cF9jbG9ja19m
cmVxPyBJc24ndCBpdCBhcm91bmQgNTBNSHogdHlwaWNhbGx5PyAKPiA+IFNvIDIgLyBwdHBfZnJl
cSBpcyA0MG5zZWMgKD8pLCBub3QgdG9vIGJhZD8gIAo+IAo+IFRoYXQncyBub3QgdG9vIGJhZCBp
bmRlZWQsIGJ1dCBpdCBtYWtlcyBhIGRpZmZlcmVuY2Ugd2hlbiBhY3RpbmcgYXMKPiBHcmFuZCBN
YXN0ZXIsIGVzcGVjaWFsbHkgaW4gdGhpcyBjYXNlIGJlY2F1c2UgeW91IGRvbid0IG5lZWQgdG8K
PiBwZXJmb3JtIGNsb2NrIGFkanVzdG1lbnRzIChpdCdzIHN5bmMnZCB0aHJvdWdoIFBQUyBpbiks
IHNvIHdlIG1pZ2h0Cj4gYXMgd2VsbCB0YWtlIHRoaXMgb3Bwb3J0dW5pdHkgdG8gaW1wcm92ZSB0
aGUgVFMuCj4gCj4gPiAKPiA+IE15IHJlY29sbGVjdGlvbiBvZiB0aGUgaWRlYSBiZWhpbmQgdGhh
dCB0aW1lc3RhbXBpbmcgcHJvdmlkZXJzCj4gPiB3YXMgdGhhdCB5b3UgY2FuIGNvbmZpZ3VyZSBk
aWZmZXJlbnQgZmlsdGVycyBmb3IgZGlmZmVyZW50IHByb3ZpZGVycy4KPiA+IElPVyB0aGF0IHlv
dSdkIGJlIGFibGUgdG8gc2F5Ogo+ID4gIC0gW3ByZWNpc2VdIFJ4IHN0YW1wIFBUUCBwYWNrZXRz
IAo+ID4gIC0gIFthcHByb3hdIFJ4IHN0YW1wIGFsbCBwYWNrZXRzCj4gPiBub3QgdGhhdCB5b3Un
ZCBjb25maWd1cmUgcHJlY2lzaW9uIG9mIG9uZSBwaWVjZSBvZiBIVy4uICAKPiAKPiBTbyBmYXIg
aXQgbG9va3MgbGlrZSBvbmx5IG9uZSBwcm92aWRlciBpcyBlbmFibGVkIGF0IGEgZ2l2ZW4gdGlt
ZSwgbXkKPiB1bmRlcnN0YW5kaW5nIHdhcyB0aGF0IHRoZSBxdWFsaWZpZXIgd291bGQgYmUgdXNl
ZCBpbiBjYXNlIHRoZXJlCj4gYXJlIG11bHRpcGxlIHRpbWVzdGFtcGVycyBvbiB0aGUgZGF0YSBw
YXRoLCB0byBzZWxlY3QgdGhlIGJldHRlciBvbmUKPiAoZS5nLiBhIFBIWSB0aGF0IHN1cHBvcnRz
IFRTLCBhIE1BQyB0aGF0IHN1cHBvcnRzIFRTLCB3ZSB1c2UgdGhlIAo+IGJlc3Qgb3V0IG9mIHRo
ZSB0d28pLgoKTm8sIHdlIGRvIG5vdCBzdXBwb3J0IG11bHRpcGxlIHRpbWVzdGFtcGVycyBhdCB0
aGUgc2FtZSB0aW1lLgpGb3IgdGhhdCBJSVVDIHdlIHdvdWxkIGhhdmUgdG8gYWRkIGEgYW4gSUQg
b2YgdGhlIHNvdXJjZSBpbiB0aGUgcGFja2V0LiBJCnJlbWVtYmVyIHBlb3BsZSB3ZXJlIHRhbGtp
bmcgYWJvdXQgbW9kaWZ5aW5nIGNtc2cuIApUaGlzIHF1YWxpZmllciBpcyBpbmRlZWQgYSBmaXJz
dCBzdGVwIHRvIHdhbGsgdGhpcyBwYXRoIGJ1dCBJIGRvbid0IHRoaW5rCnBlb3BsZSBhcmUgY3Vy
cmVudGx5IHdvcmtpbmcgb24gYWRkaW5nIHRoaXMgc3VwcG9ydCBmb3Igbm93LiAKCj4gSG93ZXZl
ciBJIGFncmVlIHdpdGggeW91ciBjb21tZW50cywgdGhhdCdzIGV4YWN0bHkgdGhlIGtpbmQgb2Yg
ZmVlZGJhY2sKPiBJIHdhcyBsb29raW5nIGZvci4gVGhpcyB3b3JrIGhhcyBiZWVuIHRyaWVkIHNl
dmVyYWwgdGltZXMgbm93IGVhY2gKPiB0aW1lIHdpdGggYSBkaWZmZXJlbnQgdUFQSSBwYXRoLCBJ
J20gT0sgdG8gY29uc2lkZXIgdGhhdCB0aGlzIGlzIG91dAo+IG9mIHRoZSBzY29wZSBvZiB0aGUg
aHdwcm92IGZlYXR1cmUuCj4gCj4gPiBJZiB0aGUgSFcgcmVhbGx5IG5lZWRzIGl0LCBqdXN0IGxv
YiBhIGRldmxpbmsgcGFyYW0gYXQgaXQ/ICAKPiAKPiBJJ20gdG90YWxseSBPSyB3aXRoIHRoYXQu
IEknbSBub3Qgd2VsbCB2ZXJzZWQgaW50byBkZXZsaW5rLCB3b3JraW5nIG1vc3RseQo+IHdpdGgg
ZW1iZWRkZWQgZGV2aWNlcyB3aXRoIHNpbXBsZS1pc2ggTklDcywgbW9zdCBvZiB0aGVtIGRvbid0
IHVzZSBkZXZsaW5rLgo+IExldCBtZSBnaXZlIGl0IGEgdHJ5IHRoZW4gOikKCm1laCwgSSBraW5k
IG9mIGRpc2xpa2UgdXNpbmcgZGV2bGluayBoZXJlLiBBcyBJIHNhaWQgdXNpbmcgdGltZXN0YW1w
aW5nCnF1YWxpZmllciBpcyBhIGZpc3Qgc3RlcCBmb3IgdGhlIG11bHRpcGxlIHRpbWVzdGFtcGlu
ZyBzdXBwb3J0LiBJZiBvbmUgZGF5IHdlCndpbGwgYWRkIHRoaXMgc3VwcG9ydCwgaWYgdGhlcmUg
aXMgb3RoZXIgaW1wbGVtZW50YXRpb24gaXQgd2lsbCBhZGQgYnVyZGVuIG9uCnRoZSBkZXZlbG9w
bWVudCB0byB0cmFjayBhbmQgY2hhbmdlIGFsbCB0aGUgb3RoZXIgaW1wbGVtZW50YXRpb24uIFdo
eSBkb24ndCB3ZQphbHdheXMgdXNlIHRoaXMgcXVhbGlmaWVyIHBhcmFtZXRlciBldmVuIGlmIGl0
IGlzIG5vdCByZWFsbHkgZm9yIHNpbXVsdGFuZW91cwp0aW1lc3RhbXBpbmcgdG8gYXZvaWQgYW55
IGZ1dHVyZSB3cm9uZyBkZXZlbG9wbWVudCBjaG9pY2UuCgpSZWdhcmRzLAotLSAKS8O2cnkgTWFp
bmNlbnQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIGtlcm5lbCBlbmdpbmVlcmluZwpodHRw
czovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
