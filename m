Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9543428461B
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Oct 2020 08:34:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C28CC32E90;
	Tue,  6 Oct 2020 06:34:35 +0000 (UTC)
Received: from mail.thorsis.com (mail.thorsis.com [92.198.35.195])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 380BFC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Oct 2020 06:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id DDD324F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Oct 2020 08:34:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QMLknCFHnyAL
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Oct 2020 08:34:31 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 259D93DF6; Tue,  6 Oct 2020 08:34:31 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
 version=3.4.2
From: Alexander Dahl <ada@thorsis.com>
To: Jeff LaBundy <jeff@labundy.com>
Date: Tue, 06 Oct 2020 08:34:23 +0200
Message-ID: <3367098.sbkyfNuaKI@ada>
In-Reply-To: <20201006021729.GA4822@labundy.com>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-4-post@lespocky.de> <20201006021729.GA4822@labundy.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Alexander Dahl <post@lespocky.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v7 03/12] dt-bindings: mfd: Fix schema
	warnings for pwm-leds
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGVsbG8gSmVmZiwKCkFtIERpZW5zdGFnLCA2LiBPa3RvYmVyIDIwMjAsIDA0OjE3OjI5IENFU1Qg
c2NocmllYiBKZWZmIExhQnVuZHk6Cj4gSGkgQWxleGFuZGVyLAo+IAo+IE9uIE1vbiwgT2N0IDA1
LCAyMDIwIGF0IDEwOjM0OjQyUE0gKzAyMDAsIEFsZXhhbmRlciBEYWhsIHdyb3RlOgo+ID4gVGhl
IG5vZGUgbmFtZXMgZm9yIGRldmljZXMgdXNpbmcgdGhlIHB3bS1sZWRzIGRyaXZlciBmb2xsb3cg
YSBjZXJ0YWluCj4gPiBuYW1pbmcgc2NoZW1lIChub3cpLiAgUGFyZW50IG5vZGUgbmFtZSBpcyBu
b3QgZW5mb3JjZWQsIGJ1dCByZWNvbW1lbmRlZAo+ID4gYnkgRFQgcHJvamVjdC4KPiA+IAo+ID4g
ICBEVEMgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvaXFzNjJ4LmV4
YW1wbGUuZHQueWFtbAo+ID4gICBDSEVDSyAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZmQvaXFzNjJ4LmV4YW1wbGUuZHQueWFtbAo+ID4gCj4gPiAvaG9tZS9hbGV4L2J1aWxk
L2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvaXFzNjJ4LmV4YW1w
bAo+ID4gZS5kdC55YW1sOiBwd21sZWRzOiAncGFuZWwnIGRvZXMgbm90IG1hdGNoIGFueSBvZiB0
aGUgcmVnZXhlczoKPiA+ICdebGVkKC1bMC05YS1mXSspPyQnLCAncGluY3RybC1bMC05XSsnPiAK
PiA+ICAgICAgICAgRnJvbSBzY2hlbWE6Cj4gPiAgICAgICAgIC9ob21lL2FsZXgvc3JjL2xpbnV4
L2xlZHMvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvCj4gPiAgICAgICAg
IGxlZHMtcHdtLnlhbWw+IAo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIERhaGwgPHBvc3RA
bGVzcG9ja3kuZGU+Cj4gPiAtLS0KPiA+IAo+ID4gTm90ZXM6Cj4gPiAgICAgdjYgLT4gdjc6Cj4g
PiAgICAgICAqIGFkZGVkIHdhcm5pbmcgbWVzc2FnZSB0byBjb21taXQgbWVzc2FnZSAoS3J6eXN6
dG9mIEtvemxvd3NraSkKPiA+ICAgICAKPiA+ICAgICB2NjoKPiA+ICAgICAgICogYWRkZWQgdGhp
cyBwYXRjaCB0byBzZXJpZXMKPiA+ICAKPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWZkL2lxczYyeC55YW1sIHwgNSArKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2lxczYyeC55YW1sCj4gPiBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvaXFzNjJ4LnlhbWwgaW5kZXgKPiA+IDU0MWIw
NmQ4MGU3My4uOTJkYzQ4YThkZmE3IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MngueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MngueWFtbAo+ID4gCj4gPiBAQCAtOTAsMTAgKzkw
LDExIEBAIGV4YW1wbGVzOgo+ID4gICAgICAgICAgICAgIH07Cj4gPiAgICAgIAo+ID4gICAgICB9
Owo+ID4gCj4gPiAtICAgIHB3bWxlZHMgewo+ID4gKyAgICBsZWQtY29udHJvbGxlciB7Cj4gPiAK
PiA+ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInB3bS1sZWRzIjsKPiA+IAo+ID4gLSAgICAg
ICAgICAgIHBhbmVsIHsKPiA+ICsgICAgICAgICAgICBsZWQtMSB7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICBsYWJlbCA9ICJwYW5lbCI7Cj4gPiAKPiA+ICAgICAgICAgICAgICAgICAgICAgIHB3
bXMgPSA8JmlxczYyMGFfcHdtIDAgMTAwMDAwMD47Cj4gPiAgICAgICAgICAgICAgICAgICAgICBt
YXgtYnJpZ2h0bmVzcyA9IDwyNTU+Owo+ID4gICAgICAgICAgICAgIAo+ID4gICAgICAgICAgICAg
IH07Cj4gCj4gSSBsaWtlIHRoZSBjb25zaXN0ZW5jeSB0aGlzIGJyaW5ncy4gTXkgb25seSBmZWVk
YmFjayBpcyB0aGF0IGluIHRoZSBvdGhlcgo+IGV4YW1wbGVzIEkgZm91bmQgKGNvbW1vbi55YW1s
IGFuZCBsZWRzLWdwaW8ueWFtbCksIHRoZSBjaGlsZHJlbiBjb3VudCBvZmYKPiBmcm9tIDAgKGUu
Zy4gbGVkLTApIGluc3RlYWQgb2YgMSBhcyB5b3VyIHNlcmllcyBhcHBlYXJzIHRvLgoKWW91J3Jl
IHJpZ2h0LiAgQW5kIHRoYXQncyBhbHNvIHRoZSBzYW1lIGluIGxlZHMtbHA1MHh4LnlhbWwgYW5k
IOKApiB3ZWxsIEkgZGlkIApub3QgbG9vayBjbG9zZSBlbm91Z2gsIG1heWJlIHRoZSBudW1iZXJp
bmcgc2NoZW1lIG9uIHRoZSBQQ0Igb24gbXkgZGVzayAKY29uZnVzZWQgbWUuCgpPa2F5LCB3ZSBh
cmUgYWxyZWFkeSB0YWxraW5nIGFib3V0IHN0YXJ0aW5nIGluZGV4LiAgV2hhdCBhYm91dCB0aGUg
cGFyZW50IApub2RlJ3MgImxlZC1jb250cm9sbGVyIiB0aGVuIGluIGNhc2UgdGhlcmUgYXJlIG1v
cmUgdGhhbiBvbmU/ICBJSVJDIFJvYiAKYWNrbm93bGVkZ2VkIHN0YXJ0aW5nIGZyb20gMSBsaWtl
ICJsZWQtY29udHJvbGxlci0xIiwgImxlZC1jb250cm9sbGVyLTIiIGFuZCAKc28gb24uCgo+IFRo
YXQncyBub3QgYSBodWdlIGRlYWw7IGl0IHNpbXBseSBzZWVtcyBtb3JlIGNvbnNpc3RlbnQgdG8g
Y291bnQgZnJvbSB0aGUKPiBmaXJzdCBpbmRleCBhbGxvd2VkIGJ5IHRoZSByZWdleCAoMCkuIFRo
ZSBwYXRjaCBpcyBzdGlsbCBmaW5lLCBhbmQgc286Cj4gCj4gQWNrZWQtYnk6IEplZmYgTGFCdW5k
eSA8amVmZkBsYWJ1bmR5LmNvbT4KClRoYW5rcy4KCkknbSBub3Qgc3VyZSBob3cgbWFueSBtb3Jl
IGl0ZXJhdGlvbnMgb2YgdGhpcyBzZXJpZXMgd2Ugd2lsbCBuZWVkLCBhdCBsZWFzdCAKb25lIGZv
ciB0aGUgYmluZGluZyBsaWNlbnNlIGFja3MgSSBndWVzcywgc28gSSBjb3VsZCBhbHNvIGFkYXB0
IHRoZSBjaGlsZCBub2RlIAppbmRleGVzIGluIHNjaGVtYSBhbmQgYWN0dWFsIGR0cyBmaWxlcyBp
biB2OCBvciBzby4KCkdyZWV0cwpBbGV4CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
