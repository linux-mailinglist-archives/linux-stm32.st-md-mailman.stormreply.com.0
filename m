Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 415E88D5D3A
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2024 10:54:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF53CC6DD72;
	Fri, 31 May 2024 08:54:51 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B447CC6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2024 08:54:44 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0854088246;
 Fri, 31 May 2024 10:54:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717145684;
 bh=ywmgWnjL30EYt/MuxhcwoOkfzGrfhbBZytmaTjE4Urk=;
 h=From:To:Cc:Subject:Date:From;
 b=puqYrpH/xjOIMgIMVamSDiZta2T3W48g2YC3oYqo/lcXAHkyOYsW1hOvZ44AZYXUa
 ubDkL58J1in5SR8mo3W+oc0QDdMc3WiBR1ArQqUTZ4RblKrjThPVZxZSml/RmFFk3S
 tMDtP4vtRtlu1K6ZnD/zmDMzQlxiIvFpwzbnNevQaEgxmvJofiwjEHWqDRprUs7kSQ
 nrgDHGiBLo5qWtxWfbGav8HboIT3QcR70+qCQeS+dXpVoObx+S/sMo293Mk5c+ao/1
 SpViP2OMIhngjNPvu4lfVDi/hhoF2ZiIU3i7zhY4ggKh1ZaFsXGgRmdhWJxcMVlvTB
 MvkzgZc/sFYsA==
From: Marek Vasut <marex@denx.de>
To: linux-crypto@vger.kernel.org
Date: Fri, 31 May 2024 10:53:22 +0200
Message-ID: <20240531085414.42529-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
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
Subject: [Linux-stm32] [PATCH v3 1/2] hwrng: stm32 - use
	pm_runtime_resume_and_get()
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

aW5jbHVkZS9saW51eC9wbV9ydW50aW1lLmggcG1fcnVudGltZV9nZXRfc3luYygpIGRlc2NyaXB0
aW9uIHN1Z2dlc3RzIHRvCi4uLiBjb25zaWRlciB1c2luZyBwbV9ydW50aW1lX3Jlc3VtZV9hbmRf
Z2V0KCkgaW5zdGVhZCBvZiBpdCwgZXNwZWNpYWxseQppZiBpdHMgcmV0dXJuIHZhbHVlIGlzIGNo
ZWNrZWQgYnkgdGhlIGNhbGxlciwgYXMgdGhpcyBpcyBsaWtlbHkgdG8gcmVzdWx0CmluIGNsZWFu
ZXIgY29kZS4KClRoaXMgaXMgaW5kZWVkIGJldHRlciwgc3dpdGNoIHRvIHBtX3J1bnRpbWVfcmVz
dW1lX2FuZF9nZXQoKSB3aGljaApjb3JyZWN0bHkgc3VzcGVuZHMgdGhlIGRldmljZSBhZ2FpbiBp
biBjYXNlIG9mIGZhaWx1cmUuIEFsc28gYWRkIGVycm9yCmNoZWNraW5nIGludG8gdGhlIFJORyBk
cml2ZXIgaW4gY2FzZSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgZG9lcwpmYWlsLCB3aGlj
aCBpcyBjdXJyZW50bHkgbm90IGRvbmUsIGFuZCBpdCBkb2VzIGRldGVjdCBzcG9yYWRpYyAtRUFD
Q0VTCmVycm9yIHJldHVybiBhZnRlciByZXN1bWUsIHdoaWNoIHdvdWxkIG90aGVyd2lzZSBsZWFk
IHRvIGEgaGFuZyBkdWUgdG8KcmVnaXN0ZXIgYWNjZXNzIG9uIHVuLXJlc3VtZWQgaGFyZHdhcmUu
IE5vdyB0aGUgcmVhZCBzaW1wbHkgZXJyb3JzIG91dAphbmQgdGhlIHN5c3RlbSBkb2VzIG5vdCBo
YW5nLgoKQWNrZWQtYnk6IEdhdGllbiBDaGV2YWxsaWVyIDxnYXRpZW4uY2hldmFsbGllckBmb3Nz
LnN0LmNvbT4KU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Ci0tLQpD
YzogIlV3ZSBLbGVpbmUtS8O2bmlnIiA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpD
YzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KQ2M6IEdh
dGllbiBDaGV2YWxsaWVyIDxnYXRpZW4uY2hldmFsbGllckBmb3NzLnN0LmNvbT4KQ2M6IEhlcmJl
cnQgWHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KQ2M6IE1hcmVrIFZhc3V0IDxtYXJl
eEBkZW54LmRlPgpDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29t
PgpDYzogT2xpdmlhIE1hY2thbGwgPG9saXZpYUBzZWxlbmljLmNvbT4KQ2M6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+CkNjOiBZYW5nIFlpbmdsaWFuZyA8eWFuZ3lpbmdsaWFuZ0BodWF3
ZWkuY29tPgpDYzoga2VybmVsQGRoLWVsZWN0cm9uaWNzLmNvbQpDYzogbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1jcnlwdG9Admdlci5rZXJuZWwub3JnCkNj
OiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCi0tLQpWMjogQWRkIEFC
IGZyb20gR2F0aWVuClYzOiBObyBjaGFuZ2UKLS0tCiBkcml2ZXJzL2NoYXIvaHdfcmFuZG9tL3N0
bTMyLXJuZy5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9zdG0zMi1ybmcu
YyBiL2RyaXZlcnMvY2hhci9od19yYW5kb20vc3RtMzItcm5nLmMKaW5kZXggMGU5MDNkNmUyMmUz
MC4uNmRlYzRhZGM0OTg1MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9zdG0z
Mi1ybmcuYworKysgYi9kcml2ZXJzL2NoYXIvaHdfcmFuZG9tL3N0bTMyLXJuZy5jCkBAIC0xODcs
NyArMTg3LDkgQEAgc3RhdGljIGludCBzdG0zMl9ybmdfcmVhZChzdHJ1Y3QgaHdybmcgKnJuZywg
dm9pZCAqZGF0YSwgc2l6ZV90IG1heCwgYm9vbCB3YWl0KQogCWludCByZXR2YWwgPSAwLCBlcnIg
PSAwOwogCXUzMiBzcjsKIAotCXBtX3J1bnRpbWVfZ2V0X3N5bmMoKHN0cnVjdCBkZXZpY2UgKikg
cHJpdi0+cm5nLnByaXYpOworCXJldHZhbCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoKHN0
cnVjdCBkZXZpY2UgKilwcml2LT5ybmcucHJpdik7CisJaWYgKHJldHZhbCkKKwkJcmV0dXJuIHJl
dHZhbDsKIAogCWlmIChyZWFkbF9yZWxheGVkKHByaXYtPmJhc2UgKyBSTkdfU1IpICYgUk5HX1NS
X1NFSVMpCiAJCXN0bTMyX3JuZ19jb25jZWFsX3NlZWRfZXJyb3Iocm5nKTsKLS0gCjIuNDMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
