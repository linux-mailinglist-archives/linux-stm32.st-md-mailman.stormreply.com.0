Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F75E975917
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Sep 2024 19:13:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D63E1C6C841;
	Wed, 11 Sep 2024 17:12:59 +0000 (UTC)
Received: from a7-41.smtp-out.eu-west-1.amazonses.com
 (a7-41.smtp-out.eu-west-1.amazonses.com [54.240.7.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF78BC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 17:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726074778;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding;
 bh=pY0QRPVSLQyOqdQm02m89lv3jyiXKxLhfdk4Z8VM6Bw=;
 b=QZEcnn40Vic/RkCuKPK1LG0d6+2GuxUxCMAWug1hgjltjiYHADj0ghfZksJMnMDL
 IJvLsFkz9sL8HoP9cODS7qS14KAqFJac562uZTfUlM0/ZZpGF6neLiZ0tmob0OJWY3F
 br78oKlouu2tqs/+sG4Efwv5tBXFsyR514Or8x8WF7lu+9tp0+Sf295BZkuEZzLugQE
 hHRtuarJn5X8YJnAQUhnewL89juib8revxHIMQl5gC9IbPzsgFQl5XFKlChDNvBuuv7
 SANobzIsm2KmlwrNQgedxZw2NnkkAqH2lkHmkqP0Ltoa83zcIB0YxHY1A+NDpEdGuAN
 MPxOjL+vWQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726074778;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=pY0QRPVSLQyOqdQm02m89lv3jyiXKxLhfdk4Z8VM6Bw=;
 b=b2ySp0oMmFJFKJq7Jl6wf2M2Ckz6imfBUfVim+b/0UtAfSFAE1gIJarN2FetMmak
 mrfInnzCURLnBrkMbbwofS+JLMNP2Vcwn10l+LS3K6qaJqzpNjGR0Q9csvYNQF3eZK8
 Nwchwv0b6nSixvqBReKBO5PtEqgZEhg7LrXyXRRs=
Message-ID: <01020191e212f333-703af7d0-fc68-4f47-b55c-6c0c3de6708a-000000@eu-west-1.amazonses.com>
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Fritz Koenig <frkoenig@chromium.org>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 11 Sep 2024 17:12:58 +0000
In-Reply-To: <20240911135011.161217-2-hugues.fruchet@foss.st.com>
References: <20240911135011.161217-1-hugues.fruchet@foss.st.com>
 <20240911135011.161217-2-hugues.fruchet@foss.st.com>
Organization: Collabora
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.11-54.240.7.41
Subject: Re: [Linux-stm32] [PATCH 1/2] media: uapi: add WebP VP8 frame flag
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

SGkgSHVndWVzLAoKTGUgbWVyY3JlZGkgMTEgc2VwdGVtYnJlIDIwMjQgw6AgMTU6NTAgKzAyMDAs
IEh1Z3VlcyBGcnVjaGV0IGEgw6ljcml0wqA6Cj4gQWRkIGEgZmxhZyBpbmRpY2F0aW5nIHRoYXQg
VlA4IGJpdHN0cmVhbSBpcyBhIFdlYlAgcGljdHVyZS4KClNvdW5kcyBsaWtlIHRoZXJlIHNob3Vs
ZCBiZSBzb21lIGNvZGUgY2hhbmdlcyBpbiBHU3RyZWFtZXIgdGhhdCB5b3UgaGF2ZW4ndApkaXNj
bG9zZWQuIE1pbmQgc2hhcmluZyBob3cgdGhpcyBuZXcgdUFQSSBpcyB1c2VkID8gSSB3b3VsZCBh
bHNvIGV4cGVjdCB0aGlzCmNvbW1pdCBtZXNzYWdlIHRvIGdpdmUgbW9yZSBpbnNpZ2h0IG9uIHdo
YXQgaXMgc3BlY2lhbCBhYm91dCBXZWJQIHRoYXQgbWFrZXMKdGhpcyBmbGFnIHJlcXVpcmVkLgoK
SSB3b3VsZCBhbHNvIG5lZWQgc29tZSBtb3JlIEFQSSBvciBkb2N1bWVudGF0aW9uIHRoYXQgZXhw
bGFpbiBob3cgd2UgY2FuCmRpZmZlcmVudGlhdGUgYSB1cHN0cmVhbSBkZWNvZGVyIHRoYXQgaXMg
Y2FwYWJsZSBvZiBXZWJQIGRlY29kaW5nIGZyb20gb25lIHRoYXQKZG9lcyBub3QuIEkgd29uZGVy
IGlmIGl0IHdvdWxkIG5vdCBoYXZlIGJlZW4gYmV0dGVyIHRvIGRlZmluZSBhIG5ldyBmb3JtYXQg
PwpUaGF0IGJlaW5nIHNhaWQsIEkgaGF2ZW4ndCBsb29rZWQgYXQgYWxsIGluIHRoZSBzcGVjaWZp
Y2F0aW9uIGFuZCBvbmx5IHJlbHkgb24KeW91ciBjb3ZlciBsZXR0ZXIgYW5kIHBhdGNoIHNlcmll
cy4KCk5pY29sYXMKCj4gCj4gU2lnbmVkLW9mZi1ieTogSHVndWVzIEZydWNoZXQgPGh1Z3Vlcy5m
cnVjaGV0QGZvc3Muc3QuY29tPgo+IC0tLQo+ICAuLi4vdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwv
ZXh0LWN0cmxzLWNvZGVjLXN0YXRlbGVzcy5yc3QgICAgICB8IDMgKysrCj4gIGluY2x1ZGUvdWFw
aS9saW51eC92NGwyLWNvbnRyb2xzLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSAr
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvZXh0LWN0cmxzLWNvZGVjLXN0YXRl
bGVzcy5yc3QgYi9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL2V4dC1jdHJs
cy1jb2RlYy1zdGF0ZWxlc3MucnN0Cj4gaW5kZXggMGRhNjM1NjkxZmRjLi5iYjA4YWFjZGRjOWMg
MTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0bC9leHQt
Y3RybHMtY29kZWMtc3RhdGVsZXNzLnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vdXNlcnNwYWNl
LWFwaS9tZWRpYS92NGwvZXh0LWN0cmxzLWNvZGVjLXN0YXRlbGVzcy5yc3QKPiBAQCAtMTA2Miw2
ICsxMDYyLDkgQEAgRldIVCBGbGFncwo+ICAgICAgKiAtIGBgVjRMMl9WUDhfRlJBTUVfRkxBR19T
SUdOX0JJQVNfQUxUYGAKPiAgICAgICAgLSAweDIwCj4gICAgICAgIC0gU2lnbiBvZiBtb3Rpb24g
dmVjdG9ycyB3aGVuIHRoZSBhbHQgZnJhbWUgaXMgcmVmZXJlbmNlZC4KPiArICAgICogLSBgYFY0
TDJfVlA4X0ZSQU1FX0ZMQUdfV0VCUGBgCj4gKyAgICAgIC0gMHg0MAo+ICsgICAgICAtIEluZGlj
YXRlcyB0aGF0IHRoaXMgZnJhbWUgaXMgYSBXZWJQIHBpY3R1cmUuCj4gIAo+ICAuLiBjOnR5cGU6
OiB2NGwyX3ZwOF9lbnRyb3B5X2NvZGVyX3N0YXRlCj4gIAo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L3VhcGkvbGludXgvdjRsMi1jb250cm9scy5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L3Y0bDItY29u
dHJvbHMuaAo+IGluZGV4IDk3NGZkMjU0ZTU3My4uZTQxYjYyZjJjYjJiIDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvdWFwaS9saW51eC92NGwyLWNvbnRyb2xzLmgKPiArKysgYi9pbmNsdWRlL3VhcGkv
bGludXgvdjRsMi1jb250cm9scy5oCj4gQEAgLTE4OTcsNiArMTg5Nyw3IEBAIHN0cnVjdCB2NGwy
X3ZwOF9lbnRyb3B5X2NvZGVyX3N0YXRlIHsKPiAgI2RlZmluZSBWNEwyX1ZQOF9GUkFNRV9GTEFH
X01CX05PX1NLSVBfQ09FRkYJMHgwOAo+ICAjZGVmaW5lIFY0TDJfVlA4X0ZSQU1FX0ZMQUdfU0lH
Tl9CSUFTX0dPTERFTgkweDEwCj4gICNkZWZpbmUgVjRMMl9WUDhfRlJBTUVfRkxBR19TSUdOX0JJ
QVNfQUxUCTB4MjAKPiArI2RlZmluZSBWNEwyX1ZQOF9GUkFNRV9GTEFHX1dFQlAJCTB4NDAKPiAg
Cj4gICNkZWZpbmUgVjRMMl9WUDhfRlJBTUVfSVNfS0VZX0ZSQU1FKGhkcikgXAo+ICAJKCEhKCho
ZHIpLT5mbGFncyAmIFY0TDJfVlA4X0ZSQU1FX0ZMQUdfS0VZX0ZSQU1FKSkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
