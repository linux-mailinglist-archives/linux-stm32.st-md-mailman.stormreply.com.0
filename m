Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DE583DCD2
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 15:56:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B343C6DD70;
	Fri, 26 Jan 2024 14:56:42 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBAB8C6DD6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 14:56:40 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-7bfccdbebd2so12743739f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 06:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ieee.org; s=google; t=1706280999; x=1706885799;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wWtORc4HyTExlEpsqVhVjCB+kJhCKFinGlYPLAuyejg=;
 b=Iv1aLF2ktjfwh8M5F87D+t7GvJJ2I3UBujRzM4Aq8RHKpyRdPyOPBuajMl0GPdSSXH
 8FKPY9c29RCSC5Em89IQa8qulc3Y2SGLjPZtAzsuAm/vxwDVDFTxrHn3q00625/bOquA
 24wVtSbbjynEebKLj0bvTN4TD5Y5dinF33/zM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706280999; x=1706885799;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wWtORc4HyTExlEpsqVhVjCB+kJhCKFinGlYPLAuyejg=;
 b=wIC0zFsES11zZvpqfofYKPlKKEGUD5SWwOH7DTycfueuFAoxIdTMqSnkh6cvtPbWaK
 Es7c0LVomrKvmCX0UEZ8E2MfWJmgsVdl/lWjF0RAO1gMWYsaPKom+YLOkxGLBiUe8pw2
 7mMiHKllZOgnfvuhqzX9zHBB6fWwCg9lyC41hN4fT6ZNOFEBKPfaZ7NaNZRp98NaETyd
 kFgY2PDohQvQu2H8Ajf5bXr+oW7TZZqCZdo0Mno+Dl7a3PiLfhyxu7ZZXpcJ4Xhyc0fS
 u2WW80WUHFhiFC/ly7iUmIlDxiNyVw/P+RzCVg0mWgYKGAZHK3MSoyQBaGE9Qvzh6sxc
 hsSQ==
X-Gm-Message-State: AOJu0Yy5uHetTAtujuodqdezei00gAO1ecd3tuiOOj/Zeyi7LuFS2J3h
 VkJphpMnIHm0RxybAIQDZ4JZ4ziwgkREvLBaHLt1jlj/9U3HMEabBWFdki/jyg==
X-Google-Smtp-Source: AGHT+IE7L+Lf4nGmf8jBYvWvUbBMIPYEUcZmRKhPCMfOv7qLIoTicpYxj6Q75lc9mf95xYawNxxN/g==
X-Received: by 2002:a6b:4f13:0:b0:7bf:d2f2:3732 with SMTP id
 d19-20020a6b4f13000000b007bfd2f23732mr41889iob.19.1706280997488; 
 Fri, 26 Jan 2024 06:56:37 -0800 (PST)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net.
 [98.61.227.136]) by smtp.googlemail.com with ESMTPSA id
 m8-20020a056638224800b00470a4791160sm46771jas.109.2024.01.26.06.56.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 06:56:37 -0800 (PST)
Message-ID: <db05fb6a-2ea5-4e00-ac03-adc1897d96de@ieee.org>
Date: Fri, 26 Jan 2024 08:56:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>, James Clark <james.clark@arm.com>,
 linux-pwm@vger.kernel.org, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Alexander Shiyan <shc_work@mail.ru>, Benson Leung <bleung@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Michael Walle <mwalle@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Sean Anderson <sean.anderson@seco.com>, Michal Simek <michal.simek@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Anjelique Melendez <quic_amelende@quicinc.com>,
 Andi Shyti <andi.shyti@kernel.org>, Lu Hongfei <luhongfei@vivo.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Luca Weiss <luca@z3ntu.xyz>,
 Johan Hovold <johan@kernel.org>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <f59b1a4a8d6fba65e4d3e8698310c9cb1d4c43ce.1706182805.git.u.kleine-koenig@pengutronix.de>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <f59b1a4a8d6fba65e4d3e8698310c9cb1d4c43ce.1706182805.git.u.kleine-koenig@pengutronix.de>
Cc: Douglas Anderson <dianders@chromium.org>, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-leds@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-mips@vger.kernel.org,
 asahi@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v5 040/111] pwm: Provide
	devm_pwmchip_alloc() function
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

T24gMS8yNS8yNCA2OjA5IEFNLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBUaGlzIGZ1bmN0
aW9uIGFsbG9jYXRlcyBhIHN0cnVjdCBwd21fY2hpcCBhbmQgZHJpdmVyIGRhdGEuIENvbXBhcmVk
IHRvCj4gdGhlIHN0YXR1cyBxdW8gdGhlIHNwbGl0IGludG8gcHdtX2NoaXAgYW5kIGRyaXZlciBk
YXRhIGlzIG5ldywgb3RoZXJ3aXNlCj4gaXQgZG9lc24ndCBjaGFuZ2UgYW55dGhpbmcgcmVsZXZh
bnQgKHlldCkuCj4gCj4gVGhlIGludGVudGlvbiBpcyB0aGF0IGFmdGVyIGFsbCBkcml2ZXJzIGFy
ZSBzd2l0Y2hlZCB0byB1c2UgdGhpcwo+IGFsbG9jYXRpb24gZnVuY3Rpb24sIGl0cyBwb3NzaWJs
ZSB0byBhZGQgYSBzdHJ1Y3QgZGV2aWNlIHRvIHN0cnVjdAo+IHB3bV9jaGlwIHRvIHByb3Blcmx5
IHRyYWNrIHRoZSBsYXR0ZXIncyBsaWZldGltZSB3aXRob3V0IHRvdWNoaW5nIGFsbAo+IGRyaXZl
cnMgYWdhaW4uIFByb3BlciBsaWZldGltZSB0cmFja2luZyBpcyBhIG5lY2Vzc2FyeSBwcmVjb25k
aXRpb24gdG8KPiBpbnRyb2R1Y2UgY2hhcmFjdGVyIGRldmljZSBzdXBwb3J0IGZvciBQV01zICh0
aGF0IGltcGxlbWVudHMgYXRvbWljCj4gc2V0dGluZyBhbmQgZG9lc24ndCBzdWZmZXIgZnJvbSB0
aGUgc3lzZnMgb3ZlcmhlYWQgb2YgdGhlIC9zeXMvY2xhc3MvcHdtCj4gdXNlcnNwYWNlIHN1cHBv
cnQpLgo+IAo+IFRoZSBuZXcgZnVuY3Rpb24gcHdtY2hpcF9wcml2KCkgKG9idmlvdXNseT8pIG9u
bHkgd29ya3MgZm9yIGNoaXBzCj4gYWxsb2NhdGVkIHdpdGggZGV2bV9wd21jaGlwX2FsbG9jKCku
CgpJIHRoaW5rIHRoaXMgbG9va3MgZ29vZC4gIFR3byBxdWVzdGlvbnM6Ci0gU2hvdWxkIHlvdSBl
eHBsaWNpdGx5IGFsaWduIHRoZSBwcml2YXRlIGRhdGE/ICBPciBkbyB5b3UgYmVsaWV2ZQogICB0
aGUgZGVmYXVsdCBhbGlnbm1lbnQgKGN1cnJlbnRseSBwb2ludGVyIHNpemUgYWxpZ25lZCkgaXMg
YWRlcXVhdGU/Ci0gSXMgdGhlcmUgYSBub24tZGV2cmVzIHZlcnNpb24gb2YgdGhlIGFsbG9jYXRp
b24gZnVuY3Rpb24/CgoJCQkJCS1BbGV4Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUt
S8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4gICAuLi4vZHJp
dmVyLWFwaS9kcml2ZXItbW9kZWwvZGV2cmVzLnJzdCAgICAgICAgfCAgMSArCj4gICBEb2N1bWVu
dGF0aW9uL2RyaXZlci1hcGkvcHdtLnJzdCAgICAgICAgICAgICAgfCAxMCArKysrLS0tLQo+ICAg
ZHJpdmVycy9wd20vY29yZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjUgKysrKysr
KysrKysrKysrKysrKwo+ICAgaW5jbHVkZS9saW51eC9wd20uaCAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKysKPiAgIDQgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2Ry
aXZlci1tb2RlbC9kZXZyZXMucnN0IGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2RyaXZlci1t
b2RlbC9kZXZyZXMucnN0Cj4gaW5kZXggYzVmOTlkODM0ZWM1Li5lNGRmNzJjNDA4ZDIgMTAwNjQ0
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2RyaXZlci1tb2RlbC9kZXZyZXMucnN0
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2RyaXZlci1tb2RlbC9kZXZyZXMucnN0
Cj4gQEAgLTQyMCw2ICs0MjAsNyBAQCBQT1dFUgo+ICAgICBkZXZtX3JlYm9vdF9tb2RlX3VucmVn
aXN0ZXIoKQo+ICAgCj4gICBQV00KPiArICBkZXZtX3B3bWNoaXBfYWxsb2MoKQo+ICAgICBkZXZt
X3B3bWNoaXBfYWRkKCkKPiAgICAgZGV2bV9wd21fZ2V0KCkKPiAgICAgZGV2bV9md25vZGVfcHdt
X2dldCgpCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9wd20ucnN0IGIv
RG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3B3bS5yc3QKPiBpbmRleCAzYzI4Y2NjNGI2MTEuLmNl
ZTY2YzdmMDMzNSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvcHdtLnJz
dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9wd20ucnN0Cj4gQEAgLTE0MywxMSAr
MTQzLDExIEBAIHRvIGltcGxlbWVudCB0aGUgcHdtXyooKSBmdW5jdGlvbnMgaXRzZWxmLiBUaGlz
IG1lYW5zIHRoYXQgaXQncyBpbXBvc3NpYmxlCj4gICB0byBoYXZlIG11bHRpcGxlIFBXTSBkcml2
ZXJzIGluIHRoZSBzeXN0ZW0uIEZvciB0aGlzIHJlYXNvbiBpdCdzIG1hbmRhdG9yeQo+ICAgZm9y
IG5ldyBkcml2ZXJzIHRvIHVzZSB0aGUgZ2VuZXJpYyBQV00gZnJhbWV3b3JrLgo+ICAgCj4gLUEg
bmV3IFBXTSBjb250cm9sbGVyL2NoaXAgY2FuIGJlIGFkZGVkIHVzaW5nIHB3bWNoaXBfYWRkKCkg
YW5kIHJlbW92ZWQKPiAtYWdhaW4gd2l0aCBwd21jaGlwX3JlbW92ZSgpLiBwd21jaGlwX2FkZCgp
IHRha2VzIGEgZmlsbGVkIGluIHN0cnVjdAo+IC1wd21fY2hpcCBhcyBhcmd1bWVudCB3aGljaCBw
cm92aWRlcyBhIGRlc2NyaXB0aW9uIG9mIHRoZSBQV00gY2hpcCwgdGhlCj4gLW51bWJlciBvZiBQ
V00gZGV2aWNlcyBwcm92aWRlZCBieSB0aGUgY2hpcCBhbmQgdGhlIGNoaXAtc3BlY2lmaWMKPiAt
aW1wbGVtZW50YXRpb24gb2YgdGhlIHN1cHBvcnRlZCBQV00gb3BlcmF0aW9ucyB0byB0aGUgZnJh
bWV3b3JrLgo+ICtBIG5ldyBQV00gY29udHJvbGxlci9jaGlwIGNhbiBiZSBhbGxvY2F0ZWQgdXNp
bmcgZGV2bV9wd21jaGlwX2FsbG9jLCB0aGVuIGFkZGVkCj4gK3VzaW5nIHB3bWNoaXBfYWRkKCkg
YW5kIHJlbW92ZWQgYWdhaW4gd2l0aCBwd21jaGlwX3JlbW92ZSgpLiBwd21jaGlwX2FkZCgpCj4g
K3Rha2VzIGEgZmlsbGVkIGluIHN0cnVjdCBwd21fY2hpcCBhcyBhcmd1bWVudCB3aGljaCBwcm92
aWRlcyBhIGRlc2NyaXB0aW9uIG9mCj4gK3RoZSBQV00gY2hpcCwgdGhlIG51bWJlciBvZiBQV00g
ZGV2aWNlcyBwcm92aWRlZCBieSB0aGUgY2hpcCBhbmQgdGhlCj4gK2NoaXAtc3BlY2lmaWMgaW1w
bGVtZW50YXRpb24gb2YgdGhlIHN1cHBvcnRlZCBQV00gb3BlcmF0aW9ucyB0byB0aGUgZnJhbWV3
b3JrLgo+ICAgCj4gICBXaGVuIGltcGxlbWVudGluZyBwb2xhcml0eSBzdXBwb3J0IGluIGEgUFdN
IGRyaXZlciwgbWFrZSBzdXJlIHRvIHJlc3BlY3QgdGhlCj4gICBzaWduYWwgY29udmVudGlvbnMg
aW4gdGhlIFBXTSBmcmFtZXdvcmsuIEJ5IGRlZmluaXRpb24sIG5vcm1hbCBwb2xhcml0eQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9jb3JlLmMgYi9kcml2ZXJzL3B3bS9jb3JlLmMKPiBpbmRl
eCAxYjRjM2QwY2FhODIuLmI4MjFhMmIwYjE3MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3B3bS9j
b3JlLmMKPiArKysgYi9kcml2ZXJzL3B3bS9jb3JlLmMKPiBAQCAtNDU0LDYgKzQ1NCwzMSBAQCBv
Zl9wd21fc2luZ2xlX3hsYXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgY29uc3Qgc3RydWN0IG9m
X3BoYW5kbGVfYXJncyAqYXJncykKPiAgIH0KPiAgIEVYUE9SVF9TWU1CT0xfR1BMKG9mX3B3bV9z
aW5nbGVfeGxhdGUpOwo+ICAgCj4gK3N0YXRpYyB2b2lkICpwd21jaGlwX3ByaXYoc3RydWN0IHB3
bV9jaGlwICpjaGlwKQo+ICt7Cj4gKwlyZXR1cm4gKHZvaWQgKiljaGlwICsgc2l6ZW9mKCpjaGlw
KTsKPiArfQo+ICsKPiArc3RydWN0IHB3bV9jaGlwICpkZXZtX3B3bWNoaXBfYWxsb2Moc3RydWN0
IGRldmljZSAqcGFyZW50LCB1bnNpZ25lZCBpbnQgbnB3bSwgc2l6ZV90IHNpemVvZl9wcml2KQo+
ICt7Cj4gKwlzdHJ1Y3QgcHdtX2NoaXAgKmNoaXA7Cj4gKwlzaXplX3QgYWxsb2Nfc2l6ZTsKPiAr
Cj4gKwlhbGxvY19zaXplID0gc2l6ZV9hZGQoc2l6ZW9mKCpjaGlwKSwgc2l6ZW9mX3ByaXYpOwo+
ICsKPiArCWNoaXAgPSBkZXZtX2t6YWxsb2MocGFyZW50LCBhbGxvY19zaXplLCBHRlBfS0VSTkVM
KTsKPiArCWlmICghY2hpcCkKPiArCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKPiArCj4gKwlj
aGlwLT5kZXYgPSBwYXJlbnQ7Cj4gKwljaGlwLT5ucHdtID0gbnB3bTsKPiArCj4gKwlwd21jaGlw
X3NldF9kcnZkYXRhKGNoaXAsIHB3bWNoaXBfcHJpdihjaGlwKSk7Cj4gKwo+ICsJcmV0dXJuIGNo
aXA7Cj4gK30KPiArRVhQT1JUX1NZTUJPTF9HUEwoZGV2bV9wd21jaGlwX2FsbG9jKTsKPiArCj4g
ICBzdGF0aWMgdm9pZCBvZl9wd21jaGlwX2FkZChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCj4gICB7
Cj4gICAJaWYgKCFjaGlwLT5kZXYgfHwgIWNoaXAtPmRldi0+b2Zfbm9kZSkKPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9wd20uaCBiL2luY2x1ZGUvbGludXgvcHdtLmgKPiBpbmRleCAyYzQ5
ZDJmZTJmZTcuLjhiYzc1MDRhYTdkNCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3B3bS5o
Cj4gKysrIGIvaW5jbHVkZS9saW51eC9wd20uaAo+IEBAIC00MDMsNiArNDAzLDggQEAgc3RhdGlj
IGlubGluZSBib29sIHB3bV9taWdodF9zbGVlcChzdHJ1Y3QgcHdtX2RldmljZSAqcHdtKQo+ICAg
aW50IHB3bV9jYXB0dXJlKHN0cnVjdCBwd21fZGV2aWNlICpwd20sIHN0cnVjdCBwd21fY2FwdHVy
ZSAqcmVzdWx0LAo+ICAgCQl1bnNpZ25lZCBsb25nIHRpbWVvdXQpOwo+ICAgCj4gK3N0cnVjdCBw
d21fY2hpcCAqZGV2bV9wd21jaGlwX2FsbG9jKHN0cnVjdCBkZXZpY2UgKnBhcmVudCwgdW5zaWdu
ZWQgaW50IG5wd20sIHNpemVfdCBzaXplb2ZfcHJpdik7Cj4gKwo+ICAgaW50IF9fcHdtY2hpcF9h
ZGQoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgbW9kdWxlICpvd25lcik7Cj4gICAjZGVm
aW5lIHB3bWNoaXBfYWRkKGNoaXApIF9fcHdtY2hpcF9hZGQoY2hpcCwgVEhJU19NT0RVTEUpCj4g
ICB2b2lkIHB3bWNoaXBfcmVtb3ZlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCk7CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
