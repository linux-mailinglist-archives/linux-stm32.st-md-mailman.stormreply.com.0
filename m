Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A47281D906
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Dec 2023 13:00:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 101F1C6C83D;
	Sun, 24 Dec 2023 12:00:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6628C6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Dec 2023 12:00:27 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BO4cBcU030250; Sun, 24 Dec 2023 13:00:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:content-transfer-encoding:mime-version; s=
 selector1; bh=ChpdCsWyAay6RJb9rD1FHOJqQQuXIx6a0mUEUWYCSc4=; b=3n
 1vTJijvATirIJj/YvlTEu8pERihJ9tKDj70qI5dZQbBE3475jlurmUYE2PWVUQFU
 onBfe3+pZTmhNQMHXjXl0O0C7rH0F9zWSOQxbxo9AMsv3Zi4nGb/FpHe68Y4816U
 VIQFD3RJIU8snQdbmLH/pKu3k123i4x5a7r/xs6z0ZiIMmQ04GnvGpUFGMnDCGD+
 c0B6UMly0/WOFNQhP0BoOuBRjadY49rcONaP9TWl47o28gNL4OXz03+yCpUZeqZv
 95OBgk3oYlvOf3LXC8D4QkDgL5972QLFuJb0QNp2f9rAfSt8J7GsqKNfqesuYs7N
 11N8+6dZBb3PLYi/TccA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3v5nukk3pb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 24 Dec 2023 13:00:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1BB0A10005C;
 Sun, 24 Dec 2023 13:00:01 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10D042138EC;
 Sun, 24 Dec 2023 13:00:01 +0100 (CET)
Received: from [192.168.8.15] (10.252.24.226) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 24 Dec
 2023 13:00:00 +0100
Message-ID: <0e586f3d05a03bd5d9a8bfead55162e14a6aa4de.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>
Date: Sun, 24 Dec 2023 12:59:58 +0100
In-Reply-To: <ac551b89025bafadce05102b94596f8cd3564a32.1703284359.git.u.kleine-koenig@pengutronix.de>
References: <cover.1703284359.git.u.kleine-koenig@pengutronix.de>
 <ac551b89025bafadce05102b94596f8cd3564a32.1703284359.git.u.kleine-koenig@pengutronix.de>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.252.24.226]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-24_06,2023-12-22_01,2023-05-22_02
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 12/13] irqchip/stm32-exti: Convert to
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

T24gRnJpLCAyMDIzLTEyLTIyIGF0IDIzOjUwICswMTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToKPiBUaGUgLnJlbW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5z
IGFuIGludCB3aGljaCBtYWtlcwo+IG1hbnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUg
aXQncyBwb3NzaWJsZSB0byBkbyBlcnJvciBoYW5kbGluZyBieQo+IHJldHVybmluZyBhbiBlcnJv
ciBjb2RlLiBIb3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydAo+IGZy
b20gZW1pdHRpbmcgYSB3YXJuaW5nKSBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNv
dXJjZSBsZWFrcy4KPiAKPiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtl
IHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuCj4gdm9pZC4gSW4gdGhlIGZpcnN0IHN0ZXAgb2Yg
dGhpcyBxdWVzdCBhbGwgZHJpdmVycyBhcmUgY29udmVydGVkIHRvCj4gLnJlbW92ZV9uZXcoKSwg
d2hpY2ggYWxyZWFkeSByZXR1cm5zIHZvaWQuIEV2ZW50dWFsbHkgYWZ0ZXIgYWxsIGRyaXZlcnMK
PiBhcmUgY29udmVydGVkLCAucmVtb3ZlX25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3Zl
KCkuCj4gCj4gVHJpdmlhbGx5IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJu
aW5nIHplcm8gaW4gdGhlIHJlbW92ZQo+IGNhbGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2
YXJpYW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1r
b2VuaWdAcGVuZ3V0cm9uaXguZGU+CgpSZXZpZXdlZC1ieTogQW50b25pbyBCb3JuZW8gPGFudG9u
aW8uYm9ybmVvQGZvc3Muc3QuY29tPgoKUmVnYXJkcywKQW50b25pbwoKPiAtLS0KPiDCoGRyaXZl
cnMvaXJxY2hpcC9pcnEtc3RtMzItZXh0aS5jIHwgNSArKy0tLQo+IMKgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pcnFjaGlwL2lycS1zdG0zMi1leHRpLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXN0bTMyLWV4
dGkuYwo+IGluZGV4IDk3MTI0MGUyZTMxYi4uYzYxYTk3Y2FhZmM5IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtc3RtMzItZXh0aS5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2ly
cS1zdG0zMi1leHRpLmMKPiBAQCAtODk4LDEwICs4OTgsOSBAQCBzdGF0aWMgdm9pZCBzdG0zMl9l
eHRpX3JlbW92ZV9pcnEodm9pZCAqZGF0YSkKPiDCoMKgwqDCoMKgwqDCoMKgaXJxX2RvbWFpbl9y
ZW1vdmUoZG9tYWluKTsKPiDCoH0KPiDCoAo+IC1zdGF0aWMgaW50IHN0bTMyX2V4dGlfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gK3N0YXRpYyB2b2lkIHN0bTMyX2V4dGlf
cmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gwqB7Cj4gwqDCoMKgwqDCoMKg
wqDCoHN0bTMyX2V4dGlfaF9zeXNjb3JlX2RlaW5pdCgpOwo+IC3CoMKgwqDCoMKgwqDCoHJldHVy
biAwOwo+IMKgfQo+IMKgCj4gwqBzdGF0aWMgaW50IHN0bTMyX2V4dGlfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiBAQCAtOTkxLDcgKzk5MCw3IEBAIE1PRFVMRV9ERVZJQ0Vf
VEFCTEUob2YsIHN0bTMyX2V4dGlfaWRzKTsKPiDCoAo+IMKgc3RhdGljIHN0cnVjdCBwbGF0Zm9y
bV9kcml2ZXIgc3RtMzJfZXh0aV9kcml2ZXIgPSB7Cj4gwqDCoMKgwqDCoMKgwqDCoC5wcm9iZcKg
wqDCoMKgwqDCoMKgwqDCoMKgPSBzdG0zMl9leHRpX3Byb2JlLAo+IC3CoMKgwqDCoMKgwqDCoC5y
ZW1vdmXCoMKgwqDCoMKgwqDCoMKgwqA9IHN0bTMyX2V4dGlfcmVtb3ZlLAo+ICvCoMKgwqDCoMKg
wqDCoC5yZW1vdmVfbmV3wqDCoMKgwqDCoD0gc3RtMzJfZXh0aV9yZW1vdmUsCj4gwqDCoMKgwqDC
oMKgwqDCoC5kcml2ZXLCoMKgwqDCoMKgwqDCoMKgwqA9IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoC5uYW1lwqDCoMKgPSAic3RtMzJfZXh0aSIsCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAub2ZfbWF0Y2hfdGFibGUgPSBzdG0zMl9leHRpX2lkcywKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
