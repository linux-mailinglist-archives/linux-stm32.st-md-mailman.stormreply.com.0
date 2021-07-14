Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFF43C8D66
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jul 2021 21:42:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12CDBC597B5;
	Wed, 14 Jul 2021 19:42:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F1BBC597B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jul 2021 19:42:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F86261404;
 Wed, 14 Jul 2021 19:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626291737;
 bh=1dAUiCV8RZ3na6Q4TsF8CKkJ/0h5oRkuovNOqnr14dg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dskQIDVF1QzsL83SWSj7XxoZdw0khtUtM+YwgWCqsLgnR0J81VZRMJJafJdve5rZi
 WUPOVLRQ9LIKtmFuK2j2U9bZX/CJXhGGrvas/fUQ9Qe7cIImgxGFO5qvuPpgv1Tpvq
 HZdRK5frpl1yE0v9xiWQQnISgLlwfzA6eGGL6pleTeTxSZC/9rVNdRJFP0/Vp03GCC
 dgvIk4g00LZGWx+C+QtDeKuRzBMFh891I8Vn/i62JdzhEx+Wxprozy0ZVQ0AP5J9F1
 JjyYVLnud3L++8XVbIPozJ3i4C7Zzn+gS++lfN1D8FVz1FPqIqRA+33/XjPaqZ+GWW
 oc/ZyDUzZXSnQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 14 Jul 2021 15:40:04 -0400
Message-Id: <20210714194036.53141-71-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714194036.53141-1-sashal@kernel.org>
References: <20210714194036.53141-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Grzegorz Szymaszek <gszymaszek@short.pl>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.12 071/102] ARM: dts: stm32: fix the
	Odyssey SoM eMMC VQMMC supply
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

RnJvbTogR3J6ZWdvcnogU3p5bWFzemVrIDxnc3p5bWFzemVrQHNob3J0LnBsPgoKWyBVcHN0cmVh
bSBjb21taXQgZjQ5MzE2MjMxOTc4ODgwMmI2YTQ5NjM0ZjcyNjhlNjkxYjRjMTBlYyBdCgpUaGUg
U2VlZWQgU29NLVNUTTMyTVAxNTdDIGRldmljZSB0cmVlIGhhZCB0aGUgZU1NQ+KAmXMgKFNETU1D
MikgVlFNTUMKc3VwcGx5IHNldCB0byB2M3YzIChidWNrNCksIHRoZSBzYW1lIGFzIHRoZSBWTU1D
IHN1cHBseS4gVGhhdCB3YXMKaW5jb3JyZWN0LCBhcyBvbiB0aGUgU29NLCB0aGUgVlFNTUMgc3Vw
cGx5IGlzIHByb3ZpZGVkIGZyb20gdmRkIChidWNrMykKaW5zdGVhZC4KClNpZ25lZC1vZmYtYnk6
IEdyemVnb3J6IFN6eW1hc3playA8Z3N6eW1hc3pla0BzaG9ydC5wbD4KU2lnbmVkLW9mZi1ieTog
QWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KU2lnbmVkLW9m
Zi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMybXAxNTdjLW9keXNzZXktc29tLmR0c2kgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Rt
MzJtcDE1N2Mtb2R5c3NleS1zb20uZHRzaQppbmRleCA2Y2Y0OWEwYTllNjkuLmI1NjAxZDI3MGM4
ZiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS1zb20u
ZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNp
CkBAIC0yNjksNyArMjY5LDcgQEAgJnNkbW1jMiB7CiAJc3QsbmVnLWVkZ2U7CiAJYnVzLXdpZHRo
ID0gPDg+OwogCXZtbWMtc3VwcGx5ID0gPCZ2M3YzPjsKLQl2cW1tYy1zdXBwbHkgPSA8JnYzdjM+
OworCXZxbW1jLXN1cHBseSA9IDwmdmRkPjsKIAltbWMtZGRyLTNfM3Y7CiAJc3RhdHVzID0gIm9r
YXkiOwogfTsKLS0gCjIuMzAuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
