Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D94DB9ED227
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Dec 2024 17:37:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC197C7128A;
	Wed, 11 Dec 2024 16:37:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31BCCC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Dec 2024 16:36:58 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBDm6Z1014727;
 Wed, 11 Dec 2024 17:36:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=PXiCCXsVfW/h9LtVSBuu5+
 pxnV9XWp/7D8xOOI/76mU=; b=v6qHGIBWdpcdy0A+GRWq4r6uPGDOSASWQMIovH
 qyiB9GPJiNIvORrT9nax951FzOYMFWGto99bdsY2H0tlW04RTVlEOwgMps32QSte
 TZaMEqyZ5NcQYEfwXPkdOviIVPUpPdefoUVawj/hDcDlQd5ypKMWEvz2uLTqc3CP
 ul7GtS0rhWQC8hXJoMtN7Pi/LnZBBuq76QYlLeN/ClexYXDk52n4n5Tal0hMAOb8
 J1EKXQyRn6AY8cuVcSMz5kC9TKnkocgOivVwizZLnv4hLMsTZgNPZKftoZvCZgVD
 Mki2Fq/S8yJ7v+4a4Ye38RT7mqN0yaA5jP357YP9KYrmxALA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccnmc1wy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 17:36:33 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2D14140044;
 Wed, 11 Dec 2024 17:35:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8996D22D462;
 Wed, 11 Dec 2024 17:35:02 +0100 (CET)
Received: from localhost (10.48.86.108) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 11 Dec
 2024 17:34:59 +0100
From: =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 11 Dec 2024 17:34:57 +0100
Message-ID: <20241211163457.301140-1-clement.legoffic@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.108]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Marek Vasut <marex@denx.de>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] watchdog: stm32_iwdg: fix DT backward
	compatibility
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

VGhlIGNvbW1pdCAzYWIxNjYzYWY2YzEgKCJ3YXRjaGRvZzogc3RtMzJfaXdkZzogQWRkIHByZXRp
bWVvdXQgc3VwcG9ydCIpCmludHJvZHVjZXMgdGhlIHN1cHBvcnQgZm9yIHRoZSBwcmUtdGltZW91
dCBpbnRlcnJ1cHQuCgpUaGUgc3VwcG9ydCBmb3IgdGhpcyBpbnRlcnJ1cHQgaXMgb3B0aW9uYWwg
YnV0IHRoZSBkcml2ZXIgbWFuZGF0ZXMgdGhlCmludGVycnVwdHMgcHJvcGVydHkgaW4gdGhlIGRl
dmljZS10cmVlLCBicmVha2luZyB0aGUgY29tcGF0aWJpbGl0eSB3aXRoCmV4aXN0aW5nIGRldmlj
ZS10cmVlcy4KClVzZSB0aGUgcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpIEFQSSB0byBjb21w
bHkgd2l0aCBleGlzdGluZwpkZXZpY2UtdHJlZXMuCgpGaXhlczogM2FiMTY2M2FmNmMxICgid2F0
Y2hkb2c6IHN0bTMyX2l3ZGc6IEFkZCBwcmV0aW1lb3V0IHN1cHBvcnQiKQpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Ci0tLQoK
UGxlYXNlIGNvbnNpZGVyIG1lcmdpbmcgdGhpcyBwYXRjaCBpbiB0aGUgdjYuMTMgY3ljbGUgdG8g
YXZvaWQgYnJlYWtpbmcKdGhlIGNvbXBhdGliaWxpdHkgb2YgdGhlIGV4aXN0aW5nIGRldmljZS10
cmVlLgoKZHJpdmVycy93YXRjaGRvZy9zdG0zMl9pd2RnLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3dh
dGNoZG9nL3N0bTMyX2l3ZGcuYyBiL2RyaXZlcnMvd2F0Y2hkb2cvc3RtMzJfaXdkZy5jCmluZGV4
IGQ3MDBlMGQ0OWJiOTUuLjhhZDA2YjU0YzVhZGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvd2F0Y2hk
b2cvc3RtMzJfaXdkZy5jCisrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvc3RtMzJfaXdkZy5jCkBAIC0y
ODYsNyArMjg2LDcgQEAgc3RhdGljIGludCBzdG0zMl9pd2RnX2lycV9pbml0KHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYsCiAJaWYgKCF3ZHQtPmRhdGEtPmhhc19lYXJseV93YWtldXApCiAJ
CXJldHVybiAwOwoKLQlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOworCWlycSA9IHBs
YXRmb3JtX2dldF9pcnFfb3B0aW9uYWwocGRldiwgMCk7CiAJaWYgKGlycSA8PSAwKQogCQlyZXR1
cm4gMDsKCgpiYXNlLWNvbW1pdDogZmFjMDRlZmM1Yzc5M2RjY2JkMDdlMmQ1OWFmOWY5MGI3ZmMw
ZGNhNAotLQoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
