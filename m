Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BFA6F3EDD
	for <lists+linux-stm32@lfdr.de>; Tue,  2 May 2023 10:15:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD03DC6A609;
	Tue,  2 May 2023 08:15:29 +0000 (UTC)
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B1D2C69049
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 May 2023 08:15:28 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0A58D5803C3;
 Tue,  2 May 2023 04:15:27 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Tue, 02 May 2023 04:15:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1683015327; x=1683022527; bh=ghjR7QqLTKl0Wa6Qp/pmJnR12EKA7bqxYQW
 ouqZ3mAY=; b=G/ReWH/CR4stPP8pBvKE2oH2tiIxeT1Y9djsugPvcan1vwLCNKB
 +CmHc2S3racpCMakxZ1qQRdhDmpzbTSxPsJLCIAsBgFwKTe+QJwmoUIe5cxfT6Wy
 tgZI7GBK40sokCJo7woyfvbYgCDiIcu9MJqEUid0mCHXVNlzPDjNZzJJBtLrLhF9
 X/mbJHalC7bJ1Xs6/CKvhniyT1ORP+ioH4B0Q9MMwa1hEm8wfe270mide7U5ucC4
 jYc1KiyRZtz0ezseY2LvXW4OKb5R6V9gMew5kODf8MnejtSKgLd/xIANaAqpsh7o
 O3SUD5day0+7MZzwDONO0PUZT+hvXwYxYyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1683015327; x=1683022527; bh=ghjR7QqLTKl0Wa6Qp/pmJnR12EKA7bqxYQW
 ouqZ3mAY=; b=Y/xWbzku7vrNHNzte8uy72nMxc+pbAIi4IeA/XfvwUvtiZV9Est
 bPyNKEthPJpnwnx5/Y68ss9jDEmHmeNI9uaomvywj4LEhNdN2/6OUB0Ap6qjjHvb
 OQIPRGrLOJBmcaLg/XgkHAzTOPE5Xwu/E3de9zryJ4QMstqpCG+bbbWHvXXdfXgL
 L+W8t5CYwFrU7f8XrnzjjIYPTrCSQ2/hUzXAWg8+DhkBUcIkmt6eVQO+8Sms9yZ1
 Z+nDtml+a4kCprv84LWaOxgu+YrgM2G6hBbX6r3CD52Qvxv2Jvyac8zhWROAt9xl
 Ftb8duEVIIhaiX5H6fsUSxaLGjuOvtdmUyw==
X-ME-Sender: <xms:nsZQZGG99LYs7t6dhgAngkbsv9osgUeFMS5nCv0_eqkMW790xp5pVg>
 <xme:nsZQZHXku8NWvKl4XxdR48yR-0RVaLsU5fwZmJq18kazWD7vv8gAEIoPKVDAKkTuy
 5prPVni2U8mfnd5sN8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedviecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehrnhgu
 uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
 hrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfgjeev
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
 gusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:nsZQZAK8fS_X5YYcPQ8tmCY5TK5FJ7gjlJsS0RCSCVoEK-Zwdrq3Yw>
 <xmx:nsZQZAFFLoJhNSVEvLGVyQfmt0zeZphfcdHG8-tw9pYY47GFwhKrNA>
 <xmx:nsZQZMUL4rbP96pvZI76ZCUHun2qRq8vNtMGMdc-nT5M5xb0isYJ2g>
 <xmx:n8ZQZPq1o7msWppgt2EUHhnFGcmwGcb09Ud671-g5_97NEtVzT49Eg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1C690B60086; Tue,  2 May 2023 04:15:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-374-g72c94f7a42-fm-20230417.001-g72c94f7a
Mime-Version: 1.0
Message-Id: <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
In-Reply-To: <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
Date: Tue, 02 May 2023 10:15:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rob Herring" <robh+dt@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Olof Johansson" <olof@lixom.net>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

T24gVHVlLCBBcHIgMjUsIDIwMjMsIGF0IDE3OjU3LCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBU
dWUsIEFwciAyNSwgMjAyMyBhdCAyOjI44oCvQU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBs
aW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4KPj4gRG9lcyB5b3VyIHNjcmlwdCBhbHNvIGNhdGVyIGZv
ciAuZHRzIGZpbGVzIG5vdCBtYXRjaGluZyBhbnkgcGF0dGVybiwKPj4gYnV0IGluY2x1ZGluZyBh
IC5kdHNpIGZpbGUgdGhhdCBkb2VzIG1hdGNoIGEgcGF0dGVybj8KPgo+IEkgYXNzdW1lIEkgYnVp
bHQgZXZlcnl0aGluZyBhZnRlciBtb3ZpbmcsIGJ1dCBtYXliZSBub3QuLi4KPgo+IFRoYXQncyBh
bGwganVzdCAiZGV0YWlscyIuIEZpcnN0LCB3ZSBuZWVkIGFncmVlbWVudCBvbiBhKSBtb3ZpbmcK
PiB0aGluZ3MgdG8gc3ViZGlycyBhbmQgYikgZG9pbmcgaXQgMS1ieS0xIG9yIGFsbCBhdCBvbmNl
LiBTbyBmYXIgd2UndmUKPiBiZWVuIHN0dWNrIG9uIGEpIGZvciBiZWluZyAndG9vIG11Y2ggY2h1
cm4nLgoKU29ycnkgZm9yIG1pc3NpbmcgbW9zdCBvZiB0aGUgZGlzY3Vzc2lvbiBsYXN0IHdlZWsu
IFRoZSBzY3JpcHQgc291bmRzCmZpbmUgdG8gbWUsIHRoZSBvbmx5IHJlYXNvbiBJIGRpZG4ndCB3
YW50IHRvIGRvIHRoaXMgaW4gdGhlIHBhc3QgaXMgdGhhdAp3ZSBoYWQgdGhlIHBsYW4gdG8gbW92
ZSBwbGF0Zm9ybXMgb3V0IG9mIHRoZSBrZXJuZWwgdHJlZSB0byBhbiBleHRlcm5hbApyZXBvc2l0
b3J5IGFuZCBJIHdhbnRlZCB0byBkbyB0aGlzIHBsYXRmb3JtIGF0IGEgdGltZSBhbmQgYWxzbyBv
bmx5IG1vdmUKZWFjaCBvbmUgb25jZS4gSSBkb24ndCB0aGluayB0aGF0IGlzIGdvaW5nIHRvIGhh
cHBlbiBhbnl0aW1lIHNvb24gbm93LApzbyBsZXQncyBqdXN0IGRvIHlvdXIgc2NyaXB0LgoKQ2Fu
IHlvdSBzZW5kIG1lIHRoZSBzY3JpcHQgYW5kL29yIGEgcHVsbCByZXF1ZXN0IG9mIHRoZSByZXN1
bHRpbmcKdHJlZSBiYXNlZCBvbiBteSBzb2MvZHQgYnJhbmNoPyBFdmVyeXRoaW5nIGlzIG1lcmdl
ZCB1cHN0cmVhbSwKYW5kIEkgdGhpbmsgZ2l0LW1lcmdlIHdvdWxkIGhhbmRsZSB0aGUgcmVtYWlu
aW5nIG1lcmdlcyB3aXRoIGFueQpvdGhlciBjaGFuZ2VzIGluIG1haW5saW5lLgoKICAgICAgICBB
cm5kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
