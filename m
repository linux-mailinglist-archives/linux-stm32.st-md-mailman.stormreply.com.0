Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBC8411811
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Sep 2021 17:22:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B8D4C5A4F8;
	Mon, 20 Sep 2021 15:22:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C32ABC5A4CE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Sep 2021 15:21:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KE21hV025229; 
 Mon, 20 Sep 2021 17:21:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=11mbfnVg9/gdbNXUsMJb7eKBhQNTVHlQkqg8fvwjfGU=;
 b=WJ6oDJofyU26m/VP/7VK39oole1/vl5zzLvZM/wizVK31tVqajFFYRA0EdAnBNACRVmM
 IBU5bGEgskY8R6L4Gc0q0dQ6tsB4dEd0dzUuojIa/8/Qbpw5TEEAaaj2WqXV/l65N3ei
 TQ5Hvo/qlAT0wS0Wq0ntoBghhxhUHucS4wsobYdZQg6DmGc3OnSoTGbuqGl1DnI6UA9q
 lWHaz081LgxJdzZB4yYT2sQFnrQ1rxbkBhf6PDQ8L+iqFzGQhJEuGBAGn3DAWJS+4O2J
 MDQHdPUvJdDlf/FSES0GU+TJxChlbt3ZldhJEJs3PKU/99FbMTotJ2S72mJnZ+Dt06w5 DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b6uq3rbag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 17:21:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A896F10002A;
 Mon, 20 Sep 2021 17:21:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9AF4722F7B7;
 Mon, 20 Sep 2021 17:21:45 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep 2021 17:21:45
 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
Date: Mon, 20 Sep 2021 17:21:28 +0200
Message-ID: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, alain.volmat@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/4] i2c: stm32: various fixes & dmaengine
	updates
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

VGhpcyBzZXJpZSBjb250YWlucyAzIGZpeGVzIGZvciBJwrJDIGVycm9yIGhhbmRsaW5nIGNhc2Vz
LgpJdCBhbHNvIGluY2x1ZGVzIGEgcGF0Y2ggdG8gZ2V0IHJpZCBvZiB0aGUgZGVwcmVjYXRlZApk
bWFlbmdpbmVfdGVybWluYXRlX2FsbCBjYWxscy4KCkFsYWluIFZvbG1hdCAoNCk6CiAgaTJjOiBz
dG0zMmY3OiBmbHVzaCBUWCBGSUZPIHVwb24gdHJhbnNmZXIgZXJyb3JzCiAgaTJjOiBzdG0zMmY3
OiByZWNvdmVyIHRoZSBidXMgb24gYWNjZXNzIHRpbWVvdXQKICBpMmM6IHN0bTMyZjc6IHN0b3Ag
ZG1hIHRyYW5zZmVyIGluIGNhc2Ugb2YgTkFDSwogIGkyYzogc3RtMzJmNzogdXNlIHByb3BlciBE
TUFFTkdJTkUgQVBJIGZvciB0ZXJtaW5hdGlvbgoKIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3Rt
MzJmNy5jIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKLS0gCjIuMjUuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
