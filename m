Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F05B39A3A9
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jun 2021 16:49:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25DB6C57B69;
	Thu,  3 Jun 2021 14:49:28 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6565DC57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jun 2021 14:49:26 +0000 (UTC)
Received: from [192.168.192.146] (port=48238 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1looeo-0005Ut-DI; Thu, 03 Jun 2021 16:49:14 +0200
Date: Thu, 3 Jun 2021 16:49:13 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <YLjr6XaK7q3r8dmi@nx64de-df6d00>
Mail-Followup-To: Grzegorz Szymaszek <gszymaszek@short.pl>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <YLjl6lE+uZ5ZCdiS@nx64de-df6d00>
 <fcee4f30-446e-f4da-6d95-c9223cf82981@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fcee4f30-446e-f4da-6d95-c9223cf82981@pengutronix.de>
Cc: devicetree@vger.kernel.org, Grzegorz Szymaszek <gszymaszek@short.pl>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: set stm32mp157c-odyssey
	DCMI pins
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

SGVsbG8gQWhtYWQsCgpPbiBUaHUsIEp1biAwMywgMjAyMSBhdCAwNDoyNjo1OVBNICswMjAwLCBB
aG1hZCBGYXRvdW0gd3JvdGU6Cj4gT24gMDMuMDYuMjEgMTY6MjMsIEdyemVnb3J6IFN6eW1hc3pl
ayB3cm90ZToKPiA+IFRoZSBTZWVlZCBPZHlzc2V5LVNUTTMyTVAxNTdDIGJvYXJkIGhhcyBhIDIw
LXBpbiBEVlAgY2FtZXJhIG91dHB1dC4KPiA+IHN0bTMybXAxNS1waW5jdHJsLmR0c2kgY29udGFp
bnMgb25lIHBpbiBzdGF0ZSBkZWZpbml0aW9uIGZvciB0aGUgRENNSQo+ID4gaW50ZXJmYWNlLCBk
Y21pLTAsIEFLQSBwaGFuZGxlIGRjbWlfcGluc19hLiBUaGlzIGRlZmluaXRpb24gaXMKPiA+IGlu
Y29tcGF0aWJsZSB3aXRoIHRoZSBwaW5zIHVzZWQgb24gdGhlIE9keXNzZXkgYm9hcmQsIHdoZXJl
Ogo+ID4gLSB0aGVyZSBhcmUgOCBkYXRhIHBpbnMgaW5zdGVhZCBvZiAxMiwKPiA+IC0gW+KApl0K
PiA+IAo+ID4gT3ZlcnJpZGUgdGhlIGRjbWlfcGluc19hIGRlZmluaXRpb24gKGFzIHdlbGwgYXMg
ZGNtaV9zbGVlcF9waW5zX2EpIGluCj4gPiB0aGUgT2R5c3NleSBkZXZpY2UgdHJlZS4KPiAKPiBS
YXRoZXIgZGVmaW5lIGEgbmV3IHBpbmN0cmwgZ3JvdXAgKGUuZy4gJmRjbWlfcGluc19iKSBhbmQg
dXNlIHRoYXQKPiBpbnN0ZWFkIG9mIG92ZXJyaWRpbmcgYW4gZXhpc3Rpbmcgb25lLgoKQ2FuIEkg
c2ltcGx5IHVzZSBkY21pX3BpbnNfYiAoYXMgdGhlIGZpcnN0IHVudXNlZCBpZGVudGlmaWVyKSBv
ciBpcwp0aGVyZSBzb21lIHdheSB0byBtYXRjaCBzcGVjaWZpYyBwaW4gZ3JvdXBzIHRvIGFuIGlk
ZW50aWZpZXIgKGIsIGMsIGQsCmFuZCBzbyBvbik/Cgo+IEN1cnJlbnQgY29udmVudGlvbiBpcyBh
bHNvIHRvIHBsYWNlIGFsbCBTVE0zMk1QMSBwaW5jdHJsIG5vZGVzIGludG8KPiBhIGNlbnRyYWwg
ZmlsZSwgbm90IGluIHRoZSBpbmRpdmlkdWFsIGJvYXJkIGRldmljZSB0cmVlcy4KClN1cmUsIEkg
d2lsbCB1cGRhdGUgdGhlIHBhdGNoLgoKVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzIQoKLS0gCkdy
emVnb3J6Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
