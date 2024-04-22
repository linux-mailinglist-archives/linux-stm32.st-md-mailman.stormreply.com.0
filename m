Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FE38AC369
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 06:21:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC0D3C6DD67;
	Mon, 22 Apr 2024 04:21:15 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90CE6C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 04:21:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 15AB4CE094C;
 Mon, 22 Apr 2024 04:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A14C113CC;
 Mon, 22 Apr 2024 04:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713759670;
 bh=ozpBxBgCJmqupdB7H8gj0pkGoEsWtf9/ZsRSpCcvC+8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BxRhtJxi0aOSSshzokmo3OeuPpVERC0LWHK1HnpNq6CvwP45Xz2ckYfkUJJPv/y8b
 QquXQ2AAcUUxu6DkNNfK1EZ+pR2wVZzhYOwU3vu2tvBKUTyAelU//u0rI2wABiPRRI
 dJmzhtZELiV+uDYcpUuXNaLYFp0Jv438esiP0nbt+/uN60ya0GOP7O5FTakULEj1w5
 aAdbpnQt3lnf/4XOYvztGhHFyFmGIzvXsf6d5hAdpFiVfP0yWFEABGweOSnkTH/Rl2
 Ir7Yhe2W92kdI6bI+QuKanA2D/KY/ZBDrYGgfPddRgipwJAjd5s75g3dKWIf4Sk9Yr
 e+QeRypPjkF5w==
Message-ID: <f02c63b3-d6e1-495d-a73a-493e39e40b2e@kernel.org>
Date: Mon, 22 Apr 2024 06:21:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
References: <20240422002006.243687-1-marex@denx.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240422002006.243687-1-marex@denx.de>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sean Nyekjaer <sean@geanix.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 01/20] dt-bindings: arm: stm32: Add
 compatible string for DH electronics STM32MP13xx DHCOR DHSBC board
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

T24gMjIvMDQvMjAyNCAwMjoxOSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gQWRkIERUIGNvbXBhdGli
bGUgc3RyaW5nIGZvciBESCBlbGVjdHJvbmljcyBTVE0zMk1QMTN4eCBESENPUiBTb00gYW5kCj4g
REhTQkMgY2FycmllciBib2FyZC4gVGhpcyBzdG0zMm1wMTM1Zi1kaGNvci1kaHNiYyBib2FyZCBp
cyBhIHN0YWNrIG9mCj4gREhDT1IgU29NIGJhc2VkIG9uIFNUTTMyTVAxMzVGIFNvQyAoOTAwTUh6
IC8gY3J5cHRvIGNhcGFiaWxpdGllcykKPiBwb3B1bGF0ZWQgb24gREhTQkMgY2FycmllciBib2Fy
ZC4KPiAKPiBUaGUgU29NIGNvbnRhaW5zIHRoZSBmb2xsb3dpbmcgcGVyaXBoZXJhbHM6Cj4gLSBT
VFBNSUMgKHBvd2VyIGRlbGl2ZXJ5KQo+IC0gNTEyTUIgRERSM0wgbWVtb3J5Cj4gLSBlTU1DIGFu
ZCBTRElPIFdpRmkgbW9kdWxlCj4gCj4gVGhlIERIU0JDIGNhcnJpZXIgYm9hcmQgY29udGFpbnMg
dGhlIGZvbGxvd2luZyBwZXJpcGhlcmFsczoKPiAtIFR3byBSR01JSSBFdGhlcm5ldCBwb3J0cwo+
IC0gVVNCLUEgSG9zdCBwb3J0LCBVU0ItQyBwZXJpcGhlcmFsIHBvcnQsIFVTQi1DIHBvd2VyIHN1
cHBseSBwbHVnCj4gLSBFeHBhbnNpb24gY29ubmVjdG9yCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFy
ZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4gLS0tCj4gQ2M6ICJMZW9uYXJkIEfDtmhycyIgPGwu
Z29laHJzQHBlbmd1dHJvbml4LmRlPgo+IENjOiBBaG1hZCBGYXRvdW0gPGEuZmF0b3VtQHBlbmd1
dHJvbml4LmRlPgo+IENjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Mu
c3QuY29tPgo+IENjOiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4KPiBD
YzogQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPgo+IENjOiBEYXJpbyBCaW5hY2No
aSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gQ2M6IEtyenlzenRvZiBL
b3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz4KPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMu
d2FsbGVpakBsaW5hcm8ub3JnPgo+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0z
MkBnbWFpbC5jb20+Cj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gQ2M6IFNl
YW4gTnlla2phZXIgPHNlYW5AZ2Vhbml4LmNvbT4KPiBDYzogU3RlZmZlbiBUcnVtdHJhciA8cy50
cnVtdHJhckBwZW5ndXRyb25peC5kZT4KPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcK
PiBDYzoga2VybmVsQGRoLWVsZWN0cm9uaWNzLmNvbQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0
bTMyL3N0bTMyLnlhbWwgfCA2ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vc3RtMzIvc3RtMzIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vc3RtMzIvc3RtMzIueWFtbAo+IGluZGV4IGJjMmY0MzMzMGFlNDIuLjdmNjEyMjNiOGVmMjQg
MTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0z
Mi9zdG0zMi55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9zdG0zMi9zdG0zMi55YW1sCj4gQEAgLTU5LDYgKzU5LDEyIEBAIHByb3BlcnRpZXM6Cj4gICAg
ICAgICAgICAgICAgLSBwcnQscHJ0dDFzICAgIyBQcm90b25pYyBQUlRUMVMKPiAgICAgICAgICAg
IC0gY29uc3Q6IHN0LHN0bTMybXAxNTEKPiAgCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IERIIFNU
TTMyTVAxMzUgREhDT1IgU29NIGJhc2VkIEJvYXJkcwo+ICsgICAgICAgIGl0ZW1zOgo+ICsgICAg
ICAgICAgLSBjb25zdDogZGgsc3RtMzJtcDEzNWYtZGhjb3ItZGhzYmMKPiArICAgICAgICAgIC0g
Y29uc3Q6IGRoLHN0bTMybXAxMzFhLWRoY29yLXNvbQo+ICsgICAgICAgICAgLSBjb25zdDogc3Qs
c3RtMzJtcDEzNQoKVGhlIGVudHJpZXMgbG9vayBvcmRlcmVkIGJ5IGxhc3QgY29tcGF0aWJsZSwg
c28gdGhpcyBicmVha3MgdGhlIG9yZGVyLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
