Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3A17EB0D3
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Nov 2023 14:27:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3D1BC6B44B;
	Tue, 14 Nov 2023 13:27:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA68AC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Nov 2023 13:27:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AEBsRff018227; Tue, 14 Nov 2023 14:27:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=evZjVgwNaw4PqAniLHTlx6HSvZiK4aPjgz4DN6JbtEE=; b=ZY
 jhMjn7iwqbtdi2N3Kx2rv3UXSETDp0I5t9ygiPKpsfqbxaRUDB3EYyfdM3WhUaBG
 5V/w97UBuKZo6QRHiE5SBhbMQxFFF+digA02j1ertnsvJCspb8pggGAPUEJkfpmO
 tNvN2Zv9947ZRT1+BQUrKffx46YxuWjHJqb1XXG7nTcZqrk92WzIJoNDfdiVpI8m
 UIgeanoMQFiuSgy02tCbCOQ759gNreC4vNnPLjjAMozrt8HSnSXrUi5D6tYDd2UJ
 /IfHXmUlU/ncu9jc5k2xzuHbKrDb5Og3O7JvZ+q0E+HzowY8y7/WMpuRvGcWkkjz
 nav4kEdeDbw3QtPeAM9g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ua1ch3yed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Nov 2023 14:27:00 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0097B100038;
 Tue, 14 Nov 2023 14:26:58 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ECD922122EF;
 Tue, 14 Nov 2023 14:26:58 +0100 (CET)
Received: from [10.201.20.59] (10.201.20.59) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 14 Nov
 2023 14:26:57 +0100
Message-ID: <09b09170-697e-44ac-aae1-581ba29481bf@foss.st.com>
Date: Tue, 14 Nov 2023 14:26:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
 <20231019200658.1754190-11-u.kleine-koenig@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20231019200658.1754190-11-u.kleine-koenig@pengutronix.de>
X-Originating-IP: [10.201.20.59]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_13,2023-11-09_01,2023-05-22_02
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/5] pwm: stm32: Implement .get_state()
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

T24gMTAvMTkvMjMgMjI6MDcsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IEZyb206IFBoaWxp
cHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gCj4gSW1wbGVtZW50IHRoZSAmcHdt
X29wcy0+Z2V0X3N0YXRlIGNhbGxiYWNrIHNvIGRyaXZlcnMgY2FuIGluaGVyaXQgUFdNCj4gc3Rh
dGUgc2V0IGJ5IHRoZSBib290bG9hZGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHAgWmFi
ZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gW3VrbDogc3BsaXQgb2ZmIGZyb20gYSBwYXRj
aCB0aGF0IGFsc28gZml4ZXMgY2xrIGVuYWJsZSBjb3VudCBpbiAucHJvYmUoKV0KPiBTaWduZWQt
b2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRl
Pgo+IC0tLQo+ICBkcml2ZXJzL3B3bS9wd20tc3RtMzIuYyB8IDQyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25z
KCspCj4gCgpIaSBVd2UsCgpZb3UgY2FuIGFkZCBteToKUmV2aWV3ZWQtYnk6IEZhYnJpY2UgR2Fz
bmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPgoKVGhhbmtzLApGYWJyaWNlCgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0z
Mi5jCj4gaW5kZXggY2M2Y2FlMDdjMDJjLi42ODIzOTU2N2E1NjQgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9wd20vcHdtLXN0bTMyLmMKPiArKysgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwo+IEBA
IC00NzEsOCArNDcxLDUwIEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX2FwcGx5X2xvY2tlZChzdHJ1
Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCj4gIAlyZXR1cm4gcmV0
Owo+ICB9Cj4gIAo+ICtzdGF0aWMgaW50IHN0bTMyX3B3bV9nZXRfc3RhdGUoc3RydWN0IHB3bV9j
aGlwICpjaGlwLAo+ICsJCQkgICAgICAgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwgc3RydWN0IHB3
bV9zdGF0ZSAqc3RhdGUpCj4gK3sKPiArCXN0cnVjdCBzdG0zMl9wd20gKnByaXYgPSB0b19zdG0z
Ml9wd21fZGV2KGNoaXApOwo+ICsJaW50IGNoID0gcHdtLT5od3B3bTsKPiArCXVuc2lnbmVkIGxv
bmcgcmF0ZTsKPiArCXUzMiBjY2VyLCBwc2MsIGFyciwgY2NyOwo+ICsJdTY0IGR0eSwgcHJkOwo+
ICsJaW50IHJldDsKPiArCj4gKwltdXRleF9sb2NrKCZwcml2LT5sb2NrKTsKPiArCj4gKwlyZXQg
PSByZWdtYXBfcmVhZChwcml2LT5yZWdtYXAsIFRJTV9DQ0VSLCAmY2Nlcik7Cj4gKwlpZiAocmV0
KQo+ICsJCWdvdG8gb3V0Owo+ICsKPiArCXN0YXRlLT5lbmFibGVkID0gY2NlciAmIChUSU1fQ0NF
Ul9DQzFFIDw8IChjaCAqIDQpKTsKPiArCXN0YXRlLT5wb2xhcml0eSA9IChjY2VyICYgKFRJTV9D
Q0VSX0NDMVAgPDwgKGNoICogNCkpKSA/Cj4gKwkJCSAgUFdNX1BPTEFSSVRZX0lOVkVSU0VEIDog
UFdNX1BPTEFSSVRZX05PUk1BTDsKPiArCXJldCA9IHJlZ21hcF9yZWFkKHByaXYtPnJlZ21hcCwg
VElNX1BTQywgJnBzYyk7Cj4gKwlpZiAocmV0KQo+ICsJCWdvdG8gb3V0Owo+ICsJcmV0ID0gcmVn
bWFwX3JlYWQocHJpdi0+cmVnbWFwLCBUSU1fQVJSLCAmYXJyKTsKPiArCWlmIChyZXQpCj4gKwkJ
Z290byBvdXQ7Cj4gKwlyZXQgPSByZWdtYXBfcmVhZChwcml2LT5yZWdtYXAsIFRJTV9DQ1IxICsg
NCAqIGNoLCAmY2NyKTsKPiArCWlmIChyZXQpCj4gKwkJZ290byBvdXQ7Cj4gKwo+ICsJcmF0ZSA9
IGNsa19nZXRfcmF0ZShwcml2LT5jbGspOwo+ICsKPiArCXByZCA9ICh1NjQpTlNFQ19QRVJfU0VD
ICogKHBzYyArIDEpICogKGFyciArIDEpOwo+ICsJc3RhdGUtPnBlcmlvZCA9IERJVl9ST1VORF9V
UF9VTEwocHJkLCByYXRlKTsKPiArCWR0eSA9ICh1NjQpTlNFQ19QRVJfU0VDICogKHBzYyArIDEp
ICogY2NyOwo+ICsJc3RhdGUtPmR1dHlfY3ljbGUgPSBESVZfUk9VTkRfVVBfVUxMKGR0eSwgcmF0
ZSk7Cj4gKwo+ICtvdXQ6Cj4gKwltdXRleF91bmxvY2soJnByaXYtPmxvY2spOwo+ICsJcmV0dXJu
IHJldDsKPiArfQo+ICsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwd21fb3BzIHN0bTMycHdtX29w
cyA9IHsKPiAgCS5hcHBseSA9IHN0bTMyX3B3bV9hcHBseV9sb2NrZWQsCj4gKwkuZ2V0X3N0YXRl
ID0gc3RtMzJfcHdtX2dldF9zdGF0ZSwKPiAgCS5jYXB0dXJlID0gSVNfRU5BQkxFRChDT05GSUdf
RE1BX0VOR0lORSkgPyBzdG0zMl9wd21fY2FwdHVyZSA6IE5VTEwsCj4gIH07Cj4gIApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
