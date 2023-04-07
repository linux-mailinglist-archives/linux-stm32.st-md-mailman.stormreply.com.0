Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FA96DA9C6
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Apr 2023 10:11:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E318FC6B446;
	Fri,  7 Apr 2023 08:11:00 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 257E6C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Apr 2023 08:11:00 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D70776000C;
 Fri,  7 Apr 2023 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1680855059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k62lE0Z84brwUbN0RTewMQPHSeeiOVUlnJEgkCzQsvo=;
 b=R9CLiy5G5LdE9BO36N204fuspyAxiiF7TmcabLrbwrQPeoEl5Pn0pcw2pa9LFURAj+yhqS
 Ku6ulo+yoPDqo0ywa6hZxIhfMa2hfrKY6oIoCe+v26HM6BlIqcgn8p8u0WJDFU+gYVyAOT
 iWOVTokLobBTMlDhc5L2oqSRq3pJIdqQ+s5IqSFwu1iEWL1rH1J0xX63ZpwsrUgxYtF5VC
 JMA7zniKULdwaW97f/g6p4Ec2AzETlg0EBYuF+OIU67+xs5aqnBUa8bo0FWsfGskdfArda
 sO7wxwa4nSLUU/oHmfv/0zUTbea+upPaTGkKYKQ1Sq0BSBr1Ah5yUIuIzPRbHA==
Date: Fri, 7 Apr 2023 10:10:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20230407101043.299f5e22@xps-13>
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lucas Stach <dev@lynxeye.de>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, Miaoqian Lin <linmq006@gmail.com>,
 Stefan Agner <stefan@agner.ch>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org,
 Liang Yang <liang.yang@amlogic.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-amlogic@lists.infradead.org,
 Chuanhong Guo <gch981213@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Heiko Stuebner <heiko@sntech.de>,
 Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Yang Yingliang <yangyingliang@huawei.com>, Jack Wang <jinpu.wang@ionos.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, kernel@pengutronix.de,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Vladimir Zapolskiy <vz@mleia.com>,
 Roger Quadros <rogerq@kernel.org>, Wang Weiyang <wangweiyang2@huawei.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Valentin Korenblit <vkorenblit@sequans.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-renesas-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-oxnas@groups.io, Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 00/49] mtd: nand: Convert to platform
 remove callback returning void
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

SGkgVXdlLAoKdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIFNhdCwgIDEg
QXByIDIwMjMgMTg6MTg6NDkgKzAyMDA6Cgo+IEhlbGxvLAo+IAo+IHRoaXMgc2VyaWVzIGFkYXB0
cyB0aGUgcGxhdGZvcm0gZHJpdmVycyBiZWxvdyBkcml2ZXJzL210ZC9uYW5kIHRvIHVzZSB0aGUK
PiAucmVtb3ZlX25ldygpIGNhbGxiYWNrLiBDb21wYXJlZCB0byB0aGUgdHJhZGl0aW9uYWwgLnJl
bW92ZSgpIGNhbGxiYWNrCj4gLnJlbW92ZV9uZXcoKSByZXR1cm5zIG5vIHZhbHVlLiBUaGlzIGlz
IGEgZ29vZCB0aGluZyBiZWNhdXNlIHRoZSBkcml2ZXIgY29yZQo+IGRvZXNuJ3QgKGFuZCBjYW5u
b3QpIGNvcGUgZm9yIGVycm9ycyBkdXJpbmcgcmVtb3ZlLiBUaGUgb25seSBlZmZlY3Qgb2YgYQo+
IG5vbi16ZXJvIHJldHVybiB2YWx1ZSBpbiAucmVtb3ZlKCkgaXMgdGhhdCB0aGUgZHJpdmVyIGNv
cmUgZW1pdHMgYSB3YXJuaW5nLiBUaGUKPiBkZXZpY2UgaXMgcmVtb3ZlZCBhbnlob3cgYW5kIGFu
IGVhcmx5IHJldHVybiBmcm9tIC5yZW1vdmUoKSB1c3VhbGx5IHlpZWxkcyBhCj4gcmVzb3VyY2Ug
bGVhay4KPiAKPiBCeSBjaGFuZ2luZyB0aGUgcmVtb3ZlIGNhbGxiYWNrIHRvIHJldHVybiB2b2lk
IGRyaXZlciBhdXRob3JzIGNhbm5vdAo+IHJlYXNvbmFibHkgYXNzdW1lIGFueSBtb3JlIHRoYXQg
dGhlcmUgaXMgc29tZSBraW5kIG9mIGNsZWFudXAgbGF0ZXIuCj4gCj4gQXMgYWxsIGRyaXZlcnMg
YWxyZWFkeSByZXR1cm4gMCBpbiB0aGVpciAucmVtb3ZlIGNhbGxiYWNrLCB0aGV5IGNhbiBiZQo+
IGNvbnZlcnRlZCB0cml2aWFsbHkuCgpJJ3ZlIGxvb2tlZCBhdCB0aGUgZGlmZmVyZW50IHBhdGNo
ZXMsIHRoZXkgbG9vayBnb29kIHRvIG1lIGJ1dCBhcyB0aGV5CmFyZSBhbGwgdHJpdmlhbCBhbmQg
ZXhhY3RseSBpZGVudGljYWwsIHdvdWxkIHlvdSBtaW5kIHNlbmRpbmcgdGhpcwphZ2FpbiBhbGwg
c3F1YXNoZWQgaW4gYSBzaW5nbGUgcGF0Y2g/IEEgc3Vic3lzdGVtLXdpZGUgY29udmVyc2lvbiBz
ZWVtcwphcHByb3ByaWF0ZS4gSW4gYWxsIGNhc2VzIEkgcGxhbiB0byB0YWtlIHRoaXMgZm9yIHRo
ZSBuZXh0IG1lcmdlCndpbmRvdy4KCkkndmUgY29sbGVjdGVkIHRoZSB0YWdzIHJlY2VpdmVkIHNv
IGZhciBpZiB5b3Ugd2FudDoKCkFja2VkLWJ5OiBOaWNvbGFzIEZlcnJlIDxuaWNvbGFzLmZlcnJl
QG1pY3JvY2hpcC5jb20+ICMgYXRtZWwKUmV2aWV3ZWQtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxA
Y3JhcG91aWxsb3UubmV0PiAjIGluZ2VuaWMKUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4gIyBpbmdlbmljCkFja2VkLWJ5OiBNYXJ0aW4gQmx1
bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiAjIGludGVsClJl
dmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2ds
ZW1haWwuY29tPiAjIG1lc29uCkFja2VkLWJ5OiBSb2dlciBRdWFkcm9zIDxyb2dlcnFAa2VybmVs
Lm9yZz4gIyBvbWFwClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVz
YXNAZ2xpZGVyLmJlPiAjIHJlbmVzYXMKUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlr
b0BzbnRlY2guZGU+ICMgcm9ja2NoaXAKQWNrZWQtYnk6IEplcm5laiBTa3JhYmVjIDxqZXJuZWou
c2tyYWJlY0BnbWFpbC5jb20+ICMgc3VueGkKQWNrZWQtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVk
aW5nQG52aWRpYS5jb20+ICMgdGVncmEKCkJUVywgdGhhbmtzIHRvIGFsbCBvZiB5b3Ugd2hvIHJl
dmlld2VkIGFuZCBhbnN3ZXJlZCB0byB0aGlzIHRocmVhZCEKVGhpcyBpcyBoaWdobHkgYXBwcmVj
aWF0ZWQuIAoKVGhhbmtzLApNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
