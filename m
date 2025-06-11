Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43408AD5883
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jun 2025 16:22:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0A13C32E8E;
	Wed, 11 Jun 2025 14:22:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC4AFC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 14:22:13 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BDrZjD022309;
 Wed, 11 Jun 2025 16:21:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 r3EVnRbmSMlgRrDXB3H2BP/1li0w1Wem69SzKRryKtY=; b=slImy+QRerHTh1HU
 DGp3sqBUjbpbzZCKMOaa3BESUZhhR2hcTAY6+HsBb5ffnGMuxumTknxTMo28yi9K
 mu0Zu+nz6c2ycnQlXEUWXBCWWZu8BIlTHXY4RDdqQLZ8e3tD7av+vd5d7ifycU6V
 J5NjDzwHTFhIYAPnlbRYdZ2QwSDeaM0/NhpbblmhOPGD/Gf8Uc6xEgUl2xV6PK8x
 zDhf7yFiaaKt3YaTmx0+fEH+agbWtBF4FSKjTCmYeMSt8Co98XhPqY3sAPixCd0J
 jgzt3YYac9fOvo66CPMoRkyeXwRq5v7xrV/2M+JNBI1MjpHknsMhFC7WcXZlbV3x
 LE2vVQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2u085-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jun 2025 16:21:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AE89940059;
 Wed, 11 Jun 2025 16:20:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B159DB23F16;
 Wed, 11 Jun 2025 16:08:27 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 16:08:27 +0200
Message-ID: <2865ab3a-1c20-4951-8132-4be98d73d70e@foss.st.com>
Date: Wed, 11 Jun 2025 16:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-5-bd6ca199466a@foss.st.com>
 <5b7a2102-ff68-4aab-a88d-0c4f9195ef95@kernel.org>
 <3c868c4b-8a0e-44b5-9d6e-3a0526d9deeb@foss.st.com>
 <3ba588ed-1614-4877-b6fc-b5aa853b8c2e@kernel.org>
 <714ad17d-53f1-4703-8e13-61c290a8da89@foss.st.com>
 <7000f63e-5e68-465d-9d7f-1a6ca0524222@kernel.org>
 <a49d0af2-07b7-4f51-941b-fa25b2879720@foss.st.com>
 <42a0b7ab-d85d-4d52-a263-4a4648c7ff05@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <42a0b7ab-d85d-4d52-a263-4a4648c7ff05@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 5/9] ARM: dts: stm32: add Hardware
 debug port (HDP) on stm32mp13
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

T24gNi8xMS8yNSAwODozNSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxMC8wNi8y
MDI1IDE1OjMzLCBDbGVtZW50IExFIEdPRkZJQyB3cm90ZToKPj4gT24gNi8xMC8yNSAxNDozOCwg
S3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+IE9uIDEwLzA2LzIwMjUgMTQ6MDIsIENsZW1l
bnQgTEUgR09GRklDIHdyb3RlOgo+Pj4+IE9uIDUvMjkvMjUgMTE6MDEsIEtyenlzenRvZiBLb3ps
b3dza2kgd3JvdGU6Cj4+Pj4+IE9uIDI4LzA1LzIwMjUgMTQ6MTQsIENsZW1lbnQgTEUgR09GRklD
IHdyb3RlOgo+Pj4+Pj4+Cj4+Pj4+Pj4+ICsJCX07Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gKwkJaGRw
OiBwaW5jdHJsQDUwMDJhMDAwIHsKPj4+Pj4+Pj4gKwkJCWNvbXBhdGlibGUgPSAic3Qsc3RtMzJt
cDEzMS1oZHAiOwo+Pj4+Pj4+PiArCQkJcmVnID0gPDB4NTAwMmEwMDAgMHg0MDA+Owo+Pj4+Pj4+
PiArCQkJY2xvY2tzID0gPCZyY2MgSERQPjsKPj4+Pj4+Pj4gICAgICAJCQlzdGF0dXMgPSAiZGlz
YWJsZWQiOwo+Pj4+Pj4+Cj4+Pj4+Pj4gV2h5IGFyZSB5b3UgZGlzYWJsaW5nIGl0PyBXaGF0IGlz
IG1pc3Npbmc/Cj4+Pj4+Pgo+Pj4+Pj4gTm90aGluZyBpcyBtaXNzaW5nIGp1c3QgZGlzYWJsZWQg
YnkgZGVmYXVsdC4KPj4+Pj4+IFRoZSBub2RlIGlzIHRoZW4gZW5hYmxlZCB3aGVuIG5lZWRlZCBp
biBib2FyZCdzIGR0cyBmaWxlLgo+Pj4+PiBOb2RlcyBzaG91bGQgbm90IGJlIGRpc2FibGVkIGJ5
IGRlZmF1bHQgaWYgdGhleSBhcmUgY29tcGxldGUuIFRoYXQncyB3aHkKPj4+Pj4gSSBhc2tlZCB3
aGF0IGlzIG1pc3NpbmcuIERyb3AuCj4+Pj4KPj4+PiBIaSBLcnp5c3p0b2YsIE9LIEkgYmV0dGVy
IHVuZGVyc3RhbmQgbm93Lgo+Pj4+IFNvIHllcyB0aGUgJ3BpbmN0cmwtKicgcHJvcGVydGllcyB3
aGljaCBhcmUgYm9hcmQgZGVwZW5kZW50IGFyZSBsYWNraW5nLgo+Pj4KPj4+IFRoZXNlIGFyZSBu
b3QgcHJvcGVydGllcyBvZiB0aGlzIG5vZGUuCj4+Cj4+IERvZXMgdGhpcyBtZWFuIEkgc2hvdWxk
IGFkZCAncGluY3RybC0qJyBwcm9wZXJ0aWVzIGluIGJpbmRpbmdzIHlhbWwgZmlsZSA/Cj4+IEkg
ZG9uJ3QgZ2V0IGl0Li4KPiAKPiBUaGVzZSBwcm9wZXJ0aWVzIGhhdmUgbm8gbWVhbmluZyBoZXJl
LCBzbyB0aGUgaGFyZHdhcmUgZGVzY3JpcHRpb24gaXMKPiBjb21wbGV0ZS4gWW91IGNsYWltIHRo
YXQgeW91IG1pc3MgdGhlbSB0aHVzIGRldmljZSBpcyBpbmNvbXBsZXRlIGlzIGp1c3QKPiBub3Qg
Y29ycmVjdDogdGhlc2UgcHJvcGVydGllcyBkbyBub3QgYmVsb25nIGhlcmUhIFRoZXkgYmVsb25n
IHRvIHRoZQo+IGJvYXJkIGJ1dCBldmVuIHRoZXJlIHRoZXkgYXJlIHRvdGFsbHkgb3B0aW9uYWwu
IFdoeSB3b3VsZCB0aGV5IGJlIGEKPiByZXF1aXJlZCByZXNvdXJjZT8KPiAKPiBUbyByZW1pbmQ6
IHdlIHRhbGsgaGVyZSBPTkxZIGFib3V0IHJlcXVpcmVkIHJlc291cmNlcy4KClllcywgJ3BpbmN0
cmwtKicgcHJvcGVydGllcyBiZWxvbmdzIHRvIHRoZSBib2FyZCBhbmQgYXJlIG5vdCByZXF1aXJl
ZC4KU28gbm90aGluZyBpcyBtaXNzaW5nLgoKVGhpcyBoZHAgbm9kZSBpbiB0aGUgU29DIGR0c2kg
ZmlsZSBjYW4gYmUgZW5hYmxlZCBieSBkZWZhdWx0LgpCdXQgdGhlIGhkcCBkcml2ZXIgd2lsbCBw
cm9iZSBhbmQgZG8gbm90aGluZyBiZWNhdXNlIHdpdGhvdXQgdGhlIAoncGluY3RybC0qJyBwcm9w
ZXJ0aWVzIGZyb20gdGhlIGJvYXJkIGZpbGVzIGl0IHdvdWxkIG5vdCBiZSBhYmxlIHRvIAphY2Nl
c3MgdG8gYW55IHBpbi4KSSBjb25zaWRlciBlbmFibGluZyB0aGlzIGRyaXZlciBieSBkZWZhdWx0
IGluIFNvQyBkdHNpIGZpbGUgYXMganVzdCAKaW5jcmVhc2luZyB0aGUgYm9vdCB0aW1lIG9uICJl
dmVyeSIgYm9hcmQuCkl0J3MgdGhlIGJvYXJkIGR0cyB0aGF0IHJlcXVpcmVzIHRoZSBoZHAgYW5k
IHByb3ZpZGVzIHRoZSAncGluY3RybC0qJyAKcHJvcGVydGllcyB0byBjb25uZWN0IHRoZSBoZHAg
dG8gc29tZSBTb0MgcGluIGFuZCB0aGVuIHRvIHNvbWUgc2lnbmFsIG9uIAp0aGUgYm9hcmQuIEZv
ciBtZSBpdCdzIG5hdHVyYWwgdG8gaGF2ZSB0aGUgc3RhdHVzIG9rYXkgb25seSBpbiB0aGUgYm9h
cmQgCmR0cyBmaWxlLgoKPj4KPj4+Pgo+Pj4+IEluIHRoZSBsYXN0IHBhdGNoIG9mIG15IHNlcmll
IEkgYWRkIHRoZW0gKG9ubHkgZm9yIHN0bTMybXAxNTdmLWRrMikgYnV0Cj4+Pj4ga2VlcCBpdCBk
aXNhYmxlZCBiZWNhdXNlIHRoZSBwaW4gaXMgb24gYW4gZXh0ZXJuYWwgY29ubmVjdG9yICh0aGUK
Pj4+PiBBcmR1aW5vIGNvbm5lY3RvciBvZiB0aGUgYm9hcmQpLgo+Pj4+IFRoaXMgcHJldmVudCBh
bnkgaXNzdWUgd2l0aCBhIHBvc3NpYmxlIGNvbm5lY3RlZCBtb2R1bGUuCj4+Pgo+Pj4gTm90IHJl
bGV2YW50LiBQaW4gY29udHJvbCBmb3IgY29ubmVjdG9yIGFyZSBib2FyZCBzcGVjaWZpYywgYnV0
IHBpbmN0cmwKPj4+IFNvQyBwYXJ0IGlzIFNvQy4KPj4KPj4gSSB0aGluayB3ZSBkb24ndCB1bmRl
cnN0YW5kIGVhY2ggb3RoZXIgaGVyZSB0b28uIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUKPj4gZW5k
IG9mIHlvdXIgc2VudGVuY2UgInBpbmN0cmwgU29DIHBhcnQgaXMgU29DIi4KPiAKPiBQbGVhc2Ug
cmVhZCBmaXJzdCBob3cgRFRTIGlzIG9yZ2FuaXplZC4KPiAKPiBUaGUgcGluIGNvbnRyb2xsZXIg
ZGV2aWNlIGlzIHBhcnQgb2YgU29DIG5vdCBwYXJ0IG9mIGEgYm9hcmQuCj4gCj4gUGlucyBjb25m
aWd1cmF0aW9uIGZvciBkZXZpY2VzIG9uIHRoZSBib2FyZCBhcmUgbm90IHBhcnQgb2YgdGhlIFNv
Qy4KPiBXaGF0IGlzIG5vdCBjbGVhciBoZXJlPyBXZSB0YWxrIGhlcmUgaW4gdGVybXMgaG93IERU
UyBpcyBzdXBwb3NlZCB0byBiZQo+IG9yZ2FuaXplZC4KCk5vdyBldmVyeXRoaW5nIGlzIGNsZWFy
LCB5b3Ugd2FudCBtZSB0byBqdXN0IHNldCBzdGF0dXMgZW5hYmxlIGluIHNvYyAKZHRzaSBmaWxl
IGJ1dCBJIGRpc2FncmVlLCBrZWVwIGRpc2N1c3NpbmcuCgo+IAo+Pgo+PiBNYXliZSBzb21lIGlu
Zm9ybWF0aW9ucyB0aGF0IGNvdWxkIGhlbHA6Cj4+IFRoZSAncGluY3RybC0qJyBwcm9wZXJ0aWVz
IGFyZSB1c2VkIGluIHRoZSBIRFAgY2FzZSB0byBzZWxlY3QgdGhlCj4+IGludGVybmFsIHNpZ25h
bCB0byBvdXRwdXQgQU5EIHRoZSBhbHRlcm5hdGUgZnVuY3Rpb24gb24gdGhlIHBpbiB0bwo+PiBv
dXRwdXQgdGhlIEhEUCBmdW5jdGlvbi4KPiAKPiBXZSBhbGwga25vdyB0aGlzLgoKT2sgZmluZQoK
QmVzdCByZWdhcmRzLAoKQ2zDqW1lbnQKCj4gCj4+Cj4+PiBCZXN0IHJlZ2FyZHMsCj4+PiBLcnp5
c3p0b2YKPj4KPiAKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
