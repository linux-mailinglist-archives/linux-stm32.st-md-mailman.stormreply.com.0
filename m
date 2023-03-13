Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 694256B7078
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 08:54:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C88DC6B443;
	Mon, 13 Mar 2023 07:54:51 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADCC7C6B440
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 07:54:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pbd0x-0001j9-9v; Mon, 13 Mar 2023 08:54:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pbd0v-003nag-Vy; Mon, 13 Mar 2023 08:54:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pbd0v-004TOd-2l; Mon, 13 Mar 2023 08:54:37 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 13 Mar 2023 08:54:27 +0100
Message-Id: <20230313075430.2730803-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230313075430.2730803-1-u.kleine-koenig@pengutronix.de>
References: <20230313075430.2730803-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1742;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=1luB8f8PtkOpiikyFH9Ccwu5voPX5s7Env0wEM4st1Q=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkDtapEmix1GST9R/1wht2UbNbrXGI69ZtbBJbq
 V9jmYN/gUyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZA7WqQAKCRDB/BR4rcrs
 CV9RB/4oYsjBQdpRw13S9H4gWYZjxGBXoOYAtrllTOalI8CmLFSgeICD0BZWUgRNA63uoHiT62p
 OXpp7ZnYi7V2s5aJbgfPy9HX2Bx5szg/vM+G5b+JEjcIL0Gl9o2DDcD5ooNsCpbcdpLXq1uMVkD
 WTKx12w4o8TyIq3+2nzDzMtC2Kdg38ZLpSg/reKLE3m+NSm3jikgbx7PuMmj0BpnWcWMUx9LXAi
 g7hx+V9PbwNAd4ainqYlIvM+WNnJ6dw3YJHHWxL6wMFjFerSRfZUQL87eI0DnT5bYglDystMsjw
 9TbSe9/OXtZqT0463PvbnLTCoOHKzUJfIi9mZIxyRbAQ4MTH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/5] clocksource: timer-stm32-lp: Mark driver
	as non-removable
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

VGhlIGNvbW1lbnQgaW4gdGhlIHJlbW92ZSBjYWxsYmFjayBzdWdnZXN0cyB0aGF0IHRoZSBkcml2
ZXIgaXMgbm90CnN1cHBvc2VkIHRvIGJlIHVuYm91bmQuIEhvd2V2ZXIgcmV0dXJuaW5nIGFuIGVy
cm9yIGNvZGUgaW4gdGhlIHJlbW92ZQpjYWxsYmFjayBkb2Vzbid0IGFjY29tcGxpc2ggdGhhdC4g
SW5zdGVhZCBzZXQgdGhlIHN1cHByZXNzX2JpbmRfYXR0cnMKcHJvcGVydHkgKHdoaWNoIG1ha2Vz
IGl0IGltcG9zc2libGUgdG8gdW5iaW5kIHRoZSBkcml2ZXIgdmlhIHN5c2ZzKS4KVGhlIG9ubHkg
cmVtYWluaW5nIHdheSB0byB1bmJpbmQgYW4gc3RtMzItbHAgZGV2aWNlIHdvdWxkIGJlIG1vZHVs
ZQp1bmxvYWRpbmcsIGJ1dCB0aGF0IGRvZXNuJ3QgYXBwbHkgaGVyZSwgYXMgdGhlIGRyaXZlciBj
YW5ub3QgYmUgYnVpbHQgYXMKYSBtb2R1bGUuCgpBbHNvIGRyb3AgdGhlIHVzZWxlc3MgcmVtb3Zl
IGNhbGxiYWNrLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtv
ZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN0bTMy
LWxwLmMgfCA3ICstLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN0bTMyLWxw
LmMgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN0bTMyLWxwLmMKaW5kZXggZGIyODQxZDBi
ZWI4Li42MTZlYTRmZTQyMzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXIt
c3RtMzItbHAuYworKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN0bTMyLWxwLmMKQEAg
LTE5NSwxMSArMTk1LDYgQEAgc3RhdGljIGludCBzdG0zMl9jbGtldmVudF9scF9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQg
c3RtMzJfY2xrZXZlbnRfbHBfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCi17
Ci0JcmV0dXJuIC1FQlVTWTsgLyogY2Fubm90IHVucmVnaXN0ZXIgY2xvY2tldmVudCAqLwotfQot
CiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdG0zMl9jbGtldmVudF9scF9vZl9t
YXRjaFtdID0gewogCXsgLmNvbXBhdGlibGUgPSAic3Qsc3RtMzItbHB0aW1lci10aW1lciIsIH0s
CiAJe30sCkBAIC0yMDcsMTEgKzIwMiwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBzdG0zMl9jbGtldmVudF9scF9vZl9tYXRjaFtdID0gewogTU9EVUxFX0RFVklDRV9UQUJM
RShvZiwgc3RtMzJfY2xrZXZlbnRfbHBfb2ZfbWF0Y2gpOwogCiBzdGF0aWMgc3RydWN0IHBsYXRm
b3JtX2RyaXZlciBzdG0zMl9jbGtldmVudF9scF9kcml2ZXIgPSB7Ci0JLnByb2JlCT0gc3RtMzJf
Y2xrZXZlbnRfbHBfcHJvYmUsCiAJLnJlbW92ZSA9IHN0bTMyX2Nsa2V2ZW50X2xwX3JlbW92ZSwK
IAkuZHJpdmVyCT0gewogCQkubmFtZSA9ICJzdG0zMi1scHRpbWVyLXRpbWVyIiwKIAkJLm9mX21h
dGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKHN0bTMyX2Nsa2V2ZW50X2xwX29mX21hdGNoKSwKKwkJ
LnN1cHByZXNzX2JpbmRfYXR0cnMgPSB0cnVlLAogCX0sCiB9OwogbW9kdWxlX3BsYXRmb3JtX2Ry
aXZlcihzdG0zMl9jbGtldmVudF9scF9kcml2ZXIpOwotLSAKMi4zOS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
