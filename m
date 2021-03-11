Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE416337870
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 16:49:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A085C5718B;
	Thu, 11 Mar 2021 15:49:17 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A0CDC56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 15:49:15 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1lKNYm-0002P8-5J; Thu, 11 Mar 2021 16:49:12 +0100
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Marek Vasut <marex@denx.de>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "Alex G." <mr.nuke.me@gmail.com>,
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
 <c0898d96-2ea1-9b50-a195-8f619121c91c@foss.st.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <4e4bb5eb-54af-f6aa-6c77-f54d03fd7323@pengutronix.de>
Date: Thu, 11 Mar 2021 16:49:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c0898d96-2ea1-9b50-a195-8f619121c91c@foss.st.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGVsbG8sCgpPbiAxMS4wMy4yMSAxNjoxOCwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPj4gSSBy
YWlzZWQgdGhpcyBpc3N1ZSBiZWZvcmUgd2l0aCB5b3VyIGNvbGxlYWd1ZXMuIEkgc3RpbGwgYmVs
aWV2ZSB0aGUgY29ycmVjdCB3YXkKPj4gd291bGQgYmUgZm9yIHRoZSBURi1BIHRvIHBhc3MgZG93
biBlaXRoZXIgYSBkZXZpY2UgdHJlZSBvciBhbiBvdmVybGF5IHdpdGggdGhlCj4+IGFjdHVhbCBz
ZXR0aW5ncyBpbiB1c2UsIGUuZy46Cj4+Cj4+IMKgwqAgLSBDbG9ja3MvUmVzZXRzIGRvbmUgdmlh
IFNDTUkKPj4gwqDCoCAtIFJlc2VydmVkIG1lbW9yeSByZWdpb25zCj4+Cj4+IElmIFRGLUEgZGly
ZWN0bHkgYm9vdHMgTGludXgsIGl0IGNhbiBhcHBseSB0aGUgb3ZlcmxheSBpdHNlbGYsIG90aGVy
d2lzZSBpdCdzCj4+IHBhc3NlZCBkb3duIHRvIFNTQkwgdGhhdCBhcHBsaWVzIGl0IGJlZm9yZSBi
b290aW5nIExpbnV4Lgo+IERpc2N1c3Npbmcgd2l0aCB0Zi1hIGFuZCB1LWJvb3QgZ3V5cywgdGhp
cyBzb2x1dGlvbiBjb3VsZCBpbXBseSBoYXJkIHN5bmNocm9uaXphdGlvbiBiZXR3ZWVuIHRmLWEv
dS1ib290LiBUaGUgbW9zdCBzaW1wbGUgcmVtYWlucyBhICJzZWN1cmUiIGR0cy4KCk9QLVRFRSBj
YW4gYmUgY29uZmlndXJlZCB2aWEgQ0ZHX0VYVEVSTkFMX0RUQl9PVkVSTEFZIHRvIHBhc3MKYWxv
bmcgYW4gb3ZlcmxheSB0aGF0IGRlc2NyaWJlcyB0aGUgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMg
aXQgdXNlcy4KCkEgc2ltaWxpYXIgYXBwcm9hY2ggY291bGQgd29yayBoZXJlLiBUaGUgb25seSBz
eW5jaHJvbml6YXRpb24geW91IG5lZWQKaW4gTGludXggaXMgdG8ga2VlcCBwaGFuZGxlcyB0aGF0
IHRoZSBvdmVybGF5IGNhbiByZWZlcmVuY2UuCgpDaGVlcnMsCkFobWFkCgo+IAo+IHJlZ2FyZHMK
PiBBbGV4Cj4gCj4+IENoZWVycywKPj4gQWhtYWQKPj4KPj4+Cj4+PiBHYWJyaWVsLCBjYW4geW91
IHdhaXQgYSBiaXQgYmVmb3JlIHNlbmRpbmcgc29tZXRoaW5nIGFib3V0IFNDTUkgaW4gZHRzaSwg
SSB3b3VsZCBsaWtlIHRvIGFsaWduIHRoaXMgc3RyYXRlZ3kgaW50ZXJuYWxseS4KPj4+Cj4+PiBN
YXJlaywgQWxleDogdGhhbmtzIGZvciB5b3VyIGlucHV0cy4KPj4+Cj4+PiBSZWdhcmRzCj4+PiBB
bGV4Cj4+Pgo+Pj4+PiBUaGUgdGhpcmQgY291bGQgYmUgdGhlIGxlc3MgY29zdGx5Lgo+Pj4+Cj4+
Pj4gWy4uLl0KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+PiBMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKPj4+IExpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KPj4+IGh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCj4+Cj4gCgotLSAKUGVuZ3V0cm9uaXgg
ZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwKU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAgICAgICAgIHwgaHR0cDov
L3d3dy5wZW5ndXRyb25peC5kZS8gIHwKMzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSAgICAgICAg
ICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0wICAgIHwKQW10c2dlcmljaHQgSGls
ZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01MTIxLTIwNjkxNy01NTU1
IHwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
