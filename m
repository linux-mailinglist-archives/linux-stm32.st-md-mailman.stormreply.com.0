Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A805F95EEF6
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 12:53:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A48EC7801B;
	Mon, 26 Aug 2024 10:53:56 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19CFAC7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 10:53:48 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WsnYB2s0kzhXc8;
 Mon, 26 Aug 2024 18:51:42 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 4FD851800A7;
 Mon, 26 Aug 2024 18:53:45 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 26 Aug 2024 18:53:43 +0800
Message-ID: <3e0ba029-d658-be41-77ac-6edec75762d1@huawei.com>
Date: Mon, 26 Aug 2024 18:53:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
 <20240826115213.389acaef@xps-13>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240826115213.389acaef@xps-13>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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

CgpPbiAyMDI0LzgvMjYgMTc6NTIsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgSmluamllLAo+
IAo+IHJ1YW5qaW5qaWVAaHVhd2VpLmNvbSB3cm90ZSBvbiBNb24sIDI2IEF1ZyAyMDI0IDE3OjQz
OjE4ICswODAwOgo+IAo+PiBVc2Ugc2NvcGVkIGZvcl9lYWNoX2F2YWlsYWJsZV9jaGlsZF9vZl9u
b2RlX3Njb3BlZCgpIHdoZW4gaXRlcmF0aW5nIG92ZXIKPj4gZGV2aWNlIG5vZGVzIHRvIG1ha2Ug
Y29kZSBhIGJpdCBzaW1wbGVyLgo+IAo+IFdoeSBpcyB0aGlzIGEgcmVzZW5kID8gRGlkIEkgbWlz
cyBhIHByZXZpb3VzIGl0ZXJhdGlvbj8KCkhpIE1pcXVlbCwKClRoZSBwcmV2aW91cyBjYyBsaXN0
IGhhcyBtaXNzaW5nIHNvbWUgZW50cmllcy4KCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
