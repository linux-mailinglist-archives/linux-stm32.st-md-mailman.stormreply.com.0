Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A148C7884
	for <lists+linux-stm32@lfdr.de>; Thu, 16 May 2024 16:37:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9E65C6C83A;
	Thu, 16 May 2024 14:37:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF832C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2024 14:37:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44GDhYKP005402;
 Thu, 16 May 2024 16:36:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=3ZOCADbz3OwcSrpGlTG7JoHBwcrSFGYRtD/O02Jz6P8=; b=TM
 tep9Ft/091Dsf51h3LVxZejBEVKw8E43mdTVikDAwUvcwfA3C869shJ+MPBV36gh
 bi+N2PWjTaJkMfPfCX3MiKzDca+F8z8/AzKXgf2SmB602osq3OL59phinPzZZcBb
 tNV7LcgAHv8OZS1xV121KFrxr+ArV5nf6DHBK3J1sOn0bVU+kBaU/+8Bgq79gcLo
 ESnJnh1l37xWfKU00ErNSC1+Ih8J+GhuFaZGX10U2DWI1stwjyNnViYsXv8XdsQI
 u3cEBtCaxAkFA7czVIiPoPRMNXolYIuEF7ugpAjpp/tqZWNffHAk3zKE61kR1jZm
 lVMAavVlaMBbbwDfFhLg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y4symdu0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 May 2024 16:36:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8DC5940044;
 Thu, 16 May 2024 16:36:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 894BD220B76;
 Thu, 16 May 2024 16:35:29 +0200 (CEST)
Received: from [10.48.87.204] (10.48.87.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 16:35:28 +0200
Message-ID: <eb3a2581-efc6-40c3-a7ea-551865017d40@foss.st.com>
Date: Thu, 16 May 2024 16:35:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-crypto@vger.kernel.org>
References: <20240513220349.183568-1-marex@denx.de>
 <b2d0dfcb-37d6-4375-a4ad-ca96a5339840@foss.st.com>
 <cc6f98eb-f6b2-4a34-a8ed-c0f759fa4c79@denx.de>
 <51951dd4-8e8c-4e67-89f6-6a710022e34f@foss.st.com>
 <3257e8f8-5bb0-4c75-a3a3-e5685b65de2a@denx.de>
 <5b39b5b6-7008-4362-a578-3faab87cd23b@foss.st.com>
 <2eb2b80e-8650-46cf-9d8f-6dd6a884558a@denx.de>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <2eb2b80e-8650-46cf-9d8f-6dd6a884558a@denx.de>
X-Originating-IP: [10.48.87.204]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
Cc: Rob Herring <robh@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Olivia Mackall <olivia@selenic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] [RFC] clk: stm32mp1: Keep RNG1 clock
	always running
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

CgpPbiA1LzE2LzI0IDEyOjQzLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA1LzE2LzI0IDk6NDIg
QU0sIEdhdGllbiBDSEVWQUxMSUVSIHdyb3RlOgo+IAo+IEhpLAo+IAo+Pj4+Pj4gV2hhdCBpZiB5
b3UgYWRkIGEgdHJhY2UgaW4gYSByYW5kb20gZ2VuZXJhdGlvbiBmdW5jdGlvbiBpbiByYW5kb20u
Yz8KPj4+Pj4KPj4+Pj4gRG8geW91IGhhdmUgYSBmdW5jdGlvbiBuYW1lIG9yIGxpbmUgbnVtYmVy
IGZvciBtZSA/Cj4+Pj4KPj4+PiBJIHB1dCBhIHRyYWNlIGluIF9nZXRfcmFuZG9tX2J5dGVzKCkg
aW4gZHJpdmVycy9jaGFyL3JhbmRvbS5jLiBJJ20gbm90Cj4+Pj4gMTAwJSBzdXJlIGJ1dCB0aGlz
IHNob3VsZCBiZSB0aGUgZW50cnkgcG9pbnQgd2hlbiBnZXR0aW5nIGEgcmFuZG9tIAo+Pj4+IG51
bWJlci4KPj4+Cj4+PiBZb3UncmUgcmlnaHQsIHRoZXJlIGlzIGEgcmVhZCBhdHRlbXB0IHJpZ2h0
IGJlZm9yZSB0aGUgaGFuZywgYW5kIAo+Pj4gX19jbGtfaXNfZW5hYmxlZCgpIHJldHVybnMgMCBp
biBzdG0zMl9yZWFkX3JuZygpIC4gSW4gZmFjdCwgaXQgaXMgdGhlIAo+Pj4gcG1fcnVudGltZV9n
ZXRfc3luYygpIHdoaWNoIGlzIHJldHVybmluZyAtRUFDQ0VTIGluc3RlYWQgb2YgemVybywgYW5k
IAo+Pj4gdGhpcyBpcyBjdXJyZW50bHkgbm90IGNoZWNrZWQgc28gdGhlIGZhaWx1cmUgaXMgbm90
IGRldGVjdGVkIGJlZm9yZSAKPj4+IHJlZ2lzdGVyIGFjY2VzcyB0YWtlcyBwbGFjZSwgdG8gcmVn
aXN0ZXIgZmlsZSB3aXRoIGNsb2NrIGRpc2FibGVkLCAKPj4+IHdoaWNoIHRyaWdnZXJzIGEgaGFy
ZCBoYW5nLgo+Pj4KPj4+IEknbGwgYmUgc2VuZGluZyBhIHBhdGNoIHNob3J0bHksIHRoYW5rcyBm
b3IgdGhpcyBoaW50ICEKPj4+Cj4+Cj4+IEdyZWF0IG5ld3MsIGluZGVlZCB0aGUgcmV0dXJuIGNv
ZGUgaXNuJ3QgY2hlY2tlZC4gTGV0J3MgdXNlCj4+IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQo
KS4KPiAKPiBZZXMgcGxlYXNlLgo+IAo+IEkgd2lsbCB3b25kZXIgd2h5IHdlIGdldCBFQUNDRVMg
dGhvdWdoLCB0aGF0IGJhc2ljYWxseSBtZWFucyB3ZSBhcmUgCj4gc3VzcGVuZGluZyBhbHJlYWR5
LiBJcyBpdCBzYWZlIHRvIHJldHVybiAtZXJybm8gZnJvbSBybmcgcmVhZCBmdW5jdGlvbiAKPiBp
biB0aGF0IGNhc2UgPwoKVGhlIGZyYW1ld29yayBleHBlY3RzIGEgZnVuY3Rpb24gdGhhdCBjYW4g
cmV0dXJuIGFuIGVycm9yIGNvZGUgc28gSQpkb24ndCBzZWUgd2h5IG5vdC4gRWxzZSB0aGUgZnJh
bWV3b3JrIHdvdWxkIGhhdmUgYW4gaXNzdWUuCgpJIHN0aWxsIGhhdmVuJ3QgZmlndXJlZCBvdXQg
d2hhdCBpcyBoYXBwZW5pbmcuCgpDb3VsZCBpdCBiZSB0aGF0IHRoZSBrZXJuZWwgaXMgZ2V0dGlu
ZyBlbnRyb3B5IHdpdGggaHdybmdfZmlsbGZuKCkKbGlrZSBpdCBkb2VzIHBlcmlvZGljYWxseSB0
byBmZWVkIHRoZSBlbnRyb3B5IHBvb2wgYW5kIGl0IGhhcHBlbnMgYXQgdGhlCnNhbWUgdGltZSBh
cyB5b3VyIHBtIHRlc3Qgc2VxdWVuY2U/CgpGWUksIEkgaGF2ZSBiZWVuIHJ1bm5pbmcgeW91ciBz
Y3JpcHQgd2l0aCAoZWNobyBkZXZpY2VzID4gCi9zeXMvcG93ZXIvcG1fdGVzdCkgZm9yIDUgaG91
cnMgbm93IGFuZCBoYXZlbid0IGJlZW4gYWJsZSB0byByZXByb2R1Y2UgCnRoZSBpc3N1ZS4KCj4g
Cj4+Pj4+PiBBZnRlciB0aGlzLCBJJ2xsIHRyeSB0byByZXByb2R1Y2UgdGhlIGlzc3VlLgo+Pj4+
Pgo+Pj4+PiBJZiB5b3UgaGF2ZSBhIG1pbnV0ZSB0byB0ZXN0IGl0IG9uIHNvbWUgU1QgTVAxNSBi
b2FyZCwgdGhhdCB3b3VsZCAKPj4+Pj4gYmUgcmVhbCBuaWNlLiBUaGFua3MgIQo+Pj4+Cj4+Pj4g
SSB0cmllZCB0byByZXByb2R1Y2UgdGhlIGlzc3VlIHlvdSdyZSBmYWNpbmcgb24gYSBTVE0zMk1Q
MTU3Qy1ESzIgbm8KPj4+PiBTQ01JIG9uIHRoZSA2LjktcmM3IGtlcm5lbCB0YWcuIEkgdXNlcyBP
UC1URUUgYW5kIFRGLUEgaW4gdGhlIGJvb3RjaGFpbgo+Pj4+IGJ1dCB0aGlzIHNob3VsZCBub3Qg
aGF2ZSBhbiBpbXBhY3QgaGVyZS4KPj4+Pgo+Pj4+IEhvdyBkaWQgeW91IG1hbmFnZSB0byB0ZXN0
IHVzaW5nICJlY2hvIGNvcmUgPiAvc3lzL3Bvd2VyL3BtX3Rlc3QiPwo+Pj4+IEluIGtlcm5lbC9w
b3dlci9zdXNwZW5kLmMsIGVudGVyX3N0YXRlKCkuIElmIHRoZSBwbV90ZXN0X2xldmVsIGlzIGNv
cmUsCj4+Pj4gdGhlbiBhbiBlcnJvciBpcyBmaXJlZCB3aXRoIHRoZSBmb2xsb3dpbmcgdHJhY2U6
Cj4+Pj4gIlVuc3VwcG9ydGVkIHRlc3QgbW9kZSBmb3Igc3VzcGVuZCB0byBpZGxlLCBwbGVhc2Ug
Y2hvb3NlIAo+Pj4+IG5vbmUvZnJlZXplci9kZXZpY2VzL3BsYXRmb3JtLiIKPj4+Cj4+PiBDb3Vs
ZCB0aGlzIGJlIGZpcm13YXJlIHJlbGF0ZWQgPwo+Pj4KPj4+PiBJJ3ZlIHRyaWVkIHVzaW5nICJl
Y2hvIGRldmljZXMgPiAvc3lzL3Bvd2VyL3BtX3Rlc3QiIHNvIHRoYXQgSSBjYW4gCj4+Pj4gYXQg
bGVhc3QgdGVzdCB0aGF0IHRoZSBkcml2ZXIgaXMgcHV0IHRvIHNsZWVwIHRoZW4gd2FrZXMgdXAu
IEkgZG8gbm90Cj4+Pj4gcmVwcm9kdWNlIHlvdXIgaXNzdWUuCj4+Pgo+Pj4gQ2FuIHlvdSB0cnkg
J3Byb2Nlc3NvcnMnID8KPj4+Cj4+Cj4+IEdpdmVuIHRoaXM6Cj4+ICNpZmRlZiBDT05GSUdfUE1f
REVCVUcKPj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAocG1fdGVzdF9sZXZlbCAhPSBURVNUX05PTkUg
JiYgcG1fdGVzdF9sZXZlbCA8PSBURVNUX0NQVVMpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHByX3dhcm4oIlVuc3VwcG9ydGVkIHRlc3QgbW9kZSBmb3Igc3VzcGVuZCB0byBpZGxlCj4g
Cj4gWW91J3JlIHN1cHBvc2VkIHRvIGJlIHN1c3BlbmRpbmcgdG8gJ21lbScgLCBub3QgJ2lkbGUn
IC4gQ291bGQgdGhhdCBiZSBpdCA/CgpZZXMgeW91J3JlIHJpZ2h0LCBJJ3ZlIGJlZW4gbWlzc2lu
ZyB0aGF0LiBJIGRvIG5vdCBoYXZlICJkZWVwIiBhdmFpbGFibGUKaW4gL3N5cy9wb3dlci9tZW1f
c2xlZXAuLi4gbm90IHVwc3RyZWFtZWQgeWV0IG1heWJlLi4uIEhhdmUgeW91IGNvZGVkIGEKUFND
SSBzZXJ2aWNlIGZvciB0aGlzIGluIFUtQm9vdD8KCkknbSBlaXRoZXIgbWlzc2luZyBzb21ldGhp
bmcgb3IgSSBjYW4ndCByZXByb2R1Y2UgeW91ciBzZXR1cC4KClRoYW5rcywKR2F0aWVuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
