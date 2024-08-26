Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D157795EDB6
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 11:52:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F8C3C7801B;
	Mon, 26 Aug 2024 09:52:25 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2E81C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 09:52:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D811C0003;
 Mon, 26 Aug 2024 09:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724665937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQulIFQ3MSaYELsasLXuNGLySXXrhci4b3aPunJJ4Vc=;
 b=EODnI/Hqi2gf0HbwFYGycKIX5kvmTtlkTXDO4Ou41WtUREytRJW+uzyzbbje/qpzCVBu79
 fSZNUNx2Pxbz8rCB1K+3cs0Z8CNQ6fLkHIwW5Bf6JR/H+u0kujeYra4gUVJGr+fZL4LuHr
 dFci05mgwwLcdxWD/Qzu8SeLe/SSFqSkzp30cRWgijaUwcA6Z1Qe0BrxDoge9GG6wuyzFj
 yQiNVtFwqBXdgnAeUce96v1BjYId0+uglxNfMH0LbemPRVBVRY17gS0V5iTNfRUltLRJu5
 r1jGtikL/0Eu0CG3oeVC7zp0fWlE96seULFGTb96CUMnB+71d1pjwhU6ZMy6kg==
Date: Mon, 26 Aug 2024 11:52:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Message-ID: <20240826115213.389acaef@xps-13>
In-Reply-To: <20240826094328.2991664-1-ruanjinjie@huawei.com>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
Cc: val@packett.cool, vigneshr@ti.com, kees@kernel.org,
 linux-kernel@vger.kernel.org, erick.archer@gmx.com, liang.yang@amlogic.com,
 linux-mtd@lists.infradead.org, krzk@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, robh@kernel.org,
 samuel@sholland.org, richard@nod.at, jernej.skrabec@gmail.com,
 linux-rockchip@lists.infradead.org, wens@csie.org,
 u.kleine-koenig@pengutronix.de, jbrunet@baylibre.com, linux@treblig.org,
 martin.blumenstingl@googlemail.com, christophe.jaillet@wanadoo.fr,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 gustavoars@kernel.org, linux-renesas-soc@vger.kernel.org,
 mcoquelin.stm32@gmail.com, khilman@baylibre.com,
 linux-mediatek@lists.infradead.org, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH -next RESEND 00/10] mtd: Use
 for_each_child_of_node_scoped()
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

SGkgSmluamllLAoKcnVhbmppbmppZUBodWF3ZWkuY29tIHdyb3RlIG9uIE1vbiwgMjYgQXVnIDIw
MjQgMTc6NDM6MTggKzA4MDA6Cgo+IFVzZSBzY29wZWQgZm9yX2VhY2hfYXZhaWxhYmxlX2NoaWxk
X29mX25vZGVfc2NvcGVkKCkgd2hlbiBpdGVyYXRpbmcgb3Zlcgo+IGRldmljZSBub2RlcyB0byBt
YWtlIGNvZGUgYSBiaXQgc2ltcGxlci4KCldoeSBpcyB0aGlzIGEgcmVzZW5kID8gRGlkIEkgbWlz
cyBhIHByZXZpb3VzIGl0ZXJhdGlvbj8KClRoYW5rcywKTWlxdcOobApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
