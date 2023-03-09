Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D13976B2321
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 12:35:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DF54C6A60C;
	Thu,  9 Mar 2023 11:35:23 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A47C0C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 11:35:21 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0D53E1C000A;
 Thu,  9 Mar 2023 11:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1678361721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YkCJYe4xTl1nq4LBH2Nzf6GB3+OQQsqPo2Fge4ocTUs=;
 b=hiIMPBEnM9/0A6RUHYRZqxFHogmol9ukA6pSF9yyH7WStCrXbZROuFrMCgPWYlCuvRnkhD
 gSVPsluMhNKX56RZrjnI61iTpBTA4waKAQ6JqeRqsvyo/IWOPAl/QL51nSDgAxSyu94yKy
 PIn9wIRH2IZFlmKfSzqKCR71LaKiGkrD/HSgaRQb245/oFmYH13le2EXgsHsrIH75UqLz3
 Z11W3tJOxR+vBh6gHjbD5FbyG6FnNCzR4oHH8uG2wNHJnoqWJ9ZmEH7DlYcnZLCUcl1gLD
 mNnKh0EMvdHeQcM3phRrh+OldNLWfiXLDIRmHeLX33lUlMygrtc3mKklFPVC1A==
Date: Thu, 9 Mar 2023 12:35:13 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <20230309123513.43b7134f@xps-13>
In-Reply-To: <20230309112028.19215-1-zajec5@gmail.com>
References: <20230309112028.19215-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Walle <michael@walle.cc>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH V3] nvmem: add explicit config option to
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgUmFmYcWCLAoKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5o
IGIvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oCj4gaW5kZXggMDI2MmI4NjE5NGViLi5i
M2MxNGNlODdhNjUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5o
Cj4gKysrIGIvaW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oCj4gQEAgLTczLDYgKzczLDcg
QEAgc3RydWN0IG52bWVtX2NlbGxfaW5mbyB7Cj4gICAqIEBvd25lcjoJUG9pbnRlciB0byBleHBv
cnRlciBtb2R1bGUuIFVzZWQgZm9yIHJlZmNvdW50aW5nLgo+ICAgKiBAY2VsbHM6CU9wdGlvbmFs
IGFycmF5IG9mIHByZS1kZWZpbmVkIE5WTUVNIGNlbGxzLgo+ICAgKiBAbmNlbGxzOglOdW1iZXIg
b2YgZWxlbWVudHMgaW4gY2VsbHMuCj4gKyAqIEB1c2VfZml4ZWRfb2ZfY2VsbHM6CVJlYWQgZml4
ZWQgTlZNRU0gY2VsbHMgZnJvbSBPRi4KCkknbSBzdGlsbCB1bmhhcHB5IHdpdGggdGhlIG5hbWlu
ZywgZXNwZWNpYWxseSBzaW5jZSB5b3UgZXhwbGFpbmVkIGluCm1vcmUgZGV0YWlscyB0aGUgd2hv
bGUgcGxhbiB3aGljaCBpbnZvbHZlcyB1c2luZyBhIGNvbnRhaW5lciB0byBwdXQKdGhlc2UgZml4
ZWQgY2VsbHMgZnJvbSBub3cgb24uIEluIGJvdGggY2FzZXMgeW91IGV4dHJhY3QgY2VsbHMgZnJv
bQpmaXhlZCBPRiBub2RlcyBidXQgdGhpcyBib29sZWFuIG5lZWRzIHRvIGJlIHNldCB0byB0cnVl
IGluIG9uZQpjYXNlLCBhbmQgZmFsc2UgaW4gdGhlIG90aGVyLCB3aGljaCB3b3VsZCBub3QgbWFr
ZSBzZW5zZS4KCkFsc28sIHJlZ2FyZGluZyB0aGUgYmluZGluZ3MgY2hhbmdlcywgSSdtIGZhaXJs
eSBoYXBweSB3aXRoIHRoZSBpZGVhLApidXQgaWYgd2UgZ28gdGhpcyB3YXkgSSB3b3VsZCBwcmVm
ZXIgYSBmdWxsIHNlcmllcyBpbnN0ZWFkIG9mCmluZGl2aWR1YWwgY2hhbmdlcyB3aXRoOgoKLSB0
aGUgYm9vbGVhbiB5b3UgaW50cm9kdWNlIGhlcmUgKHJlbmFtZWQsIGF0IHRoZSB2ZXJ5IGxlYXN0
KQotIHRoZSBuZXcgYmluZGluZ3MKLSB0aGUgdXBkYXRlIG9mIHRoZSBjdXJyZW50IHByb3ZpZGVy
IGJpbmRpbmdzIHRvIHRha2UgdGhlIG5ldyBiaW5kaW5ncwogIGludG8gYWNjb3VudCBhbmQgZGVw
cmVjYXRlIHRoZSBvbGQgb25lcyBvZmZpY2lhbGx5Ci0gc3VwcG9ydCBmb3IgdGhlIG5ldyBiaW5k
aW5ncyBpbiB0aGUgY29yZQoKPiAgICogQGtlZXBvdXQ6CU9wdGlvbmFsIGFycmF5IG9mIGtlZXBv
dXQgcmFuZ2VzIChzb3J0ZWQgYXNjZW5kaW5nIGJ5IHN0YXJ0KS4KPiAgICogQG5rZWVwb3V0OglO
dW1iZXIgb2YgZWxlbWVudHMgaW4gdGhlIGtlZXBvdXQgYXJyYXkuCj4gICAqIEB0eXBlOglUeXBl
IG9mIHRoZSBudm1lbSBzdG9yYWdlCj4gQEAgLTEwMyw2ICsxMDQsNyBAQCBzdHJ1Y3QgbnZtZW1f
Y29uZmlnIHsKPiAgCXN0cnVjdCBtb2R1bGUJCSpvd25lcjsKPiAgCWNvbnN0IHN0cnVjdCBudm1l
bV9jZWxsX2luZm8JKmNlbGxzOwo+ICAJaW50CQkJbmNlbGxzOwo+ICsJYm9vbAkJCXVzZV9maXhl
ZF9vZl9jZWxsczsKPiAgCWNvbnN0IHN0cnVjdCBudm1lbV9rZWVwb3V0ICprZWVwb3V0Owo+ICAJ
dW5zaWduZWQgaW50CQlua2VlcG91dDsKPiAgCWVudW0gbnZtZW1fdHlwZQkJdHlwZTsKClRoYW5r
cywKTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
