Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC440481D4A
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Dec 2021 15:52:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 629F5C5E2C5;
	Thu, 30 Dec 2021 14:52:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A286C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Dec 2021 14:52:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE48B616F5;
 Thu, 30 Dec 2021 14:52:47 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 290A5C36AE9;
 Thu, 30 Dec 2021 14:52:40 +0000 (UTC)
Date: Thu, 30 Dec 2021 14:58:26 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20211230145826.7f23becb@jic23-huawei>
In-Reply-To: <20211230085351.pywngltvdam25emx@pengutronix.de>
References: <20211229154441.38045-1-u.kleine-koenig@pengutronix.de>
 <20211230085351.pywngltvdam25emx@pengutronix.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
 David Lechner <david@lechnology.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-iio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, kernel@pengutronix.de,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Syed Nayyar Waris <syednwaris@gmail.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 00/23] counter: cleanups and device
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

T24gVGh1LCAzMCBEZWMgMjAyMSAwOTo1Mzo1MSArMDEwMApVd2UgS2xlaW5lLUvDtm5pZyA8dS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKCj4gSGVsbG8sCj4gCj4gT24gV2Vk
LCBEZWMgMjksIDIwMjEgYXQgMDQ6NDQ6MThQTSArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gPiB0aGlzIGlzIHYzIG9mIG15IHNlcmllcyB0byBmaXggZGV2aWNlIGxpZmV0aW1lIGlz
c3VlcyBpbiB0aGUgY291bnRlcgo+ID4gZnJhbWV3b3JrLiBUaGlzIGhvcGVmdWxseSBhZGRyZXNz
ZXMgYWxsIHRoaW5ncyBwb2ludGVkIG91dCBmb3IgdjIuCj4gPiAKPiA+IE5vdGUgdGhpcyBkZXBl
bmRzIG9uIDYwZjA3ZTc0Zjg2YiAod2hpY2ggaXMgaW4gbmV4dCkgbm93LiBGdWxsIGRpZmZzdGF0
Cj4gPiBiZWxvdy4KPiA+IAo+ID4gVGhpbmdzIHRoYXQgY291bGQgYmUgZnVydGhlciBpbXByb3Zl
ZDoKPiA+IAo+ID4gWy4uLl0KPiA+IAo+ID4gVXdlIEtsZWluZS1Lw7ZuaWcgKDIzKToKPiA+ICAg
Y291bnRlcjogVXNlIGNvbnRhaW5lcl9vZiBpbnN0ZWFkIG9mIGRydmRhdGEgdG8gdHJhY2sgY291
bnRlcl9kZXZpY2UKPiA+ICAgY291bnRlcjogZnRtLXF1YWRkZWM6IERyb3AgdW51c2VkIHBsYXRm
b3JtX3NldF9kcnZkYXRhKCkKPiA+ICAgY291bnRlcjogbWljcm9jaGlwLXRjYi1jYXB0dXJlOiBE
cm9wIHVudXNlZCBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YSgpCj4gPiAgIGNvdW50ZXI6IFByb3ZpZGUg
YSB3cmFwcGVyIHRvIGFjY2VzcyBkZXZpY2UgcHJpdmF0ZSBkYXRhCj4gPiAgIGNvdW50ZXI6IDEw
NC1xdWFkLTg6IENvbnZlcnQgdG8gY291bnRlcl9wcml2KCkgd3JhcHBlcgo+ID4gICBjb3VudGVy
OiBpbnRlcnJ1cHQtY250OiBDb252ZXJ0IHRvIGNvdW50ZXJfcHJpdigpIHdyYXBwZXIKPiA+ICAg
Y291bnRlcjogbWljcm9jaGlwLXRjYi1jYXB0dXJlOiBDb252ZXJ0IHRvIGNvdW50ZXJfcHJpdigp
IHdyYXBwZXIKPiA+ICAgY291bnRlcjogaW50ZWwtcWVwOiBDb252ZXJ0IHRvIGNvdW50ZXJfcHJp
digpIHdyYXBwZXIKPiA+ICAgY291bnRlcjogZnRtLXF1YWRkZWM6IENvbnZlcnQgdG8gY291bnRl
cl9wcml2KCkgd3JhcHBlcgo+ID4gICBjb3VudGVyOiB0aS1lcWVwOiBDb252ZXJ0IHRvIGNvdW50
ZXJfcHJpdigpIHdyYXBwZXIKPiA+ICAgY291bnRlcjogc3RtMzItbHB0aW1lci1jbnQ6IENvbnZl
cnQgdG8gY291bnRlcl9wcml2KCkgd3JhcHBlcgo+ID4gICBjb3VudGVyOiBzdG0zMi10aW1lci1j
bnQ6IENvbnZlcnQgdG8gY291bnRlcl9wcml2KCkgd3JhcHBlcgo+ID4gICBjb3VudGVyOiBQcm92
aWRlIGFsdGVybmF0aXZlIGNvdW50ZXIgcmVnaXN0cmF0aW9uIGZ1bmN0aW9ucwo+ID4gICBjb3Vu
dGVyOiBVcGRhdGUgZG9jdW1lbnRhdGlvbiBmb3IgbmV3IGNvdW50ZXIgcmVnaXN0cmF0aW9uIGZ1
bmN0aW9ucwo+ID4gICBjb3VudGVyOiAxMDQtcXVhZC04OiBDb252ZXJ0IHRvIG5ldyBjb3VudGVy
IHJlZ2lzdHJhdGlvbgo+ID4gICBjb3VudGVyOiBpbnRlcnJ1cHQtY250OiBDb252ZXJ0IHRvIG5l
dyBjb3VudGVyIHJlZ2lzdHJhdGlvbgo+ID4gICBjb3VudGVyOiBpbnRlbC1xZXA6IENvbnZlcnQg
dG8gbmV3IGNvdW50ZXIgcmVnaXN0cmF0aW9uCj4gPiAgIGNvdW50ZXI6IGZ0bS1xdWFkZGVjOiBD
b252ZXJ0IHRvIG5ldyBjb3VudGVyIHJlZ2lzdHJhdGlvbgo+ID4gICBjb3VudGVyOiBtaWNyb2No
aXAtdGNiLWNhcHR1cmU6IENvbnZlcnQgdG8gbmV3IGNvdW50ZXIgcmVnaXN0cmF0aW9uCj4gPiAg
IGNvdW50ZXI6IHN0bTMyLXRpbWVyLWNudDogQ29udmVydCB0byBuZXcgY291bnRlciByZWdpc3Ry
YXRpb24KPiA+ICAgY291bnRlcjogc3RtMzItbHB0aW1lci1jbnQ6IENvbnZlcnQgdG8gbmV3IGNv
dW50ZXIgcmVnaXN0cmF0aW9uCj4gPiAgIGNvdW50ZXI6IHRpLWVxZXA6IENvbnZlcnQgdG8gbmV3
IGNvdW50ZXIgcmVnaXN0cmF0aW9uCj4gPiAgIGNvdW50ZXI6IHJlbW92ZSBvbGQgYW5kIG5vdyB1
bnVzZWQgcmVnaXN0cmF0aW9uIEFQSQo+ID4gCj4gPiAgRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBp
L2dlbmVyaWMtY291bnRlci5yc3QgfCAgMTAgKy0KPiA+ICBkcml2ZXJzL2NvdW50ZXIvMTA0LXF1
YWQtOC5jICAgICAgICAgICAgICAgICB8ICA5MyArKysrKy0tLS0tCj4gPiAgZHJpdmVycy9jb3Vu
dGVyL2NvdW50ZXItY29yZS5jICAgICAgICAgICAgICAgfCAxODYgKysrKysrKysrKysrKystLS0t
LQo+ID4gIGRyaXZlcnMvY291bnRlci9mdG0tcXVhZGRlYy5jICAgICAgICAgICAgICAgIHwgIDM2
ICsrLS0KPiA+ICBkcml2ZXJzL2NvdW50ZXIvaW50ZWwtcWVwLmMgICAgICAgICAgICAgICAgICB8
ICA0NiArKy0tLQo+ID4gIGRyaXZlcnMvY291bnRlci9pbnRlcnJ1cHQtY250LmMgICAgICAgICAg
ICAgIHwgIDM4ICsrLS0KPiA+ICBkcml2ZXJzL2NvdW50ZXIvbWljcm9jaGlwLXRjYi1jYXB0dXJl
LmMgICAgICB8ICA0NCArKy0tLQo+ID4gIGRyaXZlcnMvY291bnRlci9zdG0zMi1scHRpbWVyLWNu
dC5jICAgICAgICAgIHwgIDUxICsrLS0tCj4gPiAgZHJpdmVycy9jb3VudGVyL3N0bTMyLXRpbWVy
LWNudC5jICAgICAgICAgICAgfCAgNDggKystLS0KPiA+ICBkcml2ZXJzL2NvdW50ZXIvdGktZXFl
cC5jICAgICAgICAgICAgICAgICAgICB8ICAzMSArKy0tCj4gPiAgaW5jbHVkZS9saW51eC9jb3Vu
dGVyLmggICAgICAgICAgICAgICAgICAgICAgfCAgMTUgKy0KPiA+ICAxMSBmaWxlcyBjaGFuZ2Vk
LCAzNTYgaW5zZXJ0aW9ucygrKSwgMjQyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBSYW5nZS1kaWZm
IGFnYWluc3QgdjI6Cj4gPiBbLi4uXQo+ID4gCj4gPiBiYXNlLWNvbW1pdDogYTc5MDRhNTM4OTMz
YzUyNTA5NmNhMmNjZGUxZTYwZDBlZTYyYzA4ZQo+ID4gcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiA5
NDU5YWQ4YmM3ODE5MDU1OGRmOTEyM2Y4YmViZTI4Y2ExYzM5NmVhICAKPiAKPiBBbGwgcGF0Y2hl
cyBoYXZlIGEgYmxlc3NpbmcgYnkgYXQgbGVhc3Qgb25lIG9mIFdpbGxpYW0gYW5kIEpvbmF0aGFu
LgoKRm9yIGZ1dHVyZSByZWZlcmVuY2UgKG1heSBiZSBmaW5lIHRoaXMgdGltZSkgV2lsbGlhbSBo
YXMgZmluYWwgc2F5IG9uIGNvdW50ZXIKc3R1ZmYgYXMgdGhlIG1haW50YWluZXIgc28gdHJlYXQg
bXkgaW5wdXQgYXMganVzdCBhbm90aGVyIHNldCBvZiBleWVzLgoKQW55aG93LCBwbGVudHkgb2Yg
dGltZSBmb3IgYW55IG5lY2Vzc2FyeSBmaXhlcyBkdXJpbmcgdGhlIFJDcyBzbyBzaG91bGRuJ3QK
YmUgYSBwcm9ibGVtLgoKSm9uYXRoYW4KCgo+IFRoZSBwcmVyZXF1aXNpdGUgY29tbWl0ICg2MGYw
N2U3NGY4NmIpIGlzIGluIEdyZWcncyBjaGFyLW1pc2MtbmV4dCBicmFuY2guCj4gCj4gQXNzdW1p
bmcgbm9vbmUgc3RpbGwgZmluZHMgYSBwcm9ibGVtIGluIHRoaXMgc2VyaWVzIHRoYXQgcmVxdWly
ZXMgbWUgdG8KPiByZXNwaW4gSSB3b25kZXIgd2hvIHdpbGwgcGljayBpdCB1cD8gR3JlZz8KPiAK
PiBHaXZlbiB0aGF0IGl0IGZpeGVzIGEgcG9zc2libGUgdXNlLWFmdGVyLWZyZWUgaW4gYWxsIGNv
dW50ZXIgZHJpdmVycywKPiBJJ2QgbGlrZSB0byBzZWUgaXQgaGl0IGJlZm9yZSB2NS4xNy1yYzEu
IEZvciA1LjE2IGl0J3MgcHJvYmFibHkgdG9vCj4gbGF0ZS4KPiAKPiBCZXN0IHJlZ2FyZHMKPiBV
d2UKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
