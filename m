Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F96E540845
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jun 2022 19:57:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31F32C0D2C0;
	Tue,  7 Jun 2022 17:57:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 001BDC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jun 2022 17:57:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C0832617A8;
 Tue,  7 Jun 2022 17:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A95C34119;
 Tue,  7 Jun 2022 17:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1654624654;
 bh=tXpFV1oq8s2qSwjMPFj5GjP5i35kucSjkrQzFXm++X0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eGxNaFes9WWENbjjaHskWx6IUxUES1FK6lHfsV4OHrv3fS9Fb6BrypvhNgN+1TEEm
 LUrPTvGhWp6+EgmjULAkpjI/oZHug+hDKk4YcaMVgQ4jlfUsJe/zOrYiDmciFg0e+k
 yQ1ljstf1LFrZjAfKw57URxEN8CstU+BxpLno67A=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Date: Tue,  7 Jun 2022 19:01:11 +0200
Message-Id: <20220607164946.918592920@linuxfoundation.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607164934.766888869@linuxfoundation.org>
References: <20220607164934.766888869@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Linux-stm32] [PATCH 5.15 406/667] ARM: dts: stm32: Fix PHY
	post-reset delay on Avenger96
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

RnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+CgpbIFVwc3RyZWFtIGNvbW1pdCBlZjJk
OTA3MDg4ODNmNDAyNWE4MDFmZWIwYmE4NDExYTdhNDM4N2UxIF0KClBlciBLU1o5MDMxUk5YIFBI
WSBkYXRhc2hlZXQgRklHVVJFIDctNTogUE9XRVItVVAvUE9XRVItRE9XTi9SRVNFVCBUSU1JTkcK
Tm90ZSAyOiBBZnRlciB0aGUgZGUtYXNzZXJ0aW9uIG9mIHJlc2V0LCB3YWl0IGEgbWluaW11bSBv
ZiAxMDAgzrxzIGJlZm9yZQpzdGFydGluZyBwcm9ncmFtbWluZyBvbiB0aGUgTUlJTSAoTURDL01E
SU8pIGludGVyZmFjZS4KCkFkZCAxbXMgcG9zdC1yZXNldCBkZWxheSB0byBndWFyYW50ZWUgdGhp
cyBmaWd1cmUuCgpGaXhlczogMDEwY2E5ZmU1MDBiZiAoIkFSTTogZHRzOiBzdG0zMjogQWRkIG1p
c3NpbmcgZXRoZXJuZXQgUEhZIHJlc2V0IG9uIEFWOTYiKQpTaWduZWQtb2ZmLWJ5OiBNYXJlayBW
YXN1dCA8bWFyZXhAZGVueC5kZT4KQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3Jn
dWVAZm9zcy5zdC5jb20+CkNjOiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3Nz
LnN0LmNvbT4KQ2M6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5j
b20+CkNjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tClRvOiBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKU2lnbmVkLW9mZi1ieTogQWxleGFuZHJl
IFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KU2lnbmVkLW9mZi1ieTogU2Fz
aGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMy
bXAxNXh4LWRoY29yLWF2ZW5nZXI5Ni5kdHNpIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNv
ci1hdmVuZ2VyOTYuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29yLWF2
ZW5nZXI5Ni5kdHNpCmluZGV4IDY4ODU5NDhmMzAyNC4uOGViNTFkODRiNjk4IDEwMDY0NAotLS0g
YS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1hdmVuZ2VyOTYuZHRzaQorKysg
Yi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1hdmVuZ2VyOTYuZHRzaQpAQCAt
MTQxLDYgKzE0MSw3IEBACiAJCWNvbXBhdGlibGUgPSAic25wcyxkd21hYy1tZGlvIjsKIAkJcmVz
ZXQtZ3Bpb3MgPSA8JmdwaW96IDIgR1BJT19BQ1RJVkVfTE9XPjsKIAkJcmVzZXQtZGVsYXktdXMg
PSA8MTAwMD47CisJCXJlc2V0LXBvc3QtZGVsYXktdXMgPSA8MTAwMD47CiAKIAkJcGh5MDogZXRo
ZXJuZXQtcGh5QDcgewogCQkJcmVnID0gPDc+OwotLSAKMi4zNS4xCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
