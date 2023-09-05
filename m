Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A279E793245
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Sep 2023 01:08:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FA94C6B454;
	Tue,  5 Sep 2023 23:08:29 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5030C6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Sep 2023 23:08:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6434AB81799;
 Tue,  5 Sep 2023 23:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A75C433CA;
 Tue,  5 Sep 2023 23:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693955306;
 bh=yN3H3YjGx5djVMJhiiOu/07Irs5mGEfUmfMim+pDEa4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mEeuWyoOBQU+VTAo6R8Q4ja+Cf90rehs0yXAScqj5zpFdDJ0tCoxhx0x0MADlMMuf
 cI2zrpqKtzETpJHDE81r86JNavwMrfBYDGKEkPBfuL13PPHmSmUwIaTLmP2iQc+k3q
 tfbCl2MD2DpHdX2lhTvKLWPhroUfm51DZlZaW80mh1G8fj3zhdI5YCi8q2Y4RQklYA
 BTId4jT8wSPl3xgcKW8w83vImzXesgRYkFQawwKFDkncnFj1V7z78fFRNfwRHGI3/z
 qxf4sfOdpdHoYzuc/03lSMD4wKEG7tkaFLUCxEMhqQzkfSZYffU8Lfrj1g5hif9Tl8
 UG0Fz7QJYimSg==
Date: Wed, 6 Sep 2023 01:08:21 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <20230905230821.h7a7thjgm2do3w64@zenone.zhora.eu>
References: <20230816080552.3045491-1-sean@geanix.com>
 <20230903124620.6yrnpbpj37on6wih@zenone.zhora.eu>
 <6A1B6BF0-C298-43D3-9B63-0FB1EC9E902B@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6A1B6BF0-C298-43D3-9B63-0FB1EC9E902B@geanix.com>
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

SGkgU2VhbiwKCk9uIE1vbiwgU2VwIDA0LCAyMDIzIGF0IDA3OjI5OjU5QU0gKzAyMDAsIFNlYW4g
Tnlla2phZXIgd3JvdGU6Cj4gSGkgQW5keSwKPiAKPiA+IE9uIDMgU2VwIDIwMjMsIGF0IDE0LjQ2
LCBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gCj4gPiBIaSBQ
aWVycmUtWXZlcywgQWxhaW4sCj4gPiAKPiA+IG1pbmQgdGFraW5nIGEgbG9vayBoZXJlPwo+ID4g
Cj4gPiBbLi4uXQo+ID4gCj4gPj4gQEAgLTM1Nyw2ICszNTcsNyBAQCBzdHJ1Y3Qgc3RtMzJmN19p
MmNfZGV2IHsKPiA+PiB1MzIgZG5mX2R0Owo+ID4+IHUzMiBkbmY7Cj4gPj4gc3RydWN0IHN0bTMy
ZjdfaTJjX2FsZXJ0ICphbGVydDsKPiA+PiArIGJvb2wgYXRvbWljOwo+ID4gCj4gPiB0aGlzIHNt
ZWxscyBhIGJpdCByYWN5IGhlcmUsIHRoaXMgd29ya3Mgb25seSBpZiB0aGUgeGZlcidzIGFyZQo+
ID4gYWx3YXlzIHNlcXVlbnRpYWwuCj4gPiAKPiA+IFdoYXQgaGFwcGVucyB3aGVuIHdlIHJlY2Vp
dmUgYXQgdGhlIHNhbWUgdGltZSB0d28geGZlcidzLCBvbmUKPiA+IGF0b21pYyBhbmQgb25lIG5v
biBhdG9taWM/Cj4gCj4gRnJvbSB0aGUgaW5jbHVkZS9pMmMuaDoKPiAgKiBAbWFzdGVyX3hmZXJf
YXRvbWljOiBzYW1lIGFzIEBtYXN0ZXJfeGZlci4gWWV0LCBvbmx5IHVzaW5nIGF0b21pYyBjb250
ZXh0Cj4gICogICBzbyBlLmcuIFBNSUNzIGNhbiBiZSBhY2Nlc3NlZCB2ZXJ5IGxhdGUgYmVmb3Jl
IHNodXRkb3duLiBPcHRpb25hbC4KPiAKPiBTbyBpdOKAmXMgb25seSB1c2VkIHZlcnkgbGF0ZSBp
biB0aGUgc2h1dGRvd24uCj4gCj4gSXTigJlzIGltcGxlbWVudGVkIHRoZSBzYW1lIHdheSBhcyBp
bjoKPiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5jCj4gZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1tZXNvbi5jCj4gZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdjY0eHh4LmMKPiBkcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLXRlZ3JhLmMKPiDigKYgZXRj4oCmCj4gCj4gCj4gSW4gZHJpdmVycy9pMmMv
aTJjLWNvcmUuaCBpdOKAmXMgZGV0ZXJtaW5lZCB3aGV0aGVyIGl04oCZcyBhdG9taWMgdHJhbnNm
ZXIgb3Igbm90Ogo+IAo+IC8qCj4gICogV2Ugb25seSBhbGxvdyBhdG9taWMgdHJhbnNmZXJzIGZv
ciB2ZXJ5IGxhdGUgY29tbXVuaWNhdGlvbiwgZS5nLiB0byBhY2Nlc3MgYQo+ICAqIFBNSUMgd2hl
biBwb3dlcmluZyBkb3duLiBBdG9taWMgdHJhbnNmZXJzIGFyZSBhIGNvcm5lciBjYXNlIGFuZCBu
b3QgZm9yCj4gICogZ2VuZXJpYyB1c2UhCj4gICovCj4gc3RhdGljIGlubGluZSBib29sIGkyY19p
bl9hdG9taWNfeGZlcl9tb2RlKHZvaWQpCj4gewo+ICAgICAgICAgcmV0dXJuIHN5c3RlbV9zdGF0
ZSA+IFNZU1RFTV9SVU5OSU5HICYmIGlycXNfZGlzYWJsZWQoKTsKPiB9Cj4gCj4gU28geW91IHdv
dWxkIG5vdCBoYXZlIGFuIGF0b21pYyB0cmFuc2ZlciBhbmQgbGF0ZXIgYW4gbm9uIGF0b21pYy4K
CldoYXQgYWJvdXQgdGhlIG9wcG9zaXRlPyBJLmUuIGEgbm9uIGF0b21pYyBhbmQgbGF0ZXIgYW4g
YXRvbWljLApmb3IgdmVyeSBsYXRlIHRhcmRpdmUgY29tbXVuaWNhdGlvbnMgOikKCkFuZGkKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
