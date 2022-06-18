Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2602D550548
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Jun 2022 15:57:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6513C03FE0;
	Sat, 18 Jun 2022 13:57:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F2DAC035BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Jun 2022 13:57:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0EA6860B1E;
 Sat, 18 Jun 2022 13:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1EE2C3411A;
 Sat, 18 Jun 2022 13:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655560638;
 bh=lRorEWc2KTi7z7ymOlOmHg76zQDyaFrAFstUtz9SnBg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AHFj/HFoFUUH94y50WWJJ41Nc0+xVyu0BnPz6ynMPeCuA7tW1khpFHcZOcygfpS66
 1PJdLDzuD9XLdoajYWLREwRAil3c82vDUZ1NpmJkmEvfQh8et0/u/ebN3adQ5YS49E
 8rFcodb3jxfyoQyunzWPPKvsaeSLocaZU+cQic/JV8F9tZOPKEeTIt8kcRe5ZukkUq
 tC8mkXxl1GHz/gJLiyIVLfWHvitlR6Yvz5/CJvrG8iSMlMnfArAYkQhVYGdY+V8m14
 j2OCBtwYS9BuyltkfUIfF1QkJE3GHgLcO5pM1rV3UdWaNJotY41oTuDuq5mtMGUnRq
 zduVJofRh6Ktw==
Date: Sat, 18 Jun 2022 15:06:24 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Message-ID: <20220618150624.1bfc8914@jic23-huawei>
In-Reply-To: <35e7c36c9ecbdc67698b413cf867cf19442ccfa9.camel@gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-23-nuno.sa@analog.com>
 <20220611161701.46a68837@jic23-huawei>
 <35e7c36c9ecbdc67698b413cf867cf19442ccfa9.camel@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Gross <agross@kernel.org>, linux-imx@nxp.com,
 Zhang Rui <rui.zhang@intel.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-mediatek@lists.infradead.org,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gwendal Grignou <gwendal@chromium.org>, Tali Perry <tali.perry1@gmail.com>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 linux-mips@vger.kernel.org, Thara Gopinath <thara.gopinath@linaro.org>,
 linux-renesas-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 22/34] iio: inkern: only return error
 codes in iio_channel_get_*() APIs
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

T24gTW9uLCAxMyBKdW4gMjAyMiAwOTowNjo0OSArMDIwMApOdW5vIFPDoSA8bm9uYW1lLm51bm9A
Z21haWwuY29tPiB3cm90ZToKCj4gT24gU2F0LCAyMDIyLTA2LTExIGF0IDE2OjE3ICswMTAwLCBK
b25hdGhhbiBDYW1lcm9uIHdyb3RlOgo+ID4gT24gRnJpLCAxMCBKdW4gMjAyMiAxMDo0NTozMyAr
MDIwMAo+ID4gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4gd3JvdGU6Cj4gPiAgIAo+ID4g
PiBBUElzIGxpa2Ugb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoKSBhbmQgb2ZfaWlvX2NoYW5u
ZWxfZ2V0X2FsbCgpCj4gPiA+IHdlcmUKPiA+ID4gcmV0dXJuaW5nIGEgbWl4IG9mIE5VTEwgYW5k
IGVycm9yIHBvaW50ZXJzIGJlaW5nIE5VTEwgdGhlIHdheSB0byAgCj4gPiAKPiA+IHBvaW50ZXJz
IHdpdGggTlVMTCBiZWluZyB0aGUgd2F5IHRvLi4uCj4gPiAgIAo+ID4gPiAibm90aWZ5IiB0aGF0
IHdlIHNob3VsZCBkbyBhICJzeXN0ZW0iIGxvb2t1cCBmb3IgY2hhbm5lbHMuIFRoaXMKPiA+ID4g
bWFrZQo+ID4gPiBpdCB2ZXJ5IGNvbmZ1c2luZyBhbmQgcHJvbmUgdG8gZXJyb3JzIGFzIGNvbW1p
dCBkYmJjY2Y3YzIwYmYKPiA+ID4gKCJpaW86IGlua2VybjogZml4IHJldHVybiB2YWx1ZSBpbgo+
ID4gPiBkZXZtX29mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKCkiKQo+ID4gPiBwcm92ZXMuIE9u
IHRvcCBvZiB0aGlzLCBwYXR0ZXJucyBsaWtlICdpZiAoY2hhbm5lbCAhPSBOVUxMKSByZXR1cm4K
PiA+ID4gY2hhbm5lbCcKPiA+ID4gd2VyZSBiZWluZyB1c2VkIHdoZXJlIGNoYW5uZWwgY291bGQg
YWN0dWFsbHkgYmUgYW4gZXJyb3IgY29kZSB3aGljaAo+ID4gPiBtYWtlcyB0aGUgY29kZSBoYXJk
IHRvIHJlYWQuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBh
bmFsb2cuY29tPgo+ID4gPiAtLS0KPiA+ID4gwqBkcml2ZXJzL2lpby9pbmtlcm4uYyB8IDI0ICsr
KysrKysrKysrLS0tLS0tLS0tLS0tLQo+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRp
b25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2lpby9pbmtlcm4uYyBiL2RyaXZlcnMvaWlvL2lua2Vybi5jCj4gPiA+IGluZGV4IDg3ZmQyYTBk
NDRmMi4uMzFkOWMxMjIxOTlhIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2lpby9pbmtlcm4u
Ywo+ID4gPiArKysgYi9kcml2ZXJzL2lpby9pbmtlcm4uYwo+ID4gPiBAQCAtMjE0LDcgKzIxNCw3
IEBAIHN0YXRpYyBzdHJ1Y3QgaWlvX2NoYW5uZWwKPiA+ID4gKm9mX2lpb19jaGFubmVsX2dldChz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBpbnQgaW5kZXgpCj4gPiA+IMKgc3RydWN0IGlpb19jaGFu
bmVsICpvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZShzdHJ1Y3QgZGV2aWNlX25vZGUKPiA+ID4g
Km5wLAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBjaGFy
ICpuYW1lKQo+ID4gPiDCoHsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgc3RydWN0IGlpb19jaGFubmVs
ICpjaGFuID0gTlVMTDsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGlpb19jaGFubmVsICpj
aGFuOwo+ID4gPiDCoAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLyogV2FsayB1cCB0aGUgdHJlZSBv
ZiBkZXZpY2VzIGxvb2tpbmcgZm9yIGEgbWF0Y2hpbmcgaWlvCj4gPiA+IGNoYW5uZWwgKi8KPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoHdoaWxlIChucCkgewo+ID4gPiBAQCAtMjMxLDExICsyMzEsMTEg
QEAgc3RydWN0IGlpb19jaGFubmVsCj4gPiA+ICpvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZShz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5hbWUpOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGNoYW4gPSBvZl9paW9fY2hhbm5lbF9nZXQobnAsIGluZGV4KTsKPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIUlTX0VSUihjaGFuKSB8fCBQ
VFJfRVJSKGNoYW4pID09IC0KPiA+ID4gRVBST0JFX0RFRkVSKQo+ID4gPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOyAgCj4gPiAKPiA+IFRoaXMg
b3JpZ2luYWwgYmVoYXZpb3VyIGlzICdpbnRlcmVzdGluZycuIElmIHdlIGdldCBhIGVycm9yIGxp
a2UgLQo+ID4gRU5PTUVNCj4gPiB3ZSBzaG91bGQgcmV0dXJuIGl0IHJhdGhlciB0aGFuIGNhcnJ5
IG9uLsKgIERvIHdlIGhhdmUgZW5vdWdoCj4gPiBrbm93bGVkZ2UKPiA+IG9mIHBvc3NpYmxlIGVy
cm9ycyBoZXJlIHRvIGJlIG1vcmUgZXhwbGljaXQgb24gd2hlbiB3ZSBrZWVwIGxvb2tpbmcKPiA+
IHVwCj4gPiB0aGUgdHJlZT/CoCBJIHRoaW5rIHdlIGNhbiBnZXQgLUVOT0VOVCBmcm9tCj4gPiBv
Zl9wYXJzZV9waGFuZGxlX3dpdGhfYXJncygpCj4gPiAKPiA+IFRoYXQgcmFpc2VzIGFuIGludGVy
ZXN0aW5nIHF1ZXN0aW9uIG9uIHdoZXRoZXIgLUVOT0RFViBpcyB0aGUgcmlnaHQKPiA+IHJlc3Bv
bnNlCj4gPiBmb3IgdGhlIHByZXZpb3VzbHkgTlVMTCBjYXNlIG9yIGlzIC1FTk9FTlQgbW9yZSBj
b25zaXN0ZW50IHdpdGggb3RoZXIKPiA+IG9mXyBmdW5jdGlvbnM/wqAgTm8gZGV2aWNlIGNvdWxk
IGJlIHRob3VnaHQgb2YgYXMgYmVpbmcgdGhlIGNhc2UgdGhhdAo+ID4gbmVlZHMKPiA+IHRvIGRl
ZmVyIChpbiBob3BlIGl0IHR1cm5zIHVwIGxhdGVyKSB3aGVyZWFzIG5vIGVudHJ5IG1lYW5zIGl0
IHdpbGwKPiA+IG5ldmVyCj4gPiBzdWNjZWVkLiAgCj4gCj4gRnJvbSB3aGF0IEkgY291bGQgc2Vl
LCBvZl9wYXJzZV9waGFuZGxlX3dpdGhfYXJncygpIGVpdGhlciByZXR1cm5zwqAKPiAtRUlOVkFM
IG9yIC1FTk9FTlQuIFdlIGFsc28gaGF2ZSB0aGUgaW50ZXJuYWwgb2ZfaWlvX2NoYW5uZWxfZ2V0
KCkKPiB3aGljaCBjYW4gcmV0dXJuIC1FTk9NRU0uIFNvIEkgZ3Vlc3Mgd2Ugc2hvdWxkIG9ubHkg
Y29udGludWUgbG9va2luZyBpZgo+IHdlIGdldCAtRU5PRU5UPwo+IAo+IFRvIGJlIGNsZWFyLCBk
byB5b3Ugc3RpbGwgcHJlZmVyIHRvIGV4cGxpY2l0bHkgcmV0dXJuIC1FTk9ERVYgaW4gdGhlCj4g
cHJldmlvdXMgTlVMTCBjYXNlcyBvciBzaG91bGQgd2UgaG9ub3IgdGhlIHJldHVybiBjb2RlIGZy
b20gCj4gb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MoKSBhbmQganVzdCByZXR1cm4gY2hhbnMg
KGFuZCB0aHVzIEVOT0VOVCk/CllvdSd2ZSBsb29rZWQgYXQgdGhpcyBtb3JlIHRoYW4gbWUsIHNv
IHdoaWxzdCBJIHRoaW5rIC1FTk9FTlQgaXMgcHJvYmFibHkKc2xpZ2h0bHkgbW9yZSBjb25zaXN0
ZW50IEknbGwgZ28gd2l0aCB3aGF0ZXZlciB5b3UgY29uY2x1ZGUgaXMgdGhlCmJlc3Qgb3B0aW9u
LiAgTWF5YmUgYWRkIGEgc21hbGwgYW1vdW50IG9mIGRlc2NyaXB0aW9uIG9uIHdoYXQgeW91IGNo
b3NlCmFuZCB3aHkgdG8gdGhlIHJlbGV2YW50IHBhdGNoIGRlc2NyaXB0aW9ucy4KClRoYW5rcywK
CkpvbmF0aGFuCgoKPiAKPiAtIE51bm8gU8OhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
