Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2BB6D4DC2
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 18:30:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16AC6C6A610;
	Mon,  3 Apr 2023 16:30:05 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5651BC6A60B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 16:30:04 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id w9so119679101edc.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Apr 2023 09:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680539404;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MeWz95RBmI6XpSLkAR+cuB3iAEeGC3iRvwSDE5+WIbY=;
 b=vHhtKJL5afd3fDZb5Xvy5G6y/LTvqitLGSe7Ap0XWRSd3UnHwlhXG/jlL1pEDbro5N
 dDLdwGPIJVRIvCgJf+ooSRVUmcxTfsxV8spRGbOdGMiu0Yjabnu9Hv/mjHGNPXQ8lvjN
 cHe5ugODQYhlOZWDVDxVyYBUABgPfEhUNhPdKeF3/9v5wJk7oZDOr605S7tVuPNd8wTF
 bx6a/0ODqm177Gf9vkkLZzZXwHE9nR4G62csYL1zJ90eb79s5EDQerAqVGy4fDYuhuFx
 gXu3jujaXU5RPMtaZlFQ+OKGBp5RSLJJ0rYp6O8X402TZk6l3E92wW+w0z23pJ8wZvpJ
 eSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680539404;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MeWz95RBmI6XpSLkAR+cuB3iAEeGC3iRvwSDE5+WIbY=;
 b=LuwarM6rjesEG7E8YhbhtBdbcbaBG0O4Ka9T8c8oOjPM4NlHYr+/8tIzDdjRGl8r4K
 WIY1lMaO33X/pyhAcabeqbTp7blFz2z5SsZyyLmswErldWabR1ABOyFB8IUq/VnVzOif
 LSfZQg3GPbep7onfuIwVD9rKDqOv1S729zk8pN1qpnjv+gReXAu8wjWgEOvKr/Vy1r65
 sL6vybH/61vMYrFXES7pTLDin01tKdhbgLqVmMmilhv52JJWV0RlsiwZq9hUit+JRSwF
 3qnJJTUczKCIkM4o4GKM92LYimR3+7qvxU1Iyse5KBb4ThkiZZ97NKvTBMrWhk/Slso5
 bLmw==
X-Gm-Message-State: AAQBX9f85UIGP5Wbxp6/O2ZT6TeUvZWhQUENwnJjtZQUiwRt7pI4ynae
 QjS5Lc7JqL+nqXEAtsjRaFv0Qw==
X-Google-Smtp-Source: AKy350YS4e1dI8mZhrbLOs96X7qTnH/JqlEPq688zdETFGPGyW8pAjyNj4FhzEJY/Pp8fKqk3yTMRQ==
X-Received: by 2002:a17:906:3da:b0:931:95a1:a05a with SMTP id
 c26-20020a17090603da00b0093195a1a05amr37358230eja.62.1680539403777; 
 Mon, 03 Apr 2023 09:30:03 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
 by smtp.gmail.com with ESMTPSA id
 ld4-20020a1709079c0400b009486efb9192sm2073196ejc.11.2023.04.03.09.29.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 09:30:03 -0700 (PDT)
Message-ID: <f881883e-23e1-66e0-78d2-da86533b038f@linaro.org>
Date: Mon, 3 Apr 2023 17:29:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Valentin Korenblit <vkorenblit@sequans.com>,
 Wang Weiyang <wangweiyang2@huawei.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>, =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Han Xu <han.xu@nxp.com>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liang Yang <liang.yang@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, Roger Quadros <rogerq@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Miaoqian Lin <linmq006@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Jack Wang <jinpu.wang@ionos.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>,
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
Cc: linux-oxnas@groups.io, Richard Weinberger <richard@nod.at>,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
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

CgpPbiA0LzEvMjMgMTc6MTgsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IEhlbGxvLAo+IAo+
IHRoaXMgc2VyaWVzIGFkYXB0cyB0aGUgcGxhdGZvcm0gZHJpdmVycyBiZWxvdyBkcml2ZXJzL210
ZC9uYW5kIHRvIHVzZSB0aGUKPiAucmVtb3ZlX25ldygpIGNhbGxiYWNrLiBDb21wYXJlZCB0byB0
aGUgdHJhZGl0aW9uYWwgLnJlbW92ZSgpIGNhbGxiYWNrCj4gLnJlbW92ZV9uZXcoKSByZXR1cm5z
IG5vIHZhbHVlLiBUaGlzIGlzIGEgZ29vZCB0aGluZyBiZWNhdXNlIHRoZSBkcml2ZXIgY29yZQo+
IGRvZXNuJ3QgKGFuZCBjYW5ub3QpIGNvcGUgZm9yIGVycm9ycyBkdXJpbmcgcmVtb3ZlLiBUaGUg
b25seSBlZmZlY3Qgb2YgYQo+IG5vbi16ZXJvIHJldHVybiB2YWx1ZSBpbiAucmVtb3ZlKCkgaXMg
dGhhdCB0aGUgZHJpdmVyIGNvcmUgZW1pdHMgYSB3YXJuaW5nLiBUaGUKPiBkZXZpY2UgaXMgcmVt
b3ZlZCBhbnlob3cgYW5kIGFuIGVhcmx5IHJldHVybiBmcm9tIC5yZW1vdmUoKSB1c3VhbGx5IHlp
ZWxkcyBhCj4gcmVzb3VyY2UgbGVhay4KPiAKPiBCeSBjaGFuZ2luZyB0aGUgcmVtb3ZlIGNhbGxi
YWNrIHRvIHJldHVybiB2b2lkIGRyaXZlciBhdXRob3JzIGNhbm5vdAo+IHJlYXNvbmFibHkgYXNz
dW1lIGFueSBtb3JlIHRoYXQgdGhlcmUgaXMgc29tZSBraW5kIG9mIGNsZWFudXAgbGF0ZXIuCj4g
Cj4gQXMgYWxsIGRyaXZlcnMgYWxyZWFkeSByZXR1cm4gMCBpbiB0aGVpciAucmVtb3ZlIGNhbGxi
YWNrLCB0aGV5IGNhbiBiZQo+IGNvbnZlcnRlZCB0cml2aWFsbHkuCj4gCgpJJ2QgbWFrZSBhIHNp
bmdsZSBwYXRjaCBwZXIgc3Vic3lzdGVtIGZvciB0cml2aWFsIGNoYW5nZXMsIGJ1dCBJIGRvbid0
Cm1pbmQgaGF2aW5nIHRoZW0gc3BsaXQgcGVyIGRyaXZlciBlaXRoZXI6CgpBY2tlZC1ieTogVHVk
b3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
