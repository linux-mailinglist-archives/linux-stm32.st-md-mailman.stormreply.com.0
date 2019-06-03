Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A87337C4
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2019 20:25:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59687CBC201
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2019 18:25:14 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8F88CBB8DF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2019 18:25:12 +0000 (UTC)
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 125B44000A;
 Mon,  3 Jun 2019 18:25:04 +0000 (UTC)
Date: Mon, 3 Jun 2019 19:53:09 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: linux-sunxi@googlegroups.com, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Message-ID: <20190603175309.qjlyfymbl6ybrpag@flea>
References: <20190527162237.18495-1-megous@megous.com>
 <20190531125246.qqfvmgmw2mv442tq@core.my.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190531125246.qqfvmgmw2mv442tq@core.my.home>
User-Agent: NeoMutt/20180716
Subject: Re: [Linux-stm32] [linux-sunxi] [PATCH v6 0/6] Add support for
	Orange Pi 3
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

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMDI6NTI6NDZQTSArMDIwMCwgT25kxZllaiBKaXJtYW4g
d3JvdGU6Cj4gSGVsbG8sCj4KPiBPbiBNb24sIE1heSAyNywgMjAxOSBhdCAwNjoyMjozMVBNICsw
MjAwLCBtZWdvdXMgdmlhIGxpbnV4LXN1bnhpIHdyb3RlOgo+ID4gRnJvbTogT25kcmVqIEppcm1h
biA8bWVnb3VzQG1lZ291cy5jb20+Cj4gPgo+ID4gVGhpcyBzZXJpZXMgaW1wbGVtZW50cyBzdXBw
b3J0IGZvciBYdW5sb25nIE9yYW5nZSBQaSAzIGJvYXJkLgo+ID4KPiA+IFVuZm9ydHVuYXRlbHks
IHRoaXMgYm9hcmQgbmVlZHMgc29tZSBzbWFsbCBkcml2ZXIgcGF0Y2hlcywgc28gSSBoYXZlCj4g
PiBzcGxpdCB0aGUgYm9hcmRzIERUIHBhdGNoIGludG8gY2h1bmtzIHRoYXQgcmVxdWlyZSBwYXRj
aGVzIGZvciBkcml2ZXJzCj4gPiBpbiB2YXJpb3VzIHN1YnN5c3RlbXMuCj4gPgo+ID4gU3VnZ2Vz
dGVkIG1lcmdpbmcgcGxhbi9kZXBlbmRlbmNpZXM6Cj4gPgo+ID4gLSBzdG1tYWMgcGF0Y2hlcyBh
cmUgbmVlZGVkIGZvciBldGhlcm5ldCBzdXBwb3J0IChwYXRjaGVzIDEtMykKPiA+ICAgLSB0aGVz
ZSBzaG91bGQgYmUgcmVhZHkgbm93Cj4gPiAtIEhETUkgc3VwcG9ydCAocGF0Y2hlcyA0LTYpCj4g
PiAgIC0gc2hvdWxkIGJlIHJlYWR5Cj4KPiBJZiB0aGVyZSBhcmUgbm8gZnV0aGVyIGNvbW1lbnRz
LCBjYW4gYWxsIHRoZXNlIHBhdGNoZXMgcGxlYXNlIGJlIG1lcmdlZD8KCkknbSB3YWl0aW5nIGZv
ciBzb21lIGZlZWRiYWNrIG9uIHRoZSBzdG1tYWMgYW5kIHRoZSBEVy1IRE1JCmRldmVsb3BwZXJz
IHRvIG1lcmdlIHRoZSByZXN0CgpNYXhpbWUKCi0tCk1heGltZSBSaXBhcmQsIEJvb3RsaW4KRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
