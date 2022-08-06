Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F7458B757
	for <lists+linux-stm32@lfdr.de>; Sat,  6 Aug 2022 19:49:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B265FC035BE;
	Sat,  6 Aug 2022 17:49:16 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01814C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Aug 2022 17:49:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3C56FB807E5;
 Sat,  6 Aug 2022 17:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94307C433C1;
 Sat,  6 Aug 2022 17:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659808153;
 bh=RxtmZYHD6JQiPd7rS8xjgpE021L9DBW6BkED3sLEQ5U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RF2gYgcNME2BDUT/1+mqsxrhQCkUILJS8tLZqHtq6KCxhiRKt4/GPP4FrdFCYMitm
 dPZTuB4DA/5YoQUJQDbkFPUK/352na6Eg3Gl2oGp6OHjjhuB5IDCvn/R9U4K0ppVAH
 qGTTMhsGd9dNZ1aTZXATJm1xUAiuQBnJjuCu00F44RwNNBuiXt4aCjpxDs/plkUZ55
 TYcXcHd1W5L8mUIBAl9tSixVQrbEzWRvhPwHygVIaHWGhfoU+V0qnlHvE/nid9ZKCm
 KSn0gunoi3xQ76hV6GUvKsM6O5eFbsfA8uPzCK7QCKLmezy6f9M+EKKLl52DX1bdaY
 VgVq4b3oNJ4ng==
Date: Sat, 6 Aug 2022 18:59:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Message-ID: <20220806185919.3ec5b8e6@jic23-huawei>
In-Reply-To: <20220715122903.332535-6-nuno.sa@analog.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
 <20220715122903.332535-6-nuno.sa@analog.com>
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
Subject: Re: [Linux-stm32] [PATCH v3 05/15] iio: inkern: move to fwnode
	properties
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

T24gRnJpLCAxNSBKdWwgMjAyMiAxNDoyODo1MyArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gVGhpcyBtb3ZlcyB0aGUgSUlPIGluIGtlcm5lbCBpbnRlcmZhY2Ug
dG8gdXNlIGZ3bm9kZSBwcm9wZXJ0aWVzIGFuZCB0aHVzCj4gYmUgZmlybXdhcmUgYWdub3N0aWMu
Cj4gCj4gTm90ZSB0aGF0IHRoZSBpbnRlcmZhY2UgaXMgc3RpbGwgbm90IGZpcm13YXJlIGFnbm9z
dGljLiBBdCB0aGlzIHBvaW50IHdlCj4gaGF2ZSBib3RoIE9GIGFuZCBmd25vZGUgaW50ZXJmYWNl
cyBzbyB0aGF0IHdlIGRvbid0IGJyZWFrIGFueSB1c2VyLiBPbgo+IHRvcCBvZiB0aGlzIHdlIGFs
c28gd2FudCB0byBoYXZlIGEgcGVyIGRyaXZlciBjb252ZXJzaW9uIGFuZCB0aGF0IGlzIHRoZQo+
IG1haW4gcmVhc29uIHdlIGhhdmUgYm90aCBvZl94bGF0ZSgpIGFuZCBmd25vZGVfeGxhdGUoKSBz
dXBwb3J0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+
Cj4gUmV2aWV3ZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNv
bT4KCk5pY2UuIE9uZSB0cml2aWFsIGZvbGxvdyB0aHJvdWdoIG9mIHdyb25nIGNvbW1lbnQgc3lu
dGF4LiBJJ2xsIGZpeCB1cAppZiBJIHBpY2sgdGhlIHNlcmllcyB1cCBiZWZvcmUgeW91IGRvIGEg
cmVzcGluIGZvciBvdGhlciByZWFzb25zLgo+IC0tLQo+ICBkcml2ZXJzL2lpby9pbmtlcm4uYyAg
ICAgICAgIHwgMTU5ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4gIGluY2x1
ZGUvbGludXgvaWlvL2NvbnN1bWVyLmggfCAgMzYgKysrKy0tLS0KPiAgaW5jbHVkZS9saW51eC9p
aW8vaWlvLmggICAgICB8ICAgNSArKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDEwOCBpbnNlcnRpb25z
KCspLCA5MiBkZWxldGlvbnMoLSkKPiAKPiAtc3RydWN0IGlpb19jaGFubmVsICpfX29mX2lpb19j
aGFubmVsX2dldF9ieV9uYW1lKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gLQkJCQkJCSBjb25z
dCBjaGFyICpuYW1lKQo+ICtzdHJ1Y3QgaWlvX2NoYW5uZWwgKgo+ICtfX2Z3bm9kZV9paW9fY2hh
bm5lbF9nZXRfYnlfbmFtZShzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLCBjb25zdCBjaGFy
ICpuYW1lKQo+ICB7Cj4gIAlzdHJ1Y3QgaWlvX2NoYW5uZWwgKmNoYW47Cj4gIAlpbnQgaW5kZXgg
PSAwOwo+IEBAIC0yMjAsMTkgKzIzNiwyMCBAQCBzdHJ1Y3QgaWlvX2NoYW5uZWwgKl9fb2ZfaWlv
X2NoYW5uZWxfZ2V0X2J5X25hbWUoc3RydWN0IGRldmljZV9ub2RlICpucCwKPiAgCS8qCj4gIAkg
KiBGb3IgbmFtZWQgaWlvIGNoYW5uZWxzLCBmaXJzdCBsb29rIHVwIHRoZSBuYW1lIGluIHRoZQo+
ICAJICogImlvLWNoYW5uZWwtbmFtZXMiIHByb3BlcnR5LiAgSWYgaXQgY2Fubm90IGJlIGZvdW5k
LCB0aGUKPiAtCSAqIGluZGV4IHdpbGwgYmUgYW4gZXJyb3IgY29kZSwgYW5kIG9mX2lpb19jaGFu
bmVsX2dldCgpCj4gKwkgKiBpbmRleCB3aWxsIGJlIGFuIGVycm9yIGNvZGUsIGFuZCBmd25vZGVf
aWlvX2NoYW5uZWxfZ2V0KCkKPiAgCSAqIHdpbGwgZmFpbC4KPiAgCSAqLwo+ICAJaWYgKG5hbWUp
Cj4gLQkJaW5kZXggPSBvZl9wcm9wZXJ0eV9tYXRjaF9zdHJpbmcobnAsICJpby1jaGFubmVsLW5h
bWVzIiwgbmFtZSk7Cj4gKwkJaW5kZXggPSBmd25vZGVfcHJvcGVydHlfbWF0Y2hfc3RyaW5nKGZ3
bm9kZSwgImlvLWNoYW5uZWwtbmFtZXMiLAo+ICsJCQkJCQkgICAgIG5hbWUpOwo+ICAKPiAtCWNo
YW4gPSBvZl9paW9fY2hhbm5lbF9nZXQobnAsIGluZGV4KTsKPiArCWNoYW4gPSBmd25vZGVfaWlv
X2NoYW5uZWxfZ2V0KGZ3bm9kZSwgaW5kZXgpOwo+ICAJaWYgKCFJU19FUlIoY2hhbikgfHwgUFRS
X0VSUihjaGFuKSA9PSAtRVBST0JFX0RFRkVSKQo+ICAJCXJldHVybiBjaGFuOwo+ICAJaWYgKG5h
bWUpIHsKPiAgCQlpZiAoaW5kZXggPj0gMCkgewo+IC0JCQlwcl9lcnIoIkVSUk9SOiBjb3VsZCBu
b3QgZ2V0IElJTyBjaGFubmVsICVwT0Y6JXMoJWkpXG4iLAo+IC0JCQkgICAgICAgbnAsIG5hbWUs
IGluZGV4KTsKPiArCQkJcHJfZXJyKCJFUlJPUjogY291bGQgbm90IGdldCBJSU8gY2hhbm5lbCAl
cGZ3OiVzKCVpKVxuIiwKPiArCQkJICAgICAgIGZ3bm9kZSwgbmFtZSwgaW5kZXgpOwo+ICAJCQkv
Kgo+ICAJCQkgKiBJbiB0aGlzIGNhc2UsIHdlIGZvdW5kICduYW1lJyBpbiAnaW8tY2hhbm5lbC1u
YW1lcycKPiAgCQkJICogYnV0IHNvbWVob3cgd2Ugc3RpbGwgZmFpbCBzbyB0aGF0IHdlIHNob3Vs
ZCBub3QgcHJvY2VlZAo+IEBAIC0yNDIsMTYgKzI1OSwxNiBAQCBzdHJ1Y3QgaWlvX2NoYW5uZWwg
Kl9fb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoc3RydWN0IGRldmljZV9ub2RlICpucCwKPiAg
CQkJICovCj4gIAkJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwo+ICAJCX0KPiAtCQkvKiBJZiBp
bmRleCA8IDAsIHRoZW4gb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MoKSBmYWlscwo+IC0JCSAq
IHdpdGggLUVJTlZBTCB3aGljaCBpcyBleHBlY3RlZC4gV2Ugc2hvdWxkIG5vdCBwcm9jZWVkCj4g
LQkJICogaWYgd2UgZ2V0IGFueSBvdGhlciBlcnJvci4KCldyb25nIGNvbW1lbnQgc3ludGF4LiBJ
IGd1ZXNzIEkgY2FuIGZpeCB0aGlzIG9uZSBhcyB3ZWxsIGlmIG5vdGhpbmcgZWxzZSBjb21lcyB1
cC4KT3IgSSBtaWdodCBiZSBsYXp5IGFuZCBvbmx5IGZpeCB0aGlzIG9uZSBhcyBpdCByZXBsYWNl
cyB0aGUgcHJldmlvdXMgd3Jvbmcgb25lLgoKPiArCQkvKiBJZiBpbmRleCA8IDAsIHRoZW4gZndu
b2RlX3Byb3BlcnR5X2dldF9yZWZlcmVuY2VfYXJncygpIGZhaWxzCj4gKwkJICogd2l0aCAtRUlO
VkFMIG9yIC1FTk9FTlQgKEFDUEkgY2FzZSkgd2hpY2ggaXMgZXhwZWN0ZWQuIFdlCj4gKwkJICog
c2hvdWxkIG5vdCBwcm9jZWVkIGlmIHdlIGdldCBhbnkgb3RoZXIgZXJyb3IuCj4gIAkJICovCj4g
LQkJaWYgKFBUUl9FUlIoY2hhbikgIT0gLUVJTlZBTCkKPiArCQlpZiAoUFRSX0VSUihjaGFuKSAh
PSAtRUlOVkFMICYmIFBUUl9FUlIoY2hhbikgIT0gLUVOT0VOVCkKPiAgCQkJcmV0dXJuIGNoYW47
Cj4gIAl9IGVsc2UgaWYgKFBUUl9FUlIoY2hhbikgIT0gLUVOT0VOVCkgewo+ICAJCS8qCj4gIAkJ
ICogaWYgIW5hbWUsIHRoZW4gd2Ugc2hvdWxkIG9ubHkgcHJvY2VlZCB0aGUgbG9va3VwIGlmCj4g
LQkJICogb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MoKSByZXR1cm5zIC1FTk9FTlQuCj4gKwkJ
ICogZndub2RlX3Byb3BlcnR5X2dldF9yZWZlcmVuY2VfYXJncygpIHJldHVybnMgLUVOT0VOVC4K
PiAgCQkgKi8KPiAgCQlyZXR1cm4gY2hhbjsKPiAgCX0KPiBAQCAtMjYwLDEzICsyNzcsMTQgQEAg
c3RydWN0IGlpb19jaGFubmVsICpfX29mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnAsCj4gIAlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKPiAgfQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
