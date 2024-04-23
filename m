Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D060C8AEA7C
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Apr 2024 17:15:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9544BC7128A;
	Tue, 23 Apr 2024 15:15:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B026CC6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 15:15:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43NCrG0r001313;
 Tue, 23 Apr 2024 17:15:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=selector1; bh=YrbfGC6FcWfI6XlLnm5j
 VHxXRTNO566YwlBwIxSBUcA=; b=dtxy0eXnxyrssG7R9zVW/dMuhjE2MX3r5G0Y
 3C5XG2TlLust1+yyHPD/bmFYUuZo7MEgR8VqbaW2HLlMZIFu5MRy+cLVFSvRMLRc
 S121R+VYpxv3LHab3/iibgNAq9tecQ56Vuk8HFvXSIiUqIXoxddc2JdCDTkQQUlZ
 IkICZYvHqNUsLPD0GNposLX5ZvbcBcfJWgpXSyW21WPToWVPpwDrh++pVqMbEtht
 jcTpco/mbjTA0wARonGNapvgwXqWX3A7Re4mrVHAtLbeDd99bRGytiMkHklYF/Ls
 KVbqPZ7xeWeTONZYvRP6TRIwdcGvLlbB+DyeC7Bmhr4TRJXc5A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm51w4ar5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Apr 2024 17:15:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8541240045;
 Tue, 23 Apr 2024 17:14:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 68093223661;
 Tue, 23 Apr 2024 17:14:14 +0200 (CEST)
Received: from localhost (10.48.86.103) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 17:14:14 +0200
From: Maxime MERE <maxime.mere@foss.st.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
 <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 23 Apr 2024 17:14:06 +0200
Message-ID: <20240423151409.902490-1-maxime.mere@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.103]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-23_12,2024-04-23_02,2023-05-22_02
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/3] crypto: stm32/cryp - Improve
	stm32-cryp driver
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

RnJvbTogTWF4aW1lIE3DqXLDqSA8bWF4aW1lLm1lcmVAZm9zcy5zdC5jb20+CgpUaGlzIHNlcmll
cyBvZiBwYXRjaGVzIG1haW5seSBhaW1zIHRvIGltcHJvdmUgdGhlIHVzYWdlIG9mIERNQSB3aXRo
IHRoZQpDUllQIHBlcmlwaGVyYWwgb2YgdGhlIFNUTTMyIE1QVSBzZXJpZXMuIFRoZSBvdGhlciB0
d28gcGF0Y2hlcyBhcmUgbmVlZGVkCnRvIGVuaGFuY2UgdGhlIGRyaXZlcidzIHZpc2liaWxpdHkg
Zm9yIFNUIHBsYXRmb3Jtcy4KClRoaXMgdjIgYWRkcmVzcyB0aGUga2VybmVsIHJvYm90IHdhcm5p
bmdzLgoKTWF4aW1lIE3DqXLDqSAoMyk6CiAgY3J5cHRvOiBzdG0zMi9jcnlwIC0gdXNlIGRtYSB3
aGVuIHBvc3NpYmxlLgogIGNyeXB0bzogc3RtMzIvY3J5cCAtIGluY3JlYXNlIHByaW9yaXR5CiAg
Y3J5cHRvOiBzdG0zMi9jcnlwIC0gYWRkIENSWVBUT19BTEdfS0VSTl9EUklWRVJfT05MWSBmbGFn
CgogZHJpdmVycy9jcnlwdG8vc3RtMzIvc3RtMzItY3J5cC5jIHwgNzI0ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDY4MCBpbnNlcnRpb25zKCspLCA0NCBk
ZWxldGlvbnMoLSkKCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
