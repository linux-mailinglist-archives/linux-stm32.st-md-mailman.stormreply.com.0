Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89967B0AAF2
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Jul 2025 22:06:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C6C4C3F952;
	Fri, 18 Jul 2025 20:06:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA0CCC3F951
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jul 2025 20:06:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2E6B245C12;
 Fri, 18 Jul 2025 20:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2DFC4CEEB;
 Fri, 18 Jul 2025 20:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752869167;
 bh=iM/cBfn6qf7kJPZApTF05wjQcPVP4ARh8oIYFBvOnbQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y9sovkPL7D4ADsST94stWH0zK+qSnkGSP7rTG4uGBOET4Estd53I+YmUj05eVidQY
 Z+vhivYCZzdG4JK+0+6+msMFyJNHK0jd9mJWkgZjsA0rWpbTLQod7CrLL/6t4CGjlg
 WrBVfNMJ/dnR3gXbbikXOA620EjvAhW2I3S8j55lPP9Ac0ModgGoAYg7tSOm+89kbx
 8KW1iUdiwkv/vYGZ5+SIlNRxNvKXtkEX/dfo3XC8eIJM7pp91a1JUHBYV38eZXUUdO
 wRgL1XMesXepYg8WKV12cra7adqTbHIwuMPNInU5hpbA2zD1TOoriaAY73a9RXqiGl
 MGp/HZUCpQj3w==
Date: Fri, 18 Jul 2025 21:06:02 +0100
From: Simon Horman <horms@kernel.org>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Message-ID: <20250718200602.GM2459@horms.kernel.org>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-3-c34092a88a72@altera.com>
 <20250714134012.GN721198@horms.kernel.org>
 <9f4acd69-12ff-4b2f-bb3a-e8d401b23238@altera.com>
 <20250716082209.GH721198@horms.kernel.org>
 <38d05790-eb4a-482a-89ec-8c17cf2e9680@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38d05790-eb4a-482a-89ec-8c17cf2e9680@altera.com>
Cc: linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Set CIC bit
 only for TX queues with COE
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

T24gVGh1LCBKdWwgMTcsIDIwMjUgYXQgMTE6NTA6MDZBTSArMDUzMCwgRyBUaG9tYXMsIFJvaGFu
IHdyb3RlOgo+IEhpIFNpbW9uLAo+IAo+IE9uIDcvMTYvMjAyNSAxOjUyIFBNLCBTaW1vbiBIb3Jt
YW4gd3JvdGU6Cj4gPiBPbiBUdWUsIEp1bCAxNSwgMjAyNSBhdCAwNzoxNDoyMVBNICswNTMwLCBH
IFRob21hcywgUm9oYW4gd3JvdGU6Cj4gPiA+IEhpIFNpbW9uLAo+ID4gPiAKPiA+ID4gVGhhbmtz
IGZvciByZXZpZXdpbmcgdGhlIHBhdGNoLgo+ID4gPiAKPiA+ID4gT24gNy8xNC8yMDI1IDc6MTAg
UE0sIFNpbW9uIEhvcm1hbiB3cm90ZToKPiA+ID4gPiBPbiBNb24sIEp1bCAxNCwgMjAyNSBhdCAw
Mzo1OToxOVBNICswODAwLCBSb2hhbiBHIFRob21hcyB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4gPiA+
ID4gPiBGcm9tOiBSb2hhbiBHIFRob21hcyA8cm9oYW4uZy50aG9tYXNAYWx0ZXJhLmNvbT4KPiA+
ID4gPiA+IAo+ID4gPiA+ID4gQ3VycmVudGx5LCBpbiB0aGUgQUZfWERQIHRyYW5zbWl0IHBhdGhz
LCB0aGUgQ0lDIGJpdCBvZgo+ID4gPiA+ID4gVFggRGVzYzMgaXMgc2V0IGZvciBhbGwgcGFja2V0
cy4gU2V0dGluZyB0aGlzIGJpdCBmb3IKPiA+ID4gPiA+IHBhY2tldHMgdHJhbnNtaXR0aW5nIHRo
cm91Z2ggcXVldWVzIHRoYXQgZG9uJ3Qgc3VwcG9ydAo+ID4gPiA+ID4gY2hlY2tzdW0gb2ZmbG9h
ZGluZyBjYXVzZXMgdGhlIFRYIERNQSB0byBnZXQgc3R1Y2sgYWZ0ZXIKPiA+ID4gPiA+IHRyYW5z
bWl0dGluZyBzb21lIHBhY2tldHMuIFRoaXMgcGF0Y2ggZW5zdXJlcyB0aGUgQ0lDIGJpdAo+ID4g
PiA+ID4gb2YgVFggRGVzYzMgaXMgc2V0IG9ubHkgaWYgdGhlIFRYIHF1ZXVlIHN1cHBvcnRzIGNo
ZWNrc3VtCj4gPiA+ID4gPiBvZmZsb2FkaW5nLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBSb2hhbiBHIFRob21hcyA8cm9oYW4uZy50aG9tYXNAYWx0ZXJhLmNvbT4KPiA+ID4g
PiA+IFJldmlld2VkLWJ5OiBNYXR0aGV3IEdlcmxhY2ggPG1hdHRoZXcuZ2VybGFjaEBhbHRlcmEu
Y29tPgo+ID4gPiA+IAo+ID4gPiA+IEhpIFJvaGFuLAo+ID4gPiA+IAo+ID4gPiA+IEkgbm90aWNl
IHRoYXQgc3RtbWFjX3htaXQoKSBoYW5kbGVzIGEgZmV3IG90aGVyIGNhc2VzIHdoZXJlCj4gPiA+
ID4gY2hlY2tzdW0gb2ZmbG9hZCBzaG91bGQgbm90IGJlIHJlcXVlc3RlZCB2aWEgc3RtbWFjX3By
ZXBhcmVfdHhfZGVzYzoKPiA+ID4gPiAKPiA+ID4gPiAgICAgICAgICAgY3N1bV9pbnNlcnRpb24g
PSAoc2tiLT5pcF9zdW1tZWQgPT0gQ0hFQ0tTVU1fUEFSVElBTCk7Cj4gPiA+ID4gICAgICAgICAg
IC8qIERXTUFDIElQcyBjYW4gYmUgc3ludGhlc2l6ZWQgdG8gc3VwcG9ydCB0eCBjb2Ugb25seSBm
b3IgYSBmZXcgdHgKPiA+ID4gPiAgICAgICAgICAgICogcXVldWVzLiBJbiB0aGF0IGNhc2UsIGNo
ZWNrc3VtIG9mZmxvYWRpbmcgZm9yIHRob3NlIHF1ZXVlcyB0aGF0IGRvbid0Cj4gPiA+ID4gICAg
ICAgICAgICAqIHN1cHBvcnQgdHggY29lIG5lZWRzIHRvIGZhbGxiYWNrIHRvIHNvZnR3YXJlIGNo
ZWNrc3VtIGNhbGN1bGF0aW9uLgo+ID4gPiA+ICAgICAgICAgICAgKgo+ID4gPiA+ICAgICAgICAg
ICAgKiBQYWNrZXRzIHRoYXQgd29uJ3QgdHJpZ2dlciB0aGUgQ09FIGUuZy4gbW9zdCBEU0EtdGFn
Z2VkIHBhY2tldHMgd2lsbAo+ID4gPiA+ICAgICAgICAgICAgKiBhbHNvIGhhdmUgdG8gYmUgY2hl
Y2tzdW1tZWQgaW4gc29mdHdhcmUuCj4gPiA+ID4gICAgICAgICAgICAqLwo+ID4gPiA+ICAgICAg
ICAgICBpZiAoY3N1bV9pbnNlcnRpb24gJiYKPiA+ID4gPiAgICAgICAgICAgICAgIChwcml2LT5w
bGF0LT50eF9xdWV1ZXNfY2ZnW3F1ZXVlXS5jb2VfdW5zdXBwb3J0ZWQgfHwKPiA+ID4gPiAgICAg
ICAgICAgICAgICAhc3RtbWFjX2hhc19pcF9ldGhlcnR5cGUoc2tiKSkpIHsKPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICBpZiAodW5saWtlbHkoc2tiX2NoZWNrc3VtX2hlbHAoc2tiKSkpCj4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGRtYV9tYXBfZXJyOwo+ID4gPiA+ICAg
ICAgICAgICAgICAgICAgIGNzdW1faW5zZXJ0aW9uID0gIWNzdW1faW5zZXJ0aW9uOwo+ID4gPiA+
ICAgICAgICAgICB9Cj4gPiA+ID4gCj4gPiA+ID4gRG8gd2UgbmVlZCB0byBjYXJlIGFib3V0IHRo
ZW0gaW4gc3RtbWFjX3hkcF94bWl0X3pjKCkKPiA+ID4gPiBhbmQgc3RtbWFjX3hkcF94bWl0X3hk
cGYoKSB0b28/Cj4gPiA+IAo+ID4gPiBUaGlzIHBhdGNoIG9ubHkgYWRkcmVzc2VzIGF2b2lkaW5n
IHRoZSBUWCBETUEgaGFuZyBieSBlbnN1cmluZyB0aGUgQ0lDCj4gPiA+IGJpdCBpcyBvbmx5IHNl
dCB3aGVuIHRoZSBxdWV1ZSBzdXBwb3J0cyBjaGVja3N1bSBvZmZsb2FkLiBGb3IgRFNBIHRhZ2dl
ZAo+ID4gPiBwYWNrZXRzIGNoZWNrc3VtIG9mZmxvYWRpbmcgaXMgbm90IHN1cHBvcnRlZCBieSB0
aGUgRFdNQUMgSVBzIGJ1dCBubyBUWAo+ID4gPiBETUEgaGFuZy4gQUZBSUssIGN1cnJlbnRseSBB
Rl9YRFAgcGF0aHMgZG9uJ3QgaGF2ZSBlcXVpdmFsZW50IGhhbmRsaW5nCj4gPiA+IGxpa2Ugc2ti
X2NoZWNrc3VtX2hlbHAoKSwgc2luY2UgdGhleSBvcGVyYXRlIG9uIHhkcCBidWZmZXJzLiBTbyB0
aGlzCj4gPiA+IHBhdGNoIGRvZXNuJ3QgYXR0ZW1wdCB0byBpbXBsZW1lbnQgYSBzdyBmYWxsYmFj
ayBidXQganVzdCBhdm9pZHMgRE1BCj4gPiA+IHN0YWxsLgo+ID4gCj4gPiBPaywgZmFpciBlbm91
Z2guCj4gPiAKPiA+IEFzIHBlciBBbmRyZXcncyBhZHZpY2UgZWxzZXdoZXJlIGluIHRoaXMgdGhy
ZWFkLgo+ID4gVGhpcyBwYXRjaCBhbHNvIGxvb2tzIGxpa2UgaXQgc2hvdWxkIGJlIGEgZml4IGZv
ciBuZXQsCj4gPiBhbmQgc2hvdWxkIGhhdmUgYSBGaXhlcyB0YWcuCj4gCj4gVGhhbmtzIGZvciB5
b3VyIGNvbW1lbnRzLgo+IAo+IFlvdSdyZSByaWdodOKAlHRoaXMgcGF0Y2ggaXMgYSBmaXggZm9y
IHRoZSBUWCBETUEgaGFuZyBpc3N1ZSBjYXVzZWQgYnkKPiBzZXR0aW5nIHRoZSBDSUMgYml0IG9u
IHF1ZXVlcyB0aGF0IGRvbid0IHN1cHBvcnQgY2hlY2tzdW0gb2ZmbG9hZC4gQnV0Cj4gSSBjb3Vs
ZG7igJl0IHBpbnBvaW50IGEgc3BlY2lmaWMgY29tbWl0IHRoYXQgaW50cm9kdWNlZCB0aGlzIGJl
aGF2aW9yIGluCj4gdGhlIEFGX1hEUCBwYXRoLiBJbml0aWFsbHksIHRoZXJlIHdhcyBubyBzdXBw
b3J0IGZvciBEV01BQyBJUHMgd2l0aCBDT0UKPiBlbmFibGVkIG9ubHkgb24gc3BlY2lmaWMgcXVl
dWVzLCBldmVuIHRob3VnaCB0aGVyZSBjYW4gYmUgSVBzIHdpdGggc3VjaAo+IGNvbmZpZ3VyYXRp
b24uIENvbW1pdCA4NDUyYTA1YjJjNjMgKCJuZXQ6IHN0bW1hYzogVHggY29lIHN3IGZhbGxiYWNr
IikKPiBhZGRlZCBzb2Z0d2FyZSBmYWxsYmFjayBzdXBwb3J0IGZvciB0aGUgQUZfUEFDS0VUIHBh
dGguIEJ1dCB0aGUgQUZfWERQCj4gcGF0aCBoYXMgYWx3YXlzIGVuYWJsZWQgQ09FIHVuY29uZGl0
aW9uYWxseSBldmVuIGJlZm9yZSB0aGF0LiBTbywgZG8geW91Cj4gdGhpbmsgcmVmZXJlbmNpbmcg
dGhlIGNvbW1pdCA4NDUyYTA1YjJjNjMgaW4gdGhlIEZpeGVzIHRhZyBpcwo+IGFwcHJvcHJpYXRl
IGFuZCBzdWZmaWNpZW50PwoKSGkgUm9oYW4sCgpQZXJoYXBzIEknbSBtaXNzaW5nIHRoZSBwb2lu
dCwgYnV0IG15IHRoaW5raW5nIGlzIGFzIGZvbGxvd3M6CgpBcyB0aGlzIHBhdGNoIG9ubHkgYWRk
cmVzc2VzIHRoZSBBRl9YRFAgcGF0aCBJIHRoaW5rIHdlIGNhbiB0YWtlIHRoZQphcHByb2FjaCBv
ZiBhc2tpbmcgImluIHdoaWNoIHBhdGNoIHdvdWxkIGEgdXNlciBvZiBBRl9YRFAgd2l0aCB0aGlz
IHN0bW1hYwpvYnNlcnZlIHRoaXMgYnVnIi4gKE9yIHNvbWUgdmFyaWFudCB0aGVyZW9mLikgQW5k
IEkgdGhpbmsgdGhlIGFuc3dlciB0bwp0aGF0IHF1ZXN0aW9uIGlzIHRoZSBwYXRjaCB0aGF0IGFk
ZGVkIEFGX1hEUCBzdXBwb3J0IHRvIHN0bW1hYyBkcml2ZXIuCgpTbyBJIHRoaW5rIHdlIGNhbiB1
c2U6CgpGaXhlczogMTMyYzMyZWU1YmMwICgibmV0OiBzdG1tYWM6IEFkZCBUWCB2aWEgWERQIHpl
cm8tY29weSBzb2NrZXQiKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
