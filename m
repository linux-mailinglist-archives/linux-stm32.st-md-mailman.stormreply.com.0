Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C93CA7935DC
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Sep 2023 09:03:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77634C6B459;
	Wed,  6 Sep 2023 07:03:20 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1731BC6B458
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Sep 2023 07:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
 In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=aUZigaIDl455uJFfM4atCFTc6YhwYkbBmi5D3Xd9bXo=; 
 b=bYMDk1tPSG6XcswwgitD4eqE3rSN6NMTKGbo7NKOr9+fvT1zazrwlZLXlk1vtq9Yj5m3zK8HhFr
 y12JaKP9Ma9UPQea1q2xLts73qU7gZ01WmuLshvD8f8pE3BHviF292FP0F4Wvqq0RFJmT31bzWlxT
 UHbmnwvR97hvqcaZL1Di0gRr6GdaDEb6Tn4HTu0PTXSObFeORMIT8Fhu9qgI1Ycd6O1qTGJ3heNyq
 YaHPaRXQX+g/7dP76tZbASISap3uV2yo80VH9DCKSX9+TyUok4iPyKfjl4n3KqhTrFOKrasvxi3m9
 AwhTjRWByj7xpzYcgvH8xslptUM0chRZZUNA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qdmZF-000Ds6-VT; Wed, 06 Sep 2023 09:03:13 +0200
Received: from [2a06:4004:10df:0:6ddf:934f:689b:4300] (helo=smtpclient.apple)
 by sslproxy05.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <sean@geanix.com>)
 id 1qdmZF-000Ul9-8A; Wed, 06 Sep 2023 09:03:13 +0200
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <20230905230821.h7a7thjgm2do3w64@zenone.zhora.eu>
Date: Wed, 6 Sep 2023 09:03:02 +0200
Message-Id: <2356AD12-9631-4707-8EA5-385E9D6A5716@geanix.com>
References: <20230816080552.3045491-1-sean@geanix.com>
 <20230903124620.6yrnpbpj37on6wih@zenone.zhora.eu>
 <6A1B6BF0-C298-43D3-9B63-0FB1EC9E902B@geanix.com>
 <20230905230821.h7a7thjgm2do3w64@zenone.zhora.eu>
To: Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27022/Tue Sep  5 09:59:33 2023)
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] i2c: stm32f7: Add atomic_xfer method
	to driver
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

SGkgQW5kaSwKCj4gT24gNiBTZXAgMjAyMywgYXQgMDEuMDgsIEFuZGkgU2h5dGkgPGFuZGkuc2h5
dGlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gCj4gSGkgU2VhbiwKPiAKPiBPbiBNb24sIFNlcCAwNCwg
MjAyMyBhdCAwNzoyOTo1OUFNICswMjAwLCBTZWFuIE55ZWtqYWVyIHdyb3RlOgo+PiBIaSBBbmR5
LAo+PiAKPj4+IE9uIDMgU2VwIDIwMjMsIGF0IDE0LjQ2LCBBbmRpIFNoeXRpIDxhbmRpLnNoeXRp
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4gCj4+PiBIaSBQaWVycmUtWXZlcywgQWxhaW4sCj4+PiAK
Pj4+IG1pbmQgdGFraW5nIGEgbG9vayBoZXJlPwo+Pj4gCj4+PiBbLi4uXQo+Pj4gCj4+Pj4gQEAg
LTM1Nyw2ICszNTcsNyBAQCBzdHJ1Y3Qgc3RtMzJmN19pMmNfZGV2IHsKPj4+PiB1MzIgZG5mX2R0
Owo+Pj4+IHUzMiBkbmY7Cj4+Pj4gc3RydWN0IHN0bTMyZjdfaTJjX2FsZXJ0ICphbGVydDsKPj4+
PiArIGJvb2wgYXRvbWljOwo+Pj4gCj4+PiB0aGlzIHNtZWxscyBhIGJpdCByYWN5IGhlcmUsIHRo
aXMgd29ya3Mgb25seSBpZiB0aGUgeGZlcidzIGFyZQo+Pj4gYWx3YXlzIHNlcXVlbnRpYWwuCj4+
PiAKPj4+IFdoYXQgaGFwcGVucyB3aGVuIHdlIHJlY2VpdmUgYXQgdGhlIHNhbWUgdGltZSB0d28g
eGZlcidzLCBvbmUKPj4+IGF0b21pYyBhbmQgb25lIG5vbiBhdG9taWM/Cj4+IAo+PiBGcm9tIHRo
ZSBpbmNsdWRlL2kyYy5oOgo+PiAqIEBtYXN0ZXJfeGZlcl9hdG9taWM6IHNhbWUgYXMgQG1hc3Rl
cl94ZmVyLiBZZXQsIG9ubHkgdXNpbmcgYXRvbWljIGNvbnRleHQKPj4gKiAgIHNvIGUuZy4gUE1J
Q3MgY2FuIGJlIGFjY2Vzc2VkIHZlcnkgbGF0ZSBiZWZvcmUgc2h1dGRvd24uIE9wdGlvbmFsLgo+
PiAKPj4gU28gaXTigJlzIG9ubHkgdXNlZCB2ZXJ5IGxhdGUgaW4gdGhlIHNodXRkb3duLgo+PiAK
Pj4gSXTigJlzIGltcGxlbWVudGVkIHRoZSBzYW1lIHdheSBhcyBpbjoKPj4gZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1pbXguYwo+PiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1lc29uLmMKPj4gZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1tdjY0eHh4LmMKPj4gZHJpdmVycy9pMmMvYnVzc2VzL2kyYy10
ZWdyYS5jCj4+IOKApiBldGPigKYKPj4gCj4+IAo+PiBJbiBkcml2ZXJzL2kyYy9pMmMtY29yZS5o
IGl04oCZcyBkZXRlcm1pbmVkIHdoZXRoZXIgaXTigJlzIGF0b21pYyB0cmFuc2ZlciBvciBub3Q6
Cj4+IAo+PiAvKgo+PiAqIFdlIG9ubHkgYWxsb3cgYXRvbWljIHRyYW5zZmVycyBmb3IgdmVyeSBs
YXRlIGNvbW11bmljYXRpb24sIGUuZy4gdG8gYWNjZXNzIGEKPj4gKiBQTUlDIHdoZW4gcG93ZXJp
bmcgZG93bi4gQXRvbWljIHRyYW5zZmVycyBhcmUgYSBjb3JuZXIgY2FzZSBhbmQgbm90IGZvcgo+
PiAqIGdlbmVyaWMgdXNlIQo+PiAqLwo+PiBzdGF0aWMgaW5saW5lIGJvb2wgaTJjX2luX2F0b21p
Y194ZmVyX21vZGUodm9pZCkKPj4gewo+PiAgICAgICAgcmV0dXJuIHN5c3RlbV9zdGF0ZSA+IFNZ
U1RFTV9SVU5OSU5HICYmIGlycXNfZGlzYWJsZWQoKTsKPj4gfQo+PiAKPj4gU28geW91IHdvdWxk
IG5vdCBoYXZlIGFuIGF0b21pYyB0cmFuc2ZlciBhbmQgbGF0ZXIgYW4gbm9uIGF0b21pYy4KPiAK
PiBXaGF0IGFib3V0IHRoZSBvcHBvc2l0ZT8gSS5lLiBhIG5vbiBhdG9taWMgYW5kIGxhdGVyIGFu
IGF0b21pYywKPiBmb3IgdmVyeSBsYXRlIHRhcmRpdmUgY29tbXVuaWNhdGlvbnMgOikKClN1cmUg
aXTigJlzIHRoZSBvcHBvc2l0ZT8gTm9ybWFsIHNjZW5hcmlvIGlzIOKAnG5vbiBhdG9taWPigJ0g
dHJhbnNmZXJzIGdvaW5nIG9uIGFuZCB1bmRlciBzaHV0ZG93biBpdCBzd2l0Y2hlcyB0byDigJxh
dG9taWPigJ0uCkZyb20gaTJjX2luX2F0b21pY194ZmVyX21vZGUoKSBpdCBjYW7igJl0IGdvIGZy
b20g4oCcYXRvbWlj4oCdIC0+IOKAnG5vbiBhdG9taWPigJ0uCgpleHRlcm4gZW51bSBzeXN0ZW1f
c3RhdGVzIHsKU1lTVEVNX0JPT1RJTkcsClNZU1RFTV9TQ0hFRFVMSU5HLApTWVNURU1fRlJFRUlO
R19JTklUTUVNLApTWVNURU1fUlVOTklORywKU1lTVEVNX0hBTFQsClNZU1RFTV9QT1dFUl9PRkYs
ClNZU1RFTV9SRVNUQVJULApTWVNURU1fU1VTUEVORCwKfSBzeXN0ZW1fc3RhdGU7CgpJZiB5b3Ug
YXJlIGFza2luZyB3aGF0IGhhcHBlbnMgaWYgYSDigJxub24gYXRvbWlj4oCdIHRyYW5zZmVyIGlz
IG9uZ29pbmcgYW5kIGlyceKAmXMgaXMgZGlzYWJsZWQsIElESy4KCkxldOKAmXMgZ2V0IFdvbGZy
YW0gaW4gdGhlIGxvb3AgKFNvcnJ5IEkgZm9yZ290IHRvIGFkZCB5b3UpIDopCgovU2VhbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
