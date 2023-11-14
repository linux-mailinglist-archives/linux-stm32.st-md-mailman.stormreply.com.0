Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9311D7EB12C
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Nov 2023 14:47:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BC1BC6B479;
	Tue, 14 Nov 2023 13:47:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1661C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Nov 2023 13:47:36 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AEBSCt8010156; Tue, 14 Nov 2023 14:47:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=gPgWQLbGuX1xfMN6bhRJjTURxQgjWKKVTTzmR4O4jPk=; b=Wt
 zrPVyq4nBAgLoKTm8L3YI+acv5Uuo9ZlWkvipuul/Gxl/ecrDFPiHaljpZQ8Kz1u
 N86JYTmIXvmPpuRusjBieiB9aLs/j8vNr0tECAcQNSbIV3D8drOH0BM6wZ8lEZgX
 NkV4fPElagc4X9deTo67dtaxR09AeRqAUw71gQgx7IMsuIa3lDa8RNOZqvMB7lrA
 b1m8quHWcoy3msgNItrJSauo7X+JhkHSpa3M8YGma9ciKX6OwM7qFPtLMYj7RVzX
 dieM+/YVxpMFIGHuBfNieO7nQyjxDqKH3yEbP5Jh0AfwtcnMKWE4kga+HpYjE7YK
 S8Gsq+UFVAUiAxnFa/2Q==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ua1u1uxtq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Nov 2023 14:47:20 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4E7F4100065;
 Tue, 14 Nov 2023 14:47:20 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3A97F2138CA;
 Tue, 14 Nov 2023 14:47:20 +0100 (CET)
Received: from [10.201.20.59] (10.201.20.59) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 14 Nov
 2023 14:47:19 +0100
Message-ID: <c33b4dac-e29c-4568-964e-7b578ff64f17@foss.st.com>
Date: Tue, 14 Nov 2023 14:47:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20231023174616.2282067-13-u.kleine-koenig@pengutronix.de>
 <20231023174616.2282067-22-u.kleine-koenig@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20231023174616.2282067-22-u.kleine-koenig@pengutronix.de>
X-Originating-IP: [10.201.20.59]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_13,2023-11-09_01,2023-05-22_02
Cc: linux-pwm@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel@pengutronix.de, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 09/11] pwm: stm32: Use
 DEFINE_SIMPLE_DEV_PM_OPS for PM functions
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

T24gMTAvMjMvMjMgMTk6NDYsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IFRoaXMgbWFjcm8g
aGFzIHRoZSBhZHZhbnRhZ2Ugb3ZlciBTSU1QTEVfREVWX1BNX09QUyB0aGF0IHdlIGRvbid0IGhh
dmUgdG8KPiBjYXJlIGFib3V0IHdoZW4gdGhlIGZ1bmN0aW9ucyBhcmUgYWN0dWFsbHkgdXNlZCwg
c28gdGhlIGNvcnJlc3BvbmRpbmcKPiBfX21heWJlX3VudXNlZCBjYW4gYmUgZHJvcHBlZC4KPiAK
PiBBbHNvIG1ha2UgdXNlIG9mIHBtX3B0cigpIHRvIGRpc2NhcmQgYWxsIFBNIHJlbGF0ZWQgc3R1
ZmYgaWYgQ09ORklHX1BNCj4gaXNuJ3QgZW5hYmxlZC4KPiAKPiBSZXZpZXdlZC1ieTogSm9uYXRo
YW4gQ2FtZXJvbiA8Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gLS0t
Cj4gIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jIHwgOCArKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKSGkgVXdlLAoKUmV2aWV3ZWQtYnk6
IEZhYnJpY2UgR2FzbmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPgoKVGhhbmtzIGZv
ciB0aGUgY2xlYW51cHMuCkZhYnJpY2UKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdt
LXN0bTMyLmMgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwo+IGluZGV4IDMzMDNhNzU0ZWEwMi4u
OGJlMDM3NzU3YjhiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCj4gKysr
IGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKPiBAQCAtNjQ1LDcgKzY0NSw3IEBAIHN0YXRpYyBp
bnQgc3RtMzJfcHdtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlyZXR1
cm4gMDsKPiAgfQo+ICAKPiAtc3RhdGljIGludCBfX21heWJlX3VudXNlZCBzdG0zMl9wd21fc3Vz
cGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gK3N0YXRpYyBpbnQgc3RtMzJfcHdtX3N1c3BlbmQo
c3RydWN0IGRldmljZSAqZGV2KQo+ICB7Cj4gIAlzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2ID0gZGV2
X2dldF9kcnZkYXRhKGRldik7Cj4gIAl1bnNpZ25lZCBpbnQgaTsKPiBAQCAtNjY2LDcgKzY2Niw3
IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3RtMzJfcHdtX3N1c3BlbmQoc3RydWN0IGRl
dmljZSAqZGV2KQo+ICAJcmV0dXJuIHBpbmN0cmxfcG1fc2VsZWN0X3NsZWVwX3N0YXRlKGRldik7
Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3RtMzJfcHdtX3Jlc3VtZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCj4gK3N0YXRpYyBpbnQgc3RtMzJfcHdtX3Jlc3VtZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCj4gIHsKPiAgCXN0cnVjdCBzdG0zMl9wd20gKnByaXYgPSBkZXZfZ2V0X2Ry
dmRhdGEoZGV2KTsKPiAgCWludCByZXQ7Cj4gQEAgLTY3OSw3ICs2NzksNyBAQCBzdGF0aWMgaW50
IF9fbWF5YmVfdW51c2VkIHN0bTMyX3B3bV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+ICAJ
cmV0dXJuIHN0bTMyX3B3bV9hcHBseV9icmVha2lucHV0cyhwcml2KTsKPiAgfQo+ICAKPiAtc3Rh
dGljIFNJTVBMRV9ERVZfUE1fT1BTKHN0bTMyX3B3bV9wbV9vcHMsIHN0bTMyX3B3bV9zdXNwZW5k
LCBzdG0zMl9wd21fcmVzdW1lKTsKPiArc3RhdGljIERFRklORV9TSU1QTEVfREVWX1BNX09QUyhz
dG0zMl9wd21fcG1fb3BzLCBzdG0zMl9wd21fc3VzcGVuZCwgc3RtMzJfcHdtX3Jlc3VtZSk7Cj4g
IAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdG0zMl9wd21fb2ZfbWF0Y2hb
XSA9IHsKPiAgCXsgLmNvbXBhdGlibGUgPSAic3Qsc3RtMzItcHdtIiwJfSwKPiBAQCAtNjkyLDcg
KzY5Miw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bTMyX3B3bV9kcml2ZXIg
PSB7Cj4gIAkuZHJpdmVyCT0gewo+ICAJCS5uYW1lID0gInN0bTMyLXB3bSIsCj4gIAkJLm9mX21h
dGNoX3RhYmxlID0gc3RtMzJfcHdtX29mX21hdGNoLAo+IC0JCS5wbSA9ICZzdG0zMl9wd21fcG1f
b3BzLAo+ICsJCS5wbSA9IHBtX3B0cigmc3RtMzJfcHdtX3BtX29wcyksCj4gIAl9LAo+ICB9Owo+
ICBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHN0bTMyX3B3bV9kcml2ZXIpOwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
