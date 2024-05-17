Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBBF8C897A
	for <lists+linux-stm32@lfdr.de>; Fri, 17 May 2024 17:41:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13291C6DD6E;
	Fri, 17 May 2024 15:41:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61C39C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2024 15:41:10 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44HB5A16004163;
 Fri, 17 May 2024 17:40:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=7cu5ONgBosUZx3tFXDIOzdo1cZFIP5906buw+P5jD/o=; b=W1
 mSMUnB9oWw+I+RjaSYqn05GxSO8anep4e7F2g8unMZYQ+e1cG666B20akeC6zKS8
 OyVYB70eGbOMzp+XafU9DbUgpS2LaPvcn5bRZSTEXtElIl1v3egTwQxtFGUAWE9D
 34pT5SFXtunI2h3o5swDCZGfZJ3t0S5NPXAQWEA6yVzVIOIGIAG5qosg0/PR4QIZ
 AX7Iux3Wq8ay8+0s3Fv+Zd+QXfNi5xPhSUkOqqANGkZBlLdm8x0qp97M65dyfpQp
 6d0pNm2EJEvDbxc/p4w5Pm1NVU1kLITad+Npk0Iq9D5YhV0svXE82zMESVRmgxoW
 dBzVh/oSU1hq45JOsVHA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y6628h2nx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 May 2024 17:40:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 96E3D4002D;
 Fri, 17 May 2024 17:40:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0A65A221970;
 Fri, 17 May 2024 17:39:33 +0200 (CEST)
Received: from [10.48.87.204] (10.48.87.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 17:39:32 +0200
Message-ID: <07d54026-5d2a-49a3-9211-bfc6e62afec3@foss.st.com>
Date: Fri, 17 May 2024 17:39:25 +0200
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
 <eb3a2581-efc6-40c3-a7ea-551865017d40@foss.st.com>
 <c28e39e3-64d8-4ed7-a2e5-48ee124ef8e3@denx.de>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <c28e39e3-64d8-4ed7-a2e5-48ee124ef8e3@denx.de>
X-Originating-IP: [10.48.87.204]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_07,2024-05-17_03,2023-05-22_02
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

CgpPbiA1LzE2LzI0IDIyOjAxLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA1LzE2LzI0IDQ6MzUg
UE0sIEdhdGllbiBDSEVWQUxMSUVSIHdyb3RlOgo+IAo+IEhpLAo+IAo+Pj4+Pj4+PiBXaGF0IGlm
IHlvdSBhZGQgYSB0cmFjZSBpbiBhIHJhbmRvbSBnZW5lcmF0aW9uIGZ1bmN0aW9uIGluIAo+Pj4+
Pj4+PiByYW5kb20uYz8KPj4+Pj4+Pgo+Pj4+Pj4+IERvIHlvdSBoYXZlIGEgZnVuY3Rpb24gbmFt
ZSBvciBsaW5lIG51bWJlciBmb3IgbWUgPwo+Pj4+Pj4KPj4+Pj4+IEkgcHV0IGEgdHJhY2UgaW4g
X2dldF9yYW5kb21fYnl0ZXMoKSBpbiBkcml2ZXJzL2NoYXIvcmFuZG9tLmMuIEknbSAKPj4+Pj4+
IG5vdAo+Pj4+Pj4gMTAwJSBzdXJlIGJ1dCB0aGlzIHNob3VsZCBiZSB0aGUgZW50cnkgcG9pbnQg
d2hlbiBnZXR0aW5nIGEgcmFuZG9tIAo+Pj4+Pj4gbnVtYmVyLgo+Pj4+Pgo+Pj4+PiBZb3UncmUg
cmlnaHQsIHRoZXJlIGlzIGEgcmVhZCBhdHRlbXB0IHJpZ2h0IGJlZm9yZSB0aGUgaGFuZywgYW5k
IAo+Pj4+PiBfX2Nsa19pc19lbmFibGVkKCkgcmV0dXJucyAwIGluIHN0bTMyX3JlYWRfcm5nKCkg
LiBJbiBmYWN0LCBpdCBpcyAKPj4+Pj4gdGhlIHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSB3aGljaCBp
cyByZXR1cm5pbmcgLUVBQ0NFUyBpbnN0ZWFkIG9mIAo+Pj4+PiB6ZXJvLCBhbmQgdGhpcyBpcyBj
dXJyZW50bHkgbm90IGNoZWNrZWQgc28gdGhlIGZhaWx1cmUgaXMgbm90IAo+Pj4+PiBkZXRlY3Rl
ZCBiZWZvcmUgcmVnaXN0ZXIgYWNjZXNzIHRha2VzIHBsYWNlLCB0byByZWdpc3RlciBmaWxlIHdp
dGggCj4+Pj4+IGNsb2NrIGRpc2FibGVkLCB3aGljaCB0cmlnZ2VycyBhIGhhcmQgaGFuZy4KPj4+
Pj4KPj4+Pj4gSSdsbCBiZSBzZW5kaW5nIGEgcGF0Y2ggc2hvcnRseSwgdGhhbmtzIGZvciB0aGlz
IGhpbnQgIQo+Pj4+Pgo+Pj4+Cj4+Pj4gR3JlYXQgbmV3cywgaW5kZWVkIHRoZSByZXR1cm4gY29k
ZSBpc24ndCBjaGVja2VkLiBMZXQncyB1c2UKPj4+PiBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0
KCkuCj4+Pgo+Pj4gWWVzIHBsZWFzZS4KPj4+Cj4+PiBJIHdpbGwgd29uZGVyIHdoeSB3ZSBnZXQg
RUFDQ0VTIHRob3VnaCwgdGhhdCBiYXNpY2FsbHkgbWVhbnMgd2UgYXJlIAo+Pj4gc3VzcGVuZGlu
ZyBhbHJlYWR5LiBJcyBpdCBzYWZlIHRvIHJldHVybiAtZXJybm8gZnJvbSBybmcgcmVhZCAKPj4+
IGZ1bmN0aW9uIGluIHRoYXQgY2FzZSA/Cj4+Cj4+IFRoZSBmcmFtZXdvcmsgZXhwZWN0cyBhIGZ1
bmN0aW9uIHRoYXQgY2FuIHJldHVybiBhbiBlcnJvciBjb2RlIHNvIEkKPj4gZG9uJ3Qgc2VlIHdo
eSBub3QuIEVsc2UgdGhlIGZyYW1ld29yayB3b3VsZCBoYXZlIGFuIGlzc3VlLgo+Pgo+PiBJIHN0
aWxsIGhhdmVuJ3QgZmlndXJlZCBvdXQgd2hhdCBpcyBoYXBwZW5pbmcuCj4+Cj4+IENvdWxkIGl0
IGJlIHRoYXQgdGhlIGtlcm5lbCBpcyBnZXR0aW5nIGVudHJvcHkgd2l0aCBod3JuZ19maWxsZm4o
KQo+PiBsaWtlIGl0IGRvZXMgcGVyaW9kaWNhbGx5IHRvIGZlZWQgdGhlIGVudHJvcHkgcG9vbCBh
bmQgaXQgaGFwcGVucyBhdCB0aGUKPj4gc2FtZSB0aW1lIGFzIHlvdXIgcG0gdGVzdCBzZXF1ZW5j
ZT8KPiAKPiBQb3NzaWJseS4gSSB1c2Ugc2NyaXB0IGFzIGluaXQgd2hpY2ggY29udGFpbnMgYmFz
aWNhbGx5ICMhL2Jpbi9zaCAsIAo+IG1vdW50IG9mIGEgZmV3IGZpbGVzeXN0ZW1zIGxpa2UgZGV2
LCBwcm9jLCBzeXMsIGFuZCB0aGVuIHRoZSBwbV90ZXN0IAo+IHNlcXVlbmNlIHRvIGF2b2lkIHdh
c3RpbmcgdGltZSBib290aW5nIGZ1bGwgdXNlcnNwYWNlLgo+IApPaywKClRoZSBzdHJhbmdlc3Qg
dGhpbmcgaXMgbm90IGJlaW5nIHRvIGVuYWJsZSB0aGUgY2xvY2ssIG1heWJlIHRoZXJlJ3MKc29t
ZXRoaW5nIG9uIHRoZSBjbG9jayBkcml2ZXIgc2lkZS4gVHJhY2tpbmcgY2xvY2sgZW5hYmxlL2Rp
c2FibGUKbWF5IGxlYWQgdG8gc29tZXRoaW5nLgoKPj4gRllJLCBJIGhhdmUgYmVlbiBydW5uaW5n
IHlvdXIgc2NyaXB0IHdpdGggKGVjaG8gZGV2aWNlcyA+IAo+PiAvc3lzL3Bvd2VyL3BtX3Rlc3Qp
IGZvciA1IGhvdXJzIG5vdyBhbmQgaGF2ZW4ndCBiZWVuIGFibGUgdG8gcmVwcm9kdWNlIAo+PiB0
aGUgaXNzdWUuCj4gCj4gTWF5YmUgdGhlICdkZXZpY2VzJyB0ZXN0IGlzIG5vdCBlbm91Z2ggYW5k
IHRoZSBkZWVwZXIgcG1fdGVzdCBzdGF0ZXMgCj4gaGF2ZSBzb21lIHNvcnQgb2YgaW1wYWN0ID8K
PgoKTWF5YmUsIEkgZG9uJ3QgaGF2ZSB0aGUga25vd2xlZGdlIHRvIGNvbmZpcm0gb3IgaW52YWxp
ZGF0ZSB0aGlzLgpUYXNrcyBzaG91bGQgYmUgZnJvemVuIGJlZm9yZSBkcml2ZXJzIGFyZSBwdXQg
dG8gc2xlZXAgc28gbXkgaW5zdGluY3QKd291bGQgc2F5IG5vIGJ1dCB5b3UgY2FuJ3QgdGFrZSBp
dCBmb3IgZ3JhbnRlZCA6KQoKPj4+Pj4+Pj4gQWZ0ZXIgdGhpcywgSSdsbCB0cnkgdG8gcmVwcm9k
dWNlIHRoZSBpc3N1ZS4KPj4+Pj4+Pgo+Pj4+Pj4+IElmIHlvdSBoYXZlIGEgbWludXRlIHRvIHRl
c3QgaXQgb24gc29tZSBTVCBNUDE1IGJvYXJkLCB0aGF0IHdvdWxkIAo+Pj4+Pj4+IGJlIHJlYWwg
bmljZS4gVGhhbmtzICEKPj4+Pj4+Cj4+Pj4+PiBJIHRyaWVkIHRvIHJlcHJvZHVjZSB0aGUgaXNz
dWUgeW91J3JlIGZhY2luZyBvbiBhIFNUTTMyTVAxNTdDLURLMiBubwo+Pj4+Pj4gU0NNSSBvbiB0
aGUgNi45LXJjNyBrZXJuZWwgdGFnLiBJIHVzZXMgT1AtVEVFIGFuZCBURi1BIGluIHRoZSAKPj4+
Pj4+IGJvb3RjaGFpbgo+Pj4+Pj4gYnV0IHRoaXMgc2hvdWxkIG5vdCBoYXZlIGFuIGltcGFjdCBo
ZXJlLgo+Pj4+Pj4KPj4+Pj4+IEhvdyBkaWQgeW91IG1hbmFnZSB0byB0ZXN0IHVzaW5nICJlY2hv
IGNvcmUgPiAvc3lzL3Bvd2VyL3BtX3Rlc3QiPwo+Pj4+Pj4gSW4ga2VybmVsL3Bvd2VyL3N1c3Bl
bmQuYywgZW50ZXJfc3RhdGUoKS4gSWYgdGhlIHBtX3Rlc3RfbGV2ZWwgaXMgCj4+Pj4+PiBjb3Jl
LAo+Pj4+Pj4gdGhlbiBhbiBlcnJvciBpcyBmaXJlZCB3aXRoIHRoZSBmb2xsb3dpbmcgdHJhY2U6
Cj4+Pj4+PiAiVW5zdXBwb3J0ZWQgdGVzdCBtb2RlIGZvciBzdXNwZW5kIHRvIGlkbGUsIHBsZWFz
ZSBjaG9vc2UgCj4+Pj4+PiBub25lL2ZyZWV6ZXIvZGV2aWNlcy9wbGF0Zm9ybS4iCj4+Pj4+Cj4+
Pj4+IENvdWxkIHRoaXMgYmUgZmlybXdhcmUgcmVsYXRlZCA/Cj4+Pj4+Cj4+Pj4+PiBJJ3ZlIHRy
aWVkIHVzaW5nICJlY2hvIGRldmljZXMgPiAvc3lzL3Bvd2VyL3BtX3Rlc3QiIHNvIHRoYXQgSSBj
YW4gCj4+Pj4+PiBhdCBsZWFzdCB0ZXN0IHRoYXQgdGhlIGRyaXZlciBpcyBwdXQgdG8gc2xlZXAg
dGhlbiB3YWtlcyB1cC4gSSBkbyBub3QKPj4+Pj4+IHJlcHJvZHVjZSB5b3VyIGlzc3VlLgo+Pj4+
Pgo+Pj4+PiBDYW4geW91IHRyeSAncHJvY2Vzc29ycycgPwo+Pj4+Pgo+Pj4+Cj4+Pj4gR2l2ZW4g
dGhpczoKPj4+PiAjaWZkZWYgQ09ORklHX1BNX0RFQlVHCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBp
ZiAocG1fdGVzdF9sZXZlbCAhPSBURVNUX05PTkUgJiYgcG1fdGVzdF9sZXZlbCA8PSAKPj4+PiBU
RVNUX0NQVVMpIHsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJfd2FybigiVW5zdXBw
b3J0ZWQgdGVzdCBtb2RlIGZvciBzdXNwZW5kIHRvIGlkbGUKPj4+Cj4+PiBZb3UncmUgc3VwcG9z
ZWQgdG8gYmUgc3VzcGVuZGluZyB0byAnbWVtJyAsIG5vdCAnaWRsZScgLiBDb3VsZCB0aGF0IAo+
Pj4gYmUgaXQgPwo+Pgo+PiBZZXMgeW91J3JlIHJpZ2h0LCBJJ3ZlIGJlZW4gbWlzc2luZyB0aGF0
LiBJIGRvIG5vdCBoYXZlICJkZWVwIiBhdmFpbGFibGUKPj4gaW4gL3N5cy9wb3dlci9tZW1fc2xl
ZXAuLi4gbm90IHVwc3RyZWFtZWQgeWV0IG1heWJlLi4uIEhhdmUgeW91IGNvZGVkIGEKPj4gUFND
SSBzZXJ2aWNlIGZvciB0aGlzIGluIFUtQm9vdD8KPj4KPj4gSSdtIGVpdGhlciBtaXNzaW5nIHNv
bWV0aGluZyBvciBJIGNhbid0IHJlcHJvZHVjZSB5b3VyIHNldHVwLgo+IAo+IFRoZSBQU0NJIHBy
b3ZpZGVyIGluIFUtQm9vdCBoYXMgYmVlbiBpbiBwbGFjZSBmb3IgeWVhcnMsIHRoZXJlJ3Mgbm8g
bmVlZCAKPiB0byBjb2RlIGFueXRoaW5nLCBqdXN0IGNvbXBpbGUgaXQgYW5kIHRoYXQncyBhbGw6
Cj4gCj4gJCBtYWtlIHN0bTMybXAxNV9iYXNpY19kZWZjb25maWcgJiYgbWFrZSAtamBucHJvY2AK
PiAKPiBUaGlzIGdldHMgeW91IHUtYm9vdC1zcGwuc3RtMzIgYW5kIHUtYm9vdC5pdGIgYXMgRlNC
TC9TU0JMIC4KCk9rIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKR2F0aWVuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
