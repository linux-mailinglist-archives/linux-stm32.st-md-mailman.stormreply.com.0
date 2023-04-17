Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA446E4120
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Apr 2023 09:35:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1576DC6B455;
	Mon, 17 Apr 2023 07:35:20 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82BBDC6B453
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 07:35:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10E72DE6;
 Mon, 17 Apr 2023 09:35:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1681716911;
 bh=+nNnkWr6Y0n06KrbbCtAOSHIusgnvBhnkukVuDNhkEc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NbcvuQnyQJAGVrRDp382kWJkH39Ilus9pmqcciT6N67Pdpgd9FeFZlZZ9XsqwFkHA
 Hzp4QDnGHlkDQGFg8p4k3P9nhygT8DNN9tzAcFlOgEHnSZXwgRJBNMHh4MaQ2gyksv
 vBVHMMH+GTSQftGIrThbwBm2FcmUTup6+MKy2H7I=
Date: Mon, 17 Apr 2023 10:35:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20230417073527.GE28551@pendragon.ideasonboard.com>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230417060203.le3izz56wt73si6k@pengutronix.de>
 <20230417061928.GD28551@pendragon.ideasonboard.com>
 <20230417073049.2b5b35hpjrjcrlge@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230417073049.2b5b35hpjrjcrlge@pengutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>, Eddie James <eajames@linux.ibm.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Alim Akhtar <alim.akhtar@samsung.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Sean Young <sean@mess.org>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, Antti Palosaari <crope@iki.fi>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 ye xingchen <ye.xingchen@zte.com.cn>, Sascha Hauer <s.hauer@pengutronix.de>,
 =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Tretter <m.tretter@pengutronix.de>, Benoit Parrot <bparrot@ti.com>,
 Moudy Ho <moudy.ho@mediatek.com>, kernel@pengutronix.de,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Ming Qian <ming.qian@nxp.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-aspeed@lists.ozlabs.org,
 Yunfei Dong <yunfei.dong@mediatek.com>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Colin Ian King <colin.i.king@gmail.com>, linux-media@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, Rory Liu <hellojacky0226@hotmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Maxime Ripard <mripard@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Zhou Peng <eagle.zhou@nxp.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Dan Carpenter <error27@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>,
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
 Ettore Chimenti <ek5.chimenti@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jacob Chen <jacob-chen@iotwrt.com>, Joel Stanley <joel@jms.id.au>,
 Yang Yingliang <yangyingliang@huawei.com>, Bin Liu <bin.liu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 Qiheng Lin <linqiheng@huawei.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Yang Li <yang.lee@linux.alibaba.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Todor Tomov <todor.too@gmail.com>, Mirela Rabulea <mirela.rabulea@nxp.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Scott Chao <scott_chao@wistron.corp-partner.google.com>,
 linux-renesas-soc@vger.kernel.org, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 openbmc@lists.ozlabs.org, Andy Gross <agross@kernel.org>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Eduardo Valentin <edubezval@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 linux-mediatek@lists.infradead.org, Yong Deng <yong.deng@magewell.com>,
 linux-tegra@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [Linux-stm32] [PATCH 000/117] media: Convert to platform remove
 callback returning void
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

T24gTW9uLCBBcHIgMTcsIDIwMjMgYXQgMDk6MzA6NDlBTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gSGVsbG8gTGF1cmVudCwKPiAKPiBPbiBNb24sIEFwciAxNywgMjAyMyBhdCAw
OToxOToyOEFNICswMzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gT24gTW9uLCBBcHIg
MTcsIDIwMjMgYXQgMDg6MDI6MDNBTSArMDIwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4g
PiA+IE9uIFN1biwgTWFyIDI2LCAyMDIzIGF0IDA0OjMwOjI1UE0gKzAyMDAsIFV3ZSBLbGVpbmUt
S8O2bmlnIHdyb3RlOgo+ID4gPiA+IEhlbGxvLAo+ID4gPiA+IAo+ID4gPiA+IHRoaXMgc2VyaWVz
IGFkYXB0cyB0aGUgcGxhdGZvcm0gZHJpdmVycyBiZWxvdyBkcml2ZXJzL3BjaSB0byB1c2UgdGhl
Cj4gPiA+IAo+ID4gPiBjb3B5JnBhc3RlIGZhaWx1cmUgaGVyZTogcy9wY2kvbWVkaWEvIG9mIGNv
dXJzZS4KPiA+ID4gCj4gPiA+ID4gLnJlbW92ZV9uZXcoKSBjYWxsYmFjay4gQ29tcGFyZWQgdG8g
dGhlIHRyYWRpdGlvbmFsIC5yZW1vdmUoKSBjYWxsYmFjawo+ID4gPiA+IC5yZW1vdmVfbmV3KCkg
cmV0dXJucyBubyB2YWx1ZS4gVGhpcyBpcyBhIGdvb2QgdGhpbmcgYmVjYXVzZSB0aGUgZHJpdmVy
IGNvcmUKPiA+ID4gPiBkb2Vzbid0IChhbmQgY2Fubm90KSBjb3BlIGZvciBlcnJvcnMgZHVyaW5n
IHJlbW92ZS4gVGhlIG9ubHkgZWZmZWN0IG9mIGEKPiA+ID4gPiBub24temVybyByZXR1cm4gdmFs
dWUgaW4gLnJlbW92ZSgpIGlzIHRoYXQgdGhlIGRyaXZlciBjb3JlIGVtaXRzIGEgd2FybmluZy4g
VGhlCj4gPiA+ID4gZGV2aWNlIGlzIHJlbW92ZWQgYW55aG93IGFuZCBhbiBlYXJseSByZXR1cm4g
ZnJvbSAucmVtb3ZlKCkgdXN1YWxseSB5aWVsZHMgYQo+ID4gPiA+IHJlc291cmNlIGxlYWsuCj4g
PiA+ID4gCj4gPiA+ID4gQnkgY2hhbmdpbmcgdGhlIHJlbW92ZSBjYWxsYmFjayB0byByZXR1cm4g
dm9pZCBkcml2ZXIgYXV0aG9ycyBjYW5ub3QKPiA+ID4gPiByZWFzb25hYmx5IGFzc3VtZSBhbnkg
bW9yZSB0aGF0IHRoZXJlIGlzIHNvbWUga2luZCBvZiBjbGVhbnVwIGxhdGVyLgo+ID4gPiA+IAo+
ID4gPiA+IE9ubHkgdGhyZWUgZHJpdmVycyBuZWVkZWQgc29tZSBwcmVwYXJhdGlvbiBmaXJzdCB0
byBtYWtlIHN1cmUgdGhleQo+ID4gPiA+IHJldHVybiAwIHVuY29uZGl0aW9uYWxseSBpbiB0aGVp
ciByZW1vdmUgY2FsbGJhY2suIFRoZW4gYWxsIGRyaXZlcnMKPiA+ID4gPiBjb3VsZCBiZSB0cml2
aWFsbHkgY29udmVydGVkIHdpdGhvdXQgc2lkZSBlZmZlY3RzIHRvIC5yZW1vdmVfbmV3KCkuCj4g
PiA+ID4gCj4gPiA+ID4gVGhlIGNoYW5nZXMgdG8gdGhlIGluZGl2aWR1YWwgZHJpdmVycyBhcmUg
YWxsIG9ydGhvZ29uYWwuIElmIEkgbmVlZCB0bwo+ID4gPiA+IHJlc2VuZCBzb21lIHBhdGNoZXMg
YmVjYXVzZSBvZiBzb21lIHJldmlldyBmZWVkYmFjaywgSSdkIGxpa2UgdG8gb25seQo+ID4gPiA+
IHNlbmQgdGhlIHBhdGNoZXMgdGhhdCBhY3R1YWxseSBuZWVkZWQgY2hhbmdlcywgc28gcGxlYXNl
IHBpY2sgdXAgdGhlCj4gPiA+ID4gcmVtYWluaW5nIHBhdGNoZXMgdGhhdCBkb24ndCBuZWVkIGNo
YW5naW5nIHRvIHJlZHVjZSB0aGUgYW1vdW50IG9mIG1haWwuCj4gPiA+IAo+ID4gPiBJIGRpZG4n
dCBoZWFyIGFueXRoaW5nIGJhY2sgYWJvdXQgYXBwbGljYXRpb24gb2YgdGhpcyBzZXJpZXMuIElz
IHRoZXJlIGEKPiA+ID4gYmxvY2tlciBzb21ld2hlcmU/Cj4gPiAKPiA+IEkgdGhpbmsgdGhlIHNl
cmllcyBnb3QgYXBwbGllZCB0byB0aGUgbWFzdGVyIGJyYW5jaCBvZgo+ID4gZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFibGUuZ2l0
Lgo+ID4gSXQgc2hvdWxkIHRodXMgYXBwZWFyIGluIHY2LjQuCj4gCj4gSSBndWVzcyB0aGF0IGxp
bnV4LXN0YWJsZS5naXQgaXMgYSBjb3B5JnBhc3RlIGZhaWx1cmUgKGFuZCBpdCdzIG5vdAo+IHRo
ZXJlKS4gSSBkb24ndCBzZWUgdGhlIHNlcmllcyBpbiB0aGUgbWFzdGVyIGJyYW5jaCBvZgo+IGdp
dDovL2xpbnV4dHYub3JnL21lZGlhX3RyZWUuZ2l0IGVpdGhlci4KCk9vcHMgc29ycnkuIEl0IHdh
cyBhIGNvcHkgJiBwYXN0ZSBtaXN0YWtlIGluZGVlZCwgSSBtZWFudAoKZ2l0Oi8vbGludXh0di5v
cmcvbWVkaWFfc3RhZ2UuZ2l0Cgo+IC4uIGEgYml0IGxhdGVyIC4uLgo+IAo+IGFoLCBpdCdzIGlu
IGdpdDovL2xpbnV4dHYub3JnL21jaGVoYWIvbWVkaWEtbmV4dC5naXQKPiAKPiBJIGd1ZXNzIEkg
d2FzIGp1c3QgdG8gcXVpY2sgYW5kIHByb2JhYmx5IHRoZSBzZXJpZXMgd2lsbCBiZSBpbmNsdWRl
ZCBpbgo+IHRvZGF5J3MgbmV4dC4KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
