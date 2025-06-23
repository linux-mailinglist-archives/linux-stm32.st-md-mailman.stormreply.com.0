Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C80AE4816
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 17:14:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4CCBC36B2F;
	Mon, 23 Jun 2025 15:14:02 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51EC8C36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 15:14:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC94944288;
 Mon, 23 Jun 2025 15:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750691640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=45lmqAUYpUykmyRNsOjFpkel3OPLmML527QXdh0o9zU=;
 b=Dk4DRySeiEHJkC5ucZz7LZZ5UhTo8qfaM+NNpNfIAmI8eb71jZ1iyZigWxGJIVUh/eddQP
 8Xl1XY+V1ya18+kaQTE+VfNrEVges9y6YeLXaGu/C3rRQVwdpYLIzr+sV2HHzE/5UmgjzB
 /+xepzhCWX1cw6Sjteg1eK+SyfTf1nG848+wARLHC34oEtB0GGeHyHyWCzEjD96U8cz4ZV
 Q9lHqj9ZKe3ogELbhBMi//RQzmrzPpFKAf5qiAiUT/AZUHomVPjE09J5Bf3w9srIdSfWcY
 Yt4Oua24qVH3rU576TSTUWjL+lZ5mN7oW47CVCJAgdJIvxqw3/Z3LAIlRF5uqQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pan Chuang <panchuang@vivo.com>
In-Reply-To: <20250623123054.472216-2-panchuang@vivo.com> (Pan Chuang's
 message of "Mon, 23 Jun 2025 20:30:34 +0800")
References: <20250623123054.472216-1-panchuang@vivo.com>
 <20250623123054.472216-2-panchuang@vivo.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 23 Jun 2025 17:13:54 +0200
Message-ID: <87a55ywkwd.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujeefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedtpdhrtghpthhtohepphgrnhgthhhurghnghesvhhivhhordgtohhmpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhdrlhgviigtrghnoheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhuihdriihhrghnghesihhnthgvlhdrtghomhdprhgtphhtthhopehluhhkrghsiidrlhhusggrsegrrhhmrdgtohhmpdhrtghpthhtohepmhhmrgihv
 ghrsegsrhhorggutghomhdrtghomhdprhgtphhtthhopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutghomhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
Cc: imx@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Amit Kucheria <amitk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
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
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-rockchip@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "=?utf-8?Q?N=C3=ADcolas?= F. R. A. Prado" <nfraprado@collabora.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Yangtao Li <frank.li@vivo.com>,
 linux-samsung-soc@vger.kernel.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Markus Mayer <mmayer@broadcom.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Julien Panis <jpanis@baylibre.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 zhanghongchen <zhanghongchen@loongson.cn>,
 Greg KH <gregkh@linuxfoundation.org>, Cheng-Yang Chou <yphbchou0911@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Caleb Sander Mateos <csander@purestorage.com>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH v6 01/24] genirq/devres: Add
 devm_request_threaded_irq_probe() and devm_request_irq_probe()
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

SGkgUGFuLAoKT24gMjMvMDYvMjAyNSBhdCAyMDozMDozNCArMDgsIFBhbiBDaHVhbmcgPHBhbmNo
dWFuZ0B2aXZvLmNvbT4gd3JvdGU6Cgo+IEZyb206IFlhbmd0YW8gTGkgPGZyYW5rLmxpQHZpdm8u
Y29tPgo+Cj4gVGhlcmUgYXJlIG1vcmUgdGhhbiA3MDAgY2FsbHMgdG8gZGV2bV9yZXF1ZXN0X3Ro
cmVhZGVkX2lycSBtZXRob2QgYW5kCj4gbW9yZSB0aGFuIDEwMDAgY2FsbHMgdG8gZGV2bV9yZXF1
ZXN0X2lycSBtZXRob2QuIE1vc3QgZHJpdmVycyBvbmx5Cj4gcmVxdWVzdCBvbmUgaW50ZXJydXB0
IHJlc291cmNlLCBhbmQgdGhlc2UgZXJyb3IgbWVzc2FnZXMgYXJlIGJhc2ljYWxseQo+IHRoZSBz
YW1lLiBJZiBlcnJvciBtZXNzYWdlcyBhcmUgcHJpbnRlZCBldmVyeXdoZXJlLCBtb3JlIHRoYW4g
MjAwMCBsaW5lcwo+IG9mIGNvZGUgY2FuIGJlIHNhdmVkIGJ5IHJlbW92aW5nIHRoZSBtc2cgaW4g
dGhlIGRyaXZlci4KClsuLi5dCgo+IFNvIGFkZCBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxX3By
b2JlKCkgYW5kIGRldm1fcmVxdWVzdF9pcnFfcHJvYmUoKSwKPiB3aGljaCBlbnN1cmUgdGhhdCBh
bGwgZXJyb3IgaGFuZGxpbmcgYnJhbmNoZXMgcHJpbnQgZXJyb3IgaW5mb3JtYXRpb24uCj4gSW4g
dGhpcyB3YXksIHdoZW4gdGhpcyBmdW5jdGlvbiBmYWlscywgdGhlIHVwcGVyLWxheWVyIGZ1bmN0
aW9ucyBjYW4KPiBkaXJlY3RseSByZXR1cm4gYW4gZXJyb3IgY29kZSB3aXRob3V0IG1pc3Npbmcg
ZGVidWdnaW5nIGluZm9ybWF0aW9uLgo+IE90aGVyd2lzZSwgdGhlIGVycm9yIG1lc3NhZ2Ugd2ls
bCBiZSBwcmludGVkIHJlZHVuZGFudGx5IG9yIG1pc3NpbmcuCgpXaGlsZSBJIHVuZGVyc3RhbmQg
dGhlIGdvYWwgYW5kIGFkaGVyZSB0byBpdCwgbWF5IEkgY2hhbGxlbmdlIHRoZSB1c2Ugb2YKYSB5
ZXQgYW5vdGhlciBpbnRlcm1lZGlhdGUgZnVuY3Rpb24gdGhhdCA5OSUgb2YgdGhlIHVzZXJzIHdp
bGwgYW55d2F5CnVzZT8gV291bGRuJ3QgaXQgYmUgbW9yZSBzdHJhaWdodGZvcndhcmQgdG8ganVz
dCBhZGQgdGhlIGVycm9yIG1lc3NhZ2UKaW4gdGhlIGV4aXN0aW5nIGZ1bmN0aW9ucyBkaXJlY3Rs
eT8gSWYgd2UgcmVhbGx5IHdhbnQgYW4gYWx0ZXJuYXRpdmUsIGl0Cm1heSBiZSBjcmVhdGVkIGFu
ZCBjYWxsZWQgaW4gdGhlIGZldyBwbGFjZXMgd2hlcmUgYSBkZXZfZXJyX3Byb2JlKCkKbWlnaHQg
bm90IGJlIHJlbGV2YW50LgoKVGhhbmtzLApNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
