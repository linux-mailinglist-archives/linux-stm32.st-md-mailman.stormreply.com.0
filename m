Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C04CBB88
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2019 15:21:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92101C36B0B;
	Fri,  4 Oct 2019 13:21:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2127C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2019 13:21:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x94DLFI7001754; Fri, 4 Oct 2019 15:21:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=9Uex5pTCkhp4v8CMWAiUWlq97PLFUphIHvTvPnjz9jk=;
 b=I2csExbB326H9vM0Ed1LTD8ceGt2FGDV3BkbfYTOzMVxxOPSg2F+glSGDKrK/AfV1k/L
 yMWDbitX7LXxb8FUMpzP0Ih2CBhLHxxcUOmvnKd5SPg3vqq6hrqZv/G2anYlj/OnxT12
 Oazv7elhxpnnWW2/hctDa2QLG004/43nO4sg+yoHhGzYHTT656Ei8v9UI5mmKF5SXlxz
 gjGPH+xylHeN65JODXEW3gXZQz00QLg9SSeSlJ488jwPSyg3/6trsA72UDLWrzHqN7DQ
 9U8TihQi/9PGF5q7xjwInI6QzZL1pdaZlnaeuYJR+Hg//Wce1xB99Xiuon5u/p4FucgF zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v9xdhau44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Oct 2019 15:21:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C993B10002A;
 Fri,  4 Oct 2019 15:21:09 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B8A4C2C434C;
 Fri,  4 Oct 2019 15:21:09 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 4 Oct 2019
 15:21:09 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 4 Oct 2019 15:21:09
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
Date: Fri, 4 Oct 2019 15:17:02 +0200
Message-ID: <1570195022-23327-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-04_06:2019-10-03,2019-10-04 signatures=0
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: add focaltech touchscreen on
	stm32mp157c-dk2 board
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

RW5hYmxlIGZvY2FsdGVjaCBmdDYyMzYgdG91Y2hzY3JlZW4gb24gU1RNMzJNUDE1N0MtREsyIGJv
YXJkLgoKU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5j
b20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZGsyLmR0cyB8IDEzICsrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZGsyLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNTdjLWRrMi5kdHMKaW5kZXggMjBlYTYwMS4uZDQ0YTdjNiAxMDA2NDQKLS0tIGEv
YXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZGsyLmR0cworKysgYi9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTU3Yy1kazIuZHRzCkBAIC02MSw2ICs2MSwxOSBAQAogCX07CiB9OwogCism
aTJjMSB7CisJdG91Y2hzY3JlZW5AMzggeworCQljb21wYXRpYmxlID0gImZvY2FsdGVjaCxmdDYy
MzYiOworCQlyZWcgPSA8MHgzOD47CisJCWludGVycnVwdHMgPSA8MiAyPjsKKwkJaW50ZXJydXB0
LXBhcmVudCA9IDwmZ3Bpb2Y+OworCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKKwkJdG91Y2hzY3Jl
ZW4tc2l6ZS14ID0gPDQ4MD47CisJCXRvdWNoc2NyZWVuLXNpemUteSA9IDw4MDA+OworCQlzdGF0
dXMgPSAib2theSI7CisJfTsKK307CisKICZsdGRjIHsKIAlzdGF0dXMgPSAib2theSI7CiAKLS0g
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
