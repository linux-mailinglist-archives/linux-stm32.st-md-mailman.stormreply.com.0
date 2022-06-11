Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A26A3547599
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Jun 2022 16:21:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59F9BC5F1D7;
	Sat, 11 Jun 2022 14:21:20 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6CEAC0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jun 2022 14:21:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54E41B816A6;
 Sat, 11 Jun 2022 14:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454F6C34116;
 Sat, 11 Jun 2022 14:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654957277;
 bh=lfyWxTdm+9DA2o5Gv4TMOK79YAUDNtuhApIhJjT70sc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oCVbMFgyFX6oFH9u3+7f5Hm4+q5RYHvp3rgC4dsE0IEQZXvrtnPlXfQnAAnejz0xR
 lkmxE/CIR1fCuZZ1eU3ZYl5amkKuaOVsuPrh6pXb2TtzM4ufNY7k1LT1YVEAZ0QUc9
 8kFKGWJz6+JPx7xwmpXMHQ0suVKcRhwqQiando1XDqH+x4ErQgXo+eWTv7qOtiS2Kk
 7sEjS2O1A+ImNtfVji8lSkOMnMR/LIKBCWMg10V5/81/grKwvV8ar0Y3R0FBH7igf4
 Hx1sU60YSsy+PE4LPbaCFaBA840/DS4NcKtTAOlTrHnPRvu+fg3VnT5Fr7aAFuXBk8
 iv+MSeL9C6Jnw==
Date: Sat, 11 Jun 2022 15:30:15 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Message-ID: <20220611153016.2f91d7e5@jic23-huawei>
In-Reply-To: <20220610084545.547700-20-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-20-nuno.sa@analog.com>
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
Subject: Re: [Linux-stm32] [PATCH 19/34] iio: core: drop of.h from iio.h
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

T24gRnJpLCAxMCBKdW4gMjAyMiAxMDo0NTozMCArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gVGhlcmUgaXMgbm8gcmVhc29uIHRvIGluY2x1ZGUgT0YgYXMgd2Ug
b25seSBuZWVkIHRvIGZvcndhcmQgZGVjbGFyZQo+ICdvZl9waGFuZGxlX2FyZ3MnLiBQcmV2aW91
c2x5LCBzb21lIGRyaXZlcnMgd2VyZSBhY3R1YWxseSByZWx5aW5nIG9uCj4gdGhpcyBmb3Igc29t
ZSBoZWFkZXJzICh0aG9zZSB3ZXJlIGFscmVhZHkgZml4ZWQpLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+ClRoaXMgb25lIGRlc2VydmVzIGEgJ3dvb3Qn
IDopCgpJIHdvdWxkIGhhdmUgZ3Vlc3NlZCB3ZSB3ZXJlIG11Y2ggZnVydGhlciBvZmYgYmVpbmcg
YWJsZSB0byBkbyB0aGlzCnRoYW4gdGhlIDE4IHBhdGNoZXMgZWFybGllciBpbiB0aGlzIHNlcmll
cy4gR29vZCB3b3JrIGZyb20gQW5keQphbmQgeW91cnNlbGYgdG8gZ2V0IHRvIHRoZSBwb2ludCB3
aGVyZSB0aGlzIHdhcyBwb3NzaWJsZS4KCkFwcGxpZWQgdG8gdGhlIHRvZ3JlZyBicmFuY2ggb2Yg
aWlvLmdpdCBhbmQgcHVzaGVkIG91dCBhcyB0ZXN0aW5nIGZvcgowLWRheSB0byB0YWtlIGEgbG9v
ay4gIEknbSBwcm9iYWJseSBnb2luZyB0byByZXZpZXcgdGhlIHJlbWFpbmRlciwgYnV0CmxlYXZl
IG9uIGxpc3QgYSBiaXQgbG9uZ2VyIGFzIHRoZXkgYXJlIG1vcmUgY29tcGxleC9jb250cm92ZXJz
aWFsIHRoYW4KdGhpcyBpbmNsdWRlcyBjbGVhbnVwLgoKVGhhbmtzLAoKSm9uYXRoYW4KCj4gLS0t
Cj4gIGluY2x1ZGUvbGludXgvaWlvL2lpby5oIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L2lpby9paW8uaCBiL2luY2x1ZGUvbGludXgvaWlvL2lpby5oCj4gaW5kZXggNGUyMWE4MmIz
NzU2Li5kOWI0YTljYTlhMGYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9paW8vaWlvLmgK
PiArKysgYi9pbmNsdWRlL2xpbnV4L2lpby9paW8uaAo+IEBAIC0xMSwxMyArMTEsMTQgQEAKPiAg
I2luY2x1ZGUgPGxpbnV4L2NkZXYuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L2lpby90eXBlcy5oPgo+IC0jaW5jbHVkZSA8bGludXgvb2YuaD4KPiAgLyog
SUlPIFRPRE8gTElTVCAqLwo+ICAvKgo+ICAgKiBQcm92aWRlIG1lYW5zIG9mIGFkanVzdGluZyB0
aW1lciBhY2N1cmFjeS4KPiAgICogQ3VycmVudGx5IGFzc3VtZXMgbmFubyBzZWNvbmRzLgo+ICAg
Ki8KPiAgCj4gK3N0cnVjdCBvZl9waGFuZGxlX2FyZ3M7Cj4gKwo+ICBlbnVtIGlpb19zaGFyZWRf
Ynkgewo+ICAJSUlPX1NFUEFSQVRFLAo+ICAJSUlPX1NIQVJFRF9CWV9UWVBFLAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
