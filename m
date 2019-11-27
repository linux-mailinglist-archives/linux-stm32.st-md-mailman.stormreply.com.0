Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B7310AD78
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2019 11:23:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 852F4C36B0B;
	Wed, 27 Nov 2019 10:23:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B5D7C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 10:23:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARAMdUZ021243; Wed, 27 Nov 2019 11:23:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=JJSf8q2JoRexvh5kfOMyzAlAfib54Yh6pgtrZwuFoHs=;
 b=wQcFB9Lm+wS2aIK88V+NQ7mmLRFme4CfBdWQgIrLQdVZ4rPoqIufIkbgpJF4FKdBlDvO
 hj+RQCTLCfeUC3mfAMy0DYu/wGGjrnw+/BEN1m3EO815nBrNWxllwlAAreYqvQ2fvbF/
 M6NHkILX6jN4hJH29UYsZ4jyZelHzZ4LOFFC8AEgLuKJHr3pH/z1OUzUmUd/ZDDw9ysW
 b8C6DuFiOat5k7L5a7vEZQFOPpClz6C5p4WJESDjGxtLTnFhPUvb7YY0YWD1ho2zwDx/
 UEkPA7d1TXCzz7sSafh9LrZDGCy9/jjLtnhG6pRbP7S+fPrH1HY3JxthNCdG8aIic4VP ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2whcxyb0n7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 11:23:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C9AC810002A;
 Wed, 27 Nov 2019 11:23:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 233552B1214;
 Wed, 27 Nov 2019 11:23:40 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 27 Nov 2019 11:23:39 +0100
From: Yannick Fertre <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 27 Nov 2019 11:23:38 +0100
Message-ID: <1574850218-13257-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
Subject: [Linux-stm32] [PATCH] drm/stm: ltdc: move pinctrl to encoder mode
	set
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

RnJvbTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+CgpUaGUgcGluIGNv
bnRyb2wgbXVzdCBiZSBzZXQgdG8gZGVmYXVsdCBhcyBzb29uIGFzIHBvc3NpYmxlIHRvCmVzdGFi
bGlzaCBhIGdvb2QgdmlkZW8gbGluayBiZXR3ZWVuIHR2ICYgYnJpZGdlIGhkbWkKKGVuY29kZXIg
bW9kZSBzZXQgaXMgY2FsbCBiZWZvcmUgZW5jb2RlciBlbmFibGUpLgoKU2lnbmVkLW9mZi1ieTog
WWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vc3RtL2x0ZGMuYyB8IDI0ICsrKysrKysrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3N0bS9sdGRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwppbmRleCA0
OWVmNDA2Li5kYmE4ZTdmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwpAQCAtNDM1LDkgKzQzNSw2IEBAIHN0YXRp
YyB2b2lkIGx0ZGNfY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAkv
KiBDb21taXQgc2hhZG93IHJlZ2lzdGVycyA9IHVwZGF0ZSBwbGFuZXMgYXQgbmV4dCB2Ymxhbmsg
Ki8KIAlyZWdfc2V0KGxkZXYtPnJlZ3MsIExURENfU1JDUiwgU1JDUl9WQlIpOwogCi0JLyogRW5h
YmxlIExUREMgKi8KLQlyZWdfc2V0KGxkZXYtPnJlZ3MsIExURENfR0NSLCBHQ1JfTFREQ0VOKTsK
LQogCWRybV9jcnRjX3ZibGFua19vbihjcnRjKTsKIH0KIApAQCAtNDUxLDkgKzQ0OCw2IEBAIHN0
YXRpYyB2b2lkIGx0ZGNfY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
CiAKIAlkcm1fY3J0Y192Ymxhbmtfb2ZmKGNydGMpOwogCi0JLyogZGlzYWJsZSBMVERDICovCi0J
cmVnX2NsZWFyKGxkZXYtPnJlZ3MsIExURENfR0NSLCBHQ1JfTFREQ0VOKTsKLQogCS8qIGRpc2Fi
bGUgSVJRICovCiAJcmVnX2NsZWFyKGxkZXYtPnJlZ3MsIExURENfSUVSLCBJRVJfUlJJRSB8IElF
Ul9GVUlFIHwgSUVSX1RFUlJJRSk7CiAKQEAgLTEwNDIsOSArMTAzNiwxMyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGRybV9lbmNvZGVyX2Z1bmNzIGx0ZGNfZW5jb2Rlcl9mdW5jcyA9IHsKIHN0YXRp
YyB2b2lkIGx0ZGNfZW5jb2Rlcl9kaXNhYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikK
IHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9IGVuY29kZXItPmRldjsKKwlzdHJ1Y3QgbHRk
Y19kZXZpY2UgKmxkZXYgPSBkZGV2LT5kZXZfcHJpdmF0ZTsKIAogCURSTV9ERUJVR19EUklWRVIo
IlxuIik7CiAKKwkvKiBEaXNhYmxlIExUREMgKi8KKwlyZWdfY2xlYXIobGRldi0+cmVncywgTFRE
Q19HQ1IsIEdDUl9MVERDRU4pOworCiAJLyogU2V0IHRvIHNsZWVwIHN0YXRlIHRoZSBwaW5jdHJs
IHdoYXRldmVyIHR5cGUgb2YgZW5jb2RlciAqLwogCXBpbmN0cmxfcG1fc2VsZWN0X3NsZWVwX3N0
YXRlKGRkZXYtPmRldik7CiB9CkBAIC0xMDUyLDYgKzEwNTAsMTkgQEAgc3RhdGljIHZvaWQgbHRk
Y19lbmNvZGVyX2Rpc2FibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQogc3RhdGljIHZv
aWQgbHRkY19lbmNvZGVyX2VuYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCiB7CiAJ
c3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBlbmNvZGVyLT5kZXY7CisJc3RydWN0IGx0ZGNfZGV2
aWNlICpsZGV2ID0gZGRldi0+ZGV2X3ByaXZhdGU7CisKKwlEUk1fREVCVUdfRFJJVkVSKCJcbiIp
OworCisJLyogRW5hYmxlIExUREMgKi8KKwlyZWdfc2V0KGxkZXYtPnJlZ3MsIExURENfR0NSLCBH
Q1JfTFREQ0VOKTsKK30KKworc3RhdGljIHZvaWQgbHRkY19lbmNvZGVyX21vZGVfc2V0KHN0cnVj
dCBkcm1fZW5jb2RlciAqZW5jb2RlciwKKwkJCQkgIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpt
b2RlLAorCQkJCSAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmFkanVzdGVkX21vZGUpCit7CisJ
c3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBlbmNvZGVyLT5kZXY7CiAKIAlEUk1fREVCVUdfRFJJ
VkVSKCJcbiIpOwogCkBAIC0xMDY3LDYgKzEwNzgsNyBAQCBzdGF0aWMgdm9pZCBsdGRjX2VuY29k
ZXJfZW5hYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZHJtX2VuY29kZXJfaGVscGVyX2Z1bmNzIGx0ZGNfZW5jb2Rlcl9oZWxwZXJfZnVuY3MgPSB7
CiAJLmRpc2FibGUgPSBsdGRjX2VuY29kZXJfZGlzYWJsZSwKIAkuZW5hYmxlID0gbHRkY19lbmNv
ZGVyX2VuYWJsZSwKKwkubW9kZV9zZXQgPSBsdGRjX2VuY29kZXJfbW9kZV9zZXQsCiB9OwogCiBz
dGF0aWMgaW50IGx0ZGNfZW5jb2Rlcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2LCBzdHJ1
Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
