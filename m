Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5B455BAA8
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jun 2022 17:11:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1781C04003;
	Mon, 27 Jun 2022 15:11:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC025C03FC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 15:11:50 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RDMtP7021987;
 Mon, 27 Jun 2022 17:11:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yzvJykJCp0Imrq/QyPH9zItJev5YVbqvfDLjrOah5dU=;
 b=ZKQ4MONmyh56zgmCSgALXa3wNGVLTJYYxAPJx/Db99JOXis7Qd1cRYd39o8+ot8A223s
 e9CMi/CF6UiyawUPi2l8MoGEKTKIQvIt1i1b8OelaRVZyX5zXdJxigwant8e7WiZLSI9
 e/AC0k56v+KPRomsU/IPCF1KWJiWbvmslja2MWlV7/5zLOczPPYy8s+5+o23sy453SCl
 taQCDOJ9yCVvLgvWdvUfxy/A/4FTCqexMAwAHDE47NVMX44eD6W/RthcsSiFN1OMNPZB
 Yd3Koh4MAPb2n4b3tgomn3JjhjCSAQmArPsjjTN2mBXk9IxEjoCAf81qjE/JyAEqXw+Y KQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gydcu0jn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 17:11:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1AB5910002A;
 Mon, 27 Jun 2022 17:11:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D7322248A7;
 Mon, 27 Jun 2022 17:11:43 +0200 (CEST)
Received: from [10.201.21.143] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 27 Jun
 2022 17:11:42 +0200
Message-ID: <991ffe2d-fef3-0907-3f64-edcc5076762c@foss.st.com>
Date: Mon, 27 Jun 2022 17:11:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Marek Vasut
 <marex@denx.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans
 Verkuil <hverkuil@xs4all.nl>
References: <20220618222442.478285-1-marex@denx.de>
 <Yq5c6dObTlmZr95P@pendragon.ideasonboard.com>
 <0dc2d603-586e-be49-8f8d-1f52f1915813@ideasonboard.com>
 <4d5b5c59-f3d5-ad5a-ae61-73277b4adefa@denx.de>
 <5ee6c0c0-8ab0-561c-e1f6-b26e4ec438af@foss.st.com>
 <39657445-e5ac-bfd6-c122-b18088fa4b41@denx.de>
 <733f9689-b4d7-8f23-37d3-920aa6a5a7ea@foss.st.com>
 <c92f1a8d-6439-d494-5779-70619ec94760@denx.de>
 <b9c450b1-96d2-1ac5-0dec-04387903ebf2@ideasonboard.com>
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <b9c450b1-96d2-1ac5-0dec-04387903ebf2@ideasonboard.com>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Cc: Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: stm32: dcmi: Switch to
	__v4l2_subdev_state_alloc()
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

VGhhbmtzIFRvbWkgZm9yIGRldGFpbHMsCgpPSyBmb3IgbWUgd2l0aCBhIEZJWE1FIG9uIHRvcCwg
Zm9yIHRoZSBzYWtlIG9mIHVuaWZvcm1pdHkgd2l0aCBvdGhlciAKZHJpdmVycy4KCkJSLApIdWd1
ZXMuCgpPbiA2LzI3LzIyIDE1OjMwLCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPiBPbiAyNy8wNi8y
MDIyIDE2OjAxLCBNYXJlayBWYXN1dCB3cm90ZToKPj4gT24gNi8yNy8yMiAxNDo1MywgSHVndWVz
IEZSVUNIRVQgd3JvdGU6Cj4+PiBIaSBNYXJlaywKPj4KPj4gSGksCj4+Cj4+PiBUaGFua3MgZm9y
IGV4cGxhbmF0aW9uLCBJIHVuZGVyc3RhbmQgbm93Lgo+Pj4KPj4+IFBsZWFzZSBub3RlIHRoYXQg
ZGNtaSBpcyBub3QgYXRtZWwtaXNpLmMgaGFzIHNhbWUgY29kZSBzdHJ1Y3R1cmUsIAo+Pj4gaGVu
Y2Ugc2FtZSBwcm9ibGVtOgo+Pj4KPj4+IHN0YXRpYyBpbnQgaXNpX3RyeV9mbXQoc3RydWN0IGF0
bWVsX2lzaSAqaXNpLCBzdHJ1Y3QgdjRsMl9mb3JtYXQgKmYsCj4+PiDCoMKgwqDCoMKgc3RydWN0
IHY0bDJfc3ViZGV2X3N0YXRlIHBhZF9zdGF0ZSA9IHsKPj4+IMKgwqDCoMKgwqDCoMKgwqAgLnBh
ZHMgPSAmcGFkX2NmZwo+Pj4gwqDCoMKgwqDCoMKgwqDCoCB9Owo+Pj4gWy4uLl0KPj4+IMKgwqDC
oMKgwqByZXQgPSB2NGwyX3N1YmRldl9jYWxsKGlzaS0+ZW50aXR5LnN1YmRldiwgcGFkLCBzZXRf
Zm10LAo+Pj4KPj4+Cj4+PiBNb3Jlb3Zlciwgc2VhcmNoaW5nIGZvciBfX3Y0bDJfc3ViZGV2X3N0
YXRlX2FsbG9jKCkgSSBzZWUgdGhvc2UgIkZJWE1FIjoKPj4+Cj4+PiBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL3JlbmVzYXMvdnNwMS92c3AxX2VudGl0eS5jCj4+PiDCoMKgwqDCoMKgLyoKPj4+IMKg
wqDCoMKgwqAgKiBGSVhNRTogRHJvcCB0aGlzIGNhbGwsIGRyaXZlcnMgYXJlIG5vdCBzdXBwb3Nl
ZCB0byB1c2UKPj4+IMKgwqDCoMKgwqAgKiBfX3Y0bDJfc3ViZGV2X3N0YXRlX2FsbG9jKCkuCj4+
PiDCoMKgwqDCoMKgICovCj4+PiDCoMKgwqDCoMKgZW50aXR5LT5jb25maWcgPSBfX3Y0bDJfc3Vi
ZGV2X3N0YXRlX2FsbG9jKCZlbnRpdHktPnN1YmRldiwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAidnNwMTpjb25maWctPmxvY2siLCAm
a2V5KTsKPj4+Cj4+Pgo+Pj4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3JjYXItdmlu
L3JjYXItdjRsMi5jCj4+PiDCoMKgwqDCoMKgLyoKPj4+IMKgwqDCoMKgwqAgKiBGSVhNRTogRHJv
cCB0aGlzIGNhbGwsIGRyaXZlcnMgYXJlIG5vdCBzdXBwb3NlZCB0byB1c2UKPj4+IMKgwqDCoMKg
wqAgKiBfX3Y0bDJfc3ViZGV2X3N0YXRlX2FsbG9jKCkuCj4+PiDCoMKgwqDCoMKgICovCj4+PiDC
oMKgwqDCoMKgc2Rfc3RhdGUgPSBfX3Y0bDJfc3ViZGV2X3N0YXRlX2FsbG9jKHNkLCAicnZpbjpz
dGF0ZS0+bG9jayIsICZrZXkpOwo+Pj4KPj4+Cj4+PiBTbyBJIHdvbmRlciBhYm91dCBpbnRyb2R1
Y2luZyB0aGlzIG5ldyBjaGFuZ2UgaW4gZGNtaSB3aGlsZSBpdCBpcyAKPj4+IG1hcmtlZCBhcyAi
RklYTUUiIGluIG90aGVyIGNhbWVyYSBpbnRlcmZhY2UgZHJpdmVycyA/Cj4+Cj4+IFRoaXMgaXMg
cHJvYmFibHkgc29tZXRoaW5nIFRvbWkvTGF1cmVudCBjYW4gYW5zd2VyIGJldHRlci4gSXQgc2hv
dWxkIAo+PiBiZSBPSyBmb3IgdGhpcyBkcml2ZXIgYXMgZmFyIGFzIEkgdW5kZXJzdGFuZCB0aGUg
ZGlzY3Vzc2lvbiBpbiB0aGlzIAo+PiB0aHJlYWQuCj4gCj4gWWVzIGFuZCBuby4gV2Ugc2hvdWxk
bid0IHVzZSBfXyBmdW5jcyBpbiB0aGUgZHJpdmVycy4gCj4gX192NGwyX3N1YmRldl9zdGF0ZV9h
bGxvYygpIGNhbGxzIGV4aXN0IGluIHRoZSBjdXJyZW50IGRyaXZlcnMgYXMgaXQgCj4gd2Fzbid0
IHRyaXZpYWwgdG8gY2hhbmdlIHRoZSBkcml2ZXIgdG8gZG8gaXQgb3RoZXJ3aXNlIHdoaWxlIGFk
ZGluZyB0aGUgCj4gc3ViZGV2IHN0YXRlIGZlYXR1cmUuCj4gCj4gSWYgSSByZWNhbGwgcmlnaHQs
IHRoZSBvdGhlciB1c2VycyAoYXQgbGVhc3Qgc29tZSBvZiB0aGVtKSB3ZXJlIHN0b3JpbmcgCj4g
aW50ZXJuYWwgc3RhdGUgaW4gdGhlIHN0YXRlLCBub3QgcGFzc2luZyBpdCBmb3J3YXJkLiBBbmQs
IG9mIGNvdXJzZSwgdGhlIAo+IGRyaXZlcnMgd2VyZSB0aGVtc2VsdmVzIGludGVyZXN0ZWQgaW4g
dGhlIHN0YXRlIHN0b3JlZCB0aGVyZS4KPiAKPiBIZXJlLCB3ZSBvbmx5IG5lZWQgdG8gYWxsb2Nh
dGUgdGhlIHN0YXRlIHNvIHRoYXQgdGhlIGRyaXZlciBpcyBhYmxlIHRvIAo+IGNhbGwgc2V0X2Zt
dCBvbiBhbm90aGVyIHN1YmRldiwgc28gaXQncyBhIGJpdCBkaWZmZXJlbnQgY2FzZS4KPiAKPiBB
bnl3YXksIEkgdGhpbmsgaXQncyBfbm90XyBvayB0byBhZGQgX192NGwyX3N1YmRldl9zdGF0ZV9h
bGxvYygpIHdpdGhvdXQgCj4gYSBGSVhNRSBjb21tZW50LiBIb3dldmVyLCBJIHRoaW5rIGl0J3Mg
b2sgdG8gYWRkIGEgaGVscGVyIGZ1bmMsIHNpbWlsYXIgCj4gdG8gdjRsMl9zdWJkZXZfY2FsbF9z
dGF0ZV9hY3RpdmUoKSwgd2hpY2ggaW4gdHVybiB1c2VzIAo+IF9fdjRsMl9zdWJkZXZfc3RhdGVf
YWxsb2MuCj4gCj4gSG93ZXZlciwgaWYgd2UgZW5kIHVwIGluIGEgc2l0dWF0aW9uIHdoZXJlIHdl
IHRoaW5rIGl0J3MgIm5vcm1hbCIgZm9yIAo+IGRyaXZlcnMgdG8gY2FsbCBfX3Y0bDJfc3ViZGV2
X3N0YXRlX2FsbG9jLCB3ZSBuZWVkIHRvIHJlbmFtZSBpdCBhbmQgZHJvcCAKPiB0aGUgdHdvIHVu
ZGVyc2NvcmVzLiBCdXQgSSB0aGluayB3ZSdyZSBub3QgdGhlcmUgeWV0IChhbmQgaG9wZWZ1bGx5
IG5ldmVyKS4KPiAKPiAgwqBUb21pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
