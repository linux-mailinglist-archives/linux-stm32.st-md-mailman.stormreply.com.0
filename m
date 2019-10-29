Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AD3E8534
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2019 11:15:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86AD0C36B0F;
	Tue, 29 Oct 2019 10:15:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A16FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 10:15:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9TACYMr029429; Tue, 29 Oct 2019 11:14:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=zBiYi7dNOMJTLdbXRroWIi9Q7ObD9twJevRTLSNm5yg=;
 b=T5hv/RHE9G72p/h2wm+cxxQ88edMTRYoaVaHpL3wGo0zYYb9ssrGajg5UwABOANwSqbH
 F7i/+2fXCm/2H5mJun87sWsRhN4F3VIyKPKRnb1Duxn0RQ9m0fsMZQQmhtFGqp8yonL4
 HOXT5ac4oXredrj3uf2ZJkzhHNY5Kv6wtZuMycuGn5amcOzToQS6vlrx33AVDrJAakhy
 PTaPGxbyun4PhlhuHBS5dRTO/LS//bjmYjQyTVxumx4fSZ1BTxZI3oR/AnWQyHwea6H/
 q1HWDrz6SrlVxEGcyJJZRFMc7OSxOnuLOV9KkWTNeOVARScu123YB6wUqXS/5SGe+J4Y Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vvb98f4ax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2019 11:14:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9ACC10002A;
 Tue, 29 Oct 2019 11:14:52 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9C14B2B28D8;
 Tue, 29 Oct 2019 11:14:52 +0100 (CET)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 29 Oct
 2019 11:14:52 +0100
Received: from localhost (10.201.22.222) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 29 Oct 2019 11:14:51
 +0100
From: Christophe Roullier <christophe.roullier@st.com>
To: <robh@kernel.org>, <davem@davemloft.net>, <joabreu@synopsys.com>,
 <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <peppe.cavallaro@st.com>
Date: Tue, 29 Oct 2019 11:14:38 +0100
Message-ID: <20191029101441.17290-3-christophe.roullier@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029101441.17290-1-christophe.roullier@st.com>
References: <20191029101441.17290-1-christophe.roullier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.222]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-29_03:2019-10-28,2019-10-29 signatures=0
Cc: devicetree@vger.kernel.org, andrew@lunn.ch, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [net: ethernet: stmmac: some fixes and optimizations
	2/5] net: ethernet: stmmac: fix warning when w=1 option is
	used during build
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

VGhpcyBwYXRjaCBmaXggdGhlIGZvbGxvd2luZyB3YXJuaW5nOgoKd2FybmluZzogdmFyaWFibGUg
4oCYcmV04oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCiAg
aW50IHZhbCwgcmV0OwoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBSb3VsbGllciA8Y2hyaXN0
b3BoZS5yb3VsbGllckBzdC5jb20+Ci0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWMtc3RtMzIuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN0bTMyLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1zdG0zMi5jCmluZGV4IDdlNjYxOTg2OGNjMS4uMTY3YTVlOTk5NjBh
IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1z
dG0zMi5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN0
bTMyLmMKQEAgLTE4NCw3ICsxODQsNyBAQCBzdGF0aWMgaW50IHN0bTMybXAxX3NldF9tb2RlKHN0
cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQpCiB7CiAJc3RydWN0IHN0bTMyX2R3
bWFjICpkd21hYyA9IHBsYXRfZGF0LT5ic3BfcHJpdjsKIAl1MzIgcmVnID0gZHdtYWMtPm1vZGVf
cmVnOwotCWludCB2YWwsIHJldDsKKwlpbnQgdmFsOwogCiAJc3dpdGNoIChwbGF0X2RhdC0+aW50
ZXJmYWNlKSB7CiAJY2FzZSBQSFlfSU5URVJGQUNFX01PREVfTUlJOgpAQCAtMjIwLDggKzIyMCw4
IEBAIHN0YXRpYyBpbnQgc3RtMzJtcDFfc2V0X21vZGUoc3RydWN0IHBsYXRfc3RtbWFjZW5ldF9k
YXRhICpwbGF0X2RhdCkKIAl9CiAKIAkvKiBOZWVkIHRvIHVwZGF0ZSBQTUNDTFJSIChjbGVhciBy
ZWdpc3RlcikgKi8KLQlyZXQgPSByZWdtYXBfd3JpdGUoZHdtYWMtPnJlZ21hcCwgcmVnICsgU1lT
Q0ZHX1BNQ0NMUlJfT0ZGU0VULAotCQkJICAgZHdtYWMtPm9wcy0+c3lzY2ZnX2V0aF9tYXNrKTsK
KwlyZWdtYXBfd3JpdGUoZHdtYWMtPnJlZ21hcCwgcmVnICsgU1lTQ0ZHX1BNQ0NMUlJfT0ZGU0VU
LAorCQkgICAgIGR3bWFjLT5vcHMtPnN5c2NmZ19ldGhfbWFzayk7CiAKIAkvKiBVcGRhdGUgUE1D
U0VUUiAoc2V0IHJlZ2lzdGVyKSAqLwogCXJldHVybiByZWdtYXBfdXBkYXRlX2JpdHMoZHdtYWMt
PnJlZ21hcCwgcmVnLAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
