Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A8E547534
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Jun 2022 16:06:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2908CC5F1F1;
	Sat, 11 Jun 2022 14:06:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2C03C5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jun 2022 14:05:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A95F560F31;
 Sat, 11 Jun 2022 14:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9E0C34116;
 Sat, 11 Jun 2022 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654956358;
 bh=OmUfGkRF4xL7PgWSrSTnTjbph9RD9p9o9gWv8vjGSHg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=s/NwO96uBMX+o2nM9eGSnt7eVSX4jqvSEZqkM27RqMGCzysNXsmCNSfHKYk+2w1DX
 xW62AVOwiXdjLZYAD4tkKKX1EOq8YmkjNrD09fdjwNuWfawr0w9HEgLV0u11un8IoI
 jiXlPZJ/OoqzgbhcnXWXzKJ1Al9KVFSJxpZaUaRMO3rYoB8DtHOQhRTmIqJF5Wq1Ls
 DHdq9fD+W0XqUUNJdDNRMkgK/FuVBkEolBiw1uQzLdoAsIaasmVFhCt0fIophTyLSD
 XbSJyDSBJ91XzayfJgSHvIrQYXIIoFAU7WtAnId+BDpo4Md91AZg3TKvCuxbHrz1aG
 YELoLDy88lQ7g==
Date: Sat, 11 Jun 2022 15:14:56 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Message-ID: <20220611151456.24c66aa2@jic23-huawei>
In-Reply-To: <20220610084545.547700-12-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-12-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Gross <agross@kernel.org>, linux-imx@nxp.com,
 Zhang Rui <rui.zhang@intel.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-mediatek@lists.infradead.org,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Lorenzo
 Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-mips@vger.kernel.org,
 Thara Gopinath <thara.gopinath@linaro.org>, linux-renesas-soc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 11/34] iio: common: cros_ec_lid_angle:
 explicitly add proper header files
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

T24gRnJpLCAxMCBKdW4gMjAyMiAxMDo0NToyMiArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gRG8gbm90IHRydXN0IHRoZSBmYWN0IHRoYXQgaWlvLmggaW5jbHVk
ZXMgb2YuaCB3aGljaCBpbiB0dXJuIGluY2x1ZGVzCj4gYWxsIHRoZSBoZWFkZXJzIHdlIGFyZSBy
ZWx5aW5nIG9uLgo+IAo+IFRoZSB1bHRpbWF0ZSBnb2FsIGlzIHRvIGFjdHVhbGx5IGRyb3Agb2Yu
aCBmcm9tIGlpby5oLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxv
Zy5jb20+CkFwcGxpZWQuCgo+IC0tLQo+ICBkcml2ZXJzL2lpby9jb21tb24vY3Jvc19lY19zZW5z
b3JzL2Nyb3NfZWNfbGlkX2FuZ2xlLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2NvbW1vbi9jcm9zX2VjX3NlbnNv
cnMvY3Jvc19lY19saWRfYW5nbGUuYyBiL2RyaXZlcnMvaWlvL2NvbW1vbi9jcm9zX2VjX3NlbnNv
cnMvY3Jvc19lY19saWRfYW5nbGUuYwo+IGluZGV4IGFmODAxZTIwMzYyMy4uOWY3ODBmYWZhZWQ5
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaWlvL2NvbW1vbi9jcm9zX2VjX3NlbnNvcnMvY3Jvc19l
Y19saWRfYW5nbGUuYwo+ICsrKyBiL2RyaXZlcnMvaWlvL2NvbW1vbi9jcm9zX2VjX3NlbnNvcnMv
Y3Jvc19lY19saWRfYW5nbGUuYwo+IEBAIC0yMCw2ICsyMCw3IEBACj4gICNpbmNsdWRlIDxsaW51
eC9paW8vdHJpZ2dlcmVkX2J1ZmZlci5oPgo+ICAjaW5jbHVkZSA8bGludXgvaWlvL3RyaWdnZXJf
Y29uc3VtZXIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICsjaW5jbHVkZSA8bGlu
dXgvbW9kX2RldmljZXRhYmxlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RhdGEvY3Jvc19lY19jb21tYW5kcy5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
