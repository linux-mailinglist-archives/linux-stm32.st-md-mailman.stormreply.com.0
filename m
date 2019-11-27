Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E4110AD81
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2019 11:24:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D829C36B0B;
	Wed, 27 Nov 2019 10:24:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 124FBC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 10:24:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARAMKPL028075; Wed, 27 Nov 2019 11:24:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=NGFn1INSjiFml8tyG7QtE320FjzT4hxnP0D7Gm8LUjM=;
 b=uME+JoZ+//t/DS+f6MAZex+Z9TXISsVsn5lhbai1DelE4ii2Ew9vpIylgLi6hfjVKvI4
 ZmjyIfAzdSlG11yX8kQVXhk3bss4hHlWY8sdJmtkax+oBFMs138y3dU4XcN1dHBzahUS
 pJ6v6phHMhlHkBeZ/437466BYpEzIWWCriT1LzEFFunp/1tUsdbBW97PsWQjPyeWldOj
 OSuZfXTcZ5m/0rOBCq0QxhLaLPr7/hYJpawKA5Andlix/2ajYuSBGNRGZ9fPQ28U8U+0
 TeFyQpcwDWy2xXlakHz+JDNT0hBm/daX3tStKgkJRXWq9uIGiPNuU/CctC1V0xDlnWB5 iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2whcxsb0sj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 11:24:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4E46010002A;
 Wed, 27 Nov 2019 11:24:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A1EF82B1218;
 Wed, 27 Nov 2019 11:24:16 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 27 Nov 2019 11:24:15 +0100
From: Yannick Fertre <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 27 Nov 2019 11:24:14 +0100
Message-ID: <1574850254-13381-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
Subject: [Linux-stm32] [PATCH] Input: goodix - support gt9147 touchpanel
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

RnJvbTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+CgpBZGQgc3VwcG9y
dCBmb3IgaXQgYnkgYWRkaW5nIGNvbXBhdGlibGUgYW5kIHN1cHBvcnRlZCBjaGlwIGRhdGEKKGRl
ZmF1bHQgc2V0dGluZ3MgdXNlZCkuClRoZSBjaGlwIGRhdGEgb24gR1Q5MTQ3IGlzIHNpbWlsYXIg
dG8gR1Q5MTIsIGxpa2UKLSBjb25maWcgZGF0YSByZWdpc3RlciBoYXMgMHg4MDQ3IGFkZHJlc3MK
LSBjb25maWcgZGF0YSByZWdpc3RlciBtYXggbGVuIGlzIDI0MAotIGNvbmZpZyBkYXRhIGNoZWNr
c3VtIGhhcyA4LWJpdAoKU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVy
dHJlQHN0LmNvbT4KLS0tCiBkcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2dvb2RpeC5jIHwgMSAr
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lu
cHV0L3RvdWNoc2NyZWVuL2dvb2RpeC5jIGIvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9nb29k
aXguYwppbmRleCBmYjQzYWE3Li5iNDcwNzczIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lucHV0L3Rv
dWNoc2NyZWVuL2dvb2RpeC5jCisrKyBiL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vZ29vZGl4
LmMKQEAgLTEwNDUsNiArMTA0NSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IGdvb2RpeF9vZl9tYXRjaFtdID0gewogCXsgLmNvbXBhdGlibGUgPSAiZ29vZGl4LGd0OTI3MSIg
fSwKIAl7IC5jb21wYXRpYmxlID0gImdvb2RpeCxndDkyOCIgfSwKIAl7IC5jb21wYXRpYmxlID0g
Imdvb2RpeCxndDk2NyIgfSwKKwl7IC5jb21wYXRpYmxlID0gImdvb2RpeCxndDkxNDciLH0sCiAJ
eyB9CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgZ29vZGl4X29mX21hdGNoKTsKLS0gCjIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
