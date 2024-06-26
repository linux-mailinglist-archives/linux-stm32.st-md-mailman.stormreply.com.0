Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB9F917D21
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 12:02:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EAE4C71287;
	Wed, 26 Jun 2024 10:02:29 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 400AEC71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 10:02:22 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52cd8897c73so5364020e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 03:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719396141; x=1720000941;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UIal9mSNuB7WVuajAQysXy9I34dokLqqKQSl/SD8Ip0=;
 b=mG3QZKHdLd33uwFSf1kB/qBs69enaLsStl3f7P2L5UdfuFrv6AFwe/QjEsAJsb8xr9
 XUfp1Fv4keVYQz03oA5BkorgHxbmtgynqrdGPSYwN17O6wMgzIiIv0KpMqsOUiheUY9W
 xTHnsd0cl8SMZsxH/nYfUnWXzEuIm35W2N9eX4BM9U7uBz1vhGwXUkfFoZtPAwkSPtzc
 ptt2w63dYHgTQADkHJtK1lj9ai3Kv1sOTe8pmhyMKVXnAn/AVZOiquzH1HVno71I/rIw
 EKUTaBtk3VI/qZPc7gn0ssI4qKo+VH/Dh3uR12lajFEExz2YADaA6sv7KXTmjln8OgRg
 KNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719396141; x=1720000941;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UIal9mSNuB7WVuajAQysXy9I34dokLqqKQSl/SD8Ip0=;
 b=PtlMQ1jz74F6rFPesuL7JWJ4e+m7zZeuQD2GoutOeTbRfTxll1sHdzPVIKfaj2trBN
 UKahkp7V8JPddjpdtLdTVzm1BAh6/yDmE2ICx9U+y1soa5SJ/5pL6rX7KRD7NhCRJt3g
 naMl1sEF9/Dulclj/k0QsQ256JmtMaYBRDu17U8j+sERNSYzn+r5hJzTTyVNMZqzYjkX
 OsdLGDyXc8U2ziUkATrbU7HhDJJabJcopuBp7sqHsUsoIKL+IKwoEZ4BvJl3o7838dlg
 k+sUKdug1GcT7r/12KVqkjHMk8woufoVKGVOxaML61ZYt+SVtzPY2v5HC9o+Xlcq6KBO
 /HZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlESLRDCllFHXq/C4zMi7yfqnt0r63s/KesezMIEaX5cks8jVhZG6R0mIcxiQAsPU1xYc6ZUnT+Q7kQ7Cpw8SEUsF+BNAwJWtDub8UV9aAE+eNr6KmMkO+
X-Gm-Message-State: AOJu0YyXmNI94J38J+sbGpBN0UuCUxYRaIu77BT93l3tNZdyQuaS9utb
 Dq4wGW8RFYkN7MvERfS2mjUDZtu1fhIQMD9CfYKjoqeDOp4Pv721NVY3JiyyKNdN09jDmk7vmzZ
 xEhhRotEX04iiepjC9PhEfYtJyPymeX1xbqy5iA==
X-Google-Smtp-Source: AGHT+IEEH1F7Tv7LomODsunYV84Dtc4zLrPpgRRnnl78k+rzuBYmNhragIOzGe8Zi41e1oTPofFlhnZh4uvVT5y70J8=
X-Received: by 2002:a05:6512:2254:b0:52c:8fd7:2252 with SMTP id
 2adb3069b0e04-52ce18324cdmr7591081e87.11.1719396141307; Wed, 26 Jun 2024
 03:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <AM6PR04MB594163BAB898D8689A94056F88CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB594163BAB898D8689A94056F88CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:02:09 +0200
Message-ID: <CACRpkdb17buPQVupCRDthvAgMKpvKvRWEN5GbA7pyF9NxymGEg@mail.gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>,
 "Ghennadi Procopciuc \(OSS\)" <ghennadi.procopciuc@oss.nxp.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jacky Bai <ping.bai@nxp.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chester Lin <chester62515@gmail.com>,
 "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>,
 Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "soc@kernel.org" <soc@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Aisheng Dong <aisheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Wells Lu <wellslutw@gmail.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 00/20] pinctrl: Use scope based
	of_node_put() cleanups
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

T24gVHVlLCBKdW4gMTgsIDIwMjQgYXQgMTo1MuKAr1BNIFBlbmcgRmFuIDxwZW5nLmZhbkBueHAu
Y29tPiB3cm90ZToKCj4gPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMDAvMjBdIHBpbmN0cmw6IFVzZSBz
Y29wZSBiYXNlZCBvZl9ub2RlX3B1dCgpCj4gPiBjbGVhbnVwcwo+Cj4gc3Qvc3RtMzIvcmVuZXNh
cyBwYXRjaGVzIGFyZSBwaWNrZWQuIFdvdWxkIHlvdSBoYW5kbGUgdGhlIHJlbWFpbmluZwo+IG9u
ZXM/CgpIbSByaWdodCwgSSBhcHBsaWVkIGFsbCB0aGF0IGFwcGx5IGNsZWFubHk6Cjk3MWM4YjRj
MDhlNyAoSEVBRCAtPiBkZXZlbCkgcGluY3RybDogc2Ftc3VuZzogVXNlIHNjb3BlIGJhc2VkCm9m
X25vZGVfcHV0KCkgY2xlYW51cHMKM2E4ODI1NTRhM2JiIHBpbmN0cmw6IGsyMTA6IFVzZSBzY29w
ZSBiYXNlZCBvZl9ub2RlX3B1dCgpIGNsZWFudXBzCjdmNTAwZjIwMTFjMCBwaW5jdHJsOiBmcmVl
c2NhbGU6IG14czogRml4IHJlZmNvdW50IG9mIGNoaWxkCmQ3ZjUxMjBhOTQ0YSBwaW5jdHJsOiBw
aW5jb25mLWdlbmVyaWM6IFVzZSBzY29wZSBiYXNlZCBvZl9ub2RlX3B1dCgpIGNsZWFudXBzCjI0
MGM1ZjIzOGQ1OSBwaW5jdHJsOiBiY206IGJjbTYzeHg6IFVzZSBzY29wZSBiYXNlZCBvZl9ub2Rl
X3B1dCgpIGNsZWFudXBzCjNhMDI3OGNmYjQ0OCBwaW5jdHJsOiBtZWRpYXRlazogVXNlIHNjb3Bl
IGJhc2VkIG9mX25vZGVfcHV0KCkgY2xlYW51cHMKYzk1N2FlN2U3ZTY4IHBpbmN0cmw6IG5vbWFk
aWs6IFVzZSBzY29wZSBiYXNlZCBvZl9ub2RlX3B1dCgpIGNsZWFudXBzCjNkY2MwMWIzNmYxOCBw
aW5jdHJsOiBzMzJjYzogVXNlIHNjb3BlIGJhc2VkIG9mX25vZGVfcHV0KCkgY2xlYW51cHMKN2My
YWFiYjU2ZjkyIHBpbmN0cmw6IGF0OTE6IFVzZSBzY29wZSBiYXNlZCBvZl9ub2RlX3B1dCgpIGNs
ZWFudXBzCjU2YzQyZjZjN2IyYyBwaW5jdHJsOiByb2NrY2hpcDogVXNlIHNjb3BlIGJhc2VkIG9m
X25vZGVfcHV0KCkgY2xlYW51cHMKOGM1ZGMyYTViM2E3IHBpbmN0cmw6IHNwZWFyOiBVc2Ugc2Nv
cGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSBjbGVhbnVwcwo3OTRlNWRjNTMzYjAgcGluY3RybDogc3By
ZDogVXNlIHNjb3BlIGJhc2VkIG9mX25vZGVfcHV0KCkgY2xlYW51cHMKOGZhOTljMDAzNTFjIHBp
bmN0cmw6IHN0YXJmaXZlOiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSBjbGVhbnVwcwox
MWVlZmMwYWM4ODQgcGluY3RybDogdGVncmE6IFVzZSBzY29wZSBiYXNlZCBvZl9ub2RlX3B1dCgp
IGNsZWFudXBzCgpDYW4geW91IGxvb2sgaW50byByZWJhc2luZyB0aGUgcmVtYWluaW5nIG9uZXM/
CgpJIGFtIGEgYml0IHVuc3VyZSBhYm91dCBTYW1zdW5nLCBLcnp5c3p0b2YgdXN1YWxseSBwaWNr
IHRoZXNlLCBidXQgbm8gYmlnCmRlYWwgSSBndWVzcywgaWYgaGUgb2JqZWN0cyBJIGNhbiBqdXN0
IHRha2UgaXQgb3V0IGFnYWluLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
