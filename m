Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C08EB58B7C7
	for <lists+linux-stm32@lfdr.de>; Sat,  6 Aug 2022 20:46:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 738B6C03FC8;
	Sat,  6 Aug 2022 18:46:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4764C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Aug 2022 18:46:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 89B2961248;
 Sat,  6 Aug 2022 18:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71514C433D6;
 Sat,  6 Aug 2022 18:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659811601;
 bh=B/0w1udhvHD/9i0cSXbtONOW92202f2YhMQiT3LJId8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pFsBYtApmnG2eqrOLyURupaAFLXeLc7W/9MhUykPguHD+e2ft00vYjP4PgD7meTaL
 aPiqJFS71t0cIyfkSjKk98zrKxyjz09pS447wpgFxKM6eWxbQk3PVjXmckPypt4Sfb
 Lm30+HGsvQ3Z8zumo7J6GRstmybs7OtVuu+uLeKiYDXuzzCb9QynrGjKoCD5Y60u6J
 Zd2cs38zj5zkuUAfwWbj8DgGekQr4BK6wercvB/3Om+mW3sBpol/kP2ySEzM+fgHeh
 7NU/Gt2skLPY/Q3zl2jiIS2qg1r4JEz2ddRLnSlZKFPH9bPGC1ox2H1RL+vuQEmBOd
 Lib5B34RgV13Q==
Date: Sat, 6 Aug 2022 19:56:49 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Message-ID: <20220806195649.4aee65fc@jic23-huawei>
In-Reply-To: <20220715122903.332535-1-nuno.sa@analog.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Gwendal Grignou <gwendal@chromium.org>,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Haibo Chen <haibo.chen@nxp.com>,
 Christophe Branchereau <cbranchereau@gmail.com>, Nancy Yuen <yuenn@google.com>,
 Andy
 Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
 linux-imx@nxp.com, Zhang Rui <rui.zhang@intel.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-mediatek@lists.infradead.org,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-mips@vger.kernel.org,
 Thara Gopinath <thara.gopinath@linaro.org>, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v3 00/15] make iio inkern interface
	firmware agnostic
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

T24gRnJpLCAxNSBKdWwgMjAyMiAxNDoyODo0OCArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gRmlyc3QgdmVyc2lvbiBvZiB0aGUgc2VyaWVzIGNhbiBiZSBmb3Vu
ZCBoZXJlOgo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWlpby8yMDIyMDYxMDA4
NDU0NS41NDc3MDAtMS1udW5vLnNhQGFuYWxvZy5jb20vCj4gCj4gU2Vjb25kIHZlcnNpb246Cj4g
Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaWlvLzIwMjIwNzExMTIzODM1LjgxMTM1
OC0xLW51bm8uc2FAYW5hbG9nLmNvbS8KPiAKPiB2MyBjaGFuZ2VzOgo+IAo+IFsxLzE1XToKPiAg
ICogSW1wcm92ZWQgKHNwZWxsIGZpeGVzKSBjb21taXQgbWVzc2FnZS4KPiAKPiBbMTMvMTVdOgo+
ICAgKiBHZXQgYmFjayB0byB1MzIgQVBJIGZvciAnc3QsYWRjLWRpZmYtY2hhbm5lbHMnIGJ1dCBt
YWtpbmcgaXQgbW9yZSBjbGVhcgo+IHdoYXQncyBnb2luZyBvbjsKPiAgICogRml4IGluZmluaXRl
IGxvb3A7Cj4gICAqIFN0b3JlIG51bWJlciBvZiBzdCxtaW4tc2FtcGxlLXRpbWUtbnNlY3MgcHJv
cGVydGllcyB0byBhdm9pZAo+IGR1cGxpY2F0aW9uIGluIHNhbml0eSBjaGVja3MuCj4gCj4gWzE1
LzE1XQo+ICAgKiBJbXByb3ZlZCAnaWYnIGNvbmRpdGlvbiBmb3IgcmVhZGFiaWxpdHkuCj4gCj4g
KGhvcGVmdWx5bCBkaWQgbm90IGZvcmdvdCBhbnkgdGFnKQoKClZlcnkgbmljZSB3b3JrLiAgQWxs
IGFwcGxpZWQsIHdpdGggYSBmZXcgbWlub3IgdHdlYWtzIGFzIGNhbGxlZCBvdXQgaW4KcmVsZXZh
bnQgcGF0Y2hlcy4gIE5vdGUgSSdsbCBwdXNoIHRoaXMgb3V0IGFzIHRlc3RpbmcuICBXaWxsIGdv
IG91dCBhcyB0b2dyZWcKb25seSBhZnRlciBJIGNhbiByZWJhc2Ugb24gcmMxIGluIGEgd2VlayBv
ciBzbyB0aW1lLgoKVGhhbmtzLAoKSm9uYXRoYW4KCj4gCj4gTnVubyBTw6EgKDE1KToKPiAgIGlp
bzogaW5rZXJuOiBvbmx5IHJlbGVhc2UgdGhlIGRldmljZSBub2RlIHdoZW4gZG9uZSB3aXRoIGl0
Cj4gICBpaW86IGlua2VybjogZml4IHJldHVybiB2YWx1ZSBpbiBkZXZtX29mX2lpb19jaGFubmVs
X2dldF9ieV9uYW1lKCkKPiAgIGlpbzogaW5rZXJuOiBvbmx5IHJldHVybiBlcnJvciBjb2RlcyBp
biBpaW9fY2hhbm5lbF9nZXRfKigpIEFQSXMKPiAgIGlpbzogaW5rZXJuOiBzcGxpdCBvZl9paW9f
Y2hhbm5lbF9nZXRfYnlfbmFtZSgpCj4gICBpaW86IGlua2VybjogbW92ZSB0byBmd25vZGUgcHJv
cGVydGllcwo+ICAgdGhlcm1hbDogcWNvbTogcWNvbS1zcG1pLWFkYy10bTU6IGNvbnZlcnQgdG8g
SUlPIGZ3bm9kZSBBUEkKPiAgIGlpbzogYWRjOiBpbmdlbmljLWFkYzogY29udmVydCB0byBJSU8g
Zndub2RlIGludGVyZmFjZQo+ICAgaWlvOiBhZGM6IGFiODUwMC1ncGFkYzogY29udmVydCB0byBk
ZXZpY2UgcHJvcGVydGllcwo+ICAgaWlvOiBhZGM6IGF0OTEtc2FtYTVkMl9hZGM6IGNvbnZlcnQg
dG8gZGV2aWNlIHByb3BlcnRpZXMKPiAgIGlpbzogYWRjOiBxY29tLXBtOHh4eC14b2FkYzogY29u
dmVydCB0byBkZXZpY2UgcHJvcGVydGllcwo+ICAgaWlvOiBhZGM6IHFjb20tc3BtaS12YWRjOiBj
b252ZXJ0IHRvIGRldmljZSBwcm9wZXJ0aWVzCj4gICBpaW86IGFkYzogcWNvbS1zcG1pLWFkYzU6
IGNvbnZlcnQgdG8gZGV2aWNlIHByb3BlcnRpZXMKPiAgIGlpbzogYWRjOiBzdG0zMi1hZGM6IGNv
bnZlcnQgdG8gZGV2aWNlIHByb3BlcnRpZXMKPiAgIGlpbzogaW5rZXJuOiByZW1vdmUgT0YgZGVw
ZW5kZW5jaWVzCj4gICBpaW86IGlua2VybjogZml4IGNvZGluZyBzdHlsZSB3YXJuaW5ncwo+IAo+
ICBkcml2ZXJzL2lpby9hZGMvYWI4NTAwLWdwYWRjLmMgICAgICAgICAgIHwgIDI3ICstLQo+ICBk
cml2ZXJzL2lpby9hZGMvYXQ5MS1zYW1hNWQyX2FkYy5jICAgICAgIHwgIDMwICstLQo+ICBkcml2
ZXJzL2lpby9hZGMvaW5nZW5pYy1hZGMuYyAgICAgICAgICAgIHwgICA4ICstCj4gIGRyaXZlcnMv
aWlvL2FkYy9xY29tLXBtOHh4eC14b2FkYy5jICAgICAgfCAgNTggKysrLS0KPiAgZHJpdmVycy9p
aW8vYWRjL3Fjb20tc3BtaS1hZGM1LmMgICAgICAgICB8ICA2MyArKystLS0KPiAgZHJpdmVycy9p
aW8vYWRjL3Fjb20tc3BtaS12YWRjLmMgICAgICAgICB8ICA0NCArKy0tCj4gIGRyaXZlcnMvaWlv
L2FkYy9zdG0zMi1hZGMuYyAgICAgICAgICAgICAgfCAxMjUgKysrKysrLS0tLS0KPiAgZHJpdmVy
cy9paW8vaW5rZXJuLmMgICAgICAgICAgICAgICAgICAgICB8IDI3MSArKysrKysrKysrKysrLS0t
LS0tLS0tLQo+ICBkcml2ZXJzL3RoZXJtYWwvcWNvbS9xY29tLXNwbWktYWRjLXRtNS5jIHwgICAz
ICstCj4gIGluY2x1ZGUvbGludXgvaWlvL2NvbnN1bWVyLmggICAgICAgICAgICAgfCAgMjggKy0t
Cj4gIGluY2x1ZGUvbGludXgvaWlvL2lpby5oICAgICAgICAgICAgICAgICAgfCAgIDggKy0KPiAg
MTEgZmlsZXMgY2hhbmdlZCwgMzUwIGluc2VydGlvbnMoKyksIDMxNSBkZWxldGlvbnMoLSkKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
