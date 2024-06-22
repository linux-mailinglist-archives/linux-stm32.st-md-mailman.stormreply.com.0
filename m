Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9908D9132EA
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jun 2024 11:43:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 449F3C6DD9B;
	Sat, 22 Jun 2024 09:43:46 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F038BC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Jun 2024 09:43:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AC7AACE0946;
 Sat, 22 Jun 2024 09:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3103FC3277B;
 Sat, 22 Jun 2024 09:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719049414;
 bh=uECyP60yqfaB0U3mswQAJu4fxkYx/BeROCYGGUgcZH4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ztm1Gbkr6/gXKWLMPIDWdWu0OlZT4twgLMrMtVhmNo/xuaR9xRMwlzq1ltInAx19f
 8lXVoA+r/lbsgv/Rk1PmKxysQIYkzmnut6C1fXtf8I2P2QkFZbOG5JwFNsQVewHU/g
 OHXe9lP8VHPidyZ+mAudzf/eHGI8D1NdH51f7z8HouohNGaQyvYeJRutLr6vsQm5py
 LwlazDqAz85cdtfQOtvp4H2f+354NJ9/1dKYhXCysf5+v3xISprRmhJc66fu44re5Y
 DsKBK3HvQBZHDf+hMVfv3g3yzVhp48oZ0zGADxqK/mbijTndbUDv/EG70MWlQUEymB
 ZRevAamIdbsfA==
Date: Sat, 22 Jun 2024 10:43:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Trevor Gamblin <tgamblin@baylibre.com>
Message-ID: <20240622104319.60b0f0d5@jic23-huawei>
In-Reply-To: <20240617-review-v3-2-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
 <20240617-review-v3-2-88d1338c4cca@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Hans de Goede <hdegoede@redhat.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5p?= =?UTF-8?B?Zw==?=
 <u.kleine-koenig@baylibre.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 02/41] iio: accel: kxsd9: Make use of
 regmap_clear_bits()
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

T24gTW9uLCAxNyBKdW4gMjAyNCAwOTo0OTo0MiAtMDQwMApUcmV2b3IgR2FtYmxpbiA8dGdhbWJs
aW5AYmF5bGlicmUuY29tPiB3cm90ZToKCj4gSW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRl
X2JpdHMoKSBhbmQgcGFzc2luZyB2YWwgPSAwLCB1c2UKPiByZWdtYXBfY2xlYXJfYml0cygpLgo+
IAo+IFN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXls
aWJyZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVHJldm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxp
YnJlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9paW8vYWNjZWwva3hzZDkuYyB8IDYgKystLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FjY2VsL2t4c2Q5LmMgYi9kcml2ZXJzL2lpby9hY2NlbC9r
eHNkOS5jCj4gaW5kZXggYmE5OTY0OWZlMTk1Li4wM2NlMDMyZTA2ZmYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9paW8vYWNjZWwva3hzZDkuYwo+ICsrKyBiL2RyaXZlcnMvaWlvL2FjY2VsL2t4c2Q5
LmMKPiBAQCAtMzcwLDEwICszNzAsOCBAQCBzdGF0aWMgaW50IGt4c2Q5X3Bvd2VyX2Rvd24oc3Ry
dWN0IGt4c2Q5X3N0YXRlICpzdCkKPiAgCSAqIG1ha2Ugc3VyZSB3ZSBjb25zZXJ2ZSBwb3dlciBl
dmVuIGlmIHRoZXJlIGFyZSBvdGhlcnMgdXNlcnMgb24gdGhlCj4gIAkgKiByZWd1bGF0b3JzLgo+
ICAJICovCj4gLQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoc3QtPm1hcCwKPiAtCQkJCSBLWFNE
OV9SRUdfQ1RSTF9CLAo+IC0JCQkJIEtYU0Q5X0NUUkxfQl9FTkFCTEUsCj4gLQkJCQkgMCk7Cj4g
KwlyZXQgPSByZWdtYXBfY2xlYXJfYml0cyhzdC0+bWFwLCBLWFNEOV9SRUdfQ1RSTF9CLAo+ICsJ
CQkJS1hTRDlfQ1RSTF9CX0VOQUJMRSk7Ck5vdyBmaXRzIG5lYXRseSBvbiBvbmUgbGluZSBhdCBw
cmVjaXNlbHkgODAgY2hhcnMuCkkgcmV3cmFwcGVkIHdoaWxzdCBhcHBseWluZy4KCkpvbmF0aGFu
Cgo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+ICAKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
