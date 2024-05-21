Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DCB8CACAF
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2024 12:53:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91485C6C820;
	Tue, 21 May 2024 10:53:02 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B86DCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2024 10:52:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1s9N6u-0006ZR-8F; Tue, 21 May 2024 12:52:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1s9N6s-002NUk-LM; Tue, 21 May 2024 12:52:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1s9N6s-009OvQ-1q;
 Tue, 21 May 2024 12:52:46 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Mark Brown <broonie@kernel.org>
Date: Tue, 21 May 2024 12:52:42 +0200
Message-ID: <20240521105241.62400-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=MKRBktUB7DJPxWyPs7B+40mEZWemSDrhbFQtQ2v8A6I=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmTHz6zhFHHgveD+aiwQkOcd8uGhhFWHBRcPgKG
 hrOQ/nmHr6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZkx8+gAKCRCPgPtYfRL+
 TlH1B/9VEF5hMtrrQvxbQsv5RD3zIGhRyjRVkMWcWUqaIE5q14SaJ2SdPvqhR2FF3r4dT1jQWKx
 hA7rZepbO8863mVj3kcLeyvF72w//HCtLLgqr/F7tX3mPHkE18MY0Ee9cmkRPSP8tZBx8FCUUfu
 7prPYFZzGnqvQfIp6lmSkrqKGVhTGeZoSvZEhC6796r2yPYa9oyl+EChk/aQehhlhzvlPYXbwz+
 geRoZRdNjacZDDot+wAkVsECEsFd1+M2nnDdQBxJ2ohjt8Z9nSr7S5MwMemCMWH1YrB56qSWneA
 e8vTKF7OHN14waTBpDKTGLLIR0B9nabSRRkkKjAInj7mCDed
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-spi@vger.kernel.org
Subject: [Linux-stm32] [PATCH] spi: stm32: Don't warn about spurious
	interrupts
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

VGhlIGRldl93YXJuIHRvIG5vdGlmeSBhYm91dCBhIHNwdXJpb3VzIGludGVycnVwdCB3YXMgaW50
cm9kdWNlZCB3aXRoCnRoZSByZWFzb25pbmcgdGhhdCB0aGVzZSBhcmUgdW5leHBlY3RlZC4gSG93
ZXZlciBzcHVyaW91cyBpbnRlcnJ1cHRzCnRlbmQgdG8gdHJpZ2dlciBjb250aW5vdXNseSBhbmQg
dGhlIGVycm9yIG1lc3NhZ2Ugb24gdGhlIHNlcmlhbCBjb25zb2xlCnByZXZlbnRzIHRoYXQgdGhl
IGNvcmUncyBkZXRlY3Rpb24gb2Ygc3B1cmlvdXMgaW50ZXJydXB0cyBraWNrcyBpbgood2hpY2gg
ZGlzYWJsZXMgdGhlIGlycSkgYW5kIGp1c3QgZmxvb2RzIHRoZSBjb25zb2xlLgoKRml4ZXM6IGM2
NGU3ZWZlNDZiNyAoInNwaTogc3RtMzI6IG1ha2Ugc3B1cmlvdXMgYW5kIG92ZXJydW4gaW50ZXJy
dXB0cyB2aXNpYmxlIikKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL3NwaS9zcGktc3RtMzIuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi5jIGIvZHJpdmVycy9zcGkvc3BpLXN0bTMyLmMK
aW5kZXggNGE2OGFiY2RjYzM1Li4yMWI3OWRjZDgzOTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3Bp
L3NwaS1zdG0zMi5jCisrKyBiL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi5jCkBAIC0xMDU1LDcgKzEw
NTUsNyBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qgc3RtMzJoN19zcGlfaXJxX3RocmVhZChpbnQgaXJx
LCB2b2lkICpkZXZfaWQpCiAJCW1hc2sgfD0gU1RNMzJIN19TUElfU1JfVFhQIHwgU1RNMzJIN19T
UElfU1JfUlhQOwogCiAJaWYgKCEoc3IgJiBtYXNrKSkgewotCQlkZXZfd2FybihzcGktPmRldiwg
InNwdXJpb3VzIElUIChzcj0weCUwOHgsIGllcj0weCUwOHgpXG4iLAorCQlkZXZfdmRiZyhzcGkt
PmRldiwgInNwdXJpb3VzIElUIChzcj0weCUwOHgsIGllcj0weCUwOHgpXG4iLAogCQkJIHNyLCBp
ZXIpOwogCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZzcGktPmxvY2ssIGZsYWdzKTsKIAkJcmV0
dXJuIElSUV9OT05FOwotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
