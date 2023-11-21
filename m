Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0277F2F51
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Nov 2023 14:51:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C73ABC6B47D;
	Tue, 21 Nov 2023 13:51:56 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E884C6B47D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Nov 2023 13:51:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5RAM-0005LG-Qt; Tue, 21 Nov 2023 14:51:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5RAM-00Aay7-BH; Tue, 21 Nov 2023 14:51:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5RAM-004xcR-2F; Tue, 21 Nov 2023 14:51:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 21 Nov 2023 14:49:29 +0100
Message-ID: <20231121134901.208535-28-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=8GTUfYbqD+5GD5mrEVpFS9bTtV3cMkLFhtuMi1iJw5k=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlXLVqCdR4MHUAwEdwtXCyGdPb2KG0/fg4CZSj4
 KIIrBuSMCCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVy1agAKCRCPgPtYfRL+
 Tgv9B/4lnhRwPvUW/Ot+lFZLK+Bc51iXwT8QsTWtGrJMyb9p5iy1VIs+5gPBfgWGD7LkCk6dN74
 mP5qF43la7ui+QHx3SYcDB8t2LrVVGnxApN93LVA8c3vaTRoUe2xZLt5uToOsjFFFBa5/j7TOzo
 qMpYKHvXhP8BfEMCecIoNBTJSMqOMBzHQ5HCDtHNHNHUrKXMfbW/1VMS6g9eiTMf4qXil7tA0j2
 k2yqrbbBUseTLwtvSQNP8rnrmtHmR5XWoWvMOcD80jlyH5FmhkNVsvA+t2Ony4eSdDLVVaQLtWQ
 /8vhA2Odv04LZ9K1agqTTAVX9nD7wgnvfX4xQFauveKa5mJQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 027/108] pwm: stm32-lp: Make use of
	pwmchip_parent() macro
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

c3RydWN0IHB3bV9jaGlwOjpkZXYgaXMgYWJvdXQgdG8gY2hhbmdlLiBUbyBub3QgaGF2ZSB0byB0
b3VjaCB0aGlzCmRyaXZlciBpbiB0aGUgc2FtZSBjb21taXQgYXMgc3RydWN0IHB3bV9jaGlwOjpk
ZXYsIHVzZSB0aGUgbWFjcm8KcHJvdmlkZWQgZm9yIGV4YWN0bHkgdGhpcyBwdXJwb3NlLgoKU2ln
bmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25p
eC5kZT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc3RtMzItbHAuYyB8IDYgKysrLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMKaW5k
ZXggNDM5MDY4ZjNlY2ExLi4zNzU0ZmFlY2E4MzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3
bS1zdG0zMi1scC5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jCkBAIC02MSw3ICs2
MSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX2xwX2FwcGx5KHN0cnVjdCBwd21fY2hpcCAqY2hp
cCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIAlkb19kaXYoZGl2LCBOU0VDX1BFUl9TRUMpOwog
CWlmICghZGl2KSB7CiAJCS8qIENsb2NrIGlzIHRvbyBzbG93IHRvIGFjaGlldmUgcmVxdWVzdGVk
IHBlcmlvZC4gKi8KLQkJZGV2X2RiZyhwcml2LT5jaGlwLmRldiwgIkNhbid0IHJlYWNoICVsbHUg
bnNcbiIsIHN0YXRlLT5wZXJpb2QpOworCQlkZXZfZGJnKHB3bWNoaXBfcGFyZW50KGNoaXApLCAi
Q2FuJ3QgcmVhY2ggJWxsdSBuc1xuIiwgc3RhdGUtPnBlcmlvZCk7CiAJCXJldHVybiAtRUlOVkFM
OwogCX0KIApAQCAtNjksNyArNjksNyBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9scF9hcHBseShz
dHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCiAJd2hpbGUgKGRp
diA+IFNUTTMyX0xQVElNX01BWF9BUlIpIHsKIAkJcHJlc2MrKzsKIAkJaWYgKCgxIDw8IHByZXNj
KSA+IFNUTTMyX0xQVElNX01BWF9QUkVTQ0FMRVIpIHsKLQkJCWRldl9lcnIocHJpdi0+Y2hpcC5k
ZXYsICJtYXggcHJlc2NhbGVyIGV4Y2VlZGVkXG4iKTsKKwkJCWRldl9lcnIocHdtY2hpcF9wYXJl
bnQoY2hpcCksICJtYXggcHJlc2NhbGVyIGV4Y2VlZGVkXG4iKTsKIAkJCXJldHVybiAtRUlOVkFM
OwogCQl9CiAJCWRpdiA9IHByZCA+PiBwcmVzYzsKQEAgLTEzMCw3ICsxMzAsNyBAQCBzdGF0aWMg
aW50IHN0bTMyX3B3bV9scF9hcHBseShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21f
ZGV2aWNlICpwd20sCiAJCQkJICAgICAgICh2YWwgJiBTVE0zMl9MUFRJTV9DTVBPS19BUlJPSykg
PT0gU1RNMzJfTFBUSU1fQ01QT0tfQVJST0ssCiAJCQkJICAgICAgIDEwMCwgMTAwMCk7CiAJaWYg
KHJldCkgewotCQlkZXZfZXJyKHByaXYtPmNoaXAuZGV2LCAiQVJSL0NNUCByZWdpc3RlcnMgd3Jp
dGUgaXNzdWVcbiIpOworCQlkZXZfZXJyKHB3bWNoaXBfcGFyZW50KGNoaXApLCAiQVJSL0NNUCBy
ZWdpc3RlcnMgd3JpdGUgaXNzdWVcbiIpOwogCQlnb3RvIGVycjsKIAl9CiAJcmV0ID0gcmVnbWFw
X3dyaXRlKHByaXYtPnJlZ21hcCwgU1RNMzJfTFBUSU1fSUNSLAotLSAKMi40Mi4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
