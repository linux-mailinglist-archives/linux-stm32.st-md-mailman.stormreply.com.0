Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CF419FB8
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 17:03:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6537FC78F93
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 15:03:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8588C78F92
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 15:03:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AErgJP004964; Fri, 10 May 2019 17:03:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=WEEddrwDkIHLSmRlPP82HL8Zh6nr2g7bNKK4fLQdDyM=;
 b=y9+Lix1ZuXzL5a9DeIi/XePgAd7t9QEb1DElD58ROp5opc6t8id9Mh3aiFqHrUZRlWCG
 6QoABaK9EwTN9ic6cACvXC9QaBPqrV9c6DKUceqVH7lDJEo0Y6jQln+cWOB6TU+2EQ/g
 e+XkNkYamNYwneMZ4ToZQ/xAFxDVsRc2rjW2P3G9Jdi8Zgkcw0nw9XUqlfdDRtQKDL3U
 Ixyxk2Pn8gKIx29sOeopNOrj/n9sWPlKsw6JiRC6NxnDFj/GhX0YILSYAPyrqVWxVY5s
 5abTGLkevqZn7rnF9pOZksOjcREH2PYxQGj9k3VuUq2TWF1JzOpW6dgkqxJXT3v4VLru NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sc9s4k49q-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 17:03:09 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9473F34;
 Fri, 10 May 2019 15:03:08 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7252B2AB8;
 Fri, 10 May 2019 15:03:08 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 10 May
 2019 17:03:08 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 10 May 2019 17:03:07
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
Date: Fri, 10 May 2019 17:02:59 +0200
Message-ID: <1557500579-19720-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Subject: [Linux-stm32] [PATCH] drm/stm: dsi: check hardware version
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

Q2hlY2sgdmVyc2lvbiBvZiBEU0kgaGFyZHdhcmUgSVAuIE9ubHkgdmVyc2lvbnMgMS4zMCAmIDEu
MzEKYXJlIHN1cHBvcnRlZC4KClNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFubmlj
ay5mZXJ0cmVAc3QuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3Rt
LmMgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0
bS9kd19taXBpX2RzaS1zdG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3Rt
LmMKaW5kZXggMjJiZDA5NS4uMjkxMDVlOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0
bS9kd19taXBpX2RzaS1zdG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNp
LXN0bS5jCkBAIC0yMjcsNyArMjI3LDYgQEAgZHdfbWlwaV9kc2lfZ2V0X2xhbmVfbWJwcyh2b2lk
ICpwcml2X2RhdGEsIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlLAogCXUzMiB2
YWw7CiAKIAkvKiBVcGRhdGUgbGFuZSBjYXBhYmlsaXRpZXMgYWNjb3JkaW5nIHRvIGh3IHZlcnNp
b24gKi8KLQlkc2ktPmh3X3ZlcnNpb24gPSBkc2lfcmVhZChkc2ksIERTSV9WRVJTSU9OKSAmIFZF
UlNJT047CiAJZHNpLT5sYW5lX21pbl9rYnBzID0gTEFORV9NSU5fS0JQUzsKIAlkc2ktPmxhbmVf
bWF4X2ticHMgPSBMQU5FX01BWF9LQlBTOwogCWlmIChkc2ktPmh3X3ZlcnNpb24gPT0gSFdWRVJf
MTMxKSB7CkBAIC0zMDYsNiArMzA1LDcgQEAgc3RhdGljIGludCBkd19taXBpX2RzaV9zdG1fcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYg
PSAmcGRldi0+ZGV2OwogCXN0cnVjdCBkd19taXBpX2RzaV9zdG0gKmRzaTsKKwlzdHJ1Y3QgY2xr
ICpwY2xrOwogCXN0cnVjdCByZXNvdXJjZSAqcmVzOwogCWludCByZXQ7CiAKQEAgLTM0Nyw2ICsz
NDcsMjggQEAgc3RhdGljIGludCBkd19taXBpX2RzaV9zdG1fcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAkJZ290byBlcnJfY2xrX2dldDsKIAl9CiAKKwlwY2xrID0gZGV2bV9j
bGtfZ2V0KGRldiwgInBjbGsiKTsKKwlpZiAoSVNfRVJSKHBjbGspKSB7CisJCXJldCA9IFBUUl9F
UlIocGNsayk7CisJCURSTV9FUlJPUigiVW5hYmxlIHRvIGdldCBwZXJpcGhlcmFsIGNsb2NrOiAl
ZFxuIiwgcmV0KTsKKwkJZ290byBlcnJfZHNpX3Byb2JlOworCX0KKworCXJldCA9IGNsa19wcmVw
YXJlX2VuYWJsZShwY2xrKTsKKwlpZiAocmV0KSB7CisJCURSTV9FUlJPUigiJXM6IEZhaWxlZCB0
byBlbmFibGUgcGVyaXBoZXJhbCBjbGtcbiIsIF9fZnVuY19fKTsKKwkJZ290byBlcnJfZHNpX3By
b2JlOworCX0KKworCWRzaS0+aHdfdmVyc2lvbiA9IGRzaV9yZWFkKGRzaSwgRFNJX1ZFUlNJT04p
ICYgVkVSU0lPTjsKKwljbGtfZGlzYWJsZV91bnByZXBhcmUocGNsayk7CisKKwlpZiAoZHNpLT5o
d192ZXJzaW9uICE9IEhXVkVSXzEzMCAmJiBkc2ktPmh3X3ZlcnNpb24gIT0gSFdWRVJfMTMxKSB7
CisJCXJldCA9IC1FTk9ERVY7CisJCURSTV9FUlJPUigiYmFkIGRzaSBoYXJkd2FyZSB2ZXJzaW9u
XG4iKTsKKwkJZ290byBlcnJfZHNpX3Byb2JlOworCX0KKwogCWR3X21pcGlfZHNpX3N0bV9wbGF0
X2RhdGEuYmFzZSA9IGRzaS0+YmFzZTsKIAlkd19taXBpX2RzaV9zdG1fcGxhdF9kYXRhLnByaXZf
ZGF0YSA9IGRzaTsKIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
