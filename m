Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FF447AA0
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 09:18:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7487FCCBB7D
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 07:18:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE39DCCBB72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2019 07:18:32 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5H7G0ZS016840; Mon, 17 Jun 2019 09:18:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=Ia2/UrCUbgT3bw0BUTt336OAmpb+nVhfRSlDq35fcEs=;
 b=djNFXoDB4cGYOdCBR/WaJaQgc3IkLbr6gG3WsKXYywl2EAUpnCglQjTOgMM3NgTdcALz
 RnyxPh/XODS35rQRIAjo1GYk5FJto0TGQ53PiJItJY2wRMFfvAZMdCihDAVFxzhTwpII
 sQ0yUGmVo4AX4apALbfQbpXmJ0vzkqNRS4KYccRtdBEP6MJaCHobWu9Lla2hxtkktYDZ
 CHvFLsHbYqO/4n6bO6cD1IRs51HsaYrmZdKvYANqCjepEBGKuDPgSR9CvfoUbw7G7k97
 RC5yVFldo0CzjKjNEBoaNniM2SmKQ7oJM50d/KITK4TyI5x9OY5n9bngEEOhonkb1mDL rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t4peu0wyj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 17 Jun 2019 09:18:22 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0C73034;
 Mon, 17 Jun 2019 07:18:20 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A7417155B;
 Mon, 17 Jun 2019 07:18:20 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Jun
 2019 09:18:20 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Jun 2019 09:18:20
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
Date: Mon, 17 Jun 2019 09:18:17 +0200
Message-ID: <1560755897-5002-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_05:, , signatures=0
Subject: [Linux-stm32] [PATCH 1/3] drm/stm: drv: fix suspend/resume
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

V2l0aG91dCB0aGlzIGZpeCwgdGhlIHN5c3RlbSBjYW4gbm90IGdvIGluICJzdXNwZW5kIiBtb2Rl
CmR1ZSB0byBhbiBlcnJvciBpbiBkcnZfc3VzcGVuZCBmdW5jdGlvbi4KCkZpeGVzOiAzNWFiNmNm
ICgiZHJtL3N0bTogc3VwcG9ydCBydW50aW1lIHBvd2VyIG1hbmFnZW1lbnQiKQoKU2lnbmVkLW9m
Zi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3N0bS9kcnYuYyB8IDE1ICsrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vc3RtL2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYwppbmRleCA1NjU5NTcy
Li45ZGVlNGU0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMKQEAgLTEzNiw4ICsxMzYsNyBAQCBzdGF0aWMgX19tYXli
ZV91bnVzZWQgaW50IGRydl9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIAlzdHJ1Y3QgbHRk
Y19kZXZpY2UgKmxkZXYgPSBkZGV2LT5kZXZfcHJpdmF0ZTsKIAlzdHJ1Y3QgZHJtX2F0b21pY19z
dGF0ZSAqc3RhdGU7CiAKLQlpZiAoV0FSTl9PTighbGRldi0+c3VzcGVuZF9zdGF0ZSkpCi0JCXJl
dHVybiAtRU5PRU5UOworCVdBUk5fT04obGRldi0+c3VzcGVuZF9zdGF0ZSk7CiAKIAlzdGF0ZSA9
IGRybV9hdG9taWNfaGVscGVyX3N1c3BlbmQoZGRldik7CiAJaWYgKElTX0VSUihzdGF0ZSkpCkBA
IC0xNTUsMTUgKzE1NCwxNyBAQCBzdGF0aWMgX19tYXliZV91bnVzZWQgaW50IGRydl9yZXN1bWUo
c3RydWN0IGRldmljZSAqZGV2KQogCXN0cnVjdCBsdGRjX2RldmljZSAqbGRldiA9IGRkZXYtPmRl
dl9wcml2YXRlOwogCWludCByZXQ7CiAKKwlpZiAoV0FSTl9PTighbGRldi0+c3VzcGVuZF9zdGF0
ZSkpCisJCXJldHVybiAtRU5PRU5UOworCiAJcG1fcnVudGltZV9mb3JjZV9yZXN1bWUoZGV2KTsK
IAlyZXQgPSBkcm1fYXRvbWljX2hlbHBlcl9yZXN1bWUoZGRldiwgbGRldi0+c3VzcGVuZF9zdGF0
ZSk7Ci0JaWYgKHJldCkgeworCWlmIChyZXQpCiAJCXBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZChk
ZXYpOwotCQlsZGV2LT5zdXNwZW5kX3N0YXRlID0gTlVMTDsKLQkJcmV0dXJuIHJldDsKLQl9CiAK
LQlyZXR1cm4gMDsKKwlsZGV2LT5zdXNwZW5kX3N0YXRlID0gTlVMTDsKKworCXJldHVybiByZXQ7
CiB9CiAKIHN0YXRpYyBfX21heWJlX3VudXNlZCBpbnQgZHJ2X3J1bnRpbWVfc3VzcGVuZChzdHJ1
Y3QgZGV2aWNlICpkZXYpCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
