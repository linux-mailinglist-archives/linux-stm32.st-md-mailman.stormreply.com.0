Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8A19658F7
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 09:46:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52D94C6DD9A;
	Fri, 30 Aug 2024 07:46:01 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28BBDC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 07:45:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36B771BF209;
 Fri, 30 Aug 2024 07:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1725003953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpebzrTQoNRUKh5ynrlO5Iu8naFvX7FtDOTwf/qOm4A=;
 b=KkNtioU+WkZU8XZauR1n22NpmH71HFly2u9LmqlUqpZSjxsw4D3GNaQ5b8RXOdRP1vIblG
 1BuAc/S3FaJlaTnMaxMPR0UE6gbAg476eLE/QamnjS9z+uIOF2mwRoIfCgwHv835j1RtvW
 m0zsNyod3wMcqq8cnPB1jN2H1P6rmLDO9HHI5S1UQ/laGZiXm+EjSjV2R6wuv2noboi4nH
 3Pq8Msc6rC+4ul0Zncwyhvt9s65q90WrR6JI+3/LBW8ChufwLbugaEO9c6DU+S+OwMiqoi
 p4PFJKlUzZmlxJsYYFb4y8Su6oy3DiguDX/0m3yFr7XoBLtTPvwInK9gm+PLaw==
Date: Fri, 30 Aug 2024 09:45:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Message-ID: <20240830094549.1c513ba2@xps-13>
In-Reply-To: <c29263ae-89f1-edd7-003a-bd03cdddc821@huawei.com>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
 <20240826115213.389acaef@xps-13>
 <f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
 <20240826144917.2c4e202d@xps-13>
 <c29263ae-89f1-edd7-003a-bd03cdddc821@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
Cc: val@packett.cool, vigneshr@ti.com, kees@kernel.org,
 linux-kernel@vger.kernel.org, erick.archer@gmx.com, liang.yang@amlogic.com,
 linux-mtd@lists.infradead.org, jernej.skrabec@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, robh@kernel.org,
 samuel@sholland.org, richard@nod.at, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, wens@csie.org,
 u.kleine-koenig@pengutronix.de, jbrunet@baylibre.com, linux@treblig.org,
 martin.blumenstingl@googlemail.com, christophe.jaillet@wanadoo.fr,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 gustavoars@kernel.org, linux-renesas-soc@vger.kernel.org,
 mcoquelin.stm32@gmail.com, khilman@baylibre.com,
 linux-mediatek@lists.infradead.org, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH -next RESEND 00/10] mtd: Use
 for_each_child_of_node_scoped()
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

SmluamllLAoKcnVhbmppbmppZUBodWF3ZWkuY29tIHdyb3RlIG9uIEZyaSwgMzAgQXVnIDIwMjQg
MTQ6MzQ6MzggKzA4MDA6Cgo+IE9uIDIwMjQvOC8yNiAyMDo0OSwgTWlxdWVsIFJheW5hbCB3cm90
ZToKPiA+IEhpIEtyenlzenRvZiwKPiA+IAo+ID4ga3J6a0BrZXJuZWwub3JnIHdyb3RlIG9uIE1v
biwgMjYgQXVnIDIwMjQgMTI6MTk6MDcgKzAyMDA6Cj4gPiAgIAo+ID4+IE9uIDI2LzA4LzIwMjQg
MTE6NTIsIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAKPiA+Pj4gSGkgSmluamllLAo+ID4+Pgo+ID4+
PiBydWFuamluamllQGh1YXdlaS5jb20gd3JvdGUgb24gTW9uLCAyNiBBdWcgMjAyNCAxNzo0Mzox
OCArMDgwMDoKPiA+Pj4gICAgIAo+ID4+Pj4gVXNlIHNjb3BlZCBmb3JfZWFjaF9hdmFpbGFibGVf
Y2hpbGRfb2Zfbm9kZV9zY29wZWQoKSB3aGVuIGl0ZXJhdGluZyBvdmVyCj4gPj4+PiBkZXZpY2Ug
bm9kZXMgdG8gbWFrZSBjb2RlIGEgYml0IHNpbXBsZXIuICAgIAo+ID4+Pgo+ID4+PiBXaHkgaXMg
dGhpcyBhIHJlc2VuZCA/IERpZCBJIG1pc3MgYSBwcmV2aW91cyBpdGVyYXRpb24/ICAgIAo+ID4+
Cj4gPj4gWW91IHdlcmUgbm90IGNjLWVkIG9uIHByZXZpb3VzIGl0ZXJhdGlvbi4gSSBhc2tlZCBm
b3IgcHJvcGVyIHNwbGl0Cj4gPj4gYmV0d2VlbiBzdWJzeXN0ZW1zIGFuZCBzZW5kaW5nIHRvIG1h
aW50YWluZXJzLCB0aHVzIHRoaXMgcmVzZW5kLiAgCj4gPiAKPiA+IE9rLiBNYWtlcyBzZW5zZSwg
YW5kIHRoZSBwYXRjaHNldCBsb29rcyBmaW5lLiAgCj4gCj4gSGksIE1pcXVlbCwKPiAKPiBDb3Vs
ZCB0aGlzIHNlcmllcyBiZSBtZXJnZWQsIHRoYW5rIHlvdSEKCllvdSd2ZSBzZW50IHRoaXMgc2Vy
aWVzIG9uIE1vbmRheSwgd2UgYXJlIEZyaWRheS4gSSBhbnN3ZXJlZCBhIGZpcnN0CnRpbWUgd2l0
aGluIDVoIGFuZCByZXZpZXdlZCBpdCB3aXRoaW4gOGguIFNvIHRoYXQgbWVhbnMgSSB3aWxsIHRh
a2UgdGhlCnBhdGNoc2V0OgotIHdoZW4gSSBoYXZlIHRoZSB0aW1lIHRvIGRvIHNvCi0gYWZ0ZXIg
c2V2ZXJhbCBkYXlzIHRvIGdpdmUgYSBjaGFuY2UgdG8gb3RoZXIgdG8gcmV2aWV3IGl0IGFzIHdl
bGwKLSB1bmxlc3Mgc29tZW9uZSBzcGVha3MgdXAgYWdhaW5zdCBpdCBpbiBhICJyZWFzb25hYmxl
IHRpbWUgZnJhbWUiCi0gdW5sZXNzIGEgcm9ib3QgdGhhdCBwYXJzZXMgdGhlIHBhdGNoZXMgb24g
dGhlIG1haWxpbmcgbGlzdHMgY29tcGxhaW5zCiAgYWJvdXQgaXQgKHVzdWFsbHkgd2l0aGluIGZl
dyBkYXlzLCB1cCB0byBhIHdlZWspLgoKSW4gZ2VuZXJhbCwgYSBnb29kIHJ1bGUgb2YgdGh1bWIg
aXMgdG8gcmVmcmFpbiB5b3Vyc2VsZiBmcm9tIHBpbmdpbmcKd2l0aGluIDIgd2Vla3MgZm9yIG5v
bi11cmdlbnQgbWF0dGVycyBsaWtlIHRoaXMgc2VyaWVzLgoKVGhhbmtzLApNaXF1w6hsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
