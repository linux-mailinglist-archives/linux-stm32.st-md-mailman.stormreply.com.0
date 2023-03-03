Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D006A9B9C
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Mar 2023 17:21:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F20A2C6A61A;
	Fri,  3 Mar 2023 16:21:57 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FBACC6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Mar 2023 16:21:55 +0000 (UTC)
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
 by mx.socionext.com with ESMTP; 04 Mar 2023 01:21:52 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
 by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id EE1632058442;
 Sat,  4 Mar 2023 01:21:51 +0900 (JST)
Received: from kinkan2.css.socionext.com ([172.31.9.51]) by m-FILTER with
 ESMTP; Sat, 4 Mar 2023 01:21:51 +0900
Received: from [10.212.156.241] (unknown [10.212.156.241])
 by kinkan2.css.socionext.com (Postfix) with ESMTP id 60F9D25528;
 Sat,  4 Mar 2023 01:21:44 +0900 (JST)
Message-ID: <acb7d81e-69d5-ff1b-aa0b-709c8c56010b@socionext.com>
Date: Sat, 4 Mar 2023 01:21:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org
References: <20230301201446.3713334-1-daniel.lezcano@linaro.org>
 <20230301201446.3713334-3-daniel.lezcano@linaro.org>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20230301201446.3713334-3-daniel.lezcano@linaro.org>
Cc: Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Dhruva Gole <d-gole@ti.com>,
 Yangtao Li <tiny.windzz@gmail.com>,
 "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Tim Zimmermann <tim@linux4.de>,
 Daniel Golle <daniel@makrotopia.org>, Zheng Yongjun <zhengyongjun3@huawei.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Balsam CHIHI <bchihi@baylibre.com>,
 Stefan Wahren <stefan.wahren@i2se.com>,
 "open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Ido Schimmel <idosch@nvidia.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Jiang Jian <jiangjian@cdjrlc.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Orson Zhai <orsonzhai@gmail.com>,
 Adam Ward <DLG-Adam.Ward.opensource@dm.renesas.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "Lee, Chun-Yi" <joeyli.kernel@gmail.com>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Talel Shenhar <talel@amazon.com>,
 linux-pm@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Eduardo Valentin <edubezval@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>, Markus Mayer <mmayer@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Zhang Rui <rui.zhang@intel.com>, Johan Hovold <johan+linaro@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, Keerthy <j-keerthy@ti.com>,
 Bjorn Andersson <andersson@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 Shang XiaoJing <shangxiaojing@huawei.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yang Li <yang.lee@linux.alibaba.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5 02/18] thermal/core: Use the thermal
 zone 'devdata' accessor in thermal located drivers
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMjAyMy8wMy8wMiA1OjE0LCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPiBUaGUgdGhlcm1hbCB6
b25lIGRldmljZSBzdHJ1Y3R1cmUgaXMgZXhwb3NlZCB0byB0aGUgZGlmZmVyZW50IGRyaXZlcnMK
PiBhbmQgb2J2aW91c2x5IHRoZXkgYWNjZXNzIHRoZSBpbnRlcm5hbHMgd2hpbGUgdGhhdCBzaG91
bGQgYmUKPiByZXN0cmljdGVkIHRvIHRoZSBjb3JlIHRoZXJtYWwgY29kZS4KPiAKPiBJbiBvcmRl
ciB0byBzZWxmLWVuY2Fwc3VsYXRlIHRoZSB0aGVybWFsIGNvcmUgY29kZSwgd2UgbmVlZCB0byBw
cmV2ZW50Cj4gdGhlIGRyaXZlcnMgYWNjZXNzaW5nIGRpcmVjdGx5IHRoZSB0aGVybWFsIHpvbmUg
c3RydWN0dXJlIGFuZCBwcm92aWRlCj4gYWNjZXNzb3IgZnVuY3Rpb25zIHRvIGRlYWwgd2l0aC4K
PiAKPiBVc2UgdGhlIGRldmRhdGEgYWNjZXNzb3IgaW50cm9kdWNlZCBpbiB0aGUgcHJldmlvdXMg
cGF0Y2guCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVuZGVkLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IERhbmllbCBMZXpjYW5vIDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnPgo+IFJldmll
d2VkLWJ5OiBOaWtsYXMgU8O2ZGVybHVuZCA8bmlrbGFzLnNvZGVybHVuZCtyZW5lc2FzQHJhZ25h
dGVjaC5zZT4gI1ItQ2FyCj4gQWNrZWQtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9y
Zz4KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8KPiA8YW5nZWxvZ2lv
YWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPiAjTWVkaWFUZWsgYXV4YWRjIGFuZCBsdnRz
Cj4gUmV2aWV3ZWQtYnk6IEJhbHNhbSBDSElISSA8YmNoaWhpQGJheWxpYnJlLmNvbT4gI01lZGlh
dGVrIGx2dHMKPiBSZXZpZXdlZC1ieTogQWRhbSBXYXJkIDxETEctQWRhbS5XYXJkLm9wZW5zb3Vy
Y2VAZG0ucmVuZXNhcy5jb20+ICNkYTkwNjIKPiBSZXZpZXdlZC1ieTogQmFvbGluIFdhbmcgPGJh
b2xpbi53YW5nQGxpbnV4LmFsaWJhYmEuY29tPiAgI3NwcmVhZAo+IEFja2VkLWJ5OiBKZXJuZWog
U2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPiAjc3VuOGlfdGhlcm1hbAo+IEFja2Vk
LWJ5OiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsLmoud3lzb2NraUBpbnRlbC5jb20+Cj4gQWNr
ZWQtYnk6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPiAjQnJvYWRjb20K
PiBSZXZpZXdlZC1ieTogRGhydXZhIEdvbGUgPGQtZ29sZUB0aS5jb20+ICMgSzMgYmFuZGdhcAoK
KHNuaXApCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvdW5pcGhpZXJfdGhlcm1hbC5j
Cj4gYi9kcml2ZXJzL3RoZXJtYWwvdW5pcGhpZXJfdGhlcm1hbC5jCj4gaW5kZXggNDc4MDE4NDFi
M2Y1Li5hZWY2MTE5Y2MwMDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy90aGVybWFsL3VuaXBoaWVy
X3RoZXJtYWwuYwo+ICsrKyBiL2RyaXZlcnMvdGhlcm1hbC91bmlwaGllcl90aGVybWFsLmMKPiBA
QCAtMTg3LDcgKzE4Nyw3IEBAIHN0YXRpYyB2b2lkIHVuaXBoaWVyX3RtX2Rpc2FibGVfc2Vuc29y
KHN0cnVjdAo+IHVuaXBoaWVyX3RtX2RldiAqdGRldikKPiAKPiAgIHN0YXRpYyBpbnQgdW5pcGhp
ZXJfdG1fZ2V0X3RlbXAoc3RydWN0IHRoZXJtYWxfem9uZV9kZXZpY2UgKnR6LCBpbnQKPiAqb3V0
X3RlbXApCj4gICB7Cj4gLQlzdHJ1Y3QgdW5pcGhpZXJfdG1fZGV2ICp0ZGV2ID0gdHotPmRldmRh
dGE7Cj4gKwlzdHJ1Y3QgdW5pcGhpZXJfdG1fZGV2ICp0ZGV2ID0gdGhlcm1hbF96b25lX2Rldmlj
ZV9wcml2KHR6KTsKClJldmlld2VkLWJ5OiBLdW5paGlrbyBIYXlhc2hpIDxoYXlhc2hpLmt1bmlo
aWtvQHNvY2lvbmV4dC5jb20+ICN1bmlwaGllcgoKVGhhbmsgeW91LAoKLS0tCkJlc3QgUmVnYXJk
cwpLdW5paGlrbyBIYXlhc2hpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
