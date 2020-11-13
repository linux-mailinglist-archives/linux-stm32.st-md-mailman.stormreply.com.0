Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC292B19F8
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Nov 2020 12:22:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55C3CC56611;
	Fri, 13 Nov 2020 11:22:56 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 082F4C3FAE2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Nov 2020 11:22:54 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kdXAL-0000Qs-Cn; Fri, 13 Nov 2020 12:22:53 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <cover.1605226675.git.mirq-linux@rere.qmqm.pl>
 <0cb181b3-d257-b7a4-56e4-0d2bb04b0387@pengutronix.de>
Message-ID: <49aaa901-041d-e803-2ec5-167d8bb6372f@pengutronix.de>
Date: Fri, 13 Nov 2020 12:22:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <0cb181b3-d257-b7a4-56e4-0d2bb04b0387@pengutronix.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH RESEND 0/4] regulator: debugging and
	fixing supply deps
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

Q0MgKz0gbGludXgtc3RtMzIgYXMgb3RoZXIgU1RNMzJNUDEgYm9hcmRzIGFyZSBhbHNvIGFmZmVj
dGVkLgoKT24gMTEvMTMvMjAgMTI6MTkgUE0sIEFobWFkIEZhdG91bSB3cm90ZToKPiBIZWxsbyBN
aWNoYcWCLAo+IAo+IE9uIDExLzEzLzIwIDE6MjAgQU0sIE1pY2hhxYIgTWlyb3PFgmF3IHdyb3Rl
Ogo+PiBJdCB0dXJucyBvdXQgdGhhdCBjb21taXQgYWVhNmNiOTk3MDNlICgicmVndWxhdG9yOiBy
ZXNvbHZlIHN1cHBseQo+PiBhZnRlciBjcmVhdGluZyByZWd1bGF0b3IiKSBleHBvc2VkIGEgbnVt
YmVyIG9mIGlzc3VlcyBpbiByZWd1bGF0b3IKPj4gaW5pdGlhbGl6YXRpb24gYW5kIGludHJvZHVj
ZWQgYSBtZW1vcnkgbGVhayBvZiBpdHMgb3duLiBPbmUgdW5jb3ZlcmVkCj4+IHByb2JsZW0gd2Fz
IGFscmVhZHkgZml4ZWQgYnkgY2YxYWQ1NTlhMjBkICgicmVndWxhdG9yOiBkZWZlciBwcm9iZSB3
aGVuCj4+IHRyeWluZyB0byBnZXQgdm9sdGFnZSBmcm9tIHVucmVzb2x2ZWQgc3VwcGx5IikuIFRo
aXMgc2VyaWVzIGZpeGVzIHRoZQo+PiByZW1haW5pbmcgb25lcyBhbmQgYWRkcyBhIHR3byBkZWJ1
Z2dpbmcgYWlkcyB0byBoZWxwIGluIHRoZSBmdXR1cmUuCj4+Cj4+IFRoZSBmaW5hbCBwYXRjaCBh
ZGRzIGEgd29ya2Fyb3VuZCB0byBwcmVleGlzdGluZyBwcm9ibGVtIG9jY3VycmluZyB3aXRoCj4+
IHJlZ3VsYXRvcnMgdGhhdCBoYXZlIHRoZSBzYW1lIG5hbWUgYXMgaXRzIHN1cHBseV9uYW1lLiBU
aGlzIHdvcmtlZAo+PiBiZWZvcmUgYnkgYWNjaWRlbnQsIHNvIG1pZ2h0IGJlIHdvcnRoIGJhY2tw
b3J0aW5nLiBUaGUgZXJyb3IgbWVzc2FnZSBpcwo+PiBsZWZ0IG9uIHB1cnBvc2Ugc28gdGhhdCB0
aGVzZSBjb25maWd1cmF0aW9ucyBjYW4gYmUgZGV0ZWN0ZWQgYW5kIGZpeGVkLgo+Pgo+PiAoVGhl
IGZpcnN0IHR3byBwYXRjaGVzIGFyZSByZXNlbmRzIGZyb20gTm92IDUpLgo+Pgo+PiAoU2VyaWVz
IHJlc2VudCBiZWNhdXNlIG9mIHdyb25nIGFybS1rZXJuZWwgTUwgYWRkcmVzcy4pCj4gCj4gbHhh
LW1jMSAoU1RNMzJNUDEgYm9hcmQgd2l0aCBTVFBNSUMpIG5vdyBtYW5hZ2VzIHRvIGJvb3QgYWdh
aW4gd2l0aCBmb2xsb3dpbmcKPiBuZXcgd2FybmluZzoKPiAKPiAgIHN0cG1pYzEtcmVndWxhdG9y
IDVjMDAyMDAwLmkyYzpzdHBtaWNAMzM6cmVndWxhdG9yczogU3VwcGx5IGZvciBWUkVGX0REUgo+
IAo+IFNvIGZvciB0aGUgd2hvbGUgc2VyaWVzLAo+IFRlc3RlZC1ieTogQWhtYWQgRmF0b3VtIDxh
LmZhdG91bUBwZW5ndXRyb25peC5kZT4gIyBzdHBtaWMxCj4gCj4gVGhhbmtzIQo+IEFobWFkCj4g
Cj4+Cj4+IE1pY2hhxYIgTWlyb3PFgmF3ICg0KToKPj4gICByZWd1bGF0b3I6IGZpeCBtZW1vcnkg
bGVhayB3aXRoIHJlcGVhdGVkIHNldF9tYWNoaW5lX2NvbnN0cmFpbnRzKCkKPj4gICByZWd1bGF0
b3I6IGRlYnVnIGVhcmx5IHN1cHBseSByZXNvbHZpbmcKPj4gICByZWd1bGF0b3I6IGF2b2lkIHJl
c29sdmVfc3VwcGx5KCkgaW5maW5pdGUgcmVjdXJzaW9uCj4+ICAgcmVndWxhdG9yOiB3b3JrYXJv
dW5kIHNlbGYtcmVmZXJlbnQgcmVndWxhdG9ycwo+Pgo+PiAgZHJpdmVycy9yZWd1bGF0b3IvY29y
ZS5jIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+PiAgMSBm
aWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+Pgo+IAoKLS0g
ClBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ClN0ZXVlcndhbGRlciBTdHIuIDIxICAgICAgICAgICAgICAgICAg
ICAgICB8IGh0dHA6Ly93d3cucGVuZ3V0cm9uaXguZGUvICB8CjMxMTM3IEhpbGRlc2hlaW0sIEdl
cm1hbnkgICAgICAgICAgICAgICAgICB8IFBob25lOiArNDktNTEyMS0yMDY5MTctMCAgICB8CkFt
dHNnZXJpY2h0IEhpbGRlc2hlaW0sIEhSQSAyNjg2ICAgICAgICAgICB8IEZheDogICArNDktNTEy
MS0yMDY5MTctNTU1NSB8Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
