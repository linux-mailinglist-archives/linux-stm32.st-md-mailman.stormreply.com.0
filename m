Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA34CB31896
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 14:59:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96B65C3F95B;
	Fri, 22 Aug 2025 12:59:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63DEFC3F95A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 12:59:36 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MB4cNS006702;
 Fri, 22 Aug 2025 14:59:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 eJVEVHQF5pr9BGboWJab/5hf088ZC2OEhk357P8nepk=; b=Nfs7u0K7OlORz/Pc
 D6Sp9pLBly1bVFLlKKcXt7nNlZ5eXZOoOd/qZd4N+VnZuxcjgEGKSBv/03cE56zg
 s84BseNPmH/f+YN7NSapfJKf+23PI0iJ600LKTygRkXTD61x4zSjNS+nVdEanN4X
 8UkYHvd8+MLYSy7DR2s0f/KcAiDAUmDmoD4YLeuK6xE/njAeRga+/hPk3wUdKicd
 AYGrS4YgsgAXP51YZsHDT0rzu8Wcl0w8TW0adxRh5IV844+RUSm3e2z6rKjqHfg4
 Gfe46MB+fUE/+Psv+l70rV0hwLzDDvCaflRKi6JueVyZ40yvhK7L5Sd3om1Vs46U
 5/8iOA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48nj3v88b7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Aug 2025 14:59:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 880E04002D;
 Fri, 22 Aug 2025 14:57:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 967FE5EFA17;
 Fri, 22 Aug 2025 14:56:34 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 14:56:33 +0200
Message-ID: <6bc77ea8-c664-45ff-886a-aefc79767253@foss.st.com>
Date: Fri, 22 Aug 2025 14:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
References: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
 <20250821-drm-misc-next-v4-8-7060500f8fd3@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-8-7060500f8fd3@foss.st.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 08/13] drm/stm: ltdc: handle lvds pixel
	clock
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

SGkgUmFwaGFlbCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKQWNrZWQtYnk6IFlhbm5pY2sgRmVy
dHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KCkxlIDIxLzA4LzIwMjUgw6AgMTM6MDgs
IFJhcGhhZWwgR2FsbGFpcy1Qb3UgYSDDqWNyaXTCoDoKPiBGcm9tOiBZYW5uaWNrIEZlcnRyZSA8
eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+Cj4KPiBIYW5kbGUgTFZEUyBwaXhlbCBjbG9jay4K
Pgo+IFRoZSBMVERDIG9wZXJhdGVzIHdpdGggbXVsdGlwbGUgY2xvY2sgZG9tYWlucyBmb3IgcmVn
aXN0ZXIgYWNjZXNzLAo+IHJlcXVpcmluZyBhbGwgY2xvY2tzIHRvIGJlIHByb3ZpZGVkIGR1cmlu
ZyByZWFkL3dyaXRlIG9wZXJhdGlvbnMuICBUaGlzCj4gaW1wb3NlcyBhIGRlcGVuZGVuY3kgYmV0
d2VlbiB0aGUgTFZEUyBhbmQgTFREQyB0byBhY2Nlc3MgY29ycmVjdGx5IGFsbAo+IExUREMgcmVn
aXN0ZXJzLiAgQW5kIGJlY2F1c2UgYm90aCBJUHMnIHBpeGVsIHJhdGVzIG11c3QgYmUgc3luY2hy
b25pemVkLAo+IHRoZSBMVERDIGhhcyB0byBoYW5kbGUgdGhlIExWRFMgY2xvY2suCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyZSA8eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlzLXBvdUBm
b3NzLnN0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIHwgMjIgKysr
KysrKysrKysrKysrKysrKysrLQo+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmggfCAgMSAr
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zdG0vbHRkYy5jCj4gaW5kZXggMTc1NDhkZDM0ODRhMGEzZTEwMTVjNThjNzUyYjgwZjg4OTJh
MGZmNy4uZjg0YTlhODU5MGYwNjUzZTQyMjc5OGZmNjE4MDRkN2MzOTY2Y2FlZiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9z
dG0vbHRkYy5jCj4gQEAgLTgzNyw2ICs4MzcsMTIgQEAgbHRkY19jcnRjX21vZGVfdmFsaWQoc3Ry
dWN0IGRybV9jcnRjICpjcnRjLAo+ICAgCWludCB0YXJnZXRfbWF4ID0gdGFyZ2V0ICsgQ0xLX1RP
TEVSQU5DRV9IWjsKPiAgIAlpbnQgcmVzdWx0Owo+ICAgCj4gKwlpZiAobGRldi0+bHZkc19jbGsp
IHsKPiArCQlyZXN1bHQgPSBjbGtfcm91bmRfcmF0ZShsZGV2LT5sdmRzX2NsaywgdGFyZ2V0KTsK
PiArCQlkcm1fZGJnX2RyaXZlcihjcnRjLT5kZXYsICJsdmRzIHBpeGNsayByYXRlIHRhcmdldCAl
ZCwgYXZhaWxhYmxlICVkXG4iLAo+ICsJCQkgICAgICAgdGFyZ2V0LCByZXN1bHQpOwo+ICsJfQo+
ICsKPiAgIAlyZXN1bHQgPSBjbGtfcm91bmRfcmF0ZShsZGV2LT5waXhlbF9jbGssIHRhcmdldCk7
Cj4gICAKPiAgIAlEUk1fREVCVUdfRFJJVkVSKCJjbGsgcmF0ZSB0YXJnZXQgJWQsIGF2YWlsYWJs
ZSAlZFxuIiwgdGFyZ2V0LCByZXN1bHQpOwo+IEBAIC0xODc4LDYgKzE4ODQsOCBAQCB2b2lkIGx0
ZGNfc3VzcGVuZChzdHJ1Y3QgZHJtX2RldmljZSAqZGRldikKPiAgIAljbGtfZGlzYWJsZV91bnBy
ZXBhcmUobGRldi0+cGl4ZWxfY2xrKTsKPiAgIAlpZiAobGRldi0+YnVzX2NsaykKPiAgIAkJY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKGxkZXYtPmJ1c19jbGspOwo+ICsJaWYgKGxkZXYtPmx2ZHNfY2xr
KQo+ICsJCWNsa19kaXNhYmxlX3VucHJlcGFyZShsZGV2LT5sdmRzX2Nsayk7Cj4gICB9Cj4gICAK
PiAgIGludCBsdGRjX3Jlc3VtZShzdHJ1Y3QgZHJtX2RldmljZSAqZGRldikKPiBAQCAtMTg5NSw4
ICsxOTAzLDE2IEBAIGludCBsdGRjX3Jlc3VtZShzdHJ1Y3QgZHJtX2RldmljZSAqZGRldikKPiAg
IAo+ICAgCWlmIChsZGV2LT5idXNfY2xrKSB7Cj4gICAJCXJldCA9IGNsa19wcmVwYXJlX2VuYWJs
ZShsZGV2LT5idXNfY2xrKTsKPiAtCQlpZiAocmV0KQo+ICsJCWlmIChyZXQpIHsKPiAgIAkJCWRy
bV9lcnIoZGRldiwgImZhaWxlZCB0byBlbmFibGUgYnVzIGNsb2NrICglZClcbiIsIHJldCk7Cj4g
KwkJCXJldHVybiByZXQ7Cj4gKwkJfQo+ICsJfQo+ICsKPiArCWlmIChsZGV2LT5sdmRzX2Nsaykg
ewo+ICsJCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShsZGV2LT5sdmRzX2Nsayk7Cj4gKwkJaWYg
KHJldCkKPiArCQkJZHJtX2VycihkZGV2LCAiZmFpbGVkIHRvIHByZXBhcmUgbHZkcyBjbG9ja1xu
Iik7Cj4gICAJfQo+ICAgCj4gICAJcmV0dXJuIHJldDsKPiBAQCAtMTk4MSw2ICsxOTk3LDEwIEBA
IGludCBsdGRjX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRkZXYpCj4gICAJCX0KPiAgIAl9Cj4g
ICAKPiArCWxkZXYtPmx2ZHNfY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgImx2ZHMiKTsKPiArCWlm
IChJU19FUlIobGRldi0+bHZkc19jbGspKQo+ICsJCWxkZXYtPmx2ZHNfY2xrID0gTlVMTDsKPiAr
Cj4gICAJcnN0YyA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlKGRldiwgTlVMTCk7
Cj4gICAKPiAgIAltdXRleF9pbml0KCZsZGV2LT5lcnJfbG9jayk7Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5oIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmgKPiBp
bmRleCBkZGZhOGFlNjFhN2JhNWRjNDQ2ZmFlNjQ3NTYyZDBlYzhlNjk1M2UxLi4xN2I1MWE3Y2Uy
OGVlZTVkZTZkMjRjYTk0M2NhM2IxZjQ4Njk1ZGZkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9zdG0vbHRkYy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmgKPiBAQCAt
NDgsNiArNDgsNyBAQCBzdHJ1Y3QgbHRkY19kZXZpY2Ugewo+ICAgCXZvaWQgX19pb21lbSAqcmVn
czsKPiAgIAlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7Cj4gICAJc3RydWN0IGNsayAqcGl4ZWxfY2xr
OwkvKiBsY2QgcGl4ZWwgY2xvY2sgKi8KPiArCXN0cnVjdCBjbGsgKmx2ZHNfY2xrOwkvKiBsdmRz
IHBpeGVsIGNsb2NrICovCj4gICAJc3RydWN0IGNsayAqYnVzX2NsazsJLyogYnVzIGNsb2NrICov
Cj4gICAJc3RydWN0IG11dGV4IGVycl9sb2NrOwkvKiBwcm90ZWN0aW5nIGVycm9yX3N0YXR1cyAq
Lwo+ICAgCXN0cnVjdCBsdGRjX2NhcHMgY2FwczsKPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
