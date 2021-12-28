Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C586480C13
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Dec 2021 18:30:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6D26C5F1EF;
	Tue, 28 Dec 2021 17:30:24 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 716EEC5C828
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Dec 2021 17:30:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A336CB8111E;
 Tue, 28 Dec 2021 17:30:22 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id EB3CFC36AE8;
 Tue, 28 Dec 2021 17:30:14 +0000 (UTC)
Date: Tue, 28 Dec 2021 17:35:58 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <20211228173558.3702faa2@jic23-huawei>
In-Reply-To: <c8f6446e-748b-5845-ae60-5d6b8f3e8d39@metafoo.de>
References: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
 <c8f6446e-748b-5845-ae60-5d6b8f3e8d39@metafoo.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Raymond Tan <raymond.tan@intel.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, Patrick Havelange <patrick.havelange@essensium.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Kamel Bouhara <kamel.bouhara@bootlin.com>, Jonathan Corbet <corbet@lwn.net>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 David Lechner <david@lechnology.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, "Felipe
 Balbi \(Intel\)" <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Oleksij Rempel <linux@rempel-privat.de>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Syed Nayyar Waris <syednwaris@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 00/23] counter: cleanups and device
	lifetime fixes
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

T24gTW9uLCAyNyBEZWMgMjAyMSAxMzoyNToyNSArMDEwMApMYXJzLVBldGVyIENsYXVzZW4gPGxh
cnNAbWV0YWZvby5kZT4gd3JvdGU6Cgo+IE9uIDEyLzI3LzIxIDEwOjQ1IEFNLCBVd2UgS2xlaW5l
LUvDtm5pZyB3cm90ZToKPiA+IFsuLi5dCj4gPgo+ID4gICAtIEkgd29uZGVyIHdoeSBjb3VudGVy
IGlzIGEgYnVzIGFuZCBub3QgYSBjbGFzcyBkZXZpY2UgdHlwZS4gVGhlcmUgaXMKPiA+ICAgICBu
byBkcml2ZXIgdGhhdCB3b3VsZCBldmVyIGJpbmQgYSBjb3VudGVyIGRldmljZSwgaXMgdGhlcmU/
IFNvCj4gPiAgICAgL3N5cy9idXMvY291bnRlci9kcml2ZXIgaXMgYWx3YXlzIGVtcHR5Lgo+ID4g
IAo+IFRoZXJlIHVzZWQgdG8gYmUgYSB0aW1lIHdoZW4gR0tIIHNhaWQgdGhhdCB3ZSBkbyBub3Qg
d2FudCBuZXcgZHJpdmVyIAo+IGNsYXNzZXMuIEFuZCBhbGwgbmV3IHN1YnN5c3RlbXMgc2hvdWxk
IHVzZSBidXMgc2luY2UgYnVzIGlzIGEgc3VwZXJzZXQgCj4gb2YgY2xhc3MuIFRoaXMgcmVzdHJp
Y3Rpb24gaGFzIGJlZW4gZWFzZWQgc2luY2UgdGhlbi4KPiAKPiBCdXQgaXQgd2FzIGFyb3VuZCB3
aGVuIHRoZSBJSU8gc3Vic3lzdGVtIHdhcyBtZXJnZWQgYW5kIHNpbmNlIHRoZSAKPiBjb3VudGVy
IHN1YnN5c3RlbSBvcmlnaW5hdGVkIGZyb20gdGhlIElJTyBzdWJzeXN0ZW0gSSBhc3N1bWUgaXQg
anVzdCAKPiBjb3BpZWQgdGhpcy4KPiAKCll1cC4gRGlzY3Vzc2lvbiBhYm91dCB0aGlzIGJhY2sg
dGhlbiB3aXRoIG9uZSB2aWV3IGJlaW5nIHRoZXJlCnNob3VsZCBuZXZlciBoYXZlIGJlZW4gY2xh
c3MgaW4gdGhlIGZpcnN0IHBsYWNlLgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC80QjU3
MURBNC42MDcwNjAzQGNhbS5hYy51ay8KCkZvciBhbnlvbmUgd2hvIGxvdmVzIHRoZSBoaXN0b3J5
IG9mIHRoZXNlIHRoaW5ncy4uLgoKRldJVyBJIHRoaW5rIEdyZWcgc3VnZ2VzdGVkIElJTyBzaG91
bGQgYmUgYSBidXMgYmVjYXVzZSB3ZSB3ZXJlIGhhbmdpbmcKYSBidW5jaCBvZiBkaWZmZXJlbnQg
dHlwZXMgb2YgZGV2aWNlIG9mZiBhIGNsYXNzIGFuZCBpdCB3YXMgZ2V0dGluZyBtZXNzeS4KS2F5
IHRoZW4gZ2F2ZSBzb21lIGhpc3Rvcnkgb24gY2xhc3MgdnMgYnVzIGFuZCBzdWdnZXN0ZWQgbm8g
bmV3CnN1YnN5c3RlbSBzaG91bGQgdXNlIGNsYXNzLgoKQWggd2VsbCwgb3BpbmlvbnMgY2hhbmdl
IG92ZXIgdGltZSEKCkFsc28gaW50ZXJlc3RpbmcgdG8gc2VlIHdlIHdlcmUgZGlzY3Vzc2luZyBh
IGJyaWRnZSB0byBpbnB1dCBhbGwgdGhhdAp0aW1lIGFnbyBhbmQgaXQncyBzdGlsbCBub3QgZ29u
ZSBiZXlvbmQgdmFyaW91cyBwcm90b3R5cGVzICh3aXRoCmV4Y2VwdGlvbiBvZiB0b3VjaCBzY3Jl
ZW5zKS4KCkpvbmF0aGFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
