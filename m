Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F40FE6F81A7
	for <lists+linux-stm32@lfdr.de>; Fri,  5 May 2023 13:25:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8FE5C6907C;
	Fri,  5 May 2023 11:25:53 +0000 (UTC)
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D661FC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 May 2023 11:25:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id EAC902B067B4;
 Fri,  5 May 2023 07:25:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 05 May 2023 07:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1683285945; x=1683293145; bh=UQKDjmKPSzC7x5C95cs9YOZc6yAVPvrTJ4b
 1utEyhQs=; b=UDQJjfgae9Jy0KKyFS0jdkkFbIHInOjJANJqIPxcx2irxjptzoa
 sOkGAs/Z2RiPml73V/Dyqz18ojQmjuG0m5k2qzRasE2wOduD0CM8Clamakjgpmr6
 cCDoP9q1ou3E91lXfG3zQq94jjWZw7UtQ4ecrXCJNgsgnb0RX7vXIXcU3WAaEa7D
 PrLAjPWKmGuGUZB+qjmy3wiVkZUpVewbtTrg5ySbFZP8gV1D1a8ytRBQ6oMOsLEw
 5e92vJbN6fb877F8q/bLcn8jg76/PM41W/zJ3tFHn9N3jA4plS5kcc3kJ+o8zzms
 2jftE0cuihiOeKakfTVrSqvLxUNW+XVhkgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1683285945; x=1683293145; bh=UQKDjmKPSzC7x5C95cs9YOZc6yAVPvrTJ4b
 1utEyhQs=; b=eETp/afWAPWzhC0ojTjFS4E2W8DChqKPKekP/EPuz5wcqmFBedN
 ZE+2I5zoeVPXyzKsIEvFVqbdeKASr4jE/E0HiMkzTedmCrKH7DHijuv1Pr0iz6lm
 mkw6mO2IYBh/nuQLdyKHPD9sAPZo6XHnTGzbJmn9B/JRjfopvt9kUHSt7K7spG5U
 mWrJ8HMVdVXDUOfwWRWWOBbcosSLQzfxtxBGfoiLaSQVUQQwmLExj8nwhCziNLGx
 3WVMizySGqhM98PNWHHPcW+udXkQtb9aSDcQw/m31nJjuplyRlOmetOHAEsIxyUq
 98B8xE3APjy+uJkG8FtMHjn7l8Mdn0KBGkg==
X-ME-Sender: <xms:uOdUZNj3ZpRewkMtfxJ6-ctpOTk2iZx5Ay1l69YUkk0t1y1bBktOIw>
 <xme:uOdUZCCzmcX3Ogu0_MvnPgEHEe5QuKkoSeQ39kZDFWs5CBbm3W3hi8pMTy23Haspl
 MBMYjdHw32Wvd2ycdQ>
X-ME-Received: <xmr:uOdUZNFcQBLQLsDsGRahkPNFqahy8ULrpN3NGsH_y-MOTDZwMw-Gom31V1u7tVnIPIHyGwtAF-f649-KhACFYqJrLXRbNVI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:uOdUZCS3WqyF5n_W3EiJVuNpMnHgAXUa1OpdnFRLa8UYUgd11F-oNg>
 <xmx:uOdUZKwWniyq1PrG5KiKO_9_icEmzUCRDxijmAeCZ0CdvgtAjfwv1A>
 <xmx:uOdUZI7LJJc_HfCtyAo4xAEhts_dpqgNb42EzjXV5B62USvVCiTKVQ>
 <xmx:uedUZK5NUkPOnYhg1Pw5l4WoybZn50aZGTzwuONG_b-ZzRWQ6TMX7TYzgTw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:25:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 05 May 2023 13:25:05 +0200
MIME-Version: 1.0
Message-Id: <20221018-clk-range-checks-fixes-v4-3-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5599; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Pxa6LrZe1o/eBr4UI7umXibSzTm/MpQguARoHEO5XCk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxc5Rstf2bExQeEn73VnY64JKuoy700DJTb9UzzofGj6
 AUHmjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzk3AyGf/Zn+S0ni19r774wuWmK42
 TRba9ZDL7d93cNy5IJu/ex8zjD/2SHmTwr1himMz9fPun629N1J8OVT1ytvTFn9681xQe/X+YAAA==
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Peng Fan <peng.fan@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, linux-phy@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Orson Zhai <orsonzhai@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mips@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-sunxi@lists.linux.dev, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-rtc@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 David Lechner <david@lechnology.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Miles Chen <miles.chen@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: [Linux-stm32] [PATCH v4 03/68] clk: Move no reparent case into a
 separate function
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

RnJvbTogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPgoKV2UnbGwgbmVlZCB0byB0dXJu
IHRoZSBjb2RlIGluIGNsa19tdXhfZGV0ZXJtaW5lX3JhdGVfZmxhZ3MoKSB0byBkZWFsCndpdGgg
Q0xLX1NFVF9SQVRFX05PX1JFUEFSRU5UIGludG8gYSBoZWxwZXIgY2xvY2sgZHJpdmVycyB3aWxs
IGJlIGFibGUKdG8gdXNlIGlmIHRoZXkgZG9uJ3Qgd2FudCB0byBhbGxvdyByZXBhcmVudGluZy4K
CkNjOiBBYmVsIFZlc2EgPGFiZWx2ZXNhQGtlcm5lbC5vcmc+CkNjOiBBbGVzc2FuZHJvIFp1bW1v
IDxhLnp1bW1vQHRvd2VydGVjaC5pdD4KQ2M6IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUu
YmVsbG9uaUBib290bGluLmNvbT4KQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3Jn
dWVAZm9zcy5zdC5jb20+CkNjOiAiQW5kcmVhcyBGw6RyYmVyIiA8YWZhZXJiZXJAc3VzZS5kZT4K
Q2M6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25v
QGNvbGxhYm9yYS5jb20+CkNjOiBCYW9saW4gV2FuZyA8YmFvbGluLndhbmdAbGludXguYWxpYmFi
YS5jb20+CkNjOiBDaGFybGVzIEtlZXBheCA8Y2tlZXBheEBvcGVuc291cmNlLmNpcnJ1cy5jb20+
CkNjOiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+CkNjOiBDaGVuLVl1IFRzYWkgPHdlbnN0
QGNocm9taXVtLm9yZz4KQ2M6IENodW55YW4gWmhhbmcgPHpoYW5nLmx5cmFAZ21haWwuY29tPgpD
YzogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+CkNjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21h
aWwuY29tPgpDYzogRGF2aWQgTGVjaG5lciA8ZGF2aWRAbGVjaG5vbG9neS5jb20+CkNjOiBEaW5o
IE5ndXllbiA8ZGluZ3V5ZW5Aa2VybmVsLm9yZz4KQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFt
QGdtYWlsLmNvbT4KQ2M6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIu
YmU+CkNjOiBKYXJvc2xhdiBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6PgpDYzogSmVybmVqIFNrcmFi
ZWMgPGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT4KQ2M6IEpvbmF0aGFuIEh1bnRlciA8am9uYXRo
YW5oQG52aWRpYS5jb20+CkNjOiBLaXNob24gVmlqYXkgQWJyYWhhbSBJIDxraXNob25Aa2VybmVs
Lm9yZz4KQ2M6IExpYW0gR2lyZHdvb2QgPGxnaXJkd29vZEBnbWFpbC5jb20+CkNjOiBMaW51cyBX
YWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CkNjOiBMdWNhIENlcmVzb2xpIDxsdWNh
LmNlcmVzb2xpQGJvb3RsaW4uY29tPgpDYzogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtl
cm5lbC5vcmc+CkNjOiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+CkNjOiBNYXJrdXMg
U2NobmVpZGVyLVBhcmdtYW5uIDxtc3BAYmF5bGlicmUuY29tPgpDYzogTWF4IEZpbGlwcG92IDxq
Y212YmtiY0BnbWFpbC5jb20+CkNjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBn
bWFpbC5jb20+CkNjOiBNaWtrbyBQZXJ0dHVuZW4gPG1wZXJ0dHVuZW5AbnZpZGlhLmNvbT4KQ2M6
IE1pbGVzIENoZW4gPG1pbGVzLmNoZW5AbWVkaWF0ZWsuY29tPgpDYzogTmljb2xhcyBGZXJyZSA8
bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAuY29tPgpDYzogT3Jzb24gWmhhaSA8b3Jzb256aGFpQGdt
YWlsLmNvbT4KQ2M6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PgpDYzogUGVu
ZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+CkNjOiBQZXRlciBEZSBTY2hyaWp2ZXIgPHBkZXNjaHJp
anZlckBudmlkaWEuY29tPgpDYzogUHJhc2hhbnQgR2Fpa3dhZCA8cGdhaWt3YWRAbnZpZGlhLmNv
bT4KQ2M6IFJpY2hhcmQgRml0emdlcmFsZCA8cmZAb3BlbnNvdXJjZS5jaXJydXMuY29tPgpDYzog
U2FtdWVsIEhvbGxhbmQgPHNhbXVlbEBzaG9sbGFuZC5vcmc+CkNjOiBTYXNjaGEgSGF1ZXIgPHMu
aGF1ZXJAcGVuZ3V0cm9uaXguZGU+CkNjOiBTZWtoYXIgTm9yaSA8bnNla2hhckB0aS5jb20+CkNj
OiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+CkNjOiBUYWthc2hpIEl3YWkgPHRpd2Fp
QHN1c2UuY29tPgpDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4K
Q2M6IFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPgpDYzogVmlub2QgS291bCA8
dmtvdWxAa2VybmVsLm9yZz4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6
IGxpbnV4LWFjdGlvbnNAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZwpDYzogbGlu
dXgtcGh5QGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2Vy
bmVsLm9yZwpDYzogbGludXgtcnRjQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpDYzogbGludXgtc3VueGlAbGlzdHMubGludXguZGV2
CkNjOiBsaW51eC10ZWdyYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IE5YUCBMaW51eCBUZWFtIDxsaW51
eC1pbXhAbnhwLmNvbT4KQ2M6IHBhdGNoZXNAb3BlbnNvdXJjZS5jaXJydXMuY29tCkNjOiBQZW5n
dXRyb25peCBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5
OiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IE1heGltZSBS
aXBhcmQgPG1heGltZUBjZXJuby50ZWNoPgotLS0KIGRyaXZlcnMvY2xrL2Nsay5jIHwgNzUgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvY2xrL2Nsay5jIGIvZHJpdmVycy9jbGsvY2xrLmMKaW5kZXggZTQ5NWRkN2Ex
ZWFlLi5mNTdmODIxYTVlNWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL2Nsay5jCisrKyBiL2Ry
aXZlcnMvY2xrL2Nsay5jCkBAIC01OTQsNiArNTk0LDQ2IEBAIGNsa19jb3JlX2ZvcndhcmRfcmF0
ZV9yZXEoc3RydWN0IGNsa19jb3JlICpjb3JlLAogCQlyZXEtPm1heF9yYXRlID0gb2xkX3JlcS0+
bWF4X3JhdGU7CiB9CiAKK3N0YXRpYyBpbnQKK2Nsa19jb3JlX2RldGVybWluZV9yYXRlX25vX3Jl
cGFyZW50KHN0cnVjdCBjbGtfaHcgKmh3LAorCQkJCSAgICBzdHJ1Y3QgY2xrX3JhdGVfcmVxdWVz
dCAqcmVxKQoreworCXN0cnVjdCBjbGtfY29yZSAqY29yZSA9IGh3LT5jb3JlOworCXN0cnVjdCBj
bGtfY29yZSAqcGFyZW50ID0gY29yZS0+cGFyZW50OworCXVuc2lnbmVkIGxvbmcgYmVzdDsKKwlp
bnQgcmV0OworCisJaWYgKGNvcmUtPmZsYWdzICYgQ0xLX1NFVF9SQVRFX1BBUkVOVCkgeworCQlz
dHJ1Y3QgY2xrX3JhdGVfcmVxdWVzdCBwYXJlbnRfcmVxOworCisJCWlmICghcGFyZW50KSB7CisJ
CQlyZXEtPnJhdGUgPSAwOworCQkJcmV0dXJuIDA7CisJCX0KKworCQljbGtfY29yZV9mb3J3YXJk
X3JhdGVfcmVxKGNvcmUsIHJlcSwgcGFyZW50LCAmcGFyZW50X3JlcSwKKwkJCQkJICByZXEtPnJh
dGUpOworCisJCXRyYWNlX2Nsa19yYXRlX3JlcXVlc3Rfc3RhcnQoJnBhcmVudF9yZXEpOworCisJ
CXJldCA9IGNsa19jb3JlX3JvdW5kX3JhdGVfbm9sb2NrKHBhcmVudCwgJnBhcmVudF9yZXEpOwor
CQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKworCQl0cmFjZV9jbGtfcmF0ZV9yZXF1ZXN0X2Rv
bmUoJnBhcmVudF9yZXEpOworCisJCWJlc3QgPSBwYXJlbnRfcmVxLnJhdGU7CisJfSBlbHNlIGlm
IChwYXJlbnQpIHsKKwkJYmVzdCA9IGNsa19jb3JlX2dldF9yYXRlX25vbG9jayhwYXJlbnQpOwor
CX0gZWxzZSB7CisJCWJlc3QgPSBjbGtfY29yZV9nZXRfcmF0ZV9ub2xvY2soY29yZSk7CisJfQor
CisJcmVxLT5yYXRlID0gYmVzdDsKKworCXJldHVybiAwOworfQorCiBpbnQgY2xrX211eF9kZXRl
cm1pbmVfcmF0ZV9mbGFncyhzdHJ1Y3QgY2xrX2h3ICpodywKIAkJCQkgc3RydWN0IGNsa19yYXRl
X3JlcXVlc3QgKnJlcSwKIAkJCQkgdW5zaWduZWQgbG9uZyBmbGFncykKQEAgLTYwMywzNSArNjQz
LDggQEAgaW50IGNsa19tdXhfZGV0ZXJtaW5lX3JhdGVfZmxhZ3Moc3RydWN0IGNsa19odyAqaHcs
CiAJdW5zaWduZWQgbG9uZyBiZXN0ID0gMDsKIAogCS8qIGlmIE5PX1JFUEFSRU5UIGZsYWcgc2V0
LCBwYXNzIHRocm91Z2ggdG8gY3VycmVudCBwYXJlbnQgKi8KLQlpZiAoY29yZS0+ZmxhZ3MgJiBD
TEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQpIHsKLQkJcGFyZW50ID0gY29yZS0+cGFyZW50OwotCQlp
ZiAoY29yZS0+ZmxhZ3MgJiBDTEtfU0VUX1JBVEVfUEFSRU5UKSB7Ci0JCQlzdHJ1Y3QgY2xrX3Jh
dGVfcmVxdWVzdCBwYXJlbnRfcmVxOwotCi0JCQlpZiAoIXBhcmVudCkgewotCQkJCXJlcS0+cmF0
ZSA9IDA7Ci0JCQkJcmV0dXJuIDA7Ci0JCQl9Ci0KLQkJCWNsa19jb3JlX2ZvcndhcmRfcmF0ZV9y
ZXEoY29yZSwgcmVxLCBwYXJlbnQsICZwYXJlbnRfcmVxLCByZXEtPnJhdGUpOwotCi0JCQl0cmFj
ZV9jbGtfcmF0ZV9yZXF1ZXN0X3N0YXJ0KCZwYXJlbnRfcmVxKTsKLQotCQkJcmV0ID0gY2xrX2Nv
cmVfcm91bmRfcmF0ZV9ub2xvY2socGFyZW50LCAmcGFyZW50X3JlcSk7Ci0JCQlpZiAocmV0KQot
CQkJCXJldHVybiByZXQ7Ci0KLQkJCXRyYWNlX2Nsa19yYXRlX3JlcXVlc3RfZG9uZSgmcGFyZW50
X3JlcSk7Ci0KLQkJCWJlc3QgPSBwYXJlbnRfcmVxLnJhdGU7Ci0JCX0gZWxzZSBpZiAocGFyZW50
KSB7Ci0JCQliZXN0ID0gY2xrX2NvcmVfZ2V0X3JhdGVfbm9sb2NrKHBhcmVudCk7Ci0JCX0gZWxz
ZSB7Ci0JCQliZXN0ID0gY2xrX2NvcmVfZ2V0X3JhdGVfbm9sb2NrKGNvcmUpOwotCQl9Ci0KLQkJ
Z290byBvdXQ7Ci0JfQorCWlmIChjb3JlLT5mbGFncyAmIENMS19TRVRfUkFURV9OT19SRVBBUkVO
VCkKKwkJcmV0dXJuIGNsa19jb3JlX2RldGVybWluZV9yYXRlX25vX3JlcGFyZW50KGh3LCByZXEp
OwogCiAJLyogZmluZCB0aGUgcGFyZW50IHRoYXQgY2FuIHByb3ZpZGUgdGhlIGZhc3Rlc3QgcmF0
ZSA8PSByYXRlICovCiAJbnVtX3BhcmVudHMgPSBjb3JlLT5udW1fcGFyZW50czsKQEAgLTY3MCw5
ICs2ODMsNyBAQCBpbnQgY2xrX211eF9kZXRlcm1pbmVfcmF0ZV9mbGFncyhzdHJ1Y3QgY2xrX2h3
ICpodywKIAlpZiAoIWJlc3RfcGFyZW50KQogCQlyZXR1cm4gLUVJTlZBTDsKIAotb3V0OgotCWlm
IChiZXN0X3BhcmVudCkKLQkJcmVxLT5iZXN0X3BhcmVudF9odyA9IGJlc3RfcGFyZW50LT5odzsK
KwlyZXEtPmJlc3RfcGFyZW50X2h3ID0gYmVzdF9wYXJlbnQtPmh3OwogCXJlcS0+YmVzdF9wYXJl
bnRfcmF0ZSA9IGJlc3Q7CiAJcmVxLT5yYXRlID0gYmVzdDsKIAoKLS0gCjIuNDAuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
