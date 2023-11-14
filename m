Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4587EB12A
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Nov 2023 14:47:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 473F9C6B479;
	Tue, 14 Nov 2023 13:47:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 980E0C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Nov 2023 13:47:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AEBdFkk018228; Tue, 14 Nov 2023 14:47:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=GPfXh45l5xjoW/qmzZsmUNCc8lVGCMSh/mwfCaeACY4=; b=NP
 +GI5c3axXAl/0GyQ6++oiy7d6p0IfmsPFANf+zhG8pl+jmFHxGG9UIfa76fRa58f
 PhIbwLz81axJ6mv7mboDBVYp2Pmw64wIrBT9LagleoYTSRnaTkCBeBD1Ddb9sLsH
 5zKXaZz3OmIVuqVBFZp5d4AK7NPl4BqqryIJiescB0SeuUkRQt86qhqk+BljJcXh
 229roZr4wzkJuNGimJ4NsrPz5j8ZdbyNte9IATy8jwxbfI1imIH3siR/k4UA4P7D
 1j84psH/y9Ob10du3gKY2jrREfoxfuSNUVZjC+NHdVOJCiBgkTaceDafLPmF14Vd
 4cJyPGprIYsjGq2t6PIg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ua1ch41yu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Nov 2023 14:47:08 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9E006100057;
 Tue, 14 Nov 2023 14:47:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 941F02132FB;
 Tue, 14 Nov 2023 14:47:07 +0100 (CET)
Received: from [10.201.20.59] (10.201.20.59) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 14 Nov
 2023 14:47:05 +0100
Message-ID: <95ec2b8d-8805-4ef9-9573-d796755f24d1@foss.st.com>
Date: Tue, 14 Nov 2023 14:47:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20231023174616.2282067-13-u.kleine-koenig@pengutronix.de>
 <20231023174616.2282067-21-u.kleine-koenig@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20231023174616.2282067-21-u.kleine-koenig@pengutronix.de>
X-Originating-IP: [10.201.20.59]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_13,2023-11-09_01,2023-05-22_02
Cc: linux-pwm@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel@pengutronix.de, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 08/11] pwm: stm32-lp: Use
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
Cj4gIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jIHwgMTAgKysrKystLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKSGkgVXdlLAoKUmV2aWV3
ZWQtYnk6IEZhYnJpY2UgR2FzbmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPgoKVGhh
bmtzIGZvciB0aGUgY2xlYW51cHMuCkZhYnJpY2UKCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cHdtL3B3bS1zdG0zMi1scC5jIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMKPiBpbmRleCBi
Njc5NzRjYzE4NzIuLjQzOTA2OGYzZWNhMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3B3bS9wd20t
c3RtMzItbHAuYwo+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jCj4gQEAgLTIxOCw3
ICsyMTgsNyBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9scF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQgX19tYXli
ZV91bnVzZWQgc3RtMzJfcHdtX2xwX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICtzdGF0
aWMgaW50IHN0bTMyX3B3bV9scF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgewo+ICAJ
c3RydWN0IHN0bTMyX3B3bV9scCAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ICAJc3Ry
dWN0IHB3bV9zdGF0ZSBzdGF0ZTsKPiBAQCAtMjMzLDEzICsyMzMsMTMgQEAgc3RhdGljIGludCBf
X21heWJlX3VudXNlZCBzdG0zMl9wd21fbHBfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4g
IAlyZXR1cm4gcGluY3RybF9wbV9zZWxlY3Rfc2xlZXBfc3RhdGUoZGV2KTsKPiAgfQo+ICAKPiAt
c3RhdGljIGludCBfX21heWJlX3VudXNlZCBzdG0zMl9wd21fbHBfcmVzdW1lKHN0cnVjdCBkZXZp
Y2UgKmRldikKPiArc3RhdGljIGludCBzdG0zMl9wd21fbHBfcmVzdW1lKHN0cnVjdCBkZXZpY2Ug
KmRldikKPiAgewo+ICAJcmV0dXJuIHBpbmN0cmxfcG1fc2VsZWN0X2RlZmF1bHRfc3RhdGUoZGV2
KTsKPiAgfQo+ICAKPiAtc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKHN0bTMyX3B3bV9scF9wbV9v
cHMsIHN0bTMyX3B3bV9scF9zdXNwZW5kLAo+IC0JCQkgc3RtMzJfcHdtX2xwX3Jlc3VtZSk7Cj4g
K3N0YXRpYyBERUZJTkVfU0lNUExFX0RFVl9QTV9PUFMoc3RtMzJfcHdtX2xwX3BtX29wcywgc3Rt
MzJfcHdtX2xwX3N1c3BlbmQsCj4gKwkJCQlzdG0zMl9wd21fbHBfcmVzdW1lKTsKPiAgCj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN0bTMyX3B3bV9scF9vZl9tYXRjaFtdID0g
ewo+ICAJeyAuY29tcGF0aWJsZSA9ICJzdCxzdG0zMi1wd20tbHAiLCB9LAo+IEBAIC0yNTIsNyAr
MjUyLDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtMzJfcHdtX2xwX2RyaXZl
ciA9IHsKPiAgCS5kcml2ZXIJPSB7Cj4gIAkJLm5hbWUgPSAic3RtMzItcHdtLWxwIiwKPiAgCQku
b2ZfbWF0Y2hfdGFibGUgPSBzdG0zMl9wd21fbHBfb2ZfbWF0Y2gsCj4gLQkJLnBtID0gJnN0bTMy
X3B3bV9scF9wbV9vcHMsCj4gKwkJLnBtID0gcG1fcHRyKCZzdG0zMl9wd21fbHBfcG1fb3BzKSwK
PiAgCX0sCj4gIH07Cj4gIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoc3RtMzJfcHdtX2xwX2RyaXZl
cik7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
