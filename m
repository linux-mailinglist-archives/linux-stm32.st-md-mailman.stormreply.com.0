Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DE78D6378
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2024 15:50:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C79DC6C820;
	Fri, 31 May 2024 13:50:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3762C030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2024 13:50:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44VDnIO2015872;
 Fri, 31 May 2024 15:49:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 rNaZhZrMyXcFydlXNaczEwmwbt5T3dPMpJwK9++wRKk=; b=A5+PpJ9tKnNiPlJA
 tdGtz0mvABWtKgJaAlXH4TTwhcF6UY95h7PFCwwdh9/MSJ/oz78IyHIRE/a5zQAp
 Yiqsoy9zXAWqdV1RL0ZmEV3Vq3vQwSlUHn00BhbUV3LXwXfBAji+gir3Lvz3PTjs
 RA4NiuD16dj8kZciIKYHpEzdFk9yCQ/QfY2vn95Pu+Ar3aE+cRIcGoxw1QbvSH0w
 C5a/XMs+Ulddj2fc23fv/iqM84jY1cSUtnMriv075s7U9+UFzqTD/u1vzny7WCmK
 DuxVoHX5Mn3Suw7GqkRlkfuiO+EhwvI7QXv2f41oDl6JA8WIYKLoJOkV2eBj+XvE
 hZHtAg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yba52c3us-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2024 15:49:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0E19140047;
 Fri, 31 May 2024 15:48:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A47F521BF55;
 Fri, 31 May 2024 15:47:37 +0200 (CEST)
Received: from [10.48.87.204] (10.48.87.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 15:47:36 +0200
Message-ID: <0ed57257-b1c5-42a0-b605-d1b924570677@foss.st.com>
Date: Fri, 31 May 2024 15:47:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-crypto@vger.kernel.org>
References: <20240531085749.42863-1-marex@denx.de>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20240531085749.42863-1-marex@denx.de>
X-Originating-IP: [10.48.87.204]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_10,2024-05-30_01,2024-05-17_01
Cc: Rob Herring <robh@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Yang Yingliang <yangyingliang@huawei.com>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Olivia Mackall <olivia@selenic.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] hwrng: stm32 - use sizeof(*priv) instead
 of sizeof(struct stm32_rng_private)
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

SGkgTWFyZWssCgpPbiA1LzMxLzI0IDEwOjU3LCBNYXJlayBWYXN1dCB3cm90ZToKPiBVc2Ugc2l6
ZW9mKCpwcml2KSBpbnN0ZWFkIG9mIHNpemVvZihzdHJ1Y3Qgc3RtMzJfcm5nX3ByaXZhdGUpLCB0
aGUKPiBmb3JtZXIgbWFrZXMgcmVuYW1pbmcgb2Ygc3RydWN0IHN0bTMyX3JuZ19wcml2YXRlIGVh
c2llciBpZiBuZWNlc3NhcnksCj4gYXMgaXQgcmVtb3ZlcyBvbmUgc2l0ZSB3aGVyZSBzdWNoIHJl
bmFtZSBoYXMgdG8gaGFwcGVuLiBObyBmdW5jdGlvbmFsCj4gY2hhbmdlLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+IC0tLQo+IENjOiAiVXdlIEtsZWlu
ZS1Lw7ZuaWciIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IEFsZXhhbmRy
ZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4gQ2M6IEdhdGllbiBDaGV2
YWxsaWVyIDxnYXRpZW4uY2hldmFsbGllckBmb3NzLnN0LmNvbT4KPiBDYzogSGVyYmVydCBYdSA8
aGVyYmVydEBnb25kb3IuYXBhbmEub3JnLmF1Pgo+IENjOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVu
eC5kZT4KPiBDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgo+
IENjOiBPbGl2aWEgTWFja2FsbCA8b2xpdmlhQHNlbGVuaWMuY29tPgo+IENjOiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgo+IENjOiBZYW5nIFlpbmdsaWFuZyA8eWFuZ3lpbmdsaWFuZ0Bo
dWF3ZWkuY29tPgo+IENjOiBrZXJuZWxAZGgtZWxlY3Ryb25pY3MuY29tCj4gQ2M6IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1jcnlwdG9Admdlci5rZXJu
ZWwub3JnCj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPiAt
LS0KPiAgIGRyaXZlcnMvY2hhci9od19yYW5kb20vc3RtMzItcm5nLmMgfCAyICstCj4gICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9zdG0zMi1ybmcuYyBiL2RyaXZlcnMvY2hhci9od19y
YW5kb20vc3RtMzItcm5nLmMKPiBpbmRleCBkMDhjODcwZWI4ZDFmLi45ZDA0MWE2N2MyOTVhIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvY2hhci9od19yYW5kb20vc3RtMzItcm5nLmMKPiArKysgYi9k
cml2ZXJzL2NoYXIvaHdfcmFuZG9tL3N0bTMyLXJuZy5jCj4gQEAgLTUxNyw3ICs1MTcsNyBAQCBz
dGF0aWMgaW50IHN0bTMyX3JuZ19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpvZmRldikK
PiAgIAlzdHJ1Y3Qgc3RtMzJfcm5nX3ByaXZhdGUgKnByaXY7Cj4gICAJc3RydWN0IHJlc291cmNl
ICpyZXM7Cj4gICAKPiAtCXByaXYgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2Yoc3RydWN0IHN0
bTMyX3JuZ19wcml2YXRlKSwgR0ZQX0tFUk5FTCk7Cj4gKwlwcml2ID0gZGV2bV9remFsbG9jKGRl
diwgc2l6ZW9mKCpwcml2KSwgR0ZQX0tFUk5FTCk7Cj4gICAJaWYgKCFwcml2KQo+ICAgCQlyZXR1
cm4gLUVOT01FTTsKPiAgIAoKQWNrZWQtYnk6IEdhdGllbiBDaGV2YWxsaWVyIDxnYXRpZW4uY2hl
dmFsbGllckBmb3NzLnN0LmNvbT4KClRoYW5rcywKR2F0aWVuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
