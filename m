Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9C16A70BC
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Mar 2023 17:22:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FB65C6A5FD;
	Wed,  1 Mar 2023 16:22:31 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4038CC6A5F8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Mar 2023 16:22:29 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 321GKeV8065246;
 Wed, 1 Mar 2023 10:20:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1677687640;
 bh=eJOulfBTO406+XJwSAbUrw3TOVKL7z76SdXOdRRvd8g=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=oITlJuKJL0Igo+Zp8Mw3to8q1ph1GEIt/d3yESZ3cer2ebuhWbdbMI3A5SmJvB3FN
 V+iCTjreym1r6VJb2vPdvJYz95D6QkQDjk525lQPej2NRTUvuqozcO2ayatgFg+2/r
 1bTPhJR/a6fqQcqeL9vlm4O3gnX/VFyNSv0aWTr0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 321GKeZv003448
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 1 Mar 2023 10:20:40 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 1
 Mar 2023 10:20:40 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 1 Mar 2023 10:20:40 -0600
Received: from [10.250.235.39] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 321GKE84054644;
 Wed, 1 Mar 2023 10:20:15 -0600
Message-ID: <2493cf75-f78c-993a-01e6-8f89556973f0@ti.com>
Date: Wed, 1 Mar 2023 21:50:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, <rafael@kernel.org>
References: <20230228112238.2312273-1-daniel.lezcano@linaro.org>
 <20230228112238.2312273-3-daniel.lezcano@linaro.org>
From: "Gole, Dhruva" <d-gole@ti.com>
Organization: Texas Instruments Incorporated
In-Reply-To: <20230228112238.2312273-3-daniel.lezcano@linaro.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
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
 Florian Fainelli <f.fainelli@gmail.com>, "open list:TI BANDGAP AND THERMAL
 DRIVER" <linux-omap@vger.kernel.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
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
 Thara Gopinath <thara.gopinath@gmail.com>, "open list:TEGRA ARCHITECTURE
 SUPPORT" <linux-tegra@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Talel Shenhar <talel@amazon.com>,
 linux-pm@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Eduardo Valentin <edubezval@gmail.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>, Markus Mayer <mmayer@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, "open
 list:THERMAL DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>,
 Mikko Perttunen <mperttunen@nvidia.com>, Zhang Rui <rui.zhang@intel.com>,
 Johan Hovold <johan+linaro@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "moderated list:BROADCOM
 BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
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
Subject: Re: [Linux-stm32] [PATCH v4 02/19] thermal/core: Use the thermal
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Ck9uIDIvMjgvMjAyMyA0OjUyIFBNLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPiBUaGUgdGhlcm1h
bCB6b25lIGRldmljZSBzdHJ1Y3R1cmUgaXMgZXhwb3NlZCB0byB0aGUgZGlmZmVyZW50IGRyaXZl
cnMKPiBhbmQgb2J2aW91c2x5IHRoZXkgYWNjZXNzIHRoZSBpbnRlcm5hbHMgd2hpbGUgdGhhdCBz
aG91bGQgYmUKPiByZXN0cmljdGVkIHRvIHRoZSBjb3JlIHRoZXJtYWwgY29kZS4KPgo+IEluIG9y
ZGVyIHRvIHNlbGYtZW5jYXBzdWxhdGUgdGhlIHRoZXJtYWwgY29yZSBjb2RlLCB3ZSBuZWVkIHRv
IHByZXZlbnQKPiB0aGUgZHJpdmVycyBhY2Nlc3NpbmcgZGlyZWN0bHkgdGhlIHRoZXJtYWwgem9u
ZSBzdHJ1Y3R1cmUgYW5kIHByb3ZpZGUKPiBhY2Nlc3NvciBmdW5jdGlvbnMgdG8gZGVhbCB3aXRo
Lgo+Cj4gVXNlIHRoZSBkZXZkYXRhIGFjY2Vzc29yIGludHJvZHVjZWQgaW4gdGhlIHByZXZpb3Vz
IHBhdGNoLgo+Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVuZGVkLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIExlemNhbm8gPGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc+Cj4gUmV2aWV3
ZWQtYnk6IE5pa2xhcyBTw7ZkZXJsdW5kIDxuaWtsYXMuc29kZXJsdW5kK3JlbmVzYXNAcmFnbmF0
ZWNoLnNlPiAjUi1DYXIKPiBBY2tlZC1ieTogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3Jn
Pgo+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNj
aGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPiAjTWVkaWFUZWsgYXV4YWRjIGFuZCBsdnRzCj4g
UmV2aWV3ZWQtYnk6IEJhbHNhbSBDSElISSA8YmNoaWhpQGJheWxpYnJlLmNvbT4gI01lZGlhdGVr
IGx2dHMKPiBSZXZpZXdlZC1ieTogQWRhbSBXYXJkIDxETEctQWRhbS5XYXJkLm9wZW5zb3VyY2VA
ZG0ucmVuZXNhcy5jb20+ICNkYTkwNjIKPiBSZXZpZXdlZC1ieTogQmFvbGluIFdhbmcgPGJhb2xp
bi53YW5nQGxpbnV4LmFsaWJhYmEuY29tPiAgI3NwcmVhZAo+IEFja2VkLWJ5OiBKZXJuZWogU2ty
YWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPiAjc3VuOGlfdGhlcm1hbAo+IEFja2VkLWJ5
OiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsLmoud3lzb2NraUBpbnRlbC5jb20+Cj4gQWNrZWQt
Ynk6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPiAjQnJvYWRjb20KPiAt
LS0KPiAgZHJpdmVycy90aGVybWFsL2FtbG9naWNfdGhlcm1hbC5jICAgICAgICAgICAgICAgICAg
IHwgIDIgKy0KPiAgZHJpdmVycy90aGVybWFsL2FybWFkYV90aGVybWFsLmMgICAgICAgICAgICAg
ICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL3RoZXJtYWwvYnJvYWRjb20vYmNtMjcxMV90aGVy
bWFsLmMgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3RoZXJtYWwvYnJvYWRjb20vYmNtMjgz
NV90aGVybWFsLmMgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3RoZXJtYWwvYnJvYWRjb20v
YnJjbXN0Yl90aGVybWFsLmMgICAgICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvdGhlcm1hbC9i
cm9hZGNvbS9ucy10aGVybWFsLmMgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvdGhl
cm1hbC9icm9hZGNvbS9zci10aGVybWFsLmMgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZl
cnMvdGhlcm1hbC9kYTkwNjItdGhlcm1hbC5jICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4g
IGRyaXZlcnMvdGhlcm1hbC9kYjg1MDBfdGhlcm1hbC5jICAgICAgICAgICAgICAgICAgICB8ICAy
ICstCj4gIGRyaXZlcnMvdGhlcm1hbC9kb3ZlX3RoZXJtYWwuYyAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICstCj4gIGRyaXZlcnMvdGhlcm1hbC9oaXNpX3RoZXJtYWwuYyAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvdGhlcm1hbC9pbXg4bW1fdGhlcm1hbC5jICAgICAg
ICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvdGhlcm1hbC9pbXhfc2NfdGhlcm1hbC5j
ICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvdGhlcm1hbC9pbXhfdGhlcm1h
bC5jICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKy0tLQo+ICAuLi4vdGhlcm1hbC9pbnRl
bC9pbnQzNDB4X3RoZXJtYWwvaW50MzQwMF90aGVybWFsLmMgfCAgMiArLQo+ICAuLi4vaW50ZWwv
aW50MzQweF90aGVybWFsL2ludDM0MHhfdGhlcm1hbF96b25lLmMgICAgfCAgNCArKy0tCj4gIC4u
Li9pbnQzNDB4X3RoZXJtYWwvcHJvY2Vzc29yX3RoZXJtYWxfZGV2aWNlX3BjaS5jICB8ICA0ICsr
LS0KPiAgZHJpdmVycy90aGVybWFsL2ludGVsL2ludGVsX3BjaF90aGVybWFsLmMgICAgICAgICAg
IHwgIDIgKy0KPiAgZHJpdmVycy90aGVybWFsL2ludGVsL2ludGVsX3F1YXJrX2R0c190aGVybWFs
LmMgICAgIHwgIDYgKysrLS0tCj4gIGRyaXZlcnMvdGhlcm1hbC9pbnRlbC9pbnRlbF9zb2NfZHRz
X2lvc2YuYyAgICAgICAgICB8IDEzICsrKysrLS0tLS0tLS0KPiAgZHJpdmVycy90aGVybWFsL2lu
dGVsL3g4Nl9wa2dfdGVtcF90aGVybWFsLmMgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL3Ro
ZXJtYWwvazNfYmFuZGdhcC5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2
ZXJzL3RoZXJtYWwvazNfajcyeHhfYmFuZGdhcC5jICAgICAgICAgICAgICAgICAgfCAgMiArLQo+
IFsuLi5dCj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvazNfYmFuZGdhcC5jIGIv
ZHJpdmVycy90aGVybWFsL2szX2JhbmRnYXAuYwo+IGluZGV4IDIyYzliY2I4OTljMy4uYjVjZDJj
ODVlMGMzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdGhlcm1hbC9rM19iYW5kZ2FwLmMKPiArKysg
Yi9kcml2ZXJzL3RoZXJtYWwvazNfYmFuZGdhcC5jCj4gQEAgLTE0MSw3ICsxNDEsNyBAQCBzdGF0
aWMgaW50IGszX2JncF9yZWFkX3RlbXAoc3RydWN0IGszX3RoZXJtYWxfZGF0YSAqZGV2ZGF0YSwK
PiAgCj4gIHN0YXRpYyBpbnQgazNfdGhlcm1hbF9nZXRfdGVtcChzdHJ1Y3QgdGhlcm1hbF96b25l
X2RldmljZSAqdHosIGludCAqdGVtcCkKPiAgewo+IC0Jc3RydWN0IGszX3RoZXJtYWxfZGF0YSAq
ZGF0YSA9IHR6LT5kZXZkYXRhOwo+ICsJc3RydWN0IGszX3RoZXJtYWxfZGF0YSAqZGF0YSA9IHRo
ZXJtYWxfem9uZV9kZXZpY2VfcHJpdih0eik7CgpSZXZpZXdlZC1ieTogRGhydXZhIEdvbGUgPGQt
Z29sZUB0aS5jb20+CgoKPiAgCWludCByZXQgPSAwOwo+ICAKPiAgCXJldCA9IGszX2JncF9yZWFk
X3RlbXAoZGF0YSwgdGVtcCk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGhlcm1hbC9rM19qNzJ4
eF9iYW5kZ2FwLmMgYi9kcml2ZXJzL3RoZXJtYWwvazNfajcyeHhfYmFuZGdhcC5jCj4gaW5kZXgg
MDMxZWExMDkxOTA5Li41YmUxZjA5ZWViMmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy90aGVybWFs
L2szX2o3Mnh4X2JhbmRnYXAuYwo+ICsrKyBiL2RyaXZlcnMvdGhlcm1hbC9rM19qNzJ4eF9iYW5k
Z2FwLmMKPiBAQCAtMjQ4LDcgKzI0OCw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGszX2JncF9yZWFk
X3RlbXAoc3RydWN0IGszX3RoZXJtYWxfZGF0YSAqZGV2ZGF0YSwKPiAgLyogR2V0IHRlbXBlcmF0
dXJlIGNhbGxiYWNrIGZ1bmN0aW9uIGZvciB0aGVybWFsIHpvbmUgKi8KPiAgc3RhdGljIGludCBr
M190aGVybWFsX2dldF90ZW1wKHN0cnVjdCB0aGVybWFsX3pvbmVfZGV2aWNlICp0eiwgaW50ICp0
ZW1wKQo+ICB7Cj4gLQlyZXR1cm4gazNfYmdwX3JlYWRfdGVtcCh0ei0+ZGV2ZGF0YSwgdGVtcCk7
Cj4gKwlyZXR1cm4gazNfYmdwX3JlYWRfdGVtcCh0aGVybWFsX3pvbmVfZGV2aWNlX3ByaXYodHop
LCB0ZW1wKTsKPiAgfQo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCB0aGVybWFsX3pvbmVfZGV2
aWNlX29wcyBrM19vZl90aGVybWFsX29wcyA9IHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90aGVy
bWFsL2tpcmt3b29kX3RoZXJtYWwuYyBiL2RyaXZlcnMvdGhlcm1hbC9raXJrd29vZF90aGVybWFs
LmMKPiBpbmRleCBiZWM3ZWMyMGU3OWQuLjkyYjNjZTQyNmI5ZCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3RoZXJtYWwva2lya3dvb2RfdGhlcm1hbC5jCj4gKysrIGIvZHJpdmVycy90aGVybWFsL2tp
cmt3b29kX3RoZXJtYWwuYwo+IEBAIC0yNyw3ICsyNyw3IEBAIHN0YXRpYyBpbnQga2lya3dvb2Rf
Z2V0X3RlbXAoc3RydWN0IHRoZXJtYWxfem9uZV9kZXZpY2UgKnRoZXJtYWwsCj4gIAkJCSAgaW50
ICp0ZW1wKQo+ICB7Cj4gIAl1bnNpZ25lZCBsb25nIHJlZzsKPiAtCXN0cnVjdCBraXJrd29vZF90
aGVybWFsX3ByaXYgKnByaXYgPSB0aGVybWFsLT5kZXZkYXRhOwo+ICsJc3RydWN0IGtpcmt3b29k
X3RoZXJtYWxfcHJpdiAqcHJpdiA9IHRoZXJtYWxfem9uZV9kZXZpY2VfcHJpdih0aGVybWFsKTsK
PiAgCj4gIAlyZWcgPSByZWFkbF9yZWxheGVkKHByaXYtPnNlbnNvcik7Cj4gIAo+IFsuLi5dCgot
LSAKUmVnYXJkcywKRGhydXZhIEdvbGUgPGQtZ29sZUB0aS5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
