Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F4F766852
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jul 2023 11:10:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35A18C6B466;
	Fri, 28 Jul 2023 09:10:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E43BBC6B45D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jul 2023 09:10:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4A2662086;
 Fri, 28 Jul 2023 09:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF74C433C7;
 Fri, 28 Jul 2023 09:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690535437;
 bh=jsukJ3h2ilmz083UcYGengZNcUIJYlLHWk6g/LKxW1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jq54e2P2vabTsv0/ZkCTu/TtAKcPA/986KlVzpTtjaLAFsettUVGxIIEhV012qHmY
 XjZnDjmAeW2ab1ZsUURkM7jE4L/524t63e/2b+AR7jZDEQXiyB3jMa2BRjo+JEpwRs
 l3QdUPJ8w/4urXWddV+VETsCyali7ZkVGVcRJ/K6g+RVz5T9C+bf9WioC+uygEDa9I
 Rh3AvZFW0PdulmDiZySwu0Xy2XsI/jHB3Xyi77hPM/dAwa7KUnEsd9+KEupPqjueWP
 u1x3RpBtfjI/oksjIHjYF89qn/jUU3ZW18drI+6RQKSDrQ5SYoMzV9cMfadNlCraZU
 lW9h48LazI1/g==
Date: Fri, 28 Jul 2023 10:10:24 +0100
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20230728091024.GE8175@google.com>
References: <20230714174731.4059811-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230714174731.4059811-1-robh@kernel.org>
Cc: Thor Thayer <thor.thayer@linux.intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Guenter Roeck <groeck@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Support Opensource <support.opensource@diasemi.com>,
 patches@opensource.cirrus.com, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [Linux-stm32] [PATCH] mfd: Explicitly include correct DT
	includes
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

T24gRnJpLCAxNCBKdWwgMjAyMywgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IFRoZSBEVCBvZl9kZXZp
Y2UuaCBhbmQgb2ZfcGxhdGZvcm0uaCBkYXRlIGJhY2sgdG8gdGhlIHNlcGFyYXRlCj4gb2ZfcGxh
dGZvcm1fYnVzX3R5cGUgYmVmb3JlIGl0IGFzIG1lcmdlZCBpbnRvIHRoZSByZWd1bGFyIHBsYXRm
b3JtIGJ1cy4KPiBBcyBwYXJ0IG9mIHRoYXQgbWVyZ2UgcHJlcHBpbmcgQXJtIERUIHN1cHBvcnQg
MTMgeWVhcnMgYWdvLCB0aGV5Cj4gInRlbXBvcmFyaWx5IiBpbmNsdWRlIGVhY2ggb3RoZXIuIFRo
ZXkgYWxzbyBpbmNsdWRlIHBsYXRmb3JtX2RldmljZS5oCj4gYW5kIG9mLmguIEFzIGEgcmVzdWx0
LCB0aGVyZSdzIGEgcHJldHR5IG11Y2ggcmFuZG9tIG1peCBvZiB0aG9zZSBpbmNsdWRlCj4gZmls
ZXMgdXNlZCB0aHJvdWdob3V0IHRoZSB0cmVlLiBJbiBvcmRlciB0byBkZXRhbmdsZSB0aGVzZSBo
ZWFkZXJzIGFuZAo+IHJlcGxhY2UgdGhlIGltcGxpY2l0IGluY2x1ZGVzIHdpdGggc3RydWN0IGRl
Y2xhcmF0aW9ucywgdXNlcnMgbmVlZCB0bwo+IGV4cGxpY2l0bHkgaW5jbHVkZSB0aGUgY29ycmVj
dCBpbmNsdWRlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9hYjg1MDAtY29yZS5jICAgICAgICAgICB8IDEgLQo+
ICBkcml2ZXJzL21mZC9hY2VyLWVjLWE1MDAuYyAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9t
ZmQvYWN0ODk0NWEuYyAgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvbWZkL2FsdGVyYS1z
eXNtZ3IuYyAgICAgICAgIHwgMyArLS0KPiAgZHJpdmVycy9tZmQvYXJpem9uYS1jb3JlLmMgICAg
ICAgICAgfCAxIC0KPiAgZHJpdmVycy9tZmQvYXRjMjYweC1jb3JlLmMgICAgICAgICAgfCAxIC0K
PiAgZHJpdmVycy9tZmQvYmNtNTkweHguYyAgICAgICAgICAgICAgfCAxIC0KPiAgZHJpdmVycy9t
ZmQvY3Jvc19lY19kZXYuYyAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvbWZkL2RhOTA1Mi1p
MmMuYyAgICAgICAgICAgIHwgNSArLS0tLQo+ICBkcml2ZXJzL21mZC9kYTkwNTUtaTJjLmMgICAg
ICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL21mZC9kYTkwNjItY29yZS5jICAgICAgICAgICB8IDIg
Ky0KPiAgZHJpdmVycy9tZmQvaGk2NTV4LXBtaWMuYyAgICAgICAgICAgfCA0ICsrLS0KPiAgZHJp
dmVycy9tZmQvaXFzNjJ4LmMgICAgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvbWZkL2xw
ODczeC5jICAgICAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL21mZC9tYWRlcmEtaTJjLmMg
ICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL21mZC9tYWRlcmEtc3BpLmMgICAgICAgICAgICB8
IDEgLQo+ICBkcml2ZXJzL21mZC9tYXg3NzYyMC5jICAgICAgICAgICAgICB8IDEgLQo+ICBkcml2
ZXJzL21mZC9tYXg3NzY4Ni5jICAgICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL21mZC9tYXg3
Nzg0My5jICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9tZmQvbWF4ODkwNy5jICAgICAg
ICAgICAgICAgfCAxIC0KPiAgZHJpdmVycy9tZmQvbWF4ODkyNS1jb3JlLmMgICAgICAgICAgfCAx
IC0KPiAgZHJpdmVycy9tZmQvbWF4ODk5Ny5jICAgICAgICAgICAgICAgfCAxIC0KPiAgZHJpdmVy
cy9tZmQvbWF4ODk5OC5jICAgICAgICAgICAgICAgfCAxIC0KPiAgZHJpdmVycy9tZmQvbXQ2MzU4
LWlycS5jICAgICAgICAgICAgfCA1ICsrLS0tCj4gIGRyaXZlcnMvbWZkL210NjM5Ny1jb3JlLmMg
ICAgICAgICAgIHwgNSArKystLQo+ICBkcml2ZXJzL21mZC9tdDYzOTctaXJxLmMgICAgICAgICAg
ICB8IDUgKystLS0KPiAgZHJpdmVycy9tZmQvcGFsbWFzLmMgICAgICAgICAgICAgICAgfCAzICsr
LQo+ICBkcml2ZXJzL21mZC9xY29tLXBtODAwOC5jICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVy
cy9tZmQvcmF2ZS1zcC5jICAgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvbWZkL3JrOHh4
LWNvcmUuYyAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL21mZC9yb2htLWJkNzE4MjguYyAg
ICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9tZmQvcm9obS1iZDcxOHg3LmMgICAgICAgICAgfCAy
ICstCj4gIGRyaXZlcnMvbWZkL3JvaG0tYmQ5NTc2LmMgICAgICAgICAgIHwgMiArLQo+ICBkcml2
ZXJzL21mZC9ydDUwMzMuYyAgICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9tZmQvcnot
bXR1My5jICAgICAgICAgICAgICAgfCA0ICsrKy0KPiAgZHJpdmVycy9tZmQvc2VjLWNvcmUuYyAg
ICAgICAgICAgICAgfCAyIC0tCj4gIGRyaXZlcnMvbWZkL3NwcmQtc2MyN3h4LXNwaS5jICAgICAg
IHwgMiArLQo+ICBkcml2ZXJzL21mZC9zc2JpLmMgICAgICAgICAgICAgICAgICB8IDYgKysrLS0t
Cj4gIGRyaXZlcnMvbWZkL3N0bTMyLWxwdGltZXIuYyAgICAgICAgIHwgMSArCj4gIGRyaXZlcnMv
bWZkL3N0bTMyLXRpbWVycy5jICAgICAgICAgIHwgMSArCj4gIGRyaXZlcnMvbWZkL3N1bjRpLWdw
YWRjLmMgICAgICAgICAgIHwgNCArKy0tCj4gIGRyaXZlcnMvbWZkL3RpLWxtdS5jICAgICAgICAg
ICAgICAgIHwgMSAtCj4gIGRyaXZlcnMvbWZkL3RpX2FtMzM1eF90c2NhZGMuYyAgICAgIHwgMiAr
LQo+ICBkcml2ZXJzL21mZC90cHM2NTA3eC5jICAgICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJz
L21mZC90cHM2NTA5MC5jICAgICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL21mZC90cHM2NTIx
Ny5jICAgICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL21mZC90cHM2NTIxOC5jICAgICAgICAg
ICAgICB8IDEgLQo+ICBkcml2ZXJzL21mZC90cHM2NTk0LWNvcmUuYyAgICAgICAgICB8IDIgKy0K
PiAgZHJpdmVycy9tZmQvdHdsNjA0MC5jICAgICAgICAgICAgICAgfCAyIC0tCj4gIGRyaXZlcnMv
bWZkL3dtODMxeC1jb3JlLmMgICAgICAgICAgIHwgMyArLS0KPiAgZHJpdmVycy9tdGQvY2hpcHMv
Y2ZpX2NtZHNldF8wMDAyLmMgfCAzICstLQo+ICA1MSBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRp
b25zKCspLCA2NiBkZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcwoKLS0gCkxlZSBKb25lcyBb
5p2O55C85pavXQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
