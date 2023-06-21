Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C726738D88
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 19:46:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB12FC65E4F;
	Wed, 21 Jun 2023 17:46:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F94CC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 17:46:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D1CCF61645;
 Wed, 21 Jun 2023 17:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F718C433C8;
 Wed, 21 Jun 2023 17:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687369588;
 bh=rTVtvaUBO4z3cuonHHr5lxCE9f6EkiuFLQwsHlt5v4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iqw1oQmaLbVt5jRzb2yOcPrvwkMyXcSXitr+ykMirpGBfjOebyxml4t4HTVdfXb9s
 yMZnM2soMSsqGCd2yt7Nt3A2uzebZzj83onUa3SNTb9OMKjiQQCMp2qXT9hydb7SMu
 CV2I4K0VrO1jIJIcIoje6E7plJoIPxKbakdBLiHDVhVXFk0viv79Yxap0vEMfw3BBX
 t+C7ycMmW1k5K6NEwz1AyEmi+gNrKvT8k1STWKpjZi63IR6YU1cda556ueAZ55r9um
 iSVqE7QOywQ8CpBbHomTmTG/5rDkSnrgYkLmEho2/c845QwqFdnSfsOf0dt54QYAyX
 VG+lbTy+kXPmA==
Date: Wed, 21 Jun 2023 18:46:23 +0100
From: Lee Jones <lee@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <20230621174623.GP10378@google.com>
References: <8de3aaf297931d655b9ad6aed548f4de8b85425a.1686998575.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8de3aaf297931d655b9ad6aed548f4de8b85425a.1686998575.git.christophe.jaillet@wanadoo.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stmpe: Fix a corner case in
	stmpe_probe()
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

T24gU2F0LCAxNyBKdW4gMjAyMywgQ2hyaXN0b3BoZSBKQUlMTEVUIHdyb3RlOgoKPiBJbiBzdG1w
ZV9wcm9iZSgpLCBpZiBzb21lIHJlZ3VsYXRvcl9lbmFibGUoKSBjYWxscyBmYWlsLCBwcm9iaW5n
IGNvbnRpbnVlcwo+IGFuZCB0aGVyZSBpcyBvbmx5IGEgZGV2X3dhcm4oKS4KPiAKPiBTbywgaWYg
c3RtcGVfcHJvYmUoKSBpcyBjYWxsZWQgdGhlIHJlZ3VsYXRvciBtYXkgbm90IGJlIGVuYWJsZWQu
IEl0IGlzCj4gY2xlYW5lciB0byB0ZXN0IGl0IGJlZm9yZSBjYWxsaW5nIHJlZ3VsYXRvcl9kaXNh
YmxlKCkgaW4gdGhlIHJlbW92ZQo+IGZ1bmN0aW9uLgo+IAo+IEZpeGVzOiA5YzllMzIxNDU1ZmIg
KCJtZmQ6IHN0bXBlOiBhZGQgb3B0aW9uYWwgcmVndWxhdG9ycyIpCj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4KPiAtLS0K
PiAgZHJpdmVycy9tZmQvc3RtcGUuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKQXBwbGllZCwgdGhhbmtzCgotLSAKTGVlIEpvbmVz
IFvmnY7nkLzmlq9dCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
