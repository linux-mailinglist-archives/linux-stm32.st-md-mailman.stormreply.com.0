Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E68A4A4561F
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 07:59:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BD09C7A82F;
	Wed, 26 Feb 2025 06:59:26 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D53BCC7A82E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 06:59:25 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1tnBO3-0003ie-L6; Wed, 26 Feb 2025 07:59:19 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1tnBO2-002uE4-0w;
 Wed, 26 Feb 2025 07:59:18 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1tnBO2-001TMd-0J;
 Wed, 26 Feb 2025 07:59:18 +0100
Date: Wed, 26 Feb 2025 07:59:18 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <Z767xqh9T8mdoiAP@pengutronix.de>
References: <20250203085820.609176-1-o.rempel@pengutronix.de>
 <173859694746.2601652.11244969424431209545.robh@kernel.org>
 <Z6Msn8AxgG_JTVNs@pengutronix.de>
 <6db6e1d4-a0b1-4ce3-9235-d92bb19da1d6@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6db6e1d4-a0b1-4ce3-9235-d92bb19da1d6@foss.st.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Woojung Huh <woojung.huh@microchip.com>,
 "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@pengutronix.de, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 0/4] Add support for Priva
	E-Measuringbox board
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
ZXIgaW5wdXQgaXMgcmVxdWlyZWQuCgpCZXN0IFJlZ2FyZHMsCk9sZWtzaWoKCk9uIFdlZCwgRmVi
IDA1LCAyMDI1IGF0IDA1OjAyOjE5UE0gKzAxMDAsIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4g
SGkgT2xla3Npago+IAo+IE9uIDIvNS8yNSAxMDoxNywgT2xla3NpaiBSZW1wZWwgd3JvdGU6Cj4g
PiBIaSBBbGV4YW5kcmUsCj4gPiAKPiA+IE9uIE1vbiwgRmViIDAzLCAyMDI1IGF0IDA5OjM3OjA2
QU0gLTA2MDAsIFJvYiBIZXJyaW5nIChBcm0pIHdyb3RlOgo+ID4gPiAKPiA+ID4gT24gTW9uLCAw
MyBGZWIgMjAyNSAwOTo1ODoxNiArMDEwMCwgT2xla3NpaiBSZW1wZWwgd3JvdGU6Cj4gPiA+ID4g
VGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBzdXBwb3J0IGZvciB0aGUgUHJpdmEgRS1NZWFz
dXJpbmdib3ggYm9hcmQKPiA+ID4gPiBiYXNlZCBvbiB0aGUgU1QgU1RNMzJNUDEzMyBTb0MuIFRo
ZSBzZXQgaW5jbHVkZXMgYWxsIHRoZSBuZWNlc3NhcnkKPiA+ID4gPiBjaGFuZ2VzIGZvciBkZXZp
Y2UgdHJlZSBiaW5kaW5ncywgdmVuZG9yIHByZWZpeGVzLCB0aGVybWFsIHN1cHBvcnQsIGFuZAo+
ID4gPiA+IGJvYXJkLXNwZWNpZmljIGRldmljZXRyZWUgdG8gcGFzcyBkZXZpY2V0cmVlIHZhbGlk
YXRpb24gYW5kIGNoZWNrcGF0Y2gKPiA+ID4gPiB0ZXN0cy4KPiA+ID4gPiAKPiA+IAo+ID4gLi4u
Cj4gPiAKPiA+ID4gYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzM2MtcHJpaG1iLmR0Yjog
YWRjQDQ4MDA0MDAwOiBhZGNAMDppbnRlcnJ1cHRzOiAwIHdhcyBleHBlY3RlZAo+ID4gPiAJZnJv
bSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9paW8vYWRjL3N0LHN0
bTMyLWFkYy55YW1sIwo+ID4gPiBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMzYy1wcmlo
bWIuZHRiOiBhZGNANDgwMDMwMDA6IGFkY0AwOmludGVycnVwdHM6IDAgd2FzIGV4cGVjdGVkCj4g
PiA+IAlmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2lpby9h
ZGMvc3Qsc3RtMzItYWRjLnlhbWwjCj4gPiAKPiA+IAo+ID4gQ2FuIEkgcGxlYXNlIGdldCB5b3Vy
IGF0dGVudGlvbiBoZXJlLiBUaGUgcmVwb3J0ZWQgaXNzdWUgaXMgbm90IHJlbGF0ZWQKPiA+IHRv
IHRoaXMgcGF0Y2ggc2V0LiBhZGNAMDppbnRlcnJ1cHRzIGFyZSBzZXQgaW4gdGhlIGR0c2kgZmls
ZS4KPiAKPiBZZXMgSSBzYXcgdGhpcyBpc3N1ZSB0b28gd2hlbiBJIHRyaWVkIHRvIG1lcmdlIHlv
dXIgc2VyaWVzLiBJJ20gZGlzY3Vzc2luZwo+IHdpdGggU1RNMzIgQURDIGRyaXZlciBvd25lciB0
byBmaXggdGhlIGlzc3VlIChlaXRoZXIgaW4gc3RtMzIgYWRjIHlhbWwgb3IKPiBtYXliZSBpbiBz
Y2hlbWEpLgo+IAo+IEFueXdheSB3ZSBhbHNvIGhhdmUgdGhlIGlzc3VlIGZvciBTVE0zMk1QMTM1
Ri1ESyBib2FyZCBzbyBJJ2xsIG1lcmdlIHlvdXIKPiBzZXJpZXMgYXMgaXQgZG9lc24ndCBpbnRy
b2R1Y2UgdGhlIGlzc3VlLgo+IAo+IHJlZ2FyZHMKPiBBbGV4Cj4gCj4gCj4gCj4gCj4gPiBLaW5k
IHJlZ2FyZHMsCj4gPiBPbGVrc2lqCj4gCgotLSAKUGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKU3RldWVyd2Fs
ZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAgICAgICAgIHwgaHR0cDovL3d3dy5wZW5ndXRyb25p
eC5kZS8gIHwKMzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSAgICAgICAgICAgICAgICAgIHwgUGhv
bmU6ICs0OS01MTIxLTIwNjkxNy0wICAgIHwKQW10c2dlcmljaHQgSGlsZGVzaGVpbSwgSFJBIDI2
ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01MTIxLTIwNjkxNy01NTU1IHwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
