Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FB195F232
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 14:56:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0863EC7801A;
	Mon, 26 Aug 2024 12:56:15 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49093C6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 12:56:08 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WsrJ9268SzyR3h;
 Mon, 26 Aug 2024 20:55:37 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 79DC01800A5;
 Mon, 26 Aug 2024 20:56:05 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 26 Aug 2024 20:56:03 +0800
Message-ID: <061c39b9-c2fb-34e8-5848-dc2d2d9ca5eb@huawei.com>
Date: Mon, 26 Aug 2024 20:56:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
 <20240826115213.389acaef@xps-13>
 <f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
 <20240826144917.2c4e202d@xps-13>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240826144917.2c4e202d@xps-13>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemh500013.china.huawei.com (7.202.181.146)
Cc: val@packett.cool, vigneshr@ti.com, kees@kernel.org,
 linux-kernel@vger.kernel.org, erick.archer@gmx.com, liang.yang@amlogic.com,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 heiko@sntech.de, robh@kernel.org, samuel@sholland.org, richard@nod.at,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org, wens@csie.org,
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

CgpPbiAyMDI0LzgvMjYgMjA6NDksIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgS3J6eXN6dG9m
LAo+IAo+IGtyemtAa2VybmVsLm9yZyB3cm90ZSBvbiBNb24sIDI2IEF1ZyAyMDI0IDEyOjE5OjA3
ICswMjAwOgo+IAo+PiBPbiAyNi8wOC8yMDI0IDExOjUyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
Pj4gSGkgSmluamllLAo+Pj4KPj4+IHJ1YW5qaW5qaWVAaHVhd2VpLmNvbSB3cm90ZSBvbiBNb24s
IDI2IEF1ZyAyMDI0IDE3OjQzOjE4ICswODAwOgo+Pj4gICAKPj4+PiBVc2Ugc2NvcGVkIGZvcl9l
YWNoX2F2YWlsYWJsZV9jaGlsZF9vZl9ub2RlX3Njb3BlZCgpIHdoZW4gaXRlcmF0aW5nIG92ZXIK
Pj4+PiBkZXZpY2Ugbm9kZXMgdG8gbWFrZSBjb2RlIGEgYml0IHNpbXBsZXIuICAKPj4+Cj4+PiBX
aHkgaXMgdGhpcyBhIHJlc2VuZCA/IERpZCBJIG1pc3MgYSBwcmV2aW91cyBpdGVyYXRpb24/ICAK
Pj4KPj4gWW91IHdlcmUgbm90IGNjLWVkIG9uIHByZXZpb3VzIGl0ZXJhdGlvbi4gSSBhc2tlZCBm
b3IgcHJvcGVyIHNwbGl0Cj4+IGJldHdlZW4gc3Vic3lzdGVtcyBhbmQgc2VuZGluZyB0byBtYWlu
dGFpbmVycywgdGh1cyB0aGlzIHJlc2VuZC4KPiAKPiBPay4gTWFrZXMgc2Vuc2UsIGFuZCB0aGUg
cGF0Y2hzZXQgbG9va3MgZmluZS4KPiAKPiBKaW5qaWUsIHBsZWFzZSBhbHdheXMgaW5jbHVkZSBh
IGNoYW5nZWxvZyB3aGVuIHlvdSBzZW5kIG5ldyB2ZXJzaW9ucywKPiBhbmQgZXhwbGFuYXRpb25z
IGZvciBhIFJFU0VORC4KCk9rLCB0aGFua3MgZm9yIHRoZSBhZHZpY2UuCgo+IAo+IFRoYW5rcywK
PiBNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
