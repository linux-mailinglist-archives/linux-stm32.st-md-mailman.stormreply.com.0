Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAEB55064F
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Jun 2022 19:21:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9134C03FE0;
	Sat, 18 Jun 2022 17:21:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8996C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Jun 2022 17:21:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8580460DB4;
 Sat, 18 Jun 2022 17:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41652C3411A;
 Sat, 18 Jun 2022 17:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655572894;
 bh=s9rzUJH1dCU78egHZ+iIG03v6Lj+ion9PzSseqxJCFI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mLbJ4PLP002IFIyUS/mFXkt7VRPo37gj1dl2UgXLay+Jd+5DxzlSRZxjCKSQfzLtm
 w4ERJv/y4Vtvf+zMWg/hqpOjfO75ncGomxEsmRBeblvqyljZF/cJ0Ghsf1i8AkvVYy
 CTfCUKo5VD9g1SiBv2jluSBhogu0x0nNfUVOBKIfVg9HtAQUAAfDJ/p33a5g0kx2kd
 QlWaytpoO91OuQliAYmBYJC3yq5N6Q8XpHivXx5gTE7c7v/ixy3a9u9FLFcZpTIv8D
 BUJ5TsJBVILC9zkvhKEqh4bM/awT4sH6gM4Y9KEH1IVSYXTDyOvr87C/r8rkSapHHo
 AwM2FiuCayWcQ==
Date: Sat, 18 Jun 2022 18:30:40 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Message-ID: <20220618183040.29ed935d@jic23-huawei>
In-Reply-To: <20220610084545.547700-21-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-21-nuno.sa@analog.com>
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
 linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 linux-mips@vger.kernel.org, Thara Gopinath <thara.gopinath@linaro.org>,
 linux-renesas-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 20/34] iio: inkern: only relase the device
 node when done with it
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

T24gRnJpLCAxMCBKdW4gMjAyMiAxMDo0NTozMSArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKClR5cG8gaW4gcGF0Y2ggdGl0bGUgKGp1c3Qgbm90aWNlZCB3aGlsc3Qg
c2Nyb2xsaW5nIHBhc3QpCgpyZWxlYXNlCgoKPiAnb2Zfbm9kZV9wdXQoKScgY2FuIHBvdGVudGlh
bGx5IHJlbGVhc2UgdGhlIG1lbW9yeSBwb2ludGVkIHRvIGJ5Cj4gJ2lpb3NwZWMubnAnIHdoaWNo
IHdvdWxkIGxlYXZlIHVzIHdpdGggYW4gaW52YWxpZCBwb2ludGVyIChhbmQgd2Ugd291bGQKPiBz
dGlsbCBwYXNzIGl0IGluICdvZl94bGF0ZSgpJykuIEFzIHN1Y2gsIHdlIGNhbiBvbmx5IHJlbGVh
c2UgdGhlIG5vZGUKPiBhZnRlciB3ZSBhcmUgZG9uZSB3aXRoIGl0Lgo+IAo+IEZpeGVzOiAxN2Q4
MmI0N2EyMTVkICgiaWlvOiBBZGQgT0Ygc3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1ieTogTnVubyBT
w6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9paW8vaW5rZXJuLmMgfCA2
ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9pbmtlcm4uYyBiL2RyaXZlcnMvaWlvL2lu
a2Vybi5jCj4gaW5kZXggZGY3NDc2NWQzM2RjLi45ZDg3MDU3Nzk0ZmMgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9paW8vaW5rZXJuLmMKPiArKysgYi9kcml2ZXJzL2lpby9pbmtlcm4uYwo+IEBAIC0x
NjUsOSArMTY1LDEwIEBAIHN0YXRpYyBpbnQgX19vZl9paW9fY2hhbm5lbF9nZXQoc3RydWN0IGlp
b19jaGFubmVsICpjaGFubmVsLAo+ICAKPiAgCWlkZXYgPSBidXNfZmluZF9kZXZpY2UoJmlpb19i
dXNfdHlwZSwgTlVMTCwgaWlvc3BlYy5ucCwKPiAgCQkJICAgICAgIGlpb19kZXZfbm9kZV9tYXRj
aCk7Cj4gLQlvZl9ub2RlX3B1dChpaW9zcGVjLm5wKTsKPiAtCWlmIChpZGV2ID09IE5VTEwpCj4g
KwlpZiAoaWRldiA9PSBOVUxMKSB7Cj4gKwkJb2Zfbm9kZV9wdXQoaWlvc3BlYy5ucCk7Cj4gIAkJ
cmV0dXJuIC1FUFJPQkVfREVGRVI7Cj4gKwl9Cj4gIAo+ICAJaW5kaW9fZGV2ID0gZGV2X3RvX2lp
b19kZXYoaWRldik7Cj4gIAljaGFubmVsLT5pbmRpb19kZXYgPSBpbmRpb19kZXY7Cj4gQEAgLTE3
NSw2ICsxNzYsNyBAQCBzdGF0aWMgaW50IF9fb2ZfaWlvX2NoYW5uZWxfZ2V0KHN0cnVjdCBpaW9f
Y2hhbm5lbCAqY2hhbm5lbCwKPiAgCQlpbmRleCA9IGluZGlvX2Rldi0+aW5mby0+b2ZfeGxhdGUo
aW5kaW9fZGV2LCAmaWlvc3BlYyk7Cj4gIAllbHNlCj4gIAkJaW5kZXggPSBfX29mX2lpb19zaW1w
bGVfeGxhdGUoaW5kaW9fZGV2LCAmaWlvc3BlYyk7Cj4gKwlvZl9ub2RlX3B1dChpaW9zcGVjLm5w
KTsKPiAgCWlmIChpbmRleCA8IDApCj4gIAkJZ290byBlcnJfcHV0Owo+ICAJY2hhbm5lbC0+Y2hh
bm5lbCA9ICZpbmRpb19kZXYtPmNoYW5uZWxzW2luZGV4XTsKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
