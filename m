Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DF47FC82
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2019 16:48:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2F64C35E04;
	Fri,  2 Aug 2019 14:48:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8843FC35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 14:47:59 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72EaJNq005392; Fri, 2 Aug 2019 16:47:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=N8rgZWIZfOw81q7QuM18Tttp0ZdrCfm1/QUNIZC/5bM=;
 b=KqUvXDckPZyMTnjcTF4guAysii2fBpfThquE/WOr+K6iec9ZCasTAjCaVoHBc694o/nA
 IocwSQWQ9NiMwq5QF2oY40wO4jJZ7mbzbLYAWz/44U3O1kyYXaYCRfMWN/+Gnmyhqq3h
 koYoCPpSZSAcBPN1XfGoiyVTdRSW3RczZnlNDgfimraWV9IbHNMpWHyQ32ETRf7TjLOz
 Nv011AIcA7qb3HtK6DQ5Dni+YbVRPbP93ZxJsI+XBR/bhohdv0MpgMB5hQVAIKNWFGDT
 Icw0ZbXBFx2Vh4HxzOnXGWvBS9k1cMl8n4lpWWsZLtx0nZq2v20lut9fEJfjyGBPoTE+ 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u3vd07vqr-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 16:47:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA83231;
 Fri,  2 Aug 2019 14:47:49 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D68092C54E2;
 Fri,  2 Aug 2019 16:47:49 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 16:47:49 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 16:47:49
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>
Date: Fri, 2 Aug 2019 16:47:42 +0200
Message-ID: <1564757262-6166-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_06:, , signatures=0
Subject: [Linux-stm32] [PATCH] drm/stm: ltdc: add pinctrl for DPI encoder
	mode
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

VGhlIGltcGxlbWVudGF0aW9uIG9mIGZ1bmN0aW9ucyBlbmNvZGVyX2VuYWJsZSBhbmQgZW5jb2Rl
cl9kaXNhYmxlCm1ha2UgcG9zc2libGUgdG8gY29udHJvbCB0aGUgcGluY3RybCBhY2NvcmRpbmcg
dG8gdGhlIGVuY29kZXIgdHlwZS4KVGhlIHBpbmN0cmwgbXVzdCBiZSBhY3RpdmF0ZWQgb25seSBp
ZiB0aGUgZW5jb2RlciB0eXBlIGlzIERQSS4KVGhpcyBoZWxwcyB0byBtb3ZlIHRoZSBEUEktcmVs
YXRlZCBwaW5jdHJsIGNvbmZpZ3VyYXRpb24gZnJvbQphbGwgdGhlIHBhbmVsIG9yIGJyaWRnZSB0
byB0aGUgTFREQyBkdCBub2RlLgoKU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5u
aWNrLmZlcnRyZUBzdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAzNSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDM1IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCmluZGV4IDNhYjRmYmYuLjFjNGZkZTAgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0v
bHRkYy5jCkBAIC0xNSw2ICsxNSw3IEBACiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5j
bHVkZSA8bGludXgvb2ZfYWRkcmVzcy5oPgogI2luY2x1ZGUgPGxpbnV4L29mX2dyYXBoLmg+Cisj
aW5jbHVkZSA8bGludXgvcGluY3RybC9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRm
b3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KICNpbmNsdWRlIDxs
aW51eC9yZXNldC5oPgpAQCAtMTA0MCw2ICsxMDQxLDM2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHJtX2VuY29kZXJfZnVuY3MgbHRkY19lbmNvZGVyX2Z1bmNzID0gewogCS5kZXN0cm95ID0gZHJt
X2VuY29kZXJfY2xlYW51cCwKIH07CiAKK3N0YXRpYyB2b2lkIGx0ZGNfZW5jb2Rlcl9kaXNhYmxl
KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKK3sKKwlzdHJ1Y3QgZHJtX2RldmljZSAqZGRl
diA9IGVuY29kZXItPmRldjsKKworCURSTV9ERUJVR19EUklWRVIoIlxuIik7CisKKwkvKiBTZXQg
dG8gc2xlZXAgc3RhdGUgdGhlIHBpbmN0cmwgd2hhdGV2ZXIgdHlwZSBvZiBlbmNvZGVyICovCisJ
cGluY3RybF9wbV9zZWxlY3Rfc2xlZXBfc3RhdGUoZGRldi0+ZGV2KTsKK30KKworc3RhdGljIHZv
aWQgbHRkY19lbmNvZGVyX2VuYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCit7CisJ
c3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBlbmNvZGVyLT5kZXY7CisKKwlEUk1fREVCVUdfRFJJ
VkVSKCJcbiIpOworCisJLyoKKwkgKiBTZXQgdG8gZGVmYXVsdCBzdGF0ZSB0aGUgcGluY3RybCBv
bmx5IHdpdGggRFBJIHR5cGUuCisJICogT3RoZXJzIHR5cGVzIGxpa2UgRFNJLCBkb24ndCBuZWVk
IHBpbmN0cmwgZHVlIHRvCisJICogaW50ZXJuYWwgYnJpZGdlICh0aGUgc2lnbmFscyBkbyBub3Qg
Y29tZSBvdXQgb2YgdGhlIGNoaXBzZXQpLgorCSAqLworCWlmIChlbmNvZGVyLT5lbmNvZGVyX3R5
cGUgPT0gRFJNX01PREVfRU5DT0RFUl9EUEkpCisJCXBpbmN0cmxfcG1fc2VsZWN0X2RlZmF1bHRf
c3RhdGUoZGRldi0+ZGV2KTsKK30KKworc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9o
ZWxwZXJfZnVuY3MgbHRkY19lbmNvZGVyX2hlbHBlcl9mdW5jcyA9IHsKKwkuZGlzYWJsZSA9IGx0
ZGNfZW5jb2Rlcl9kaXNhYmxlLAorCS5lbmFibGUgPSBsdGRjX2VuY29kZXJfZW5hYmxlLAorfTsK
Kwogc3RhdGljIGludCBsdGRjX2VuY29kZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiwg
c3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKIHsKIAlzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29k
ZXI7CkBAIC0xMDU1LDYgKzEwODYsOCBAQCBzdGF0aWMgaW50IGx0ZGNfZW5jb2Rlcl9pbml0KHN0
cnVjdCBkcm1fZGV2aWNlICpkZGV2LCBzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogCWRybV9l
bmNvZGVyX2luaXQoZGRldiwgZW5jb2RlciwgJmx0ZGNfZW5jb2Rlcl9mdW5jcywKIAkJCSBEUk1f
TU9ERV9FTkNPREVSX0RQSSwgTlVMTCk7CiAKKwlkcm1fZW5jb2Rlcl9oZWxwZXJfYWRkKGVuY29k
ZXIsICZsdGRjX2VuY29kZXJfaGVscGVyX2Z1bmNzKTsKKwogCXJldCA9IGRybV9icmlkZ2VfYXR0
YWNoKGVuY29kZXIsIGJyaWRnZSwgTlVMTCk7CiAJaWYgKHJldCkgewogCQlkcm1fZW5jb2Rlcl9j
bGVhbnVwKGVuY29kZXIpOwpAQCAtMTI4MCw2ICsxMzEzLDggQEAgaW50IGx0ZGNfbG9hZChzdHJ1
Y3QgZHJtX2RldmljZSAqZGRldikKIAogCWNsa19kaXNhYmxlX3VucHJlcGFyZShsZGV2LT5waXhl
bF9jbGspOwogCisJcGluY3RybF9wbV9zZWxlY3Rfc2xlZXBfc3RhdGUoZGRldi0+ZGV2KTsKKwog
CXBtX3J1bnRpbWVfZW5hYmxlKGRkZXYtPmRldik7CiAKIAlyZXR1cm4gMDsKLS0gCjIuNy40Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
