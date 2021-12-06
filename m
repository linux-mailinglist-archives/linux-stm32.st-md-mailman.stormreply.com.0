Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF69469759
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Dec 2021 14:43:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E310C5F1E5;
	Mon,  6 Dec 2021 13:43:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C61CCC58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Dec 2021 13:43:06 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B6BTNV5004649;
 Mon, 6 Dec 2021 14:42:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=F6W+F1Vf7fYffkjJdPpsISKp/C9lL7UUAM9B4MeGe9M=;
 b=h9Izmgr4eMqce9mCmp48j0IWXnASaiBlCb2qCT3AcvaKj8NI4VLMuI1Zk1JZ7D8o5DRl
 8yuUowYCW8BDL4U6tYcUqdAChpi7+hHTu/LBPKLkGCdRV+ZNGGNqzXuI7IKK5msVPDwg
 yAIeWBcB9araYy4lwmn8fyzrLKlwPflU4t7rRPbjoT+pLGyL/kvip8Tx9aW0sVprX7Uw
 +qrtY7kw1Som+ZslVdJWnYMRR00IQeSwS2lPeqpbK8cj7WqOyIquGC/yFw8ApjnqQL88
 HjJ0G8FZWav6UrKFgQBvCSJxm/N981Hngpp1JUwBduf3U9+iPt+vOLYPucUOOaVb4u87 Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cryhqvsm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 14:42:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F82310002A;
 Mon,  6 Dec 2021 14:42:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DBF3C2A4D7F;
 Mon,  6 Dec 2021 14:42:50 +0100 (CET)
Received: from lmecxl0951.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 6 Dec
 2021 14:42:50 +0100
To: Thomas Zimmermann <tzimmermann@suse.de>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211203085512.11127-1-yannick.fertre@foss.st.com>
 <7469e918-b2bf-00a9-1bbc-2f3514ec0816@suse.de>
From: yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <169ba08b-fdaa-866e-91bf-7a353c1d713d@foss.st.com>
Date: Mon, 6 Dec 2021 14:42:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7469e918-b2bf-00a9-1bbc-2f3514ec0816@suse.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_04,2021-12-06_02,2021-12-02_01
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

SGkgVGhvbWFzLAoKCk9uIDEyLzMvMjEgMTA6MzUgQU0sIFRob21hcyBaaW1tZXJtYW5uIHdyb3Rl
Ogo+IEhpCj4gCj4gQW0gMDMuMTIuMjEgdW0gMDk6NTUgc2NocmllYiBZYW5uaWNrIEZlcnRyZToK
Pj4gSW4gY2FzZSBvZiB1c2luZyBzaW1wbGVmYiBvciBhbm90aGVyIGNvbmZsaWN0aW5nIGZyYW1l
YnVmZmVyLAo+PiBjYWxsIGRybV9hcGVydHVyZV9yZW1vdmVfZnJhbWVidWZmZXJzKCkgdG8gcmVt
b3ZlIG1lbW9yeSBhbGxvY2F0ZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHJl
IDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2Ry
bS9zdG0vZHJ2LmMgfCA1ICsrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vc3RtL2Rydi5jCj4+IGluZGV4IDIyMjg2OWIyMzJhZS4uNWJhNDZmNzBmMDgxIDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9zdG0vZHJ2LmMKPj4gQEAgLTE0LDYgKzE0LDcgQEAKPj4gwqAgI2luY2x1ZGUgPGxp
bnV4L29mX3BsYXRmb3JtLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+Cj4+
ICsjaW5jbHVkZSA8ZHJtL2RybV9hcGVydHVyZS5oPgo+PiDCoCAjaW5jbHVkZSA8ZHJtL2RybV9h
dG9taWMuaD4KPj4gwqAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgo+PiDCoCAj
aW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KPj4gQEAgLTE5Myw2ICsxOTQsMTAgQEAgc3RhdGljIGlu
dCBzdG1fZHJtX3BsYXRmb3JtX3Byb2JlKHN0cnVjdCAKPj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+PiDCoMKgwqDCoMKgIGlmIChyZXQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9w
dXQ7Cj4+ICvCoMKgwqAgcmV0ID0gZHJtX2FwZXJ0dXJlX3JlbW92ZV9mcmFtZWJ1ZmZlcnMoZmFs
c2UsICZkcnZfZHJpdmVyKTsKPj4gK8KgwqDCoCBpZiAocmV0KQo+PiArwqDCoMKgwqDCoMKgwqAg
Z290byBlcnJfcHV0Owo+PiArCj4gCj4gVGhpcyBoYXMgdG8gYmUgZG9uZSBhdCB0aGUgdmVyeSB0
b3Agb2YgdGhlIHByb2JlIGZ1bmN0aW9uLCBiZWZvcmUgCj4gYW55dGhpbmcgdGhhdCB0b3VjaGVz
IHRoZSBkZXZpY2UuIE90aGVyd2lzZSBib3RoIGRyaXZlcnMgaW50ZXJmZXJlIHdpdGggCj4gZWFj
aCBvdGhlciB3aGlsZSBwcm9iaW5nIGFuZCBzZXR1cCdzIGdvaW5nIG9uLgo+IAo+IEJlc3QgcmVn
YXJkcwo+IFRob21hcwo+IAo+PiDCoMKgwqDCoMKgIHJldCA9IGRybV9kZXZfcmVnaXN0ZXIoZGRl
diwgMCk7Cj4+IMKgwqDCoMKgwqAgaWYgKHJldCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8g
ZXJyX3B1dDsKPj4KPiAKVGhhbmtzIGZvciByZXZpZXdpbmcgdGhlIHBhdGNoLgpJIHdpbGwgZm9s
bG93IHlvdXIgYWR2aWNlIGFuZCBwdXNoIGEgbmV3IHBhdGNoLgoKWWFubmljawpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
