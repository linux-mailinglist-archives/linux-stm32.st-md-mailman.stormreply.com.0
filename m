Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8598B5B98
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 16:41:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D4A5C71285;
	Mon, 29 Apr 2024 14:41:44 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6ABFC71283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 14:41:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BEC01CE0C44;
 Mon, 29 Apr 2024 14:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0748FC113CD;
 Mon, 29 Apr 2024 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714401693;
 bh=Y8ittdi7phk5dNVfh+YXp4HWbXwdUBw7WNQB4Y6gNmY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=PLGiMvriK5BT4zUvamHeAI2s4Q3l5wIDrZOOakljGUbNqC1Onh0lPfnjfex9dVqQX
 l4j1F2p2vpUVCBp4TbAp+sy5f9KpeKPj6z0x5hnGRjQzIZ2Cw9INm8QWc4VGpiCrCr
 NVv8AI4GDz9LU/kdWQCfGjXvL3bOfd+B00FrjvKs64evemn983ILvIoxDcFS/z7pvC
 sIiEc9f9gUnbyqx/kmbPMnsr2PyDjxyurd/v/9CdFxTeD+VyVAta7iXUkRiZLDXQxO
 sNpnfqDmqfwMwDKGRcWFYVOkV4x6qyRSS1YH+3DHo5duh5kMf8nI30OM2CTtcJtJDh
 R+BIQm7Jkn2+g==
Date: Mon, 29 Apr 2024 09:41:31 -0500
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
In-Reply-To: <20240427221048.65392-1-marex@denx.de>
References: <20240427221048.65392-1-marex@denx.de>
Message-Id: <171440141047.1676474.1900576669579352447.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sean Nyekjaer <sean@geanix.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: arm: stm32: Add
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

Ck9uIFN1biwgMjggQXByIDIwMjQgMDA6MTA6MTAgKzAyMDAsIE1hcmVrIFZhc3V0IHdyb3RlOgo+
IEFkZCBEVCBjb21wYXRpYmxlIHN0cmluZyBmb3IgREggZWxlY3Ryb25pY3MgU1RNMzJNUDEzeHgg
REhDT1IgU29NIGFuZAo+IERIU0JDIGNhcnJpZXIgYm9hcmQuIFRoaXMgc3RtMzJtcDEzNWYtZGhj
b3ItZGhzYmMgYm9hcmQgaXMgYSBzdGFjayBvZgo+IERIQ09SIFNvTSBiYXNlZCBvbiBTVE0zMk1Q
MTM1RiBTb0MgKDkwME1IeiAvIGNyeXB0byBjYXBhYmlsaXRpZXMpCj4gcG9wdWxhdGVkIG9uIERI
U0JDIGNhcnJpZXIgYm9hcmQuCj4gCj4gVGhlIFNvTSBjb250YWlucyB0aGUgZm9sbG93aW5nIHBl
cmlwaGVyYWxzOgo+IC0gU1RQTUlDIChwb3dlciBkZWxpdmVyeSkKPiAtIDUxMk1CIEREUjNMIG1l
bW9yeQo+IC0gZU1NQyBhbmQgU0RJTyBXaUZpIG1vZHVsZQo+IAo+IFRoZSBESFNCQyBjYXJyaWVy
IGJvYXJkIGNvbnRhaW5zIHRoZSBmb2xsb3dpbmcgcGVyaXBoZXJhbHM6Cj4gLSBUd28gUkdNSUkg
RXRoZXJuZXQgcG9ydHMKPiAtIFVTQi1BIEhvc3QgcG9ydCwgVVNCLUMgcGVyaXBoZXJhbCBwb3J0
LCBVU0ItQyBwb3dlciBzdXBwbHkgcGx1Zwo+IC0gRXhwYW5zaW9uIGNvbm5lY3Rvcgo+IAo+IFNp
Z25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+IC0tLQo+IENjOiAiTGVv
bmFyZCBHw7ZocnMiIDxsLmdvZWhyc0BwZW5ndXRyb25peC5kZT4KPiBDYzogQWhtYWQgRmF0b3Vt
IDxhLmZhdG91bUBwZW5ndXRyb25peC5kZT4KPiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFu
ZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KPiBDYzogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnByenl3
YXJhQGFybS5jb20+Cj4gQ2M6IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz4KPiBD
YzogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+
IENjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+Cj4gQ2M6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiBDYzogTWF4aW1lIENvcXVlbGlu
IDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgo+IENjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPgo+IENjOiBTZWFuIE55ZWtqYWVyIDxzZWFuQGdlYW5peC5jb20+Cj4gQ2M6IFN0ZWZm
ZW4gVHJ1bXRyYXIgPHMudHJ1bXRyYXJAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnCj4gQ2M6IGtlcm5lbEBkaC1lbGVjdHJvbmljcy5jb20KPiBDYzogbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPiAtLS0KPiBWMjogRml4IHRoZSBiaW5kaW5ncyB0byBs
aXN0IHRoZSByaWdodCBTb0MvU29NL0JvYXJkIGNvbXBhdGlibGVzCj4gLS0tCj4gIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbCB8IDYgKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKCgpNeSBib3QgZm91bmQgbmV3
IERUQiB3YXJuaW5ncyBvbiB0aGUgLmR0cyBmaWxlcyBhZGRlZCBvciBjaGFuZ2VkIGluIHRoaXMK
c2VyaWVzLgoKU29tZSB3YXJuaW5ncyBtYXkgYmUgZnJvbSBhbiBleGlzdGluZyBTb0MgLmR0c2ku
IE9yIHBlcmhhcHMgdGhlIHdhcm5pbmdzCmFyZSBmaXhlZCBieSBhbm90aGVyIHNlcmllcy4gVWx0
aW1hdGVseSwgaXQgaXMgdXAgdG8gdGhlIHBsYXRmb3JtCm1haW50YWluZXIgd2hldGhlciB0aGVz
ZSB3YXJuaW5ncyBhcmUgYWNjZXB0YWJsZSBvciBub3QuIE5vIG5lZWQgdG8gcmVwbHkKdW5sZXNz
IHRoZSBwbGF0Zm9ybSBtYWludGFpbmVyIGhhcyBjb21tZW50cy4KCklmIHlvdSBhbHJlYWR5IHJh
biBEVCBjaGVja3MgYW5kIGRpZG4ndCBzZWUgdGhlc2UgZXJyb3IocyksIHRoZW4KbWFrZSBzdXJl
IGR0LXNjaGVtYSBpcyB1cCB0byBkYXRlOgoKICBwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdy
YWRlCgoKTmV3IHdhcm5pbmdzIHJ1bm5pbmcgJ21ha2UgQ0hFQ0tfRFRCUz15IHN0L3N0bTMybXAx
MzVmLWRoY29yLWRoc2JjLmR0YicgZm9yIDIwMjQwNDI3MjIxMDQ4LjY1MzkyLTEtbWFyZXhAZGVu
eC5kZToKCmFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzVmLWRoY29yLWRoc2JjLmR0Yjog
L3NvYy9zZXJpYWxANDAwMTgwMDAvYmx1ZXRvb3RoOiBmYWlsZWQgdG8gbWF0Y2ggYW55IHNjaGVt
YSB3aXRoIGNvbXBhdGlibGU6IFsnaW5maW5lb24sY3l3NDM0MzktYnQnLCAnYnJjbSxiY200MzI5
LWJ0J10KYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzNWYtZGhjb3ItZGhzYmMuZHRiOiAv
c29jL3NhaUA0NDAwYTAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBhMDA0OiBmYWlsZWQgdG8gbWF0
Y2ggYW55IHNjaGVtYSB3aXRoIGNvbXBhdGlibGU6IFsnc3Qsc3RtMzItc2FpLXN1Yi1hJ10KYXJj
aC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzNWYtZGhjb3ItZGhzYmMuZHRiOiAvc29jL3NhaUA0
NDAwYTAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBhMDI0OiBmYWlsZWQgdG8gbWF0Y2ggYW55IHNj
aGVtYSB3aXRoIGNvbXBhdGlibGU6IFsnc3Qsc3RtMzItc2FpLXN1Yi1iJ10KYXJjaC9hcm0vYm9v
dC9kdHMvc3Qvc3RtMzJtcDEzNWYtZGhjb3ItZGhzYmMuZHRiOiAvc29jL3NhaUA0NDAwYjAwMC9h
dWRpby1jb250cm9sbGVyQDQ0MDBiMDA0OiBmYWlsZWQgdG8gbWF0Y2ggYW55IHNjaGVtYSB3aXRo
IGNvbXBhdGlibGU6IFsnc3Qsc3RtMzItc2FpLXN1Yi1hJ10KYXJjaC9hcm0vYm9vdC9kdHMvc3Qv
c3RtMzJtcDEzNWYtZGhjb3ItZGhzYmMuZHRiOiAvc29jL3NhaUA0NDAwYjAwMC9hdWRpby1jb250
cm9sbGVyQDQ0MDBiMDI0OiBmYWlsZWQgdG8gbWF0Y2ggYW55IHNjaGVtYSB3aXRoIGNvbXBhdGli
bGU6IFsnc3Qsc3RtMzItc2FpLXN1Yi1iJ10KCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
