Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BF3337EBC
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 21:09:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 297F1C5718B;
	Thu, 11 Mar 2021 20:09:46 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9886AC56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 20:09:44 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DxKmR5bXsz1qs38;
 Thu, 11 Mar 2021 21:09:43 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DxKmR3gKNz1qr4s;
 Thu, 11 Mar 2021 21:09:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id xdvMXdWRZ0pI; Thu, 11 Mar 2021 21:09:41 +0100 (CET)
X-Auth-Info: 4h4LNEsJBJd7/MPZriIKyOYb+MfyZ+tSGG76SXiY4q8=
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 11 Mar 2021 21:09:41 +0100 (CET)
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Alexandre TORGUE <alexandre.torgue@st.com>, "Alex G."
 <mr.nuke.me@gmail.com>,
 Gabriel FERNANDEZ - foss <gabriel.fernandez@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Etienne CARRIERE <etienne.carriere@st.com>
References: <20210126090120.19900-1-gabriel.fernandez@foss.st.com>
 <2e04f814-b694-119d-fe8a-13e6df129536@gmail.com>
 <AS8PR10MB4712C27260707345FA99ED5AEE909@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
 <c57775fe-41ef-07f5-56a2-04b8f70797c1@denx.de>
 <463dafed-ec60-cd9a-33d2-ba118a6af629@foss.st.com>
 <c1c9c89b-8794-9b91-b626-d743cd8ff31e@pengutronix.de>
 <b87a2b24-678a-724d-e5df-1eabf5969ad2@denx.de>
 <a23933fa-0c94-1e22-6100-d5b1a50826dd@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <58d107c4-eb3d-e49a-8377-007b6f21baf4@denx.de>
Date: Thu, 11 Mar 2021 21:09:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <a23933fa-0c94-1e22-6100-d5b1a50826dd@foss.st.com>
Content-Language: en-US
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 00/14] Introduce STM32MP1 RCC in
 secured mode
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

T24gMy8xMS8yMSA3OjEwIFBNLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+IEhpIEd1eXMKPiAK
PiBPbiAzLzExLzIxIDU6MTEgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiAzLzExLzIxIDM6
NDEgUE0sIEFobWFkIEZhdG91bSB3cm90ZToKPj4+IEhlbGxvLAo+Pgo+PiBIaSwKPj4KPj4+IE9u
IDExLjAzLjIxIDE1OjAyLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+Pj4+IE9uIDMvMTEvMjEg
MTI6NDMgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4+PiBPbiAzLzExLzIxIDk6MDggQU0sIEFs
ZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4+Pj4+PiAxLSBCcmVhayB0aGUgY3VycmVudCBBQkk6IGFz
IHNvb24gYXMgdGhvc2UgcGF0Y2hlcyBhcmUgbWVyZ2VkLCAKPj4+Pj4+IHN0bTMybXAxNTdjLWRr
Mi5kdGIgd2lsbCBpbXBvc2UgdG8gdXNlCj4+Pj4+PiBBIHRmLWEgZm9yIHNjbWkgY2xvY2tzLiBG
b3IgcGVvcGxlIHVzaW5nIHUtYm9vdCBzcGwsIHRoZSB3aWxsIGhhdmUgCj4+Pj4+PiB0byBjcmVh
dGUgdGhlaXIgb3duICJuby1zZWN1cmUiIGRldmljZXRyZWUuCj4+Pj4+Cj4+Pj4+IE5BSywgdGhp
cyBicmVha3MgZXhpc3RpbmcgYm9hcmRzIGFuZCBleGlzdGluZyBzZXR1cHMsIGUuZy4gREsyIHRo
YXQgCj4+Pj4+IGRvZXMgbm90IHVzZSBBVEYuCj4+Pj4+Cj4+Pj4+PiAyLUFzIHlvdSBzdWdnZXN0
LCBjcmVhdGUgYSBuZXcgInNlY3VyZSIgZHRiIHBlciBib2FyZHMgKE5vdCBteSAKPj4+Pj4+IHdp
c2ggZm9yIG1haW50ZW5hbmNlIHBlcnNwZWN0aXZlcykuCj4+Pj4+Cj4+Pj4+IEkgYWdyZWUgd2l0
aCBBbGV4IChHKSB0aGF0IHRoZSAic2VjdXJlIiBvcHRpb24gc2hvdWxkIGJlIG9wdC1pbi4KPj4+
Pj4gVGhhdCB3YXkgZXhpc3Rpbmcgc2V0dXBzIHJlbWFpbiB3b3JraW5nIGFuZCBubyBleHRyYSBy
ZXF1aXJlbWVudHMgCj4+Pj4+IGFyZSBpbXBvc2VkIG9uIE1QMSB1c2Vycy4gRXNwLiBzaW5jZSBh
cyBmYXIgYXMgSSB1bmRlcnN0YW5kIHRoaXMsIAo+Pj4+PiB0aGUgInNlY3VyZSIgcGFydCBpc24n
dCByZWFsbHkgYWJvdXQgc2VjdXJpdHksIGJ1dCByYXRoZXIgYWJvdXQgCj4+Pj4+IG1vdmluZyBj
bG9jayBjb25maWd1cmF0aW9uIGZyb20gTGludXggdG8gc29tZSBmaXJtd2FyZSBibG9iLgo+Pj4+
Pgo+Pj4+Pj4gMy0gS2VlcCBrZXJuZWwgZGV2aWNlIHRyZWUgYXMgdGhleSBhcmUgYW5kIGFwcGxp
ZWQgdGhpcyBzZWN1cmUgCj4+Pj4+PiBsYXllciAoc2NtaSBjbG9ja3MgcGhhbmRsZSkgdGhhbmtz
IHRvIGR0Ym8gaW4KPj4+Pj4+IFUtYm9vdC4KPj4+Pj4KPj4+Pj4gSXMgdGhpcyByZWFsbHkgYmV0
dGVyIHRoYW4KPj4+Pj4gI2luY2x1ZGUgInN0bTMybXAxNXh4LWVuYWJsZS1zZWN1cmUtc3R1ZmYu
ZHRzaSIKPj4+Pj4gaW4gYSBib2FyZCBEVCA/IEJlY2F1c2UgdGhhdCBpcyBob3cgSSBpbWFnaW5l
IHRoZSBvcHQtaW4gInNlY3VyZSIgCj4+Pj4+IG9wdGlvbiBjb3VsZCB3b3JrLgo+Pj4+Pgo+Pj4+
Cj4+Pj4gRGlzY3Vzc2luZyB3aXRoIFBhdHJpY2sgYWJvdXQgdS1ib290LCB3ZSBjb3VsZCB1c2Ug
ZHRibyBhcHBsaWNhdGlvbiAKPj4+PiB0aGFua3MgdG8gZXh0bGludXguY29uZi4gQlVUIGl0IGl0
IHdpbGwgbm90IHByZXZlbnQgb3RoZXIgY2FzZSAoaS5lLiAKPj4+PiBURi1BIHdoaWNoIGp1bXAg
ZGlyZWN0bHkgaW4ga2VybmVsQCkuIFNvIHRoZSAibGVhc3Qgd29yc3QiIHNvbHV0aW9uIAo+Pj4+
IGlzIHRvIGNyZWF0ZSBhIG5ldyAic3RtMzJtcDEyNTdjLXNjbWktZGsyIGJvYXJkIHdoaWNoIHdp
bGwgb3ZlcmxvYWQgCj4+Pj4gY2xvY2sgZW50cmllcyB3aXRoIGEgc2NtaSBwaGFuZGxlIChhcyBw
cm9wb3NlZCBieSBBbGV4KS4KPj4+Cj4+PiBJIHJhaXNlZCB0aGlzIGlzc3VlIGJlZm9yZSB3aXRo
IHlvdXIgY29sbGVhZ3Vlcy4gSSBzdGlsbCBiZWxpZXZlIHRoZSAKPj4+IGNvcnJlY3Qgd2F5Cj4+
PiB3b3VsZCBiZSBmb3IgdGhlIFRGLUEgdG8gcGFzcyBkb3duIGVpdGhlciBhIGRldmljZSB0cmVl
IG9yIGFuIG92ZXJsYXkgCj4+PiB3aXRoIHRoZQo+Pj4gYWN0dWFsIHNldHRpbmdzIGluIHVzZSwg
ZS5nLjoKPj4+Cj4+PiDCoMKgIC0gQ2xvY2tzL1Jlc2V0cyBkb25lIHZpYSBTQ01JCj4+PiDCoMKg
IC0gUmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMKPj4+Cj4+PiBJZiBURi1BIGRpcmVjdGx5IGJvb3Rz
IExpbnV4LCBpdCBjYW4gYXBwbHkgdGhlIG92ZXJsYXkgaXRzZWxmLCAKPj4+IG90aGVyd2lzZSBp
dCdzCj4+PiBwYXNzZWQgZG93biB0byBTU0JMIHRoYXQgYXBwbGllcyBpdCBiZWZvcmUgYm9vdGlu
ZyBMaW51eC4KPj4KPj4gVGhhdCBzb3VuZHMgZ29vZCBhbmQgaXQgaXMgc29tZXRoaW5nIGUuZy4g
Ui1DYXIgYWxyZWFkeSBkb2VzLCBpdCAKPj4gbWVyZ2VzIERUIGZyYWdtZW50IGZyb20gcHJpb3Ig
c3RhZ2VzIGF0IFUtQm9vdCBsZXZlbCBhbmQgdGhlbiBwYXNzZXMgCj4+IHRoZSByZXN1bHQgdG8g
TGludXguCj4+Cj4+IFNvIG9uIFNUIGhhcmR3YXJlLCB0aGUgc2FtZSBjb3VsZCB2ZXJ5IHdlbGwg
aGFwcGVuIGFuZCBpdCB3b3VsZCB3b3JrIAo+PiBmb3IgYm90aCBub24tQVRGIC8gQVRGIC8gQVRG
K1RFRSBvcHRpb25zLgo+IAo+IEV2ZW4gdGhpcyBzb2x1dGlvbiBzb3VuZHMgZ29vZCBidXQgd2Ug
YXJlIGN1cnJlbnRseSBub3QgYWJsZSB0byBkbyBpdCBpbiAKPiBvdXIgVEYtQS91LWJvb3Qgc28g
bm90IGZlYXNpYmxlIGZvciB0aGUgbW9tZW50LgoKV2h5IG5vdCA/IFUtQm9vdCBpcyBwZXJmZWN0
bHkgY2FwYWJsZSBvZiBtZXJnaW5nIHByaW9yIHN0YWdlIERUIGFuZCBEVCAKbG9hZGVkIGZyb20g
ZWxzZXdoZXJlLiBTZWUgUi1DYXIzIGZvciBleGFtcGxlLgoKPiBTbyB3ZSBoYXZlIHRvIGZpbmQg
YSAKPiBzb2x1dGlvbiBmb3Igbm93LiBDcmVhdGUgYSBuZXcgZHRiIGNhbiBiZSB0aGlzIHNvbHV0
aW9uLiBPdXIgaW50ZXJuYWwgCj4gc3RyYXRlZ3kgaXMgdG8gdXNlIHNjbWkgb24gb3VyIG9mZmlj
aWFsIFNUIGJvYXJkLiBJdCB3aWxsIGJlIGEgcmVhbGx5IAo+IGRyYXdiYWNrIHRvIGluY2x1ZGUg
YSAibm8tc2NtaS5kdHNpIiBpbiBESCBib2FyZHMgKGZvciBleGFtcGxlKSBhbmQgdG8gCj4gY3Jl
YXRlIGEgc3RtMzJtcDE1N2Mtbm9zY21pLWRrMi5kdHMgPwoKSSB3b3VsZCBoaWdobHkgcHJlZmVy
IHRoZSBTQ01JIHRvIGJlIG9wdC1pbiwgbm90IG9wdC1vdXQuCgpCdXQgc3RpbGwsIGlzbid0IGl0
IHBvc3NpYmxlIHRvIGF1dG8tZGV0ZWN0IHRoZSBib2FyZCBjb25maWd1cmF0aW9uIGluIApMaW51
eCBhbmQgcGljayB0aGUgY2xvY2sgZW51bWVyYXRpb24gYmFzZWQgb24gdGhhdCBhdXRvbWF0aWNh
bGx5ID8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
