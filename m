Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 083618AA7DA
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Apr 2024 07:02:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8C83C6DD9B;
	Fri, 19 Apr 2024 05:02:44 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05B5CC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 05:02:44 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 025A288629;
 Fri, 19 Apr 2024 07:02:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713502963;
 bh=N8/EA3hDMebRjyBpAuXzGXG8aRiiHl6ioFyyZFh37vA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SLFL6bgxwDc6dhg4rCLT0ldEAeOVv9qTHjcms1mdX6MRdriGgh+6ok37zMH9mwHVO
 ++/SqflUc+q9vLZVx0G5pI149VR8Jn/0OHzQQHAJDlCzg/RZxJaNiVJwUMaryKR+On
 RYYe1Q3CYAAF2QM1kZw+7B3PrhIT0bTTZmos4Y1AB7h1yf1Km4jBe0r3JU3DKnluAp
 6C0uNpCv8Pu85btZAsGFIoAHHUnOybqN0JLjEyvu5k6tJcRRuTYJDTt4RSps1VERNR
 rRWBTuzqRhRV2hmr5+KkQ7Hi6RQpIRtdotE4HowZ8kEmTkhC84QouRIRvvIRTgnMQP
 wA3eiSUOfx0EQ==
From: Marek Vasut <marex@denx.de>
To: linux-crypto@vger.kernel.org
Date: Fri, 19 Apr 2024 07:01:13 +0200
Message-ID: <20240419050201.181041-2-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240419050201.181041-1-marex@denx.de>
References: <20240419050201.181041-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Yang Yingliang <yangyingliang@huawei.com>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Olivia Mackall <olivia@selenic.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/3] hwrng: stm32 - put IP into RPM suspend on
	failure
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

SW4gY2FzZSBvZiBhbiBpcnJlY292ZXJhYmxlIGZhaWx1cmUsIHB1dCB0aGUgSVAgaW50byBSUE0g
c3VzcGVuZAp0byBhdm9pZCBSUE0gaW1iYWxhbmNlLiBJIGRpZCBub3QgdHJpZ2dlciB0aGlzIGNh
c2UsIGJ1dCBpdCBzZWVtcwppdCBzaG91bGQgYmUgZG9uZSBiYXNlZCBvbiByZWFkaW5nIHRoZSBj
b2RlLgoKRml4ZXM6IGIxN2JjNmViN2MyYiAoImh3cm5nOiBzdG0zMiAtIHJld29yayBlcnJvciBo
YW5kbGluZyBpbiBzdG0zMl9ybmdfcmVhZCgpIikKU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQg
PG1hcmV4QGRlbnguZGU+Ci0tLQpDYzogIlV3ZSBLbGVpbmUtS8O2bmlnIiA8dS5rbGVpbmUta29l
bmlnQHBlbmd1dHJvbml4LmRlPgpDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1
ZUBmb3NzLnN0LmNvbT4KQ2M6IEdhdGllbiBDaGV2YWxsaWVyIDxnYXRpZW4uY2hldmFsbGllckBm
b3NzLnN0LmNvbT4KQ2M6IEhlcmJlcnQgWHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4K
Q2M6IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4KQ2M6IE9saXZp
YSBNYWNrYWxsIDxvbGl2aWFAc2VsZW5pYy5jb20+CkNjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPgpDYzogWWFuZyBZaW5nbGlhbmcgPHlhbmd5aW5nbGlhbmdAaHVhd2VpLmNvbT4KQ2M6
IGtlcm5lbEBkaC1lbGVjdHJvbmljcy5jb20KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZwpDYzogbGludXgtY3J5cHRvQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQotLS0KIGRyaXZlcnMvY2hhci9od19yYW5k
b20vc3RtMzItcm5nLmMgfCA3ICsrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9z
dG0zMi1ybmcuYyBiL2RyaXZlcnMvY2hhci9od19yYW5kb20vc3RtMzItcm5nLmMKaW5kZXggMWNj
NjFlZjhlZTU0Yy4uYjYxODJmODZkOGE0YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9jaGFyL2h3X3Jh
bmRvbS9zdG0zMi1ybmcuYworKysgYi9kcml2ZXJzL2NoYXIvaHdfcmFuZG9tL3N0bTMyLXJuZy5j
CkBAIC0yMjAsNyArMjIwLDggQEAgc3RhdGljIGludCBzdG0zMl9ybmdfcmVhZChzdHJ1Y3QgaHdy
bmcgKnJuZywgdm9pZCAqZGF0YSwgc2l6ZV90IG1heCwgYm9vbCB3YWl0KQogCQkJCWlmIChlcnIg
JiYgaSA+IFJOR19OQl9SRUNPVkVSX1RSSUVTKSB7CiAJCQkJCWRldl9lcnIoKHN0cnVjdCBkZXZp
Y2UgKilwcml2LT5ybmcucHJpdiwKIAkJCQkJCSJDb3VsZG4ndCByZWNvdmVyIGZyb20gc2VlZCBl
cnJvclxuIik7Ci0JCQkJCXJldHVybiAtRU5PVFJFQ09WRVJBQkxFOworCQkJCQlyZXR2YWwgPSAt
RU5PVFJFQ09WRVJBQkxFOworCQkJCQlnb3RvIGV4aXRfcnBtOwogCQkJCX0KIAogCQkJCWNvbnRp
bnVlOwpAQCAtMjM4LDcgKzIzOSw4IEBAIHN0YXRpYyBpbnQgc3RtMzJfcm5nX3JlYWQoc3RydWN0
IGh3cm5nICpybmcsIHZvaWQgKmRhdGEsIHNpemVfdCBtYXgsIGJvb2wgd2FpdCkKIAkJCWlmIChl
cnIgJiYgaSA+IFJOR19OQl9SRUNPVkVSX1RSSUVTKSB7CiAJCQkJZGV2X2Vycigoc3RydWN0IGRl
dmljZSAqKXByaXYtPnJuZy5wcml2LAogCQkJCQkiQ291bGRuJ3QgcmVjb3ZlciBmcm9tIHNlZWQg
ZXJyb3IiKTsKLQkJCQlyZXR1cm4gLUVOT1RSRUNPVkVSQUJMRTsKKwkJCQlyZXR2YWwgPSAtRU5P
VFJFQ09WRVJBQkxFOworCQkJCWdvdG8gZXhpdF9ycG07CiAJCQl9CiAKIAkJCWNvbnRpbnVlOwpA
QCAtMjUwLDYgKzI1Miw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcm5nX3JlYWQoc3RydWN0IGh3cm5n
ICpybmcsIHZvaWQgKmRhdGEsIHNpemVfdCBtYXgsIGJvb2wgd2FpdCkKIAkJbWF4IC09IHNpemVv
Zih1MzIpOwogCX0KIAorZXhpdF9ycG06CiAJcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgoc3Ry
dWN0IGRldmljZSAqKSBwcml2LT5ybmcucHJpdik7CiAJcG1fcnVudGltZV9wdXRfc3luY19hdXRv
c3VzcGVuZCgoc3RydWN0IGRldmljZSAqKSBwcml2LT5ybmcucHJpdik7CiAKLS0gCjIuNDMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
