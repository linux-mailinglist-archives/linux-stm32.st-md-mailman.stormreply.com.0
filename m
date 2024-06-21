Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8122191207D
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 11:27:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C5F2C7128E;
	Fri, 21 Jun 2024 09:27:38 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C373DC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 09:27:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2ADDDCE2893;
 Fri, 21 Jun 2024 09:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE34C2BBFC;
 Fri, 21 Jun 2024 09:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718962047;
 bh=uhH10vmIJUKkPbdPA4/INQpMI+q9x/UjstbjxvXrdJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MvDBwLWb2dv893GPCGGbeTdvIWAMyKlOsPT/1BC5DgW8PlNDKB8sb9QRzT1auO0Q2
 lVxKjTcfQUsdJUTUT0vdx9mBmGvm9lGgwEvm6fwUW07u92IkS0lsWDnzoTl/NqoTE6
 eSArKee1Bsqtdy3KpGfXRDr1E+ZsnP2Q2JHUhUYmzipoD8sgrmFJg38on8AjE+O8qG
 ftviQRYS9VkELyn58VdzALl2sa9TQj5ph9057h7xNzdDMRRSmVuTjfPC1OxsC9Vpxc
 oOFLLdUfr1c2w/qRQBlLTGDjMm8YxxDZrrXpxIqahjcSO7wR6GB0oDXFxPfLQ4p776
 4H9YFZxq9vsXg==
Date: Fri, 21 Jun 2024 11:27:23 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <5vbvx7qnbv7dwugmnp2sitlpvvsor4hn573spbwaklwbwvilfy@evntmrout65x>
References: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
 <qru4aqjphjnjpo6yjxl2oznhlz774iv77u4u7u4jldnmlanps5@vpzxntuz6arp>
 <6bc864d6-11de-4762-b309-2e2a3bffaa24@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6bc864d6-11de-4762-b309-2e2a3bffaa24@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh R <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Sergiu Moga <sergiu.moga@microchip.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, chrome-platform@lists.linux.dev,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org, Doug Anderson <dianders@chromium.org>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Enric Balletbo i Serra <eballetbo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 0/7] dt-bindings: i2c: few fixes and
	cleanups
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

T24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMDg6MDI6MDNBTSBHTVQsIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6Cj4gT24gMjEvMDYvMjAyNCAwMTowNSwgQW5kaSBTaHl0aSB3cm90ZToKPiA+IEN6
ZcWbxIcgS3J6eXN6dG9mLAo+ID4gCj4gPiBPbiBUaHUsIEp1biAyMCwgMjAyNCBhdCAwMTozNDo0
OFBNIEdNVCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+PiBGZXcgZml4ZXMgZm9yIEky
QyBjb250cm9sbGVyIHNjaGVtYXMuIFRoZSB0aGlyZCBwYXRjaCAoYXRtZWwsYXQ5MXNhbSkKPiA+
PiBkZXBlbmRzIG9uIGZpcnN0LCBzbyBJIHN1Z2dlc3Qgbm90IHNwbGl0dGluZyB0aGlzIGludG8g
Zml4ZXMgYnJhbmNoIGJ1dAo+ID4+IHRha2UgYXMgaXMgdmlhIG5leHQgYnJhbmNoLgo+ID4+Cj4g
Pj4gQmVzdCByZWdhcmRzLAo+ID4+IEtyenlzenRvZgo+ID4+Cj4gPj4gLS0tCj4gPj4gS3J6eXN6
dG9mIEtvemxvd3NraSAoNyk6Cj4gPj4gICAgICAgZHQtYmluZGluZ3M6IGkyYzogYXRtZWwsYXQ5
MXNhbTogY29ycmVjdCBwYXRoIHRvIGkyYy1jb250cm9sbGVyIHNjaGVtYQo+ID4+ICAgICAgIGR0
LWJpbmRpbmdzOiBpMmM6IGdvb2dsZSxjcm9zLWVjLWkyYy10dW5uZWw6IGNvcnJlY3QgcGF0aCB0
byBpMmMtY29udHJvbGxlciBzY2hlbWEKPiA+IAo+ID4gbWVyZ2VkIHRvIGkyYy9pMmMtaG9zdC1m
aXhlcwo+ID4gCj4gPj4gICAgICAgZHQtYmluZGluZ3M6IGkyYzogYXRtZWwsYXQ5MXNhbTogZHJv
cCB1bm5lZWRlZCBhZGRyZXNzL3NpemUtY2VsbHMKPiA+PiAgICAgICBkdC1iaW5kaW5nczogaTJj
OiBudmlkaWEsdGVncmEyMDogZHJvcCB1bm5lZWRlZCBhZGRyZXNzL3NpemUtY2VsbHMKPiA+PiAg
ICAgICBkdC1iaW5kaW5nczogaTJjOiBzYW1zdW5nLHMzYzI0MTA6IGRyb3AgdW5uZWVkZWQgYWRk
cmVzcy9zaXplLWNlbGxzCj4gPj4gICAgICAgZHQtYmluZGluZ3M6IGkyYzogdGksb21hcDQ6IHJl
ZmVyZW5jZSBpMmMtY29udHJvbGxlci55YW1sIHNjaGVtYQo+ID4+ICAgICAgIGR0LWJpbmRpbmdz
OiBpMmM6IGFkanVzdCBpbmRlbnRhdGlvbiBpbiBEVFMgZXhhbXBsZSB0byBjb2Rpbmcgc3R5bGUK
PiA+IAo+ID4gbWVyZ2VkIHRvIGkyYy9pMmMtaG9zdAo+IAo+IFNvIHlvdSBicm9rZSB0aGUgYmlu
ZGluZy4uLiBXaHkgb3Blbmx5IGlnbm9yaW5nIG15IGZpcnN0IHNlbnRlbmNlPwoKSXQncyBub3Qg
YW4gaXNzdWUuIFdlIGNhbiBnZXQgdGhlIGZpeGVzIGZpcnN0IGFuZCBhcHBseSB0aGUgcmVzdAps
YXRlciwgSSBjYW4ga2VlcCB0aGVtIGluIG15IC1uZXh0IGJyYW5jaCBhbmQgcmVhcHBseSBuZXh0
IHdlZWsuCgpPdGhlcndpc2UgSSB3b3VsZCB3YWl0IGZvciBldmVyeXRoaW5nIGF0IHRoZSBtZXJn
ZSB3aW5kb3csIGJ1dCBJCmRvbid0IHdhbnQgdG8gd2FpdCBzbyBsb25nLgoKVGhhbmtzLApBbmRp
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
