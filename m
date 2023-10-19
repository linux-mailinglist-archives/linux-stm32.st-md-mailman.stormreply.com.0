Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D857F7D0300
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Oct 2023 22:07:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F80FC6C842;
	Thu, 19 Oct 2023 20:07:53 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA4E5C6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Oct 2023 20:07:51 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtZJ6-0000Ak-Ve; Thu, 19 Oct 2023 22:07:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtZJ6-002rg1-IZ; Thu, 19 Oct 2023 22:07:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtZJ6-001veP-96; Thu, 19 Oct 2023 22:07:48 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 19 Oct 2023 22:07:03 +0200
Message-ID: <20231019200658.1754190-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
References: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2024;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=a4YNJqVWNTjxoPeyBz51eWsONkN24HxJQfsK5S4fI0Y=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlMYxnKf54sdPYpj7Bgncogp6hM/NyHjZw69SfO
 FSnOf0uohGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTGMZwAKCRCPgPtYfRL+
 ThuCB/9mwyjU5PRSSr25d3bJVQKHaWtBscZmvI1Zs52otx8OlSjsHRP1hUp0MKRDAkytj/es2u1
 psm3LpcY5LaVIOFl+Htk/TCLSEkOkR84cTgpTmgusK0qn25w0silPqpESu5V8bDNL2/iGnbOGSd
 mIIObFx3L/kzRBdURzo3HYsWUk3yOjs3Vm9zE8YbL2O9G96Vnc98QhxP/SR9rOCGkeI8qC6W5iZ
 B1zi6gDpdl9JHkbURETO1OBCRdRlGMUCDTshWOVNwUFVuJ6J5gpxuc3xsbluOxGKvPdmWLGziqr
 EYKLdWPfllQVuPlcyKaa5jj0m47+pc9/ozvbhrntRiPPQMB1
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/5] pwm: stm32: Implement .get_state()
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

RnJvbTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KCkltcGxlbWVudCB0
aGUgJnB3bV9vcHMtPmdldF9zdGF0ZSBjYWxsYmFjayBzbyBkcml2ZXJzIGNhbiBpbmhlcml0IFBX
TQpzdGF0ZSBzZXQgYnkgdGhlIGJvb3Rsb2FkZXIuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFph
YmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpbdWtsOiBzcGxpdCBvZmYgZnJvbSBhIHBhdGNo
IHRoYXQgYWxzbyBmaXhlcyBjbGsgZW5hYmxlIGNvdW50IGluIC5wcm9iZSgpXQpTaWduZWQtb2Zm
LWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgot
LS0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIu
YwppbmRleCBjYzZjYWUwN2MwMmMuLjY4MjM5NTY3YTU2NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9w
d20vcHdtLXN0bTMyLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKQEAgLTQ3MSw4ICs0
NzEsNTAgQEAgc3RhdGljIGludCBzdG0zMl9wd21fYXBwbHlfbG9ja2VkKHN0cnVjdCBwd21fY2hp
cCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIAlyZXR1cm4gcmV0OwogfQogCitzdGF0
aWMgaW50IHN0bTMyX3B3bV9nZXRfc3RhdGUoc3RydWN0IHB3bV9jaGlwICpjaGlwLAorCQkJICAg
ICAgIHN0cnVjdCBwd21fZGV2aWNlICpwd20sIHN0cnVjdCBwd21fc3RhdGUgKnN0YXRlKQorewor
CXN0cnVjdCBzdG0zMl9wd20gKnByaXYgPSB0b19zdG0zMl9wd21fZGV2KGNoaXApOworCWludCBj
aCA9IHB3bS0+aHdwd207CisJdW5zaWduZWQgbG9uZyByYXRlOworCXUzMiBjY2VyLCBwc2MsIGFy
ciwgY2NyOworCXU2NCBkdHksIHByZDsKKwlpbnQgcmV0OworCisJbXV0ZXhfbG9jaygmcHJpdi0+
bG9jayk7CisKKwlyZXQgPSByZWdtYXBfcmVhZChwcml2LT5yZWdtYXAsIFRJTV9DQ0VSLCAmY2Nl
cik7CisJaWYgKHJldCkKKwkJZ290byBvdXQ7CisKKwlzdGF0ZS0+ZW5hYmxlZCA9IGNjZXIgJiAo
VElNX0NDRVJfQ0MxRSA8PCAoY2ggKiA0KSk7CisJc3RhdGUtPnBvbGFyaXR5ID0gKGNjZXIgJiAo
VElNX0NDRVJfQ0MxUCA8PCAoY2ggKiA0KSkpID8KKwkJCSAgUFdNX1BPTEFSSVRZX0lOVkVSU0VE
IDogUFdNX1BPTEFSSVRZX05PUk1BTDsKKwlyZXQgPSByZWdtYXBfcmVhZChwcml2LT5yZWdtYXAs
IFRJTV9QU0MsICZwc2MpOworCWlmIChyZXQpCisJCWdvdG8gb3V0OworCXJldCA9IHJlZ21hcF9y
ZWFkKHByaXYtPnJlZ21hcCwgVElNX0FSUiwgJmFycik7CisJaWYgKHJldCkKKwkJZ290byBvdXQ7
CisJcmV0ID0gcmVnbWFwX3JlYWQocHJpdi0+cmVnbWFwLCBUSU1fQ0NSMSArIDQgKiBjaCwgJmNj
cik7CisJaWYgKHJldCkKKwkJZ290byBvdXQ7CisKKwlyYXRlID0gY2xrX2dldF9yYXRlKHByaXYt
PmNsayk7CisKKwlwcmQgPSAodTY0KU5TRUNfUEVSX1NFQyAqIChwc2MgKyAxKSAqIChhcnIgKyAx
KTsKKwlzdGF0ZS0+cGVyaW9kID0gRElWX1JPVU5EX1VQX1VMTChwcmQsIHJhdGUpOworCWR0eSA9
ICh1NjQpTlNFQ19QRVJfU0VDICogKHBzYyArIDEpICogY2NyOworCXN0YXRlLT5kdXR5X2N5Y2xl
ID0gRElWX1JPVU5EX1VQX1VMTChkdHksIHJhdGUpOworCitvdXQ6CisJbXV0ZXhfdW5sb2NrKCZw
cml2LT5sb2NrKTsKKwlyZXR1cm4gcmV0OworfQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IHB3bV9v
cHMgc3RtMzJwd21fb3BzID0gewogCS5hcHBseSA9IHN0bTMyX3B3bV9hcHBseV9sb2NrZWQsCisJ
LmdldF9zdGF0ZSA9IHN0bTMyX3B3bV9nZXRfc3RhdGUsCiAJLmNhcHR1cmUgPSBJU19FTkFCTEVE
KENPTkZJR19ETUFfRU5HSU5FKSA/IHN0bTMyX3B3bV9jYXB0dXJlIDogTlVMTCwKIH07CiAKLS0g
CjIuNDIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
