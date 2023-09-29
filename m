Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 238DE7B2EA6
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Sep 2023 10:57:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBDC2C6B477;
	Fri, 29 Sep 2023 08:57:47 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1160C6B474
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Sep 2023 08:57:46 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so1851214566b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Sep 2023 01:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695977866; x=1696582666;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nsBQLJ6Ogoic+1/xmfT0u8ONBi3qeWxubxgbbL3TF8o=;
 b=nqnWM0fApr6s+q2pkqPsPLiLTOkOW7FlBtzC5egNMz7nCMGoMoAI5TsXl6Lby955BL
 JMoTMFxJ4BbN44tsdsIGe5ksAjnkQozeo30LI3f8XeOwL76Y48WT91UeNDNnHIJLZ3rc
 lMwh+pwk2FnC6bfvbooQpEr62m2eSr0HNTfxZ8v5B37B5BVTmHrCSGfH/mMyJA34B0Pk
 JM4K4Kg5+KyfueoIapLzhjJQZPmWY0ffrXvN9ULjQPHB199DOSO1lbodu+xzY+ohaZ1h
 PoLi8/8JucZZqJZWGly6PI+VIfJhT4dunUwKwt57L63mqIHNE0S0p33F+R1QrYp5FlyX
 E5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695977866; x=1696582666;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nsBQLJ6Ogoic+1/xmfT0u8ONBi3qeWxubxgbbL3TF8o=;
 b=BoIJALLEf8aFUdYQzQdm3RCSc6BaCRcZX9DL9aChyPTgapiTCCe2+sbFRmidfMhinp
 9CQX0a/orchIUi0NsSjxc1+l9J4+6qVSMXjW2HuFOX+rB7HrtLwyqcGHFDfJC/+FJVoV
 4VOl8qPTN2CTXRa1qBJV5pp6QqnYNsacPG14mQE2uTssaSjlF6utJ0acZO91ugWDtLnt
 BRlKYVpTusGSIUj3PmWq2rh6NvIr3QL7+X+Jatyn0eBv1u2XMklpWaQALlmOmK4EplQl
 8mfCAV0rztIyyN0Ey/K8MV24SMf7sYzajaBeWEMKyn/jdb+zF/FKBzbZvyJ/CuyiykWY
 o4Yw==
X-Gm-Message-State: AOJu0YxBw0opS8WzBy6B4SvovdgnRATSt5a47RWiM7h4qEx/8+P8z17e
 JbQc5Wf8+a6bJjtdbOBY3XhXVQ==
X-Google-Smtp-Source: AGHT+IEsrmtSBffKc4/0WejFkmq1arFW3oxGMi3C1GOThUgoHMTSmFySeXvpixD0/kTwmWhaMqbTUQ==
X-Received: by 2002:a17:906:28e:b0:9b2:b749:ff93 with SMTP id
 14-20020a170906028e00b009b2b749ff93mr2957352ejf.24.1695977866113; 
 Fri, 29 Sep 2023 01:57:46 -0700 (PDT)
Received: from srini-hackbase.lan ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 w27-20020a17090633db00b009a2235ed496sm12339806eja.141.2023.09.29.01.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 01:57:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
In-Reply-To: <20230927204446.4231-1-zajec5@gmail.com>
References: <20230927204446.4231-1-zajec5@gmail.com>
Message-Id: <169597786418.99756.8731565742524355843.b4-ty@linaro.org>
Date: Fri, 29 Sep 2023 09:57:44 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 Evgeniy Polyakov <zbr@ioremap.net>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Heiko Stuebner <heiko@sntech.de>,
 linux-rtc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Richard Weinberger <richard@nod.at>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Vincent Shih <vincent.sunplus@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-sunxi@lists.linux.dev,
 asahi@lists.linux.dev, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sven Peter <sven@svenpeter.dev>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Walle <michael@walle.cc>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH V5] nvmem: add explicit config option to
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Ck9uIFdlZCwgMjcgU2VwIDIwMjMgMjI6NDQ6NDYgKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPiBCaW5kaW5nIGZvciBmaXhlZCBOVk1FTSBjZWxscyBkZWZpbmVkIGRpcmVjdGx5IGFzIE5W
TUVNIGRldmljZSBzdWJub2Rlcwo+IGhhcyBiZWVuIGRlcHJlY2F0ZWQuIEl0IGhhcyBiZWVuIHJl
cGxhY2VkIGJ5IHRoZSAiZml4ZWQtbGF5b3V0IiBOVk1FTQo+IGxheW91dCBiaW5kaW5nLgo+IAo+
IE5ldyBzeW50YXggaXMgbWVhbnQgdG8gYmUgY2xlYXJlciBhbmQgc2hvdWxkIGhlbHAgYXZvaWRp
bmcgaW1wcmVjaXNlCj4gYmluZGluZ3MuCj4gCj4gWy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClsx
LzFdIG52bWVtOiBhZGQgZXhwbGljaXQgY29uZmlnIG9wdGlvbiB0byByZWFkIG9sZCBzeW50YXgg
Zml4ZWQgT0YgY2VsbHMKICAgICAgY29tbWl0OiBlZTczYTlmYWU1NDBhZGJiNDMyYmQyODU0YTgy
NDA5NTE1YzdjODkyCgpCZXN0IHJlZ2FyZHMsCi0tIApTcmluaXZhcyBLYW5kYWdhdGxhIDxzcmlu
aXZhcy5rYW5kYWdhdGxhQGxpbmFyby5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
