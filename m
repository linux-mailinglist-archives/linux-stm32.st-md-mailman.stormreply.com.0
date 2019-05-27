Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5E52B208
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 12:22:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9B1FC5AB78
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 10:22:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CDABC5AB77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2019 10:22:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4RAGcSe031336; Mon, 27 May 2019 12:21:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=K9MPddInRylWsZUKTiMMozhp1doQ8Ls5xxWg0TmbCm0=;
 b=ulVHYNCWpNB/fmvKmxz1BPx6VyZtV6zgHD6llj10aA0P4+8hLCp+5s5tR86b2ITOfLdX
 +d8IbtKqMp2+0HDyn8JKXrtes1np928OvwMtOG4GgWsfC7Y+KvTrj5y+ktExn62V8bNf
 wmH6NK2YiaKzVFREdamSbTbiCJMIJzOvsIeqRCjolGpwcQJ4CiotjC0a/ugjwyLpsaRj
 OdxEobI8380pMauJ6Sec2UhcD2T3H0wgYLppei5lW2K1wRjO5wgASVXO2n6YJRk5BnKf
 kf3NPWCNB8HdCTIFmGFg8s+lqyv9IMC+m7Hyp8IQTUMs6a1CHonpSEyw9HLapDyVGtY3 ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sptu9jjhh-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 27 May 2019 12:21:48 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A3C7E34;
 Mon, 27 May 2019 10:21:47 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 78BE32804;
 Mon, 27 May 2019 10:21:47 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 27 May
 2019 12:21:47 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 27 May 2019 12:21:46
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
Date: Mon, 27 May 2019 12:21:38 +0200
Message-ID: <1558952499-15418-2-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558952499-15418-1-git-send-email-yannick.fertre@st.com>
References: <1558952499-15418-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-27_07:, , signatures=0
Subject: [Linux-stm32] [PATCH v1 1/2] drm/bridge/synopsys: dsi: add power
	on/off optional phy ops
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

QWRkIHBvd2VyIG9uICYgb2ZmIG9wdGlvbmFsIHBoeXNpY2FsIG9wZXJhdGlvbiBmdW5jdGlvbnMs
IGhlbHBmdWwgdG8KcHJvZ3JhbSBzcGVjaWZpYyByZWdpc3RlcnMgb2YgdGhlIERTSSBwaHlzaWNh
bCBwYXJ0LgoKU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBz
dC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5j
IHwgOCArKysrKysrKwogaW5jbHVkZS9kcm0vYnJpZGdlL2R3X21pcGlfZHNpLmggICAgICAgICAg
ICAgIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jCmluZGV4IGU5MTVhZTguLjVi
YjY3NmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlw
aS1kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNp
LmMKQEAgLTc3NSw2ICs3NzUsMTAgQEAgc3RhdGljIHZvaWQgZHdfbWlwaV9kc2lfY2xlYXJfZXJy
KHN0cnVjdCBkd19taXBpX2RzaSAqZHNpKQogc3RhdGljIHZvaWQgZHdfbWlwaV9kc2lfYnJpZGdl
X3Bvc3RfZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogewogCXN0cnVjdCBkd19t
aXBpX2RzaSAqZHNpID0gYnJpZGdlX3RvX2RzaShicmlkZ2UpOworCWNvbnN0IHN0cnVjdCBkd19t
aXBpX2RzaV9waHlfb3BzICpwaHlfb3BzID0gZHNpLT5wbGF0X2RhdGEtPnBoeV9vcHM7CisKKwlp
ZiAocGh5X29wcy0+cG93ZXJfb2ZmKQorCQlwaHlfb3BzLT5wb3dlcl9vZmYoZHNpLT5wbGF0X2Rh
dGEtPnByaXZfZGF0YSk7CiAKIAkvKgogCSAqIFN3aXRjaCB0byBjb21tYW5kIG1vZGUgYmVmb3Jl
IHBhbmVsLWJyaWRnZSBwb3N0X2Rpc2FibGUgJgpAQCAtODc0LDExICs4NzgsMTUgQEAgc3RhdGlj
IHZvaWQgZHdfbWlwaV9kc2lfYnJpZGdlX21vZGVfc2V0KHN0cnVjdCBkcm1fYnJpZGdlICpicmlk
Z2UsCiBzdGF0aWMgdm9pZCBkd19taXBpX2RzaV9icmlkZ2VfZW5hYmxlKHN0cnVjdCBkcm1fYnJp
ZGdlICpicmlkZ2UpCiB7CiAJc3RydWN0IGR3X21pcGlfZHNpICpkc2kgPSBicmlkZ2VfdG9fZHNp
KGJyaWRnZSk7CisJY29uc3Qgc3RydWN0IGR3X21pcGlfZHNpX3BoeV9vcHMgKnBoeV9vcHMgPSBk
c2ktPnBsYXRfZGF0YS0+cGh5X29wczsKIAogCS8qIFN3aXRjaCB0byB2aWRlbyBtb2RlIGZvciBw
YW5lbC1icmlkZ2UgZW5hYmxlICYgcGFuZWwgZW5hYmxlICovCiAJZHdfbWlwaV9kc2lfc2V0X21v
ZGUoZHNpLCBNSVBJX0RTSV9NT0RFX1ZJREVPKTsKIAlpZiAoZHNpLT5zbGF2ZSkKIAkJZHdfbWlw
aV9kc2lfc2V0X21vZGUoZHNpLT5zbGF2ZSwgTUlQSV9EU0lfTU9ERV9WSURFTyk7CisKKwlpZiAo
cGh5X29wcy0+cG93ZXJfb24pCisJCXBoeV9vcHMtPnBvd2VyX29uKGRzaS0+cGxhdF9kYXRhLT5w
cml2X2RhdGEpOwogfQogCiBzdGF0aWMgZW51bSBkcm1fbW9kZV9zdGF0dXMKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL2JyaWRnZS9kd19taXBpX2RzaS5oIGIvaW5jbHVkZS9kcm0vYnJpZGdlL2R3
X21pcGlfZHNpLmgKaW5kZXggN2QzZGQ2OS4uZGY2ZWRhNiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9k
cm0vYnJpZGdlL2R3X21pcGlfZHNpLmgKKysrIGIvaW5jbHVkZS9kcm0vYnJpZGdlL2R3X21pcGlf
ZHNpLmgKQEAgLTE0LDYgKzE0LDggQEAgc3RydWN0IGR3X21pcGlfZHNpOwogCiBzdHJ1Y3QgZHdf
bWlwaV9kc2lfcGh5X29wcyB7CiAJaW50ICgqaW5pdCkodm9pZCAqcHJpdl9kYXRhKTsKKwl2b2lk
ICgqcG93ZXJfb24pKHZvaWQgKnByaXZfZGF0YSk7CisJdm9pZCAoKnBvd2VyX29mZikodm9pZCAq
cHJpdl9kYXRhKTsKIAlpbnQgKCpnZXRfbGFuZV9tYnBzKSh2b2lkICpwcml2X2RhdGEsCiAJCQkg
ICAgIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlLAogCQkJICAgICB1bnNpZ25l
ZCBsb25nIG1vZGVfZmxhZ3MsIHUzMiBsYW5lcywgdTMyIGZvcm1hdCwKLS0gCjIuNy40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
