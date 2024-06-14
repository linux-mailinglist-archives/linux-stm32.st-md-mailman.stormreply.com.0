Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E883908C15
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 14:54:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 270B0C6B460;
	Fri, 14 Jun 2024 12:54:15 +0000 (UTC)
Received: from flow6-smtp.messagingengine.com (flow6-smtp.messagingengine.com
 [103.168.172.141])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 473DAC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 12:54:08 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailflow.nyi.internal (Postfix) with ESMTP id 448CD20036F;
 Fri, 14 Jun 2024 08:54:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 14 Jun 2024 08:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1718369647;
 x=1718376847; bh=kzkq65OIpuCs3ZdNQe9hETg6fCuxaq6pJOhxp3W4MzU=; b=
 e/sNUWPzt41ZDlEJ0rbaHgsDAM6/Psb18uSYQwdiX0fvKqE47ANccOOWPj1FonOQ
 N3piZ2RgrxAxEjJLHD/Tjg484eOsFcuuVq5Lcr70+sIdjPfPrUAW50u5y3sYMYwt
 Trz5xVZ4smlNoFkAnnSsSDyXF5f/w9sxJ/aBOlaFkAnTbivmMXznJTEcaPN5esst
 zyZ/mgTiM4RmKRGUwkRbrpD6HKOXu8Yttwi2uS/vWjJZ9+UfahWXIda2sjBXSeur
 U0rI/xNHRV/jZzvLlSDHtRPC5Gz7cllMYqgOp6vzbyaXA0palhobbG5bGWRylVxS
 oDrqU1xuVwRQ6gq/YrP6Sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718369647; x=
 1718376847; bh=kzkq65OIpuCs3ZdNQe9hETg6fCuxaq6pJOhxp3W4MzU=; b=f
 kAY6ikA50Nntgl2wgpRJZ9Ew6563PdZDxBLtifDJkORDnS00MMuwwyv9AsspdeUg
 /HTOJFa71y+TfuEXFBHZaBOJPq0OyU1UrM4fJxxdMVCWfGMPFaxLdgJ2+0SjQ2/q
 ZfO6pl1ptKLd43UMIp4LQA4sXKJv2FsHukJsNNgMErq1IwjgucZOmMiZE5f3QKHB
 ZTyXQEVhj+6eVMMLiVIoEMnKsg2LYlP5j8ffsbsSXJNToBxvOCxvch6Gr1PemQdD
 fL5hHJ2eGvyzxBLi5FrMgq0SawjdEbzWq+ultnPkAFTXQWqoJBF2gvN7ScwuaDKh
 IjX5kLwAzcFwByEYbetyQ==
X-ME-Sender: <xms:aj1sZm0YAf0zlUT593horrfn2ipIf6acHvfVQfKnkssTGEoa8Om9BA>
 <xme:aj1sZpFw2wf-iUC0IxtB5DWqqMMCnfD5VwYNAWttsFCic6kzrQpS8fxftg6pDABVX
 gMRKaPwKQJK1IO1REM>
X-ME-Received: <xmr:aj1sZu6LnfoPNVf1i1OoOxnLt75iGeJAKkFzz6DKNOFoFPlHciJ07OnW_Ab6ov50yRtvLYs0artd5qzgETjo3Il5sf7KbpI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
 lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrgh
 hnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeef
 heetheekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgr
 ghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:aj1sZn3UF-l6IfHHyHpli8od0E7EfKnMJHiNOP4rjDLANiOlZP9VuA>
 <xmx:aj1sZpGLjS1pUc8dzhTkicRu4rXw6-BHkx_QDjbMnwIN4RldTwsGMQ>
 <xmx:aj1sZg9PO3n30TtGNYeLy_c9dRoyMDheA8jU9Iue3Y71RDgWVAyCcg>
 <xmx:aj1sZum0uT3bn8S6g2d5fDuzN3HqD3y4vwBY3flT8LVQkY6RHWszlw>
 <xmx:bz1sZrA4KYFKicBY-9XPwZyWW4hVJJyQ9KBkWa4ddbDjdQZY1aBRj8Ry>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 08:54:01 -0400 (EDT)
Date: Fri, 14 Jun 2024 14:53:59 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240614125359.GH382677@ragnatech.se>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-13-30b25a6ae24e@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-13-30b25a6ae24e@linaro.org>
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Amit Kucheria <amitk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Anson Huang <Anson.Huang@nxp.com>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Florian Fainelli <f.fainelli@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 zhanghongchen <zhanghongchen@loongson.cn>,
 Pascal Paillet <p.paillet@foss.st.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Keerthy <j-keerthy@ti.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH 13/22] dt-bindings: thermal: rcar-gen3:
 reference thermal-sensor schema
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

SGkgS3J6eXN6dG9mLAoKVGhhbmtzIGZvciB5b3VyIHdvcmsuCgpPbiAyMDI0LTA2LTE0IDExOjQ2
OjEyICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IERldmljZSBpcyBhIHRoZXJt
YWwgc2Vuc29yIGFuZCBpdCByZXF1aXJlcyAnI3RoZXJtYWwtc2Vuc29yLWNlbGxzJywgc28KPiBy
ZWZlcmVuY2UgdGhlIHRoZXJtYWwtc2Vuc29yLnlhbWwgdG8gc2ltcGxpZnkgaXQgYW5kIGJyaW5n
IHRoZQo+IGNvbW1vbiBkZWZpbml0aW9uIG9mICcjdGhlcm1hbC1zZW5zb3ItY2VsbHMnIHByb3Bl
cnR5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBOaWtsYXMgU8O2ZGVybHVuZCA8bmlr
bGFzLnNvZGVybHVuZCtyZW5lc2FzQHJhZ25hdGVjaC5zZT4KCj4gLS0tCj4gIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL3JjYXItZ2VuMy10aGVybWFsLnlhbWwgfCA1
ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVy
bWFsL3JjYXItZ2VuMy10aGVybWFsLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdGhlcm1hbC9yY2FyLWdlbjMtdGhlcm1hbC55YW1sCj4gaW5kZXggNmE4MWNiNmUxMWJj
Li5kOTJlODgyYzllOGQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3RoZXJtYWwvcmNhci1nZW4zLXRoZXJtYWwueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL3JjYXItZ2VuMy10aGVybWFsLnlhbWwKPiBA
QCAtMTUsNiArMTUsOCBAQCBkZXNjcmlwdGlvbjoKPiAgbWFpbnRhaW5lcnM6Cj4gICAgLSBOaWts
YXMgU8O2ZGVybHVuZCA8bmlrbGFzLnNvZGVybHVuZEByYWduYXRlY2guc2U+Cj4gIAo+ICskcmVm
OiB0aGVybWFsLXNlbnNvci55YW1sIwo+ICsKPiAgcHJvcGVydGllczoKPiAgICBjb21wYXRpYmxl
Ogo+ICAgICAgZW51bToKPiBAQCAtNTcsNyArNTksNiBAQCByZXF1aXJlZDoKPiAgICAtIGNsb2Nr
cwo+ICAgIC0gcG93ZXItZG9tYWlucwo+ICAgIC0gcmVzZXRzCj4gLSAgLSAiI3RoZXJtYWwtc2Vu
c29yLWNlbGxzIgo+ICAKPiAgaWY6Cj4gICAgcHJvcGVydGllczoKPiBAQCAtOTYsNyArOTcsNyBA
QCBlbHNlOgo+ICAgICAgcmVxdWlyZWQ6Cj4gICAgICAgIC0gaW50ZXJydXB0cwo+ICAKPiAtYWRk
aXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UK
PiAgCj4gIGV4YW1wbGVzOgo+ICAgIC0gfAo+IAo+IC0tIAo+IDIuNDMuMAo+IAoKLS0gCktpbmQg
UmVnYXJkcywKTmlrbGFzIFPDtmRlcmx1bmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
