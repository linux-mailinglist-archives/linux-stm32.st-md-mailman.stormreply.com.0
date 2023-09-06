Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9684B793649
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Sep 2023 09:32:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AEFDC6B459;
	Wed,  6 Sep 2023 07:32:58 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D0D5C6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Sep 2023 07:32:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id AE8CECE134F;
 Wed,  6 Sep 2023 07:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5279AC433C7;
 Wed,  6 Sep 2023 07:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693985571;
 bh=rA6dVSbG+dQq5j1TWqDv/sU8ofco7JkJsESS9r4nexI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EpiIJ1va/OaAlymFCx4jcMot106SymqceVmqONNNcqQY7R0gUrH7ExLhQnq0I2rom
 sqbmxWokxHdagxbPRmcjYpRL/F+JoszpNW/CcEooYOOxN93NYtShdQYC79Vp80EiBi
 fcLosiNlmJQGKRmnBwcMmRFohwBvq25CcgfF1UnSS/80BquP9HaE//Tq2S6tbULpv/
 IFhG0Q7/jCxFx7rxL2HIUQObVHoudFj5jhUpD9fezJisUDgt9riqCEmocbFrMJiT6E
 EMAsBWawBRUO/i9hdvZmHdsd+Nf6i7ZnFBY6e8tweB9P2NpzHoIeEod1USOwjIu2cv
 WmD32kkBWNwzg==
Date: Wed, 6 Sep 2023 09:32:47 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <20230906073247.hjzjywivxzt3lcxw@zenone.zhora.eu>
References: <20230816080552.3045491-1-sean@geanix.com>
 <20230903124620.6yrnpbpj37on6wih@zenone.zhora.eu>
 <6A1B6BF0-C298-43D3-9B63-0FB1EC9E902B@geanix.com>
 <20230905230821.h7a7thjgm2do3w64@zenone.zhora.eu>
 <2356AD12-9631-4707-8EA5-385E9D6A5716@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2356AD12-9631-4707-8EA5-385E9D6A5716@geanix.com>
Cc: linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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

SGkgU2VhbiwKCj4gPj4+PiBAQCAtMzU3LDYgKzM1Nyw3IEBAIHN0cnVjdCBzdG0zMmY3X2kyY19k
ZXYgewo+ID4+Pj4gdTMyIGRuZl9kdDsKPiA+Pj4+IHUzMiBkbmY7Cj4gPj4+PiBzdHJ1Y3Qgc3Rt
MzJmN19pMmNfYWxlcnQgKmFsZXJ0Owo+ID4+Pj4gKyBib29sIGF0b21pYzsKPiA+Pj4gCj4gPj4+
IHRoaXMgc21lbGxzIGEgYml0IHJhY3kgaGVyZSwgdGhpcyB3b3JrcyBvbmx5IGlmIHRoZSB4ZmVy
J3MgYXJlCj4gPj4+IGFsd2F5cyBzZXF1ZW50aWFsLgo+ID4+PiAKPiA+Pj4gV2hhdCBoYXBwZW5z
IHdoZW4gd2UgcmVjZWl2ZSBhdCB0aGUgc2FtZSB0aW1lIHR3byB4ZmVyJ3MsIG9uZQo+ID4+PiBh
dG9taWMgYW5kIG9uZSBub24gYXRvbWljPwo+ID4+IAo+ID4+IEZyb20gdGhlIGluY2x1ZGUvaTJj
Lmg6Cj4gPj4gKiBAbWFzdGVyX3hmZXJfYXRvbWljOiBzYW1lIGFzIEBtYXN0ZXJfeGZlci4gWWV0
LCBvbmx5IHVzaW5nIGF0b21pYyBjb250ZXh0Cj4gPj4gKiAgIHNvIGUuZy4gUE1JQ3MgY2FuIGJl
IGFjY2Vzc2VkIHZlcnkgbGF0ZSBiZWZvcmUgc2h1dGRvd24uIE9wdGlvbmFsLgo+ID4+IAo+ID4+
IFNvIGl04oCZcyBvbmx5IHVzZWQgdmVyeSBsYXRlIGluIHRoZSBzaHV0ZG93bi4KPiA+PiAKPiA+
PiBJdOKAmXMgaW1wbGVtZW50ZWQgdGhlIHNhbWUgd2F5IGFzIGluOgo+ID4+IGRyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtaW14LmMKPiA+PiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1lc29uLmMKPiA+
PiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW12NjR4eHguYwo+ID4+IGRyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtdGVncmEuYwo+ID4+IOKApiBldGPigKYKPiA+PiAKPiA+PiAKPiA+PiBJbiBkcml2ZXJz
L2kyYy9pMmMtY29yZS5oIGl04oCZcyBkZXRlcm1pbmVkIHdoZXRoZXIgaXTigJlzIGF0b21pYyB0
cmFuc2ZlciBvciBub3Q6Cj4gPj4gCj4gPj4gLyoKPiA+PiAqIFdlIG9ubHkgYWxsb3cgYXRvbWlj
IHRyYW5zZmVycyBmb3IgdmVyeSBsYXRlIGNvbW11bmljYXRpb24sIGUuZy4gdG8gYWNjZXNzIGEK
PiA+PiAqIFBNSUMgd2hlbiBwb3dlcmluZyBkb3duLiBBdG9taWMgdHJhbnNmZXJzIGFyZSBhIGNv
cm5lciBjYXNlIGFuZCBub3QgZm9yCj4gPj4gKiBnZW5lcmljIHVzZSEKPiA+PiAqLwo+ID4+IHN0
YXRpYyBpbmxpbmUgYm9vbCBpMmNfaW5fYXRvbWljX3hmZXJfbW9kZSh2b2lkKQo+ID4+IHsKPiA+
PiAgICAgICAgcmV0dXJuIHN5c3RlbV9zdGF0ZSA+IFNZU1RFTV9SVU5OSU5HICYmIGlycXNfZGlz
YWJsZWQoKTsKPiA+PiB9Cj4gPj4gCj4gPj4gU28geW91IHdvdWxkIG5vdCBoYXZlIGFuIGF0b21p
YyB0cmFuc2ZlciBhbmQgbGF0ZXIgYW4gbm9uIGF0b21pYy4KPiA+IAo+ID4gV2hhdCBhYm91dCB0
aGUgb3Bwb3NpdGU/IEkuZS4gYSBub24gYXRvbWljIGFuZCBsYXRlciBhbiBhdG9taWMsCj4gPiBm
b3IgdmVyeSBsYXRlIHRhcmRpdmUgY29tbXVuaWNhdGlvbnMgOikKPiAKPiBTdXJlIGl04oCZcyB0
aGUgb3Bwb3NpdGU/IE5vcm1hbCBzY2VuYXJpbyBpcyDigJxub24gYXRvbWlj4oCdIHRyYW5zZmVy
cyBnb2luZyBvbiBhbmQgdW5kZXIgc2h1dGRvd24gaXQgc3dpdGNoZXMgdG8g4oCcYXRvbWlj4oCd
Lgo+IEZyb20gaTJjX2luX2F0b21pY194ZmVyX21vZGUoKSBpdCBjYW7igJl0IGdvIGZyb20g4oCc
YXRvbWlj4oCdIC0+IOKAnG5vbiBhdG9taWPigJ0uCgp3ZWxsIGF0IHNvbWUgcG9pbnQgd2UgbW92
ZSBmcm9tIG5vbiBhdG9taWMgdG8gYXRvbWljIGFuZCB3ZQpwcmVlbXB0IHdoYXRldmVyIGlzIG5v
biBhdG9taWMgaW4gb3JkZXIgdG8gZ28gYXRvbWljLCBpbmNsdWRpbmcKbm9uIGF0b21pYyB0cmFu
c2ZlcnMuCgpBICJnbG9iYWwiIHZhcmlhYmxlIHRocm93biB0aGVyZSB3aXRob3V0IHByb3RlY3Rp
b24gaXMgYSBiaXQgd2VhawphbmQgd2UgbmVlZCB0byBiZSBzdXJlIHRvIGJlIGNvdmVyaW5nIGFs
bCBwb3NzaWJsZSBzY2VuYXJpb3Mgd2hlbgp0aGlzIHZhcmlhYmxlIGlzIHVzZWQuCgo+IGV4dGVy
biBlbnVtIHN5c3RlbV9zdGF0ZXMgewo+IFNZU1RFTV9CT09USU5HLAo+IFNZU1RFTV9TQ0hFRFVM
SU5HLAo+IFNZU1RFTV9GUkVFSU5HX0lOSVRNRU0sCj4gU1lTVEVNX1JVTk5JTkcsCj4gU1lTVEVN
X0hBTFQsCj4gU1lTVEVNX1BPV0VSX09GRiwKPiBTWVNURU1fUkVTVEFSVCwKPiBTWVNURU1fU1VT
UEVORCwKPiB9IHN5c3RlbV9zdGF0ZTsKPiAKPiBJZiB5b3UgYXJlIGFza2luZyB3aGF0IGhhcHBl
bnMgaWYgYSDigJxub24gYXRvbWlj4oCdIHRyYW5zZmVyIGlzIG9uZ29pbmcgYW5kIGlyceKAmXMg
aXMgZGlzYWJsZWQsIElESy4KPiAKPiBMZXTigJlzIGdldCBXb2xmcmFtIGluIHRoZSBsb29wIChT
b3JyeSBJIGZvcmdvdCB0byBhZGQgeW91KSA6KQoKTmFoLCBpdCdzIE9LLi4uIEkgYW0gdGhpbmtp
bmcgYWxvdWQgaGVyZSBhbmQgdHJ5aW5nIHRvIGNvdmVyCnBvc3NpYmxlIHNjZW5hcmlvcy4gSSBh
bHNvIHRoaW5rIHRoYXQgc2V0dGluZyB1cCBhIHNwaW5sb2NrIG1pZ2h0CmJlIHRvbyBtdWNoIHBh
cmFub2lhYyBhbmQgbm90IG5lY2Vzc2FyeS4KCkknbSBnb2luZyB0byBhY2sgaXQuLi4gYnV0IEkg
d2lsbCBrZWVwIGEgZmV3IHRob3VnaHRzIG9uIHRoaW5raW5nCndoYXQgY2FuIGhhcHBlbiB3cm9u
ZyBoZXJlLgoKQWNrZWQtYnk6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAa2VybmVsLm9yZz4gCgpB
bmRpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
