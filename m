Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B0F7FBC5
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2019 16:09:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BFFEC35E04;
	Fri,  2 Aug 2019 14:09:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FA78C35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 14:09:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72E6uLF014555; Fri, 2 Aug 2019 16:09:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=V4Oy0E5gbwyi1cbiRiVoGW45+5zWyza++ydGz4D477E=;
 b=Z8BqG/0ydEYKorRq6uN7BstyvNz9rvTzsNTLIiUk0O/KLzdXaVrhf3fKJhOL+XEeruk1
 dGUUYZ4gXS3ohGtP7MiUizl4oLWZ+3EVWP2e5syGLv5FHVEzscdE5QRYsQOizAfJ3arT
 If/qqA0CWJFToyr79Oo1fW+TyDtXUPqoCjCri19Zu2UKJOzafaDMbPx4oM+cc3YbTcgq
 FdYxSHDdY1A1zlMjTW4MURJTjducO/Wg9zL1r6gc++okNND+3dMKEHtGkOU+dfm4N5OJ
 vrzrvZf/IH6fEAqSaggQGi8n5GCeCFmQ5c9+eKAk8Q7L+qYSDlwvbGiC2Hggumm9od11 vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0c2yvs6w-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 16:09:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 537F634;
 Fri,  2 Aug 2019 14:09:00 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3CEE72C4581;
 Fri,  2 Aug 2019 16:09:00 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 16:09:00 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 16:08:59
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
Date: Fri, 2 Aug 2019 16:08:51 +0200
Message-ID: <1564754931-13861-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_06:, , signatures=0
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: move ltdc pinctrl on
	stm32mp157a dk1 board
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

VGhlIGx0ZGMgcGluY3RybCBtdXN0IGJlIGluIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIgbm9kZSBh
bmQKbm90IGluIHRoZSBwZXJpcGhlcmFsIG5vZGUgKGhkbWkgYnJpZGdlKS4KClNpZ25lZC1vZmYt
Ynk6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgotLS0KIGFyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMybXAxNTdhLWRrMS5kdHMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTU3YS1kazEuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1
N2EtZGsxLmR0cwppbmRleCBmM2YwZTM3Li4xMjg1Y2ZjIDEwMDY0NAotLS0gYS9hcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTU3YS1kazEuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMy
bXAxNTdhLWRrMS5kdHMKQEAgLTk5LDkgKzk5LDYgQEAKIAkJcmVzZXQtZ3Bpb3MgPSA8JmdwaW9h
IDEwIEdQSU9fQUNUSVZFX0xPVz47CiAJCWludGVycnVwdHMgPSA8MSBJUlFfVFlQRV9FREdFX0ZB
TExJTkc+OwogCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZncGlvZz47Ci0JCXBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCIsICJzbGVlcCI7Ci0JCXBpbmN0cmwtMCA9IDwmbHRkY19waW5zX2E+OwotCQlw
aW5jdHJsLTEgPSA8Jmx0ZGNfcGluc19zbGVlcF9hPjsKIAkJc3RhdHVzID0gIm9rYXkiOwogCiAJ
CXBvcnRzIHsKQEAgLTI3Niw2ICsyNzMsOSBAQAogfTsKIAogJmx0ZGMgeworCXBpbmN0cmwtbmFt
ZXMgPSAiZGVmYXVsdCIsICJzbGVlcCI7CisJcGluY3RybC0wID0gPCZsdGRjX3BpbnNfYT47CisJ
cGluY3RybC0xID0gPCZsdGRjX3BpbnNfc2xlZXBfYT47CiAJc3RhdHVzID0gIm9rYXkiOwogCiAJ
cG9ydCB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
