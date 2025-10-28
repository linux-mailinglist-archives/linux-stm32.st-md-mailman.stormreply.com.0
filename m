Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C19DC1408F
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Oct 2025 11:16:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0996C628CB;
	Tue, 28 Oct 2025 10:16:47 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEF9DC628BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Oct 2025 10:16:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5DBBF4E41394;
 Tue, 28 Oct 2025 10:16:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2EE15606AB;
 Tue, 28 Oct 2025 10:16:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2EABC1179B169; Tue, 28 Oct 2025 11:16:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761646605; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ls9js8pk1OxApOPfHjg+6OhXCiFAAL8Poa+LHhv8b+I=;
 b=T2mWuyF1Qd8XV3vwoWIodU+brS+15SaCjgzWX2XlEE5kUJTtJQyb0GGWuqTyZhH+FFDKpc
 Xqqvn5L2mdvJ0MNnISgT0M6sIU8mXNXeLM9S2z65uY1z3ukIyHZ0Xwr68Hha+oAXOtfkIq
 aA/mFYHiKksHLih9RQc5ooPMSLYOf1Ml8ex93rbVOk7S95p5VZ8JzIBngXxbW6J82SowfD
 DOv2auU7aXka0nHFhn9wPan+sLhIOmuRtM3yeXOFknGNV3rsdnAvD2eS2hBfT0jIApcrSG
 H/xvyhnJEHWwN3EkGE8s920SdZ66mHv5s4MtvnLKB7JooqhGCynqXJP8+XQIbA==
Date: Tue, 28 Oct 2025 11:16:36 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20251028111636.7eaba25e@kmaincent-XPS-13-7390>
In-Reply-To: <20251024070720.71174-3-maxime.chevallier@bootlin.com>
References: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
 <20251024070720.71174-3-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/2] net: stmmac: Add a
 devlink attribute to control timestamping mode
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

T24gRnJpLCAyNCBPY3QgMjAyNSAwOTowNzoxOCArMDIwMApNYXhpbWUgQ2hldmFsbGllciA8bWF4
aW1lLmNoZXZhbGxpZXJAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBUaGUgRFdNQUMxMDAwIHN1cHBv
cnRzIDIgdGltZXN0YW1waW5nIGNvbmZpZ3VyYXRpb25zIHRvIGNvbmZpZ3VyZSBob3cKPiBmcmVx
dWVuY3kgYWRqdXN0bWVudHMgYXJlIG1hZGUgdG8gdGhlIHB0cF9jbG9jaywgYXMgd2VsbCBhcyB0
aGUgcmVwb3J0ZWQKPiB0aW1lc3RhbXAgdmFsdWVzLgo+IAo+IFRoZXJlIHdhcyBhIHByZXZpb3Vz
IGF0dGVtcHQgYXQgdXBzdHJlYW1pbmcgc3VwcG9ydCBmb3IgY29uZmlndXJpbmcgdGhpcwo+IG1v
ZGUgYnkgT2xpdmllciBEYXV0cmljb3VydCBhbmQgSnVsaWVuIEJlcmF1ZCBhIGZldyB5ZWFycyBi
YWNrIFsxXQo+IAo+IEluIGEgbnV0c2hlbGwsIHRoZSB0aW1lc3RhbXBpbmcgY2FuIGJlIGVpdGhl
ciBzZXQgaW4gZmluZSBtb2RlIG9yIGluCj4gY29hcnNlIG1vZGUuCj4gCj4gSW4gZmluZSBtb2Rl
LCB3aGljaCBpcyB0aGUgZGVmYXVsdCwgd2UgdXNlIHRoZSBvdmVyZmxvdyBvZiBhbiBhY2N1bXVs
YXRvciB0bwo+IHRyaWdnZXIgZnJlcXVlbmN5IGFkanVzdG1lbnRzLCBidXQgYnkgZG9pbmcgc28g
d2UgbG9zZSBwcmVjaXNpb24gb24gdGhlCj4gdGltZXRhbXBzIHRoYXQgYXJlIHByb2R1Y2VkIGJ5
IHRoZSB0aW1lc3RhbXBpbmcgdW5pdC4gVGhlIG1haW4gZHJhd2JhY2sKPiBpcyB0aGF0IHRoZSBz
dWItc2Vjb25kIGluY3JlbWVudCB2YWx1ZSwgdXNlZCB0byBnZW5lcmF0ZSB0aW1lc3RhbXBzLCBj
YW4ndCBiZQo+IHNldCB0byBsb3dlciB0aGFuICgyIC8gcHRwX2Nsb2NrX2ZyZXEpLgo+IAo+IFRo
ZSAiZmluZSIgcXVhbGlmaWNhdGlvbiBjb21lcyBmcm9tIHRoZSBmcmVxdWVudCBmcmVxdWVuY3kg
YWRqdXN0bWVudHMgd2UgYXJlCj4gYWJsZSB0byBkbywgd2hpY2ggaXMgcGVyZmVjdCBmb3IgYSBQ
VFAgZm9sbG93ZXIgdXNlY2FzZS4KPiAKPiBJbiBDb2Fyc2UgbW9kZSwgd2UgZG9uJ3QgZG8gZnJl
cXVlbmN5IGFkanVzdG1lbnRzIGJhc2VkIG9uIGFuCj4gYWNjdW11bGF0b3Igb3ZlcmZsb3cuIFdl
IGNhbiB0aGVyZWZvcmUgaGF2ZSB2ZXJ5IGZpbmUgc3Vic2Vjb25kCj4gaW5jcmVtZW50IHZhbHVl
cywgYWxsb3dpbmcgZm9yIGJldHRlciB0aW1lc3RhbXBpbmcgcHJlY2lzaW9uLiBIb3dldmVyCj4g
dGhpcyBtb2RlIHdvcmtzIGJlc3Qgd2hlbiB0aGUgcHRwIGNsb2NrIGZyZXF1ZW5jeSBpcyBhZGp1
c3RlZCBiYXNlZCBvbgo+IGFuIGV4dGVybmFsIHNpZ25hbCwgc3VjaCBhcyBhIFBQUyBpbnB1dCBw
cm9kdWNlZCBieSBhIEdQUyBjbG9jay4gVGhpcwo+IG1vZGUgaXMgdGhlcmVmb3JlIHBlcmZlY3Qg
Zm9yIGEgR3JhbmQtbWFzdGVyIHVzZWNhc2UuCj4gCj4gSW50cm9kdWNlIGEgZHJpdmVyLXNwZWNp
ZmljIGRldmxpbmsgcGFyYW1ldGVyICJ0c19jb2Fyc2UiIHRvIGVuYWJsZSBvcgo+IGRpc2FibGUg
Y29hcnNlIG1vZGUsIGtlZXBpbmcgdGhlICJmaW5lIiBtb2RlIGFzIGEgZGVmYXVsdC4KPiAKPiBU
aGlzIGNhbiB0aGVuIGJlIGNoYW5nZWQgd2l0aDoKPiAKPiAgIGRldmxpbmsgZGV2IHBhcmFtIHNl
dCA8ZGV2PiBuYW1lIHRzX2NvYXJzZSB2YWx1ZSB0cnVlIGNtb2RlIHJ1bnRpbWUKPiAKPiBUaGUg
YXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGlzIGFsc28gYWRkZWQuCj4gCj4gWzFdIDoKPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYvMjAyMDA1MTQxMDI4MDguMzExNjMtMS1vbGl2aWVy
LmRhdXRyaWNvdXJ0QG9yb2xpYS5jb20vCgoKUmV2aWV3ZWQtYnk6IEtvcnkgTWFpbmNlbnQgPGtv
cnkubWFpbmNlbnRAYm9vdGxpbi5jb20+CgpUaGFuayB5b3UhCi0tIApLw7ZyeSBNYWluY2VudCwg
Qm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQga2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9v
dGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
