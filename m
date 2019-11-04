Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 819F8EDCDE
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2019 11:51:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75E87C36B0B;
	Mon,  4 Nov 2019 10:51:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCBBCC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Nov 2019 10:51:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA4AonqB008086; Mon, 4 Nov 2019 11:51:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=Qaurhduesnw25w0jh3pIp/yKxoZ09ZwN/xuDw+l7BNo=;
 b=MDi01UsaPAO8xz8ft6zNnwdNE5PplDfS44Pz4LtEZhurX/UMtGwpBALwoTVtceYbxtZB
 fuJWU5XfdN5fn0JvoZTdL5hipFgSWtcXh3Hn8ZsldHmNZ8Ebhlbs2kVJ9R89oVSjkJy6
 oNF5gppFiaNOieDmc4Lwo2OPoBWBgab5lNiWeL4qL9W5lVtKY0vJMKF5JQkjgUMvd1sQ
 i/3ie0JVmeygrKmHufnYpqE530wbY/p5nMIcID4yiCIH/pA/MKUnC5DE0HEZmbaK8BQ0
 b2LDp4twHDFT0C4FZHEMFlaAxE5w10/IhV5PXsy3Ylm8S2Mr9imz/VFbE+rius8Werdv Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w0ytchmh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Nov 2019 11:51:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B21BC100034;
 Mon,  4 Nov 2019 11:51:04 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 954D62BDA87;
 Mon,  4 Nov 2019 11:51:04 +0100 (CET)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 4 Nov 2019
 11:51:04 +0100
Received: from localhost (10.201.22.222) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 4 Nov 2019 11:51:03
 +0100
From: Christophe Roullier <christophe.roullier@st.com>
To: <robh@kernel.org>, <davem@davemloft.net>, <joabreu@synopsys.com>,
 <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <peppe.cavallaro@st.com>
Date: Mon, 4 Nov 2019 11:51:00 +0100
Message-ID: <20191104105100.4288-1-christophe.roullier@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.222]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-11-04_07:2019-11-04,2019-11-04 signatures=0
Cc: devicetree@vger.kernel.org, andrew@lunn.ch, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V2 1/1] net: ethernet: stmmac: drop unused
	variable in stm32mp1_set_mode()
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

QnVpbGRpbmcgd2l0aCBXPTEgKGNmLnNjcmlwdHMvTWFrZWZpbGUuZXh0cmF3YXJuKSBvdXRwdXRz
Ogp3YXJuaW5nOiB2YXJpYWJsZSDigJhyZXTigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQt
YnV0LXNldC12YXJpYWJsZV0KCkRyb3AgdGhlIHVudXNlZCAncmV0JyB2YXJpYWJsZS4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdG9waGUgUm91bGxpZXIgPGNocmlzdG9waGUucm91bGxpZXJAc3QuY29t
PgoKLS0tClYyOiB1cGRhdGUgY29tbWl0IG1lc3NhZ2Ugd2l0aCBNYXJjIEdvbnphbGV6IHJlY29t
bWVuZGF0aW9uCi0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMt
c3RtMzIuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL2R3bWFjLXN0bTMyLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9k
d21hYy1zdG0zMi5jCmluZGV4IDRlZjA0MWJkZjZhMS4uNTk1YWYyZWM4OWZiIDEwMDY0NAotLS0g
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdG0zMi5jCisrKyBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN0bTMyLmMKQEAgLTE3
NSw3ICsxNzUsNyBAQCBzdGF0aWMgaW50IHN0bTMybXAxX3NldF9tb2RlKHN0cnVjdCBwbGF0X3N0
bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQpCiB7CiAJc3RydWN0IHN0bTMyX2R3bWFjICpkd21hYyA9
IHBsYXRfZGF0LT5ic3BfcHJpdjsKIAl1MzIgcmVnID0gZHdtYWMtPm1vZGVfcmVnOwotCWludCB2
YWwsIHJldDsKKwlpbnQgdmFsOwogCiAJc3dpdGNoIChwbGF0X2RhdC0+aW50ZXJmYWNlKSB7CiAJ
Y2FzZSBQSFlfSU5URVJGQUNFX01PREVfTUlJOgpAQCAtMjExLDggKzIxMSw4IEBAIHN0YXRpYyBp
bnQgc3RtMzJtcDFfc2V0X21vZGUoc3RydWN0IHBsYXRfc3RtbWFjZW5ldF9kYXRhICpwbGF0X2Rh
dCkKIAl9CiAKIAkvKiBOZWVkIHRvIHVwZGF0ZSBQTUNDTFJSIChjbGVhciByZWdpc3RlcikgKi8K
LQlyZXQgPSByZWdtYXBfd3JpdGUoZHdtYWMtPnJlZ21hcCwgcmVnICsgU1lTQ0ZHX1BNQ0NMUlJf
T0ZGU0VULAotCQkJICAgZHdtYWMtPm9wcy0+c3lzY2ZnX2V0aF9tYXNrKTsKKwlyZWdtYXBfd3Jp
dGUoZHdtYWMtPnJlZ21hcCwgcmVnICsgU1lTQ0ZHX1BNQ0NMUlJfT0ZGU0VULAorCQkgICAgIGR3
bWFjLT5vcHMtPnN5c2NmZ19ldGhfbWFzayk7CiAKIAkvKiBVcGRhdGUgUE1DU0VUUiAoc2V0IHJl
Z2lzdGVyKSAqLwogCXJldHVybiByZWdtYXBfdXBkYXRlX2JpdHMoZHdtYWMtPnJlZ21hcCwgcmVn
LAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
