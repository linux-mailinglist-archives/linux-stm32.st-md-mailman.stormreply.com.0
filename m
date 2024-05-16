Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A21068C7D55
	for <lists+linux-stm32@lfdr.de>; Thu, 16 May 2024 21:38:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 526A3C6C83A;
	Thu, 16 May 2024 19:38:25 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9EF8C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2024 19:38:18 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 36DFC883E7;
 Thu, 16 May 2024 21:38:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715888298;
 bh=dh7Mqd4f++NHj/N+9IevrvNykG+N8Z8Ls872HqTQVvo=;
 h=From:To:Cc:Subject:Date:From;
 b=fAhcsNkDNlZMlACDyGaE206FqUSLIv183j3cMfyOcR2At6R6oKdRd0CUhb+Qno4aY
 0HFBEM+N2Hz9hY/Vg8wmonkhCSZHx1hQM4POhGZq5hplreyrfg7qbcYOPHTsvL91Q2
 PNdl5zlW/5VqsO8L73UhRPUAEJ3Pb/R2tGfHziDy9bDuEH7gtEKLP+Hz/JY0ym0cbd
 nmjpavCxpa3vIlsnoNcGTKex/nnB1dmplv6NUtl+Lk2I1mS7L+BypFje/3h21vPCIZ
 Zbtucmt2htK4inU9NmTqAY0G9ryPdasTliGzTZBxv94sraVGXaaUpa4oKgjdn+AKQj
 41DIXw5VrLrIw==
From: Marek Vasut <marex@denx.de>
To: linux-crypto@vger.kernel.org
Date: Thu, 16 May 2024 21:37:40 +0200
Message-ID: <20240516193757.12458-1-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH v2 1/2] hwrng: stm32 - use
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
IGZyb20gR2F0aWVuCi0tLQogZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9zdG0zMi1ybmcuYyB8IDQg
KysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvY2hhci9od19yYW5kb20vc3RtMzItcm5nLmMgYi9kcml2ZXJzL2No
YXIvaHdfcmFuZG9tL3N0bTMyLXJuZy5jCmluZGV4IDBlOTAzZDZlMjJlMzAuLjZkZWM0YWRjNDk4
NTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2hhci9od19yYW5kb20vc3RtMzItcm5nLmMKKysrIGIv
ZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9zdG0zMi1ybmcuYwpAQCAtMTg3LDcgKzE4Nyw5IEBAIHN0
YXRpYyBpbnQgc3RtMzJfcm5nX3JlYWQoc3RydWN0IGh3cm5nICpybmcsIHZvaWQgKmRhdGEsIHNp
emVfdCBtYXgsIGJvb2wgd2FpdCkKIAlpbnQgcmV0dmFsID0gMCwgZXJyID0gMDsKIAl1MzIgc3I7
CiAKLQlwbV9ydW50aW1lX2dldF9zeW5jKChzdHJ1Y3QgZGV2aWNlICopIHByaXYtPnJuZy5wcml2
KTsKKwlyZXR2YWwgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KChzdHJ1Y3QgZGV2aWNlICop
cHJpdi0+cm5nLnByaXYpOworCWlmIChyZXR2YWwpCisJCXJldHVybiByZXR2YWw7CiAKIAlpZiAo
cmVhZGxfcmVsYXhlZChwcml2LT5iYXNlICsgUk5HX1NSKSAmIFJOR19TUl9TRUlTKQogCQlzdG0z
Ml9ybmdfY29uY2VhbF9zZWVkX2Vycm9yKHJuZyk7Ci0tIAoyLjQzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
