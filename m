Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 068898D0706
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2024 17:57:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB7D5C6DD66;
	Mon, 27 May 2024 15:57:38 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD727CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2024 15:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1716825410; x=1717430210; i=markus.elfring@web.de;
 bh=cCQzbMHV0uZw8ARZF6tyJxZsTWRc/buEbEqLjIXSnlw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=PUTkJtv+17tmHPSwdj2hf899Cxz87JZtpAv6Jc/t460ErK6rIZ1XjrMEwjT/IL5e
 u6asEjjbaWV05EEJOrnLlJNLso+bKJ6JUhoe+vAQmYcyr1mOVJ9CmwVzJFYdsDjWk
 lhH7BRvhFBzVj6hnFHPSxBLuofy8FnxnuGCzKVh06VXSoykW9+Z5sNppeifyGBhS7
 Tbby0eXDkzEd3ur+rXCvlZhYwOhxY2j+kjNeQE+m/gaI7bzpQ3HVkzXeOYg+oIyfZ
 hv0kSHTDq7XWjQmMF+X+gAfIYHkN5y02reNDf+/pFuI1uzraU+ayvVz08dwXuor0H
 +gQ8lygtBMIj/W0VNQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N6JxT-1sa0Ai3q9J-016inV; Mon, 27
 May 2024 17:56:50 +0200
Message-ID: <aa58efd3-b502-4bed-8c84-e5d78da23fbe@web.de>
Date: Mon, 27 May 2024 17:56:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peng Fan <peng.fan@nxp.com>, soc@kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chester Lin <chester62515@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Damien Le Moal <dlemoal@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Hal Feng <hal.feng@starfivetech.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Jacky Bai <ping.bai@nxp.com>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Joel Stanley <joel@jms.id.au>, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Orson Zhai
 <orsonzhai@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>
References: <20240504-pinctrl-cleanup-v2-18-26c5f2dc1181@nxp.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240504-pinctrl-cleanup-v2-18-26c5f2dc1181@nxp.com>
X-Provags-ID: V03:K1:fY28vuOzSy7D3myo+NUo+Q8h4MAB+DMYH6x54XY9zacr23bFm3Z
 XEU1mqywgExmQK1yZjuU6En9jXs1HgcwzsaQZ+4suTC5BPEjIf/Fg4o0HdX3AuRpQZI2yac
 KrkniKWThKnQbs96+yLl/Dm5E5NsImhOyFs1ksUAetHBWVW2WfIWoOdGSaoQFZRJLEXutYy
 iCHwBxLqQsK9Mq+39k2DQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TjeN7uyFccs=;bjTTRHq6gIBTOMFXSFUogBWSZuQ
 ZTwgZq2VnppV1aZlnrDYMmOmytXyq0JrjEzIfy/yH2myRvZFwVxrMpYgtVdN++fuf8ainJk/t
 uFkTD8huhpK+v/6sd6lXCGtTOMoxBExDvHrzfiIvMwNnj5vJaD78bXrOpQIviBkrbo/dpouOC
 Ln7QFnEpQNN9tfIRGg8gaddFRITCsPb8eIY2ZjqdGWqcC0mpb+GXVonl0LzMFBCnUIrGNucUB
 JyF0gcU5WkAg6RJMxI6bQbphTn5At4z7kJpzYsMNnHFABhVCUal+gm0247pr1mpjl/KiGECTR
 XNTX442NdkykPvhiMNWp17M35HW0J6oLENbsSL8PyhGQHAW5h5EnpFB5SuC+MkmcW7VQwxd36
 lCdpZmXrsZsRJ7AbJhptgf/dByjHu/LOLAj4+ethb/xC2SLDH84JLTDzzYCw43EzHk/09K8p9
 cDEpfpl8+VPFN35SSlqs/3lTQxU1UurqQF96DxIJCZdCGRE3icPsCoTwZMOJqDYJkYsmztQRH
 YW541Ftvhar9wZSgE19Bcj1s0L3HXu9Xp3pkz7IcX+lrc7RPJuNoPC+xc48ucMhoGmNSMI5WK
 RVp1WSoLoJahSt7/mjjyxqyly6XzUtnKE6um1tWMAR0vojK8hQcOOL84UbAmXM7tbS+2QyuCj
 LkzuEZ/KIlY89jP9+dNMuuSCCwKeQJA7ykttwUV0aQte1rS7POYfJSX2aeTAa8Z7rWLzt7kHc
 AmtJvjHPIr4iMol58kTZo18kQbOqJQsi9qx7qS9pObTVMxyOiWt4lPdDW0vYOWO4MOmC4QlIy
 k96VHg44SU3OMjnGBpPp4v6EScAmUEUHJaYg/CdI/NGc8=
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Peng Fan <peng.fan@oss.nxp.com>, linux-aspeed@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, openbmc@lists.ozlabs.org,
 LKML <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel@pengutronix.de, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 18/20] pinctrl: freescale: mxs: Fix
	refcount of child
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

SG93IGRvIHlvdSB0aGluayBhYm91dCB0byB1c2UgdGhlIHN1bW1hcnkgcGhyYXNlIOKAnEZpeCBy
ZWZlcmVuY2UgY291bnRpbmcgZm9yIGNoaWxkcmVuIGluIG14c19waW5jdHJsX3Byb2JlX2R0KCni
gJ0/CgoK4oCmCj4gb2ZfZ2V0X25leHRfY2hpbGQoKSB3aWxsIGluY3JlYXNlIHJlZmNvdW50IOKA
pgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGhlIHJlZmVyZW5jZSBjb3Vu
dGVyPwoKCj4gUGVyIGN1cnJlbnQgaW1wbGVtZW50YXRpb24sICdjaGlsZCcgd2lsbCBiZSBvdmVy
cmlkZSBieQoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG92
ZXJyaWRkZW4/CgoKPiBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlKG5wLCBjaGlsZCksIHNvIHVzZSBv
Zl9nZXRfY2hpbGRfY291bnQgdG8gYXZvaWQKPiByZWZjb3VudCBsZWFrYWdlLgoKQW5vdGhlciB3
b3JkaW5nIHN1Z2dlc3Rpb246CiAgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShucCwgY2hpbGQpLiBU
aHVzIHVzZSBhbiBvZl9nZXRfY2hpbGRfY291bnQoKSBjYWxsCiAgdG8gYXZvaWQgcmVmZXJlbmNl
IGNvdW50aW5nIGxlYWthZ2UuCgoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
