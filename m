Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E0AA258E1
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 13:02:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 549B2C78F7C;
	Mon,  3 Feb 2025 12:02:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7636FC7802B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 12:02:36 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513B5nWI004481;
 Mon, 3 Feb 2025 13:02:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 a6soQxOpyQs5pInSURD+TjSc3ZmoT7ru1MQgRkMPBEI=; b=znPV7j1kbdActcJs
 KEFAFpz1ApcBZQurPiDkKwDdPb69EIZGpjpm5OkucXm7HsRN45bcbSHanZX3THGW
 5EBu6jy1YIh+V8UV7dTSQ0FbfcnL+6IVTnL1B/zKKaZtjGFKPLJGV7yH1W8a+n0y
 X3em/DGmxm8d+aJJUNRCdMPzL2e3P47E3E9I3HUGV3KgM2Lq/yn183QXPGItT4Fi
 BtWnmr0fMvqze0typTryKFe7jNzSKVt+cbm88373Rzu9pIhpQa7VziHn5lQzRLBv
 PnikWmuPdaLKr+TJyDoyEgiaYwokm41sztdUM5/nL/AdDp84Y3kKuO5KZPqFt46u
 DmIUzw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44jujv8hx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2025 13:02:21 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AC7B94004F;
 Mon,  3 Feb 2025 13:01:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 17C42264534;
 Mon,  3 Feb 2025 13:00:15 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Feb
 2025 13:00:14 +0100
Message-ID: <8f28bbc1-1ada-41b2-bff2-5ad549c934a5@foss.st.com>
Date: Mon, 3 Feb 2025 13:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marc Kleine-Budde <mkl@pengutronix.de>, "Rob Herring (Arm)"
 <robh@kernel.org>
References: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
 <173764775141.3793586.6690578690442295161.robh@kernel.org>
 <20250123-urban-belligerent-bullfinch-2fa9e6-mkl@pengutronix.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250123-urban-belligerent-bullfinch-2fa9e6-mkl@pengutronix.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_05,2025-01-31_02,2024-11-22_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kernel@pengutronix.de,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH stm32-next v3 0/2] ARM: dts: stm32:
 lxa-fairytux2: add gen{1, 2} boards
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

SGkKCk9uIDEvMjMvMjUgMTc6MDUsIE1hcmMgS2xlaW5lLUJ1ZGRlIHdyb3RlOgo+IE9uIDIzLjAx
LjIwMjUgMDk6NTc6NDcsIFJvYiBIZXJyaW5nIChBcm0pIHdyb3RlOgo+Pgo+PiBPbiBUdWUsIDIx
IEphbiAyMDI1IDEyOjE0OjA0ICswMTAwLCBNYXJjIEtsZWluZS1CdWRkZSB3cm90ZToKPj4+IEhl
bGxvLAo+Pj4KPj4+IHRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIExpbnV4IEF1dG9t
YXRpb24gR21iSCBGYWlyeVR1eDIKPj4+IGJvYXJkcyBnZW5lcmF0aW9uIDEgYW5kIDIuCj4+Pgo+
Pj4gVGhlIEZhaXJ5VHV4MiBpcyBhIHNtYWxsIExpbnV4IGRldmljZSBiYXNlZCBvbiBhbiBPY3Rh
dm8gU3lzdGVtcwo+Pj4gT1NEMzJNUDE1M2MgU2lQLCB0aGF0IG9jY3VwaWVzIGp1c3QgdHdvIHNs
b3RzIG9uIGEgRElOIHJhaWwuCj4+Pgo+Pj4gcmVnYXJkcywKPj4+IE1hcmMKPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBNYXJjIEtsZWluZS1CdWRkZSA8bWtsQHBlbmd1dHJvbml4LmRlPgo+Pj4gLS0t
Cj4+PiBDaGFuZ2VzIGluIHYzOgo+Pj4gLSAyLzI6IGZpeCB1c2UgZ2VuZXJpYyBub2RlIG5hbWVz
IGZvciBleHRlcm5hbCBHUElPIGFuZCBVU0IgVHlwZS1DIGNvbnRyb2xsZXIgKHRoYW5rcyBLcnp5
c3p0b2YpCj4+PiAtIDIvMjogTEVEczogcmVwbGFjZSBsYWJlbCBieSBjb2xvciBhbmQgZnVuY3Rp
b24gcHJvcGVydHkgKHRoYW5rcyBLcnp5c3p0b2YpCj4+PiAtIDIvMjogZ2VuMjogc29ydCBub2Rl
cyBvZiBpMmMxIGJ5IGFkZHJlc3MgKHRoYW5rcyBLcnp5c3p0b2YpCj4+PiAtIExpbmsgdG8gdjI6
IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI1MDEyMC1seGEtZmFpcnl0dXgtdjItMC05NWY0
YTBlYWE0NGRAcGVuZ3V0cm9uaXguZGUKPj4+Cj4+PiBDaGFuZ2VzIGluIHYyOgo+Pj4gLSAxLzI6
IEFkZGVkIEtyenlzenRvZidzIEFja2VkLWJ5Cj4+PiAtIDIvMjogZml4IGFsaWdubWVudCBmb3Ig
Z3Bpby1saW5lLW5hbWVzICh0aGFua3MgS3J6eXN6dG9mKQo+Pj4gLSAyLzI6IG9ubHkgdXNlIGNv
bG9yOmZ1bmN0aW9uIGZvciBMRUQgbGFiZWxzICh0aGFua3MgS3J6eXN6dG9mKQo+Pj4gLSAyLzI6
IHVzZSBnZW5lcmljIG5vZGUgbmFtZXMgZm9yIGV4dGVybmFsIEdQSU8gYW5kIFVTQiBUeXBlLUMg
Y29udHJvbGxlcgo+Pj4gLSBMaW5rIHRvIHYxOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAy
NDEyMTAtbHhhLWZhaXJ5dHV4LXYxLTAtOWFlYTAxY2RiODNlQHBlbmd1dHJvbml4LmRlCj4+Pgo+
Pj4gLS0tCj4+PiBMZW9uYXJkIEfDtmhycyAoMik6Cj4+PiAgICAgICAgZHQtYmluZGluZ3M6IGFy
bTogc3RtMzI6IGFkZCBjb21wYXRpYmxlIHN0cmluZ3MgZm9yIExpbnV4IEF1dG9tYXRpb24gR21i
SCBMWEEgRmFpcnlUdXggMgo+Pj4gICAgICAgIEFSTTogZHRzOiBzdG0zMjogbHhhLWZhaXJ5dHV4
MjogYWRkIExpbnV4IEF1dG9tYXRpb24gR21iSCBGYWlyeVR1eCAyCj4+Pgo+Pj4gICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbCAgICAgICB8ICAgMiArCj4+PiAg
IGFyY2gvYXJtL2Jvb3QvZHRzL3N0L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgIHwgICAy
ICsKPj4+ICAgLi4uL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTNjLWx4YS1mYWlyeXR1eDItZ2VuMS5k
dHMgfCAxMDMgKysrKysrCj4+PiAgIC4uLi9ib290L2R0cy9zdC9zdG0zMm1wMTUzYy1seGEtZmFp
cnl0dXgyLWdlbjIuZHRzIHwgMTQ3ICsrKysrKysrCj4+PiAgIC4uLi9hcm0vYm9vdC9kdHMvc3Qv
c3RtMzJtcDE1M2MtbHhhLWZhaXJ5dHV4Mi5kdHNpIHwgMzk3ICsrKysrKysrKysrKysrKysrKysr
Kwo+Pgo+PiBNeSBib3QgZm91bmQgbmV3IERUQiB3YXJuaW5ncyBvbiB0aGUgLmR0cyBmaWxlcyBh
ZGRlZCBvciBjaGFuZ2VkIGluIHRoaXMKPj4gc2VyaWVzLgo+IAo+IFRoaXMgcGF0Y2ggZG9lc24n
dCB0b3VjaCB0aGUgb2ZmZW5kaW5nIGZpbGUgInN0ZS1ocmVmdjYwcGx1cy10dmsuZHRiIi4KPiBN
aWdodCBiZSBhIG5ldyB3YXJuaW5nLCBidXQgbm90IGR1ZSB0byB0aGlzIHBhdGNoLCBjb3VsZCB0
aGlzIGJlIGEgZmFsc2UKPiBwb3NpdGl2ZT8KCkNhbiB5b3UgcmVwcm9kdWNlID8gT24gbXkgc2lk
ZSBJIGNhbid0LiBBcyB5b3Ugc2FpZCB0aGUgcmVwb3J0ZWQgZXJyb3IgCmhhcyBubyBsaW5rIHdp
dGggeW91ciBwYXRjaC4gSSdsbCBtZXJnZSBpdC4KCnJlZ2FyZHMKQUxleAoKCgo+PiBTb21lIHdh
cm5pbmdzIG1heSBiZSBmcm9tIGFuIGV4aXN0aW5nIFNvQyAuZHRzaS4gT3IgcGVyaGFwcyB0aGUg
d2FybmluZ3MKPj4gYXJlIGZpeGVkIGJ5IGFub3RoZXIgc2VyaWVzLiBVbHRpbWF0ZWx5LCBpdCBp
cyB1cCB0byB0aGUgcGxhdGZvcm0KPj4gbWFpbnRhaW5lciB3aGV0aGVyIHRoZXNlIHdhcm5pbmdz
IGFyZSBhY2NlcHRhYmxlIG9yIG5vdC4gTm8gbmVlZCB0byByZXBseQo+PiB1bmxlc3MgdGhlIHBs
YXRmb3JtIG1haW50YWluZXIgaGFzIGNvbW1lbnRzLgo+Pgo+PiBJZiB5b3UgYWxyZWFkeSByYW4g
RFQgY2hlY2tzIGFuZCBkaWRuJ3Qgc2VlIHRoZXNlIGVycm9yKHMpLCB0aGVuCj4+IG1ha2Ugc3Vy
ZSBkdC1zY2hlbWEgaXMgdXAgdG8gZGF0ZToKPj4KPj4gICAgcGlwMyBpbnN0YWxsIGR0c2NoZW1h
IC0tdXBncmFkZQo+Pgo+Pgo+PiBOZXcgd2FybmluZ3MgcnVubmluZyAnbWFrZSBDSEVDS19EVEJT
PXkgZm9yIGFyY2gvYXJtL2Jvb3QvZHRzL3N0LycgZm9yIDIwMjUwMTIxLWx4YS1mYWlyeXR1eC12
My0wLThkNDJkN2QyMzJmYkBwZW5ndXRyb25peC5kZToKPj4KPj4gYXJjaC9hcm0vYm9vdC9kdHMv
c3Qvc3RlLWhyZWZ2NjBwbHVzLXR2ay5kdGI6IGdwaW9AYTAzZmUwMDA6IGNvbXBhdGlibGU6MDog
J3N0ZXJpY3Nzb24sZGI4NTAwLWdwaW8nIGlzIG5vdCBvbmUgb2YgWydzdCxub21hZGlrLWdwaW8n
LCAnbW9iaWxleWUsZXllcTUtZ3BpbyddCj4+IAlmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL2dwaW8vc3Qsbm9tYWRpay1ncGlvLnlhbWwjCj4gCj4gcmVnYXJk
cywKPiBNYXJjCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
