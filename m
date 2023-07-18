Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D0475752A
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jul 2023 09:20:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0504C6A611;
	Tue, 18 Jul 2023 07:20:10 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7367C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 07:20:09 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-4fb761efa7aso8515032e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689664809; x=1692256809;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y1QDj1E+S2bjPPGCPFdmDsT3gCqQuKHXgAf2a6PrB3E=;
 b=XLpqkx/8N+f9aL66iAO4XAc89p9osxV7uu0ZqsyeRuMT4WOEnOlfUxj8GbFX4gEcY7
 cmQ5fYgkyqNDpwovIzaJAE3TYH7aSiAY5VG0meewNNzbaAUu5EaM8jadqiG9ZIxt8WkH
 Dz5Wa+qEBe6jQD09zPibdBeoGRnE/sTNzbn42rGQJ9PVOh1x5LzTEO4yedoXofgo5eFQ
 KuGIkdKxeINxScrJFBi22nrBsED9IknOsqSFxrCgMqZxiUdu7WgZs1LJuL63IoOJJuPq
 aH9XK5MpDV2L2h3Zd29U/vHUUcmr0Nb7ZNRI8TEZ+HH+Eak4QSPvsUrRq9Bx6pIjVCtR
 di/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689664809; x=1692256809;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y1QDj1E+S2bjPPGCPFdmDsT3gCqQuKHXgAf2a6PrB3E=;
 b=ZqstHplSw2moOPnU5b9pzTRQmxOfY1GFEvEnGW3lEf0CO4r0SIpLMdZ+oTy8zW7HzT
 NN6yrf4qZ6FQ4axu0iWE0UYnopVo6zHS9JU6MhChvMQVU7rru8Eo/4dGjhEqb+2xJBNK
 UdTsH0NbNe9HNNo+F2dIccdd9lx9bOecuhnl6b4IGWOZjXmTt9aqxTuaEScEE4n/B5LW
 PXxcJ7j8ZjjBVXVEUVVj9wwSCuWovjWRxD4Zqa/uVSEe43ZRLCiiWg4Bf3FYJY/AaxsN
 gFmJIs41vjndnqDu89bi5fNMYUqp97/0T1i1YaWfN8kvy1SpeQTXhwHNbYymeA1kzPfC
 wqtA==
X-Gm-Message-State: ABy/qLZhmQoMNPpoLY2UQZ9An1jafD61282x7CXjh3PEcdh1z9sAy3hd
 BDQ9VRr0eotN9QSzZBw3tPw=
X-Google-Smtp-Source: APBJJlH+TWJF5L0ovMggt0/CS2enPlkz+KJw4saqvvcdbjYHJU4i8zA1AJzt6j7rP+36JcEKeZhfYg==
X-Received: by 2002:a05:6512:3a88:b0:4fb:925f:8be1 with SMTP id
 q8-20020a0565123a8800b004fb925f8be1mr11403669lfu.45.1689664808795; 
 Tue, 18 Jul 2023 00:20:08 -0700 (PDT)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl.
 [31.11.218.106]) by smtp.googlemail.com with ESMTPSA id
 22-20020ac24856000000b004fbb3e91a3fsm299048lfy.114.2023.07.18.00.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 00:20:08 -0700 (PDT)
Message-ID: <b5124f4a-6a7a-3fd9-32d6-e0690a45c7e8@gmail.com>
Date: Tue, 18 Jul 2023 09:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20230403225540.1931-1-zajec5@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20230403225540.1931-1-zajec5@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Evgeniy Polyakov <zbr@ioremap.net>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Heiko Stuebner <heiko@sntech.de>,
 linux-rtc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Richard Weinberger <richard@nod.at>, Michal Simek <michal.simek@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Vincent Shih <vincent.sunplus@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sven Peter <sven@svenpeter.dev>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Walle <michael@walle.cc>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH V4] nvmem: add explicit config option to
 read old syntax fixed OF cells
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

SGksCgpPbiA0LjA0LjIwMjMgMDA6NTUsIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPiBCaW5kaW5n
IGZvciBmaXhlZCBOVk1FTSBjZWxscyBkZWZpbmVkIGRpcmVjdGx5IGFzIE5WTUVNIGRldmljZSBz
dWJub2Rlcwo+IGhhcyBiZWVuIGRlcHJlY2F0ZWQuIEl0IGhhcyBiZWVuIHJlcGxhY2VkIGJ5IHRo
ZSAiZml4ZWQtbGF5b3V0IiBOVk1FTQo+IGxheW91dCBiaW5kaW5nLgo+IAo+IE5ldyBzeW50YXgg
aXMgbWVhbnQgdG8gYmUgY2xlYXJlciBhbmQgc2hvdWxkIGhlbHAgYXZvaWRpbmcgaW1wcmVjaXNl
Cj4gYmluZGluZ3MuCj4gCj4gTlZNRU0gc3Vic3lzdGVtIGFscmVhZHkgc3VwcG9ydHMgdGhlIG5l
dyBiaW5kaW5nLiBJdCBzaG91bGQgYmUgYSBnb29kCj4gaWRlYSB0byBsaW1pdCBzdXBwb3J0IGZv
ciBvbGQgc3ludGF4IHRvIGV4aXN0aW5nIGRyaXZlcnMgdGhhdCBhY3R1YWxseQo+IHN1cHBvcnQg
JiB1c2UgaXQgKHdlIGNhbid0IGJyZWFrIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkhKS4gVGhhdCB3
YXkgd2UKPiBhZGRpdGlvbmFsbHkgZW5jb3VyYWdlIG5ldyBiaW5kaW5ncyAmIGRyaXZlcnMgdG8g
aWdub3JlIGRlcHJlY2F0ZWQKPiBiaW5kaW5nLgo+IAo+IEl0IHdhc24ndCBjbGVhciAodG8gbWUp
IGlmIHJ0YyBhbmQgdzEgY29kZSBhY3R1YWxseSB1c2VzIG9sZCBzeW50YXgKPiBmaXhlZCBjZWxs
cy4gSSBlbmFibGVkIHRoZW0gdG8gZG9uJ3QgcmlzayBhbnkgYnJlYWthZ2UuCgppcyB0aGVyZSBh
bnkgY2hhbmNlIEkgY2FuIGhhdmUgdGhpcyBhY2NlcHRlZCAvIHB1c2hlZCwgcGxlYXNlPwoKSXQn
cyBhIHRpbnkgb3B0aW1pemF0aW9uIGFuZCBpdCBtYWtlcyBzdXJlIHBlb3BsZSBkb24ndCB1c2Ug
ZGVwcmVjYXRlZApzeW50YXggd2l0aCBuZXcgZHJpdmVycy4KCkkgYWxzbyBub3RpY2VkIHRoaXMg
d2lsbCBwcm9iYWJseSBsZXQgbWUgZHJvcCBhbiB1bmNsZWFyIGFuZApub24taW50dWl0aXZlIG5v
X29mX25vZGUgY29uZmlnIG9wdGlvbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
