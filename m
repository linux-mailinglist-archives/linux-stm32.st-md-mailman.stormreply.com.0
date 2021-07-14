Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C09353C8D60
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jul 2021 21:42:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E39CC597B5;
	Wed, 14 Jul 2021 19:42:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 375A2C597B3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jul 2021 19:41:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3824B613E7;
 Wed, 14 Jul 2021 19:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626291717;
 bh=8GeQ5M75UeMZspnSxlJDRK/s5IqEBi4K7a3A1jfCdVY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PBAFdW+W5KGXhoIvs6gVwH+0hAiWUkbdOQc1LsaIZW35rYwkBF5BexnkoiQ7ueXXW
 nqkEDyQznPyNcFfJm7MuqySKMrbgQLIi6IkAWFYAQWcAz6mzulhr/EVPfUHTWg7PSt
 H2sEBkL1TsVmvkeZqU1U3M1i00Vzixgj12PpQi6dda6ZgAAlxqjcTnssibcwUl3OCl
 iQslGKsiXQHLKleud/z07WYsgEa16Vu54O+Ae5cvjrtecn5T5W17pq+asUljIaF7g8
 HPu7OteWRdY25JMK/RmFRRO3UG90up358lolkfsXeLnxW2oOo8YhwoWKNaxSbjoP7j
 wwqXYPHtnJ/Zg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 14 Jul 2021 15:39:50 -0400
Message-Id: <20210714194036.53141-57-sashal@kernel.org>
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
Subject: [Linux-stm32] [PATCH AUTOSEL 5.12 057/102] ARM: dts: stm32: fix
	stm32mp157c-odyssey card detect pin
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
bSBjb21taXQgMDE3MWIwNzM3M2NjOGMyODE1Y2E1ZmE3OWE3MzA4ZmRlZmE1NGNhNCBdCgpUaGUg
bWljcm9TRCBjYXJkIGRldGVjdCBwaW4gaXMgcGh5c2ljYWxseSBjb25uZWN0ZWQgdG8gdGhlIE1Q
VSBwaW4gUEkzLgpUaGUgRGV2aWNlIFRyZWUgY29uZmlndXJhdGlvbiBvZiB0aGUgY2FyZCBkZXRl
Y3QgcGluIHdhcyB3cm9uZ+KAlGl0IHdhcwpzZXQgdG8gcGluIFBCNyBpbnN0ZWFkLiBJZiBzdWNo
IGNvbmZpZ3VyYXRpb24gd2FzIHVzZWQsIHRoZSBrZXJuZWwgd291bGQKaGFuZyBvbiDigJxXYWl0
aW5nIGZvciByb290IGRldmljZeKAnSB3aGVuIGJvb3RpbmcgZnJvbSBhIG1pY3JvU0QgY2FyZC4K
ClNpZ25lZC1vZmYtYnk6IEdyemVnb3J6IFN6eW1hc3playA8Z3N6eW1hc3pla0BzaG9ydC5wbD4K
U2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0
LmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0K
IGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLW9keXNzZXkuZHRzIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS5kdHMgYi9hcmNoL2FybS9ib290L2R0
cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LmR0cwppbmRleCBhN2ZmZWM4ZjE1MTYuLmJlMWRkNWU5ZTc0
NCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS5kdHMK
KysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS5kdHMKQEAgLTY0LDcg
KzY0LDcgQEAgJnNkbW1jMSB7CiAJcGluY3RybC0wID0gPCZzZG1tYzFfYjRfcGluc19hPjsKIAlw
aW5jdHJsLTEgPSA8JnNkbW1jMV9iNF9vZF9waW5zX2E+OwogCXBpbmN0cmwtMiA9IDwmc2RtbWMx
X2I0X3NsZWVwX3BpbnNfYT47Ci0JY2QtZ3Bpb3MgPSA8JmdwaW9iIDcgKEdQSU9fQUNUSVZFX0xP
VyB8IEdQSU9fUFVMTF9VUCk+OworCWNkLWdwaW9zID0gPCZncGlvaSAzIChHUElPX0FDVElWRV9M
T1cgfCBHUElPX1BVTExfVVApPjsKIAlkaXNhYmxlLXdwOwogCXN0LG5lZy1lZGdlOwogCWJ1cy13
aWR0aCA9IDw0PjsKLS0gCjIuMzAuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
