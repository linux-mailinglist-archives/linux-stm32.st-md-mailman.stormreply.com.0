Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE470992861
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 11:42:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EDA7C7803A;
	Mon,  7 Oct 2024 09:42:37 +0000 (UTC)
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2820EC7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2024 18:39:34 +0000 (UTC)
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
 by mail.ispras.ru (Postfix) with ESMTPSA id 61DBA40B2780;
 Mon, 30 Sep 2024 18:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 61DBA40B2780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1727721573;
 bh=EkePz0QZBHDVlWdj7UJdZqKYGef/fDfv5u3pL2M96dw=;
 h=From:To:Cc:Subject:Date:From;
 b=WWW7kbfJvA13JblxvXd6D0igUgcj+J2GCFl3FxMhnURTiaQnK4YYGASkODxuNEkGl
 +50R+k2UEEUAY9Ob110lGtKH5La9W/RvjibsXyMAFBwp/v9JneDPqOGpJhTtZTHZVl
 IHNDJQr8DsgQJTeEGBHzRD1LrY5moNq2ZFyT1Oak=
From: Vitalii Mordan <mordan@ispras.ru>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 30 Sep 2024 21:39:26 +0300
Message-Id: <20240930183926.2112546-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Oct 2024 09:42:34 +0000
Cc: lvc-project@linuxtesting.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Vadim Mutilin <mutilin@ispras.ru>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vitalii Mordan <mordan@ispras.ru>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] stmmac: dwmac-intel-plat: remove
	redundant check dwmac->data in probe
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

VGhlIGRyaXZlcuKAmXMgY29tcGF0aWJpbGl0eSB3aXRoIGRldmljZXMgaXMgY29uZmlybWVkIGVh
cmxpZXIgaW4KcGxhdGZvcm1fbWF0Y2goKS4gU2luY2UgcmVhY2hpbmcgcHJvYmUgbWVhbnMgdGhl
IGRldmljZSBpcyB2YWxpZCwKdGhlIGV4dHJhIGNoZWNrIGNhbiBiZSByZW1vdmVkIHRvIHNpbXBs
aWZ5IHRoZSBjb2RlLgoKU2lnbmVkLW9mZi1ieTogVml0YWxpaSBNb3JkYW4gPG1vcmRhbkBpc3By
YXMucnU+Ci0tLQogLi4uL3N0bWljcm8vc3RtbWFjL2R3bWFjLWludGVsLXBsYXQuYyAgICAgICAg
IHwgNjQgKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMo
KyksIDMzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjLWludGVsLXBsYXQuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjLWludGVsLXBsYXQuYwppbmRleCBkNjhmMGM0ZTc4MzUuLjkxMzli
MmIxYmYwYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
ZHdtYWMtaW50ZWwtcGxhdC5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL2R3bWFjLWludGVsLXBsYXQuYwpAQCAtOTgsNDYgKzk4LDQ0IEBAIHN0YXRpYyBpbnQgaW50
ZWxfZXRoX3BsYXRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlkd21hYy0+
dHhfY2xrID0gTlVMTDsKIAogCWR3bWFjLT5kYXRhID0gZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZw
ZGV2LT5kZXYpOwotCWlmIChkd21hYy0+ZGF0YSkgewotCQlpZiAoZHdtYWMtPmRhdGEtPmZpeF9t
YWNfc3BlZWQpCi0JCQlwbGF0X2RhdC0+Zml4X21hY19zcGVlZCA9IGR3bWFjLT5kYXRhLT5maXhf
bWFjX3NwZWVkOwotCi0JCS8qIEVuYWJsZSBUWCBjbG9jayAqLwotCQlpZiAoZHdtYWMtPmRhdGEt
PnR4X2Nsa19lbikgewotCQkJZHdtYWMtPnR4X2NsayA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2
LCAidHhfY2xrIik7Ci0JCQlpZiAoSVNfRVJSKGR3bWFjLT50eF9jbGspKQotCQkJCXJldHVybiBQ
VFJfRVJSKGR3bWFjLT50eF9jbGspOwotCi0JCQljbGtfcHJlcGFyZV9lbmFibGUoZHdtYWMtPnR4
X2Nsayk7Ci0KLQkJCS8qIENoZWNrIGFuZCBjb25maWd1cmUgVFggY2xvY2sgcmF0ZSAqLwotCQkJ
cmF0ZSA9IGNsa19nZXRfcmF0ZShkd21hYy0+dHhfY2xrKTsKLQkJCWlmIChkd21hYy0+ZGF0YS0+
dHhfY2xrX3JhdGUgJiYKLQkJCSAgICByYXRlICE9IGR3bWFjLT5kYXRhLT50eF9jbGtfcmF0ZSkg
ewotCQkJCXJhdGUgPSBkd21hYy0+ZGF0YS0+dHhfY2xrX3JhdGU7Ci0JCQkJcmV0ID0gY2xrX3Nl
dF9yYXRlKGR3bWFjLT50eF9jbGssIHJhdGUpOwotCQkJCWlmIChyZXQpIHsKLQkJCQkJZGV2X2Vy
cigmcGRldi0+ZGV2LAotCQkJCQkJIkZhaWxlZCB0byBzZXQgdHhfY2xrXG4iKTsKLQkJCQkJcmV0
dXJuIHJldDsKLQkJCQl9Ci0JCQl9Ci0JCX0KLQotCQkvKiBDaGVjayBhbmQgY29uZmlndXJlIFBU
UCByZWYgY2xvY2sgcmF0ZSAqLwotCQlyYXRlID0gY2xrX2dldF9yYXRlKHBsYXRfZGF0LT5jbGtf
cHRwX3JlZik7Ci0JCWlmIChkd21hYy0+ZGF0YS0+cHRwX3JlZl9jbGtfcmF0ZSAmJgotCQkgICAg
cmF0ZSAhPSBkd21hYy0+ZGF0YS0+cHRwX3JlZl9jbGtfcmF0ZSkgewotCQkJcmF0ZSA9IGR3bWFj
LT5kYXRhLT5wdHBfcmVmX2Nsa19yYXRlOwotCQkJcmV0ID0gY2xrX3NldF9yYXRlKHBsYXRfZGF0
LT5jbGtfcHRwX3JlZiwgcmF0ZSk7CisJaWYgKGR3bWFjLT5kYXRhLT5maXhfbWFjX3NwZWVkKQor
CQlwbGF0X2RhdC0+Zml4X21hY19zcGVlZCA9IGR3bWFjLT5kYXRhLT5maXhfbWFjX3NwZWVkOwor
CisJLyogRW5hYmxlIFRYIGNsb2NrICovCisJaWYgKGR3bWFjLT5kYXRhLT50eF9jbGtfZW4pIHsK
KwkJZHdtYWMtPnR4X2NsayA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2LCAidHhfY2xrIik7CisJ
CWlmIChJU19FUlIoZHdtYWMtPnR4X2NsaykpCisJCQlyZXR1cm4gUFRSX0VSUihkd21hYy0+dHhf
Y2xrKTsKKworCQljbGtfcHJlcGFyZV9lbmFibGUoZHdtYWMtPnR4X2Nsayk7CisKKwkJLyogQ2hl
Y2sgYW5kIGNvbmZpZ3VyZSBUWCBjbG9jayByYXRlICovCisJCXJhdGUgPSBjbGtfZ2V0X3JhdGUo
ZHdtYWMtPnR4X2Nsayk7CisJCWlmIChkd21hYy0+ZGF0YS0+dHhfY2xrX3JhdGUgJiYKKwkJICAg
IHJhdGUgIT0gZHdtYWMtPmRhdGEtPnR4X2Nsa19yYXRlKSB7CisJCQlyYXRlID0gZHdtYWMtPmRh
dGEtPnR4X2Nsa19yYXRlOworCQkJcmV0ID0gY2xrX3NldF9yYXRlKGR3bWFjLT50eF9jbGssIHJh
dGUpOwogCQkJaWYgKHJldCkgewogCQkJCWRldl9lcnIoJnBkZXYtPmRldiwKLQkJCQkJIkZhaWxl
ZCB0byBzZXQgY2xrX3B0cF9yZWZcbiIpOworCQkJCQkiRmFpbGVkIHRvIHNldCB0eF9jbGtcbiIp
OwogCQkJCXJldHVybiByZXQ7CiAJCQl9CiAJCX0KIAl9CiAKKwkvKiBDaGVjayBhbmQgY29uZmln
dXJlIFBUUCByZWYgY2xvY2sgcmF0ZSAqLworCXJhdGUgPSBjbGtfZ2V0X3JhdGUocGxhdF9kYXQt
PmNsa19wdHBfcmVmKTsKKwlpZiAoZHdtYWMtPmRhdGEtPnB0cF9yZWZfY2xrX3JhdGUgJiYKKwkg
ICAgcmF0ZSAhPSBkd21hYy0+ZGF0YS0+cHRwX3JlZl9jbGtfcmF0ZSkgeworCQlyYXRlID0gZHdt
YWMtPmRhdGEtPnB0cF9yZWZfY2xrX3JhdGU7CisJCXJldCA9IGNsa19zZXRfcmF0ZShwbGF0X2Rh
dC0+Y2xrX3B0cF9yZWYsIHJhdGUpOworCQlpZiAocmV0KSB7CisJCQlkZXZfZXJyKCZwZGV2LT5k
ZXYsCisJCQkJIkZhaWxlZCB0byBzZXQgY2xrX3B0cF9yZWZcbiIpOworCQkJcmV0dXJuIHJldDsK
KwkJfQorCX0KKwogCXBsYXRfZGF0LT5ic3BfcHJpdiA9IGR3bWFjOwogCXBsYXRfZGF0LT5lZWVf
dXNlY3NfcmF0ZSA9IHBsYXRfZGF0LT5jbGtfcHRwX3JhdGU7CiAKLS0gCjIuMjUuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
