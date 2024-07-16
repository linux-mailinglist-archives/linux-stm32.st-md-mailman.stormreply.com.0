Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E19F193FA04
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2024 17:58:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4DBEC78F6D;
	Mon, 29 Jul 2024 15:58:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 653F0C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jul 2024 21:38:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 38E226145A;
 Tue, 16 Jul 2024 21:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB571C116B1;
 Tue, 16 Jul 2024 21:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721165914;
 bh=s3argfT0bjT56iOArbsY0GzxvURpvlj8dSdXayAnGo8=;
 h=From:To:Cc:Subject:Date:From;
 b=cUW+jcmqnCG0IrFlXrXiG5XfhplLdmPDpmoLC62qovl97ix3YhOwFUAj98ha2vL2A
 Dg6Uy+T+mG0v1w5TAr5cInRbJyKL5+9jEiE4QB5TY4erkqmkIfBYMGUDLukhJaGgGF
 tTOfTWKAafXrKk5MH9u/pdwX1/2nZRuMa9v55AEc2pTlzsuFiE/v982X/j4tOEDXUL
 eylO+JM4kJWwPnsKwsf1sEjgeN4CmPH9DGk7f98aFml5IqPC3cbfv1LHbwAqA0pg/I
 mMu1Zcnjulhn6AdDYLDMo1AMZFDj0yCaUpqb1OA/ka+7iHU5xYMHYawoxhBwQb0oBE
 1SeEAe1+diIYA==
From: Kees Cook <kees@kernel.org>
To: =?UTF-8?q?Am=C3=A9lie=20Delaunay?= <amelie.delaunay@foss.st.com>
Date: Tue, 16 Jul 2024 14:38:33 -0700
Message-Id: <20240716213830.work.951-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753; i=kees@kernel.org;
 h=from:subject:message-id; bh=s3argfT0bjT56iOArbsY0GzxvURpvlj8dSdXayAnGo8=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBmluhZjVuTZVY4VuNVA9HyBDrilOXfvC/bv0t4D
 77IyyEHNQOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZpboWQAKCRCJcvTf3G3A
 Jj/0D/9PvSaesj4pRMPSiHXBTn/G/dt9EL9dWBSh2VkDcnpNnwHRa0MCb1KLQh+je5Tr27kb0en
 iQFv480u4YA/RKgn4DsO5czDWawVMnMcUK3v9DlFWhMdadEBzZYX/vyooYqIedRmwjg+qQVYQCS
 UCjHpsqGu3bgDvMTwHMZ1d0NVqXxdDK1DxWXiMdKem3bNLArIps5ic5WdCUTuDGK/AfTphwTnzW
 Ejybti4O6+eLNyj28ccYb724kuf5KYL0U2mktsSBn8nkP2H/ZolT4YNxgw72VnC2m13sMj0zz9e
 2zwlZ34PzE7Ce8KKG2BEqAdZZYxh+HPPW0HQtmLqT3HEfP1v9wvrnaiEYSbRadMVdavcLXJfMSS
 RjoxqTou5N9PONYHLqhmuiqNwiE/kYKYN+Qtol5lXdasf1r7zitzs020sBI0BXH2rQHmei7aG4Z
 Fpxr8pCUQXU/DJJmIUhNRfI5FYK6jGN8mG3cLgZFhTxrZdzsJlICLSj9oV0tQE/dPuTcpnhAkpU
 Kokd76DCk4PQKu1X6F9iX8l99p0JPt4XNN/rSos3++hvRFbMaweJpcz/V+B6oxRRJfXChznHNir
 QItIsXDzAqqxAzTMs1S7TaMqXRGLGIhnF1d97O9zAzlMb02otRb19zZinSKmL9hKGWvuLX6ngdW
 HbGOqYVdMdTP7 Hw==
X-Developer-Key: i=kees@kernel.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-Mailman-Approved-At: Mon, 29 Jul 2024 15:58:21 +0000
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-hardening@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dmaengine: stm32-dma3: Set lli_size after
	allocation
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

V2l0aCB0aGUgbmV3IF9fY291bnRlZF9ieSBhbm5vdGF0aW9uLCB0aGUgImxsaV9zaXplIiB2YXJp
YWJsZSBuZWVkcyB0bwp2YWxpZCBmb3IgYWNjZXNzZXMgdG8gdGhlICJsbGkiIGFycmF5LiBUaGlz
IHJlcXVpcmVtZW50IGlzIG5vdCBtZXQgaW4Kc3RtMzJfZG1hM19jaGFuX2Rlc2NfYWxsb2MoKSwg
c2luY2UgImxsaV9zaXplIiBzdGFydHMgYXQgIjAiLCBzbyAibGxpIgppbmRleCAiMCIgd2lsbCBu
b3QgYmUgY29uc2lkZXJlZCB2YWxpZCBkdXJpbmcgdGhlIGluaXRpYWxpemF0aW9uIGZvciBsb29w
LgoKRml4IHRoaXMgYnkgc2V0dGluZyBsbGlfc2l6ZSBpbW1lZGlhdGVseSBhZnRlciBhbGxvY2F0
aW9uIChzaW1pbGFyIHRvCmhvdyB0aGlzIGlzIGhhbmRsZWQgaW4gc3RtMzJfbWRtYV9hbGxvY19k
ZXNjKCkgZm9yIHRoZSBub2RlL2NvdW50CnJlbGF0aW9uc2hpcCkuCgpGaXhlczogZjU2MWVjOGIy
YjMzICgiZG1hZW5naW5lOiBBZGQgU1RNMzIgRE1BMyBzdXBwb3J0IikKU2lnbmVkLW9mZi1ieTog
S2VlcyBDb29rIDxrZWVzQGtlcm5lbC5vcmc+Ci0tLQpDYzogIkFtw6lsaWUgRGVsYXVuYXkiIDxh
bWVsaWUuZGVsYXVuYXlAZm9zcy5zdC5jb20+CkNjOiBWaW5vZCBLb3VsIDx2a291bEBrZXJuZWwu
b3JnPgpDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgpDYzog
QWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KQ2M6IGRtYWVu
Z2luZUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwotLS0KIGRy
aXZlcnMvZG1hL3N0bTMyL3N0bTMyLWRtYTMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hL3N0bTMy
L3N0bTMyLWRtYTMuYyBiL2RyaXZlcnMvZG1hL3N0bTMyL3N0bTMyLWRtYTMuYwppbmRleCA0MDg3
ZTAyNjNhNDguLjBiZTZlOTQ0ZGY2ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9kbWEvc3RtMzIvc3Rt
MzItZG1hMy5jCisrKyBiL2RyaXZlcnMvZG1hL3N0bTMyL3N0bTMyLWRtYTMuYwpAQCAtNDAzLDYg
KzQwMyw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc3RtMzJfZG1hM19zd2Rlc2MgKnN0bTMyX2RtYTNfY2hh
bl9kZXNjX2FsbG9jKHN0cnVjdCBzdG0zMl9kbWEzX2NoCiAJc3dkZXNjID0ga3phbGxvYyhzdHJ1
Y3Rfc2l6ZShzd2Rlc2MsIGxsaSwgY291bnQpLCBHRlBfTk9XQUlUKTsKIAlpZiAoIXN3ZGVzYykK
IAkJcmV0dXJuIE5VTEw7CisJc3dkZXNjLT5sbGlfc2l6ZSA9IGNvdW50OwogCiAJZm9yIChpID0g
MDsgaSA8IGNvdW50OyBpKyspIHsKIAkJc3dkZXNjLT5sbGlbaV0uaHdkZXNjID0gZG1hX3Bvb2xf
emFsbG9jKGNoYW4tPmxsaV9wb29sLCBHRlBfTk9XQUlULApAQCAtNDEwLDcgKzQxMSw2IEBAIHN0
YXRpYyBzdHJ1Y3Qgc3RtMzJfZG1hM19zd2Rlc2MgKnN0bTMyX2RtYTNfY2hhbl9kZXNjX2FsbG9j
KHN0cnVjdCBzdG0zMl9kbWEzX2NoCiAJCWlmICghc3dkZXNjLT5sbGlbaV0uaHdkZXNjKQogCQkJ
Z290byBlcnJfcG9vbF9mcmVlOwogCX0KLQlzd2Rlc2MtPmxsaV9zaXplID0gY291bnQ7CiAJc3dk
ZXNjLT5jY3IgPSAwOwogCiAJLyogU2V0IExMIGJhc2UgYWRkcmVzcyAqLwotLSAKMi4zNC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
