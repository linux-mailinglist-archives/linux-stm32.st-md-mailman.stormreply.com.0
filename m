Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC9B91358C
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jun 2024 20:07:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96020C6DD9B;
	Sat, 22 Jun 2024 18:07:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55AE5C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Jun 2024 18:07:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 00AEB61760;
 Sat, 22 Jun 2024 18:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F603C3277B;
 Sat, 22 Jun 2024 18:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719079640;
 bh=OtT1Bdv6RV8ExcvkSroMHalr66r6ej9Rmqb6rUMOMI4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=slBSHExp0Uwe7g9gxR6wtZtx9GvEjsaR/9tW7T7D7ThM65vtbu5NwRtXOWZLb/A6Z
 x4vzB//x6l8e4m/dKCQqux2wTtNYCkhB0sPnsVA49iVVQpmQ8/6HKwHmZEjeGxQQ66
 +En2No/IKyo4TyARnNnRLLs9Nlw+Wx1OIGZR/8G+Zs7XxL5ECp2Dn79Bh9vAwRcAGW
 Q8Y8kd5QjhT3h2nHvtxpe7LJn/2WOfoj1p1f/BnDGUBk5Elm13U0NGXZWsbU0pwaet
 y4XEQJhRSJfiNLyG4NPQ9Gvmck4nLZjpuik3GoyfpXf0YXq3k6IOE95ZnJLrkxyDjj
 eGKmdj2tsObmA==
Date: Sat, 22 Jun 2024 19:07:06 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Message-ID: <20240622190706.670224da@jic23-huawei>
In-Reply-To: <mv3deevgf3pp6ojy3pa4zgc5z74ajroe26sayhzvrbua2dqrdu@enqs7sobbew5>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
 <mv3deevgf3pp6ojy3pa4zgc5z74ajroe26sayhzvrbua2dqrdu@enqs7sobbew5>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Trevor Gamblin <tgamblin@baylibre.com>, imx@lists.linux.dev,
 Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
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
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 00/41] iio: simplify with
 regmap_set_bits(), regmap_clear_bits()
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

T24gTW9uLCAxNyBKdW4gMjAyNCAxNzoxNzoyNyArMDIwMApVd2UgS2xlaW5lLUvDtm5pZyA8dS5r
bGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4gd3JvdGU6Cgo+IEhlbGxvIFRyZXZvciwKPiAKPiBP
biBNb24sIEp1biAxNywgMjAyNCBhdCAwOTo0OTo0MEFNIC0wNDAwLCBUcmV2b3IgR2FtYmxpbiB3
cm90ZToKPiA+IFNpbXBsaWZ5IHRoZSB3YXkgcmVnbWFwIGlzIGFjY2Vzc2VkIGluIGlpbyBkcml2
ZXJzLgo+ID4gCj4gPiBJbnN0ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRhdGVfYml0cygpIGFuZCBw
YXNzaW5nIHRoZSBtYXNrIHR3aWNlLCB1c2UKPiA+IHJlZ21hcF9zZXRfYml0cygpLgo+ID4gCj4g
PiBJbnN0ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRhdGVfYml0cygpIGFuZCBwYXNzaW5nIHZhbCA9
IDAsIHVzZQo+ID4gcmVnbWFwX2NsZWFyX2JpdHMoKS4KPiA+IAo+ID4gVGhlIHNlcmllcyBpcyBt
YXJrZWQgYXMgdjMsIGJ1dCB0aGUgcHJldmlvdXMgdHdvIHJldmlzaW9ucyB3ZXJlIHNpbmdsZQo+
ID4gcGF0Y2hlcy4gVGhlcmUgd2FzIGFsc28gYSByZXNlbmQgb2YgdjEgZHVlIHRvIG5vdCBwcm9w
ZXJseSBDQ2luZyB0aGUKPiA+IG1haWxpbmcgbGlzdHMgb24gdGhlIGZpcnN0IGF0dGVtcHQuIFRy
YWlsZXJzIHdlcmUgcHVsbGVkIGluIGZyb20gdGhvc2UKPiA+IHdoZXJlIHJlbGV2YW50Lgo+ID4g
Cj4gPiBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1paW8vMjAyNDA2
MTMxMzM5MjcuMzg1MTM0NC0xLXRnYW1ibGluQGJheWxpYnJlLmNvbS8KPiA+IExpbmsgdG8gdjE6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWlpby8yMDI0MDYxMTE2NTIxNC40MDkxNTkx
LTEtdGdhbWJsaW5AYmF5bGlicmUuY29tLwo+ID4gCj4gPiBTdWdnZXN0ZWQtYnk6IFV3ZSBLbGVp
bmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6
IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+ICAKPiAKPiBBY2tlZC1i
eTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+Cj4gClNl
cmllcyBhcHBsaWVkIHdpdGggYSBmZXcgd3JhcHBpbmcgdHdlYWtzLgoKQXBwbGllZCB0byB0aGUg
dG9ncmVnIGJyYW5jaCBvZiBpaW8uZ2l0IGFuZCBwdXNoZWQgb3V0IGFzIHRlc3RpbmcgZm9yIDAt
ZGF5CnRvIHRha2UgYSBsb29rICsgYmVjYXVzZSBJIG1pZ2h0IHJlYmFzZSB0aGF0IHRyZWUgYWZ0
ZXIgc29tZSBmaXhlcwptYWtlIGl0IHVwc3RyZWFtIG9uIHdoaWNoIEkgaGF2ZSBvdGhlciBkZXBl
bmRlbmNpZXMgYW5kIEkgZG9uJ3QgbGlrZSBkb2luZwp0aGF0IG9uY2UgaXQgaXMgaW4gdGhlIHB1
YmxpYyB2ZXJzaW9uIG9mIHRoZSB0b2dyZWcgYnJhbmNoLgoKVGhhbmtzCgpKb25hdGhhbgoKPiBU
aGFua3MKPiBVd2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
