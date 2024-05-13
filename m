Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A667B8C4975
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2024 00:04:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C5C5C6B476;
	Mon, 13 May 2024 22:04:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 878B1C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 22:04:08 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F1DE587CDA;
 Tue, 14 May 2024 00:04:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715637848;
 bh=r7aGBuMKfnpQF7IqQKDwqXemymokbgzAAMpCCmuF0v4=;
 h=From:To:Cc:Subject:Date:From;
 b=omC4OWUq8OW0Fh1BIO1BB1rG7Ghaa5THWYgXgUqQO7sCYWq6+bfVn2BQKECj49yi0
 y7496Llpj0770i2+ShOVs/CoPgq0+WxeaOmreOE9A3OaL7T7AiEwwQcGPDbomY0ji9
 RZ+3scgUBYT3DkxpPLpgct9L/dBUnRMpimL72GnNwEyrb/U669A7tf9jnhLC8eBCdN
 ItFO3LYUyRnSRY8ORmC8qxUzqQ/vay6UpYB1z2B0gfWhwziXYSMKLhWMvH547zMN1y
 u2qSQ9o0D6aMgXDTcDO3VuJOmaTVRzu85iCScEol2s7SJ4oaX16oWWJzkGRHDrc8U0
 vBdZ/XDsOKuzQ==
From: Marek Vasut <marex@denx.de>
To: linux-crypto@vger.kernel.org
Date: Tue, 14 May 2024 00:02:28 +0200
Message-ID: <20240513220349.183568-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Olivia Mackall <olivia@selenic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] [RFC] clk: stm32mp1: Keep RNG1 clock always
	running
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

SW4gY2FzZSBvZiBTVE0zMk1QMTV4Qy9GIFNvQywgaW4gY2FzZSB0aGUgUk5HMSBpcyBlbmFibGVk
IGluIERULCB0aGUgUk5HMQpjbG9jayBhcmUgbWFuYWdlZCBieSB0aGUgZHJpdmVyLiBUaGUgUk5H
MSBjbG9jayBhcmUgdG9nZ2xlZCBvZmYgb24gZW50cnkKdG8gc3VzcGVuZCBhbmQgYmFjayBvbiBv
biByZXN1bWUuIEZvciByZWFzb24gdGh1cyBmYXIgdW5rbm93biAoY291bGQgdGhpcwpiZSBzb21l
IGNoaXAgaXNzdWU/KSwgd2hlbiB0aGUgc3lzdGVtIGdvZXMgdGhyb3VnaCByZXBlYXRlZCBzdXNw
ZW5kL3Jlc3VtZQpjeWNsZXMsIHRoZSBzeXN0ZW0gZXZlbnR1YWxseSBoYW5ncyBhZnRlciBhIGZl
dyBzdWNoIGN5Y2xlcy4KClRoaXMgY2FuIGJlIHJlcHJvZHVjZWQgd2l0aCBDT05GSUdfUE1fREVC
VUcgJ3BtX3Rlc3QnIHRoaXMgd2F5OgoiCmVjaG8gY29yZSA+IC9zeXMvcG93ZXIvcG1fdGVzdAp3
aGlsZSB0cnVlIDsgZG8KICAgIGVjaG8gbWVtID4gL3N5cy9wb3dlci9zdGF0ZQogICAgc2xlZXAg
MiA7CmRvbmUKIgpUaGUgc3lzdGVtIGxvY2tzIHVwIGFmdGVyIGFib3V0IGEgbWludXRlIGFuZCBp
ZiBXRFQgaXMgYWN0aXZlLCByZXNldHMuCgpJZiB0aGUgUk5HMSBjbG9jayBhcmUga2VwdCBlbmFi
bGVkIGFjcm9zcyBzdXNwZW5kL3Jlc3VtZSwgZWl0aGVyIHVzaW5nCnRoaXMgY2hhbmdlLCBvciBi
eSBrZWVwaW5nIHRoZSBjbG9jayBlbmFibGVkIGluIFJORyBkcml2ZXIgc3VzcGVuZC9yZXN1bWUK
Y2FsbGJhY2tzLCB0aGUgc3lzdGVtIGRvZXMgbm90IGxvY2sgdXAuCgpOT1RFOiBUaGlzIHBhdGNo
IGlzIGEgd29ya2Fyb3VuZC4gSXQgd291bGQgYmUgZ29vZCB0byBrbm93IHdoeSBkb2VzIHRoaXMK
ICAgICAgY2hhbmdlIG1ha2UgdGhlIGhhbmcgZ28gYXdheSwgd2hldGhlciB0aGlzIGlzIGEgY2hp
cCBpc3N1ZSBvciBzb21lCiAgICAgIG90aGVyIHByb2JsZW0gPwoKU2lnbmVkLW9mZi1ieTogTWFy
ZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Ci0tLQpDYzogIlV3ZSBLbGVpbmUtS8O2bmlnIiA8dS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFu
ZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KQ2M6IEdhYnJpZWwgRmVybmFuZGV6IDxnYWJyaWVsLmZl
cm5hbmRlekBmb3NzLnN0LmNvbT4KQ2M6IEdhdGllbiBDaGV2YWxsaWVyIDxnYXRpZW4uY2hldmFs
bGllckBmb3NzLnN0LmNvbT4KQ2M6IEhlcmJlcnQgWHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9y
Zy5hdT4KQ2M6IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4KQ2M6
IE1pY2hhZWwgVHVycXVldHRlIDxtdHVycXVldHRlQGJheWxpYnJlLmNvbT4KQ2M6IE9saXZpYSBN
YWNrYWxsIDxvbGl2aWFAc2VsZW5pYy5jb20+CkNjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPgpDYzogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPgpDYzogWWFuZyBZaW5nbGlh
bmcgPHlhbmd5aW5nbGlhbmdAaHVhd2VpLmNvbT4KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwpDYzogbGludXgtY2xrQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtY3J5
cHRvQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQotLS0KIGRyaXZlcnMvY2hhci9od19yYW5kb20vc3RtMzItcm5nLmMgfCAyICsrCiBk
cml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDEuYyAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2No
YXIvaHdfcmFuZG9tL3N0bTMyLXJuZy5jIGIvZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9zdG0zMi1y
bmcuYwppbmRleCA3ZDBkZThhYjVlN2Y1Li5lYzAzMTRmMDVmZjNlIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2NoYXIvaHdfcmFuZG9tL3N0bTMyLXJuZy5jCisrKyBiL2RyaXZlcnMvY2hhci9od19yYW5k
b20vc3RtMzItcm5nLmMKQEAgLTQwMyw2ICs0MDMsNyBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51
c2VkIHN0bTMyX3JuZ19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIAogCXdyaXRlbF9yZWxh
eGVkKHByaXYtPnBtX2NvbmYuY3IsIHByaXYtPmJhc2UgKyBSTkdfQ1IpOwogCisJLy8gS2VlcGlu
ZyB0aGUgY2xvY2sgZW5hYmxlZCBhY3Jvc3Mgc3VzcGVuZC9yZXN1bWUgaGVscHMgdG9vCiAJY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKHByaXYtPmNsayk7CiAKIAlyZXR1cm4gMDsKQEAgLTQzNCw2ICs0
MzUsNyBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHN0bTMyX3JuZ19yZXN1bWUoc3RydWN0
IGRldmljZSAqZGV2KQogCWludCBlcnI7CiAJdTMyIHJlZzsKIAorCS8vIEtlZXBpbmcgdGhlIGNs
b2NrIGVuYWJsZWQgYWNyb3NzIHN1c3BlbmQvcmVzdW1lIGhlbHBzIHRvbwogCWVyciA9IGNsa19w
cmVwYXJlX2VuYWJsZShwcml2LT5jbGspOwogCWlmIChlcnIpCiAJCXJldHVybiBlcnI7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDEuYyBiL2RyaXZlcnMvY2xrL3N0
bTMyL2Nsay1zdG0zMm1wMS5jCmluZGV4IDdlMjMzNzI5NzQwMmEuLjFhNmU4NTNkOTM1ZmEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL3N0bTMyL2Nsay1zdG0zMm1wMS5jCisrKyBiL2RyaXZlcnMv
Y2xrL3N0bTMyL2Nsay1zdG0zMm1wMS5jCkBAIC0yMDAwLDcgKzIwMDAsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGNsb2NrX2NvbmZpZyBzdG0zMm1wMV9jbG9ja19jZmdbXSA9IHsKIAlLQ0xLKFNE
TU1DM19LLCAic2RtbWMzX2siLCBzZG1tYzNfc3JjLCAwLCBHX1NETU1DMywgTV9TRE1NQzMpLAog
CUtDTEsoRk1DX0ssICJmbWNfayIsIGZtY19zcmMsIDAsIEdfRk1DLCBNX0ZNQyksCiAJS0NMSyhR
U1BJX0ssICJxc3BpX2siLCBxc3BpX3NyYywgMCwgR19RU1BJLCBNX1FTUEkpLAotCUtDTEsoUk5H
MV9LLCAicm5nMV9rIiwgcm5nX3NyYywgMCwgR19STkcxLCBNX1JORzEpLAorCUtDTEsoUk5HMV9L
LCAicm5nMV9rIiwgcm5nX3NyYywgQ0xLX0lTX0NSSVRJQ0FMLCBHX1JORzEsIE1fUk5HMSksCiAJ
S0NMSyhSTkcyX0ssICJybmcyX2siLCBybmdfc3JjLCAwLCBHX1JORzIsIE1fUk5HMiksCiAJS0NM
SyhVU0JQSFlfSywgInVzYnBoeV9rIiwgdXNicGh5X3NyYywgMCwgR19VU0JQSFksIE1fVVNCUEhZ
KSwKIAlLQ0xLKFNUR0VOX0ssICJzdGdlbl9rIiwgc3RnZW5fc3JjLCBDTEtfSVNfQ1JJVElDQUws
IEdfU1RHRU4sIE1fU1RHRU4pLAotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
