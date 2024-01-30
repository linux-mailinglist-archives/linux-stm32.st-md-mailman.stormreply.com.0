Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D596084241F
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 12:52:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F8E5C6C820;
	Tue, 30 Jan 2024 11:52:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE491C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 11:52:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BAD04601BD;
 Tue, 30 Jan 2024 11:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD77C433F1;
 Tue, 30 Jan 2024 11:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706615551;
 bh=DMspNHe+PyuwZG/IydiW/Wdtvh3uR5JF2oe/i9uuk5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tLd3MiRrPCcMgjVjHBWZko6Az5rZSFR1TS04dBkF6SIlhgzavZ2stqYFKUjlYdcgz
 CUm7cZDSLxFrXzePWm05avfoOHKiqK3DWlv/ZpMl4Fbk24sTIvCe9Ad7MmJZ7Huvvi
 JK1VLQEXMckAltshWu+H0x/ncIpjIlmb5TTFb6OVzHS8xm9VPhnBxdPSJwFZ7kx29b
 O4hDrkrHy1F2o3o8FdBROYbPGiljw4vd+CDssP8WvjexD/SSs6VTTDk/bMsGGQ/WhM
 +yAfrdEE4Gke6UPP5de/5dsmvbanSxCQT9o+813w0EqxCvGItuM9kUDGYXnlZQog6a
 j5Pwxm/sKwtkg==
Date: Tue, 30 Jan 2024 19:39:35 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Message-ID: <Zbjf9yQRV26EO7le@xhacker>
References: <20240128193529.24677-1-petr@tesarici.cz>
 <ZbiCWtY8ODrroHIq@xhacker>
 <20240130083539.4ea26a8d@meshulam.tesarici.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240130083539.4ea26a8d@meshulam.tesarici.cz>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Samuel Holland <samuel@sholland.org>,
 Marc Haber <mh+netdev@zugschlus.de>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 stable@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: protect updates of
 64-bit statistics counters
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

T24gVHVlLCBKYW4gMzAsIDIwMjQgYXQgMDg6MzU6MzlBTSArMDEwMCwgUGV0ciBUZXNhxZnDrWsg
d3JvdGU6Cj4gT24gVHVlLCAzMCBKYW4gMjAyNCAxMzowMDoxMCArMDgwMAo+IEppc2hlbmcgWmhh
bmcgPGpzemhhbmdAa2VybmVsLm9yZz4gd3JvdGU6Cj4gCj4gPiBPbiBTdW4sIEphbiAyOCwgMjAy
NCBhdCAwODozNToyOVBNICswMTAwLCBQZXRyIFRlc2FyaWsgd3JvdGU6Cj4gPiA+IEFzIGV4cGxh
aW5lZCBieSBhIGNvbW1lbnQgaW4gPGxpbnV4L3U2NF9zdGF0c19zeW5jLmg+LCB3cml0ZSBzaWRl
IG9mIHN0cnVjdAo+ID4gPiB1NjRfc3RhdHNfc3luYyBtdXN0IGVuc3VyZSBtdXR1YWwgZXhjbHVz
aW9uLCBvciBvbmUgc2VxY291bnQgdXBkYXRlIGNvdWxkCj4gPiA+IGJlIGxvc3Qgb24gMzItYml0
IHBsYXRmb3JtcywgdGh1cyBibG9ja2luZyByZWFkZXJzIGZvcmV2ZXIuIFN1Y2ggbG9ja3Vwcwo+
ID4gPiBoYXZlIGJlZW4gb2JzZXJ2ZWQgaW4gcmVhbCB3b3JsZCBhZnRlciBzdG1tYWNfeG1pdCgp
IG9uIG9uZSBDUFUgcmFjZWQgd2l0aAo+ID4gPiBzdG1tYWNfbmFwaV9wb2xsX3R4KCkgb24gYW5v
dGhlciBDUFUuCj4gPiA+IAo+ID4gPiBUbyBmaXggdGhlIGlzc3VlIHdpdGhvdXQgaW50cm9kdWNp
bmcgYSBuZXcgbG9jaywgc3BsaXQgdGhlIHN0YXRpY3MgaW50bwo+ID4gPiB0aHJlZSBwYXJ0czoK
PiA+ID4gCj4gPiA+IDEuIGZpZWxkcyB1cGRhdGVkIG9ubHkgdW5kZXIgdGhlIHR4IHF1ZXVlIGxv
Y2ssCj4gPiA+IDIuIGZpZWxkcyB1cGRhdGVkIG9ubHkgZHVyaW5nIE5BUEkgcG9sbCwKPiA+ID4g
My4gZmllbGRzIHVwZGF0ZWQgb25seSBmcm9tIGludGVycnVwdCBjb250ZXh0LAo+ID4gPiAKPiA+
ID4gVXBkYXRlcyB0byBmaWVsZHMgaW4gdGhlIGZpcnN0IHR3byBncm91cHMgYXJlIGFscmVhZHkg
c2VyaWFsaXplZCB0aHJvdWdoCj4gPiA+IG90aGVyIGxvY2tzLiBJdCBpcyBzdWZmaWNpZW50IHRv
IHNwbGl0IHRoZSBleGlzdGluZyBzdHJ1Y3QgdTY0X3N0YXRzX3N5bmMKPiA+ID4gc28gdGhhdCBl
YWNoIGdyb3VwIGhhcyBpdHMgb3duLgo+ID4gPiAKPiA+ID4gTm90ZSB0aGF0IHR4X3NldF9pY19i
aXQgaXMgdXBkYXRlZCBmcm9tIGJvdGggY29udGV4dHMuIFNwbGl0IHRoaXMgY291bnRlcgo+ID4g
PiBzbyB0aGF0IGVhY2ggY29udGV4dCBnZXRzIGl0cyBvd24sIGFuZCBjYWxjdWxhdGUgdGhlaXIg
c3VtIHRvIGdldCB0aGUgdG90YWwKPiA+ID4gdmFsdWUgaW4gc3RtbWFjX2dldF9ldGh0b29sX3N0
YXRzKCkuCj4gPiA+IAo+ID4gPiBGb3IgdGhlIHRoaXJkIGdyb3VwLCBtdWx0aXBsZSBpbnRlcnJ1
cHRzIG1heSBiZSBwcm9jZXNzZWQgYnkgZGlmZmVyZW50IENQVXMKPiA+ID4gYXQgdGhlIHNhbWUg
dGltZSwgYnV0IGludGVycnVwdHMgb24gdGhlIHNhbWUgQ1BVIHdpbGwgbm90IG5lc3QuIE1vdmUg
ZmllbGRzCj4gPiA+IGZyb20gdGhpcyBncm91cCB0byBhIG5ld2x5IGNyZWF0ZWQgcGVyLWNwdSBz
dHJ1Y3Qgc3RtbWFjX3BjcHVfc3RhdHMuCj4gPiA+IAo+ID4gPiBGaXhlczogMTMzNDY2YzNiYmUx
ICgibmV0OiBzdG1tYWM6IHVzZSBwZXItcXVldWUgNjQgYml0IHN0YXRpc3RpY3Mgd2hlcmUgbmVj
ZXNzYXJ5IikKPiA+ID4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2L1phMTcz
UGh2aVlnLTFxSW5AdG9ycmVzLnp1Z3NjaGx1cy5kZS90Lwo+ID4gPiBDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZwo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRyIFRlc2FyaWsgPHBldHJAdGVzYXJp
Y2kuY3o+ICAKPiA+IAo+ID4gVGhhbmtzIGZvciB0aGUgZml4IHBhdGNoLiBPbmUgdHJpdmlhbCBp
bXByb3ZpZW1lbnQgYmVsb3cKPiA+IHMvbmV0ZGV2X2FsbG9jX3BjcHVfc3RhdHMvZGV2bV9uZXRk
ZXZfYWxsb2NfcGNwdV9zdGF0cyB0byBzaW1wbGlmeQo+ID4gZXJyb3IgYW5kIGV4aXQgY29kZSBw
YXRoLgo+IAo+IFRoYW5rcyBmb3IgeW91ciByZXZpZXcuCj4gCj4gSW4gZmFjdCwgbWFueSBvdGhl
ciBhbGxvY2F0aW9ucyBpbiBzdG1tYWMgY291bGQgYmUgY29udmVydGVkIHRvIGRldm1fKi4KPiBJ
IHdhbnRlZCB0byBzdGF5IGNvbnNpc3RlbnQgd2l0aCB0aGUgZXhpc3RpbmcgY29kZSwgYnV0IGhl
eSwgeW91J3JlCgp0aGVyZSdzIGFscmVhZHkgZGV2bV8qIHVzYWdlIGluIHN0bW1hY19kdnJfcHJv
YmUoKSwgZWcuIGRldm1fYWxsb2NfZXRoZXJkZXZfbXFzCkkgYmVsaWV2ZSBvdGhlciBwYXJ0cyBh
cmUgZnJvbSB0aGUgb2xkIGRheXMgd2hlbiB0aGVyZSdzIG5vIGRldm1fKiBBUElzCgo+IHJpZ2h0
IHRoZXJlJ3Mgbm8gZ29vZCByZWFzb24gZm9yIGl0Lgo+IAo+IFBsdXMsIEkgY2FuIHNlbmQgY29u
dmVydCB0aGUgb3RoZXIgcGxhY2VzIHdpdGggYW5vdGhlciBwYXRjaC4KPiAKPiA+IFdpdGggdGhh
dDoKPiA+IFJldmlld2VkLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4g
PiAKPiA+IFBTOiB3aGVuIEkgc2VudCB0aGUgYWJvdmUgIm5ldDogc3RtbWFjOiB1c2UgcGVyLXF1
ZXVlIDY0IGJpdCBzdGF0aXN0aWNzCj4gPiB3aGVyZSBuZWNlc3NhcnkiLCBJIGhhZCBhbiBpbXBy
ZXNzaW9uOiB0aGVyZSBhcmUgdG9vIG11Y2ggc3RhdGlzdGljcyBpbgo+ID4gc3RtbWFjIGRyaXZl
ciwgSSBkaWRuJ3Qgc2VlIHNvIG1hbnkgc3RhdGlzdGljcyBpbiBvdGhlciBldGggZHJpdmVycywg
aXMKPiA+IGl0IHBvc3NpYmxlIHRvIHJlbW92ZSBzb21lIHVzZWxlc3Mgb3Igbm90IHRoYXQgdXNl
ZnVsIHN0YXRpc3RpYyBtZW1iZXJzPwo+IAo+IEkgZG9uJ3QgZmVlbCBhdXRob3JpemVkIHRvIG1h
a2UgdGhlIGRlY2lzaW9uLiBCdXQgSSBhbHNvIHdvbmRlciBhYm91dAo+IHNvbWUgY291bnRlcnMu
IEZvciBleGFtcGxlLCB3aHkgaXMgdGhlcmUgdHhfcGFja2V0cyBhbmQgdHhfcGt0X24/IFRoZQo+
IGZvcm1lciBpcyBzaG93biBhcyBSWCBwYWNrZXRzIGJ5ICJpcCBzdGF0cyBzaG93IGRldiBlbmQw
IiwgdGhlIGxhdHRlcgo+IGlzIHNob3duIGJ5IGFzIHR4X3BrdF9uIGJ5ICJldGh0b29scyAtUyBl
bmQwIi4gVGhlIHZhbHVlcyBkbyBkaWZmZXIsCj4gYnV0IEkgaGF2ZSBubyBjbHVlIHdoeSwgYW5k
IGlmIHRoZXkgYXJlIGV2ZW4gZXhwZWN0ZWQgdG8gYmUgZGlmZmVyZW50Cj4gb3IgaWYgaXQncyBh
IGJ1Zy4KPiAKPiBQZXRyIFQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
