Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1194B0C764
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 17:20:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87C4AC32E8F;
	Mon, 21 Jul 2025 15:20:43 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B47DC349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 15:20:42 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1753111241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/9FzCqmcyJh+8Ydz6tHP0relc2+nn3FdzXGKT9u9tC0=;
 b=dSUpea09yTKvaap84BHTchrX/mvRMJUc48+kcHHkQxoYAlMq1o9H91n0rEyouWUQZds+Ls
 rJWeBKpdVh+r6TVg9PcQPcuj0sZz+kTaDMsLK4KCjaOjlWQYgv4f4R/F/uiKtEsxW6IPu8
 BZs7DYrF+ZLrdRacfIavNLPjVeum/qGXpUL0kBgehfj92Ae5GBzPEau0pmYMGKZYiMUTmA
 WBzzEbBwXCWSUfsni3ElVs+D8g26iSUsJ/++lpGRihfVxdZY1aFI35kcEgLVtGeA+2qJTV
 JIM9YCZ9KB6Tup50FIIXZa38Dsi7uKFBiXUKjNhkEMalmJWrVmGFGCj4lmFI7A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1753111241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/9FzCqmcyJh+8Ydz6tHP0relc2+nn3FdzXGKT9u9tC0=;
 b=Q0GGv108K0Wx0ZlG5G8V8V0Na3jr3eUG3hFHWm0zuYoWeHBjtZZPu1Oy3mIu6+M+ntdxcb
 YsPYlYqxSgIstBDQ==
To: panchuang <panchuang@vivo.com>, Miquel Raynal <miquel.raynal@bootlin.com>
In-Reply-To: <draft-87ikjnvqfx.ffs@tglx>
References: <draft-87ikjnvqfx.ffs@tglx>
Date: Mon, 21 Jul 2025 17:20:39 +0200
Message-ID: <87qzy9tvso.ffs@tglx>
MIME-Version: 1.0
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Amit Kucheria <amitk@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Costa Shulyupin <costa.shul@redhat.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Yury Norov <yury.norov@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jonathan Hunter <jonathanh@nvidia.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Uwe =?utf-8?Q?Kleine-K?= =?utf-8?Q?=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Zhang Rui <rui.zhang@intel.com>, Colin Ian King <colin.i.king@gmail.com>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 =?utf-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Markus Mayer <mmayer@broadcom.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Julien Panis <jpanis@baylibre.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 zhanghongchen <zhanghongchen@loongson.cn>,
 Greg KH <gregkh@linuxfoundation.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Cheng-Yang Chou <yphbchou0911@gmail.com>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Caleb Sander Mateos <csander@purestorage.com>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shawn Guo <shawnguo@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32]
 =?utf-8?b?5Zue5aSNOiBbUEFUQ0ggdjYgMDEvMjRdIGdlbmly?=
 =?utf-8?q?q/devres=3A_Add_devm=5Frequest=5Fthreaded=5Firq=5Fprobe=28=29_a?=
 =?utf-8?b?bmQgZGV2bV9yZXF1ZXN0X2lycV9wcm9iZSgp?=
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

T24gU2F0LCBKdWwgMTkgMjAyNSBhdCAyMzowOCwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+IE9u
IFdlZCwgSnVsIDA5IDIwMjUgYXQgMTc6MTMsIHBhbmNodWFuZ0B2aXZvLmNvbSB3cm90ZToKPj4g
SGkgdGdseCBhbmQgTWlxdcOobCwgSnVzdCBhIGdlbnRsZSBwaW5nIG9uIHRoaXMgcGF0Y2hzZXQu
IEkgdW5kZXJzdGFuZCAKPj4geW91J3JlIGxpa2VseSBidXN5IHdpdGggbWFueSBvdGhlciB0YXNr
cywgYnV0IGFueSBmZWVkYmFjayBvciBndWlkYW5jZSAKPj4gb24gaG93IHRvIHByb2NlZWQgd291
bGQgYmUgZ3JlYXRseSBhcHByZWNpYXRlZC4gQXMgZGlzY3Vzc2VkIGluIHRoZSAKPj4gcHJldmlv
dXMgdGhyZWFkLCB0aGVyZSB3YXMgc29tZSB1bmNlcnRhaW50eSBhYm91dCB3aGV0aGVyIHdlIHNo
b3VsZCAKPj4gZGlyZWN0bHkgaW50ZWdyYXRlIGRldl9lcnJfcHJvYmUoKSBpbnRvIGRldm1fcmVx
dWVzdF90aHJlYWRlZF9pcnEoKSwgb3IgCj4+IGlmIGl0J3MgYmV0dGVyIHRvIGNyZWF0ZSBhIHdy
YXBwZXIgZnVuY3Rpb24uIFRoYW5rcyBmb3IgeW91ciB0aW1lISAKPj4gVGhhbmtzLCBQYW5jaHVh
bmcKCkZvciBzaW1wbGljaXR5IHNha2UganVzdCByZW5hbWUgdGhlIGV4aXN0aW5nIGZ1bmN0aW9u
cwpkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKCkgYW5kIGRldm1fcmVxdWVzdF9hbnlfY29udGV4
dF9pcnEoKSB0bwpfX2Rldm1fcmVxdWVzdF90aHJlYWRlZF9pcnEoKSBhbmQgX19kZXZtX3JlcXVl
c3RfYW55X2NvbnRleHRfaXJxKCkuCgpUaGVuIGNyZWF0ZSBuZXcgZnVuY3Rpb25zIGZvciB0aGUg
QVBJLCB3aGljaAoKICAgLSBpbnZva2UgdGhlIHVuZGVyc2NvcmUgdmFyaWFudHMKICAgLSBhbmQg
b24gZXJyb3IgaW52b2tlIGRldl9lcnJfcHJvYmUoKSBzaW1pbGFyIHRvIHdoYXQgSSBzdWdnZXN0
ZWQgaW4KICAgICBteSByZXBseSBpbiB0aGlzIHRocmVhZC4KCkluIHRoZSByYXJlIGNhc2Ugb2Yg
ZmFpbHVyZSwgdGhpcyB3aWxsIHByaW50IGVycm9yIG1lc3NhZ2VzIGZvciB0aGUKYWZmZWN0ZWQg
ZHJpdmVycyBib3RoIGluIHRoZSBjb3JlIGFuZCBhdCB0aGUgY2FsbHNpdGUsIGJ1dCB0aGF0J3Mg
bm90CnRoZSBlbmQgb2YgdGhlIHdvcmxkLgoKVGhlbiBnbyBhbmQgcmVtb3ZlIHRoZSByYW5kb20g
cHJpbnRrcyBmcm9tIHRoZSBkcml2ZXJzLCBvbmNlIHRoZSBjb3JlCmNoYW5nZSBoYXMgaGl0IHVw
c3RyZWFtLgoKVGhhbmtzLAoKICAgICAgICB0Z2x4CgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
