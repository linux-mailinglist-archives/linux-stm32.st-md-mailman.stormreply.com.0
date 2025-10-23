Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33303BFFF2B
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 10:35:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48E0BC5EC44;
	Thu, 23 Oct 2025 08:35:40 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21624C57181
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 08:35:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 672DC4E41297;
 Thu, 23 Oct 2025 08:35:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3B4AF6062C;
 Thu, 23 Oct 2025 08:35:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 82B43102F245F; 
 Thu, 23 Oct 2025 10:35:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761208536; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=QyGq63ZvKspF1jw8uQGnqd963nP/bOUmb/fJ7CbY46Y=;
 b=hsZGITRrOYENYpvBAgl3pGETE+fYzC2CXnRYmMu5tzsNzIIdh1durFekdpZoOLwmfZV8a3
 F1ObWl6rZsxBZpe3WlDU/n6qsDAJGKsFSoaR1gGM9y85lcmCciEX5VpU0H0sUHPOieunKi
 eTO4BYHcjWuXhpc4A9u/Tx909YQk9wb3EKtLvS3EwMu0HxB74XxT/8fdj5RfVqe53JAe+h
 P3cnSol+/+vo0Xy5X/l1lp4oECkwYZ+pCAKNGFLj5FyC28ldLCueb/9DoEaY0VCm6q/tJ+
 9SLL/UDj0DChR20mjFxyJAzD6Zb3eJJ76wFDo3J9vEhKh2e+9sbbvu+mZ9QSJw==
Date: Thu, 23 Oct 2025 10:35:28 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20251023103528.0c969be8@kmaincent-XPS-13-7390>
In-Reply-To: <ac505a82-1a01-4c1d-8f9b-826133a07ecf@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015102725.1297985-3-maxime.chevallier@bootlin.com>
 <20251017182358.42f76387@kernel.org>
 <d40cbc17-22fa-4829-8eb0-e9fd26fc54b1@bootlin.com>
 <20251020180309.5e283d90@kernel.org>
 <911372f3-d941-44a8-bec2-dcc1c14d53dd@bootlin.com>
 <20251021160221.4021a302@kernel.org>
 <ac505a82-1a01-4c1d-8f9b-826133a07ecf@bootlin.com>
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

T24gVGh1LCAyMyBPY3QgMjAyNSAxMDoyOToyNiArMDIwMApNYXhpbWUgQ2hldmFsbGllciA8bWF4
aW1lLmNoZXZhbGxpZXJAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBPbiAyMi8xMC8yMDI1IDAxOjAy
LCBKYWt1YiBLaWNpbnNraSB3cm90ZToKPiA+IE9uIFR1ZSwgMjEgT2N0IDIwMjUgMTA6MDI6MDEg
KzAyMDAgTWF4aW1lIENoZXZhbGxpZXIgd3JvdGU6ICAKPiA+PiBMZXQgbWUga25vdyBpZiB5b3Ug
bmVlZCBtb3JlIGNsYXJpZmljYXRpb25zIG9uIHRoaXMgIAo+ID4gCj4gPiBUaGUgZXhwbGFuYXRp
b24gd2FzIGV4Y2VsbGVudCwgdGhhbmsgeW91LiBJIHdvbmRlciB3aHkgaXQncyBkZXNpZ25lZAo+
ID4gaW4gc3VjaCBhbiBvZGQgd2F5LCBpbnN0ZWFkIG9mIGp1c3QgaGF2aW5nIGN1cnJlbnRfdGlt
ZSB3aXRoIHNvbWUKPiA+IGV4dHJhL2ZyYWN0aW9uYWwgYml0cyBub3QgdmlzaWJsZSBpbiB0aGUg
dGltZXN0YW1wLiBTaWdoLgo+ID4gCj4gPiBJbiBhbnkgY2FzZSwgSSBkb24ndCBmZWVsIHN0cm9u
Z2x5IGJ1dCBpdCBkZWZpbml0ZWx5IHNlZW1zIHRvIG1lIGxpa2UKPiA+IHRoZSBjcnVjaWFsIGRp
c3RpbmN0aW9uIGhlcmUgaXMgbm90IHRoZSBwcmVjaXNpb24gb2YgdGhlIHRpbWVzdGFtcCBidXQK
PiA+IHdoZXRoZXIgdGhlIHVzZXIgaW50ZW5kcyB0byBkaWFsIHRoZSBmcmVxdWVuY3kuICAKPiAK
PiBZZXMgaW5kZWVkLiBJIGRvbid0IGhhdmUgYSBjbGVhciB2aWV3IG9uIHdldGhlciB0aGlzIGlz
IHNvbWV0aGluZyB1bmlxdWUKPiB0byBzdG1tYWMgb3IgaWYgdGhpcyBpcyBjb21tb24gZW5vdWdo
IHRvIGp1c3RpZnkgdXNpbmcgdGhlIHRzY29uZmlnIEFQSS4KPiAKPiBBcyB3ZSBkaXNjdXNzIHRo
aXMsIEkgd291bGQgdGVuZCB0byB0aGluayBkZXZsaW5rIGlzIHRoZSB3YXksIGFzIHRoaXMKPiBh
bGwgYm9pbHMgZG93biB0byBob3cgdGhpcyBwYXJ0aWN1bGFyIEhXIHdvcmtzLiBNb3Jlb3Zlciwg
aWYgd2UgdXNlIGEKPiBkZWRpY2F0ZWQgaHdwcm92IHF1YWxpZmllciwgd2hlcmUgZG8gd2UgbWFr
ZSBpdCBzaXQgaW4gdGhlIGN1cnJlbnQKPiBoaWVyYXJjaHkgKHByZWNpc2UgPiBhcHByb3gpIHRo
YXQncyB1c2VkIGZvciB0aGUgVFMgc291cmNlIHNlbGVjdGlvbiA/CgpUaGF0J3Mgb2sgdG8gbWUu
IEkgd2FzIG5vdCBzdHJvbmdseSBhZ2FpbnN0IGRldmxpbmsgaW4gZWl0aGVyIHdheSwgYW5kIEkg
ZGlkbid0CmhhdmUgcmVhbCBhcmd1bWVudHMuIExldCdzIGdvIGZvciBkZXZsaW5rLCB3ZSBzdGls
bCBjYW4gbW92ZSBpdCB0byB0c2NvbmZpZyBBUEkKbGF0ZXIgaWYgaXQncyBuZWVkZWQuIAoKUmVn
YXJkcywKLS0gCkvDtnJ5IE1haW5jZW50LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBrZXJu
ZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
