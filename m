Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5599125FC
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 14:52:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BD34C7128D;
	Fri, 21 Jun 2024 12:52:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2B9BC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 12:52:04 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LBc0dZ007039;
 Fri, 21 Jun 2024 14:51:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 faGsSAC8ulOthkvxWXbNTJoYirta5hMr2PYlnCbqe+A=; b=CJPhnDggnyBO2OL6
 QBlbiCq+wpmtunvZJ4Aw8T4+S9jxDpULUeCkAj6lQTxhsH2QzXVeZwCcKCACFZEs
 DTV1vfUuhCpHHjP+lI9pV44RHlDolTi1PeuXwP3PVYH4Ox0cCHdyPC5mw4vNe20S
 +/6SNeV80q4IIFEGh/SdbBdSxn96C/4aDiJGeO+XWXeewqTMBZN9WyeH6a+kRtM7
 DpVtM0sTHh05bMCsfSZPfPe7aVnY0nhyR5WigSvJ9Gg/w2Gy1chCluapmNxmDLwN
 D3T07wohV2QasIKyegJe5LaQDCbJctibgVxJYkKkFigWLp9FfSl185LNK5quPKU1
 YmmpxQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yvrkk3nub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jun 2024 14:51:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DC35D4002D;
 Fri, 21 Jun 2024 14:51:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1399E21F15B;
 Fri, 21 Jun 2024 14:50:59 +0200 (CEST)
Received: from [10.48.87.177] (10.48.87.177) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 21 Jun
 2024 14:50:58 +0200
Message-ID: <f95e0485-0073-40b1-84ae-535b55d0cd0d@foss.st.com>
Date: Fri, 21 Jun 2024 14:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
 <20240129104106.43141-3-raphael.gallais-pou@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20240129104106.43141-3-raphael.gallais-pou@foss.st.com>
X-Originating-IP: [10.48.87.177]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_04,2024-06-21_01,2024-05-17_01
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH RESEND v3 2/3] drm/stm: dsi: add pm
	runtime ops
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

SGkgUmFwaGFlbCwKCnRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKQWNrZWQtYnk6IFlhbm5pY2sgRmVy
dHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KClRlc3RlZC1ieTogWWFubmljayBGZXJ0
cmUgPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgoKQlIKCgpMZSAyOS8wMS8yMDI0IMOgIDEx
OjQxLCBSYXBoYWVsIEdhbGxhaXMtUG91IGEgw6ljcml0wqA6Cj4gRnJvbTogWWFubmljayBGZXJ0
cmUgPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgo+Cj4gVXBkYXRlIGNvbnRyb2wgb2YgY2xv
Y2tzIGFuZCBzdXBwbHkgdGhhbmtzIHRvIHRoZSBQTSBydW50aW1lCj4gbWVjaGFuaXNtIHRvIGF2
b2lkIGtlcm5lbCBjcmFzaCBkdXJpbmcgYSBzeXN0ZW0gc3VzcGVuZC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3Qu
Y29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gCS0gQ2hhbmdlZCBTRVRfUlVOVElNRV9QTV9P
UFMgdG8gUlVOVElNRV9QTV9PUFMgYW5kIHJlbW92ZWQKPiAJX19tYXliZV91bnVzZWQKPiAtLS0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMgfCAyNCArKysrKysrKysr
KysrKysrKystLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9k
c2ktc3RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jCj4gaW5kZXgg
YjFhZWU0M2Q1MWU5Li44MmZmZjllODQzNDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3N0bS9kd19taXBpX2RzaS1zdG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlw
aV9kc2ktc3RtLmMKPiBAQCAtMTEsNiArMTEsNyBAQAo+ICAgI2luY2x1ZGUgPGxpbnV4L21vZF9k
ZXZpY2V0YWJsZS5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICAgI2luY2x1ZGUg
PGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5o
Pgo+ICAgI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgo+ICAgCj4gICAjaW5j
bHVkZSA8dmlkZW8vbWlwaV9kaXNwbGF5Lmg+Cj4gQEAgLTc3LDYgKzc4LDcgQEAgZW51bSBkc2lf
Y29sb3Igewo+ICAgc3RydWN0IGR3X21pcGlfZHNpX3N0bSB7Cj4gICAJdm9pZCBfX2lvbWVtICpi
YXNlOwo+ICAgCXN0cnVjdCBjbGsgKnBsbHJlZl9jbGs7Cj4gKwlzdHJ1Y3QgY2xrICpwY2xrOwo+
ICAgCXN0cnVjdCBkd19taXBpX2RzaSAqZHNpOwo+ICAgCXUzMiBod192ZXJzaW9uOwo+ICAgCWlu
dCBsYW5lX21pbl9rYnBzOwo+IEBAIC00NDMsNyArNDQ1LDYgQEAgc3RhdGljIGludCBkd19taXBp
X2RzaV9zdG1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgIHsKPiAgIAlz
dHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ICAgCXN0cnVjdCBkd19taXBpX2RzaV9z
dG0gKmRzaTsKPiAtCXN0cnVjdCBjbGsgKnBjbGs7Cj4gICAJaW50IHJldDsKPiAgIAo+ICAgCWRz
aSA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqZHNpKSwgR0ZQX0tFUk5FTCk7Cj4gQEAgLTQ4
MywyMSArNDg0LDIxIEBAIHN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfc3RtX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAJCWdvdG8gZXJyX2Nsa19nZXQ7Cj4gICAJfQo+ICAg
Cj4gLQlwY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgInBjbGsiKTsKPiAtCWlmIChJU19FUlIocGNs
aykpIHsKPiAtCQlyZXQgPSBQVFJfRVJSKHBjbGspOwo+ICsJZHNpLT5wY2xrID0gZGV2bV9jbGtf
Z2V0KGRldiwgInBjbGsiKTsKPiArCWlmIChJU19FUlIoZHNpLT5wY2xrKSkgewo+ICsJCXJldCA9
IFBUUl9FUlIoZHNpLT5wY2xrKTsKPiAgIAkJRFJNX0VSUk9SKCJVbmFibGUgdG8gZ2V0IHBlcmlw
aGVyYWwgY2xvY2s6ICVkXG4iLCByZXQpOwo+ICAgCQlnb3RvIGVycl9kc2lfcHJvYmU7Cj4gICAJ
fQo+ICAgCj4gLQlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUocGNsayk7Cj4gKwlyZXQgPSBjbGtf
cHJlcGFyZV9lbmFibGUoZHNpLT5wY2xrKTsKPiAgIAlpZiAocmV0KSB7Cj4gICAJCURSTV9FUlJP
UigiJXM6IEZhaWxlZCB0byBlbmFibGUgcGVyaXBoZXJhbCBjbGtcbiIsIF9fZnVuY19fKTsKPiAg
IAkJZ290byBlcnJfZHNpX3Byb2JlOwo+ICAgCX0KPiAgIAo+ICAgCWRzaS0+aHdfdmVyc2lvbiA9
IGRzaV9yZWFkKGRzaSwgRFNJX1ZFUlNJT04pICYgVkVSU0lPTjsKPiAtCWNsa19kaXNhYmxlX3Vu
cHJlcGFyZShwY2xrKTsKPiArCWNsa19kaXNhYmxlX3VucHJlcGFyZShkc2ktPnBjbGspOwo+ICAg
Cj4gICAJaWYgKGRzaS0+aHdfdmVyc2lvbiAhPSBIV1ZFUl8xMzAgJiYgZHNpLT5od192ZXJzaW9u
ICE9IEhXVkVSXzEzMSkgewo+ICAgCQlyZXQgPSAtRU5PREVWOwo+IEBAIC01NTEsNiArNTUyLDcg
QEAgc3RhdGljIGludCBkd19taXBpX2RzaV9zdG1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYp
Cj4gICAJRFJNX0RFQlVHX0RSSVZFUigiXG4iKTsKPiAgIAo+ICAgCWNsa19kaXNhYmxlX3VucHJl
cGFyZShkc2ktPnBsbHJlZl9jbGspOwo+ICsJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRzaS0+cGNs
ayk7Cj4gICAJcmVndWxhdG9yX2Rpc2FibGUoZHNpLT52ZGRfc3VwcGx5KTsKPiAgIAo+ICAgCXJl
dHVybiAwOwo+IEBAIC01NjksOCArNTcxLDE2IEBAIHN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfc3Rt
X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gICAJCXJldHVybiByZXQ7Cj4gICAJfQo+ICAg
Cj4gKwlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoZHNpLT5wY2xrKTsKPiArCWlmIChyZXQpIHsK
PiArCQlyZWd1bGF0b3JfZGlzYWJsZShkc2ktPnZkZF9zdXBwbHkpOwo+ICsJCURSTV9FUlJPUigi
RmFpbGVkIHRvIGVuYWJsZSBwY2xrOiAlZFxuIiwgcmV0KTsKPiArCQlyZXR1cm4gcmV0Owo+ICsJ
fQo+ICsKPiAgIAlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoZHNpLT5wbGxyZWZfY2xrKTsKPiAg
IAlpZiAocmV0KSB7Cj4gKwkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRzaS0+cGNsayk7Cj4gICAJ
CXJlZ3VsYXRvcl9kaXNhYmxlKGRzaS0+dmRkX3N1cHBseSk7Cj4gICAJCURSTV9FUlJPUigiRmFp
bGVkIHRvIGVuYWJsZSBwbGxyZWZfY2xrOiAlZFxuIiwgcmV0KTsKPiAgIAkJcmV0dXJuIHJldDsK
PiBAQCAtNTgyLDYgKzU5Miw4IEBAIHN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfc3RtX3Jlc3VtZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgZHdf
bWlwaV9kc2lfc3RtX3BtX29wcyA9IHsKPiAgIAlTWVNURU1fU0xFRVBfUE1fT1BTKGR3X21pcGlf
ZHNpX3N0bV9zdXNwZW5kLAo+ICAgCQkJICAgIGR3X21pcGlfZHNpX3N0bV9yZXN1bWUpCj4gKwlS
VU5USU1FX1BNX09QUyhkd19taXBpX2RzaV9zdG1fc3VzcGVuZCwKPiArCQkgICAgICAgZHdfbWlw
aV9kc2lfc3RtX3Jlc3VtZSwgTlVMTCkKPiAgIH07Cj4gICAKPiAgIHN0YXRpYyBzdHJ1Y3QgcGxh
dGZvcm1fZHJpdmVyIGR3X21pcGlfZHNpX3N0bV9kcml2ZXIgPSB7Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
