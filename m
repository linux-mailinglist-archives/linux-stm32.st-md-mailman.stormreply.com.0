Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 757DE97693C
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Sep 2024 14:36:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 285CDC6DD9A;
	Thu, 12 Sep 2024 12:36:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECD97C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Sep 2024 12:36:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C9XnPZ002414;
 Thu, 12 Sep 2024 14:36:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ycOodbDvrhisx/5OptdgsTR2uHOjLnY6oXa5ZUn9Ewk=; b=Nlf+ARJfan7qvNcb
 wKVmVHjIjlPE/OfQkt/x0tPUVrVc01CZD/nD1x/z0K88NJB9IYu2B8bexiQhqytm
 apcdr+HAidJPid4giMBZlfsI++fIwgMAuho4nBq+6zEgLbzDOtisqTKe7eQcxELO
 SZl4MGZ63X/LuKq4Jd4BeftUCAhgXiJfND07sGHUGTPRm/50dozk48ZQuTs0Pb69
 ed0ZLdHeQVTosEIK7b3Ua9bPY6Zq6MoGRAU3IOEsuf3KFKhttMFzexx+GcbBjNoL
 Ea54M6iiPL/gZok/R137I9XT7v5pSw2DPq/zrMOqbizMXUyAfLSSnyA7VoO2wDpO
 8Vyydg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41gyaakyu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2024 14:36:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AC36D4004C;
 Thu, 12 Sep 2024 14:34:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0198B269E16;
 Thu, 12 Sep 2024 14:32:43 +0200 (CEST)
Received: from [10.48.86.208] (10.48.86.208) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Sep
 2024 14:32:42 +0200
Message-ID: <7869d6b4-6b6e-4fb6-95d9-bbe497caeceb@foss.st.com>
Date: Thu, 12 Sep 2024 14:32:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Fritz Koenig <frkoenig@chromium.org>, Sebastian
 Fricke <sebastian.fricke@collabora.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,
 <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20240911135011.161217-1-hugues.fruchet@foss.st.com>
 <20240911135011.161217-2-hugues.fruchet@foss.st.com>
 <01020191e212f333-703af7d0-fc68-4f47-b55c-6c0c3de6708a-000000@eu-west-1.amazonses.com>
Content-Language: en-US
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <01020191e212f333-703af7d0-fc68-4f47-b55c-6c0c3de6708a-000000@eu-west-1.amazonses.com>
X-Originating-IP: [10.48.86.208]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Subject: Re: [Linux-stm32] [PATCH 1/2] media: uapi: add WebP VP8 frame flag
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

SGkgTmljb2xhcywKClRoYW5rcyBmb3IgcmV2aWV3aW5nLgoKT24gOS8xMS8yNCAxOToxMiwgTmlj
b2xhcyBEdWZyZXNuZSB3cm90ZToKPiBIaSBIdWd1ZXMsCj4gCj4gTGUgbWVyY3JlZGkgMTEgc2Vw
dGVtYnJlIDIwMjQgw6AgMTU6NTAgKzAyMDAsIEh1Z3VlcyBGcnVjaGV0IGEgw6ljcml0wqA6Cj4+
IEFkZCBhIGZsYWcgaW5kaWNhdGluZyB0aGF0IFZQOCBiaXRzdHJlYW0gaXMgYSBXZWJQIHBpY3R1
cmUuCj4gCj4gU291bmRzIGxpa2UgdGhlcmUgc2hvdWxkIGJlIHNvbWUgY29kZSBjaGFuZ2VzIGlu
IEdTdHJlYW1lciB0aGF0IHlvdSBoYXZlbid0Cj4gZGlzY2xvc2VkLiBNaW5kIHNoYXJpbmcgaG93
IHRoaXMgbmV3IHVBUEkgaXMgdXNlZCA/IEkgd291bGQgYWxzbyBleHBlY3QgdGhpcwo+IGNvbW1p
dCBtZXNzYWdlIHRvIGdpdmUgbW9yZSBpbnNpZ2h0IG9uIHdoYXQgaXMgc3BlY2lhbCBhYm91dCBX
ZWJQIHRoYXQgbWFrZXMKPiB0aGlzIGZsYWcgcmVxdWlyZWQuCgoKR1N0cmVhbWVyIGNoYW5nZXMg
aGVyZToKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2dzdHJlYW1lci9nc3RyZWFtZXIv
LS9jb21taXQvMTM4ZWNmYWM1NGNlODViMjczYTI2ZmY2ZjBmZWZlMzk5OGY4ZDQzNj9tZXJnZV9y
ZXF1ZXN0X2lpZD03NTA1CgpWZXJpc2lsaWNvbiBkYXRhc2hlZXQgaXMgbm90IGV4cGxpY2l0IG9u
IHdoeSBXZWJQIG11c3QgYmUgc2lnbmFsZWQgdG8gCmhhcmR3YXJlIGJ1dCBXZWJQIGRlY29kaW5n
IGZhaWxzIGlmIG5vdC4KU2VlbXMgdG8gbWUgdGhhdCBzdWNoIGEgc2ltcGxlIGFkZGl0aW9uIG9u
IGFuIGFscmVhZHkgZXhpc3RpbmcgZmxhZyBpcyAKc29tZXRoaW5nIGFjY2VwdGFibGUgYW5kIHBy
ZWZlcmFibGUgdG8gdGhlIGRldmVsb3BtZW50IG9mIGEgbmV3IGNvbXBsZXRlIAp1QVBJIGZvciBX
ZWJQIGRlY29kaW5nLgoKPiAKPiBJIHdvdWxkIGFsc28gbmVlZCBzb21lIG1vcmUgQVBJIG9yIGRv
Y3VtZW50YXRpb24gdGhhdCBleHBsYWluIGhvdyB3ZSBjYW4KPiBkaWZmZXJlbnRpYXRlIGEgdXBz
dHJlYW0gZGVjb2RlciB0aGF0IGlzIGNhcGFibGUgb2YgV2ViUCBkZWNvZGluZyBmcm9tIG9uZSB0
aGF0Cj4gZG9lcyBub3QuIEkgd29uZGVyIGlmIGl0IHdvdWxkIG5vdCBoYXZlIGJlZW4gYmV0dGVy
IHRvIGRlZmluZSBhIG5ldyBmb3JtYXQgPwo+IFRoYXQgYmVpbmcgc2FpZCwgSSBoYXZlbid0IGxv
b2tlZCBhdCBhbGwgaW4gdGhlIHNwZWNpZmljYXRpb24gYW5kIG9ubHkgcmVseSBvbgo+IHlvdXIg
Y292ZXIgbGV0dGVyIGFuZCBwYXRjaCBzZXJpZXMuCj4gCj4gTmljb2xhcwoKCj4gCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEh1Z3VlcyBGcnVjaGV0IDxodWd1ZXMuZnJ1Y2hldEBmb3NzLnN0LmNvbT4K
Pj4gLS0tCj4+ICAgLi4uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL2V4dC1jdHJscy1jb2RlYy1z
dGF0ZWxlc3MucnN0ICAgICAgfCAzICsrKwo+PiAgIGluY2x1ZGUvdWFwaS9saW51eC92NGwyLWNv
bnRyb2xzLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCj4+ICAgMiBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
dXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvZXh0LWN0cmxzLWNvZGVjLXN0YXRlbGVzcy5yc3QgYi9E
b2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL2V4dC1jdHJscy1jb2RlYy1zdGF0
ZWxlc3MucnN0Cj4+IGluZGV4IDBkYTYzNTY5MWZkYy4uYmIwOGFhY2RkYzljIDEwMDY0NAo+PiAt
LS0gYS9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL2V4dC1jdHJscy1jb2Rl
Yy1zdGF0ZWxlc3MucnN0Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRp
YS92NGwvZXh0LWN0cmxzLWNvZGVjLXN0YXRlbGVzcy5yc3QKPj4gQEAgLTEwNjIsNiArMTA2Miw5
IEBAIEZXSFQgRmxhZ3MKPj4gICAgICAgKiAtIGBgVjRMMl9WUDhfRlJBTUVfRkxBR19TSUdOX0JJ
QVNfQUxUYGAKPj4gICAgICAgICAtIDB4MjAKPj4gICAgICAgICAtIFNpZ24gb2YgbW90aW9uIHZl
Y3RvcnMgd2hlbiB0aGUgYWx0IGZyYW1lIGlzIHJlZmVyZW5jZWQuCj4+ICsgICAgKiAtIGBgVjRM
Ml9WUDhfRlJBTUVfRkxBR19XRUJQYGAKPj4gKyAgICAgIC0gMHg0MAo+PiArICAgICAgLSBJbmRp
Y2F0ZXMgdGhhdCB0aGlzIGZyYW1lIGlzIGEgV2ViUCBwaWN0dXJlLgo+PiAgIAo+PiAgIC4uIGM6
dHlwZTo6IHY0bDJfdnA4X2VudHJvcHlfY29kZXJfc3RhdGUKPj4gICAKPj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvdWFwaS9saW51eC92NGwyLWNvbnRyb2xzLmggYi9pbmNsdWRlL3VhcGkvbGludXgv
djRsMi1jb250cm9scy5oCj4+IGluZGV4IDk3NGZkMjU0ZTU3My4uZTQxYjYyZjJjYjJiIDEwMDY0
NAo+PiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdjRsMi1jb250cm9scy5oCj4+ICsrKyBiL2lu
Y2x1ZGUvdWFwaS9saW51eC92NGwyLWNvbnRyb2xzLmgKPj4gQEAgLTE4OTcsNiArMTg5Nyw3IEBA
IHN0cnVjdCB2NGwyX3ZwOF9lbnRyb3B5X2NvZGVyX3N0YXRlIHsKPj4gICAjZGVmaW5lIFY0TDJf
VlA4X0ZSQU1FX0ZMQUdfTUJfTk9fU0tJUF9DT0VGRgkweDA4Cj4+ICAgI2RlZmluZSBWNEwyX1ZQ
OF9GUkFNRV9GTEFHX1NJR05fQklBU19HT0xERU4JMHgxMAo+PiAgICNkZWZpbmUgVjRMMl9WUDhf
RlJBTUVfRkxBR19TSUdOX0JJQVNfQUxUCTB4MjAKPj4gKyNkZWZpbmUgVjRMMl9WUDhfRlJBTUVf
RkxBR19XRUJQCQkweDQwCj4+ICAgCj4+ICAgI2RlZmluZSBWNEwyX1ZQOF9GUkFNRV9JU19LRVlf
RlJBTUUoaGRyKSBcCj4+ICAgCSghISgoaGRyKS0+ZmxhZ3MgJiBWNEwyX1ZQOF9GUkFNRV9GTEFH
X0tFWV9GUkFNRSkpCj4gCgpCUiwKSHVndWVzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
