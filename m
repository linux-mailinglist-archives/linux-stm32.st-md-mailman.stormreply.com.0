Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1717759DBA
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jul 2023 20:46:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F50DC6B442;
	Wed, 19 Jul 2023 18:46:03 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CB65C6A5E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jul 2023 18:46:02 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-4fdd515cebcso1937203e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jul 2023 11:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1689792361; x=1692384361; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8P6p5GxD+C7LfK4xTVAmdgfr7J5QiZZmSr+c4qR0eQ4=;
 b=PNHMPmfGkc1gL3s+kuZsOV06iS0AVcua9wceAmdSEpVaau8usQXOmlxuVajPoqahSZ
 oXCeyXW3i7qO4gPQC3/B5Lo5Eqmi2HM4U13eYxzJby4ZFd5uR2kFc8wjOiArIEd55PBA
 FeCJue+xZBMErbY8RHL9QpZivP+scZ+Uhv+xiPlfw+QmU/c+xu8cJYkIrMEc/MG7elAK
 qWZ83FR4V9wLcNgcODc1mJlKxSJnwdLewAg5rcPN0PhCf2e09w5V1Bp1xL5H141MnfFQ
 Zld3xPSZJnzYVXtM2wQmsSZTU5Qt4Z0CaW8ampG4BzUMYrnqq3UfbUoP7KRh6XWbjalG
 17Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689792361; x=1692384361;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8P6p5GxD+C7LfK4xTVAmdgfr7J5QiZZmSr+c4qR0eQ4=;
 b=NkUuBTlmxHCDJgH009KvrJph5VPu9Y0hNFIFYy0mJnyk1/vASOGAtbtJ+7Od3DaYa5
 FXNAacOwz0gwKGUz6VEMeI3q6XEJqmBsh53qLDks25aiyMsfUspqFbnvdeuZzxB8KD6v
 czWCe56aVTWHWOIS/flXUU7m5wJs4jmGJNof+jIqylv9U0beSTELg8y4znzhvApB98tj
 TLcZoD9bmpAUTGBSa456674/RULdYU3FI26PpEA2Fk4RQMsV4Er5wDpP4YnbOoe1fN+4
 t56eEFWQaIvudPjGBjJRFIf7alRyuHStQFVspp/JWXTu0yRz4RR3+xcyVYYc/yGxgGn0
 vtZg==
X-Gm-Message-State: ABy/qLauo+rTAuQ72Hy+tRKjfIYZs8nnn9xqdW5/pIMa/nVaDW8i8auG
 vbYi7SQ4LGai/rJo24ldzE0sgg==
X-Google-Smtp-Source: APBJJlFtrWyQNURr4DI24Yfx+KhHtEnbcs8mZXCEdNLSvmMP4IixrdRQLU+06NloRR7Z4XxkYEDlqQ==
X-Received: by 2002:a05:6512:250f:b0:4fb:8de9:ac0e with SMTP id
 be15-20020a056512250f00b004fb8de9ac0emr607490lfb.1.1689792361237; 
 Wed, 19 Jul 2023 11:46:01 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
 by smtp.gmail.com with ESMTPSA id
 m8-20020ac24248000000b004fbad6bc93dsm1057209lfl.136.2023.07.19.11.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 11:46:00 -0700 (PDT)
Date: Wed, 19 Jul 2023 20:45:59 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Rob Herring <robh@kernel.org>
Message-ID: <ZLgvZ2ao1tgrRlFu@oden.dyn.berto.se>
References: <20230718143118.1065743-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718143118.1065743-1-robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Heiko Stuebner <heiko@sntech.de>,
 Dafna Hirschfeld <dafna@fastmail.com>, linux-rockchip@lists.infradead.org,
 Yunfei Dong <yunfei.dong@mediatek.com>, Eddie James <eajames@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Vikash Garodia <quic_vgarodia@quicinc.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-aspeed@lists.ozlabs.org, Jerome Brunet <jbrunet@baylibre.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Sean Young <sean@mess.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Shijie Qin <shijie.qin@nxp.com>,
 Matt Ranostay <matt.ranostay@konsulko.com>, Andy Gross <agross@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Steve Longerbeam <slongerbeam@gmail.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-sunxi@lists.linux.dev,
 NXP Linux Team <linux-imx@nxp.com>, Bin Liu <bin.liu@mediatek.com>,
 devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Sean Wang <sean.wang@mediatek.com>, linux-renesas-soc@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>, Benoit Parrot <bparrot@ti.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Yong Deng <yong.deng@magewell.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Zhou Peng <eagle.zhou@nxp.com>,
 Andrew Jeffery <andrew@aj.id.au>, Bjorn Andersson <andersson@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krz ysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Ming Qian <ming.qian@nxp.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [Linux-stm32] [PATCH v2] media: Explicitly include correct DT
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

SGkgUm9iLAoKT24gMjAyMy0wNy0xOCAwODozMToxNCAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6
Cj4gVGhlIERUIG9mX2RldmljZS5oIGFuZCBvZl9wbGF0Zm9ybS5oIGRhdGUgYmFjayB0byB0aGUg
c2VwYXJhdGUKPiBvZl9wbGF0Zm9ybV9idXNfdHlwZSBiZWZvcmUgaXQgYXMgbWVyZ2VkIGludG8g
dGhlIHJlZ3VsYXIgcGxhdGZvcm0gYnVzLgo+IEFzIHBhcnQgb2YgdGhhdCBtZXJnZSBwcmVwcGlu
ZyBBcm0gRFQgc3VwcG9ydCAxMyB5ZWFycyBhZ28sIHRoZXkKPiAidGVtcG9yYXJpbHkiIGluY2x1
ZGUgZWFjaCBvdGhlci4gVGhleSBhbHNvIGluY2x1ZGUgcGxhdGZvcm1fZGV2aWNlLmgKPiBhbmQg
b2YuaC4gQXMgYSByZXN1bHQsIHRoZXJlJ3MgYSBwcmV0dHkgbXVjaCByYW5kb20gbWl4IG9mIHRo
b3NlIGluY2x1ZGUKPiBmaWxlcyB1c2VkIHRocm91Z2hvdXQgdGhlIHRyZWUuIEluIG9yZGVyIHRv
IGRldGFuZ2xlIHRoZXNlIGhlYWRlcnMgYW5kCj4gcmVwbGFjZSB0aGUgaW1wbGljaXQgaW5jbHVk
ZXMgd2l0aCBzdHJ1Y3QgZGVjbGFyYXRpb25zLCB1c2VycyBuZWVkIHRvCj4gZXhwbGljaXRseSBp
bmNsdWRlIHRoZSBjb3JyZWN0IGluY2x1ZGVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4gdjI6Cj4gLSBGaXggZG91YmxlIGluY2x1ZGUg
b2Ygb2YuaAo+IC0tLQoKRm9yLAoKPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3Jj
YXItaXNwLmMgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9yZW5lc2FzL3JjYXItdmluL3JjYXItY29yZS5jICAgICAgICAgICB8IDEgLQo+ICBkcml2
ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcmNhci12aW4vcmNhci1jc2kyLmMgICAgICAgICAg
IHwgMSAtCgpSZXZpZXdlZC1ieTogTmlrbGFzIFPDtmRlcmx1bmQgPG5pa2xhcy5zb2Rlcmx1bmRA
cmFnbmF0ZWNoLnNlPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
