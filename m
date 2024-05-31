Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B4F8D5D57
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2024 10:58:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 437CCC6DD72;
	Fri, 31 May 2024 08:58:13 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 518B6CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2024 08:58:06 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 756E8882FA;
 Fri, 31 May 2024 10:58:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717145885;
 bh=QljEamaz3mSONFWT5Op6k1tNyxsfUAuFoqWpRnE3RAM=;
 h=From:To:Cc:Subject:Date:From;
 b=futErEBwCEFrIu33jjPiuMmEdy45pTX8qBNZNjZ9DqVXqIptDnmZqs+MHdBMH+UJm
 RGcLl22AeH8xM9mHTEHubK0YaEZkGjjgydJ2h4MHT9gDuWtvlEZxD4CUZsNY2sDm3/
 YAucjgDgz6M9iO+4Ea86VZvxmaXR0ecdiipyXyM8fqVIJIYWTQFtRfOApWzsOor9hi
 8NcQiSjZsFA/nX+N4Ay+9Ju7u/zsEZ4mQz3fCUBrLoDDkJXy+0IjtKD9BtRUYYLkXR
 BCTW1+oXdrU3el9psMiAHoYInsmRSqx6pYWPdC/FDxuP3jU4CS2spp1chirJGCTxtK
 q38BTBvDexP3Q==
From: Marek Vasut <marex@denx.de>
To: linux-crypto@vger.kernel.org
Date: Fri, 31 May 2024 10:57:34 +0200
Message-ID: <20240531085749.42863-1-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH] hwrng: stm32 - use sizeof(*priv) instead of
	sizeof(struct stm32_rng_private)
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

VXNlIHNpemVvZigqcHJpdikgaW5zdGVhZCBvZiBzaXplb2Yoc3RydWN0IHN0bTMyX3JuZ19wcml2
YXRlKSwgdGhlCmZvcm1lciBtYWtlcyByZW5hbWluZyBvZiBzdHJ1Y3Qgc3RtMzJfcm5nX3ByaXZh
dGUgZWFzaWVyIGlmIG5lY2Vzc2FyeSwKYXMgaXQgcmVtb3ZlcyBvbmUgc2l0ZSB3aGVyZSBzdWNo
IHJlbmFtZSBoYXMgdG8gaGFwcGVuLiBObyBmdW5jdGlvbmFsCmNoYW5nZS4KClNpZ25lZC1vZmYt
Ynk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgotLS0KQ2M6ICJVd2UgS2xlaW5lLUvDtm5p
ZyIgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KQ2M6IEFsZXhhbmRyZSBUb3JndWUg
PGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+CkNjOiBHYXRpZW4gQ2hldmFsbGllciA8Z2F0
aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5jb20+CkNjOiBIZXJiZXJ0IFh1IDxoZXJiZXJ0QGdvbmRv
ci5hcGFuYS5vcmcuYXU+CkNjOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KQ2M6IE1heGlt
ZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4KQ2M6IE9saXZpYSBNYWNrYWxs
IDxvbGl2aWFAc2VsZW5pYy5jb20+CkNjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpD
YzogWWFuZyBZaW5nbGlhbmcgPHlhbmd5aW5nbGlhbmdAaHVhd2VpLmNvbT4KQ2M6IGtlcm5lbEBk
aC1lbGVjdHJvbmljcy5jb20KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpDYzogbGludXgtY3J5cHRvQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQotLS0KIGRyaXZlcnMvY2hhci9od19yYW5kb20vc3RtMzIt
cm5nLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2NoYXIvaHdfcmFuZG9tL3N0bTMyLXJuZy5jIGIvZHJp
dmVycy9jaGFyL2h3X3JhbmRvbS9zdG0zMi1ybmcuYwppbmRleCBkMDhjODcwZWI4ZDFmLi45ZDA0
MWE2N2MyOTVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2NoYXIvaHdfcmFuZG9tL3N0bTMyLXJuZy5j
CisrKyBiL2RyaXZlcnMvY2hhci9od19yYW5kb20vc3RtMzItcm5nLmMKQEAgLTUxNyw3ICs1MTcs
NyBAQCBzdGF0aWMgaW50IHN0bTMyX3JuZ19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpv
ZmRldikKIAlzdHJ1Y3Qgc3RtMzJfcm5nX3ByaXZhdGUgKnByaXY7CiAJc3RydWN0IHJlc291cmNl
ICpyZXM7CiAKLQlwcml2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKHN0cnVjdCBzdG0zMl9y
bmdfcHJpdmF0ZSksIEdGUF9LRVJORUwpOworCXByaXYgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXpl
b2YoKnByaXYpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIXByaXYpCiAJCXJldHVybiAtRU5PTUVNOwog
Ci0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
