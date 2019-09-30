Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31802C2391
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Sep 2019 16:46:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E6FEC36B0B;
	Mon, 30 Sep 2019 14:46:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9180CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2019 14:46:10 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8UEfUkC017751; Mon, 30 Sep 2019 16:45:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=u7ckPEielE0COPIH48zXj6aZ3G/8patmlJ6fYKZv6f8=;
 b=zdodmSE9H3b/b7Xd/OA5GtPen95vb0u77yQMhu0ifkJ0pEYPUCTJ0xEgUBfCGRzrVlQB
 lonjHgT+wu83yBAPJahKOiap0EJTyk7PQS2jffjJy49t5zbhphiLUmVeeMGo9TY1DAhf
 0XBcso5YZg3qeCSh4cv7VIHFHQXpzhtY+uLCaRV41eHEPKJxZXTgXab4CAuj3Vl4G2+E
 Bj/6ewts6HTpreJlaHvflTbY63hWkWHE+0QfjZJ0QQZZ0qHfMOv7b8RnaHrY57IXspSJ
 iikOB5/zEo4aDJi+6c3i4VFU1uBWtNMukhduCsh6LNq1p+NQyT+n68YajRdyI+smKt5u YQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v9w00ut72-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 30 Sep 2019 16:45:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C2C4D4D;
 Mon, 30 Sep 2019 14:45:53 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 793062D0559;
 Mon, 30 Sep 2019 16:45:53 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 30 Sep
 2019 16:45:53 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 30 Sep 2019 16:45:52
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>
Date: Mon, 30 Sep 2019 16:45:51 +0200
Message-ID: <1569854751-22337-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-30_09:2019-09-25,2019-09-30 signatures=0
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
YXJkLgpUaGlzIGRldmljZSBzdXBwb3J0cyAyIGRpZmZlcmVudCBhZGRyZXNzZXMgKDB4MmEgYW5k
IDB4MzgpCmRlcGVuZGluZyBvbiB0aGUgZGlzcGxheSAgYm9hcmQgdmVyc2lvbiAoTUIxNDA3KS4K
ClNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgot
LS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWRrMi5kdHMgfCAyMyArKysrKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazIuZHRzIGIvYXJjaC9hcm0vYm9v
dC9kdHMvc3RtMzJtcDE1N2MtZGsyLmR0cwppbmRleCAyMGVhNjAxLi41MjdiYjc1IDEwMDY0NAot
LS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazIuZHRzCisrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMybXAxNTdjLWRrMi5kdHMKQEAgLTYxLDYgKzYxLDI5IEBACiAJfTsKIH07
CiAKKyZpMmMxIHsKKwl0b3VjaHNjcmVlbkAyYSB7CisJCWNvbXBhdGlibGUgPSAiZm9jYWx0ZWNo
LGZ0NjIzNiI7CisJCXJlZyA9IDwweDJhPjsKKwkJaW50ZXJydXB0cyA9IDwyIDI+OworCQlpbnRl
cnJ1cHQtcGFyZW50ID0gPCZncGlvZj47CisJCWludGVycnVwdC1jb250cm9sbGVyOworCQl0b3Vj
aHNjcmVlbi1zaXplLXggPSA8NDgwPjsKKwkJdG91Y2hzY3JlZW4tc2l6ZS15ID0gPDgwMD47CisJ
CXN0YXR1cyA9ICJva2F5IjsKKwl9OworCXRvdWNoc2NyZWVuQDM4IHsKKwkJY29tcGF0aWJsZSA9
ICJmb2NhbHRlY2gsZnQ2MjM2IjsKKwkJcmVnID0gPDB4Mzg+OworCQlpbnRlcnJ1cHRzID0gPDIg
Mj47CisJCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW9mPjsKKwkJaW50ZXJydXB0LWNvbnRyb2xs
ZXI7CisJCXRvdWNoc2NyZWVuLXNpemUteCA9IDw0ODA+OworCQl0b3VjaHNjcmVlbi1zaXplLXkg
PSA8ODAwPjsKKwkJc3RhdHVzID0gIm9rYXkiOworCX07Cit9OworCiAmbHRkYyB7CiAJc3RhdHVz
ID0gIm9rYXkiOwogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
