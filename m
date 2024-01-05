Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C74825211
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jan 2024 11:34:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 157C9C6C83D;
	Fri,  5 Jan 2024 10:34:06 +0000 (UTC)
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE26EC6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jan 2024 10:34:04 +0000 (UTC)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id E3E231A6FC6;
 Fri,  5 Jan 2024 11:34:03 +0100 (CET)
Authentication-Results: mail.tesarici.cz;
 dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
 t=1704450844; bh=W5kCnIB42LtsWaPmFAcROMCgMQPTBbi21yBS1qwCu3o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vsp/ed+p/jez3C+wSexJ/WxUleoMdIAYBCau4oba3WHeINZOmT49XmZg71MHuOnXC
 /96L+GGHlVPtqeNDBNq11AiSrJXnMGlMOwIHre2Cs9YIOtPxWB0oTn5c3n26wDWLAh
 XTmGFjkHId1xkRB0mQUS0CFAAvu4i9/ysdrjmKlKx8d2sAbf0Z5mFL53xoDLcGxtmF
 7kd+II8C/wcovQkpRn9TiYf8wAFcOYR9CKESmQQIY46X1ZIQvMiR++rvuoDxXft82j
 KWS9v1/4/r+1FbDm0JxeCpDjxpLYMCfCnwZ81Xrq3rPEGV/IhKULwMtAJxA5p3yfvy
 fRD1Jv9G8xgsA==
Date: Fri, 5 Jan 2024 11:34:02 +0100
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Eric Dumazet <edumazet@google.com>
Message-ID: <20240105113402.0f5f1232@meshulam.tesarici.cz>
In-Reply-To: <CANn89iLuYZBersxq4aH-9Fg_ojD0fh=0xtdLbRdbMrup=nvrkA@mail.gmail.com>
References: <20240105091556.15516-1-petr@tesarici.cz>
 <CANn89iLuYZBersxq4aH-9Fg_ojD0fh=0xtdLbRdbMrup=nvrkA@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: open list <linux-kernel@vger.kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, "moderated
 list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: protect statistics updates
	with a spinlock
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

T24gRnJpLCA1IEphbiAyMDI0IDEwOjU4OjQyICswMTAwCkVyaWMgRHVtYXpldCA8ZWR1bWF6ZXRA
Z29vZ2xlLmNvbT4gd3JvdGU6Cgo+IE9uIEZyaSwgSmFuIDUsIDIwMjQgYXQgMTA6MTbigK9BTSBQ
ZXRyIFRlc2FyaWsgPHBldHJAdGVzYXJpY2kuY3o+IHdyb3RlOgo+ID4KPiA+IEFkZCBhIHNwaW5s
b2NrIHRvIGZpeCByYWNlIGNvbmRpdGlvbnMgd2hpbGUgdXBkYXRpbmcgVHgvUnggc3RhdGlzdGlj
cy4KPiA+Cj4gPiBBcyBleHBsYWluZWQgYnkgYSBjb21tZW50IGluIDxsaW51eC91NjRfc3RhdHNf
c3luYy5oPiwgd3JpdGUgc2lkZSBvZiBzdHJ1Y3QKPiA+IHU2NF9zdGF0c19zeW5jIG11c3QgZW5z
dXJlIG11dHVhbCBleGNsdXNpb24sIG9yIG9uZSBzZXFjb3VudCB1cGRhdGUgY291bGQKPiA+IGJl
IGxvc3Qgb24gMzItYml0IHBsYXRmb3JtcywgdGh1cyBibG9ja2luZyByZWFkZXJzIGZvcmV2ZXIu
Cj4gPgo+ID4gU3VjaCBsb2NrdXBzIGhhdmUgYmVlbiBhY3R1YWxseSBvYnNlcnZlZCBvbiAzMi1i
aXQgQXJtIGFmdGVyIHN0bW1hY194bWl0KCkKPiA+IG9uIG9uZSBjb3JlIHJhY2VkIHdpdGggc3Rt
bWFjX25hcGlfcG9sbF90eCgpIG9uIGFub3RoZXIgY29yZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBQZXRyIFRlc2FyaWsgPHBldHJAdGVzYXJpY2kuY3o+ICAKPiAKPiBUaGlzIGlzIGdvaW5nIHRv
IGFkZCBtb3JlIGNvc3RzIHRvIDY0Yml0IHBsYXRmb3JtcyA/CgpZZXMsIGl0IGFkZHMgYSAoaG9w
ZWZ1bGx5IG5vdCB0b28gY29udGVuZGVkKSBzcGlubG9jayBhbmQgaW4gbW9zdApwbGFjZXMgYW4g
aW50ZXJydXB0IGRpc2FibGUvZW5hYmxlIHBhaXIuCgpGV0lXIHRoZSByYWNlIGNvbmRpdGlvbiBp
cyBhbHNvIHByZXNlbnQgb24gNjQtYml0IHBsYXRmb3JtcywgcmVzdWx0aW5nCmluIGluYWNjdXJh
dGUgc3RhdGlzdGljIGNvdW50ZXJzLiBJIGNhbiB1bmRlcnN0YW5kIGlmIHlvdSBjb25zaWRlciBp
dCBhCm1pbGQgYW5ub3lhbmNlLCBub3Qgd29ydGggZml4aW5nLgoKPiBJdCBzZWVtcyB0byBtZSB0
aGF0IHRoZSBzYW1lIHN5bmNwIGNhbiBiZSB1c2VkIGZyb20gdHdvIGRpZmZlcmVudAo+IHRocmVh
ZHMgOiBoYXJkIGlycSBhbmQgbmFwaSBwb2xsZXIuLi4KClllcywgdGhhdCdzIGV4YWN0bHkgdGhl
IHNjZW5hcmlvIHRoYXQgbG9ja3MgdXAgbXkgc3lzdGVtLgoKPiBBdCB0aGlzIHBvaW50LCBJIGRv
IG5vdCBzZWUgd2h5IHlvdSBrZWVwIGxpbnV4L3U2NF9zdGF0c19zeW5jLmggaWYgeW91Cj4gZGVj
aWRlIHRvIGdvIGZvciBhIHNwaW5sb2NrLi4uCgpUaGUgc3BpbmxvY2sgZG9lcyBub3QgaGF2Y2Ug
dG8gYmUgdGFrZW4gb24gdGhlIHJlYWRlciBzaWRlLCBzbyB0aGUKc2VxY291bnRlciBzdGlsbCBh
ZGRzIHNvbWUgdmFsdWUuCgo+IEFsdGVybmF0aXZlIHdvdWxkIHVzZSBhdG9taWM2NF90IGZpZWxk
cyBmb3IgdGhlIG9uZXMgd2hlcmUgdGhlcmUgaXMgbm8KPiBtdXR1YWwgZXhjbHVzaW9uLgo+IAo+
IFJYIDogbmFwaSBwb2xsIGlzIGRlZmluaXRlbHkgc2FmZSAocHJvdGVjdGVkIGJ5IGFuIGF0b21p
YyBiaXQpCj4gVFggOiBlYWNoIFRYIHF1ZXVlIGlzIGFsc28gc2FmZSAocHJvdGVjdGVkIGJ5IGFu
IGF0b21pYyBleGNsdXNpb24gZm9yCj4gbm9uIExMVFggZHJpdmVycykKPiAKPiBUaGlzIGxlYXZl
cyB0aGUgZmllbGRzIHVwZGF0ZWQgZnJvbSBoYXJkd2FyZSBpbnRlcnJ1cHQgY29udGV4dCA/CgpJ
J20gYWZyYWlkIEkgZG9uJ3QgaGF2ZSBlbm91Z2ggbmV0d29yay1zdGFjay1mb28gdG8gZm9sbG93
IGhlcmUuCgpNeSBpc3N1ZSBvbiAzMiBiaXQgaXMgdGhhdCBzdG1tYWNfeG1pdCgpIG1heSBiZSBj
YWxsZWQgZGlyZWN0bHkgZnJvbQpwcm9jZXNzIGNvbnRleHQgd2hpbGUgYW5vdGhlciBjb3JlIHJ1
bnMgdGhlIFRYIG5hcGkgb24gdGhlIHNhbWUgY2hhbm5lbAooaW4gaW50ZXJydXB0IGNvbnRleHQp
LiBJIGRpZG4ndCBvYnNlcnZlIGFueSByYWNlIG9uIHRoZSBSWCBwYXRoLCBidXQgSQpiZWxpZXZl
IGl0J3MgcG9zc2libGUgd2l0aCBOQVBJIGJ1c3kgcG9sbGluZy4KCkluIGFueSBjYXNlLCBJIGRv
bid0IHNlZSB0aGUgY29ubmVjdGlvbiB3aXRoIExMVFguIE1heWJlIHlvdSB3YW50IHRvCnNheSB0
aGF0IHRoZSBUWCBxdWV1ZSBpcyBzYWZlIGZvciBzdG1tYWMgKGJlY2F1c2UgaXQgaXMgYSBub24t
TExUWApkcml2ZXIpLCBidXQgbWlnaHQgbm90IGJlIHNhZmUgZm9yIExMVFggZHJpdmVycz8KClBl
dHIgVApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
