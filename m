Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B78E2A3819
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Nov 2020 01:59:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B27C5C36B25;
	Tue,  3 Nov 2020 00:59:42 +0000 (UTC)
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E012C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Nov 2020 00:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1604365180; bh=089NW4EV+AXNBn4l7uQ4zi2lQU+TDwonIKQk0SRKAwo=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=l7HTx+tFDkVGYaCEwtciREO4kDO2rHCpmGKPlaYwA36LoNIR1q4fRJaucFoOzUSBb
 nNXxfjyoXaFvImOW0E8zUBYguDjxJWr2JJ31dKzE5jwTt8pb8UeaVEveydNnCs5Ne4
 2y9aa66IBOesQDKnE/Gj90oWYN/xt2MfVAe+ZlTE=
Date: Tue, 3 Nov 2020 01:59:39 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Message-ID: <20201103005939.v563wbvbzks6ecjm@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <a9041d68b4d35e4a2dd71629c8a6422662acb5ee.1604351936.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a9041d68b4d35e4a2dd71629c8a6422662acb5ee.1604351936.git.mirq-linux@rere.qmqm.pl>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Corentin Labbe <clabbe.montjoie@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] regulator: defer probe when trying to
 get voltage from unresolved supply
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

SGVsbG8gTWljaGFsLAoKT24gTW9uLCBOb3YgMDIsIDIwMjAgYXQgMTA6Mjc6MjdQTSArMDEwMCwg
TWljaGHFgiBNaXJvc8WCYXcgd3JvdGU6Cj4gcmVndWxhdG9yX2dldF92b2x0YWdlX3JkZXYoKSBp
cyBjYWxsZWQgaW4gcmVndWxhdG9yIHByb2JlKCkgd2hlbgo+IGFwcGx5aW5nIG1hY2hpbmUgY29u
c3RyYWludHMuICBUaGUgImZpeGVkIiBjb21taXQgZXhwb3NlZCB0aGUgcHJvYmxlbQo+IHRoYXQg
bm9uLWJ5cGFzc2VkIHJlZ3VsYXRvcnMgY2FuIGZvcndhcmQgdGhlIHJlcXVlc3QgdG8gaXRzIHBh
cmVudAo+IChsaWtlIGJ5cGFzc2VkIG9uZXMpIHN1cHBseS4gUmV0dXJuIC1FUFJPQkVfREVGRVIg
d2hlbiB0aGUgc3VwcGx5Cj4gaXMgZXhwZWN0ZWQgYnV0IG5vdCByZXNvbHZlZCB5ZXQuCj4gCgpU
ZXN0ZWQtYnk6IE9uZMWZZWogSmlybWFuIDxtZWdvdXNAbWVnb3VzLmNvbT4KCnRoYW5rIHlvdSB2
ZXJ5IG11Y2gsCglPbmRyZWoKCj4gRml4ZXM6IGFlYTZjYjk5NzAzZSAoInJlZ3VsYXRvcjogcmVz
b2x2ZSBzdXBwbHkgYWZ0ZXIgY3JlYXRpbmcgcmVndWxhdG9yIikKPiBDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJxLWxpbnV4
QHJlcmUucW1xbS5wbD4KPiBSZXBvcnRlZC1ieTogT25kxZllaiBKaXJtYW4gPG1lZ291c0BtZWdv
dXMuY29tPgo+IFJlcG9ydGVkLWJ5OiBDb3JlbnRpbiBMYWJiZSA8Y2xhYmJlLm1vbnRqb2llQGdt
YWlsLmNvbT4KPiAtLS0KPiAgdjE6IHRoaXMgaXMgYSBiaXQgZGlmZmVyZW50IHNvbHV0aW9uIHRo
YW4gdGhlIGhhY2sgc2VudCBlYXJsaWVyLiBJdCBzaG91bGQKPiAgICAgIGJlIGVxdWl2YWxlbnQg
KHB1dHRpbmcgdGhlIGVycm9yIGNvZGUgYXQgdGhlIHNvdXJjZSksIGJ1dCBwbGVhc2UKPiAgICAg
IHRlc3QgYWdhaW4uCj4gLS0tCj4gIGRyaXZlcnMvcmVndWxhdG9yL2NvcmUuYyB8IDIgKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3JlZ3VsYXRvci9jb3JlLmMgYi9kcml2ZXJzL3JlZ3VsYXRvci9jb3JlLmMKPiBpbmRleCBhNGZm
ZDcxNjk2ZGEuLmE1YWQ1NTNkYThjZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3JlZ3VsYXRvci9j
b3JlLmMKPiArKysgYi9kcml2ZXJzL3JlZ3VsYXRvci9jb3JlLmMKPiBAQCAtNDE2NSw2ICs0MTY1
LDggQEAgaW50IHJlZ3VsYXRvcl9nZXRfdm9sdGFnZV9yZGV2KHN0cnVjdCByZWd1bGF0b3JfZGV2
ICpyZGV2KQo+ICAJCXJldCA9IHJkZXYtPmRlc2MtPmZpeGVkX3VWOwo+ICAJfSBlbHNlIGlmIChy
ZGV2LT5zdXBwbHkpIHsKPiAgCQlyZXQgPSByZWd1bGF0b3JfZ2V0X3ZvbHRhZ2VfcmRldihyZGV2
LT5zdXBwbHktPnJkZXYpOwo+ICsJfSBlbHNlIGlmIChyZGV2LT5zdXBwbHlfbmFtZSkgewo+ICsJ
CXJldHVybiAtRVBST0JFX0RFRkVSOwo+ICAJfSBlbHNlIHsKPiAgCQlyZXR1cm4gLUVJTlZBTDsK
PiAgCX0KPiAtLSAKPiAyLjIwLjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
