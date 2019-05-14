Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2701C62A
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 11:36:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5461C35E09
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 09:36:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75580C35E02
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 09:36:20 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E9VWJp023931; Tue, 14 May 2019 11:36:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=fsbBwl7Tthpbz/eCjykcV7x4Wlt53zxDBpGU6jlFytg=;
 b=a3a6okLrnFYL1FMWRzsSHkfi57tsWIaN+rfwa3c4BaWjsfDIezfk2tyB2jRASM/9Y01v
 vuKAII6QgFvrnA2QCM6j9fyewgn7rSNz+e5m370sE2DVWoOxxRS7cUwkCoVKw8ejV5MP
 F/jKRW24TB8CojqDIRAeHQIHZPQPWhkQt/GItKTEiJqPvw76YOntFLWC9ZgdM/u+VpS7
 NOcqdLLPCBVvQo6V/afXIfbSk+A32wbiT5qzTyHhD/r6zSdP51m6Ozk8HUQ3nnojgibE
 OTmeKk5bMvVS//dSu1MJ93cYb4/FJz/X53eCe4VO+98u0M2E//CDglHxm/u8DyDBBbNG cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sdn9fr6bn-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 14 May 2019 11:36:11 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B94733A;
 Tue, 14 May 2019 09:36:10 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5B727179A;
 Tue, 14 May 2019 09:36:10 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 14 May
 2019 11:36:10 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 14 May 2019 11:36:09
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
Date: Tue, 14 May 2019 11:35:54 +0200
Message-ID: <1557826556-10079-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_05:, , signatures=0
Subject: [Linux-stm32] [PATCH v4 0/2] Add supply property for DSI controller
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

VGhlIERTSSBjb250cm9sbGVyIG5lZWRzIGEgbmV3IHByb3BlcnR5IHRoYXQgcG93ZXJzIGl0cyBw
aHlzaWNhbCBsYXllci4KQmluZGluZyBoYXMgYmVlbiB1cGRhdGVkIHRvIGRvY3VtZW50IHRoaXMg
cHJvcGVydHkuCkRldmljZSB0cmVlIG9mIHN0bTMybXAxNTdjIHNvYy4KTW92ZSByZWcxOCAmIHJl
ZzExIHRvIHN0bTMybXAxNTdjIGRldmljZSB0cmVlIGZpbGUuClJlbW92ZSBwcm9wZXJ0eSBwaHkt
ZHNpLXN1cHBseSBwcm9wZXJ0eSB0byBzdG0zMm1wMTU3Yy1kazIuZHRzIGZpbGUuCgpDaGFuZ2Vz
IGluIHYyOgotIHJlbmFtZSBwYXRjaCBkcm0vc3RtOiBkc2k6IGFkZCBzdXBwb3J0IG9mIGFuIG9w
dGlvbmFsIHJlZ3VsYXRvcgotIHJld29yayBkd19taXBpX2RzaS1zdG0gcHJvYmUgc2VxdWVuY2UK
CkNoYW5nZXMgaW4gdjM6Ci0gcmVtb3ZlIGRldmljZS10cmVlIHBhdGNoZXMKLSByZXBsYWNlIHRo
ZSBvcHRpb25hbCByZWd1bGF0b3IgYnkgYSByZWd1bGF0b3IKCkNoYW5nZXMgaW4gdjQ6Ci0gdXBk
YXRlIHBhdGNoIGNvbW1pdAotIHJldHVybiBhbHdheXMgZXJyb3IgY29kZQoKWWFubmljayBGZXJ0
csOpICgyKToKICBkdC1iaW5kaW5nczogZGlzcGxheTogc3RtMzI6IGFkZCBzdXBwbHkgcHJvcGVy
dHkgdG8gRFNJIGNvbnRyb2xsZXIKICBkcm0vc3RtOiBkc2k6IGFkZCByZWd1bGF0b3Igc3VwcG9y
dAoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHRkYy50eHQgIHwg
IDMgKysKIGRyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMgICAgICAgICAgICAg
IHwgNjAgKysrKysrKysrKysrKysrKysrLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRp
b25zKCspLCAxMSBkZWxldGlvbnMoLSkKCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
