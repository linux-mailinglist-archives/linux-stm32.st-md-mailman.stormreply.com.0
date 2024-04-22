Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE72A8AD52C
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 21:50:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E2B5C7128B;
	Mon, 22 Apr 2024 19:50:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97A3BC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 19:50:39 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0DFD6889DF;
 Mon, 22 Apr 2024 21:50:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713815439;
 bh=Mkbou78UopXHfwxvO7P06qa7igS6O17yeToaAx2sLpQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=yYGJl5TlcITQzK2lYt5bkr4HY9Ucsi/bMCm27ciRIntVvwe9Aub0aQVZKrqU60vGG
 ZNTCUlHZFJTqXGahApvafEtVWR64TbbEMBf2kYE87iR3ONusE8zHUbb8PDzA6DctB8
 EPMeTsZn0WWenKZ8li0gEGK/1iXjdBkYBjNPivlnhb3VgH66WAK+XNXsxR3u8FJpbV
 yCzfgm0LBYFqutujc8uNQnyf6IxskVAyoGqWXqU7kqhaC1Tcvfxh2ghbWwESQxc0yP
 IR6+UL2D4tr+vmDLiunaKBM735N8+VqmNQ8iS33G/e+Q7VQKE+GldHkW4XwE76y6UO
 F+e0MyeZzUhuA==
Message-ID: <f94baa87-b023-4905-b9d6-0237341ed4e8@denx.de>
Date: Mon, 22 Apr 2024 21:50:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20240422002006.243687-1-marex@denx.de>
 <20240422150809.GA1265252-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240422150809.GA1265252-robh@kernel.org>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sean Nyekjaer <sean@geanix.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

T24gNC8yMi8yNCA1OjA4IFBNLCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBNb24sIEFwciAyMiwg
MjAyNCBhdCAwMjoxOToxNUFNICswMjAwLCBNYXJlayBWYXN1dCB3cm90ZToKPj4gQWRkIERUIGNv
bXBhdGlibGUgc3RyaW5nIGZvciBESCBlbGVjdHJvbmljcyBTVE0zMk1QMTN4eCBESENPUiBTb00g
YW5kCj4+IERIU0JDIGNhcnJpZXIgYm9hcmQuIFRoaXMgc3RtMzJtcDEzNWYtZGhjb3ItZGhzYmMg
Ym9hcmQgaXMgYSBzdGFjayBvZgo+PiBESENPUiBTb00gYmFzZWQgb24gU1RNMzJNUDEzNUYgU29D
ICg5MDBNSHogLyBjcnlwdG8gY2FwYWJpbGl0aWVzKQo+PiBwb3B1bGF0ZWQgb24gREhTQkMgY2Fy
cmllciBib2FyZC4KPj4KPj4gVGhlIFNvTSBjb250YWlucyB0aGUgZm9sbG93aW5nIHBlcmlwaGVy
YWxzOgo+PiAtIFNUUE1JQyAocG93ZXIgZGVsaXZlcnkpCj4+IC0gNTEyTUIgRERSM0wgbWVtb3J5
Cj4+IC0gZU1NQyBhbmQgU0RJTyBXaUZpIG1vZHVsZQo+Pgo+PiBUaGUgREhTQkMgY2FycmllciBi
b2FyZCBjb250YWlucyB0aGUgZm9sbG93aW5nIHBlcmlwaGVyYWxzOgo+PiAtIFR3byBSR01JSSBF
dGhlcm5ldCBwb3J0cwo+PiAtIFVTQi1BIEhvc3QgcG9ydCwgVVNCLUMgcGVyaXBoZXJhbCBwb3J0
LCBVU0ItQyBwb3dlciBzdXBwbHkgcGx1Zwo+PiAtIEV4cGFuc2lvbiBjb25uZWN0b3IKPj4KPj4g
U2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4+IC0tLQo+PiBDYzog
Ikxlb25hcmQgR8O2aHJzIiA8bC5nb2VocnNAcGVuZ3V0cm9uaXguZGU+Cj4+IENjOiBBaG1hZCBG
YXRvdW0gPGEuZmF0b3VtQHBlbmd1dHJvbml4LmRlPgo+PiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8
YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KPj4gQ2M6IEFuZHJlIFByenl3YXJhIDxhbmRy
ZS5wcnp5d2FyYUBhcm0uY29tPgo+PiBDYzogQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwu
b3JnPgo+PiBDYzogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlv
bnMuY29tPgo+PiBDYzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPgo+
PiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+PiBDYzogTWF4
aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgo+PiBDYzogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4KPj4gQ2M6IFNlYW4gTnlla2phZXIgPHNlYW5AZ2Vhbml4LmNv
bT4KPj4gQ2M6IFN0ZWZmZW4gVHJ1bXRyYXIgPHMudHJ1bXRyYXJAcGVuZ3V0cm9uaXguZGU+Cj4+
IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwo+PiBDYzoga2VybmVsQGRoLWVsZWN0cm9u
aWNzLmNvbQo+PiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IENj
OiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+IC0tLQo+PiAgIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbCB8IDYg
KysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55
YW1sCj4+IGluZGV4IGJjMmY0MzMzMGFlNDIuLjdmNjEyMjNiOGVmMjQgMTAwNjQ0Cj4+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbAo+
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMy
LnlhbWwKPj4gQEAgLTU5LDYgKzU5LDEyIEBAIHByb3BlcnRpZXM6Cj4+ICAgICAgICAgICAgICAg
ICAtIHBydCxwcnR0MXMgICAjIFByb3RvbmljIFBSVFQxUwo+PiAgICAgICAgICAgICAtIGNvbnN0
OiBzdCxzdG0zMm1wMTUxCj4+ICAgCj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBESCBTVE0zMk1Q
MTM1IERIQ09SIFNvTSBiYXNlZCBCb2FyZHMKPj4gKyAgICAgICAgaXRlbXM6Cj4+ICsgICAgICAg
ICAgLSBjb25zdDogZGgsc3RtMzJtcDEzNWYtZGhjb3ItZGhzYmMKPj4gKyAgICAgICAgICAtIGNv
bnN0OiBkaCxzdG0zMm1wMTMxYS1kaGNvci1zb20KPiAKPiBFaXRoZXIgdGhpcyBvciB5b3VyIGR0
cyBpcyB3cm9uZy4gRWl0aGVyIHdheSwgcGxlYXNlIHRlc3QgeW91ciBkdHMgZmlsZXMKPiBhZ2Fp
bnN0IHRoZSBzY2hlbWFzLgoKWWVzLCBJIGtub3cgLi4uIGxhc3QgbWludXRlIGNoYW5nZSB3ZW50
IHdyb25nLCBzb3JyeS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
