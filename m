Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEFB58B79C
	for <lists+linux-stm32@lfdr.de>; Sat,  6 Aug 2022 20:20:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3DF7C03FC8;
	Sat,  6 Aug 2022 18:20:10 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E016C035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Aug 2022 18:20:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C3ADBB80814;
 Sat,  6 Aug 2022 18:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC14EC4314B;
 Sat,  6 Aug 2022 18:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659810007;
 bh=cKFxoC7vA/Y8JVtO5ZGbKu05Jmpcm3DGgzXHEExY9Ro=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uehdPVFVEZhduXOFzIYYcUoxMxhuGoYzIFsS82t+e+i1tgP9Rz4m9dp3fw9tNBtEW
 x1Wqqzem9nReSeo1fjzHqy80uMQqPZJcqfqk9vMmauwpA257qsJIboy9YR0rJlZRqX
 8LFhLvv3zQWj2ZR0FRFe97tjnyU3GPDmJqgVynK/59y+acYs3db0We84k+CrsGXZ66
 R4tvIV5DLSK5X1htaxET4Hb0YaPGEeK/8mj/8IP2rUFW0lPW6UOxPqi+ScPlXwVu82
 bzUcNHYVdk+wTj0oHaGuO/PMKSlDUbGGI9IsoG5d/Gcv5NDtAtJ43HC218JEVPLkRl
 PvshjCQRasvsA==
Date: Sat, 6 Aug 2022 19:30:16 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Message-ID: <20220806193016.7ecf8857@jic23-huawei>
In-Reply-To: <20220715122903.332535-5-nuno.sa@analog.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
 <20220715122903.332535-5-nuno.sa@analog.com>
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
Subject: Re: [Linux-stm32] [PATCH v3 04/15] iio: inkern: split
 of_iio_channel_get_by_name()
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

T24gRnJpLCAxNSBKdWwgMjAyMiAxNDoyODo1MiArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gVGhpcyBjaGFuZ2Ugc3BsaXRzIG9mX2lpb19jaGFubmVsX2dldF9i
eV9uYW1lKCkgc28gdGhhdCBpdCBkZWNvdXBsZXMKPiBsb29raW5nIGZvciBjaGFubmVscyBpbiB0
aGUgY3VycmVudCBub2RlIGZyb20gbG9va2luZyBpbiBpdCdzIHBhcmVudHMKPiBub2Rlcy4gVGhp
cyB3aWxsIGJlIGhlbHBmdWwgd2hlbiBtb3ZpbmcgdG8gZndub2RlIHByb3BlcnRpZXMgd2hlcmUg
d2UKPiBuZWVkIHRvIHJlbGVhc2UgdGhlIGhhbmRsZXMgd2hlbiBsb29raW5nIGZvciBjaGFubmVs
cyBpbiBwYXJlbnQncyBub2Rlcy4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4u
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+Cj4gUmV2
aWV3ZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4KQSBm
ZXcgdGhpbmdzIGZyb20gYSBidWlsZCB0ZXN0IChhZnRlciBoYW5kIGFwcGx5aW5nIHRoaXMgYmVj
YXVzZSBvZgppc3N1ZXMgd2l0aCB0aGUgY29tbWVudCB0aGluZyBmb2xsb3dpbmcgdGhyb3VnaCB0
aGUgc2VyaWVzKS4KClNlZW0gb2J2aW91cyBzbyBJIGZpeGVkIHRoZW0gdXAuCgo+IC0tLQo+ICBk
cml2ZXJzL2lpby9pbmtlcm4uYyB8IDEwOSArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspLCA0NCBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vaW5rZXJuLmMgYi9kcml2ZXJz
L2lpby9pbmtlcm4uYwo+IGluZGV4IGM2ZjFjZmUwOWJkMy4uZjk3Yjc5NjdkM2Q5IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvaWlvL2lua2Vybi5jCj4gKysrIGIvZHJpdmVycy9paW8vaW5rZXJuLmMK
PiBAQCAtMjExLDYxICsyMTEsODIgQEAgc3RhdGljIHN0cnVjdCBpaW9fY2hhbm5lbCAqb2ZfaWlv
X2NoYW5uZWxfZ2V0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIGludCBpbmRleCkKPiAgCXJldHVy
biBFUlJfUFRSKGVycik7Cj4gIH0KPiAgCj4gK3N0cnVjdCBpaW9fY2hhbm5lbCAqX19vZl9paW9f
Y2hhbm5lbF9nZXRfYnlfbmFtZShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLApzdGF0aWMgCj4gKwkJ
CQkJCSBjb25zdCBjaGFyICpuYW1lKQo+ICt7Cj4gKwlzdHJ1Y3QgaWlvX2NoYW5uZWwgKmNoYW47
Cj4gKwlpbnQgaW5kZXggPSAwOwo+ICsKPiArCS8qCj4gKwkgKiBGb3IgbmFtZWQgaWlvIGNoYW5u
ZWxzLCBmaXJzdCBsb29rIHVwIHRoZSBuYW1lIGluIHRoZQo+ICsJICogImlvLWNoYW5uZWwtbmFt
ZXMiIHByb3BlcnR5LiAgSWYgaXQgY2Fubm90IGJlIGZvdW5kLCB0aGUKPiArCSAqIGluZGV4IHdp
bGwgYmUgYW4gZXJyb3IgY29kZSwgYW5kIG9mX2lpb19jaGFubmVsX2dldCgpCj4gKwkgKiB3aWxs
IGZhaWwuCj4gKwkgKi8KPiArCWlmIChuYW1lKQo+ICsJCWluZGV4ID0gb2ZfcHJvcGVydHlfbWF0
Y2hfc3RyaW5nKG5wLCAiaW8tY2hhbm5lbC1uYW1lcyIsIG5hbWUpOwo+ICsKPiArCWNoYW4gPSBv
Zl9paW9fY2hhbm5lbF9nZXQobnAsIGluZGV4KTsKPiArCWlmICghSVNfRVJSKGNoYW4pIHx8IFBU
Ul9FUlIoY2hhbikgPT0gLUVQUk9CRV9ERUZFUikKPiArCQlyZXR1cm4gY2hhbjsKPiArCWlmIChu
YW1lKSB7Cj4gKwkJaWYgKGluZGV4ID49IDApIHsKPiArCQkJcHJfZXJyKCJFUlJPUjogY291bGQg
bm90IGdldCBJSU8gY2hhbm5lbCAlcE9GOiVzKCVpKVxuIiwKPiArCQkJICAgICAgIG5wLCBuYW1l
LCBpbmRleCk7Cj4gKwkJCS8qCj4gKwkJCSAqIEluIHRoaXMgY2FzZSwgd2UgZm91bmQgJ25hbWUn
IGluICdpby1jaGFubmVsLW5hbWVzJwo+ICsJCQkgKiBidXQgc29tZWhvdyB3ZSBzdGlsbCBmYWls
IHNvIHRoYXQgd2Ugc2hvdWxkIG5vdCBwcm9jZWVkCj4gKwkJCSAqIHdpdGggYW55IG90aGVyIGxv
b2t1cC4gSGVuY2UsIGV4cGxpY2l0bHkgcmV0dXJuIC1FSU5WQUwKPiArCQkJICogKG1heWJlIG5v
dCB0aGUgYmV0dGVyIGVycm9yIGNvZGUpIHNvIHRoYXQgdGhlIGNhbGxlcgo+ICsJCQkgKiB3b24n
dCBkbyBhIHN5c3RlbSBsb29rdXAuCj4gKwkJCSAqLwo+ICsJCQlyZXR1cm4gRVJSX1BUUigtRUlO
VkFMKTsKPiArCQl9Cj4gKwkJLyogSWYgaW5kZXggPCAwLCB0aGVuIG9mX3BhcnNlX3BoYW5kbGVf
d2l0aF9hcmdzKCkgZmFpbHMKPiArCQkgKiB3aXRoIC1FSU5WQUwgd2hpY2ggaXMgZXhwZWN0ZWQu
IFdlIHNob3VsZCBub3QgcHJvY2VlZAo+ICsJCSAqIGlmIHdlIGdldCBhbnkgb3RoZXIgZXJyb3Iu
Cj4gKwkJICovCj4gKwkJaWYgKFBUUl9FUlIoY2hhbikgIT0gLUVJTlZBTCkKPiArCQkJcmV0dXJu
IGNoYW47Cj4gKwl9IGVsc2UgaWYgKFBUUl9FUlIoY2hhbikgIT0gLUVOT0VOVCkgewo+ICsJCS8q
Cj4gKwkJICogaWYgIW5hbWUsIHRoZW4gd2Ugc2hvdWxkIG9ubHkgcHJvY2VlZCB0aGUgbG9va3Vw
IGlmCj4gKwkJICogb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MoKSByZXR1cm5zIC1FTk9FTlQu
Cj4gKwkJICovCj4gKwkJcmV0dXJuIGNoYW47Cj4gKwl9Cj4gKwo+ICsJLyogc28gd2UgY29udGlu
dWUgdGhlIGxvb2t1cCAqLwo+ICsJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7Cj4gK30KPiArCj4g
IHN0cnVjdCBpaW9fY2hhbm5lbCAqb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoc3RydWN0IGRl
dmljZV9ub2RlICpucCwKPiAgCQkJCQkgICAgICAgY29uc3QgY2hhciAqbmFtZSkKPiAgewo+ICAJ
c3RydWN0IGlpb19jaGFubmVsICpjaGFuOwo+ICAKPiAgCS8qIFdhbGsgdXAgdGhlIHRyZWUgb2Yg
ZGV2aWNlcyBsb29raW5nIGZvciBhIG1hdGNoaW5nIGlpbyBjaGFubmVsICovCj4gKwljaGFuID0g
X19vZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZShucCwgbmFtZSk7Cj4gKwlpZiAoIUlTX0VSUihj
aGFuKSB8fCBQVFJfRVJSKGNoYW4pICE9IC1FTk9ERVYpCj4gKwkJcmV0dXJuIGNoYW47Cj4gKwo+
ICsJLyoKPiArCSAqIE5vIG1hdGNoaW5nIElJTyBjaGFubmVsIGZvdW5kIG9uIHRoaXMgbm9kZS4K
PiArCSAqIElmIHRoZSBwYXJlbnQgbm9kZSBoYXMgYSAiaW8tY2hhbm5lbC1yYW5nZXMiIHByb3Bl
cnR5LAo+ICsJICogdGhlbiB3ZSBjYW4gdHJ5IG9uZSBvZiBpdHMgY2hhbm5lbHMuCj4gKwkgKi8K
PiArCW5wID0gbnAtPnBhcmVudDsKPiAgCXdoaWxlIChucCkgewo+ICAJCWludCBpbmRleCA9IDA7
Ck5vdCB1c2VkLgoKPiAgCj4gLQkJLyoKPiAtCQkgKiBGb3IgbmFtZWQgaWlvIGNoYW5uZWxzLCBm
aXJzdCBsb29rIHVwIHRoZSBuYW1lIGluIHRoZQo+IC0JCSAqICJpby1jaGFubmVsLW5hbWVzIiBw
cm9wZXJ0eS4gIElmIGl0IGNhbm5vdCBiZSBmb3VuZCwgdGhlCj4gLQkJICogaW5kZXggd2lsbCBi
ZSBhbiBlcnJvciBjb2RlLCBhbmQgb2ZfaWlvX2NoYW5uZWxfZ2V0KCkKPiAtCQkgKiB3aWxsIGZh
aWwuCj4gLQkJICovCj4gLQkJaWYgKG5hbWUpCj4gLQkJCWluZGV4ID0gb2ZfcHJvcGVydHlfbWF0
Y2hfc3RyaW5nKG5wLCAiaW8tY2hhbm5lbC1uYW1lcyIsCj4gLQkJCQkJCQkgbmFtZSk7Cj4gLQkJ
Y2hhbiA9IG9mX2lpb19jaGFubmVsX2dldChucCwgaW5kZXgpOwo+IC0JCWlmICghSVNfRVJSKGNo
YW4pIHx8IFBUUl9FUlIoY2hhbikgPT0gLUVQUk9CRV9ERUZFUikKPiAtCQkJcmV0dXJuIGNoYW47
Cj4gLQkJaWYgKG5hbWUpIHsKPiAtCQkJaWYgKGluZGV4ID49IDApIHsKPiAtCQkJCXByX2Vycigi
RVJST1I6IGNvdWxkIG5vdCBnZXQgSUlPIGNoYW5uZWwgJXBPRjolcyglaSlcbiIsCj4gLQkJCQkg
ICAgICAgbnAsIG5hbWUsIGluZGV4KTsKPiAtCQkJCS8qCj4gLQkJCQkgKiBJbiB0aGlzIGNhc2Us
IHdlIGZvdW5kICduYW1lJyBpbiAnaW8tY2hhbm5lbC1uYW1lcycKPiAtCQkJCSAqIGJ1dCBzb21l
aG93IHdlIHN0aWxsIGZhaWwgc28gdGhhdCB3ZSBzaG91bGQgbm90IHByb2NlZWQKPiAtCQkJCSAq
IHdpdGggYW55IG90aGVyIGxvb2t1cC4gSGVuY2UsIGV4cGxpY2l0bHkgcmV0dXJuIC1FSU5WQUwK
PiAtCQkJCSAqIChtYXliZSBub3QgdGhlIGJldHRlciBlcnJvciBjb2RlKSBzbyB0aGF0IHRoZSBj
YWxsZXIKPiAtCQkJCSAqIHdvbid0IGRvIGEgc3lzdGVtIGxvb2t1cC4KPiAtCQkJCSAqLwo+IC0J
CQkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7Cj4gLQkJCX0KPiAtCQkJLyogSWYgaW5kZXggPCAw
LCB0aGVuIG9mX3BhcnNlX3BoYW5kbGVfd2l0aF9hcmdzKCkgZmFpbHMKPiAtCQkJICogd2l0aCAt
RUlOVkFMIHdoaWNoIGlzIGV4cGVjdGVkLiBXZSBzaG91bGQgbm90IHByb2NlZWQKPiAtCQkJICog
aWYgd2UgZ2V0IGFueSBvdGhlciBlcnJvci4KPiAtCQkJICovCj4gLQkJCWlmIChQVFJfRVJSKGNo
YW4pICE9IC1FSU5WQUwpCj4gLQkJCQlyZXR1cm4gY2hhbjsKPiAtCQl9IGVsc2UgaWYgKFBUUl9F
UlIoY2hhbikgIT0gLUVOT0VOVCkgewo+IC0JCQkvKgo+IC0JCQkgKiBpZiAhbmFtZSwgdGhlbiB3
ZSBzaG91bGQgb25seSBwcm9jZWVkIHRoZSBsb29rdXAgaWYKPiAtCQkJICogb2ZfcGFyc2VfcGhh
bmRsZV93aXRoX2FyZ3MoKSByZXR1cm5zIC1FTk9FTlQuCj4gLQkJCSAqLwo+ICsJCWlmICghb2Zf
Z2V0X3Byb3BlcnR5KG5wLCAiaW8tY2hhbm5lbC1yYW5nZXMiLCBOVUxMKSkKPiArCQkJcmV0dXJu
IEVSUl9QVFIoLUVOT0RFVik7Cj4gKwo+ICsJCWNoYW4gPSBfX29mX2lpb19jaGFubmVsX2dldF9i
eV9uYW1lKG5wLCBuYW1lKTsKPiArCQlpZiAoIUlTX0VSUihjaGFuKSB8fCBQVFJfRVJSKGNoYW4p
ICE9IC1FTk9ERVYpCj4gIAkJCXJldHVybiBjaGFuOwo+IC0JCX0KPiAtCQkvKgo+IC0JCSAqIE5v
IG1hdGNoaW5nIElJTyBjaGFubmVsIGZvdW5kIG9uIHRoaXMgbm9kZS4KPiAtCQkgKiBJZiB0aGUg
cGFyZW50IG5vZGUgaGFzIGEgImlvLWNoYW5uZWwtcmFuZ2VzIiBwcm9wZXJ0eSwKPiAtCQkgKiB0
aGVuIHdlIGNhbiB0cnkgb25lIG9mIGl0cyBjaGFubmVscy4KPiAtCQkgKi8KPiArCj4gIAkJbnAg
PSBucC0+cGFyZW50Owo+IC0JCWlmIChucCAmJiAhb2ZfZ2V0X3Byb3BlcnR5KG5wLCAiaW8tY2hh
bm5lbC1yYW5nZXMiLCBOVUxMKSkKPiAtCQkJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7Cj4gIAl9
Cj4gIAo+ICAJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
