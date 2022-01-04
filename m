Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 733824842CE
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jan 2022 14:53:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 207C1C5F1F9;
	Tue,  4 Jan 2022 13:53:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D570C5F1F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jan 2022 13:53:05 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 204B2g5v030926;
 Tue, 4 Jan 2022 14:52:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=praGwGEYsgBaggT9u2yedfPPFakmcyA85Vqx86E0DLw=;
 b=eRJKRUJJP3Glsf478hzyyAE32YEW/QwN0nnEOsAGNFZsoZvPFbtDd/W5h7fVfw/f44T2
 crzn2TTt1KtlpXOo9fOBULANNAS/GXAaTY16ADSoBi0iqbRLGW5fhzirEwLFoYiUFCZs
 axE14gZElZ4e1Ei3BdK8uGVRTdfNf4KVbmYsVPOzbQw72pw5NedhyFBw2WJu/ZdGL5nm
 o2udpmgEUElmIkVGSlW2864otVvo6C6b8h7PYTn5podQ+YkihTzV4KU6B6MxnbKBHLVS
 tonBpdmrNZ3bv4ML46n6xAdaXZp+SJOfDIo0QGVS8gOKDkEUVY7llaFdkN0Lfy00ID5D zA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dcewm29a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 14:52:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4396A10002A;
 Tue,  4 Jan 2022 14:52:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E76D24241C;
 Tue,  4 Jan 2022 14:52:54 +0100 (CET)
Received: from lmecxl0993.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 4 Jan
 2022 14:52:53 +0100
From: Philippe CORNU <philippe.cornu@foss.st.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211206134735.13537-1-yannick.fertre@foss.st.com>
 <10c5672d-a228-ed9e-2f32-1ce9ae86dbcc@suse.de>
 <58cc264b-7b46-7869-1c38-f6d79a4daafe@foss.st.com>
Message-ID: <5c58402b-9219-2789-f8c1-67cf2149beac@foss.st.com>
Date: Tue, 4 Jan 2022 14:52:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <58cc264b-7b46-7869-1c38-f6d79a4daafe@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_06,2022-01-04_01,2021-12-02_01
Subject: Re: [Linux-stm32] [PATCH] drm/stm: remove conflicting framebuffers
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

CgpPbiAxMi8xNC8yMSAxMToxNSBBTSwgUGhpbGlwcGUgQ09STlUgd3JvdGU6Cj4gCj4gCj4gT24g
MTIvNi8yMSAzOjIzIFBNLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPj4gSGkKPj4KPj4gQW0g
MDYuMTIuMjEgdW0gMTQ6NDcgc2NocmllYiBZYW5uaWNrIEZlcnRyZToKPj4+IEluIGNhc2Ugb2Yg
dXNpbmcgc2ltcGxlZmIgb3IgYW5vdGhlciBjb25mbGljdGluZyBmcmFtZWJ1ZmZlciwKPj4+IGNh
bGwgZHJtX2FwZXJ0dXJlX3JlbW92ZV9mcmFtZWJ1ZmZlcnMoKSB0byByZW1vdmUgbWVtb3J5IGFs
bG9jYXRlZC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyZSA8eWFubmljay5m
ZXJ0cmVAZm9zcy5zdC5jb20+Cj4+Cj4+IFRoZSBwYXRjaCBzaG91bGQgaGF2ZSBjb250YWluZWQg
YSBub3RlIHRoYXQgdGhpcyBpcyB2ZXJzaW9uIDIgb2YgdGhlIAo+PiBjaGFuZ2Ugd2l0aCBhIHNo
b3J0IGNoYW5nZWxvZy4gQW55d2F5Cj4+Cj4+IFJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPj4KPj4gQmVzdCByZWdhcmRzCj4+IFRob21hcwo+Pgo+
Pj4gLS0tCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jIHwgNSArKysrKwo+Pj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vc3RtL2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYwo+Pj4gaW5k
ZXggMjIyODY5YjIzMmFlLi45ZjQ0MWFhZGYyZDUgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vc3RtL2Rydi5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jCj4+PiBA
QCAtMTQsNiArMTQsNyBAQAo+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L29mX3BsYXRmb3JtLmg+Cj4+
PiDCoCAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgo+Pj4gKyNpbmNsdWRlIDxkcm0vZHJt
X2FwZXJ0dXJlLmg+Cj4+PiDCoCAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWMuaD4KPj4+IMKgICNp
bmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4KPj4+IMKgICNpbmNsdWRlIDxkcm0vZHJt
X2Rydi5oPgo+Pj4gQEAgLTE4Myw2ICsxODQsMTAgQEAgc3RhdGljIGludCBzdG1fZHJtX3BsYXRm
b3JtX3Byb2JlKHN0cnVjdCAKPj4+IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+IMKgwqDCoMKg
wqAgRFJNX0RFQlVHKCIlc1xuIiwgX19mdW5jX18pOwo+Pj4gK8KgwqDCoCByZXQgPSBkcm1fYXBl
cnR1cmVfcmVtb3ZlX2ZyYW1lYnVmZmVycyhmYWxzZSwgJmRydl9kcml2ZXIpOwo+Pj4gK8KgwqDC
oCBpZiAocmV0KQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+PiArCj4gCj4gSGkg
WWFubmljaywKPiBhbmQgbWFueSB0aGFua3MgZm9yIHlvdXIgcGF0Y2guCj4gQWNrZWQtYnk6IFBo
aWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBmb3NzLnN0LmNvbT4KPiBQaGlsaXBwZSA6LSkK
PiAKPiAKPj4+IMKgwqDCoMKgwqAgZG1hX3NldF9jb2hlcmVudF9tYXNrKGRldiwgRE1BX0JJVF9N
QVNLKDMyKSk7Cj4+PiDCoMKgwqDCoMKgIGRkZXYgPSBkcm1fZGV2X2FsbG9jKCZkcnZfZHJpdmVy
LCBkZXYpOwo+Pj4KPj4KCkFwcGxpZWQgb24gZHJtLW1pc2MtbmV4dC4KTWFueSB0aGFua3MgZm9y
IHlvdXIgcGF0Y2gsClBoaWxpcHBlIDotKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
