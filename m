Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7527125360
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 17:03:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1D87C7AB79
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 15:03:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08293C7AB78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 15:03:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4LEuoq6020124; Tue, 21 May 2019 17:03:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=nq7D1bNWeTgr7MKVNaV3palhDHMi3cg+ormhUszIkDA=;
 b=PpW3x0ymcnUZ/0c0dfYbfMZXrKlhgx/d+/39TwL3UFhz58hr6/EOYLV/Qbsh3vXnnJ5i
 JLgHTmGh2Mk7LtVtTtpXLevTq/GHHs/TXVOp2Rk/1cbpRSwtSnrmw9LrCLS9MpdcRvAU
 v1bZBT50KYk907XY50A0NSfcbsc4zmlvQGXyGCL0kMlqC758Mq8CK6YpqK7sasUTatuE
 +aMAuqcb/BPxaS5Qwulo7rG+L++aENNczIBcHpJAQr2Ki6En8oF7OFUjZgDl+Tczh+Tw
 l6RYbGWu72bhq9oWwaSX+CXez5LsOe6zbrEsekF/UlJJGjrP1S7dZpbP8RIBUUyQootB bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sj7742m3c-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 21 May 2019 17:03:26 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 257F23A;
 Tue, 21 May 2019 15:03:26 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F11662BFE;
 Tue, 21 May 2019 15:03:25 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 21 May
 2019 17:03:25 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 21 May 2019 17:03:25
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>
Date: Tue, 21 May 2019 17:03:18 +0200
Message-ID: <1558450998-13451-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-21_03:, , signatures=0
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: add power supply of rm68200
	on stm32mp157c-ev1
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

VGhpcyBwYXRjaCBhZGRzIGEgbmV3IHByb3BlcnR5IChwb3dlci1zdXBwbHkpIHRvIHBhbmVsIHJt
NjgyMDAgKHJheWRpdW0pCm9uIHN0bTMybXAxNTdjLWV2MS4KClNpZ25lZC1vZmYtYnk6IFlhbm5p
Y2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNTdjLWV2MS5kdHMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWV2MS5kdHMgYi9h
cmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1ldjEuZHRzCmluZGV4IDhlZjJjYjAuLjUwZjMy
NjMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWV2MS5kdHMKKysr
IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZXYxLmR0cwpAQCAtMTI3LDYgKzEyNyw3
IEBACiAJCXJlZyA9IDwwPjsKIAkJcmVzZXQtZ3Bpb3MgPSA8JmdwaW9mIDE1IEdQSU9fQUNUSVZF
X0xPVz47CiAJCWJhY2tsaWdodCA9IDwmcGFuZWxfYmFja2xpZ2h0PjsKKwkJcG93ZXItc3VwcGx5
ID0gPCZ2M3YzPjsKIAkJc3RhdHVzID0gIm9rYXkiOwogCiAJCXBvcnQgewotLSAKMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
