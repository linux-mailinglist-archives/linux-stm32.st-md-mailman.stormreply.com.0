Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C85028ACDA3
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 15:01:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7688BC7128B;
	Mon, 22 Apr 2024 13:01:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B6B5C6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 13:01:14 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9F352883F5;
 Mon, 22 Apr 2024 15:01:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713790873;
 bh=T2LhG+d5gfzpt+6frmELCYtldXw+0HdWnIbONHY1Lhw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HLs6xNmF2cHmt3/CSA7MsZxkirPPCo88FDPluDlTKu1MrjkbFM/fUI5WXck/of2D0
 jevpHqvu/HxIAEqMWxhP6zAF01CZe1Rhf82bIwJfoIJGze4ixDkV34XccpkRpkHbXk
 hbAFsnN6dI8QrRTYj600AQeVuau5YApne9YaNoCWq8YoH5/dZaKYZZbFv3Is65wp5r
 63ka9+nIuaP6CQJ4Mjrxr/gDbIpkFkTzbOqEDGrL0tJBZDH1bT4XHSCeOgbdRmOVia
 K95WNNF8UqIp9iGRQDqRrdsQTroRoef8fLQGbuUYNwvHs7g5NO8rx8gVP7HNPeZA2J
 ed7Tb4vmmKf1g==
Message-ID: <fc42c239-1dff-4848-a0cf-4b21e3e59d8e@denx.de>
Date: Mon, 22 Apr 2024 14:52:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20240422002006.243687-1-marex@denx.de>
 <f02c63b3-d6e1-495d-a73a-493e39e40b2e@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <f02c63b3-d6e1-495d-a73a-493e39e40b2e@kernel.org>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gNC8yMi8yNCA2OjIxIEFNLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIDIyLzA0
LzIwMjQgMDI6MTksIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBBZGQgRFQgY29tcGF0aWJsZSBzdHJp
bmcgZm9yIERIIGVsZWN0cm9uaWNzIFNUTTMyTVAxM3h4IERIQ09SIFNvTSBhbmQKPj4gREhTQkMg
Y2FycmllciBib2FyZC4gVGhpcyBzdG0zMm1wMTM1Zi1kaGNvci1kaHNiYyBib2FyZCBpcyBhIHN0
YWNrIG9mCj4+IERIQ09SIFNvTSBiYXNlZCBvbiBTVE0zMk1QMTM1RiBTb0MgKDkwME1IeiAvIGNy
eXB0byBjYXBhYmlsaXRpZXMpCj4+IHBvcHVsYXRlZCBvbiBESFNCQyBjYXJyaWVyIGJvYXJkLgo+
Pgo+PiBUaGUgU29NIGNvbnRhaW5zIHRoZSBmb2xsb3dpbmcgcGVyaXBoZXJhbHM6Cj4+IC0gU1RQ
TUlDIChwb3dlciBkZWxpdmVyeSkKPj4gLSA1MTJNQiBERFIzTCBtZW1vcnkKPj4gLSBlTU1DIGFu
ZCBTRElPIFdpRmkgbW9kdWxlCj4+Cj4+IFRoZSBESFNCQyBjYXJyaWVyIGJvYXJkIGNvbnRhaW5z
IHRoZSBmb2xsb3dpbmcgcGVyaXBoZXJhbHM6Cj4+IC0gVHdvIFJHTUlJIEV0aGVybmV0IHBvcnRz
Cj4+IC0gVVNCLUEgSG9zdCBwb3J0LCBVU0ItQyBwZXJpcGhlcmFsIHBvcnQsIFVTQi1DIHBvd2Vy
IHN1cHBseSBwbHVnCj4+IC0gRXhwYW5zaW9uIGNvbm5lY3Rvcgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4gLS0tCj4+IENjOiAiTGVvbmFyZCBHw7Zo
cnMiIDxsLmdvZWhyc0BwZW5ndXRyb25peC5kZT4KPj4gQ2M6IEFobWFkIEZhdG91bSA8YS5mYXRv
dW1AcGVuZ3V0cm9uaXguZGU+Cj4+IENjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9y
Z3VlQGZvc3Muc3QuY29tPgo+PiBDYzogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnByenl3YXJhQGFy
bS5jb20+Cj4+IENjOiBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+Cj4+IENjOiBE
YXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+IENj
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+Cj4+IENjOiBMaW51cyBX
YWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4+IENjOiBNYXhpbWUgQ29xdWVsaW4g
PG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+Cj4+IENjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPgo+PiBDYzogU2VhbiBOeWVramFlciA8c2VhbkBnZWFuaXguY29tPgo+PiBDYzogU3Rl
ZmZlbiBUcnVtdHJhciA8cy50cnVtdHJhckBwZW5ndXRyb25peC5kZT4KPj4gQ2M6IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnCj4+IENjOiBrZXJuZWxAZGgtZWxlY3Ryb25pY3MuY29tCj4+IENj
OiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gQ2M6IGxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPj4gLS0tCj4+ICAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1sIHwgNiArKysrKysKPj4gICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwKPj4gaW5kZXgg
YmMyZjQzMzMwYWU0Mi4uN2Y2MTIyM2I4ZWYyNCAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1sCj4+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbAo+PiBAQCAt
NTksNiArNTksMTIgQEAgcHJvcGVydGllczoKPj4gICAgICAgICAgICAgICAgIC0gcHJ0LHBydHQx
cyAgICMgUHJvdG9uaWMgUFJUVDFTCj4+ICAgICAgICAgICAgIC0gY29uc3Q6IHN0LHN0bTMybXAx
NTEKPj4gICAKPj4gKyAgICAgIC0gZGVzY3JpcHRpb246IERIIFNUTTMyTVAxMzUgREhDT1IgU29N
IGJhc2VkIEJvYXJkcwo+PiArICAgICAgICBpdGVtczoKPj4gKyAgICAgICAgICAtIGNvbnN0OiBk
aCxzdG0zMm1wMTM1Zi1kaGNvci1kaHNiYwo+PiArICAgICAgICAgIC0gY29uc3Q6IGRoLHN0bTMy
bXAxMzFhLWRoY29yLXNvbQo+PiArICAgICAgICAgIC0gY29uc3Q6IHN0LHN0bTMybXAxMzUKPiAK
PiBUaGUgZW50cmllcyBsb29rIG9yZGVyZWQgYnkgbGFzdCBjb21wYXRpYmxlLCBzbyB0aGlzIGJy
ZWFrcyB0aGUgb3JkZXIuCgpBbmQgdWggLi4uIEkgd2lsbCBub3QgZG8gbGFzdCBtaW51dGUgY2hh
bmdlcyBiZWZvcmUgc2VuZGluZyBvdXQgbGFyZ2UgCnNlcmllcyBuZXh0IHRpbWUsIHNvcnJ5LgoK
SSdsbCB3YWl0IGZvciBBbGV4IHRvIHNlZSBpZiAwMi4uMTkgYmV0dGVyIGJlIHNxdWFzaGVkIG9y
IHNlcGFyYXRlLCBhbmQgCnRoZW4gZml4IHRoaXMgdXAgYW5kIHNlbmQgVjIuCgpUaGFua3MKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
