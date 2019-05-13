Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3141B8D2
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 16:44:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED00BC24024
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 14:44:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E614C24028
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 14:44:12 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4DEaa6P007488; Mon, 13 May 2019 16:44:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=0D33WB7ykxwjz7ZxWk061dUJhKKNWiiUTuuAQcLIukg=;
 b=i5YocPpRwmJ4yR5G6iJ8Dh/v+Nry+AKj6u0IpEVsiQ6CbqgLm/3mEesHMmtAEujyJ6yo
 HW6+OJmvRz/rJ8gvTTgAQKuHvMdrAd8SeEtmnGU89Xzl5HTrv5z7CVH/Wyn1wycRwqu7
 /OQbnRKtksF5vqpnxAX+mTlpShPhXKZOxtbuLL+OD+cJgzb8VLQATdbRof9rXMmGcjvs
 ALGogqJKuNxyHBgVxSRJYBvbiR1clMevjtujE6/CnxGpgdVowpPGMRuE529iwlTWfuUq
 Juy7S5FgXppIFNTdf45DRI0/X+CATh2Nqc8hJc/EW1jOUlUH/swuEdoKVFGoKjbeh4uA lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sdkuykjm9-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 13 May 2019 16:44:05 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3F7CB31;
 Mon, 13 May 2019 14:44:05 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D99B2897;
 Mon, 13 May 2019 14:44:05 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 13 May
 2019 16:44:05 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 13 May 2019 16:44:04
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 13 May 2019 16:42:19 +0200
Message-ID: <1557758539-28748-3-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557758539-28748-1-git-send-email-yannick.fertre@st.com>
References: <1557758539-28748-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-13_07:, , signatures=0
Subject: [Linux-stm32] [PATCH v3 2/2] drm/stm: dsi: add support of an
	regulator
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

QWRkIHN1cHBvcnQgb2YgYW4gcmVndWxhdG9yIGZvciB0aGUgcGh5IHBhcnQgb2YgdGhlIERTSQpj
b250cm9sbGVyLgoKU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRy
ZUBzdC5jb20+CkFja2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMgfCA1MyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9k
d19taXBpX2RzaS1zdG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMK
aW5kZXggMWJlZjczZS4uMDExZTUxMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9k
d19taXBpX2RzaS1zdG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0
bS5jCkBAIC05LDYgKzksNyBAQAogI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgogI2luY2x1ZGUgPGxp
bnV4L2lvcG9sbC5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgorI2luY2x1ZGUgPGxpbnV4
L3JlZ3VsYXRvci9jb25zdW1lci5oPgogI2luY2x1ZGUgPGRybS9kcm1QLmg+CiAjaW5jbHVkZSA8
ZHJtL2RybV9taXBpX2RzaS5oPgogI2luY2x1ZGUgPGRybS9icmlkZ2UvZHdfbWlwaV9kc2kuaD4K
QEAgLTc2LDYgKzc3LDcgQEAgc3RydWN0IGR3X21pcGlfZHNpX3N0bSB7CiAJdTMyIGh3X3ZlcnNp
b247CiAJaW50IGxhbmVfbWluX2ticHM7CiAJaW50IGxhbmVfbWF4X2ticHM7CisJc3RydWN0IHJl
Z3VsYXRvciAqdmRkX3N1cHBseTsKIH07CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBkc2lfd3JpdGUo
c3RydWN0IGR3X21pcGlfZHNpX3N0bSAqZHNpLCB1MzIgcmVnLCB1MzIgdmFsKQpAQCAtMzE4LDE3
ICszMjAsMzEgQEAgc3RhdGljIGludCBkd19taXBpX2RzaV9zdG1fcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAkJcmV0dXJuIFBUUl9FUlIoZHNpLT5iYXNlKTsKIAl9CiAKKwlk
c2ktPnZkZF9zdXBwbHkgPSBkZXZtX3JlZ3VsYXRvcl9nZXRfb3B0aW9uYWwoZGV2LCAicGh5LWRz
aSIpOworCWlmIChJU19FUlIoZHNpLT52ZGRfc3VwcGx5KSkgeworCQlyZXQgPSBQVFJfRVJSKGRz
aS0+dmRkX3N1cHBseSk7CisJCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikKKwkJCURSTV9FUlJP
UigiRmFpbGVkIHRvIHJlcXVlc3QgcmVndWxhdG9yOiAlZFxuIiwgcmV0KTsKKwkJcmV0dXJuIHJl
dDsKKwl9CisKKwlyZXQgPSByZWd1bGF0b3JfZW5hYmxlKGRzaS0+dmRkX3N1cHBseSk7CisJaWYg
KHJldCkgeworCQlEUk1fRVJST1IoIkZhaWxlZCB0byBlbmFibGUgcmVndWxhdG9yOiAlZFxuIiwg
cmV0KTsKKwkJcmV0dXJuIHJldDsKKwl9CisKIAlkc2ktPnBsbHJlZl9jbGsgPSBkZXZtX2Nsa19n
ZXQoZGV2LCAicmVmIik7CiAJaWYgKElTX0VSUihkc2ktPnBsbHJlZl9jbGspKSB7CiAJCXJldCA9
IFBUUl9FUlIoZHNpLT5wbGxyZWZfY2xrKTsKLQkJZGV2X2VycihkZXYsICJVbmFibGUgdG8gZ2V0
IHBsbCByZWZlcmVuY2UgY2xvY2s6ICVkXG4iLCByZXQpOwotCQlyZXR1cm4gcmV0OworCQlEUk1f
RVJST1IoIlVuYWJsZSB0byBnZXQgcGxsIHJlZmVyZW5jZSBjbG9jazogJWRcbiIsIHJldCk7CisJ
CWdvdG8gZXJyX2Nsa19nZXQ7CiAJfQogCiAJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGRzaS0+
cGxscmVmX2Nsayk7CiAJaWYgKHJldCkgewotCQlkZXZfZXJyKGRldiwgIiVzOiBGYWlsZWQgdG8g
ZW5hYmxlIHBsbHJlZl9jbGtcbiIsIF9fZnVuY19fKTsKLQkJcmV0dXJuIHJldDsKKwkJRFJNX0VS
Uk9SKCJGYWlsZWQgdG8gZW5hYmxlIHBsbHJlZl9jbGtcbiIpOworCQlnb3RvIGVycl9jbGtfZ2V0
OwogCX0KIAogCWR3X21pcGlfZHNpX3N0bV9wbGF0X2RhdGEuYmFzZSA9IGRzaS0+YmFzZTsKQEAg
LTMzOSwxOSArMzU1LDI4IEBAIHN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfc3RtX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJZHNpLT5kc2kgPSBkd19taXBpX2RzaV9wcm9iZShw
ZGV2LCAmZHdfbWlwaV9kc2lfc3RtX3BsYXRfZGF0YSk7CiAJaWYgKElTX0VSUihkc2ktPmRzaSkp
IHsKIAkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gaW5pdGlhbGl6ZSBtaXBpIGRzaSBob3N0XG4iKTsK
LQkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRzaS0+cGxscmVmX2Nsayk7Ci0JCXJldHVybiBQVFJf
RVJSKGRzaS0+ZHNpKTsKKwkJcmV0ID0gUFRSX0VSUihkc2ktPmRzaSk7CisJCWdvdG8gZXJyX2Rz
aV9wcm9iZTsKIAl9CiAKIAlyZXR1cm4gMDsKKworZXJyX2RzaV9wcm9iZToKKwljbGtfZGlzYWJs
ZV91bnByZXBhcmUoZHNpLT5wbGxyZWZfY2xrKTsKK2Vycl9jbGtfZ2V0OgorCXJlZ3VsYXRvcl9k
aXNhYmxlKGRzaS0+dmRkX3N1cHBseSk7CisKKwlyZXR1cm4gcmV0OworCiB9CiAKIHN0YXRpYyBp
bnQgZHdfbWlwaV9kc2lfc3RtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
ewogCXN0cnVjdCBkd19taXBpX2RzaV9zdG0gKmRzaSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBk
ZXYpOwogCi0JY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRzaS0+cGxscmVmX2Nsayk7CiAJZHdfbWlw
aV9kc2lfcmVtb3ZlKGRzaS0+ZHNpKTsKKwljbGtfZGlzYWJsZV91bnByZXBhcmUoZHNpLT5wbGxy
ZWZfY2xrKTsKKwlyZWd1bGF0b3JfZGlzYWJsZShkc2ktPnZkZF9zdXBwbHkpOwogCiAJcmV0dXJu
IDA7CiB9CkBAIC0zNjMsNiArMzg4LDcgQEAgc3RhdGljIGludCBfX21heWJlX3VudXNlZCBkd19t
aXBpX2RzaV9zdG1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJRFJNX0RFQlVHX0RSSVZF
UigiXG4iKTsKIAogCWNsa19kaXNhYmxlX3VucHJlcGFyZShkc2ktPnBsbHJlZl9jbGspOworCXJl
Z3VsYXRvcl9kaXNhYmxlKGRzaS0+dmRkX3N1cHBseSk7CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTM3
MCwxMCArMzk2LDIxIEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgZHdfbWlwaV9kc2lfc3Rt
X3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogc3RhdGljIGludCBfX21heWJlX3VudXNlZCBk
d19taXBpX2RzaV9zdG1fcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgZHdf
bWlwaV9kc2lfc3RtICpkc2kgPSBkd19taXBpX2RzaV9zdG1fcGxhdF9kYXRhLnByaXZfZGF0YTsK
KwlpbnQgcmV0OwogCiAJRFJNX0RFQlVHX0RSSVZFUigiXG4iKTsKIAotCWNsa19wcmVwYXJlX2Vu
YWJsZShkc2ktPnBsbHJlZl9jbGspOworCXJldCA9IHJlZ3VsYXRvcl9lbmFibGUoZHNpLT52ZGRf
c3VwcGx5KTsKKwlpZiAocmV0KSB7CisJCURSTV9FUlJPUigiRmFpbGVkIHRvIGVuYWJsZSByZWd1
bGF0b3I6ICVkXG4iLCByZXQpOworCQlyZXR1cm4gcmV0OworCX0KKworCXJldCA9IGNsa19wcmVw
YXJlX2VuYWJsZShkc2ktPnBsbHJlZl9jbGspOworCWlmIChyZXQpIHsKKwkJRFJNX0VSUk9SKCJG
YWlsZWQgdG8gZW5hYmxlIHBsbHJlZl9jbGtcbiIpOworCQlyZXR1cm4gcmV0OworCX0KIAogCXJl
dHVybiAwOwogfQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
