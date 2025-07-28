Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C04B13915
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jul 2025 12:39:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4428EC36B2E;
	Mon, 28 Jul 2025 10:39:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF896C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 10:39:04 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAK6Pk031811;
 Mon, 28 Jul 2025 12:38:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 2TRBNRU0aazEaz412aN0yClz+07/RSAtN1hf3sqcbTY=; b=3duh5Aotax1L6S6u
 3Wfer4PGVcgXjO92s+e7kzK5anxAOga19rCv/l6vuBIvnnaHiWdWQR8La38yiVqY
 oX2PooxgymVguBVZ3ZTrg9+bPNmJNeVn6frG+gj3Uo1QBLNOG1mM7ZYZ0tTuc+Ba
 1Vp8TxeYiWzwSR5eNJIi7XnIp74HBDzr9bgBLmgQdCz7N0WVXrS5QZF4r4HUj7oB
 9l9oCHDf0v0E6onuymUAmSy06IKGdqvwcbdoZSmTbZmRibUmGIhENqidnl5Gkc6i
 OmEHzWNlh+Vg8iAYv04BiCvCvm1m+voNydrK4q8gqmY2uRo4WqzMfJjjPH0fyxKf
 3vaWNA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484pc27rr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jul 2025 12:38:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B67FC4002D;
 Mon, 28 Jul 2025 12:37:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4CFD6769726;
 Mon, 28 Jul 2025 12:36:04 +0200 (CEST)
Received: from [10.252.20.157] (10.252.20.157) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 12:36:03 +0200
Message-ID: <58bcd0dc-9df0-461c-8e11-5e892bee2f34@foss.st.com>
Date: Mon, 28 Jul 2025 12:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
 <20250725-drm-misc-next-v1-1-a59848e62cf9@foss.st.com>
 <20250725194936.GA1731993-robh@kernel.org>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250725194936.GA1731993-robh@kernel.org>
X-Originating-IP: [10.252.20.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
Cc: Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/12] dt-bindings: display: st: add new
 compatible to LTDC device
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

CgpPbiA3LzI1LzI1IDIxOjQ5LCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBGcmksIEp1bCAyNSwg
MjAyNSBhdCAxMjowMzo1M1BNICswMjAwLCBSYXBoYWVsIEdhbGxhaXMtUG91IHdyb3RlOgo+PiBU
aGUgbmV3IFNUTWljcm9lbGVjdHJvbmljcyBTb0MgZmVhdHVyZXMgYSBkaXNwbGF5IGNvbnRyb2xs
ZXIgc2ltaWxhciB0bwo+PiB0aGUgb25lIHVzZWQgaW4gcHJldmlvdXMgU29Dcy4gIEJlY2F1c2Ug
dGhlcmUgaXMgYWRkaXRpb25hbCByZWdpc3RlcnMsCj4+IGl0IGlzIGluY29tcGF0aWJsZSB3aXRo
IGV4aXN0aW5nIElQcy4KPj4KPj4gQWRkIHRoZSBuZXcgbmFtZSB0byB0aGUgbGlzdCBvZiBjb21w
YXRpYmxlIHN0cmluZy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8
cmFwaGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+ICAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMueWFtbCB8IDM3ICsrKysrKysrKysrKysr
KysrKystLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy55YW1sCj4+IGluZGV4IGQ2ZWE0ZDYyYTJjZmFl
MjYzNTNjOWYyMGEzMjZhNDMyOWZlZDNhMmYuLjU0NmY1N2NiN2E0MDJiODJlODY4YWEwNWY4NzRj
NjViOGRhMTk0NDQgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnlhbWwKPj4gQEAgLTEyLDcg
KzEyLDkgQEAgbWFpbnRhaW5lcnM6Cj4+ICAKPj4gIHByb3BlcnRpZXM6Cj4+ICAgIGNvbXBhdGli
bGU6Cj4+IC0gICAgY29uc3Q6IHN0LHN0bTMyLWx0ZGMKPj4gKyAgICBlbnVtOgo+PiArICAgICAg
LSBzdCxzdG0zMi1sdGRjCj4+ICsgICAgICAtIHN0LHN0bTMybXAyNS1sdGRjCj4+ICAKPj4gICAg
cmVnOgo+PiAgICAgIG1heEl0ZW1zOiAxCj4+IEBAIC0yNCwxMSArMjYsMTIgQEAgcHJvcGVydGll
czoKPj4gICAgICBtaW5JdGVtczogMQo+PiAgCj4+ICAgIGNsb2NrczoKPj4gLSAgICBtYXhJdGVt
czogMQo+PiArICAgIG1pbkl0ZW1zOiAxCj4+ICsgICAgbWF4SXRlbXM6IDQKPj4gIAo+PiAgICBj
bG9jay1uYW1lczoKPj4gLSAgICBpdGVtczoKPj4gLSAgICAgIC0gY29uc3Q6IGxjZAo+PiArICAg
IG1pbkl0ZW1zOiAxCj4+ICsgICAgbWF4SXRlbXM6IDQKPj4gIAo+PiAgICByZXNldHM6Cj4+ICAg
ICAgbWF4SXRlbXM6IDEKPj4gQEAgLTUxLDYgKzU0LDMyIEBAIHJlcXVpcmVkOgo+PiAgICAtIHJl
c2V0cwo+PiAgICAtIHBvcnQKPj4gIAo+PiAraWY6Cj4+ICsgIHByb3BlcnRpZXM6Cj4+ICsgICAg
Y29tcGF0aWJsZToKPj4gKyAgICAgIGNvbnRhaW5zOgo+PiArICAgICAgICBlbnVtOgo+PiArICAg
ICAgICAgIC0gc3Qsc3RtMzItbHRkYwo+PiArdGhlbjoKPj4gKyAgcHJvcGVydGllczoKPj4gKyAg
ICBjbG9ja3M6Cj4+ICsgICAgICBtYXhJdGVtczogMQo+PiArICAgIGNsb2NrLW5hbWVzOgo+PiAr
ICAgICAgbWF4SXRlbXM6IDEKPj4gKyAgICAgIGl0ZW1zOgo+PiArICAgICAgICAtIGNvbnN0OiBs
Y2QKPj4gK2Vsc2U6Cj4+ICsgIHByb3BlcnRpZXM6Cj4+ICsgICAgY2xvY2tzOgo+PiArICAgICAg
bWF4SXRlbXM6IDQKPj4gKyAgICBjbG9jay1uYW1lczoKPj4gKyAgICAgIG1heEl0ZW1zOiA0Cj4+
ICsgICAgICBpdGVtczoKPj4gKyAgICAgIC0gY29uc3Q6IGJ1cwo+PiArICAgICAgLSBjb25zdDog
bGNkCj4gV2h5IGNhbid0ICdsY2QnIGJlIDFzdCBzbyB5b3UgYXJlbid0IGNoYW5naW5nIHBvc2l0
aW9ucz8gS2VlcCB0aGUgaXRlbXMgCj4gbGlzdCBhdCB0aGUgdG9wIGxldmVsIGFuZCBqdXN0IHVz
ZSBtaW5JdGVtcy9tYXhJdGVtcyBpbiB0aGUgaWYvdGhlbiAKPiBzY2hlbWFzLgpIaSBSb2IsCgpJ
J3ZlIHNldCB0aGUgbmFtZSBvcmRlciB0byBtYXRjaCB0aGUgc3RtMzJtcDI1NS5kdHNpIGRldmlj
ZS10cmVlLCBzbyB0aGF0IGl0CmRvZXMgbm90IGNvbmZ1c2UgYW55Ym9keSByZWdhcmRpbmcgd2hp
Y2ggY2xvY2sgZ29lcyB3aXRoLgoKWW91ciBjb21tZW50IGlzIHRha2VuIGludG8gYWNjb3VudCBm
b3IgdGhlIHVwY29taW5nIHZlcnNpb24uCgpUaGFua3MsClJhcGhhw6tsCj4KPj4gKyAgICAgIC0g
Y29uc3Q6IHJlZgo+PiArICAgICAgLSBjb25zdDogbHZkcwo+PiArCj4+ICBhZGRpdGlvbmFsUHJv
cGVydGllczogZmFsc2UKPj4gIAo+PiAgZXhhbXBsZXM6Cj4+Cj4+IC0tIAo+PiAyLjI1LjEKPj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
