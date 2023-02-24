Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A794E6A1CD3
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Feb 2023 14:14:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56297C6904B;
	Fri, 24 Feb 2023 13:14:05 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70EBDC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Feb 2023 13:14:04 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 65D7D6602FB6;
 Fri, 24 Feb 2023 13:14:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677244443;
 bh=Okn4gS1gr349hyYSKqFPtphNu9lynSCGwrmaUsYAV7k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Gm+baLq2JEYoErHccOrY+sq6UkDE63wM7blUSKo5+RWdViPYvsPewvBWLj6KK/Klp
 mX0JPGD4xhg/6yWU++Nzbmfnl82cF9liwmH7/V49AdT0JhjKn/9qFXL/MGmI+iFB67
 kEGGWDZczMu1ApL71HWexGJDHuCekPnec8VhOqK/IaN4Ec18oW5lZJK5IMSXZwaONx
 pW0CUQ3NXQdomYvAUVtmuLd3Bvdsg8AvWF57+1ZZ3pSrcDOBQdPK7V6n01YRtKSLUa
 bKRbQR8cYQ9XXXp8GWwxsBTRfmoO71Bj6gti3TX4MnkShBZEDgDb+fHdBMjgfzYc9q
 hsCnVl7kz1jdg==
Message-ID: <c17f94a6-c710-f80e-c2af-9e450f144157@collabora.com>
Date: Fri, 24 Feb 2023 14:13:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20230224072903.20945-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230224072903.20945-1-zajec5@gmail.com>
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH V2] nvmem: add explicit config option to
 read OF fixed cells
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

SWwgMjQvMDIvMjMgMDg6MjksIFJhZmHFgiBNacWCZWNraSBoYSBzY3JpdHRvOgo+IEZyb206IFJh
ZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBOVk1FTSBzdWJzeXN0ZW0gbG9v
a3MgZm9yIGZpeGVkIE5WTUVNIGNlbGxzIChzcGVjaWZpZWQgaW4gRFQpIGJ5Cj4gZGVmYXVsdC4g
VGhpcyBiZWhhdmlvdXIgbWFkZSBzZW5zZSBpbiBlYXJseSBkYXlzIGJlZm9yZSBhZGRpbmcgc3Vw
cG9ydAo+IGZvciBkeW5hbWljIGNlbGxzLgo+IAo+IFdpdGggZXZlcnkgbmV3IHN1cHBvcnRlZCBO
Vk1FTSBkZXZpY2Ugd2l0aCBkeW5hbWljIGNlbGxzIGN1cnJlbnQKPiBiZWhhdmlvdXIgYmVjb21l
cyBub24tb3B0aW1hbC4gSXQgcmVzdWx0cyBpbiB1bm5lZWRlZCBpdGVyYXRpbmcgb3ZlciBEVAo+
IG5vZGVzIGFuZCBtYXkgcmVzdWx0IGluIGZhbHNlIGRpc2NvdmVyeSBvZiBjZWxscyAoZGVwZW5k
aW5nIG9uIHVzZWQgRFQKPiBwcm9wZXJ0aWVzKS4KPiAKPiBUaGlzIGJlaGF2aW91ciBoYXMgYWN0
dWFsbHkgY2F1c2VkIGEgcHJvYmxlbSBhbHJlYWR5IHdpdGggdGhlIE1URAo+IHN1YnN5c3RlbS4g
TVREIHN1YnBhcnRpdGlvbnMgd2VyZSBpbmNvcnJlY3RseSB0cmVhdGVkIGFzIE5WTUVNIGNlbGxz
Lgo+IAo+IEFsc28gd2l0aCB1cGNvbWluZyBzdXBwb3J0IGZvciBOVk1FTSBsYXlvdXRzIG5vIG5l
dyBiaW5kaW5nIG9yIGRyaXZlcgo+IHNob3VsZCBzdXBwb3J0IGZpeGVkIGNlbGxzIGRlZmluZWQg
aW4gZGV2aWNlIG5vZGUuCj4gCj4gU29sdmUgdGhpcyBieSBtb2RpZnlpbmcgZHJpdmVycyBmb3Ig
YmluZGluZ3MgdGhhdCBzdXBwb3J0IHNwZWNpZnlpbmcKPiBmaXhlZCBOVk1FTSBjZWxscyBpbiBE
VC4gTWFrZSB0aGVtIGV4cGxpY2l0bHkgdGVsbCBOVk1FTSBzdWJzeXN0ZW0gdG8KPiByZWFkIGNl
bGxzIGZyb20gRFQuCj4gCj4gSXQgd2Fzbid0IGNsZWFyICh0byBtZSkgaWYgcnRjIGFuZCB3MSBj
b2RlIGFjdHVhbGx5IHVzZXMgZml4ZWQgY2VsbHMuIEkKPiBlbmFibGVkIHRoZW0gdG8gZG9uJ3Qg
cmlzayBhbnkgYnJlYWthZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxy
YWZhbEBtaWxlY2tpLnBsPgo+IFtmb3IgZHJpdmVycy9udm1lbS9tZXNvbi17ZWZ1c2UsbXgtZWZ1
c2V9LmNdCj4gQWNrZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGlu
Z2xAZ29vZ2xlbWFpbC5jb20+CgpbZm9yIG10ay1lZnVzZS5jLCBudm1lbS9jb3JlLmMsIG52bWVt
LXByb3ZpZGVyLmhdClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5n
ZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgoKW01UODE5MiwgTVQ4MTk1IENo
cm9tZWJvb2tzXQpUZXN0ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9n
aW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
