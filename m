Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CFB78DF5
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2019 16:29:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2856C35E01;
	Mon, 29 Jul 2019 14:29:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A4A4C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2019 14:29:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6TERLrM022428; Mon, 29 Jul 2019 16:29:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=/E0GksnkJiKefciHBvFyL+s1X3i9mUeBZFhV3J5bfCA=;
 b=MejLdAC5egEPFYo+PeRI2KZ59gQepBm4PjuE4dYHUmy2ipCTkYeM8cPmcIuSB5SWQNZc
 RWkDgdoUWvw3LPq0VRRbTRfja20BeoQ43YZJjo73gjX75besD6SIgzfQwDq3U6bS6jX4
 L9ELCvaiRoeRT73MTMLKzNRLuVenb8F1Kp+dQ3QMliTZWXCRQIjCAtmzQdq5k/AfDJSE
 Jcm28weMNsKgnLktPyiKeaCpGOtZrBUi0IA3MLu/DH7f+Jm0RWGCxy/j4HwaUzG1/tlU
 Sm0oYVM+dOOe63K/wy8W/kCEDgi0jnnm8h05EyWzJ4dJZfn1fAhTIaGveh3kVOEjKjcL +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u0br9n7jv-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 29 Jul 2019 16:29:17 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F17F34;
 Mon, 29 Jul 2019 14:29:16 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1D6B5A7C;
 Mon, 29 Jul 2019 14:29:15 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 29 Jul
 2019 16:29:15 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 29 Jul 2019 16:29:15
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
Date: Mon, 29 Jul 2019 16:29:08 +0200
Message-ID: <1564410548-20436-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-29_07:, , signatures=0
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: add phy-dsi-supply property
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

VGhlIGRzaSBwaHlzaWNhbCBsYXllciBpcyBwb3dlcmVkIGJ5IHRoZSAxdjggcG93ZXIgY29udHJv
bGxlciBzdXBwbHkuCgpTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVy
dHJlQHN0LmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1ldjEuZHRzIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL2Fy
bS9ib290L2R0cy9zdG0zMm1wMTU3Yy1ldjEuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJt
cDE1N2MtZXYxLmR0cwppbmRleCBmZWI4Zjc3Li4xOWQ2OWQwIDEwMDY0NAotLS0gYS9hcmNoL2Fy
bS9ib290L2R0cy9zdG0zMm1wMTU3Yy1ldjEuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0
bTMybXAxNTdjLWV2MS5kdHMKQEAgLTEwMSw2ICsxMDEsNyBAQAogJmRzaSB7CiAJI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47CiAJI3NpemUtY2VsbHMgPSA8MD47CisJcGh5LWRzaS1zdXBwbHkgPSA8JnJl
ZzE4PjsKIAlzdGF0dXMgPSAib2theSI7CiAKIAlwb3J0cyB7Ci0tIAoyLjcuNAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
