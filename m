Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B69523BDA06
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jul 2021 17:21:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0EB8C57B53;
	Tue,  6 Jul 2021 15:21:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D719C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jul 2021 15:21:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166F6dNG025235; Tue, 6 Jul 2021 17:21:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=lLGR8C8rrnqtM2RD7BZasUGPpC8PxB8+w4cxLfW4Uq4=;
 b=tSDbaBK/81YI+n/PD1miwCO7NPWX/60hIbjZxNkPQ/LqsLqWVXQxH67ZBY0WsKMbPs3k
 DdXewsocnRWz0SBY3UVw0yPc9g7GGO5MfUbROJpb+Vyrxd2wceFKI5XqSXy5TlArOJhl
 fC3C4P4infB9Aof1zyEdQai5CHmteGc1ZiR5VFf/T0GQtA91gNwy8JFZY8tTlspsmQvZ
 ggqIDDg9K+P4EZAnHi0PxocE0fFU15C8adoHfyEwa7jPL/1O4g+F4XuAcl9g5FqnpjaG
 l9WlIv+OByPh9kRs4+Z6Dg2LtvqTuelJ615eZatsLhNZXOQTLX8DNoXt8Cizq3NreBsg Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39mneb9f4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 17:21:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C1CFC10002A;
 Tue,  6 Jul 2021 17:21:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A430621BF5A;
 Tue,  6 Jul 2021 17:21:04 +0200 (CEST)
Received: from lmecxl0951.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 6 Jul
 2021 17:21:03 +0200
To: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>, "Philippe
 CORNU - foss" <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
References: <20210629115709.16145-1-raphael.gallais-pou@foss.st.com>
From: yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <40f82de6-5340-347a-ae37-32c0928a5536@foss.st.com>
Date: Tue, 6 Jul 2021 17:21:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629115709.16145-1-raphael.gallais-pou@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-06_07:2021-07-06,
 2021-07-06 signatures=0
Cc: Yannick FERTRE <yannick.fertre@st.com>, Marek Vasut <marex@denx.de>,
 Philippe CORNU <philippe.cornu@st.com>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: improve pm_runtime to stop
	clocks
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

SGkgUmFwaGHDq2wsCgp0aGFua3MgZm9yIHRoZSBwYXRjaC4KClRlc3RlZC1ieTogWWFubmljayBG
ZXJ0cmUgPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgoKCgpPbiA2LzI5LzIxIDE6NTggUE0s
IFJhcGhhZWwgR0FMTEFJUy1QT1UgLSBmb3NzIHdyb3RlOgo+IEJ1Z3ppbGxhIHRpY2tldDogaHR0
cHM6Ly9pbnRidWd6aWxsYS5zdC5jb20vc2hvd19idWcuY2dpP2lkPTYwNjIwCj4gR2Vycml0IHBh
dGNoOiBodHRwczovL2dlcnJpdC5zdC5jb20vYy9tcHUvb2Uvc3QvbGludXgtc3RtMzIvKy8yMDgw
OTMvCj4gCj4gSW4gdGhlIExUREMgZHJpdmVyLCBwbV9ydW50aW1lX2dldF9zeW5jIHdhcyB3cm9u
Z2x5IHVzZWQgYW5kIGNhdXNlZCB0aGUKPiBMVERDIHBpeGVsIGNsb2NrIHRvIGJlIHN5c3RlbWF0
aWNhbGx5IGVuYWJsZWQgaW4gdGhlIGNsb2NrIHN1bW1hcnkuCj4gCj4gQWZ0ZXIgb25lIHNpbXBs
ZSB1c2Ugb2YgdGhlIExUREMgYnkgYWN0aXZhdGluZyBhbmQgZGVhY3RpdmF0aW5nLAo+IHRoZSBj
bG9jayBzdW1tYXJ5IHJlc3VsdHMgYXMgYmVsb3c6Cj4gCj4gfiMgY2F0IC9zeXMva2VybmVsL2Rl
YnVnL2Nsay9jbGtfc3VtbWFyeSB8IGdyZXAgbHRkYwo+ICAgICAgICAgIGx0ZGNfcHggICAgICAg
ICAgICAgICAxICAgICAgICAxICAgICAgICAwICAgIDI5NzAwMDAwICAgICAgICAgIDAgICAgIDAg
IDUwMDAwICAgICAgICAgTgo+ICAgICAgICAgICAgICAgIGx0ZGMgICAgICAgICAgICAwICAgICAg
ICAwICAgICAgICAwICAgMTMzMjUwMDAwICAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAg
Tgo+IAo+IEJ5IGRvaW5nIHNvLCBwbV9ydW50aW1lX2dldF9zeW5jIG9ubHkgaW5jcmVtZW50cyB0
aGUgY2xvY2sgY291bnRlciB3aGVuCj4gdGhlIGRyaXZlciB3YXMgaW4gbm90IGFjdGl2ZSwgZGlz
cGxheWluZyB0aGUgcmlnaHQgaW5mb3JtYXRpb24gd2hlbiB0aGUKPiBMVERDIGlzIG5vdCBpbiB1
c2UsIHJlc3VsdGluZyBvZiB0aGUgYmVsb3cgY2xvY2sgc3VtbWFyeSBhZnRlciBkZWFjdGl2YXRp
b24KPiBvZiB0aGUgTFREQy4KPiAKPiB+IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvY2xrL2Nsa19z
dW1tYXJ5IHwgZ3JlcCBsdGRjCj4gICAgICAgICAgbHRkY19weCAgICAgICAgICAgICAgIDAgICAg
ICAgIDAgICAgICAgIDAgICAgMjk3MDAwMDAgICAgICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAg
ICBOCj4gICAgICAgICAgICAgICAgbHRkYyAgICAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAg
ICAxMzMyNTAwMDAgICAgICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBOCj4gCj4gVGhlIGNs
b2NrcyBhcmUgYWN0aXZhdGVkIGVpdGhlciBieSB0aGUgY3J0Y19zZXRfbm9mYiBmdW5jdGlvbiBv
cgo+IGJ5IHRoZSBjcnRjX2F0b21pY19lbmFibGUgZnVuY3Rpb24uIEEgY2hlY2sgb2YgcG1fcnVu
dGltZSBhY3Rpdml0eSBtdXN0Cj4gYmUgZG9uZSBiZWZvcmUgc2V0IGNsb2NrcyBvbi4gVGhpcyBj
aGVjayBtdXN0IGFsc28gYmUgZG9uZSBmb3Igb3RoZXJzCj4gZnVuY3Rpb25zIHdoaWNoIGFjY2Vz
cyByZWdpc3RlcnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFw
aGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9z
dG0vbHRkYy5jIHwgMjEgKysrKysrKysrKysrKysrKysrKystCj4gICAxIGZpbGUgY2hhbmdlZCwg
MjAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gaW5kZXgg
MDhiNzEyNDgwNDRkLi5iZjlkMTgwMjM2OTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3N0bS9sdGRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+IEBAIC00MjUs
MTAgKzQyNSwxNyBAQCBzdGF0aWMgdm9pZCBsdGRjX2NydGNfYXRvbWljX2VuYWJsZShzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGMsCj4gICB7Cj4gICAJc3RydWN0IGx0ZGNfZGV2aWNlICpsZGV2ID0gY3J0
Y190b19sdGRjKGNydGMpOwo+ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gY3J0Yy0+ZGV2
Owo+ICsJaW50IHJldDsKPiAgIAo+ICAgCURSTV9ERUJVR19EUklWRVIoIlxuIik7Cj4gICAKPiAt
CXBtX3J1bnRpbWVfZ2V0X3N5bmMoZGRldi0+ZGV2KTsKPiArCWlmICghcG1fcnVudGltZV9hY3Rp
dmUoZGRldi0+ZGV2KSkgewo+ICsJCXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoZGRldi0+ZGV2
KTsKPiArCQlpZiAocmV0KSB7Cj4gKwkJCURSTV9FUlJPUigiRmFpbGVkIHRvIHNldCBtb2RlLCBj
YW5ub3QgZ2V0IHN5bmNcbiIpOwo+ICsJCQlyZXR1cm47Cj4gKwkJfQo+ICsJfQo+ICAgCj4gICAJ
LyogU2V0cyB0aGUgYmFja2dyb3VuZCBjb2xvciB2YWx1ZSAqLwo+ICAgCXJlZ193cml0ZShsZGV2
LT5yZWdzLCBMVERDX0JDQ1IsIEJDQ1JfQkNCTEFDSyk7Cj4gQEAgLTc4Myw2ICs3OTAsNyBAQCBz
dGF0aWMgdm9pZCBsdGRjX3BsYW5lX2F0b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxh
bmUsCj4gICAJc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqbmV3c3RhdGUgPSBkcm1fYXRvbWljX2dl
dF9uZXdfcGxhbmVfc3RhdGUoc3RhdGUsCj4gICAJCQkJCQkJCQkgIHBsYW5lKTsKPiAgIAlzdHJ1
Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9IG5ld3N0YXRlLT5mYjsKPiArCXN0cnVjdCBkcm1fZGV2
aWNlICpkZGV2ID0gcGxhbmUtPmRldjsKPiAgIAl1MzIgbG9mcyA9IHBsYW5lLT5pbmRleCAqIExB
WV9PRlM7Cj4gICAJdTMyIHgwID0gbmV3c3RhdGUtPmNydGNfeDsKPiAgIAl1MzIgeDEgPSBuZXdz
dGF0ZS0+Y3J0Y194ICsgbmV3c3RhdGUtPmNydGNfdyAtIDE7Cj4gQEAgLTc5Miw2ICs4MDAsMTEg
QEAgc3RhdGljIHZvaWQgbHRkY19wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUg
KnBsYW5lLAo+ICAgCXUzMiB2YWwsIHBpdGNoX2luX2J5dGVzLCBsaW5lX2xlbmd0aCwgcGFkZHIs
IGFoYnAsIGF2YnAsIGJwY3I7Cj4gICAJZW51bSBsdGRjX3BpeF9mbXQgcGY7Cj4gICAKPiArCWlm
ICghcG1fcnVudGltZV9hY3RpdmUoZGRldi0+ZGV2KSkgewo+ICsJCURSTV9ERUJVR19EUklWRVIo
ImNydGMgbm90IGFjdGl2YXRlZCIpOwo+ICsJCXJldHVybjsKPiArCX0KPiArCj4gICAJaWYgKCFu
ZXdzdGF0ZS0+Y3J0YyB8fCAhZmIpIHsKPiAgIAkJRFJNX0RFQlVHX0RSSVZFUigiZmIgb3IgY3J0
YyBOVUxMIik7Cj4gICAJCXJldHVybjsKPiBAQCAtODk3LDggKzkxMCwxNCBAQCBzdGF0aWMgdm9p
ZCBsdGRjX3BsYW5lX2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+ICAg
CXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9sZHN0YXRlID0gZHJtX2F0b21pY19nZXRfb2xkX3Bs
YW5lX3N0YXRlKHN0YXRlLAo+ICAgCQkJCQkJCQkJICBwbGFuZSk7Cj4gICAJc3RydWN0IGx0ZGNf
ZGV2aWNlICpsZGV2ID0gcGxhbmVfdG9fbHRkYyhwbGFuZSk7Cj4gKwlzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGRldiA9IHBsYW5lLT5kZXY7Cj4gICAJdTMyIGxvZnMgPSBwbGFuZS0+aW5kZXggKiBMQVlf
T0ZTOwo+ICAgCj4gKwlpZiAoIXBtX3J1bnRpbWVfYWN0aXZlKGRkZXYtPmRldikpIHsKPiArCQlE
Uk1fREVCVUdfRFJJVkVSKCJjcnRjIGFscmVhZHkgZGVhY3RpdmF0ZWQiKTsKPiArCQlyZXR1cm47
Cj4gKwl9Cj4gKwo+ICAgCS8qIGRpc2FibGUgbGF5ZXIgKi8KPiAgIAlyZWdfY2xlYXIobGRldi0+
cmVncywgTFREQ19MMUNSICsgbG9mcywgTFhDUl9MRU4pOwo+ICAgCj4gCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
