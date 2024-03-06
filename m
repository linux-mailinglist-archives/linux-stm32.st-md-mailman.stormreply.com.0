Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E56BA873376
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Mar 2024 11:03:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F42BC6DD6E;
	Wed,  6 Mar 2024 10:03:17 +0000 (UTC)
Received: from bee.tesarici.cz (unknown [77.93.223.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0450EC64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Mar 2024 10:03:15 +0000 (UTC)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 8F1AE1CA694;
 Wed,  6 Mar 2024 11:03:13 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none)
 header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
 t=1709719394; bh=LS0wJFf5B1tehneoZpGaqF5s3dF3oVsKN5z6xY0DqMY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RlP2Oi+O4wJ/Ea1AjU8xy+THyjDsyEFw51VxG9ETIqAxI8g1tCOlVx4XquuNwsBvU
 IEkz8g7NsRz4iqnJl6dlhVR3ltrOvh+/GtDgYmE8MuN1WYhLMqql3I3KRESYlBz3V/
 8WVSnoUfBhGMNEhdSZt3EBy7LnEbMuDDFyASgMkRZuNYgbuqUEiB8WAkJb3MXpQFSi
 0HwRq4R0lscJwUlb/QXb1ThASEAZRMWCuIog0BaqMS8GqSBOoWU/rXuI1Pr8g0J4hK
 TivKZmrO0NS868efpT0j0M1zp08xfRJNCtvJm7HKYtvt4t9CfMZOJXqI4RwbtqXBV2
 3xIa4SYfK+7Ow==
Date: Wed, 6 Mar 2024 11:03:12 +0100
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>, Eric Dumazet <edumazet@google.com>
Message-ID: <20240306110312.04ddcde3@meshulam.tesarici.cz>
In-Reply-To: <20240306100153.32d305f7@meshulam.tesarici.cz>
References: <20240203190927.19669-1-petr@tesarici.cz>
 <ea1567d9-ce66-45e6-8168-ac40a47d1821@roeck-us.net>
 <Zct5qJcZw0YKx54r@xhacker>
 <CANn89i+4tVWezqr=BYZ5AF=9EgV2EPqhdHun=u=ga32CEJ4BXQ@mail.gmail.com>
 <20d94512-c4f2-49f7-ac97-846dc24a6730@roeck-us.net>
 <CANn89iL1piwsbsBx4Z=kySUfmPa9LbZn-SNthgA+W6NEnojgSQ@mail.gmail.com>
 <a3749d3f-ced1-4c48-adaf-348c8dee7610@leemhuis.info>
 <20240228120308.48d6a9c2@meshulam.tesarici.cz>
 <e3181555-c08d-463f-a9a9-b08c69875c84@leemhuis.info>
 <20240306100153.32d305f7@meshulam.tesarici.cz>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Marc Haber <mh+netdev@zugschlus.de>, Jisheng Zhang <jszhang@kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 Guenter Roeck <linux@roeck-us.net>, alexis.lothore@bootlin.com,
 "moderated list:ARM/STM32
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, "David S.
 Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: protect updates of
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

T24gV2VkLCA2IE1hciAyMDI0IDEwOjAxOjUzICswMTAwClBldHIgVGVzYcWZw61rIDxwZXRyQHRl
c2FyaWNpLmN6PiB3cm90ZToKCj4gT24gV2VkLCA2IE1hciAyMDI0IDA5OjIzOjUzICswMTAwCj4g
IkxpbnV4IHJlZ3Jlc3Npb24gdHJhY2tpbmcgKFRob3JzdGVuIExlZW1odWlzKSIgPHJlZ3Jlc3Np
b25zQGxlZW1odWlzLmluZm8+IHdyb3RlOgo+IAo+ID4gT24gMjguMDIuMjQgMTI6MDMsIFBldHIg
VGVzYcWZw61rIHdyb3RlOiAgCj4gPiA+IE9uIFdlZCwgMjggRmViIDIwMjQgMDc6MTk6NTYgKzAx
MDAKPiA+ID4gIkxpbnV4IHJlZ3Jlc3Npb24gdHJhY2tpbmcgKFRob3JzdGVuIExlZW1odWlzKSIg
PHJlZ3Jlc3Npb25zQGxlZW1odWlzLmluZm8+IHdyb3RlOgo+ID4gPiAgICAgCj4gPiA+PiBOZXQg
bWFpbnRhaW5lcnMsIGNoaW1pbmcgaW4gaGVyZSwgYXMgaXQgc2VlbXMgaGFuZGxpbmcgdGhpcyBy
ZWdyZXNzaW9uCj4gPiA+PiBzdGFsbGVkLiAgICAKPiA+ID4gSW5kZWVkLCBJIHdhcyB0b28gYnVz
eSB3aXRoIHNhbmRib3ggbW9kZS4uLiAgICAKPiA+IAo+ID4gSG1tLCBubyByZXBseSBpbiB0aGUg
cGFzdCB3ZWVrIHRvIFBldHIncyByZXF1ZXN0IGZvciBoZWxwIGZyb20gc29tZW9uZQo+ID4gd2l0
aCBtb3JlIGtub3dsZWRnZSBhYm91dCB0aGUgZmllbGQuIDotLwo+ID4gCj4gPiBTbyBJIGd1ZXNz
IHRoaXMgbWVhbnMgdGhhdCB0aGlzIHdvbid0IGJlIGZpeGVkIGZvciA2Ljg/IFVuZm9ydHVuYXRl
LCBidXQKPiA+IHdlbGwsIHRoYXQncyBob3cgaXQgaXQgc29tZXRpbWVzLiAgCj4gCj4gRm9yIHRo
ZSByZWNvcmQsIEkgX2Nhbl8gcmVwcm9kdWNlIGxvY2tkZXAgc3BsYXRzIG9uIG15IGRldmljZSwg
YnV0IHRoZXkKPiBkb24ndCBtYWtlIGFueSBzZW5zZSB0byBtZS4gVGhleSBzZWVtIHRvIGNvbmZp
cm0gSmlzaGVuZyBaaGFuZydzCj4gY29uY2x1c2lvbiB0aGF0IGxvY2tkZXAgY29uZmxhdGVzIHR3
byBsb2NrcyB3aGljaCBzaG91bGQgaGF2ZSBkaWZmZXJlbnQKPiBsb2NrLWNsYXNzZXMuCj4gCj4g
U28gZmFyIEkgaGF2ZSBub3RpY2VkIG9ubHkgb25lIGlzc3VlOiB0aGUgcGVyLWNwdSBzeW5jcCdz
IGFyZSBub3QKPiBpbml0aWFsaXplZC4gSSdsbCByZWNvbXBpbGUgYW5kIHNlZSBpZiB0aGF0J3Mg
d2hhdCBjb25mdXNlcyBsb2NrZGVwLgoKVGhhdCB3YXNuJ3QgdGhlIGlzc3VlLiBGVFIgdGhlIHN5
bmNwIHdhcyBpbiBmYWN0IGluaXRpYWxpemVkLCBiZWNhdXNlCmRldm1fbmV0ZGV2X2FsbG9jX3Bj
cHVfc3RhdHMoKSBpcyBhIG1hY3JvIHRoYXQgYWxzbyB0YWtlcyBjYXJlIG9mIHRoZQppbml0aWFs
aXphdGlvbiBvZiB0aGUgc3luY3Agc3RydWN0IGZpZWxkLgoKVGhlIHByb2JsZW0gaXMgdTY0X3N0
YXRzX2luaXQoKS4KCkNvbW1pdCA5NDY0Y2E2NTAwMDggKCJuZXQ6IG1ha2UgdTY0X3N0YXRzX2lu
aXQoKSBhIGZ1bmN0aW9uIikgY2hhbmdlZAppdCB0byBhbiBpbmxpbmUgZnVuY3Rpb24uIEJ1dCB0
aGF0J3Mgd3JvbmcuIEl0IHVzZXMgc2VxY291bnRfaW5pdCgpLAp3aGljaCBpbiB0dXJuIGRlY2xh
cmVzOgoKCXN0YXRpYyBzdHJ1Y3QgbG9ja19jbGFzc19rZXkgX19rZXk7CgpUaGlzIGFzc3VtZXMg
dGhhdCBlYWNoIGxvY2sgZ2V0cyBpdHMgb3duIGluc3RhbmNlLiBCdXQgaWYKdTY0X3N0YXRzX2lu
aXQoKSBpcyBhIGZ1bmN0aW9uIChhbGJlaXQgYW4gaW5saW5lIG9uZSksIGFsbCBjYWxscwp3aXRo
aW4gdGhlIHNhbWUgZmlsZSBlbmQgdXAgdXNpbmcgdGhlIHNhbWUgaW5zdGFuY2UuCgpFcmljLCB3
b3VsZCBpdCBiZSBPSyB0byByZXZlcnQgdGhlIGFib3ZlLW1lbnRpb25lZCBjb21taXQ/CgpQZXRy
IFQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
