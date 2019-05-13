Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1E41B8D1
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 16:44:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC12DC24023
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 14:44:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C35C4C28E31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 14:44:10 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4DEasOC013962; Mon, 13 May 2019 16:44:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=LzYSQmTyf5/EQ3Y2VGObHjM41SSi7kcFjXdBikk9ZQs=;
 b=D2M3OXToJoyZG8oTLgstVeyWRDkzT6VNeWCXJTfWcpHxyJc4PA7mCzyqvmq4cxu7ryul
 v2OFOyxbcTlKXctUYf+Nc+pYB8SsToee1LFsjh9PVLd9Qrn8Dy8QYwrNkFUsqioiGe6J
 rn0fkNDJnEWSyISi6AlYQmR9gn6baK4Ag3r1apREjv/GDEWNCZw/VbBvhksG4UYLDRTJ
 5hLeg+m3yWtFQK53TihN+izJlWRdwrwJ67x0lBpbNeST3KHQOBbzsDl2eDXeUAajGhwS
 U4NxJCJPdIA6CnQ8KaxP/6etvMDd6/xdzjdLNEUJ/SiaOlvpYrJ/Qy4bsGNmDl/b9QcG Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sdm5tugnt-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 13 May 2019 16:44:04 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EBE9438;
 Mon, 13 May 2019 14:44:03 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D01FA2897;
 Mon, 13 May 2019 14:44:03 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 13 May
 2019 16:44:03 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 13 May 2019 16:44:03
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
Date: Mon, 13 May 2019 16:42:18 +0200
Message-ID: <1557758539-28748-2-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557758539-28748-1-git-send-email-yannick.fertre@st.com>
References: <1557758539-28748-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-13_07:, , signatures=0
Subject: [Linux-stm32] [PATCH v3 1/2] dt-bindings: display: stm32: add
	supply property to DSI controller
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

VGhpcyBwYXRjaCBhZGRzIGRvY3VtZW50YXRpb24gb2YgYSBuZXcgcHJvcGVydHkgcGh5LWRzaS1z
dXBwbHkgdG8gdGhlClNUTTMyIERTSSBjb250cm9sbGVyLgoKU2lnbmVkLW9mZi1ieTogWWFubmlj
ayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+ClJldmlld2VkLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBl
LmNvcm51QHN0LmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9zdCxzdG0zMi1sdGRjLnR4dCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvc3Qsc3RtMzItbHRkYy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4dAppbmRleCAzZWIxYjQ4Li42MGM1NGRhIDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0z
Mi1sdGRjLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9zdCxzdG0zMi1sdGRjLnR4dApAQCAtNDAsNiArNDAsOCBAQCBNYW5kYXRvcnkgbm9kZXMgc3Bl
Y2lmaWMgdG8gU1RNMzIgRFNJOgogLSBwYW5lbCBvciBicmlkZ2Ugbm9kZTogQSBub2RlIGNvbnRh
aW5pbmcgdGhlIHBhbmVsIG9yIGJyaWRnZSBkZXNjcmlwdGlvbiBhcwogICBkb2N1bWVudGVkIGlu
IFs2XS4KICAgLSBwb3J0OiBwYW5lbCBvciBicmlkZ2UgcG9ydCBub2RlLCBjb25uZWN0ZWQgdG8g
dGhlIERTSSBvdXRwdXQgcG9ydCAocG9ydEAxKS4KK09wdGlvbmFsIHByb3BlcnRpZXM6CistIHBo
eS1kc2ktc3VwcGx5OiBwaGFuZGxlIG9mIHRoZSByZWd1bGF0b3IgdGhhdCBwcm92aWRlcyB0aGUg
c3VwcGx5IHZvbHRhZ2UuCiAKIE5vdGU6IFlvdSBjYW4gZmluZCBtb3JlIGRvY3VtZW50YXRpb24g
aW4gdGhlIGZvbGxvd2luZyByZWZlcmVuY2VzCiBbMV0gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Nsb2NrL2Nsb2NrLWJpbmRpbmdzLnR4dApAQCAtMTAxLDYgKzEwMyw3IEBAIEV4
YW1wbGUgMjogRFNJIHBhbmVsCiAJCQljbG9jay1uYW1lcyA9ICJwY2xrIiwgInJlZiI7CiAJCQly
ZXNldHMgPSA8JnJjYyBTVE0zMkY0X0FQQjJfUkVTRVQoRFNJKT47CiAJCQlyZXNldC1uYW1lcyA9
ICJhcGIiOworCQkJcGh5LWRzaS1zdXBwbHkgPSA8JnJlZzE4PjsKIAogCQkJcG9ydHMgewogCQkJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+OwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
