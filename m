Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6B7821F43
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jan 2024 17:10:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92101C6DD69;
	Tue,  2 Jan 2024 16:10:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66276C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jan 2024 16:10:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 4029bOla028296; Tue, 2 Jan 2024 17:10:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=
 selector1; bh=kPETBoGH+akjcEbMQz/7+ofwHwOQ7qKVNhjHOwjNL2A=; b=R3
 zXFw4wttd7VqVoeDFAMoxQy2IbpeaunrpFeptzgyTd3Mu2vHHmDtdXqrI9jRxKJY
 0XCQq+kd1OLw6vQg1QGatoGBcg8XZ0Ik4KknQRL4trYns2yUgHFoh556UhtVaRNF
 GjL53p6pG9QTqmkZS3G5DO+aUh8bMnoLi7RJSOiMmA+7Om21t+99pl5sySuIizpY
 Ws1QOL0SVFWJQtR3ZwM0guR6riMxRhkOSbFjcHXHNhMrF/KkyQ1DguUQf8lmFftj
 qWrVNqsISHLa0b58Eoo/Ugx6z/PF1fqGk3jc3rBFr5dA5bqotv9iRitqYvnzjlck
 NmvV+NM+gxNwqZSRpMyA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3va978gmxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jan 2024 17:10:46 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA840100062;
 Tue,  2 Jan 2024 17:10:45 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E1F852B5687;
 Tue,  2 Jan 2024 17:10:45 +0100 (CET)
Received: from localhost (10.201.20.114) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 2 Jan
 2024 17:10:45 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>
Date: Tue, 2 Jan 2024 17:10:38 +0100
Message-ID: <20240102161038.22347-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212094310.3633-1-antonio.borneo@foss.st.com>
References: <20231212094310.3633-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.114]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-02_04,2024-01-02_01,2023-05-22_02
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] checkpatch: use utf-8 match for spell
	checking
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
CS4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tZ2l0IDgxYzJmMDU5YWI5CglXQVJOSU5HOiAnbWVu
dCcgbWF5IGJlIG1pc3NwZWxsZWQgLSBwZXJoYXBzICdtZWFudCc/CgkjMzY6IEZJTEU6IE1BSU5U
QUlORVJTOjE0MzYwOgoJK006ICAgICBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9v
dGxpbi5jb20+CgkgICAgICAgICAgICBeXl5eCgpVc2UgYSB1dGYtOCB2ZXJzaW9uIG9mICRyYXds
aW5lIGZvciBzcGVsbCBjaGVja2luZy4KClNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQm9ybmVvIDxh
bnRvbmlvLmJvcm5lb0Bmb3NzLnN0LmNvbT4KUmVwb3J0ZWQtYnk6IENsw6ltZW50IExlIEdvZmZp
YyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gdXNl
ICRyYXdsaW5lX3V0ZjggYWxzbyBpbiB0aGUgd2hpbGUtbG9vcCdzIGJvZHk7Ci0gZml4IHBhdGgg
b2YgY2hlY2twYXRjaCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCi0tLQogc2NyaXB0cy9jaGVja3Bh
dGNoLnBsIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgYi9zY3JpcHRzL2No
ZWNrcGF0Y2gucGwKaW5kZXggMjVmZGI3ZmRhMTEyLi4yZDEyMmQyMzJjNmQgMTAwNzU1Ci0tLSBh
L3NjcmlwdHMvY2hlY2twYXRjaC5wbAorKysgYi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwKQEAgLTM0
NzcsOSArMzQ3NywxMCBAQCBzdWIgcHJvY2VzcyB7CiAjIENoZWNrIGZvciB2YXJpb3VzIHR5cG8g
LyBzcGVsbGluZyBtaXN0YWtlcwogCQlpZiAoZGVmaW5lZCgkbWlzc3BlbGxpbmdzKSAmJgogCQkg
ICAgKCRpbl9jb21taXRfbG9nIHx8ICRsaW5lID1+IC9eKD86XCt8U3ViamVjdDopL2kpKSB7Ci0J
CQl3aGlsZSAoJHJhd2xpbmUgPX4gLyg/Ol58W15cd1wtJ2BdKSgkbWlzc3BlbGxpbmdzKSg/Olte
XHdcLSdgXXwkKS9naSkgeworCQkJbXkgJHJhd2xpbmVfdXRmOCA9IGRlY29kZSgidXRmOCIsICRy
YXdsaW5lKTsKKwkJCXdoaWxlICgkcmF3bGluZV91dGY4ID1+IC8oPzpefFteXHdcLSdgXSkoJG1p
c3NwZWxsaW5ncykoPzpbXlx3XC0nYF18JCkvZ2kpIHsKIAkJCQlteSAkdHlwbyA9ICQxOwotCQkJ
CW15ICRibGFuayA9IGNvcHlfc3BhY2luZygkcmF3bGluZSk7CisJCQkJbXkgJGJsYW5rID0gY29w
eV9zcGFjaW5nKCRyYXdsaW5lX3V0ZjgpOwogCQkJCW15ICRwdHIgPSBzdWJzdHIoJGJsYW5rLCAw
LCAkLVsxXSkgLiAiXiIgeCBsZW5ndGgoJHR5cG8pOwogCQkJCW15ICRoZXJlcHRyID0gIiRoZXJl
bGluZSRwdHJcbiI7CiAJCQkJbXkgJHR5cG9fZml4ID0gJHNwZWxsaW5nX2ZpeHtsYygkdHlwbyl9
OwoKYmFzZS1jb21taXQ6IGI4NWVhOTVkMDg2NDcxYWZiNGFkMDYyMDEyYTRkNzNjZDMyOGZhODYK
LS0gCjIuNDIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
