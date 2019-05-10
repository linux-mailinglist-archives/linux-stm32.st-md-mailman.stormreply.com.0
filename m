Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEE619FBD
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 17:03:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 742EBC78F95
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 15:03:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 536FBC78F94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 15:03:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AErvPO005029; Fri, 10 May 2019 17:03:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=JVoxbgxa8NXBZqIYaDfKlj5ecVvDm4yDrgscf7mPaSA=;
 b=mcYefJHbsTucP8ibCTTp45khN/3G5jE9jIn5cX/yU+Qh/nm5pf7hDl7S4MuJSxDTBS/V
 Kgdm40nE+3q+Wtf6FgJMHqH2w0kYPTWC7ZU0Tx30AMBYxKypAqE7sdvXF4vxOfHSPIR9
 w+3LRDCblFiocJZZHuFJjUmVPk9ZNMrF05HB0NOb7VdpUxc/fW3BtCfsz+k6UXb+s8IY
 zjPOLQLUeFy2Ie8Akr5wACqvdVs125QYNbKAMa/jDERqfwChKAqUQGG0kdW2l6MjU7Pr
 feEpTJo94+ejVm4jsYzFTAgOUf+f7Y2GmmEyylBe8Pj8keSqcuCiIBkf5iYKkK+QJGe7 Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sc9s4k4b1-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 17:03:23 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CAF1634;
 Fri, 10 May 2019 15:03:22 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF54E2AB9;
 Fri, 10 May 2019 15:03:22 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.361.1; Fri, 10 May
 2019 17:03:22 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 10 May 2019 17:03:21
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
Date: Fri, 10 May 2019 17:03:20 +0200
Message-ID: <1557500600-19771-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Subject: [Linux-stm32] [PATCH] drm/stm: ltdc: remove clk_round_rate comment
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

Q2xrX3JvdW5kX3JhdGUgcmV0dXJucyByb3VuZGVkIGNsb2NrIHdpdGhvdXQgY2hhbmdpbmcKdGhl
IGhhcmR3YXJlIGluIGFueSB3YXkuClRoaXMgZnVuY3Rpb24gY291bGRuJ3QgcmVwbGFjZSBzZXRf
cmF0ZS9nZXRfcmF0ZSBjYWxscy4KVG9kbyBjb21tZW50IGhhcyBiZWVuIHJlbW92ZWQgJiBhIG5l
dyBsb2cgaW5zZXJ0ZWQuCgpTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2su
ZmVydHJlQHN0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8IDEwICsrKy0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
c3RtL2x0ZGMuYwppbmRleCA5NzkxMmUyLi4yZjhhYTJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vc3RtL2x0ZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwpAQCAtNTA3
LDIwICs1MDcsMTYgQEAgc3RhdGljIGJvb2wgbHRkY19jcnRjX21vZGVfZml4dXAoc3RydWN0IGRy
bV9jcnRjICpjcnRjLAogCXN0cnVjdCBsdGRjX2RldmljZSAqbGRldiA9IGNydGNfdG9fbHRkYyhj
cnRjKTsKIAlpbnQgcmF0ZSA9IG1vZGUtPmNsb2NrICogMTAwMDsKIAotCS8qCi0JICogVE9ETyBj
bGtfcm91bmRfcmF0ZSgpIGRvZXMgbm90IHdvcmsgeWV0LiBXaGVuIHJlYWR5LCBpdCBjYW4KLQkg
KiBiZSB1c2VkIGluc3RlYWQgb2YgY2xrX3NldF9yYXRlKCkgdGhlbiBjbGtfZ2V0X3JhdGUoKS4K
LQkgKi8KLQotCWNsa19kaXNhYmxlKGxkZXYtPnBpeGVsX2Nsayk7CiAJaWYgKGNsa19zZXRfcmF0
ZShsZGV2LT5waXhlbF9jbGssIHJhdGUpIDwgMCkgewogCQlEUk1fRVJST1IoIkNhbm5vdCBzZXQg
cmF0ZSAoJWRIeikgZm9yIHBpeGVsIGNsa1xuIiwgcmF0ZSk7CiAJCXJldHVybiBmYWxzZTsKIAl9
Ci0JY2xrX2VuYWJsZShsZGV2LT5waXhlbF9jbGspOwogCiAJYWRqdXN0ZWRfbW9kZS0+Y2xvY2sg
PSBjbGtfZ2V0X3JhdGUobGRldi0+cGl4ZWxfY2xrKSAvIDEwMDA7CiAKKwlEUk1fREVCVUdfRFJJ
VkVSKCJyZXF1ZXN0ZWQgY2xvY2sgJWRrSHosIGFkanVzdGVkIGNsb2NrICVka0h6XG4iLAorCQkJ
IG1vZGUtPmNsb2NrLCBhZGp1c3RlZF9tb2RlLT5jbG9jayk7CisKIAlyZXR1cm4gdHJ1ZTsKIH0K
IAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
