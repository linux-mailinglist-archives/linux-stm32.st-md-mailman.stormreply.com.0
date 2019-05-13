Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCC51B6DA
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 15:15:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E2FBC544E0
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 13:15:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24E04C35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 13:15:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4DDCndD024681; Mon, 13 May 2019 15:15:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=z+jHhwBwJ5kIQ/vL9ubJdrHRuDnMR+YPpPiAVmxBKdc=;
 b=SurjwkHWIiIPmx7BHJI1H1JXcGmlUr1FfwyAmMMG6+3nFCzbxK3v6Q0/xWPlo9DWIwxi
 Y5xkj4brF4PVfTyZqGh4kJcDA938QNAV5ii5ud0QFIsleksYQECVRj0+iak9amNTOxDK
 XqsLi5AKlVUPhoaKEYvpNCYKWve6IeOMAEIekWzT6EwnVaMsuxcViwJ+bULzVuIqsyLC
 k2Rik5LIgVGilAams2+uUK/wOatezrSVBmEHLMXWgxHCOHBRzP6wklZyd+Egng6a40yX
 vEFMC02klVKIyEHT8MuewbakJ00aULTDLncv2pFY7mrgeQlJoaTmz6mgcgqUFJWjv4Q/ AQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sek5a54b2-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 13 May 2019 15:15:23 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6BA8A3A;
 Mon, 13 May 2019 13:15:22 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4004B1D84;
 Mon, 13 May 2019 13:15:22 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 13 May
 2019 15:15:22 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 13 May 2019 15:15:21
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
Date: Mon, 13 May 2019 15:15:18 +0200
Message-ID: <1557753318-11218-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-13_07:, , signatures=0
Subject: [Linux-stm32] [PATCH v2] drm/stm: ltdc: remove clk_round_rate
	comment
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
ZmVydHJlQHN0LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6CgktIENsa19lbmFibGUgJiBjbGtfZGlz
YWJsZSBhcmUgbmVlZGVkIGZvciB0aGUgU09DIFNUTTMyRjcKCSAobm90IGZvciBTVE0zMk1QMSku
IEkgcmV0dXJuIHRoaXMgcGFydCBvZiB0aGUgcGF0Y2ggdG8gbWFrZSBzdXJlIHRoZQoJIGRyaXZl
ciBpcyBjb21wYXRpYmxlIHdpdGggYWxsIFNPQyBTVE0zMi4KCiBkcml2ZXJzL2dwdS9kcm0vc3Rt
L2x0ZGMuYyB8IDggKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgYi9k
cml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwppbmRleCA5NzkxMmUyLi4xMTA0ZTc4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3Rt
L2x0ZGMuYwpAQCAtNTA3LDExICs1MDcsNiBAQCBzdGF0aWMgYm9vbCBsdGRjX2NydGNfbW9kZV9m
aXh1cChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJc3RydWN0IGx0ZGNfZGV2aWNlICpsZGV2ID0g
Y3J0Y190b19sdGRjKGNydGMpOwogCWludCByYXRlID0gbW9kZS0+Y2xvY2sgKiAxMDAwOwoKLQkv
KgotCSAqIFRPRE8gY2xrX3JvdW5kX3JhdGUoKSBkb2VzIG5vdCB3b3JrIHlldC4gV2hlbiByZWFk
eSwgaXQgY2FuCi0JICogYmUgdXNlZCBpbnN0ZWFkIG9mIGNsa19zZXRfcmF0ZSgpIHRoZW4gY2xr
X2dldF9yYXRlKCkuCi0JICovCi0KIAljbGtfZGlzYWJsZShsZGV2LT5waXhlbF9jbGspOwogCWlm
IChjbGtfc2V0X3JhdGUobGRldi0+cGl4ZWxfY2xrLCByYXRlKSA8IDApIHsKIAkJRFJNX0VSUk9S
KCJDYW5ub3Qgc2V0IHJhdGUgKCVkSHopIGZvciBwaXhlbCBjbGtcbiIsIHJhdGUpOwpAQCAtNTIx
LDYgKzUxNiw5IEBAIHN0YXRpYyBib29sIGx0ZGNfY3J0Y19tb2RlX2ZpeHVwKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YywKCiAJYWRqdXN0ZWRfbW9kZS0+Y2xvY2sgPSBjbGtfZ2V0X3JhdGUobGRldi0+
cGl4ZWxfY2xrKSAvIDEwMDA7CgorCURSTV9ERUJVR19EUklWRVIoInJlcXVlc3RlZCBjbG9jayAl
ZGtIeiwgYWRqdXN0ZWQgY2xvY2sgJWRrSHpcbiIsCisJCQkgbW9kZS0+Y2xvY2ssIGFkanVzdGVk
X21vZGUtPmNsb2NrKTsKKwogCXJldHVybiB0cnVlOwogfQoKLS0KMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
