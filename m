Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F88142C7D
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jan 2020 14:47:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6919CC36B0C;
	Mon, 20 Jan 2020 13:47:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60556C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2020 13:47:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00KDbQJC019186; Mon, 20 Jan 2020 14:47:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=RQpTI3zFQW+ChdmHDDySJ08NSVtL9lOc5ZIv6JMCj74=;
 b=gj+P8sv4Kh+ikTblV4bXosCD65PqoiQrtdSjmKPqhDTn9Famk0YKrnA5y9NbgGK4AgdB
 5LUwZgXMEyEQGIGWjY7HQhZvgLnifjWudJFodUW5bv0F0gR1FJSDA2etBRn3jutiq5zn
 q1kLb+ahj90oshPM/IUOpXMWP0TPWkZuhWzx11JOoUNcEefAE4slkoxsVH7vDrfUdCOK
 WBgbOJ5raNdUAtk/hjIypmiNSZsU8pblgD9dYRDUFHPBlnqZmfWZZ4J7J9AaKoraRgGP
 uKvNxHrMvOuXg9skKPOeZmj8W0eqycQdYGyMS3DquZPfoDbyKTTJnQxiNAk2T2AjidYt UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkssnsg0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jan 2020 14:47:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C7356100034;
 Mon, 20 Jan 2020 14:47:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 916642BF9A8;
 Mon, 20 Jan 2020 14:47:00 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 20 Jan 2020 14:47:00 +0100
From: Yannick Fertre <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 20 Jan 2020 14:46:53 +0100
Message-ID: <1579528013-28445-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-20_02:2020-01-20,
 2020-01-20 signatures=0
Subject: [Linux-stm32] [PATCH] drm/stm: ltdc: enable/disable depends on
	encoder
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

RnJvbTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+CgpXaGVuIGNvbm5l
Y3RlZCB0byBhIGRzaSBob3N0LCB0aGUgbHRkYyBkaXNwbGF5IGNvbnRyb2xsZXIKbXVzdCBzZW5k
IGZyYW1lcyBvbmx5IGFmdGVyIHRoZSBlbmQgb2YgdGhlIGRzaSBwYW5lbAppbml0aWFsaXphdGlv
biB0byBhdm9pZCBlcnJvcnMgd2hlbiB0aGUgZHNpIGhvc3Qgc2VuZHMKY29tbWFuZHMgdG8gdGhl
IGRzaSBwYW5lbCAoZHNpIHB4IGZpZm8gZnVsbCkuClRvIGF2b2lkIHRoaXMgaXNzdWUsIHRoZSBk
aXNwbGF5IGNvbnRyb2xsZXIgbXVzdCBiZQplbmFibGVkL2Rpc2FibGVkIHdoZW4gdGhlIGVuY29k
ZXIgaXMgZW5hYmxlZC9kaXNhYmxlZC4KClNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHLDqSA8
eWFubmljay5mZXJ0cmVAc3QuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIHwg
MTQgKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgYi9kcml2
ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwppbmRleCA3MTlkZmM1Li45ZWYxMjVkIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0
ZGMuYwpAQCAtNDM3LDkgKzQzNyw2IEBAIHN0YXRpYyB2b2lkIGx0ZGNfY3J0Y19hdG9taWNfZW5h
YmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAkvKiBDb21taXQgc2hhZG93IHJlZ2lzdGVycyA9
IHVwZGF0ZSBwbGFuZXMgYXQgbmV4dCB2YmxhbmsgKi8KIAlyZWdfc2V0KGxkZXYtPnJlZ3MsIExU
RENfU1JDUiwgU1JDUl9WQlIpOwogCi0JLyogRW5hYmxlIExUREMgKi8KLQlyZWdfc2V0KGxkZXYt
PnJlZ3MsIExURENfR0NSLCBHQ1JfTFREQ0VOKTsKLQogCWRybV9jcnRjX3ZibGFua19vbihjcnRj
KTsKIH0KIApAQCAtNDUzLDkgKzQ1MCw2IEBAIHN0YXRpYyB2b2lkIGx0ZGNfY3J0Y19hdG9taWNf
ZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAKIAlkcm1fY3J0Y192Ymxhbmtfb2ZmKGNy
dGMpOwogCi0JLyogZGlzYWJsZSBMVERDICovCi0JcmVnX2NsZWFyKGxkZXYtPnJlZ3MsIExURENf
R0NSLCBHQ1JfTFREQ0VOKTsKLQogCS8qIGRpc2FibGUgSVJRICovCiAJcmVnX2NsZWFyKGxkZXYt
PnJlZ3MsIExURENfSUVSLCBJRVJfUlJJRSB8IElFUl9GVUlFIHwgSUVSX1RFUlJJRSk7CiAKQEAg
LTEwNTgsOSArMTA1MiwxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2Z1bmNz
IGx0ZGNfZW5jb2Rlcl9mdW5jcyA9IHsKIHN0YXRpYyB2b2lkIGx0ZGNfZW5jb2Rlcl9kaXNhYmxl
KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGRl
diA9IGVuY29kZXItPmRldjsKKwlzdHJ1Y3QgbHRkY19kZXZpY2UgKmxkZXYgPSBkZGV2LT5kZXZf
cHJpdmF0ZTsKIAogCURSTV9ERUJVR19EUklWRVIoIlxuIik7CiAKKwkvKiBEaXNhYmxlIExUREMg
Ki8KKwlyZWdfY2xlYXIobGRldi0+cmVncywgTFREQ19HQ1IsIEdDUl9MVERDRU4pOworCiAJLyog
U2V0IHRvIHNsZWVwIHN0YXRlIHRoZSBwaW5jdHJsIHdoYXRldmVyIHR5cGUgb2YgZW5jb2RlciAq
LwogCXBpbmN0cmxfcG1fc2VsZWN0X3NsZWVwX3N0YXRlKGRkZXYtPmRldik7CiB9CkBAIC0xMDY4
LDYgKzEwNjYsNyBAQCBzdGF0aWMgdm9pZCBsdGRjX2VuY29kZXJfZGlzYWJsZShzdHJ1Y3QgZHJt
X2VuY29kZXIgKmVuY29kZXIpCiBzdGF0aWMgdm9pZCBsdGRjX2VuY29kZXJfZW5hYmxlKHN0cnVj
dCBkcm1fZW5jb2RlciAqZW5jb2RlcikKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9IGVu
Y29kZXItPmRldjsKKwlzdHJ1Y3QgbHRkY19kZXZpY2UgKmxkZXYgPSBkZGV2LT5kZXZfcHJpdmF0
ZTsKIAogCURSTV9ERUJVR19EUklWRVIoIlxuIik7CiAKQEAgLTEwNzgsNiArMTA3Nyw5IEBAIHN0
YXRpYyB2b2lkIGx0ZGNfZW5jb2Rlcl9lbmFibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVy
KQogCSAqLwogCWlmIChlbmNvZGVyLT5lbmNvZGVyX3R5cGUgPT0gRFJNX01PREVfRU5DT0RFUl9E
UEkpCiAJCXBpbmN0cmxfcG1fc2VsZWN0X2RlZmF1bHRfc3RhdGUoZGRldi0+ZGV2KTsKKworCS8q
IEVuYWJsZSBMVERDICovCisJcmVnX3NldChsZGV2LT5yZWdzLCBMVERDX0dDUiwgR0NSX0xURENF
Tik7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfaGVscGVyX2Z1bmNzIGx0
ZGNfZW5jb2Rlcl9oZWxwZXJfZnVuY3MgPSB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
