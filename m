Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E39FF3C8C7C
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jul 2021 21:39:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5908C597B1;
	Wed, 14 Jul 2021 19:39:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1F3FC597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jul 2021 19:39:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB85161370;
 Wed, 14 Jul 2021 19:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626291589;
 bh=1dAUiCV8RZ3na6Q4TsF8CKkJ/0h5oRkuovNOqnr14dg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RCcvHHcIV+VZBlZFCRG0prHvRGMyFgaupyw1hlxvxY6P12EmZMZ6KLBIfmcO3lg9r
 RVrqAaLWs0XGvPx50Og8jHnttc7b8s4FXe9hbwFzpFw5mH4N7NVrgvzdBq/WRj/i0E
 dipB/JuRh2woQG86rzjYoUEkPFJCKVQRwTMSV1bdqOkUzizsDvqnTHM0RoobOahZkx
 Mpx1OFK68pfo0P2+UrTxio6GS0lvCpGEPm/EBFsJ2JOQdtTwXwVOR7eLqcg6r1G5lJ
 9ctwhgdQMw23fMBKGOLlxnDlieLPr4coY9lI9+Ju4xtIlmlIRDAqz0nfB4FMwpaFr3
 RQs3CK7O+UbNg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 14 Jul 2021 15:37:27 -0400
Message-Id: <20210714193800.52097-75-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714193800.52097-1-sashal@kernel.org>
References: <20210714193800.52097-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Grzegorz Szymaszek <gszymaszek@short.pl>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.13 075/108] ARM: dts: stm32: fix the
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
