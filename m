Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 886369C3F04
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2024 14:01:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A2AEC78F65;
	Mon, 11 Nov 2024 13:01:09 +0000 (UTC)
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC871C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 13:01:01 +0000 (UTC)
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
 by mail.ispras.ru (Postfix) with ESMTPSA id 712E140B2287;
 Mon, 11 Nov 2024 13:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 712E140B2287
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1731330060;
 bh=LoDFg+BU0HIQ1tlmc6quFrKIJzeXNVPGLXuX0Js0k1k=;
 h=From:To:Cc:Subject:Date:From;
 b=QTFaz9NF4hXmf7LBTvZ2meQdmeUgnJSFQZnoC8H+TJWclm7XXWDHNULJOHOU2CDy8
 nS7sJP616ASKWNrnaJJxK+DbG9tgkeS92JDplwxw9ZFRqMxhbnzxclMaNoeidIZGs2
 O5tjBQ8h0Spg4ZADdEIGWX4gPM8Ck4QBGLovEfrw=
From: Vitalii Mordan <mordan@ispras.ru>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 11 Nov 2024 16:00:47 +0300
Message-Id: <20241111130047.3679099-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: lvc-project@linuxtesting.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Vadim Mutilin <mutilin@ispras.ru>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vitalii Mordan <mordan@ispras.ru>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2] stmmac: dwmac-intel-plat: remove
	redundant dwmac->data check in probe
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
YXMucnU+Ci0tLQp2MjogQWRkIGEgY29tbWVudCBleHBsYWluaW5nIHdoeSBkd21hYy0+ZGF0YSBj
YW5ub3QgYmUgTlVMTCwgYXMgcGVyCkFuZHJldyBMdW5uJ3MgcmVxdWVzdC4KTGluayB0byBhbm90
aGVyIHBhdGNoIHRvdWNoaW5nIHRoaXMgY29kZSBhbmQgdGFyZ2V0ZWQgYXQgbmV0IHRyZWU6Cmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL25ldGRldi8yMDI0MTEwODE3MzMzNC4yOTczNjAzLTEtbW9y
ZGFuQGlzcHJhcy5ydQogLi4uL3N0bWljcm8vc3RtbWFjL2R3bWFjLWludGVsLXBsYXQuYyAgICAg
ICAgIHwgNjkgKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlv
bnMoKyksIDMzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL2R3bWFjLWludGVsLXBsYXQuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL2R3bWFjLWludGVsLXBsYXQuYwppbmRleCAyMzBlNzk2NThjNTQuLjM3
N2M5ODgwMTMxOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvZHdtYWMtaW50ZWwtcGxhdC5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2R3bWFjLWludGVsLXBsYXQuYwpAQCAtOTcsNDcgKzk3LDUwIEBAIHN0YXRpYyBpbnQg
aW50ZWxfZXRoX3BsYXRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlkd21h
Yy0+ZGV2ID0gJnBkZXYtPmRldjsKIAlkd21hYy0+dHhfY2xrID0gTlVMTDsKIAorCS8qCisJICog
VGhpcyBjYW5ub3QgcmV0dXJuIE5VTEwgYXQgdGhpcyBwb2ludCBiZWNhdXNlIHRoZSBkcml2ZXLi
gJlzCisJICogY29tcGF0aWJpbGl0eSB3aXRoIHRoZSBkZXZpY2UgaGFzIGFscmVhZHkgYmVlbiB2
YWxpZGF0ZWQgaW4KKwkgKiBwbGF0Zm9ybV9tYXRjaCgpLgorCSAqLwogCWR3bWFjLT5kYXRhID0g
ZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOwotCWlmIChkd21hYy0+ZGF0YSkgewot
CQlpZiAoZHdtYWMtPmRhdGEtPmZpeF9tYWNfc3BlZWQpCi0JCQlwbGF0X2RhdC0+Zml4X21hY19z
cGVlZCA9IGR3bWFjLT5kYXRhLT5maXhfbWFjX3NwZWVkOwotCi0JCS8qIEVuYWJsZSBUWCBjbG9j
ayAqLwotCQlpZiAoZHdtYWMtPmRhdGEtPnR4X2Nsa19lbikgewotCQkJZHdtYWMtPnR4X2NsayA9
IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2LCAidHhfY2xrIik7Ci0JCQlpZiAoSVNfRVJSKGR3bWFj
LT50eF9jbGspKQotCQkJCXJldHVybiBQVFJfRVJSKGR3bWFjLT50eF9jbGspOwotCi0JCQljbGtf
cHJlcGFyZV9lbmFibGUoZHdtYWMtPnR4X2Nsayk7Ci0KLQkJCS8qIENoZWNrIGFuZCBjb25maWd1
cmUgVFggY2xvY2sgcmF0ZSAqLwotCQkJcmF0ZSA9IGNsa19nZXRfcmF0ZShkd21hYy0+dHhfY2xr
KTsKLQkJCWlmIChkd21hYy0+ZGF0YS0+dHhfY2xrX3JhdGUgJiYKLQkJCSAgICByYXRlICE9IGR3
bWFjLT5kYXRhLT50eF9jbGtfcmF0ZSkgewotCQkJCXJhdGUgPSBkd21hYy0+ZGF0YS0+dHhfY2xr
X3JhdGU7Ci0JCQkJcmV0ID0gY2xrX3NldF9yYXRlKGR3bWFjLT50eF9jbGssIHJhdGUpOwotCQkJ
CWlmIChyZXQpIHsKLQkJCQkJZGV2X2VycigmcGRldi0+ZGV2LAotCQkJCQkJIkZhaWxlZCB0byBz
ZXQgdHhfY2xrXG4iKTsKLQkJCQkJcmV0dXJuIHJldDsKLQkJCQl9Ci0JCQl9Ci0JCX0KLQotCQkv
KiBDaGVjayBhbmQgY29uZmlndXJlIFBUUCByZWYgY2xvY2sgcmF0ZSAqLwotCQlyYXRlID0gY2xr
X2dldF9yYXRlKHBsYXRfZGF0LT5jbGtfcHRwX3JlZik7Ci0JCWlmIChkd21hYy0+ZGF0YS0+cHRw
X3JlZl9jbGtfcmF0ZSAmJgotCQkgICAgcmF0ZSAhPSBkd21hYy0+ZGF0YS0+cHRwX3JlZl9jbGtf
cmF0ZSkgewotCQkJcmF0ZSA9IGR3bWFjLT5kYXRhLT5wdHBfcmVmX2Nsa19yYXRlOwotCQkJcmV0
ID0gY2xrX3NldF9yYXRlKHBsYXRfZGF0LT5jbGtfcHRwX3JlZiwgcmF0ZSk7CisJaWYgKGR3bWFj
LT5kYXRhLT5maXhfbWFjX3NwZWVkKQorCQlwbGF0X2RhdC0+Zml4X21hY19zcGVlZCA9IGR3bWFj
LT5kYXRhLT5maXhfbWFjX3NwZWVkOworCisJLyogRW5hYmxlIFRYIGNsb2NrICovCisJaWYgKGR3
bWFjLT5kYXRhLT50eF9jbGtfZW4pIHsKKwkJZHdtYWMtPnR4X2NsayA9IGRldm1fY2xrX2dldCgm
cGRldi0+ZGV2LCAidHhfY2xrIik7CisJCWlmIChJU19FUlIoZHdtYWMtPnR4X2NsaykpCisJCQly
ZXR1cm4gUFRSX0VSUihkd21hYy0+dHhfY2xrKTsKKworCQljbGtfcHJlcGFyZV9lbmFibGUoZHdt
YWMtPnR4X2Nsayk7CisKKwkJLyogQ2hlY2sgYW5kIGNvbmZpZ3VyZSBUWCBjbG9jayByYXRlICov
CisJCXJhdGUgPSBjbGtfZ2V0X3JhdGUoZHdtYWMtPnR4X2Nsayk7CisJCWlmIChkd21hYy0+ZGF0
YS0+dHhfY2xrX3JhdGUgJiYKKwkJICAgIHJhdGUgIT0gZHdtYWMtPmRhdGEtPnR4X2Nsa19yYXRl
KSB7CisJCQlyYXRlID0gZHdtYWMtPmRhdGEtPnR4X2Nsa19yYXRlOworCQkJcmV0ID0gY2xrX3Nl
dF9yYXRlKGR3bWFjLT50eF9jbGssIHJhdGUpOwogCQkJaWYgKHJldCkgewogCQkJCWRldl9lcnIo
JnBkZXYtPmRldiwKLQkJCQkJIkZhaWxlZCB0byBzZXQgY2xrX3B0cF9yZWZcbiIpOworCQkJCQki
RmFpbGVkIHRvIHNldCB0eF9jbGtcbiIpOwogCQkJCXJldHVybiByZXQ7CiAJCQl9CiAJCX0KIAl9
CiAKKwkvKiBDaGVjayBhbmQgY29uZmlndXJlIFBUUCByZWYgY2xvY2sgcmF0ZSAqLworCXJhdGUg
PSBjbGtfZ2V0X3JhdGUocGxhdF9kYXQtPmNsa19wdHBfcmVmKTsKKwlpZiAoZHdtYWMtPmRhdGEt
PnB0cF9yZWZfY2xrX3JhdGUgJiYKKwkgICAgcmF0ZSAhPSBkd21hYy0+ZGF0YS0+cHRwX3JlZl9j
bGtfcmF0ZSkgeworCQlyYXRlID0gZHdtYWMtPmRhdGEtPnB0cF9yZWZfY2xrX3JhdGU7CisJCXJl
dCA9IGNsa19zZXRfcmF0ZShwbGF0X2RhdC0+Y2xrX3B0cF9yZWYsIHJhdGUpOworCQlpZiAocmV0
KSB7CisJCQlkZXZfZXJyKCZwZGV2LT5kZXYsCisJCQkJIkZhaWxlZCB0byBzZXQgY2xrX3B0cF9y
ZWZcbiIpOworCQkJcmV0dXJuIHJldDsKKwkJfQorCX0KKwogCXBsYXRfZGF0LT5ic3BfcHJpdiA9
IGR3bWFjOwogCXBsYXRfZGF0LT5lZWVfdXNlY3NfcmF0ZSA9IHBsYXRfZGF0LT5jbGtfcHRwX3Jh
dGU7CiAKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
