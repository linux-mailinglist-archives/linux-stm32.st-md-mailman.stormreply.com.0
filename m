Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 733F3840411
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 12:47:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BA77C6A613;
	Mon, 29 Jan 2024 11:47:00 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE3E0C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 11:46:58 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rUQ6H-0007AJ-UJ; Mon, 29 Jan 2024 12:46:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rUQ6G-0039yH-9z; Mon, 29 Jan 2024 12:46:52 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rUQ6G-00AsMQ-0i;
 Mon, 29 Jan 2024 12:46:52 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 29 Jan 2024 12:46:49 +0100
Message-ID: <20240129114649.2458468-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=w+TUJeocBu4MMweRw8tgYLEmSQuNkXHs+pH1aqUe1wQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlt5ApRWpQOr/HHLFho90eiPiFHmcdiFtup9Fto
 Zjfr+PQQX2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbeQKQAKCRCPgPtYfRL+
 TtrUCACPEt3J6ytRV2Ghf98LrqiuTr7dzOZ8ewYTkSVm4W71RPtEJ9aUtBuaYc+l5QkvyJdSSin
 2h05pGiRPFROrYBEZulTdOH1ptW2wmWX6myUubT9dhCFm7ESv0FDAJv4W1ZR7cSWalS4j00umPL
 LSSM+noHFkfj7TmOW5HY1Uxr66IwZZrrYrgTQoWgGWrwT1hanEL44aamLxJWPAFz+MgK8Aypdhe
 C58PQS8TCkO1CC0e3jhpP0w2RAcjFNsaDwRpNIZOPITXgIn/G5vEBkjt8okOM+ZTjudf/A3wPxo
 B/f7TrxUzr0AMWGS/sP2HsB9H+i3g/6G7IvhonZEdWmSKAy1
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
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: lxa-tac: reduce RGMII
	interface drive strength
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
bHRzIGluIGFuIGltcHJvdmVtZW50IG9mIEVNSSBwZXJmb3JtYW5jZSBieSByZWR1Y2luZyB0aGUK
MTI1TUh6IGVtaXNzaW9uIGFuZCBpdHMgaGFybW9uaWNzIGNhdXNlZCBieSB0aGUgUkdNSUkgY2xv
Y2sgbGluZS4KClNpZ25lZC1vZmYtYnk6IExlb25hcmQgR8O2aHJzIDxsLmdvZWhyc0BwZW5ndXRy
b25peC5kZT4KU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5p
Z0BwZW5ndXRyb25peC5kZT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4Yy1s
eGEtdGFjLmR0c2kgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4Yy1seGEtdGFjLmR0c2kg
Yi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4Yy1seGEtdGFjLmR0c2kKaW5kZXggN2U4
MzVhN2NmNjRhLi5jZmFmOGFkZGUzMTkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0
L3N0bTMybXAxNXhjLWx4YS10YWMuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0z
Mm1wMTV4Yy1seGEtdGFjLmR0c2kKQEAgLTQ3MSw2ICs0NzEsMTAgQEAgc3dpdGNoOiBzd2l0Y2hA
MCB7CiAJCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW9hPjsKIAkJaW50ZXJydXB0cyA9IDw2IElS
UV9UWVBFX0VER0VfUklTSU5HPjsKIAorCQkvKiBSZWR1Y2UgUkdNSUkgRU1JIGVtaXNzaW9ucyBi
eSByZWR1Y2luZyBkcml2ZSBzdHJlbmd0aCAqLworCQltaWNyb2NoaXAsaGktZHJpdmUtc3RyZW5n
dGgtbWljcm9hbXAgPSA8MjAwMD47CisJCW1pY3JvY2hpcCxsby1kcml2ZS1zdHJlbmd0aC1taWNy
b2FtcCA9IDw4MDAwPjsKKwogCQlwb3J0cyB7CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKIAkJ
CSNzaXplLWNlbGxzID0gPDA+OwotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
