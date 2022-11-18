Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AAD62FB23
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Nov 2022 18:06:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC453C6507B;
	Fri, 18 Nov 2022 17:06:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C197C65067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Nov 2022 17:06:45 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AIC9udW020529; Fri, 18 Nov 2022 18:06:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=GEsgskyYzb0RHzR+1jCrcUioio0/GVuMkcP/vFdV+os=;
 b=wiHjAhLR1klYjxzFm5LtzYeDN+ijnuhwKr7z9wQyF407U0ntZFc735hkGdT/T5HUhICT
 Y/bbF3F0Rf6KW5alWcqzrb7e2TGtq9H/9fw5sG5mXjuvosMgEaUY7Si6434lB7SlI1WG
 nGAYbx8qKuyh7gzYxamT18acO9nMnwmPRG76ftTWJ0pWddjYF7hpe12GQDvklakNcP9h
 vECAXCjGjYCnOCFDhLkT3BpnBOrbGeREdfi/Hu0g0qySLkbkN8dX3Oc70uaFW4CKaacf
 TAxbeFEr5ETLPBz1sHh5GZnyaKMN7RsnSHv16PcdxyIjqA6KyB8RBZ4gDj/eTvXwKnRb uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kx0m9d8rt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Nov 2022 18:06:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3599610002A;
 Fri, 18 Nov 2022 18:06:24 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 70E93252241;
 Fri, 18 Nov 2022 18:06:24 +0100 (CET)
Received: from localhost (10.201.20.168) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Fri, 18 Nov
 2022 18:06:24 +0100
From: Valentin Caron <valentin.caron@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 18 Nov 2022 18:06:02 +0100
Message-ID: <20221118170602.1057863-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_04,2022-11-18_01,2022-06-22_01
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] serial: stm32: move dma_request_chan() before
	clk_prepare_enable()
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

SWYgZG1hX3JlcXVlc3RfY2hhbigpIHJldHVybnMgYSBQUk9CRV9ERUZFUiBlcnJvciwgY2xrX2Rp
c2FibGVfdW5wcmVwYXJlKCkKd2lsbCBiZSBjYWxsZWQgYW5kIFVTQVJUIGNsb2NrIHdpbGwgYmUg
ZGlzYWJsZWQuIEJ1dCBlYXJseSBjb25zb2xlIGNhbiBiZQpzdGlsbCBhY3RpdmUgb24gdGhlIHNh
bWUgVVNBUlQuCgpXaGlsZSBtb3ZpbmcgZG1hX3JlcXVlc3RfY2hhbigpIGJlZm9yZSBjbGtfcHJl
cGFyZV9lbmFibGUoKSwgdGhlIGNsb2NrCndvbid0IGJlIHRha2VuIGluIGNhc2Ugb2YgYSBETUEg
UFJPQkVfREVGRVIgZXJyb3IsIGFuZCBzbyBpdCBkb2Vzbid0IG5lZWQKdG8gYmUgZGlzYWJsZWQu
IFRoZW4gVVNBUlQgaXMgc3RpbGwgY2xvY2tlZCBmb3IgZWFybHkgY29uc29sZS4KCkZpeGVzOiBh
Nzc3MGE0YmZjZjQgKCJzZXJpYWw6IHN0bTMyOiBkZWZlciBwcm9iZSBmb3IgZG1hIGRldmljZXMi
KQpSZXBvcnRlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRy
b25peC5kZT4KU2lnbmVkLW9mZi1ieTogVmFsZW50aW4gQ2Fyb24gPHZhbGVudGluLmNhcm9uQGZv
c3Muc3QuY29tPgotLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jIHwgNDcgKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRp
b25zKCspLCAyNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwv
c3RtMzItdXNhcnQuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jCmluZGV4IDI0
ZGVmNzJiMjU2NS4uYTE0OTAwMzNhYTE2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwv
c3RtMzItdXNhcnQuYworKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYwpAQCAt
MTY4MCwyMiArMTY4MCwxMCBAQCBzdGF0aWMgaW50IHN0bTMyX3VzYXJ0X3NlcmlhbF9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWlmICghc3RtMzJwb3J0LT5pbmZvKQogCQly
ZXR1cm4gLUVJTlZBTDsKIAotCXJldCA9IHN0bTMyX3VzYXJ0X2luaXRfcG9ydChzdG0zMnBvcnQs
IHBkZXYpOwotCWlmIChyZXQpCi0JCXJldHVybiByZXQ7Ci0KLQlpZiAoc3RtMzJwb3J0LT53YWtl
dXBfc3JjKSB7Ci0JCWRldmljZV9zZXRfd2FrZXVwX2NhcGFibGUoJnBkZXYtPmRldiwgdHJ1ZSk7
Ci0JCXJldCA9IGRldl9wbV9zZXRfd2FrZV9pcnEoJnBkZXYtPmRldiwgc3RtMzJwb3J0LT5wb3J0
LmlycSk7Ci0JCWlmIChyZXQpCi0JCQlnb3RvIGVycl9kZWluaXRfcG9ydDsKLQl9Ci0KIAlzdG0z
MnBvcnQtPnJ4X2NoID0gZG1hX3JlcXVlc3RfY2hhbigmcGRldi0+ZGV2LCAicngiKTsKLQlpZiAo
UFRSX0VSUihzdG0zMnBvcnQtPnJ4X2NoKSA9PSAtRVBST0JFX0RFRkVSKSB7Ci0JCXJldCA9IC1F
UFJPQkVfREVGRVI7Ci0JCWdvdG8gZXJyX3dha2VpcnE7Ci0JfQorCWlmIChQVFJfRVJSKHN0bTMy
cG9ydC0+cnhfY2gpID09IC1FUFJPQkVfREVGRVIpCisJCXJldHVybiAtRVBST0JFX0RFRkVSOwor
CiAJLyogRmFsbCBiYWNrIGluIGludGVycnVwdCBtb2RlIGZvciBhbnkgbm9uLWRlZmVycmFsIGVy
cm9yICovCiAJaWYgKElTX0VSUihzdG0zMnBvcnQtPnJ4X2NoKSkKIAkJc3RtMzJwb3J0LT5yeF9j
aCA9IE5VTEw7CkBAIC0xNzA5LDYgKzE2OTcsMTcgQEAgc3RhdGljIGludCBzdG0zMl91c2FydF9z
ZXJpYWxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAoSVNfRVJSKHN0
bTMycG9ydC0+dHhfY2gpKQogCQlzdG0zMnBvcnQtPnR4X2NoID0gTlVMTDsKIAorCXJldCA9IHN0
bTMyX3VzYXJ0X2luaXRfcG9ydChzdG0zMnBvcnQsIHBkZXYpOworCWlmIChyZXQpCisJCWdvdG8g
ZXJyX2RtYV90eDsKKworCWlmIChzdG0zMnBvcnQtPndha2V1cF9zcmMpIHsKKwkJZGV2aWNlX3Nl
dF93YWtldXBfY2FwYWJsZSgmcGRldi0+ZGV2LCB0cnVlKTsKKwkJcmV0ID0gZGV2X3BtX3NldF93
YWtlX2lycSgmcGRldi0+ZGV2LCBzdG0zMnBvcnQtPnBvcnQuaXJxKTsKKwkJaWYgKHJldCkKKwkJ
CWdvdG8gZXJyX2RlaW5pdF9wb3J0OworCX0KKwogCWlmIChzdG0zMnBvcnQtPnJ4X2NoICYmIHN0
bTMyX3VzYXJ0X29mX2RtYV9yeF9wcm9iZShzdG0zMnBvcnQsIHBkZXYpKSB7CiAJCS8qIEZhbGwg
YmFjayBpbiBpbnRlcnJ1cHQgbW9kZSAqLwogCQlkbWFfcmVsZWFzZV9jaGFubmVsKHN0bTMycG9y
dC0+cnhfY2gpOwpAQCAtMTc0NSwxOSArMTc0NCwxMSBAQCBzdGF0aWMgaW50IHN0bTMyX3VzYXJ0
X3NlcmlhbF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXBtX3J1bnRpbWVf
c2V0X3N1c3BlbmRlZCgmcGRldi0+ZGV2KTsKIAlwbV9ydW50aW1lX3B1dF9ub2lkbGUoJnBkZXYt
PmRldik7CiAKLQlpZiAoc3RtMzJwb3J0LT50eF9jaCkgeworCWlmIChzdG0zMnBvcnQtPnR4X2No
KQogCQlzdG0zMl91c2FydF9vZl9kbWFfdHhfcmVtb3ZlKHN0bTMycG9ydCwgcGRldik7Ci0JCWRt
YV9yZWxlYXNlX2NoYW5uZWwoc3RtMzJwb3J0LT50eF9jaCk7Ci0JfQotCiAJaWYgKHN0bTMycG9y
dC0+cnhfY2gpCiAJCXN0bTMyX3VzYXJ0X29mX2RtYV9yeF9yZW1vdmUoc3RtMzJwb3J0LCBwZGV2
KTsKIAotZXJyX2RtYV9yeDoKLQlpZiAoc3RtMzJwb3J0LT5yeF9jaCkKLQkJZG1hX3JlbGVhc2Vf
Y2hhbm5lbChzdG0zMnBvcnQtPnJ4X2NoKTsKLQotZXJyX3dha2VpcnE6CiAJaWYgKHN0bTMycG9y
dC0+d2FrZXVwX3NyYykKIAkJZGV2X3BtX2NsZWFyX3dha2VfaXJxKCZwZGV2LT5kZXYpOwogCkBA
IC0xNzY3LDYgKzE3NTgsMTQgQEAgc3RhdGljIGludCBzdG0zMl91c2FydF9zZXJpYWxfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCXN0bTMyX3VzYXJ0X2RlaW5pdF9wb3J0
KHN0bTMycG9ydCk7CiAKK2Vycl9kbWFfdHg6CisJaWYgKHN0bTMycG9ydC0+dHhfY2gpCisJCWRt
YV9yZWxlYXNlX2NoYW5uZWwoc3RtMzJwb3J0LT50eF9jaCk7CisKK2Vycl9kbWFfcng6CisJaWYg
KHN0bTMycG9ydC0+cnhfY2gpCisJCWRtYV9yZWxlYXNlX2NoYW5uZWwoc3RtMzJwb3J0LT5yeF9j
aCk7CisKIAlyZXR1cm4gcmV0OwogfQogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
