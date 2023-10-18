Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADBB7CE901
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Oct 2023 22:32:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35039C6C838;
	Wed, 18 Oct 2023 20:32:12 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92FF1C6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Oct 2023 20:32:11 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtDD1-0005Tl-TF; Wed, 18 Oct 2023 22:32:03 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtDD0-002dOC-Mr; Wed, 18 Oct 2023 22:32:02 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtDD0-001EZa-DB; Wed, 18 Oct 2023 22:32:02 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 18 Oct 2023 22:31:55 +0200
Message-ID: <20231018203154.1681457-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1581;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=bXJUo/z+u9bBLY/DopIaV2gKwAAC4QUnYIlb8+3X6ZM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlMEC6mjP3aOiWQlYYkVs8185sPrHHRxRV+WacH
 LXgAKdjbvuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTBAugAKCRCPgPtYfRL+
 Tt+qCACjOC3q/D8r3OPxiaPFQOU37yCyq6KNUzn+eR5RuNkHMpvJ0yqrXZEDib+3tLVJjNw0rx8
 XnRQu7OvZ56gWCMIoCScjRf2A+JArgBMJdZ0+0Z4EEOHAA8qMbNiKpTkyrlOESTgHicoa7OzgVk
 UUKE7QOy10emOheXcaqlzWlop1/i8O8gkZrWsT5SzCfGEwXyfElP2sQRVfl96+J+x5yNO8/9xA8
 BRCe64NPvJTVz2VFZkxL3+n6V/i3yFrhW7EOWtrVkGPt3OmdHMRHhJvnchtU2uV9T61T7mJwuy5
 iAoYrpHKpXF5e1sSV9a+kKlzMrAVcuKmuScPp3RvCqpYVWwS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: lxa-tac: drive powerboard
	lines as open-drain
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

RnJvbTogTGVvbmFyZCBHw7ZocnMgPGwuZ29laHJzQHBlbmd1dHJvbml4LmRlPgoKVGhpcyByZXN1
bHRzIGluIGEgc2xpZ2h0IGltcHJvdmVtZW50IGluIEVNSSBwZXJmb3JtYW5jZSBkdWUgdG8gdGhl
IGxpbmVzCm5vIGxvbmdlciBiZWluZyBkcml2ZW4gYnkgdGhlIHNvbWV3aGF0IG5vaXN5IFZERF9J
TyBzdXBwbHkgb2YgdGhlIFNvTS4KClNpZ25lZC1vZmYtYnk6IExlb25hcmQgR8O2aHJzIDxsLmdv
ZWhyc0BwZW5ndXRyb25peC5kZT4KU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdC9z
dG0zMm1wMTU3Yy1seGEtdGFjLWdlbjIuZHRzIHwgMiArLQogYXJjaC9hcm0vYm9vdC9kdHMvc3Qv
c3RtMzJtcDE1eGMtbHhhLXRhYy5kdHNpICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3N0L3N0bTMybXAxNTdjLWx4YS10YWMtZ2VuMi5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9z
dC9zdG0zMm1wMTU3Yy1seGEtdGFjLWdlbjIuZHRzCmluZGV4IDhhMzRkMTVlOTAwNS4uNGNjMTc3
MDMxNjYxIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTU3Yy1seGEt
dGFjLWdlbjIuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLWx4YS10
YWMtZ2VuMi5kdHMKQEAgLTE0OCw3ICsxNDgsNyBAQCBhZGNAMCB7CiAJCWNvbXBhdGlibGUgPSAi
dGksbG1wOTIwNjQiOwogCQlyZWcgPSA8MD47CiAKLQkJcmVzZXQtZ3Bpb3MgPSA8JmdwaW9hIDQg
R1BJT19BQ1RJVkVfSElHSD47CisJCXJlc2V0LWdwaW9zID0gPCZncGlvYSA0IChHUElPX0FDVElW
RV9ISUdIIHwgR1BJT19PUEVOX0RSQUlOKT47CiAJCXNodW50LXJlc2lzdG9yLW1pY3JvLW9obXMg
PSA8MTUwMDA+OwogCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwPjsKIAkJdmRkLXN1cHBs
eSA9IDwmcmVnX3BiXzN2Mz47CmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0z
Mm1wMTV4Yy1seGEtdGFjLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4Yy1s
eGEtdGFjLmR0c2kKaW5kZXggZjA5YjdjMzg0YmQ5Li4xODhjOWNmYzcxMDIgMTAwNjQ0Ci0tLSBh
L2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXhjLWx4YS10YWMuZHRzaQorKysgYi9hcmNo
L2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4Yy1seGEtdGFjLmR0c2kKQEAgLTQwOSw3ICs0MDks
NyBAQCAmc2RtbWMyIHsKICZzcGkyIHsKIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwogCXBp
bmN0cmwtMCA9IDwmc3BpMl9waW5zX2M+OwotCWNzLWdwaW9zID0gPCZncGlvZiAxMiBHUElPX0FD
VElWRV9MT1c+OworCWNzLWdwaW9zID0gPCZncGlvZiAxMiAoR1BJT19BQ1RJVkVfTE9XIHwgR1BJ
T19PUEVOX0RSQUlOKT47CiAJc3RhdHVzID0gIm9rYXkiOwogfTsKIAoKYmFzZS1jb21taXQ6IDRk
NWFiMjM3NmVjNTc2YWYxNzNlNWVhYzM4ODdlZDBiNTFiZDg1NjYKLS0gCjIuNDIuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
