Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B74747FB6F
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Dec 2021 10:45:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DA1EC5F1F0;
	Mon, 27 Dec 2021 09:45:50 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1602AC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Dec 2021 09:45:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n1mZY-0006Ya-6K; Mon, 27 Dec 2021 10:45:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n1mZT-006u9D-Ul; Mon, 27 Dec 2021 10:45:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n1mZS-0005VX-R6; Mon, 27 Dec 2021 10:45:34 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Date: Mon, 27 Dec 2021 10:45:15 +0100
Message-Id: <20211227094526.698714-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
References: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=jiIt05viV+/UoAbdZ4oWQf1/t5U/5n6JBm60zggyQaM=;
 m=O/hbHSowifJBTpUmrGb87d4c+26dGvtHSBxVMu37a1o=;
 p=sANTzUiR3cllbRFQ36wQwKYkkmtWDHQr3TlBm5aVrSs=;
 g=412a8aaa588e007ef2d19bf6acde944651719eda
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHJip0ACgkQwfwUeK3K7Amo9Af9EL3
 ijoahGlA2rYq6RbVKCBZdcbseUsTfapwZ4sGo3p+ub/2c7R0j8eW/b0l8YcwzM2q3g3MUfJDihT3A
 K7vL3GY4usKHGCKSurLM6j9J0GgCyNflhzL8sG+Sh2cBrXCs9DW1GbIaS40RN5xgdwjgXT7CSsSzR
 9y/rCAubbkaSWVZoydcu/C/aJ5oQmBmSNPhYqs0ySuoNvhBBsVtccRuU7BYtmm0hqx+Vr8tpVGfJ2
 eOBlRvNvRiTtq++51B1tkOnoWQRYqksFinSfbyqlHb7SlziswGnbzgDNKNYroa9qy9VUSJnBY+NfE
 rhQ3J68U3xtiOmJA15E59ZjVqRut/8w==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kernel@pengutronix.de,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [Linux-stm32] [PATCH v2 12/23] counter: stm32-timer-cnt: Convert to
	counter_priv() wrapper
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

VGhpcyBpcyBhIHN0cmFpZ2h0IGZvcndhcmQgY29udmVyc2lvbiB0byB0aGUgbmV3IGNvdW50ZXJf
cHJpdigpIHdyYXBwZXIuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvY291bnRlci9zdG0zMi10aW1l
ci1jbnQuYyB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2NvdW50ZXIvc3Rt
MzItdGltZXItY250LmMgYi9kcml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250LmMKaW5kZXgg
MDU0NmU5MzJkYjBjLi40YjA1YjE5OGE4ZDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY291bnRlci9z
dG0zMi10aW1lci1jbnQuYworKysgYi9kcml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250LmMK
QEAgLTQ3LDcgKzQ3LDcgQEAgc3RhdGljIGNvbnN0IGVudW0gY291bnRlcl9mdW5jdGlvbiBzdG0z
Ml9jb3VudF9mdW5jdGlvbnNbXSA9IHsKIHN0YXRpYyBpbnQgc3RtMzJfY291bnRfcmVhZChzdHJ1
Y3QgY291bnRlcl9kZXZpY2UgKmNvdW50ZXIsCiAJCQkgICAgc3RydWN0IGNvdW50ZXJfY291bnQg
KmNvdW50LCB1NjQgKnZhbCkKIHsKLQlzdHJ1Y3Qgc3RtMzJfdGltZXJfY250ICpjb25zdCBwcml2
ID0gY291bnRlci0+cHJpdjsKKwlzdHJ1Y3Qgc3RtMzJfdGltZXJfY250ICpjb25zdCBwcml2ID0g
Y291bnRlcl9wcml2KGNvdW50ZXIpOwogCXUzMiBjbnQ7CiAKIAlyZWdtYXBfcmVhZChwcml2LT5y
ZWdtYXAsIFRJTV9DTlQsICZjbnQpOwpAQCAtNTksNyArNTksNyBAQCBzdGF0aWMgaW50IHN0bTMy
X2NvdW50X3JlYWQoc3RydWN0IGNvdW50ZXJfZGV2aWNlICpjb3VudGVyLAogc3RhdGljIGludCBz
dG0zMl9jb3VudF93cml0ZShzdHJ1Y3QgY291bnRlcl9kZXZpY2UgKmNvdW50ZXIsCiAJCQkgICAg
IHN0cnVjdCBjb3VudGVyX2NvdW50ICpjb3VudCwgY29uc3QgdTY0IHZhbCkKIHsKLQlzdHJ1Y3Qg
c3RtMzJfdGltZXJfY250ICpjb25zdCBwcml2ID0gY291bnRlci0+cHJpdjsKKwlzdHJ1Y3Qgc3Rt
MzJfdGltZXJfY250ICpjb25zdCBwcml2ID0gY291bnRlcl9wcml2KGNvdW50ZXIpOwogCXUzMiBj
ZWlsaW5nOwogCiAJcmVnbWFwX3JlYWQocHJpdi0+cmVnbWFwLCBUSU1fQVJSLCAmY2VpbGluZyk7
CkBAIC03Myw3ICs3Myw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfY291bnRfZnVuY3Rpb25fcmVhZChz
dHJ1Y3QgY291bnRlcl9kZXZpY2UgKmNvdW50ZXIsCiAJCQkJICAgICBzdHJ1Y3QgY291bnRlcl9j
b3VudCAqY291bnQsCiAJCQkJICAgICBlbnVtIGNvdW50ZXJfZnVuY3Rpb24gKmZ1bmN0aW9uKQog
ewotCXN0cnVjdCBzdG0zMl90aW1lcl9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyLT5wcml2Owor
CXN0cnVjdCBzdG0zMl90aW1lcl9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyX3ByaXYoY291bnRl
cik7CiAJdTMyIHNtY3I7CiAKIAlyZWdtYXBfcmVhZChwcml2LT5yZWdtYXAsIFRJTV9TTUNSLCAm
c21jcik7CkBAIC0xMDAsNyArMTAwLDcgQEAgc3RhdGljIGludCBzdG0zMl9jb3VudF9mdW5jdGlv
bl93cml0ZShzdHJ1Y3QgY291bnRlcl9kZXZpY2UgKmNvdW50ZXIsCiAJCQkJICAgICAgc3RydWN0
IGNvdW50ZXJfY291bnQgKmNvdW50LAogCQkJCSAgICAgIGVudW0gY291bnRlcl9mdW5jdGlvbiBm
dW5jdGlvbikKIHsKLQlzdHJ1Y3Qgc3RtMzJfdGltZXJfY250ICpjb25zdCBwcml2ID0gY291bnRl
ci0+cHJpdjsKKwlzdHJ1Y3Qgc3RtMzJfdGltZXJfY250ICpjb25zdCBwcml2ID0gY291bnRlcl9w
cml2KGNvdW50ZXIpOwogCXUzMiBjcjEsIHNtczsKIAogCXN3aXRjaCAoZnVuY3Rpb24pIHsKQEAg
LTE0MCw3ICsxNDAsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2NvdW50X2RpcmVjdGlvbl9yZWFkKHN0
cnVjdCBjb3VudGVyX2RldmljZSAqY291bnRlciwKIAkJCQkgICAgICBzdHJ1Y3QgY291bnRlcl9j
b3VudCAqY291bnQsCiAJCQkJICAgICAgZW51bSBjb3VudGVyX2NvdW50X2RpcmVjdGlvbiAqZGly
ZWN0aW9uKQogewotCXN0cnVjdCBzdG0zMl90aW1lcl9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVy
LT5wcml2OworCXN0cnVjdCBzdG0zMl90aW1lcl9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyX3By
aXYoY291bnRlcik7CiAJdTMyIGNyMTsKIAogCXJlZ21hcF9yZWFkKHByaXYtPnJlZ21hcCwgVElN
X0NSMSwgJmNyMSk7CkBAIC0xNTMsNyArMTUzLDcgQEAgc3RhdGljIGludCBzdG0zMl9jb3VudF9k
aXJlY3Rpb25fcmVhZChzdHJ1Y3QgY291bnRlcl9kZXZpY2UgKmNvdW50ZXIsCiBzdGF0aWMgaW50
IHN0bTMyX2NvdW50X2NlaWxpbmdfcmVhZChzdHJ1Y3QgY291bnRlcl9kZXZpY2UgKmNvdW50ZXIs
CiAJCQkJICAgIHN0cnVjdCBjb3VudGVyX2NvdW50ICpjb3VudCwgdTY0ICpjZWlsaW5nKQogewot
CXN0cnVjdCBzdG0zMl90aW1lcl9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyLT5wcml2OworCXN0
cnVjdCBzdG0zMl90aW1lcl9jbnQgKmNvbnN0IHByaXYgPSBjb3VudGVyX3ByaXYoY291bnRlcik7
CiAJdTMyIGFycjsKIAogCXJlZ21hcF9yZWFkKHByaXYtPnJlZ21hcCwgVElNX0FSUiwgJmFycik7
CkBAIC0xNjYsNyArMTY2LDcgQEAgc3RhdGljIGludCBzdG0zMl9jb3VudF9jZWlsaW5nX3JlYWQo
c3RydWN0IGNvdW50ZXJfZGV2aWNlICpjb3VudGVyLAogc3RhdGljIGludCBzdG0zMl9jb3VudF9j
ZWlsaW5nX3dyaXRlKHN0cnVjdCBjb3VudGVyX2RldmljZSAqY291bnRlciwKIAkJCQkgICAgIHN0
cnVjdCBjb3VudGVyX2NvdW50ICpjb3VudCwgdTY0IGNlaWxpbmcpCiB7Ci0Jc3RydWN0IHN0bTMy
X3RpbWVyX2NudCAqY29uc3QgcHJpdiA9IGNvdW50ZXItPnByaXY7CisJc3RydWN0IHN0bTMyX3Rp
bWVyX2NudCAqY29uc3QgcHJpdiA9IGNvdW50ZXJfcHJpdihjb3VudGVyKTsKIAogCWlmIChjZWls
aW5nID4gcHJpdi0+bWF4X2FycikKIAkJcmV0dXJuIC1FUkFOR0U7CkBAIC0xODEsNyArMTgxLDcg
QEAgc3RhdGljIGludCBzdG0zMl9jb3VudF9jZWlsaW5nX3dyaXRlKHN0cnVjdCBjb3VudGVyX2Rl
dmljZSAqY291bnRlciwKIHN0YXRpYyBpbnQgc3RtMzJfY291bnRfZW5hYmxlX3JlYWQoc3RydWN0
IGNvdW50ZXJfZGV2aWNlICpjb3VudGVyLAogCQkJCSAgIHN0cnVjdCBjb3VudGVyX2NvdW50ICpj
b3VudCwgdTggKmVuYWJsZSkKIHsKLQlzdHJ1Y3Qgc3RtMzJfdGltZXJfY250ICpjb25zdCBwcml2
ID0gY291bnRlci0+cHJpdjsKKwlzdHJ1Y3Qgc3RtMzJfdGltZXJfY250ICpjb25zdCBwcml2ID0g
Y291bnRlcl9wcml2KGNvdW50ZXIpOwogCXUzMiBjcjE7CiAKIAlyZWdtYXBfcmVhZChwcml2LT5y
ZWdtYXAsIFRJTV9DUjEsICZjcjEpOwpAQCAtMTk0LDcgKzE5NCw3IEBAIHN0YXRpYyBpbnQgc3Rt
MzJfY291bnRfZW5hYmxlX3JlYWQoc3RydWN0IGNvdW50ZXJfZGV2aWNlICpjb3VudGVyLAogc3Rh
dGljIGludCBzdG0zMl9jb3VudF9lbmFibGVfd3JpdGUoc3RydWN0IGNvdW50ZXJfZGV2aWNlICpj
b3VudGVyLAogCQkJCSAgICBzdHJ1Y3QgY291bnRlcl9jb3VudCAqY291bnQsIHU4IGVuYWJsZSkK
IHsKLQlzdHJ1Y3Qgc3RtMzJfdGltZXJfY250ICpjb25zdCBwcml2ID0gY291bnRlci0+cHJpdjsK
KwlzdHJ1Y3Qgc3RtMzJfdGltZXJfY250ICpjb25zdCBwcml2ID0gY291bnRlcl9wcml2KGNvdW50
ZXIpOwogCXUzMiBjcjE7CiAKIAlpZiAoZW5hYmxlKSB7Ci0tIAoyLjMzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
