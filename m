Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2491A2B20C
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 12:22:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1AFDC5AB7A
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 10:22:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9F0BC5AB79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2019 10:22:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4RAGcSf031336; Mon, 27 May 2019 12:21:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=wps+SDKyn14/sTW3Eret7RKWvrgnINJUAp0gJ+ptxDk=;
 b=gvnKygsUyE2/7zsLmyK3byjlXUl15AlFFGnZXXay4/tht9zRv0eFUjQgboXgGkVkG6Ju
 h6ku6Z4gIaLCcqeKKfwVIPusDk/0Oy3k+890b3+4a4eN6K/7Wa9E6UX937/Jk0ASBT28
 GIsazNr4pqEgE5PqEB56/cMIKYtdOV2AP+YzakDwVLsDTBBc0d1tmcSwc43jyCFgGZ45
 UuyhgsE9EvSEnT6EvTr4+zJYzQl6Z1n2kVnBN4V/LMmptiT7oARZ9K6focryReCaPmPt
 GNzKaHf/PobBU0uG+2eq0wsvL/C9U6wYA74KR82gQQe4LI8RRhCOwuLAjD1kKNDzKcD1 uQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sptu9jjhj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 27 May 2019 12:21:49 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C31B531;
 Mon, 27 May 2019 10:21:48 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 89C692805;
 Mon, 27 May 2019 10:21:48 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 27 May
 2019 12:21:48 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 27 May 2019 12:21:48
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Sam Ravnborg <sam@ravnborg.org>,
 Yannick Fertre <yannick.fertre@st.com>, Nickey
 Yang <nickey.yang@rock-chips.com>, Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou
 <vincent.abriou@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 27 May 2019 12:21:39 +0200
Message-ID: <1558952499-15418-3-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558952499-15418-1-git-send-email-yannick.fertre@st.com>
References: <1558952499-15418-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-27_07:, , signatures=0
Subject: [Linux-stm32] [PATCH v1 2/2] drm/stm: dsi: add power on/off phy ops
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

VGhlc2UgbmV3IHBoeXNpY2FsIG9wZXJhdGlvbnMgYXJlIGhlbHBmdWwgdG8gcG93ZXJfb24vb2Zm
IHRoZSBkc2kKd3JhcHBlci4gSWYgdGhlIGRzaSB3cmFwcGVyIGlzIHBvd2VyZWQgaW4gdmlkZW8g
bW9kZSwgdGhlIGRpc3BsYXkKY29udHJvbGxlciAobHRkYykgcmVnaXN0ZXIgYWNjZXNzIHdpbGwg
aGFuZyB3aGVuIERTSSBmaWZvcyBhcmUgZnVsbC4KClNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVy
dHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdG0vZHdf
bWlwaV9kc2ktc3RtLmMgfCAyMSArKysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAyMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlw
aV9kc2ktc3RtLmMKaW5kZXggMDFkYjAyMC4uMGFiMzJmZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3
X21pcGlfZHNpLXN0bS5jCkBAIC0yMTAsMTAgKzIxMCwyNyBAQCBzdGF0aWMgaW50IGR3X21pcGlf
ZHNpX3BoeV9pbml0KHZvaWQgKnByaXZfZGF0YSkKIAlpZiAocmV0KQogCQlEUk1fREVCVUdfRFJJ
VkVSKCIhVElNRU9VVCEgd2FpdGluZyBQTEwsIGxldCdzIGNvbnRpbnVlXG4iKTsKIAorCXJldHVy
biAwOworfQorCitzdGF0aWMgdm9pZCBkd19taXBpX2RzaV9waHlfcG93ZXJfb24odm9pZCAqcHJp
dl9kYXRhKQoreworCXN0cnVjdCBkd19taXBpX2RzaV9zdG0gKmRzaSA9IHByaXZfZGF0YTsKKwor
CURSTV9ERUJVR19EUklWRVIoIlxuIik7CisKIAkvKiBFbmFibGUgdGhlIERTSSB3cmFwcGVyICov
CiAJZHNpX3NldChkc2ksIERTSV9XQ1IsIFdDUl9EU0lFTik7Cit9CiAKLQlyZXR1cm4gMDsKK3N0
YXRpYyB2b2lkIGR3X21pcGlfZHNpX3BoeV9wb3dlcl9vZmYodm9pZCAqcHJpdl9kYXRhKQorewor
CXN0cnVjdCBkd19taXBpX2RzaV9zdG0gKmRzaSA9IHByaXZfZGF0YTsKKworCURSTV9ERUJVR19E
UklWRVIoIlxuIik7CisKKwkvKiBEaXNhYmxlIHRoZSBEU0kgd3JhcHBlciAqLworCWRzaV9jbGVh
cihkc2ksIERTSV9XQ1IsIFdDUl9EU0lFTik7CiB9CiAKIHN0YXRpYyBpbnQKQEAgLTI4Nyw2ICsz
MDQsOCBAQCBkd19taXBpX2RzaV9nZXRfbGFuZV9tYnBzKHZvaWQgKnByaXZfZGF0YSwgY29uc3Qg
c3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUsCiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHdf
bWlwaV9kc2lfcGh5X29wcyBkd19taXBpX2RzaV9zdG1fcGh5X29wcyA9IHsKIAkuaW5pdCA9IGR3
X21pcGlfZHNpX3BoeV9pbml0LAorCS5wb3dlcl9vbiA9IGR3X21pcGlfZHNpX3BoeV9wb3dlcl9v
biwKKwkucG93ZXJfb2ZmID0gZHdfbWlwaV9kc2lfcGh5X3Bvd2VyX29mZiwKIAkuZ2V0X2xhbmVf
bWJwcyA9IGR3X21pcGlfZHNpX2dldF9sYW5lX21icHMsCiB9OwogCi0tIAoyLjcuNAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
