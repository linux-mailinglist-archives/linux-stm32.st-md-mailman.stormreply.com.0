Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F17D7A4562C
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 08:01:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF191C7A82F;
	Wed, 26 Feb 2025 07:01:59 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 681C6C7A82E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 07:01:59 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1tnBQI-0004TO-Bu; Wed, 26 Feb 2025 08:01:38 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1tnBQH-002uEE-0Y;
 Wed, 26 Feb 2025 08:01:37 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1tnBQH-001TNf-0A;
 Wed, 26 Feb 2025 08:01:37 +0100
Date: Wed, 26 Feb 2025 08:01:37 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Woojung Huh <woojung.huh@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>
Message-ID: <Z768USN3iYrnz84G@pengutronix.de>
References: <20250220090155.2937620-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250220090155.2937620-1-o.rempel@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 0/3] Add support for Plymovent AQM board
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

SGkgQWxleGFuZHJlLAoKSnVzdCB3YW50ZWQgdG8gY2hlY2sgaWYgdGhlcmXigJlzIGFueXRoaW5n
IG5lZWRlZCBmcm9tIG15IHNpZGUgZm9yIHRoaXMKcGF0Y2guIExldCBtZSBrbm93IGlmIGZ1cnRo
ZXIgaW5wdXQgaXMgcmVxdWlyZWQuCgpCZXN0IFJlZ2FyZHMsCk9sZWtzaWoKCk9uIFRodSwgRmVi
IDIwLCAyMDI1IGF0IDEwOjAxOjUyQU0gKzAxMDAsIE9sZWtzaWogUmVtcGVsIHdyb3RlOgo+IFRo
aXMgcGF0Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIFBseW1vdmVudCBBUU0gYm9hcmQg
YmFzZWQgb24gdGhlCj4gU1RNMzJNUDE1MUMgU29DLiBBZGRpdGlvbmFsbHksIHRoZSBJQ1MtNDM0
MzIgZGV2aWNlIHRyZWUgYmluZGluZyBpcwo+IGNvbnZlcnRlZCB0byBZQU1MIHRvIGFkZHJlc3Mg
YSB2YWxpZGF0aW9uIHdhcm5pbmcuCj4gCj4gVGhlIElDUy00MzQzMiBwYXRjaCByZXNvbHZlcyBv
bmUgb2YgdGhlIGRldmljZXRyZWUgdmFsaWRhdGlvbiB3YXJuaW5ncy4KPiBIb3dldmVyLCB0aGUg
ZmFsc2UtcG9zaXRpdmUgd2FybmluZzoKPiAKPiAgICJhdWRpby1jb250cm9sbGVyQDQ0MDA0MDAw
OiBwb3J0OmVuZHBvaW50OiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZQo+ICAgIG5vdCBhbGxv
d2VkICgnZm9ybWF0JyB3YXMgdW5leHBlY3RlZCkiCj4gCj4gcmVtYWlucyB1bnJlc29sdmVkLiBU
aGUgImZvcm1hdCIgcHJvcGVydHkgaXMgcmVxdWlyZWQgZm9yIHByb3Blcgo+IGZ1bmN0aW9uYWxp
dHkgb2YgdGhpcyBkZXZpY2UuCj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IE9sZWtzaWogUmVtcGVs
ICgzKToKPiAgIGR0LWJpbmRpbmdzOiBzb3VuZDogY29udmVydCBJQ1MtNDM0MzIgYmluZGluZyB0
byBZQU1MCj4gICBkdC1iaW5kaW5nczogYXJtOiBzdG0zMjogQWRkIFBseW1vdmVudCBBUU0gYm9h
cmQKPiAgIGFybTogZHRzOiBzdG0zMjogQWRkIFBseW1vdmVudCBBUU0gZGV2aWNldHJlZQo+IAo+
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbCAgfCAgIDEgKwo+
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9pY3M0MzQzMi50eHQgICAgfCAgMTkgLQo+
ICAuLi4vYmluZGluZ3Mvc291bmQvaW52ZW5zZW5zZSxpY3M0MzQzMi55YW1sICAgfCAgNTEgKysK
PiAgYXJjaC9hcm0vYm9vdC9kdHMvc3QvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICAxICsK
PiAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1MWMtcGx5YXFtLmR0cyAgIHwgNjY5ICsr
KysrKysrKysrKysrKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDcyMiBpbnNlcnRpb25zKCspLCAx
OSBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb3VuZC9pY3M0MzQzMi50eHQKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9pbnZlbnNlbnNlLGljczQzNDMy
LnlhbWwKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAx
NTFjLXBseWFxbS5kdHMKPiAKPiAtLQo+IDIuMzkuNQo+IAo+IAoKLS0gClBlbmd1dHJvbml4IGUu
Sy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ClN0ZXVlcndhbGRlciBTdHIuIDIxICAgICAgICAgICAgICAgICAgICAgICB8IGh0dHA6Ly93
d3cucGVuZ3V0cm9uaXguZGUvICB8CjMxMTM3IEhpbGRlc2hlaW0sIEdlcm1hbnkgICAgICAgICAg
ICAgICAgICB8IFBob25lOiArNDktNTEyMS0yMDY5MTctMCAgICB8CkFtdHNnZXJpY2h0IEhpbGRl
c2hlaW0sIEhSQSAyNjg2ICAgICAgICAgICB8IEZheDogICArNDktNTEyMS0yMDY5MTctNTU1NSB8
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
