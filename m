Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7989251C48
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2019 22:28:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C18EC5A4FD
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2019 20:28:59 +0000 (UTC)
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80C96C5A4FC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2019 20:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1561408136; bh=ebij2iMd2+jfNT2RnrG0rfsvu6bgvrUaIhcBD+2uT8k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ez2ClL820tax9ruDyvFd7tjrHWXeaFMT3WQ70YRkAuZXuooYJaI0bHitWPVD4PtYk
 crqCMMgvP5GhR51NkheM4lNM8F0KrnDcTmtkA5LgSRKjeMhAxcb0fGDyr5mOsWO3XB
 s/6tcRDgFEoJpxyemaGnaucncUPtp060iDqxi4N0=
Date: Mon, 24 Jun 2019 22:28:56 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: David Miller <davem@davemloft.net>
Message-ID: <20190624202856.ij4ujey2z6j5doxj@core.my.home>
Mail-Followup-To: David Miller <davem@davemloft.net>,
 linux-sunxi@googlegroups.com, maxime.ripard@bootlin.com,
 wens@csie.org, robh+dt@kernel.org, jernej.skrabec@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
 peppe.cavallaro@st.com, alexandre.torgue@st.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20190620134748.17866-1-megous@megous.com>
 <20190624.102927.1268781741493594465.davem@davemloft.net>
 <20190624174637.6sznc5ifiuh4c3sm@core.my.home>
 <20190624.132456.2013417744691373807.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624.132456.2013417744691373807.davem@davemloft.net>
Cc: mark.rutland@arm.com, joabreu@synopsys.com, devicetree@vger.kernel.org,
 maxime.ripard@bootlin.com, netdev@vger.kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org, airlied@linux.ie,
 linux-sunxi@googlegroups.com, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 0/6] Add support for Orange Pi 3
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

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDE6MjQ6NTZQTSAtMDcwMCwgRGF2aWQgTWlsbGVyIHdy
b3RlOgo+IEZyb206IE9uZMWZZWogSmlybWFuIDxtZWdvdXNAbWVnb3VzLmNvbT4KPiBEYXRlOiBN
b24sIDI0IEp1biAyMDE5IDE5OjQ2OjM3ICswMjAwCj4gCj4gPiBUaGlzIHNlcmllcyB3YXMgZXZl
biBsb25nZXIgYmVmb3JlLCB3aXRoIHBhdGNoZXMgYWxsIGFyb3VuZCBmb3IgdmFyaW91cwo+ID4g
bWFpbnRhaW5lcnMuIEknZCBleHBlY3QgdGhhdCByZWxldmFudCBtYWludGFpbmVycyBwaWNrIHRo
ZSByYW5nZSBvZiBwYXRjaGVzCj4gPiBtZWFudCBmb3IgdGhlbS4gSSBkb24ndCBrbm93IHdobydz
IGV4YWN0bHkgcmVzcG9uc2libGUgZm9yIHdoYXQsIGJ1dCBJIHRoaW5rLAo+ID4gdGhpcyBzaG91
bGQgd29yazoKPiA+IAo+ID4gLSAyIHN0bW1hYyBwYXRjaGVzIHNob3VsZCBnbyB0b2dldGhlciB2
aWEgc29tZSBuZXR3b3JraW5nIHRyZWUgKGlzIHRoZXJlCj4gPiAgIHNvbWV0aGluZyBzcGVjaWZp
YyBmb3Igc3RtbWFjPykKPiA+IC0gYWxsIERUUyBwYXRjaGVzIHNob3VsZCBnbyB2aWEgc3VueGkK
PiA+IC0gaGRtaSBwYXRjaGVzIHZpYSBzb21lIGRybSB0cmVlCj4gCj4gVGhhbmsgeW91LiAgU28g
SSdsbCBtZXJnZSB0aGUgZmlyc3QgdHdvIHBhdGNoZXMgdGhhdCB0b3VjaCB0aGUgc3RtbWFjCj4g
ZHJpdmVyIHZpYSBteSBuZXQtbmV4dCB0cmVlLgoKVGhhbmsgeW91LgoKcmVnYXJkcywKCU9uZHJl
agpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
