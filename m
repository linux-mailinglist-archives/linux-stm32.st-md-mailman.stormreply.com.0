Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A420680E7FA
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Dec 2023 10:43:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53060C6B45D;
	Tue, 12 Dec 2023 09:43:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB852C6B458
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 09:43:22 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BC6gnqx004028; Tue, 12 Dec 2023 10:43:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=selector1; bh=2m3Til5/b9PZ2Uwec07k
 8iVtFn56gHhKsPS0il+OJ94=; b=KMZ2mVUe8vsxP7R3iqs5mlYRt4+WTLik1H3U
 GzUwCoS2717f49PR5dq/XZS5IjbcGRwPbQEadSs051dsH6JQoCFM9EVyEnt/FAKm
 itwChVoAoiitn7CyE298rfHxCqYeY2HthJM7BrRL7+aNDyRjCygbI9MAXFyDZt5+
 YzFzq88juHPrBJGSSR/F/xt+8x0MMTxKotcADgZJlUfFt9WzmpZJ2+uf4klov9VY
 lHjNJjov5JEDcUXgl5aABYc9027npY5mq9xmqV+YG+Tb+PZsWw5sXBEj8QiXG/f4
 ReDKpoacgMHDm4xGUdstg6ToFP6o0GMv9GvUN3VhbQdExkJjoA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvehmauxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 10:43:14 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0D26610005A;
 Tue, 12 Dec 2023 10:43:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EF977215139;
 Tue, 12 Dec 2023 10:43:13 +0100 (CET)
Received: from localhost (10.201.20.114) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Dec
 2023 10:43:13 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>
Date: Tue, 12 Dec 2023 10:43:10 +0100
Message-ID: <20231212094310.3633-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.114]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-12_03,2023-12-07_01,2023-05-22_02
Cc: =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] checkpatch: use utf-8 match for spell checking
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

VGhlIGN1cnJlbnQgY29kZSB0aGF0IGNoZWNrcyBmb3IgbWlzc3BlbGxpbmcgdmVyaWZpZXMsIGlu
IGEgbW9yZQpjb21wbGV4IHJlZ2V4LCBpZiAkcmF3bGluZSBtYXRjaGVzIFteXHddKCRtaXNzcGVs
bGluZ3MpW15cd10KCkJlaW5nICRyYXdsaW5lIGEgYnl0ZS1zdHJpbmcsIGEgdXRmLTggY2hhcmFj
dGVyIGluICRyYXdsaW5lIGNhbgptYXRjaCB0aGUgbm9uLXdvcmQtY2hhciBbXlx3XS4KRS5nLjoK
CS4vc2NyaXB0L2NoZWNrcGF0Y2gucGwgLS1naXQgODFjMmYwNTlhYjkKCVdBUk5JTkc6ICdtZW50
JyBtYXkgYmUgbWlzc3BlbGxlZCAtIHBlcmhhcHMgJ21lYW50Jz8KCSMzNjogRklMRTogTUFJTlRB
SU5FUlM6MTQzNjA6CgkrTTogICAgIENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290
bGluLmNvbT4KCSAgICAgICAgICAgIF5eXl4KClVzZSBhIHV0Zi04IHZlcnNpb24gb2YgJHJhd2xp
bmUgZm9yIHNwZWxsIGNoZWNraW5nLgoKU2lnbmVkLW9mZi1ieTogQW50b25pbyBCb3JuZW8gPGFu
dG9uaW8uYm9ybmVvQGZvc3Muc3QuY29tPgpSZXBvcnRlZC1ieTogQ2zDqW1lbnQgTGUgR29mZmlj
IDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgotLS0KIHNjcmlwdHMvY2hlY2twYXRjaC5w
bCB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jaGVja3BhdGNoLnBsIGIvc2NyaXB0cy9jaGVja3BhdGNo
LnBsCmluZGV4IDI1ZmRiN2ZkYTExMi4uNTg2NDZiZDZlZjU2IDEwMDc1NQotLS0gYS9zY3JpcHRz
L2NoZWNrcGF0Y2gucGwKKysrIGIvc2NyaXB0cy9jaGVja3BhdGNoLnBsCkBAIC0zNDc3LDcgKzM0
NzcsOCBAQCBzdWIgcHJvY2VzcyB7CiAjIENoZWNrIGZvciB2YXJpb3VzIHR5cG8gLyBzcGVsbGlu
ZyBtaXN0YWtlcwogCQlpZiAoZGVmaW5lZCgkbWlzc3BlbGxpbmdzKSAmJgogCQkgICAgKCRpbl9j
b21taXRfbG9nIHx8ICRsaW5lID1+IC9eKD86XCt8U3ViamVjdDopL2kpKSB7Ci0JCQl3aGlsZSAo
JHJhd2xpbmUgPX4gLyg/Ol58W15cd1wtJ2BdKSgkbWlzc3BlbGxpbmdzKSg/OlteXHdcLSdgXXwk
KS9naSkgeworCQkJbXkgJHJhd2xpbmVfdXRmOCA9IGRlY29kZSgidXRmOCIsICRyYXdsaW5lKTsK
KwkJCXdoaWxlICgkcmF3bGluZV91dGY4ID1+IC8oPzpefFteXHdcLSdgXSkoJG1pc3NwZWxsaW5n
cykoPzpbXlx3XC0nYF18JCkvZ2kpIHsKIAkJCQlteSAkdHlwbyA9ICQxOwogCQkJCW15ICRibGFu
ayA9IGNvcHlfc3BhY2luZygkcmF3bGluZSk7CiAJCQkJbXkgJHB0ciA9IHN1YnN0cigkYmxhbmss
IDAsICQtWzFdKSAuICJeIiB4IGxlbmd0aCgkdHlwbyk7CgpiYXNlLWNvbW1pdDogYjg1ZWE5NWQw
ODY0NzFhZmI0YWQwNjIwMTJhNGQ3M2NkMzI4ZmE4NgotLSAKMi40Mi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
