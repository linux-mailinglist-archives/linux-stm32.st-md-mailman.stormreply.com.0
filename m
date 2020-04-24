Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBE11B7177
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 12:05:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB6B8C36B0B;
	Fri, 24 Apr 2020 10:05:33 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BC3DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 10:05:31 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id e26so9792773wmk.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 03:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9sjFX/xOuzJ1ma+dRdm2U+QjBqHkdZ65sP7ssS65XRA=;
 b=xAChQZOcypsVjlU+KN7lBfFG4SyTb5KqpLWyOQk/HBgA4pxxYLt4W8HT40QHNHXuND
 SswVB8FxgipX++pkVkNaR8M0DfByM4uDfkV53KNc4F5e6gJFsB9XHfb1TFm/2mDjj8Uc
 uHh8BI5lk8qcPlr5pEMiFvBX+jXNaT02cBtzNzPBJPh69OEV+jpcyTHpr4SdOghEoZIU
 v1OlHZN+G+JW/diBuCUtuB14n/P3lLlrOBJwuE9o3XWMMpSmq0ECmhNQ7aW/nWTD5grS
 DligmM3LZkudrG+F/7/ksSB/84dWjDY/jqXCwlo/6VXVr/o9HaXAqcqRhGuBlatN+3ph
 7fIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9sjFX/xOuzJ1ma+dRdm2U+QjBqHkdZ65sP7ssS65XRA=;
 b=NPx/8GGQInrJc6kzo0klvnfpLr7bkPBjFWjfh3+oD5ugthH6hIgC0xnIRLE4kOpxoN
 jCGDxg1QdKfXp4SNJErB9xVlJlBeUlscsuBRLkJLgXMyMpTQVWnYVOwcAX9RUi1Gjzf3
 3K1dvDZNANd4+K/UgaVccCVZkZjd1/u+BW8BIqjzJ1Ieh0B1gmmuEPEeBk9ura0Q9YRp
 p6u91o/RQnRCHLSKN8moHNYodLnCNSJIiCumzQ2SjNRX+eacvNaHSVKKpAi/bnjmSTK8
 3XsND1eQhlw8hc65yfRUuGjcnqzo9g1HVqJw7OeMi+jmM+mqj0CY72uj+vM4sKadZY68
 962Q==
X-Gm-Message-State: AGi0PuZu1dOJhlz+Kx4w6F1vOiDlvBmgELKi7DgKGsXYFVyGpYiDqbWz
 5DYpQXjQOue8UkyuDkg5BzPNvg==
X-Google-Smtp-Source: APiQypJHsUUKYVh/i2dCkEYnnU0IrFg+4nLc/ppXSv5rQqfX7rU+7H/vSQrP81Cv7/oKIMPtXmJABQ==
X-Received: by 2002:a1c:9a81:: with SMTP id c123mr8759385wme.115.1587722730639; 
 Fri, 24 Apr 2020 03:05:30 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id o129sm2310857wme.16.2020.04.24.03.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 03:05:29 -0700 (PDT)
Date: Fri, 24 Apr 2020 11:05:26 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Hadar Gat <hadar.gat@arm.com>
Message-ID: <20200424100526.GA8414@dell>
References: <1587395080-15722-1-git-send-email-hadar.gat@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587395080-15722-1-git-send-email-hadar.gat@arm.com>
Cc: Jose Abreu <joabreu@synopsys.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Stefan Agner <stefan@agner.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, sparclinux@vger.kernel.org,
 netdev@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-samsung-soc@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-rockchip@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Joerg Roedel <joro@8bytes.org>,
 Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, linux-media@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-omap@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, freedreno@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Gilad Ben-Yossef <gilad@benyossef.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Ofir Drang <ofir.drang@arm.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Sandy Huang <hjc@rock-chips.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 JC Kuo <jckuo@nvidia.com>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Kukjin Kim <kgene@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, dmaengine@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3] of_device: removed #include that
 caused a recursion in included headers
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

T24gTW9uLCAyMCBBcHIgMjAyMCwgSGFkYXIgR2F0IHdyb3RlOgoKPiBCb3RoIG9mX3BsYXRmb3Jt
LmggYW5kIG9mX2RldmljZS5oIHdlcmUgaW5jbHVkZWQgZWFjaCBvdGhlci4KPiBJbiBvZl9kZXZp
Y2UuaCwgcmVtb3ZlZCB1bm5lZWRlZCAjaW5jbHVkZSB0byBvZl9wbGF0Zm9ybS5oCj4gYW5kIGFk
ZGVkIGluY2x1ZGUgdG8gb2ZfcGxhdGZvcm0uaCBpbiB0aGUgZmlsZXMgdGhhdCBuZWVkcyBpdC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBIYWRhciBHYXQgPGhhZGFyLmdhdEBhcm0uY29tPgo+IFJlcG9y
dGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiBBY2tlZC1ieTogSm9u
YXRoYW4gQ2FtZXJvbiA8Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPiAjZm9yLWlpbwo+IEFj
a2VkLWJ5OiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+ICMgY2xrCj4gLS0tCj4gdjM6
IGFkZCBpbmNsdWRlIHRvIG9mX3BsYXRmb3JtLmggaW4gbW9yZSBmaWxlcy4gKHJlcG9ydGVkIGR1
ZSBvdGhlciBidWlsZHMpCj4gdjI6IGFkZCBpbmNsdWRlIHRvIG9mX3BsYXRmb3JtLmggaW4gbW9y
ZSBmaWxlcy4gKHJlcG9ydGVkIGR1ZSBvdGhlciBidWlsZHMpCj4gCj4gIGFyY2gvc3BhcmMva2Vy
bmVsL3BjaS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKPiAgYXJjaC9zcGFyYy9r
ZXJuZWwvcGNpX3NhYnJlLmMgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+ICBhcmNoL3NwYXJj
L2tlcm5lbC9wY2lfc2NoaXpvLmMgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gIGFyY2gvc3Bh
cmMva2VybmVsL3NidXMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKPiAgYXJjaC9z
cGFyYy9tbS9pby11bml0LmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+ICBhcmNo
L3NwYXJjL21tL2lvbW11LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gIGRy
aXZlcnMvYmFzZS9wbGF0Zm9ybS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKPiAg
ZHJpdmVycy9idXMvaW14LXdlaW0uYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+
ICBkcml2ZXJzL2J1cy92ZXhwcmVzcy1jb25maWcuYyAgICAgICAgICAgICAgICAgICAgIHwgMSAr
Cj4gIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDc2MjItYXVkLmMgICAgICAgICAgICAgfCAx
ICsKPiAgZHJpdmVycy9kbWEvYXRfaGRtYWMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
IDEgKwo+ICBkcml2ZXJzL2RtYS9zdG0zMi1kbWFtdXguYyAgICAgICAgICAgICAgICAgICAgICAg
IHwgMSArCj4gIGRyaXZlcnMvZG1hL3RpL2RtYS1jcm9zc2Jhci5jICAgICAgICAgICAgICAgICAg
ICAgfCAxICsKPiAgZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYyAgICAgICAg
ICAgICB8IDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2hkbWkvaGRtaS5jICAgICAgICAgICAg
ICAgICAgIHwgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jICAgICAgICAgICAg
ICAgICAgICAgfCAxICsKPiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGktZHNpLXJv
Y2tjaGlwLmMgICB8IDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jICAg
ICAgICAgICAgICAgIHwgMSArCj4gIGRyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMtY29yZS5jICAg
ICAgICAgICAgICAgICAgfCAxICsKPiAgZHJpdmVycy9paW8vYWRjL3N0bTMyLWRmc2RtLWFkYy5j
ICAgICAgICAgICAgICAgICB8IDEgKwo+ICBkcml2ZXJzL2lpby9hZGMvc3RtMzItZGZzZG0tY29y
ZS5jICAgICAgICAgICAgICAgIHwgMSArCj4gIGRyaXZlcnMvaW9tbXUvdGVncmEtc21tdS5jICAg
ICAgICAgICAgICAgICAgICAgICAgfCAxICsKPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jb2Rh
L2NvZGEtY29tbW9uLmMgICAgICAgICB8IDEgKwo+ICBkcml2ZXJzL21lbW9yeS9hdG1lbC1lYmku
YyAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCgo+ICBkcml2ZXJzL21mZC9wYWxtYXMuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gIGRyaXZlcnMvbWZkL3NzYmkuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKCkFja2VkLWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcDIuYyAg
ICAgICAgICAgICAgICAgICAgICB8IDEgKwo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9kd21hYy1zdW44aS5jIHwgMSArCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3RpL2Nw
c3cuYyAgICAgICAgICAgICAgICAgICAgfCAxICsKPiAgZHJpdmVycy9waHkvdGVncmEveHVzYi5j
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+ICBkcml2ZXJzL3BpbmN0cmwvZnJlZXNj
YWxlL3BpbmN0cmwtaW14MS1jb3JlLmMgICAgIHwgMSArCj4gIGRyaXZlcnMvcGluY3RybC9ub21h
ZGlrL3BpbmN0cmwtbm9tYWRpay5jICAgICAgICAgfCAxICsKPiAgZHJpdmVycy9zb2Mvc2Ftc3Vu
Zy9leHlub3MtcG11LmMgICAgICAgICAgICAgICAgICB8IDEgKwo+ICBkcml2ZXJzL3NvYy9zdW54
aS9zdW54aV9zcmFtLmMgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gIGluY2x1ZGUvbGludXgv
b2ZfZGV2aWNlLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAyIC0tCj4gIGxpYi9nZW5hbGxv
Yy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKPiAgMzYgZmlsZXMg
Y2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIApMZWUgSm9uZXMg
W+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSC
IE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9v
ayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
