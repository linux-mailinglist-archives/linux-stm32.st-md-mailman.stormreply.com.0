Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C56A96C4
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Mar 2023 12:55:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0739C6A60A;
	Fri,  3 Mar 2023 11:55:44 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D66D1C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Mar 2023 11:55:43 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-536be69eadfso39012607b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 Mar 2023 03:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9bnT5dHrb3iP7rA2GmhVzWGZn0Tzpt5CCED7hunNFB0=;
 b=DRqakUUKFXRGm69WVxx9NWOsatykkvfkKUlzMq2OnyDSxa+HuTapR3hpbLFjBMU1Ch
 oO+smsduZUXVdTLTmfAPXLG2PV+/pD5wkOJUFXRjP45c2nKCPPFURmJHPArjevLQnbC7
 M2wu8VkpS73v/BuFvHXgJn7hEmaRYyzBsn00BfR/OWNvHOan3OsiAfd48cUjUsxcYDjD
 pQwV+rgMw6+vW4Vbmg5eD3vUBOWTIqXIitDhHzhusgo/C6u4I2yVSfpD/6kzCaw7wfwy
 qxYDi91GmTBUwD/olzh+a1uc2W+b+dBH77AYn4ERUY8Wi+MF2WaMmWLuGS8qMBw2JGDm
 zbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9bnT5dHrb3iP7rA2GmhVzWGZn0Tzpt5CCED7hunNFB0=;
 b=zcMvQifp8pCAZ/tbJcODhFaO5Rwc5bxPABtN1WKAAGtRlcpeSGXbS1jlQSJLEKcDk3
 R4ybisOsu1A0pf2B2X4mOVKioknQBXZNV7SftH8I/I4V/qewolFHYOBYPWBqWrdL24Vm
 +7BpSn+HbjqigUas5xXJjjpGJI/cuYnIXkzX/lFld6+j/J5q41REkqIoiBMX67VZNnvu
 pgELMMLBg1GPD8qQPJWVDy3UthrGnIgGlald6oG0+1ROf6GbZkXogGcvJiDF14tybhRl
 cb+SLScn5/eSHXgAjsjC4rqhzma0dFlhD4h1Ru3DhhQMS9phXYLsMQzCx8vkotwp5Wej
 08ZA==
X-Gm-Message-State: AO0yUKVUtcYm3mChpgYEfIOvHuGLjsh+u0w75sLFmq3v6vGNFsigPwGk
 75v7rzzQ/Mc9jTOElcztAgyAEm18dd0g9KCI79fBrg==
X-Google-Smtp-Source: AK7set9+g7CaZKhwb6dcWYW6BTUUJXUyZuISsu0waCwptFPvO2UJ6I2OocVeB/84RPaT8roh5mWcunV6iyn3UJDp/FU=
X-Received: by 2002:a81:a783:0:b0:533:9b80:a30e with SMTP id
 e125-20020a81a783000000b005339b80a30emr736607ywh.10.1677844542703; Fri, 03
 Mar 2023 03:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20230301201446.3713334-1-daniel.lezcano@linaro.org>
 <20230301201446.3713334-3-daniel.lezcano@linaro.org>
In-Reply-To: <20230301201446.3713334-3-daniel.lezcano@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 Mar 2023 12:55:31 +0100
Message-ID: <CACRpkdYG59p5o0Te6LWmo3KBf7=v8ARRpb4kKgtm8Khv8Yfw1Q@mail.gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, rafael@kernel.org,
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
 Stefan Wahren <stefan.wahren@i2se.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Ido Schimmel <idosch@nvidia.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Jiang Jian <jiangjian@cdjrlc.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Dhruva Gole <d-gole@ti.com>,
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
 Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Mark Brown <broonie@kernel.org>,
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
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, Keerthy <j-keerthy@ti.com>,
 Bjorn Andersson <andersson@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 Shang XiaoJing <shangxiaojing@huawei.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yang Li <yang.lee@linux.alibaba.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gV2VkLCBNYXIgMSwgMjAyMyBhdCA5OjE1IFBNIERhbmllbCBMZXpjYW5vIDxkYW5pZWwubGV6
Y2Fub0BsaW5hcm8ub3JnPiB3cm90ZToKCj4gVGhlIHRoZXJtYWwgem9uZSBkZXZpY2Ugc3RydWN0
dXJlIGlzIGV4cG9zZWQgdG8gdGhlIGRpZmZlcmVudCBkcml2ZXJzCj4gYW5kIG9idmlvdXNseSB0
aGV5IGFjY2VzcyB0aGUgaW50ZXJuYWxzIHdoaWxlIHRoYXQgc2hvdWxkIGJlCj4gcmVzdHJpY3Rl
ZCB0byB0aGUgY29yZSB0aGVybWFsIGNvZGUuCj4KPiBJbiBvcmRlciB0byBzZWxmLWVuY2Fwc3Vs
YXRlIHRoZSB0aGVybWFsIGNvcmUgY29kZSwgd2UgbmVlZCB0byBwcmV2ZW50Cj4gdGhlIGRyaXZl
cnMgYWNjZXNzaW5nIGRpcmVjdGx5IHRoZSB0aGVybWFsIHpvbmUgc3RydWN0dXJlIGFuZCBwcm92
aWRlCj4gYWNjZXNzb3IgZnVuY3Rpb25zIHRvIGRlYWwgd2l0aC4KPgo+IFVzZSB0aGUgZGV2ZGF0
YSBhY2Nlc3NvciBpbnRyb2R1Y2VkIGluIHRoZSBwcmV2aW91cyBwYXRjaC4KPgo+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlcyBpbnRlbmRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBMZXpjYW5v
IDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnPgo+IFJldmlld2VkLWJ5OiBOaWtsYXMgU8O2ZGVy
bHVuZCA8bmlrbGFzLnNvZGVybHVuZCtyZW5lc2FzQHJhZ25hdGVjaC5zZT4gI1ItQ2FyCj4gQWNr
ZWQtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1ieTogQW5n
ZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFi
b3JhLmNvbT4gI01lZGlhVGVrIGF1eGFkYyBhbmQgbHZ0cwo+IFJldmlld2VkLWJ5OiBCYWxzYW0g
Q0hJSEkgPGJjaGloaUBiYXlsaWJyZS5jb20+ICNNZWRpYXRlayBsdnRzCj4gUmV2aWV3ZWQtYnk6
IEFkYW0gV2FyZCA8RExHLUFkYW0uV2FyZC5vcGVuc291cmNlQGRtLnJlbmVzYXMuY29tPiAjZGE5
MDYyCj4gUmV2aWV3ZWQtYnk6IEJhb2xpbiBXYW5nIDxiYW9saW4ud2FuZ0BsaW51eC5hbGliYWJh
LmNvbT4gICNzcHJlYWQKPiBBY2tlZC1ieTogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVj
QGdtYWlsLmNvbT4gI3N1bjhpX3RoZXJtYWwKPiBBY2tlZC1ieTogUmFmYWVsIEouIFd5c29ja2kg
PHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPgo+IEFja2VkLWJ5OiBGbG9yaWFuIEZhaW5lbGxp
IDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4gI0Jyb2FkY29tCj4gUmV2aWV3ZWQtYnk6IERocnV2YSBH
b2xlIDxkLWdvbGVAdGkuY29tPiAjIEszIGJhbmRnYXAKCkFja2VkLWJ5OiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
