Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B937880C747
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Dec 2023 11:52:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 678C4C6B47D;
	Mon, 11 Dec 2023 10:52:31 +0000 (UTC)
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC030C6B475
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 09:18:15 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id BBC975803D6;
 Mon, 11 Dec 2023 04:18:14 -0500 (EST)
Received: from imap44 ([10.202.2.94])
 by compute3.internal (MEProxy); Mon, 11 Dec 2023 04:18:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1702286294; x=1702293494; bh=A/DCVjFaGMYmi2WhMoCUU3PEn5wAnq6lCN+
 5giiP81c=; b=ltLkHTRQRUic1cqalUyRviBoUOuRC7dMlreLaWd2b+OHp5grrqL
 tdrX7uKZtyx/zNvtC3pe1BYnPCelpW7nbHmAr4opAv/cGT/4x1OTvyfavnVi8YII
 aom74TCQ8edYvyhjw2n44nkh76QcVFIH2T7gNAlvTQOLfU6ZyS2oGh1Lcok/9g0w
 //fIaOaVMKw0RySJ3DVqlwDrh13uKGtKEj0nKb6ltTwUxjaUFuDqDV/vxpTYXdlS
 6ydx1cblz2LTb5ZoUeYJaSvu8A+xwUXePeaNLA6o+/Pc6vHRBacOog79TRMxvZ+y
 E7EZFTCDDcrCO6CYTLNwPZQqlG3fWaGYm1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1702286294; x=1702293494; bh=A/DCVjFaGMYmi2WhMoCUU3PEn5wAnq6lCN+
 5giiP81c=; b=0vUG3E/xGPNoBYuKcw5mRHhNDLdcw5oLYU6xSMWwnPaBWqkFgGm
 jt+Lh+L1+qHzc19RoFC1Rg6dBxX7h5HySyJJTkHJNFUnFs0LbSHR+8ufAxGMj+Kb
 cwrvZ3u5LCH3YF46k91xRr40wl7s6MeYcqglABZ/nY1q/poaBPx+8vE6qRv3gNIz
 EOeWDJ7ftDEk/MZy0iLTlxCQ+p5wfYgvIU5qXUCsKY2c/OTgnG76JEC7fmeGEYpv
 Xnoenh+BD/1Dr/VLaCCnViUD0Xw5VKDnllo/aX4wuDrRMwa2pynkp1c5uT8JwmK1
 2B//noszdkE4gon06cEIf9ylFLoEOhfOzUA==
X-ME-Sender: <xms:1tN2ZS65lef-ZNRjLMtSmX7o3vxqDAIVvYNZxchXLUQNjyP-5U5Pzw>
 <xme:1tN2Zb5IfQGktnmdWPvujOHjDTnL_UFhTZy7vgx23pn05Ax1F-C8_MenoD2ao0yk6
 _5dWxWK1cfs7hEIvbo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudelvddgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
 ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeekleevffehtdeigfekfefhffdtudffvdeuvedtffet
 heeuiefhgfetleekleekjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdih
 rghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:1tN2ZRcFO_wiTtf9wHjWypQBhdEolJ50womexLgkYMT62G6kstJBIw>
 <xmx:1tN2ZfJAy1O0xALLtSIvSXCM2GFvSO-KZC9P9AXg47YdI7bH7q_XNw>
 <xmx:1tN2ZWLXP0FdipNKYgpMLxIdEsonjAox48onlX9jCJeYG2rm-taKIQ>
 <xmx:1tN2Za-pKa0tIwg6EcJd263YbfhBNJQnQWEeX-btOduNBcYcpspDWw>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F34B736A0075; Mon, 11 Dec 2023 04:18:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
MIME-Version: 1.0
Message-Id: <9bdcd491-5ee5-48b3-844c-d6c0092bfc73@app.fastmail.com>
In-Reply-To: <93b41b72-a6ac-4d7f-95f0-ba42399729fc@loongson.cn>
References: <20230616103127.285608-1-krzysztof.kozlowski@linaro.org>
 <20230616-activity-shed-be3c13e5ac71@spud>
 <93b41b72-a6ac-4d7f-95f0-ba42399729fc@loongson.cn>
Date: Mon, 11 Dec 2023 09:17:54 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Yanteng Si" <siyanteng@loongson.cn>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Andrew Lunn" <andrew@lunn.ch>, "Conor Dooley" <conor@kernel.org>
X-Mailman-Approved-At: Mon, 11 Dec 2023 10:52:30 +0000
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFT PATCH 1/2] stmmac: dwmac-loongson: drop
 useless check for compatible fallback
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

CgrlnKgyMDIz5bm0MTLmnIgxMOaXpeWNgeS6jOaciCDkuIrljYg2OjQ477yMWWFudGVuZyBTaeWG
memBk++8mgo+IOWcqCAyMDIzLzYvMTcgMDI6NTIsIENvbm9yIERvb2xleSDlhpnpgZM6Cj4+IE9u
IEZyaSwgSnVuIDE2LCAyMDIzIGF0IDEyOjMxOjI2UE0gKzAyMDAsIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6Cj4+PiBEZXZpY2UgYmluZHMgdG8gcHJvcGVyIFBDSSBJRCAoTE9PTkdTT04sIDB4
N2EwMyksIGFscmVhZHkgbGlzdGVkIGluIERUUywKPj4+IHNvIGNoZWNraW5nIGZvciBzb21lIG90
aGVyIGNvbXBhdGlibGUgZG9lcyBub3QgbWFrZSBzZW5zZS4gIEl0IGNhbm5vdCBiZQo+Pj4gYm91
bmQgdG8gdW5zdXBwb3J0ZWQgcGxhdGZvcm0uCj4+Pgo+Pj4gRHJvcCB1c2VsZXNzLCBpbmNvcnJl
Y3QgKHNwYWNlIGluIGJldHdlZW4pIGFuZCB1bmRvY3VtZW50ZWQgY29tcGF0aWJsZS4KPj4+Cj4+
PiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tp
QGxpbmFyby5vcmc+Cj4+IE1pZ2h0IGJlIHdvcnRoIG5vdGluZyB0aGF0IGRyb3BwaW5nIGl0IGlz
IHJlcXVpcmVkIHRvIGFsbG93IHRoZQo+PiBuZXcgbG9vbmdhcmNoIGR0cyBzdHVmZiB0byBiZSBm
dW5jdGlvbmFsIHdpdGggYSBzYW5lIHNldCBvZiBjb21wYXRpYmxlcy4KPj4KPj4gUmV2aWV3ZWQt
Ynk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gVGhhbmsgeW91
IEtyenlzenRvZiBmb3IgeW91ciB3b3JrLiB3aGVuIEkgYW0KPiBhZGRpbmcgbW9yZSBkZXZpY2Vz
IHN1cHBvcnQgdG8gc3RtbWFjLCBJIGZvdW5kIHRoYXQgeW91cgo+IHR3byBwYXRjaGVzIHNlZW1l
ZCB0byBiZSBmb3Jnb3R0ZW4uCj4gVGhvbWFzLCBKaWF4dW4uIENhbiB0aGUgdHdvIHBhdGNoZXMg
Z2V0IGFuIEFja2VkLWJ5Pwo+IE15IHN0bW1hYyBwYXRjaCB0aHJlYWQ6Cj4gPGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xvb25nYXJjaC9jb3Zlci4xNjk5NTMzNzQ1LmdpdCAKPiAuc2l5YW50ZW5n
QGxvb25nc29uLmNuL1QvI21kMzEwOGQyOWE1ZWZlNzFiMjdmNGM1Y2NmNWQwMjE3NTcxYmY2NTg2
PgoKQWNrZWQtYnk6IEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT4KCkJldHRl
ciB0byByZXNlbmQgd2l0aG91dCBSRkMgOi0pCgpUaGFua3MKCj4gVGhhbmtzLAo+IFlhbnRlbmcK
Pgo+Pgo+PiBDaGVlcnMsCj4+IENvbm9yLgoKLS0gCi0gSmlheHVuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
