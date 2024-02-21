Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC7D85E70A
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Feb 2024 20:14:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60D09C6B45E;
	Wed, 21 Feb 2024 19:14:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A45A6C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Feb 2024 19:14:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 57C3D61631;
 Wed, 21 Feb 2024 19:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531C6C433C7;
 Wed, 21 Feb 2024 19:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708542886;
 bh=zANAkyf/heA22WD+nmjgPqi08fXUW0P+IVVOqNNtubA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V7OB+AfS59fqaEHtD8jj4h2KNB++Nc3OAxOOfEdNmy+xWmUA0pUhHNguKCuo2KRoN
 S98aOeDVxf7fO5hNCY+3IIfHnYxDCPJTdqMQoz+ygT7m6W4Znloqpou9U1KjTyyNeC
 VofqSex0omZ0Ckp5qqG+b4P0lZpF5GF0UBno6aL62wroJGFDtXPJiEA8Hmng4q42lZ
 zrHbAS1CCyGiDSG8zypJKpc+FJwZfrpzs/POauHvuBLb4Cw2AEK4vqg/0aFW8h7RTK
 q2+FwFj2All3X9xTTFB0oBkzpp480TVjJCyIR/6NSnug7psjNOoJ/ZQ30UAx5pSQ+0
 7iPrOndB5aO2A==
Date: Wed, 21 Feb 2024 11:14:44 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <20240221111444.22fce1f7@kernel.org>
In-Reply-To: <20240221-rxc_bugfix-v4-5-4883ee1cc7b1@bootlin.com>
References: <20240221-rxc_bugfix-v4-0-4883ee1cc7b1@bootlin.com>
 <20240221-rxc_bugfix-v4-5-4883ee1cc7b1@bootlin.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 linux-renesas-soc@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 5/7] net: stmmac: Signal to
 PHY/PCS drivers to keep RX clock on
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

T24gV2VkLCAyMSBGZWIgMjAyNCAxNDowNDoyMiArMDEwMCBSb21haW4gR2FudG9pcyB3cm90ZToK
PiBUaGVyZSBpcyBhIHJlb2N1cnJpbmcgaXNzdWUgd2l0aCBzdG1tYWMgY29udHJvbGxlcnMgd2hl
cmUgdGhlIE1BQyBmYWlscyB0bwo+IGluaXRpYWxpemUgaXRzIGhhcmR3YXJlIGlmIGFuIFJYIGNs
b2NrIHNpZ25hbCBpc24ndCBwcm92aWRlZCBvbiB0aGUgTUFDL1BIWQo+IGxpbmsuCj4gCj4gVGhp
cyBjYXVzZXMgaXNzdWVzIHdoZW4gUEhZIG9yIFBDUyBkZXZpY2VzIGVpdGhlciBnbyBpbnRvIHN1
c3BlbmQgd2hpbGUKPiBjdXR0aW5nIHRoZSBSWCBjbG9jayBvciBkbyBub3QgYnJpbmcgdGhlIGNs
b2NrIHNpZ25hbCB1cCBlYXJseSBlbm91Z2ggZm9yCj4gdGhlIE1BQyB0byBpbml0aWFsaXplIHN1
Y2Nlc3NmdWxseS4KPiAKPiBTZXQgdGhlIG1hY19yZXF1aXJlc19yeGMgZmxhZyBpbiB0aGUgc3Rt
bWFjIHBoeWxpbmsgY29uZmlnIHNvIHRoYXQgUEhZL1BDUwo+IGRyaXZlcnMga25vdyB0byBrZWVw
IHRoZSBSWCBjbG9jayB1cCBhdCBhbGwgdGltZXMuCj4gCj4gUmVwb3J0ZWQtYnk6IENsYXJrIFdh
bmcgPHhpYW9uaW5nLndhbmdAbnhwLmNvbT4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyMzAyMDIwODE1NTkuMzU1MzYzNy0xLXhpYW9uaW5nLndhbmdAbnhwLmNvbS8KPiBS
ZXBvcnRlZC1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgo+
IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMzAxMTYx
MDM5MjYuMjc2ODY5LTQtY2xlbWVudC5sZWdlckBib290bGluLmNvbS8KPiBTdWdnZXN0ZWQtYnk6
IFJ1c3NlbGwgS2luZyA8bGludXhAYXJtbGludXgub3JnLnVrPgo+IFNpZ25lZC1vZmYtYnk6IFJv
bWFpbiBHYW50b2lzIDxyb21haW4uZ2FudG9pc0Bib290bGluLmNvbT4KCmJyZWFrcyBhbGxtb2Rj
b25maWc6CgpFUlJPUjogbW9kcG9zdDogInBoeWxpbmtfcGNzX3ByZV9pbml0IiBbZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjLmtvXSB1bmRlZmluZWQhCi0tIApwdy1i
b3Q6IGNyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
