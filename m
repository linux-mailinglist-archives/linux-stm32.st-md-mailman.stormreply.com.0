Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F4A474033
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Dec 2021 11:15:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9A36C5F1EF;
	Tue, 14 Dec 2021 10:15:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB74DC597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Dec 2021 10:15:41 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BE90PHA021201;
 Tue, 14 Dec 2021 11:15:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=nlbvaCpQQU3d8rdYZzHfsFBdcktl3fiaFrosAYYj4j8=;
 b=fEv2GzUAik9hz064aPegO+BHjhT79pdXStLPJSl73C6z0+mLA5o76esXkhCq4jDSDdCk
 RdXa6qG4tC+YHcB1w+gJYGxVIwXh5iCNnSpX3+GLnwN7LcBbWbR8lAX1Zvf7Kuwz8H+7
 bgDzYBypk1HN5aa5JJmQTfyYL++Y/UGQc9bQfBtq3xcTckh+LSCuAMNt3Nz4ACDOBI9/
 gRbycwczmUfrhe1/n36gBhQPwnHKwnO+wU6xtHdKY4Kk+E7mj06+26hN1YY3kz9qyWX0
 BrZsrRvP5N+87plQxCu9Wkc4Qfk3d6FouUCQ/xd7gpK8HQi44hgdfPoZ+BiEqIiLVsUS 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cxr8r8gy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 11:15:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4777910002A;
 Tue, 14 Dec 2021 11:15:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2B41222C8A9;
 Tue, 14 Dec 2021 11:15:28 +0100 (CET)
Received: from lmecxl0993.lme.st.com (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 14 Dec
 2021 11:15:27 +0100
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
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <58cc264b-7b46-7869-1c38-f6d79a4daafe@foss.st.com>
Date: Tue, 14 Dec 2021 11:15:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <10c5672d-a228-ed9e-2f32-1ce9ae86dbcc@suse.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_05,2021-12-14_01,2021-12-02_01
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

CgpPbiAxMi82LzIxIDM6MjMgUE0sIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+IEhpCj4gCj4g
QW0gMDYuMTIuMjEgdW0gMTQ6NDcgc2NocmllYiBZYW5uaWNrIEZlcnRyZToKPj4gSW4gY2FzZSBv
ZiB1c2luZyBzaW1wbGVmYiBvciBhbm90aGVyIGNvbmZsaWN0aW5nIGZyYW1lYnVmZmVyLAo+PiBj
YWxsIGRybV9hcGVydHVyZV9yZW1vdmVfZnJhbWVidWZmZXJzKCkgdG8gcmVtb3ZlIG1lbW9yeSBh
bGxvY2F0ZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZl
cnRyZUBmb3NzLnN0LmNvbT4KPiAKPiBUaGUgcGF0Y2ggc2hvdWxkIGhhdmUgY29udGFpbmVkIGEg
bm90ZSB0aGF0IHRoaXMgaXMgdmVyc2lvbiAyIG9mIHRoZSAKPiBjaGFuZ2Ugd2l0aCBhIHNob3J0
IGNoYW5nZWxvZy4gQW55d2F5Cj4gCj4gUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPgo+IAo+IEJlc3QgcmVnYXJkcwo+IFRob21hcwo+IAo+PiAtLS0K
Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYyB8IDUgKysrKysKPj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3N0bS9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMKPj4gaW5kZXggMjIyODY5YjIz
MmFlLi45ZjQ0MWFhZGYyZDUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2
LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYwo+PiBAQCAtMTQsNiArMTQsNyBA
QAo+PiDCoCAjaW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4KPj4gwqAgI2luY2x1ZGUgPGxp
bnV4L3BtX3J1bnRpbWUuaD4KPj4gKyNpbmNsdWRlIDxkcm0vZHJtX2FwZXJ0dXJlLmg+Cj4+IMKg
ICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pYy5oPgo+PiDCoCAjaW5jbHVkZSA8ZHJtL2RybV9hdG9t
aWNfaGVscGVyLmg+Cj4+IMKgICNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgo+PiBAQCAtMTgzLDYg
KzE4NCwxMCBAQCBzdGF0aWMgaW50IHN0bV9kcm1fcGxhdGZvcm1fcHJvYmUoc3RydWN0IAo+PiBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+IMKgwqDCoMKgwqAgRFJNX0RFQlVHKCIlc1xuIiwgX19m
dW5jX18pOwo+PiArwqDCoMKgIHJldCA9IGRybV9hcGVydHVyZV9yZW1vdmVfZnJhbWVidWZmZXJz
KGZhbHNlLCAmZHJ2X2RyaXZlcik7Cj4+ICvCoMKgwqAgaWYgKHJldCkKPj4gK8KgwqDCoMKgwqDC
oMKgIHJldHVybiByZXQ7Cj4+ICsKCkhpIFlhbm5pY2ssCmFuZCBtYW55IHRoYW5rcyBmb3IgeW91
ciBwYXRjaC4KQWNrZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBmb3NzLnN0
LmNvbT4KUGhpbGlwcGUgOi0pCgoKPj4gwqDCoMKgwqDCoCBkbWFfc2V0X2NvaGVyZW50X21hc2so
ZGV2LCBETUFfQklUX01BU0soMzIpKTsKPj4gwqDCoMKgwqDCoCBkZGV2ID0gZHJtX2Rldl9hbGxv
YygmZHJ2X2RyaXZlciwgZGV2KTsKPj4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
