Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8321419EF4
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 16:20:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DF06C78F61
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 14:20:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7045AC712BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 14:20:46 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AE1A8s018315; Fri, 10 May 2019 16:20:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=OHGaVmWPK75Bp7LuPNGnKluofPPBZv1Ks7LWFUOsICQ=;
 b=n6Tq7rh0kziujq3yyVIg3oP4Q5dnlo4oEzia8lqY+qIRJsQ80knfD8tDdKcsPwWkyjVR
 YxZQQJLN1jmM5tuLdTzQHEcT4goLDtFEOzs1feiHmeyABzHLDZFL56swJvWddecOCe43
 OiykPkHgXu/IcU3XJF2IREiHijGtQcUCGW2CeI2QRWwnsJHYvfMgwlGLEgl0hLv9mASn
 W3eqiAjllOjVSgpLkYjYtHKj2zFa+85xDMoveB2+6io42tq+lR2MwkvHKf7cvf/vwZ3Q
 r1J/qVs0rxeeUDaUfFs1iFVi5OlU/DiqhouIjz44YDdxPim8scF5hAmSi6uVdPgJsjIX 6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2scbkaj2g2-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 16:20:35 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A99D831;
 Fri, 10 May 2019 14:20:34 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9038C113A;
 Fri, 10 May 2019 14:20:34 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.361.1; Fri, 10 May
 2019 16:20:34 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 10 May 2019 16:20:33
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 10 May 2019 16:20:23 +0200
Message-ID: <1557498023-10766-6-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
References: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Subject: [Linux-stm32] [PATCH v2 5/5] ARM: dts: stm32: remove phy-dsi-supply
	property on stm32mp157c-dk2 board
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

VGhpcyBwcm9wZXJ0eSBpcyBhbHJlYWR5IGRlZmluZWQgaW50byBzdG0zMm1wMTU3Yy5kdHNpIGZp
bGUuCgpTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNv
bT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazIuZHRzIHwgMSAtCiAxIGZp
bGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNTdjLWRrMi5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazIu
ZHRzCmluZGV4IDAyMGVhMGYuLjA5ZjZlN2IgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNTdjLWRrMi5kdHMKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2Mt
ZGsyLmR0cwpAQCAtMTcsNyArMTcsNiBAQAogCSNhZGRyZXNzLWNlbGxzID0gPDE+OwogCSNzaXpl
LWNlbGxzID0gPDA+OwogCXN0YXR1cyA9ICJva2F5IjsKLQlwaHktZHNpLXN1cHBseSA9IDwmcmVn
MTg+OwogCiAJcG9ydHMgewogCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKLS0gCjIuNy40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
