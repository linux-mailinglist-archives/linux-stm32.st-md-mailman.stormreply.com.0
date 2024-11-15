Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2191B9CDFE1
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Nov 2024 14:27:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFB28C78028;
	Fri, 15 Nov 2024 13:27:04 +0000 (UTC)
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39FBAC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2024 13:26:57 +0000 (UTC)
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
 by mail.ispras.ru (Postfix) with ESMTPSA id BDDCA40777D2;
 Fri, 15 Nov 2024 13:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru BDDCA40777D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1731677215;
 bh=1e1LOUtI0Astf/a7ioL+raSU9vL4XmV0G94gVl8ZTzA=;
 h=From:To:Cc:Subject:Date:From;
 b=omP7zZoLTS3qTb2wHMaUKEYSdvj2aRwzUayVpDedz18JlYgjCW/T1J77VZLAhifpF
 tWkxPCmDCuE+bKNCgd61u5jWKhkHmQEk8LPHnSWRZ2dEno85iLZCNS08rRLC1rp4cH
 GO32E5lDSfPXhciACWi1DWaBIbaHF5xpLGgP+vKE=
From: Vitalii Mordan <mordan@ispras.ru>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 15 Nov 2024 16:26:32 +0300
Message-Id: <20241115132632.599188-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, lvc-project@linuxtesting.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fedor Pchelkin <pchelkin@ispras.ru>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Vadim Mutilin <mutilin@ispras.ru>, Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vitalii Mordan <mordan@ispras.ru>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3] stmmac: dwmac-intel-plat: remove
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
YXMucnU+ClJldmlld2VkLWJ5OiBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+Ci0tLQp2Mjog
QWRkIGEgY29tbWVudCBleHBsYWluaW5nIHdoeSBkd21hYy0+ZGF0YSBjYW5ub3QgYmUgTlVMTCwg
YXMgcGVyCkFuZHJldyBMdW5uJ3MgcmVxdWVzdC4KdjM6IFJlc29sdmUgbWVyZ2UgY29uZmxpY3Rz
LgogLi4uL3N0bWljcm8vc3RtbWFjL2R3bWFjLWludGVsLXBsYXQuYyAgICAgICAgIHwgNTMgKysr
KysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDI1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL2R3bWFjLWludGVsLXBsYXQuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL2R3bWFjLWludGVsLXBsYXQuYwppbmRleCBhNDMzNTI2ZGNiZTguLmQ5NGYwYTE1MGU5MyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtaW50
ZWwtcGxhdC5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFj
LWludGVsLXBsYXQuYwpAQCAtOTcsMzUgKzk3LDM4IEBAIHN0YXRpYyBpbnQgaW50ZWxfZXRoX3Bs
YXRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlkd21hYy0+ZGV2ID0gJnBk
ZXYtPmRldjsKIAlkd21hYy0+dHhfY2xrID0gTlVMTDsKIAorCS8qCisJICogVGhpcyBjYW5ub3Qg
cmV0dXJuIE5VTEwgYXQgdGhpcyBwb2ludCBiZWNhdXNlIHRoZSBkcml2ZXLigJlzCisJICogY29t
cGF0aWJpbGl0eSB3aXRoIHRoZSBkZXZpY2UgaGFzIGFscmVhZHkgYmVlbiB2YWxpZGF0ZWQgaW4K
KwkgKiBwbGF0Zm9ybV9tYXRjaCgpLgorCSAqLwogCWR3bWFjLT5kYXRhID0gZGV2aWNlX2dldF9t
YXRjaF9kYXRhKCZwZGV2LT5kZXYpOwotCWlmIChkd21hYy0+ZGF0YSkgewotCQlpZiAoZHdtYWMt
PmRhdGEtPmZpeF9tYWNfc3BlZWQpCi0JCQlwbGF0X2RhdC0+Zml4X21hY19zcGVlZCA9IGR3bWFj
LT5kYXRhLT5maXhfbWFjX3NwZWVkOwotCi0JCS8qIEVuYWJsZSBUWCBjbG9jayAqLwotCQlpZiAo
ZHdtYWMtPmRhdGEtPnR4X2Nsa19lbikgewotCQkJZHdtYWMtPnR4X2NsayA9IGRldm1fY2xrX2dl
dCgmcGRldi0+ZGV2LCAidHhfY2xrIik7Ci0JCQlpZiAoSVNfRVJSKGR3bWFjLT50eF9jbGspKQot
CQkJCXJldHVybiBQVFJfRVJSKGR3bWFjLT50eF9jbGspOworCWlmIChkd21hYy0+ZGF0YS0+Zml4
X21hY19zcGVlZCkKKwkJcGxhdF9kYXQtPmZpeF9tYWNfc3BlZWQgPSBkd21hYy0+ZGF0YS0+Zml4
X21hY19zcGVlZDsKKworCS8qIEVuYWJsZSBUWCBjbG9jayAqLworCWlmIChkd21hYy0+ZGF0YS0+
dHhfY2xrX2VuKSB7CisJCWR3bWFjLT50eF9jbGsgPSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRldiwg
InR4X2NsayIpOworCQlpZiAoSVNfRVJSKGR3bWFjLT50eF9jbGspKQorCQkJcmV0dXJuIFBUUl9F
UlIoZHdtYWMtPnR4X2Nsayk7CisKKwkJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGR3bWFjLT50
eF9jbGspOworCQlpZiAocmV0KSB7CisJCQlkZXZfZXJyKCZwZGV2LT5kZXYsCisJCQkJIkZhaWxl
ZCB0byBlbmFibGUgdHhfY2xrXG4iKTsKKwkJCXJldHVybiByZXQ7CisJCX0KIAotCQkJcmV0ID0g
Y2xrX3ByZXBhcmVfZW5hYmxlKGR3bWFjLT50eF9jbGspOworCQkvKiBDaGVjayBhbmQgY29uZmln
dXJlIFRYIGNsb2NrIHJhdGUgKi8KKwkJcmF0ZSA9IGNsa19nZXRfcmF0ZShkd21hYy0+dHhfY2xr
KTsKKwkJaWYgKGR3bWFjLT5kYXRhLT50eF9jbGtfcmF0ZSAmJgorCQkgICAgcmF0ZSAhPSBkd21h
Yy0+ZGF0YS0+dHhfY2xrX3JhdGUpIHsKKwkJCXJhdGUgPSBkd21hYy0+ZGF0YS0+dHhfY2xrX3Jh
dGU7CisJCQlyZXQgPSBjbGtfc2V0X3JhdGUoZHdtYWMtPnR4X2NsaywgcmF0ZSk7CiAJCQlpZiAo
cmV0KSB7CiAJCQkJZGV2X2VycigmcGRldi0+ZGV2LAotCQkJCQkiRmFpbGVkIHRvIGVuYWJsZSB0
eF9jbGtcbiIpOwotCQkJCXJldHVybiByZXQ7Ci0JCQl9Ci0KLQkJCS8qIENoZWNrIGFuZCBjb25m
aWd1cmUgVFggY2xvY2sgcmF0ZSAqLwotCQkJcmF0ZSA9IGNsa19nZXRfcmF0ZShkd21hYy0+dHhf
Y2xrKTsKLQkJCWlmIChkd21hYy0+ZGF0YS0+dHhfY2xrX3JhdGUgJiYKLQkJCSAgICByYXRlICE9
IGR3bWFjLT5kYXRhLT50eF9jbGtfcmF0ZSkgewotCQkJCXJhdGUgPSBkd21hYy0+ZGF0YS0+dHhf
Y2xrX3JhdGU7Ci0JCQkJcmV0ID0gY2xrX3NldF9yYXRlKGR3bWFjLT50eF9jbGssIHJhdGUpOwot
CQkJCWlmIChyZXQpIHsKLQkJCQkJZGV2X2VycigmcGRldi0+ZGV2LAotCQkJCQkJIkZhaWxlZCB0
byBzZXQgdHhfY2xrXG4iKTsKLQkJCQkJZ290byBlcnJfdHhfY2xrX2Rpc2FibGU7Ci0JCQkJfQor
CQkJCQkiRmFpbGVkIHRvIHNldCB0eF9jbGtcbiIpOworCQkJCWdvdG8gZXJyX3R4X2Nsa19kaXNh
YmxlOwogCQkJfQogCQl9CiAKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
