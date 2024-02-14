Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE136854574
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 10:34:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5358C71289;
	Wed, 14 Feb 2024 09:34:51 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3982C71285
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 09:34:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf6-0005oV-DH; Wed, 14 Feb 2024 10:34:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf2-000fGA-A6; Wed, 14 Feb 2024 10:34:36 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1raBf2-004Y7t-0k;
 Wed, 14 Feb 2024 10:34:36 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org
Date: Wed, 14 Feb 2024 10:32:47 +0100
Message-ID: <d79148ed49389c657b72df05758032be2b516ceb.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=JuNIuFD3c6qnif44oMxmUb/F4xNQLrQPLEXkRb5EGmU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIjVynmgDVimgALzofCoefgRqxjoLBMzDm0q4
 BFybHUdSlKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyI1QAKCRCPgPtYfRL+
 Thj0B/9IxCbgrkAdV5rjSFQDUYgZsFWWSrgYuSRJhnVLmxRbQ5kyeQtq18sDsG3cnfT9QHycDcF
 lGalFo47OkBmtNJrP5nqjMJGQurX5ud2ENkNSCbf2t2+ESWKaMmmc9jJeo6pWKp6GAWxKrxdqjW
 NGNoMg2jNk28RQLI8AGd7Bs/3hq8AOFfaSpRJ3CgnhtrXf/s9dMg0EMfKSg802+WGy53TndqA5k
 ZeocdsiUev4PMGe9fgY6hmfmUpULm3y8Um/N1i/biuXseuAuf0Z58QNreroE+YVBpsUcXi/Jvak
 G4i0YCbZr0HFNWlHbxXW27TdMIpIMm8IA555DwzvoYUB/NG2
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 120/164] pwm: stm32-lp: Make use of
	pwmchip_parent() accessor
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
ZXYsIHVzZSB0aGUgYWNjZXNzb3IKZnVuY3Rpb24gcHJvdmlkZWQgZm9yIGV4YWN0bHkgdGhpcyBw
dXJwb3NlLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5p
Z0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc3RtMzItbHAuYyB8IDYgKysr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jIGIvZHJpdmVycy9wd20vcHdtLXN0
bTMyLWxwLmMKaW5kZXggYjQ2ZDgxOTNkZDBmLi45NTgwNDNiYzVjOTIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5j
CkBAIC02MSw3ICs2MSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX2xwX2FwcGx5KHN0cnVjdCBw
d21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIAlkb19kaXYoZGl2LCBOU0VD
X1BFUl9TRUMpOwogCWlmICghZGl2KSB7CiAJCS8qIENsb2NrIGlzIHRvbyBzbG93IHRvIGFjaGll
dmUgcmVxdWVzdGVkIHBlcmlvZC4gKi8KLQkJZGV2X2RiZyhjaGlwLT5kZXYsICJDYW4ndCByZWFj
aCAlbGx1IG5zXG4iLCBzdGF0ZS0+cGVyaW9kKTsKKwkJZGV2X2RiZyhwd21jaGlwX3BhcmVudChj
aGlwKSwgIkNhbid0IHJlYWNoICVsbHUgbnNcbiIsIHN0YXRlLT5wZXJpb2QpOwogCQlyZXR1cm4g
LUVJTlZBTDsKIAl9CiAKQEAgLTY5LDcgKzY5LDcgQEAgc3RhdGljIGludCBzdG0zMl9wd21fbHBf
YXBwbHkoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCXdo
aWxlIChkaXYgPiBTVE0zMl9MUFRJTV9NQVhfQVJSKSB7CiAJCXByZXNjKys7CiAJCWlmICgoMSA8
PCBwcmVzYykgPiBTVE0zMl9MUFRJTV9NQVhfUFJFU0NBTEVSKSB7Ci0JCQlkZXZfZXJyKGNoaXAt
PmRldiwgIm1heCBwcmVzY2FsZXIgZXhjZWVkZWRcbiIpOworCQkJZGV2X2Vycihwd21jaGlwX3Bh
cmVudChjaGlwKSwgIm1heCBwcmVzY2FsZXIgZXhjZWVkZWRcbiIpOwogCQkJcmV0dXJuIC1FSU5W
QUw7CiAJCX0KIAkJZGl2ID0gcHJkID4+IHByZXNjOwpAQCAtMTMwLDcgKzEzMCw3IEBAIHN0YXRp
YyBpbnQgc3RtMzJfcHdtX2xwX2FwcGx5KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3
bV9kZXZpY2UgKnB3bSwKIAkJCQkgICAgICAgKHZhbCAmIFNUTTMyX0xQVElNX0NNUE9LX0FSUk9L
KSA9PSBTVE0zMl9MUFRJTV9DTVBPS19BUlJPSywKIAkJCQkgICAgICAgMTAwLCAxMDAwKTsKIAlp
ZiAocmV0KSB7Ci0JCWRldl9lcnIoY2hpcC0+ZGV2LCAiQVJSL0NNUCByZWdpc3RlcnMgd3JpdGUg
aXNzdWVcbiIpOworCQlkZXZfZXJyKHB3bWNoaXBfcGFyZW50KGNoaXApLCAiQVJSL0NNUCByZWdp
c3RlcnMgd3JpdGUgaXNzdWVcbiIpOwogCQlnb3RvIGVycjsKIAl9CiAJcmV0ID0gcmVnbWFwX3dy
aXRlKHByaXYtPnJlZ21hcCwgU1RNMzJfTFBUSU1fSUNSLAotLSAKMi40My4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
