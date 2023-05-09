Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 067A46FCC6B
	for <lists+linux-stm32@lfdr.de>; Tue,  9 May 2023 19:11:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6CDEC6904F;
	Tue,  9 May 2023 17:11:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABEB4C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 May 2023 17:11:40 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349CIsXA020568; Tue, 9 May 2023 19:11:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=mn5jOxLh1H2LGQF8BkirJjrvG/rHRFFa5N/haTu7SCk=;
 b=w1GEJOugTU6MG/OSxcxzMhyVxUpsKNitOvKtS0QqiQsycyC9Ssr3FD1HyAidp6nGnBjN
 wVLKmYLS7oTOYIbXqsMwwAfeT/OK2hOdQ4BWSG/cWxaaMQFi1RKT3fMY/DljnhqgZsDW
 UowzfJ7pVeTbHDwgnwOdplKXWHIV+fKqg4+xvlmzf7+cRFE6XI3F6Zs7tunHrtbLGhRq
 JGSntJi2FDLMhoTwFdo0kq5Q2lJkUQzIci70Qw8a87XjMrWjSqJiYrO8eZEBZtiIcK5d
 gSB0QkWgHLUtk4NoWnnOfnUsvLAr8EntsH/VNB68fkSZFw23FU3RFVScOGiUJxU/FT7d 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qf79heekw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 19:11:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0CA4010002A;
 Tue,  9 May 2023 19:11:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 04BC7231506;
 Tue,  9 May 2023 19:11:19 +0200 (CEST)
Received: from [10.252.28.195] (10.252.28.195) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 9 May
 2023 19:11:17 +0200
Message-ID: <e14f7bc4-6705-6be6-3393-69ea962ab6ac@foss.st.com>
Date: Tue, 9 May 2023 19:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, Bjorn
 Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
 <20230504194453.1150368-18-u.kleine-koenig@pengutronix.de>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20230504194453.1150368-18-u.kleine-koenig@pengutronix.de>
X-Originating-IP: [10.252.28.195]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_10,2023-05-05_01,2023-02-09_01
Cc: kernel@pengutronix.de, linux-remoteproc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 17/18] remoteproc: stm32: Convert to
 platform remove callback returning void
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

SGkgVXdlLAoKT24gNS80LzIzIDIxOjQ0LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBUaGUg
LnJlbW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3
aGljaCBtYWtlcwo+IG1hbnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3Nz
aWJsZSB0byBkbyBlcnJvciBoYW5kbGluZyBieQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCj4gYW5kIHRoaXMg
dHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3MuIFRvIGltcHJvdmUgaGVyZSB0aGVy
ZSBpcyBhCj4gcXVlc3QgdG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJ
biB0aGUgZmlyc3Qgc3RlcCBvZiB0aGlzCj4gcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRl
ZCB0byAucmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwo+IHZvaWQuCj4gCj4gVHJp
dmlhbGx5IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4g
dGhlIHJlbW92ZQo+IGNhbGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50LgoKUmV2
aWV3ZWQtYnk6IEFybmF1ZCBQb3VsaXF1ZW4gPGFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20+
CgpUaGFua3MsCkFybmF1ZAoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8
dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+ICBkcml2ZXJzL3JlbW90ZXBy
b2Mvc3RtMzJfcnByb2MuYyB8IDYgKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVtb3RlcHJv
Yy9zdG0zMl9ycHJvYy5jIGIvZHJpdmVycy9yZW1vdGVwcm9jL3N0bTMyX3Jwcm9jLmMKPiBpbmRl
eCA4NzQ2Y2JiMWYxNjguLjE5NzE2ZWM4MmFhZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3JlbW90
ZXByb2Mvc3RtMzJfcnByb2MuYwo+ICsrKyBiL2RyaXZlcnMvcmVtb3RlcHJvYy9zdG0zMl9ycHJv
Yy5jCj4gQEAgLTg2Nyw3ICs4NjcsNyBAQCBzdGF0aWMgaW50IHN0bTMyX3Jwcm9jX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+IC1z
dGF0aWMgaW50IHN0bTMyX3Jwcm9jX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+ICtzdGF0aWMgdm9pZCBzdG0zMl9ycHJvY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPiAgewo+ICAJc3RydWN0IHJwcm9jICpycHJvYyA9IHBsYXRmb3JtX2dldF9kcnZk
YXRhKHBkZXYpOwo+ICAJc3RydWN0IHN0bTMyX3Jwcm9jICpkZGF0YSA9IHJwcm9jLT5wcml2Owo+
IEBAIC04ODUsOCArODg1LDYgQEAgc3RhdGljIGludCBzdG0zMl9ycHJvY19yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQlkZXZpY2VfaW5pdF93YWtldXAoZGV2LCBmYWxz
ZSk7Cj4gIAl9Cj4gIAlycHJvY19mcmVlKHJwcm9jKTsKPiAtCj4gLQlyZXR1cm4gMDsKPiAgfQo+
ICAKPiAgc3RhdGljIGludCBfX21heWJlX3VudXNlZCBzdG0zMl9ycHJvY19zdXNwZW5kKHN0cnVj
dCBkZXZpY2UgKmRldikKPiBAQCAtOTE2LDcgKzkxNCw3IEBAIHN0YXRpYyBTSU1QTEVfREVWX1BN
X09QUyhzdG0zMl9ycHJvY19wbV9vcHMsCj4gIAo+ICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2Ry
aXZlciBzdG0zMl9ycHJvY19kcml2ZXIgPSB7Cj4gIAkucHJvYmUgPSBzdG0zMl9ycHJvY19wcm9i
ZSwKPiAtCS5yZW1vdmUgPSBzdG0zMl9ycHJvY19yZW1vdmUsCj4gKwkucmVtb3ZlX25ldyA9IHN0
bTMyX3Jwcm9jX3JlbW92ZSwKPiAgCS5kcml2ZXIgPSB7Cj4gIAkJLm5hbWUgPSAic3RtMzItcnBy
b2MiLAo+ICAJCS5wbSA9ICZzdG0zMl9ycHJvY19wbV9vcHMsCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
