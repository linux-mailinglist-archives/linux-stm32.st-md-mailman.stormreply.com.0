Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA1E756898
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jul 2023 18:03:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52606C6B457;
	Mon, 17 Jul 2023 16:03:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F68BC6A611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 16:03:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E327A6114A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 16:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53708C433D9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689609784;
 bh=aZICCOVfKf1PqTHgRCOupCS9EkykRJONrhoP14RlBbY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RjTKbIlOKFKAdT9+GbcTkdLrDGOHEezkmDutGTRyLx2lp53JR+Nz+OR6K+D9kTAaq
 AiKAEbcjoQm/6Y4ZH2T94uqpkUTXE/ivwfxwwzCs3GX629h8bGy6BxqwTffITGuDgz
 lrWsuT+VfZUJhf5khJL01hNYIk7FTk420NOk02QnaYVF3z8+Md13oy8ytRu/scv6uO
 jhYu7UHeznp3ruJwr/tNBSXy4ect2sUkWAgSioVZjPhu5oeLzhGDc4zky934XT//wF
 jZx/4IwrsVwoVvV1FzoAV+rY/02+4k0C0RSeWmeEazP8s1BxvRca5gX6K46WO7ajgV
 sJK4ccBDA5WTQ==
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-4fbbfaacfc1so7480212e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 09:03:04 -0700 (PDT)
X-Gm-Message-State: ABy/qLbIUJPy0E5bZooHSX9JWWkfQKG2dzuMP+gwHECdNGoGMDn+eG+d
 6Zww8XhlJkNYO2TPWh1Lhkz7C3xZTCfllNCZug==
X-Google-Smtp-Source: APBJJlGT3Z4OwG+5PD2iOuBmukBKYkwOVI4cYi2ZBHphRuP2mDYunFyhxEBn+UEFg93NJOzQaxqKN1Nt2m8NdZz6Fm0=
X-Received: by 2002:a2e:9455:0:b0:2b4:6f0c:4760 with SMTP id
 o21-20020a2e9455000000b002b46f0c4760mr8630130ljh.11.1689609761393; Mon, 17
 Jul 2023 09:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174430.4054533-1-robh@kernel.org>
In-Reply-To: <20230714174430.4054533-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Jul 2023 10:02:28 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+qcoFd7_wWUZeHgqWpB0JfdE0j4qLCxfJwD_Cqkz-HgA@mail.gmail.com>
Message-ID: <CAL_Jsq+qcoFd7_wWUZeHgqWpB0JfdE0j4qLCxfJwD_Cqkz-HgA@mail.gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Vinod Koul <vkoul@kernel.org>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Viresh Kumar <vireshk@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Li Yang <leoyang.li@nxp.com>, Zhang Wei <zw@zh-kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Sinan Kaya <okaya@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
 asahi@lists.linux.dev, dmaengine@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: Explicitly include correct DT
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgMTE6NDTigK9BTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IFRoZSBEVCBvZl9kZXZpY2UuaCBhbmQgb2ZfcGxhdGZvcm0uaCBk
YXRlIGJhY2sgdG8gdGhlIHNlcGFyYXRlCj4gb2ZfcGxhdGZvcm1fYnVzX3R5cGUgYmVmb3JlIGl0
IGFzIG1lcmdlZCBpbnRvIHRoZSByZWd1bGFyIHBsYXRmb3JtIGJ1cy4KPiBBcyBwYXJ0IG9mIHRo
YXQgbWVyZ2UgcHJlcHBpbmcgQXJtIERUIHN1cHBvcnQgMTMgeWVhcnMgYWdvLCB0aGV5Cj4gInRl
bXBvcmFyaWx5IiBpbmNsdWRlIGVhY2ggb3RoZXIuIFRoZXkgYWxzbyBpbmNsdWRlIHBsYXRmb3Jt
X2RldmljZS5oCj4gYW5kIG9mLmguIEFzIGEgcmVzdWx0LCB0aGVyZSdzIGEgcHJldHR5IG11Y2gg
cmFuZG9tIG1peCBvZiB0aG9zZSBpbmNsdWRlCj4gZmlsZXMgdXNlZCB0aHJvdWdob3V0IHRoZSB0
cmVlLiBJbiBvcmRlciB0byBkZXRhbmdsZSB0aGVzZSBoZWFkZXJzIGFuZAo+IHJlcGxhY2UgdGhl
IGltcGxpY2l0IGluY2x1ZGVzIHdpdGggc3RydWN0IGRlY2xhcmF0aW9ucywgdXNlcnMgbmVlZCB0
bwo+IGV4cGxpY2l0bHkgaW5jbHVkZSB0aGUgY29ycmVjdCBpbmNsdWRlcy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZG1h
L2FwcGxlLWFkbWFjLmMgICAgICAgICAgICAgICAgICAgICAgfCAzICsrLQo+ICBkcml2ZXJzL2Rt
YS9hdF9oZG1hYy5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL2Rt
YS9iY20tc2JhLXJhaWQuYyAgICAgICAgICAgICAgICAgICAgIHwgNCArKystCj4gIGRyaXZlcnMv
ZG1hL2Jlc3Rjb21tL2Jlc3Rjb21tLmMgICAgICAgICAgICAgICAgfCA0ICstLS0KCnYyIGNvbWlu
ZyBmb3IgdGhpczoKCj4+IGRyaXZlcnMvZG1hL2Jlc3Rjb21tL2Jlc3Rjb21tLgpjOjgwOjEzOiBl
cnJvcjogY2FsbCB0byB1bmRlY2xhcmVkIGZ1bmN0aW9uICdpcnFfb2ZfcGFyc2VfYW5kX21hcCc7
CklTTyBDOTkgYW5kIGxhdGVyIGRvIG5vdCBzdXBwb3J0IGltcGxpY2l0IGZ1bmN0aW9uIGRlY2xh
cmF0aW9ucwpbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICAgICAgODAgfCAgICAg
ICAgIHRzay0+aXJxID0gaXJxX29mX3BhcnNlX2FuZF9tYXAoYmNvbV9lbmctPm9mbm9kZSwKdHNr
LT50YXNrbnVtKTsKICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgXgo+PiBkcml2ZXJzL2Rt
YS9iZXN0Y29tbS9iZXN0Y29tbS5jOjEwNTo0OiBlcnJvcjogY2FsbCB0byB1bmRlY2xhcmVkIGZ1
bmN0aW9uICdpcnFfZGlzcG9zZV9tYXBwaW5nJzsgSVNPIEM5OSBhbmQgbGF0ZXIgZG8gbm90IHN1
cHBvcnQgaW1wbGljaXQgZnVuY3Rpb24gZGVjbGFyYXRpb25zIFstV2ltcGxpY2l0LWZ1bmN0aW9u
LWRlY2xhcmF0aW9uXQogICAgIDEwNSB8ICAgICAgICAgICAgICAgICAgICAgICAgIGlycV9kaXNw
b3NlX21hcHBpbmcodHNrLT5pcnEpOwogICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
IF4KICAgZHJpdmVycy9kbWEvYmVzdGNvbW0vYmVzdGNvbW0uYzoxMjg6MjogZXJyb3I6IGNhbGwg
dG8gdW5kZWNsYXJlZApmdW5jdGlvbiAnaXJxX2Rpc3Bvc2VfbWFwcGluZyc7IElTTyBDOTkgYW5k
IGxhdGVyIGRvIG5vdCBzdXBwb3J0CmltcGxpY2l0IGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyBbLVdp
bXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICAgICAxMjggfCAgICAgICAgIGlycV9kaXNw
b3NlX21hcHBpbmcodHNrLT5pcnEpOwogICAgICAgICB8ICAgICAgICAgXgogICAzIGVycm9ycyBn
ZW5lcmF0ZWQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
