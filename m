Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEEC40EF58
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Sep 2021 04:35:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7050C5A4F5;
	Fri, 17 Sep 2021 02:35:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB019C5A4D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Sep 2021 02:35:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3089F6124F;
 Fri, 17 Sep 2021 02:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631846102;
 bh=V4+4fuchadtuptq/x/at9MpE0EbqUI1gLCg/TTB86Xo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CJbyDvADABI7auRSJSZEnI1bszSDsWBcd4ke3uDwNE/qlUj2AchTAuGF2JPy38iLG
 0lZ5XJ59fW+yotB0zwlZeo4RhsimHUCPwDSTIYmr/VDb4ScttJSq1ayeN2DORRltTW
 Eh18TnKQOTQfEAeDh6Zy5yFQkkkgZiraE62nmW4JGRVgcRUjAOxzVdMUfVeRdkQSKC
 SEgqSFupuCXH864+9edWVTQS9Jyci4gbJDK9ML3E7gl6DaI4py2kjzITUJFJAs59WL
 rzJbK3I9dFf32ASgMMxPkI5NqeeHV++Aox21F4vS7U3Z95ueP3U0WJ/iSfRybYWrER
 tK4oc4sk0YB5g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 16 Sep 2021 22:34:56 -0400
Message-Id: <20210917023457.816816-3-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210917023457.816816-1-sashal@kernel.org>
References: <20210917023457.816816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, linux-pwm@vger.kernel.org,
 alexandre.torgue@foss.st.com, Thierry Reding <thierry.reding@gmail.com>,
 mcoquelin.stm32@gmail.com,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 lee.jones@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 4.19 3/4] pwm: stm32-lp: Don't modify
	HW state in .remove() callback
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

RnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
ClsgVXBzdHJlYW0gY29tbWl0IGQ0NDA4NGM5MzQyN2JiMGE5MjYxNDMyZGIxYThjYTc2YTQyZDgw
NWUgXQoKQSBjb25zdW1lciBpcyBleHBlY3RlZCB0byBkaXNhYmxlIGEgUFdNIGJlZm9yZSBjYWxs
aW5nIHB3bV9wdXQoKS4gQW5kIGlmCnRoZXkgZGlkbid0IHRoZXJlIGlzIGhvcGVmdWxseSBhIGdv
b2QgcmVhc29uIChvciB0aGUgY29uc3VtZXIgbmVlZHMKZml4aW5nKS4gQWxzbyBpZiBkaXNhYmxp
bmcgYW4gZW5hYmxlZCBQV00gd2FzIHRoZSByaWdodCB0aGluZyB0byBkbywKdGhpcyBzaG91bGQg
YmV0dGVyIGJlIGRvbmUgaW4gdGhlIGZyYW1ld29yayBpbnN0ZWFkIG9mIGluIGVhY2ggbG93IGxl
dmVsCmRyaXZlci4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1r
b2VuaWdAcGVuZ3V0cm9uaXguZGU+ClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0aGll
cnJ5LnJlZGluZ0BnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxA
a2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc3RtMzItbHAuYyB8IDIgLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1z
dG0zMi1scC5jIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMKaW5kZXggMjhlMWY2NDEzNDc2
Li5lOTJhMTQwMDc0MjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jCisr
KyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jCkBAIC0yMjQsOCArMjI0LDYgQEAgc3RhdGlj
IGludCBzdG0zMl9wd21fbHBfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7
CiAJc3RydWN0IHN0bTMyX3B3bV9scCAqcHJpdiA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYp
OwogCi0JcHdtX2Rpc2FibGUoJnByaXYtPmNoaXAucHdtc1swXSk7Ci0KIAlyZXR1cm4gcHdtY2hp
cF9yZW1vdmUoJnByaXYtPmNoaXApOwogfQogCi0tIAoyLjMwLjIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
