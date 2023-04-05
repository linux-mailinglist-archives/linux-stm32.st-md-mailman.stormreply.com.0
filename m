Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EF26D7D3D
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 15:02:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 458E4C6A610;
	Wed,  5 Apr 2023 13:02:09 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75480C6A606
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 13:02:07 +0000 (UTC)
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pk2lE-0006xn-Nr; Wed, 05 Apr 2023 15:01:12 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Wed, 05 Apr 2023 15:01:10 +0200
Message-ID: <4767237.ejJDZkT8p0@diego>
In-Reply-To: <20230403225540.1931-1-zajec5@gmail.com>
References: <20230403225540.1931-1-zajec5@gmail.com>
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Evgeniy Polyakov <zbr@ioremap.net>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-rtc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Richard Weinberger <richard@nod.at>, Michal Simek <michal.simek@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Vincent Shih <vincent.sunplus@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>, linux-sunxi@lists.linux.dev,
 asahi@lists.linux.dev, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sven Peter <sven@svenpeter.dev>,
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
Subject: [Linux-stm32] Re: [PATCH V4] nvmem: add explicit config option to
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

QW0gRGllbnN0YWcsIDQuIEFwcmlsIDIwMjMsIDAwOjU1OjQwIENFU1Qgc2NocmllYiBSYWZhxYIg
TWnFgmVja2k6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IAo+
IEJpbmRpbmcgZm9yIGZpeGVkIE5WTUVNIGNlbGxzIGRlZmluZWQgZGlyZWN0bHkgYXMgTlZNRU0g
ZGV2aWNlIHN1Ym5vZGVzCj4gaGFzIGJlZW4gZGVwcmVjYXRlZC4gSXQgaGFzIGJlZW4gcmVwbGFj
ZWQgYnkgdGhlICJmaXhlZC1sYXlvdXQiIE5WTUVNCj4gbGF5b3V0IGJpbmRpbmcuCj4gCj4gTmV3
IHN5bnRheCBpcyBtZWFudCB0byBiZSBjbGVhcmVyIGFuZCBzaG91bGQgaGVscCBhdm9pZGluZyBp
bXByZWNpc2UKPiBiaW5kaW5ncy4KPiAKPiBOVk1FTSBzdWJzeXN0ZW0gYWxyZWFkeSBzdXBwb3J0
cyB0aGUgbmV3IGJpbmRpbmcuIEl0IHNob3VsZCBiZSBhIGdvb2QKPiBpZGVhIHRvIGxpbWl0IHN1
cHBvcnQgZm9yIG9sZCBzeW50YXggdG8gZXhpc3RpbmcgZHJpdmVycyB0aGF0IGFjdHVhbGx5Cj4g
c3VwcG9ydCAmIHVzZSBpdCAod2UgY2FuJ3QgYnJlYWsgYmFja3dhcmQgY29tcGF0aWJpbGl0eSEp
LiBUaGF0IHdheSB3ZQo+IGFkZGl0aW9uYWxseSBlbmNvdXJhZ2UgbmV3IGJpbmRpbmdzICYgZHJp
dmVycyB0byBpZ25vcmUgZGVwcmVjYXRlZAo+IGJpbmRpbmcuCj4gCj4gSXQgd2Fzbid0IGNsZWFy
ICh0byBtZSkgaWYgcnRjIGFuZCB3MSBjb2RlIGFjdHVhbGx5IHVzZXMgb2xkIHN5bnRheAo+IGZp
eGVkIGNlbGxzLiBJIGVuYWJsZWQgdGhlbSB0byBkb24ndCByaXNrIGFueSBicmVha2FnZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gW2Zv
ciBtZXNvbi17ZWZ1c2UsbXgtZWZ1c2V9LmNdCj4gQWNrZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGlu
Z2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cj4gW2ZvciBtdGstZWZ1c2Uu
YywgbnZtZW0vY29yZS5jLCBudm1lbS1wcm92aWRlci5oXQo+IFJldmlld2VkLWJ5OiBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEu
Y29tPgo+IFtNVDgxOTIsIE1UODE5NSBDaHJvbWVib29rc10KPiBUZXN0ZWQtYnk6IEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5j
b20+Cj4gW2ZvciBtaWNyb2NoaXAtb3RwYy5jXQo+IFJldmlld2VkLWJ5OiBDbGF1ZGl1IEJlem5l
YSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlwLmNvbT4KPiBbU0FNQTdHNS1FS10KPiBUZXN0ZWQt
Ynk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUBtaWNyb2NoaXAuY29tPgoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9udm1lbS9yb2NrY2hpcC1lZnVzZS5jIGIvZHJpdmVycy9udm1lbS9y
b2NrY2hpcC1lZnVzZS5jCj4gaW5kZXggZTQ1NzlkZTVkMDE0Li5hZGM4YmM3MGNmZmEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9udm1lbS9yb2NrY2hpcC1lZnVzZS5jCj4gKysrIGIvZHJpdmVycy9u
dm1lbS9yb2NrY2hpcC1lZnVzZS5jCj4gQEAgLTIwNSw2ICsyMDUsNyBAQCBzdGF0aWMgaW50IHJv
Y2tjaGlwX3JrMzM5OV9lZnVzZV9yZWFkKHZvaWQgKmNvbnRleHQsIHVuc2lnbmVkIGludCBvZmZz
ZXQsCj4gIAo+ICBzdGF0aWMgc3RydWN0IG52bWVtX2NvbmZpZyBlY29uZmlnID0gewo+ICAJLm5h
bWUgPSAicm9ja2NoaXAtZWZ1c2UiLAo+ICsJLmFkZF9sZWdhY3lfZml4ZWRfb2ZfY2VsbHMgPSB0
cnVlLAo+ICAJLnN0cmlkZSA9IDEsCj4gIAkud29yZF9zaXplID0gMSwKPiAgCS5yZWFkX29ubHkg
PSB0cnVlLAoKZm9yIHJvY2tjaGlwLWVmdXNlLmMKUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVibmVy
IDxoZWlrb0BzbnRlY2guZGU+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
