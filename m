Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 823E86E3F94
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Apr 2023 08:19:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D844C6B455;
	Mon, 17 Apr 2023 06:19:22 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E25CC6B453
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 06:19:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B70CC75B;
 Mon, 17 Apr 2023 08:19:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1681712352;
 bh=hUS3oAOWF+giUHWBAsyfYtTSnpYPnmumb+DnGnesqJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q+UHkgsqoMg+RbmFKgO/pKG4ltOgU+p0CEbmAeVPPRN4I/Z0MDEKluVIEqTeJBTh9
 iHu44ev6JJI4FvruskDtoyatzHO41OXYRlqntM4853wlvujiEUW9lTQTFW+9URIaRu
 Pthp2nfBkldHSvMHEeDw0JIfxddwHLTf+oIOMJpY=
Date: Mon, 17 Apr 2023 09:19:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20230417061928.GD28551@pendragon.ideasonboard.com>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230417060203.le3izz56wt73si6k@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230417060203.le3izz56wt73si6k@pengutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>, Eddie James <eajames@linux.ibm.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Alim Akhtar <alim.akhtar@samsung.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Dafna Hirschfeld <dafna@fastmail.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, Antti Palosaari <crope@iki.fi>,
 NXP Linux Team <linux-imx@nxp.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-sunxi@lists.linux.dev, ye xingchen <ye.xingchen@zte.com.cn>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Andrew Jeffery <andrew@aj.id.au>, Michael Tretter <m.tretter@pengutronix.de>,
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
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Colin Ian King <colin.i.king@gmail.com>, linux-media@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, Rory Liu <hellojacky0226@hotmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Maxime Ripard <mripard@kernel.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Zhou Peng <eagle.zhou@nxp.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Dan Carpenter <error27@gmail.com>, Sean Young <sean@mess.org>,
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
 Ettore Chimenti <ek5.chimenti@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, linux-tegra@vger.kernel.org,
 Eduardo Valentin <edubezval@gmail.com>,
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
 Benoit Parrot <bparrot@ti.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Yong Deng <yong.deng@magewell.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
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

SGkgVXdlLAoKT24gTW9uLCBBcHIgMTcsIDIwMjMgYXQgMDg6MDI6MDNBTSArMDIwMCwgVXdlIEts
ZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8gTWF1cm8KPiAKPiBPbiBTdW4sIE1hciAyNiwgMjAy
MyBhdCAwNDozMDoyNVBNICswMjAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiA+IEhlbGxv
LAo+ID4gCj4gPiB0aGlzIHNlcmllcyBhZGFwdHMgdGhlIHBsYXRmb3JtIGRyaXZlcnMgYmVsb3cg
ZHJpdmVycy9wY2kgdG8gdXNlIHRoZQo+IAo+IGNvcHkmcGFzdGUgZmFpbHVyZSBoZXJlOiBzL3Bj
aS9tZWRpYS8gb2YgY291cnNlLgo+IAo+ID4gLnJlbW92ZV9uZXcoKSBjYWxsYmFjay4gQ29tcGFy
ZWQgdG8gdGhlIHRyYWRpdGlvbmFsIC5yZW1vdmUoKSBjYWxsYmFjawo+ID4gLnJlbW92ZV9uZXco
KSByZXR1cm5zIG5vIHZhbHVlLiBUaGlzIGlzIGEgZ29vZCB0aGluZyBiZWNhdXNlIHRoZSBkcml2
ZXIgY29yZQo+ID4gZG9lc24ndCAoYW5kIGNhbm5vdCkgY29wZSBmb3IgZXJyb3JzIGR1cmluZyBy
ZW1vdmUuIFRoZSBvbmx5IGVmZmVjdCBvZiBhCj4gPiBub24temVybyByZXR1cm4gdmFsdWUgaW4g
LnJlbW92ZSgpIGlzIHRoYXQgdGhlIGRyaXZlciBjb3JlIGVtaXRzIGEgd2FybmluZy4gVGhlCj4g
PiBkZXZpY2UgaXMgcmVtb3ZlZCBhbnlob3cgYW5kIGFuIGVhcmx5IHJldHVybiBmcm9tIC5yZW1v
dmUoKSB1c3VhbGx5IHlpZWxkcyBhCj4gPiByZXNvdXJjZSBsZWFrLgo+ID4gCj4gPiBCeSBjaGFu
Z2luZyB0aGUgcmVtb3ZlIGNhbGxiYWNrIHRvIHJldHVybiB2b2lkIGRyaXZlciBhdXRob3JzIGNh
bm5vdAo+ID4gcmVhc29uYWJseSBhc3N1bWUgYW55IG1vcmUgdGhhdCB0aGVyZSBpcyBzb21lIGtp
bmQgb2YgY2xlYW51cCBsYXRlci4KPiA+IAo+ID4gT25seSB0aHJlZSBkcml2ZXJzIG5lZWRlZCBz
b21lIHByZXBhcmF0aW9uIGZpcnN0IHRvIG1ha2Ugc3VyZSB0aGV5Cj4gPiByZXR1cm4gMCB1bmNv
bmRpdGlvbmFsbHkgaW4gdGhlaXIgcmVtb3ZlIGNhbGxiYWNrLiBUaGVuIGFsbCBkcml2ZXJzCj4g
PiBjb3VsZCBiZSB0cml2aWFsbHkgY29udmVydGVkIHdpdGhvdXQgc2lkZSBlZmZlY3RzIHRvIC5y
ZW1vdmVfbmV3KCkuCj4gPiAKPiA+IFRoZSBjaGFuZ2VzIHRvIHRoZSBpbmRpdmlkdWFsIGRyaXZl
cnMgYXJlIGFsbCBvcnRob2dvbmFsLiBJZiBJIG5lZWQgdG8KPiA+IHJlc2VuZCBzb21lIHBhdGNo
ZXMgYmVjYXVzZSBvZiBzb21lIHJldmlldyBmZWVkYmFjaywgSSdkIGxpa2UgdG8gb25seQo+ID4g
c2VuZCB0aGUgcGF0Y2hlcyB0aGF0IGFjdHVhbGx5IG5lZWRlZCBjaGFuZ2VzLCBzbyBwbGVhc2Ug
cGljayB1cCB0aGUKPiA+IHJlbWFpbmluZyBwYXRjaGVzIHRoYXQgZG9uJ3QgbmVlZCBjaGFuZ2lu
ZyB0byByZWR1Y2UgdGhlIGFtb3VudCBvZiBtYWlsLgo+IAo+IEkgZGlkbid0IGhlYXIgYW55dGhp
bmcgYmFjayBhYm91dCBhcHBsaWNhdGlvbiBvZiB0aGlzIHNlcmllcy4gSXMgdGhlcmUgYQo+IGJs
b2NrZXIgc29tZXdoZXJlPwoKSSB0aGluayB0aGUgc2VyaWVzIGdvdCBhcHBsaWVkIHRvIHRoZSBt
YXN0ZXIgYnJhbmNoIG9mCmdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9zdGFibGUvbGludXgtc3RhYmxlLmdpdC4KSXQgc2hvdWxkIHRodXMgYXBwZWFyIGluIHY2
LjQuCgpUaGUgY29ycmVzcG9uZGluZyBzZXJpZXMgZm9yIHN0YWdpbmcgbWVkaWEgZHJpdmVycyBo
YXMgYWxzbyBiZWVuIGFwcGxpZWQKdG8gdGhlIHNhbWUgYnJhbmNoIGFzIGZhciBhcyBJIGNhbiB0
ZWxsLgoKPiBBcGFydCBmcm9tIHRoZSB0aHJlZSBwcmVwYXJhdG9yeSBwYXRjaGVzIHRoYXQgYXJl
IGEgcHJlY29uZGl0aW9uIHRvIHRoZQo+IGNvbnZlcnNpb24gb2YgdGhlIHJlc3BlY3RpdmUgZHJp
dmVycywgdGhlIHBhdGNoZXMgYXJlIGFsbCBwYWlyd2lzZQo+IG9ydGhvZ29uYWwuIFNvIGZyb20g
bXkgUE9WIHRoZSBiZXN0IHdvdWxkIGJlIHRvIGFwcGx5IGFsbCBwYXRjaGVzIHRoYXQKPiBzdGls
bCBhcHBseSAod2hpY2ggbWlnaHQgYmUgYWxsKSwgSSB3aWxsIGNhcmUgZm9yIHRoZSBmYWxsb3V0
IGxhdGVyCj4gdGhlbi4KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
