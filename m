Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D3457041C
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Jul 2022 15:23:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC9A0C0C921;
	Mon, 11 Jul 2022 13:23:18 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0F6AC03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 13:23:17 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-31c89111f23so48983367b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 06:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=axlXcCK4wzxh1OC0E6EXS/IHkDmYX0iUqKB8KvL3LFw=;
 b=azAe6ar9N7tB2G+wHrOJqidSXtmkRQD0XszfgYTB2+nUuftFTGrYAwFKLK6B3VSvxS
 LYH1Ch1YfniUWTW3CljT9wnoyta+kScApyRgNBBwtUCi/8SuQpTd15On5hM+RMT/pKOw
 PMR9DZHIJNVz/bOy9TkXGjKfVd1yG6ELLdYt5M1YzJQnXHR03UvBzEXEZrZakP3yZjhg
 msD6j0yevsiH5FrMqegzrvcVo0vnL0k2Re8yem12ugUbCbH9UeagckJsjPGufgCutt6V
 CGQsws9fhqWC8Mn/goNdZTafu0+ayr/f54YG0TitzQOIrIasgcA2HjL7yimlYdQsrgHv
 atcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=axlXcCK4wzxh1OC0E6EXS/IHkDmYX0iUqKB8KvL3LFw=;
 b=TpXBWO1E5K6MdmAWGltL5R/NEAA3efwzpRpLgBM3v6U4tCiFjGUoBstfq53JBp1TgC
 wgBhRRnoJ3DF7qzijx5impnOeJFc4CylEG/UxvWmegRChPIU/+px9GOPrSA7mhRyuxTy
 skU9792OpYrz9k7XFuhC5roBeLVvDtVazpnMGiR1Y1SrLrNiFm1HrSOJdqOzflUKkyQz
 4D+7sz1EImdL/C2nRPEd4M2GWovWvnpZPH1ifWMlmxsM7Dx5cSA7FNuaecRqPY6NMXzS
 zOpqk+m+QpBwxUZ9n38T+75DisMigpF22ognIWoZucFi1zb5wTyN5OFANuTIKKrq1pMl
 +0OQ==
X-Gm-Message-State: AJIora/0GTCGOakM46/h9WwAY8cWjt7HhDBlE4TSJvN362H/kP1atjTn
 uD8kfbOHPvc2K08l4PWhmFuwjBhkSgDqHFv2usU=
X-Google-Smtp-Source: AGRyM1uI6d1T0dRGT/n+l18kDyDiKT6LcPWA/8qru61SWwefVBnYcSZqQGKMaS94keyx+UdRlU9g/tUjYLQBPiPZtwE=
X-Received: by 2002:a81:4bd7:0:b0:31c:91da:5a20 with SMTP id
 y206-20020a814bd7000000b0031c91da5a20mr20827843ywa.131.1657545796406; Mon, 11
 Jul 2022 06:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220711123835.811358-1-nuno.sa@analog.com>
In-Reply-To: <20220711123835.811358-1-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 11 Jul 2022 15:22:39 +0200
Message-ID: <CAHp75VeMXP1WyQcFQU_RW-a_CSGVMF_NsgHtLEbL8hi-n8gSVw@mail.gmail.com>
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: Cai Huoqing <cai.huoqing@linux.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Andy Gross <agross@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Zhang Rui <rui.zhang@intel.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gwendal Grignou <gwendal@chromium.org>, Tali Perry <tali.perry1@gmail.com>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thara Gopinath <thara.gopinath@linaro.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 00/15] make iio inkern interface
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

T24gTW9uLCBKdWwgMTEsIDIwMjIgYXQgMjozOCBQTSBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cu
Y29tPiB3cm90ZToKPgo+IEZpcnN0IHZlcnNpb24gb2YgdGhlIHNlcmllcyBjYW4gYmUgZm91bmQg
aGVyZToKPgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWlpby8yMDIyMDYxMDA4NDU0
NS41NDc3MDAtMS1udW5vLnNhQGFuYWxvZy5jb20vCgpJJ20gdW5kZXIgdGhlIGltcHJlc3Npb24g
dGhhdCBJIGdhdmUgdGFncyBmb3Igc29tZSBvZiB0aGVzZSBwYXRjaGVzCndoZW4gdGhleSB3ZXJl
IHRoZSBwYXJ0IG9mIHRoZSBiaWdnZXIgc2VyaWVzLiBBbSBJIHdyb25nPwpJbiBhbnkgY2FzZSBm
b3IgcGF0Y2ggNi0xNCwKUmV2aWV3ZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hl
bmtvQGdtYWlsLmNvbT4KCj4gdjIgY2hhbmdlczoKPgo+IFsxLzE1XQo+ICAgKiBGaXggdHlwbyBh
bmQgYWRkZWQgbW9yZSBkZXNjcmlwdGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4KPiBbMy8x
NV0KPiAgICogUmVtb3ZlIHN1cGVyZmx1b3VzIGNvZGU7Cj4gICAqIENvbW1pdCBtZXNzYWdlIHNw
ZWxsIGZpeGVzIGFuZCBhZGRlZCBtb3JlIGRldGFpbHM7Cj4gICAqIEltcHJvdmVkIGVycm9yIGhh
bmRsaW5nICh0aGlzIGlzIHRoZSBtb3N0IHNpZ25pZmljYW50IGNoYW5nZSBpbiB0aGlzCj4gdmVy
c2lvbi4gTW9yZSBkZXRhaWxzIG9uIHRoZSBjb21taXQgbWVzc2FnZSkuCj4KPiBbNC8xNV0KPiAg
ICogRHJvcCB0aGUgJ3VnbHknIHBhcmVudF9sb29rdXAgZmxhZy4gV2l0aCB0aGUgbmV3IGVycm9y
IGhhbmRsaW5nLAo+ICAgICB3ZSBjYW4gdXNlIC1FTk9ERVYgdG8gaW5mZXIgaWYgd2Ugc2hvdWxk
IHByb2NlZWQgb3Igbm90IHdpdGggdGhlCj4gICAgIGxvb2t1cC4KPgo+IFs1LzE1XToKPiAgICog
TW92ZWQgc29tZSBsb2NhbCBkZWNsYXJhdGlvbnMgdXAgc28gbG9uZyBsaW5lcyBmaXJzdDsKPiAg
ICogVXNlICdidXNfZmluZF9kZXZpY2VfYnlfZndub2RlKCknOwo+ICAgKiBQcm9wZXIgb3JkZXJp
bmcgaW4gaW5jbHVkZXMuCj4gICAqIEFkYXB0ZWQgZXJyb3IgaGFuZGxpbmcgaW4gJ19fZndub2Rl
X2lpb19jaGFubmVsX2dldF9ieV9uYW1lKCknIHRha2luZwo+IEFDUEkgaW50byBhY2NvdW50IGFu
ZCB3aGVuICduYW1lJyBpcyBnaXZlbiBidXQgaW5kZXggPCAwLiBJdCBzZWVtcyB0aGF0Cj4gQUNQ
SSBjb2RlIGNhbiBhY3R1YWxseSByZXR1cm4gLUVOT0VOVCB3aXRoIGluZGV4IDwgMCBmb3Igd2hp
Y2ggY2FzZSB3ZQo+IHNob3VsZCBjb250aW51ZSB0aGUgc2VhcmNoLiBOb3Qgc3VyZSBpZiBhIGNo
ZWNrICBpbiBBQ1BJICgnaWYgKGluZGV4IDwgMCkKPiByZXR1cm4gLUVJTlZBTDspIGxpa2UgaXMg
ZG9uZSBpbiBPRiB3b3VsZCBtYWtlIHNlbnNlLi4uCj4KPiBbMTIvMTVdOgo+ICAgKiBVc2UgJ2Rl
dmljZV9wcm9wZXJ0eV9jb3VudF91NjQoKScgdG8gZ2V0IHRoZSBudW1iZXIgb2YgZGlmZiBjaGFu
bmVscy4KPiBTbyBubyBuZWVkIGZvciAnbWFnaWMnIGRpdmlzaW9ucyBieSAyIChubyBpZGVhIHdo
eSBJIGhhdmVuJ3QgZG9uZSBsaWtlCj4gdGhpcyBpbiB0aGUgZmlyc3QgcGxhY2UpLgo+Cj4gWzE1
LzE1XQo+ICAgKiBGaXggd3JvbmcgY29udmVyc2lvbiBvZiAnaWYgKHB0ciAhPSBOVUxMKScgdG8g
J2lmICghcHRyKScuCj4KPiBTcGVjaWFsIG5vdGUgZm9yIHBhdGNoIDMvMTUgd2hlcmUgLUVOT0RF
ViBpcyBzdGlsbCB1c2VkIGRlc3BpdGUgc29tZSB0YWxrcwo+IGFib3V0IHVzaW5nIC1FTk9FTlQg
YW5kIGhlbmNlLCBiZSBtb3JlIGluIGxpbmUgd2l0aCBmaXJtd2FyZSBjb2RlLiBUaGUKPiByZWFz
b24gSSBrZXB0IGl0IHdhcyB0byBiZSBjb25zaXN0ZW50IHdpdGggdGhlIHJlc3Qgb2YgdGhlIGZp
bGUuIEknZCBzYXkKPiB0aGF0IGlmIHdlIHdhbnQgdG8gbW92ZSB0byAtRU5PRU5UIHdlIHNob3Vs
ZCBkbyBpdCBpbiBhIHNlcGFyYXRlIHBhdGNoCj4gYW5kIGZvciB0aGUgY29tcGxldGUgZmlsZS4K
Pgo+IE51bm8gU8OhICgxNSk6Cj4gICBpaW86IGlua2Vybjogb25seSByZWxlYXNlIHRoZSBkZXZp
Y2Ugbm9kZSB3aGVuIGRvbmUgd2l0aCBpdAo+ICAgaWlvOiBpbmtlcm46IGZpeCByZXR1cm4gdmFs
dWUgaW4gZGV2bV9vZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZSgpCj4gICBpaW86IGlua2Vybjog
b25seSByZXR1cm4gZXJyb3IgY29kZXMgaW4gaWlvX2NoYW5uZWxfZ2V0XyooKSBBUElzCj4gICBp
aW86IGlua2Vybjogc3BsaXQgb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoKQo+ICAgaWlvOiBp
bmtlcm46IG1vdmUgdG8gZndub2RlIHByb3BlcnRpZXMKPiAgIHRoZXJtYWw6IHFjb206IHFjb20t
c3BtaS1hZGMtdG01OiBjb252ZXJ0IHRvIElJTyBmd25vZGUgQVBJCj4gICBpaW86IGFkYzogaW5n
ZW5pYy1hZGM6IGNvbnZlcnQgdG8gSUlPIGZ3bm9kZSBpbnRlcmZhY2UKPiAgIGlpbzogYWRjOiBh
Yjg1MDAtZ3BhZGM6IGNvbnZlcnQgdG8gZGV2aWNlIHByb3BlcnRpZXMKPiAgIGlpbzogYWRjOiBh
dDkxLXNhbWE1ZDJfYWRjOiBjb252ZXJ0IHRvIGRldmljZSBwcm9wZXJ0aWVzCj4gICBpaW86IGFk
YzogcWNvbS1wbTh4eHgteG9hZGM6IGNvbnZlcnQgdG8gZGV2aWNlIHByb3BlcnRpZXMKPiAgIGlp
bzogYWRjOiBxY29tLXNwbWktdmFkYzogY29udmVydCB0byBkZXZpY2UgcHJvcGVydGllcwo+ICAg
aWlvOiBhZGM6IHFjb20tc3BtaS1hZGM1OiBjb252ZXJ0IHRvIGRldmljZSBwcm9wZXJ0aWVzCj4g
ICBpaW86IGFkYzogc3RtMzItYWRjOiBjb252ZXJ0IHRvIGRldmljZSBwcm9wZXJ0aWVzCj4gICBp
aW86IGlua2VybjogcmVtb3ZlIE9GIGRlcGVuZGVuY2llcwo+ICAgaWlvOiBpbmtlcm46IGZpeCBj
b2Rpbmcgc3R5bGUgd2FybmluZ3MKPgo+ICBkcml2ZXJzL2lpby9hZGMvYWI4NTAwLWdwYWRjLmMg
ICAgICAgICAgIHwgIDI3ICstLQo+ICBkcml2ZXJzL2lpby9hZGMvYXQ5MS1zYW1hNWQyX2FkYy5j
ICAgICAgIHwgIDMwICstLQo+ICBkcml2ZXJzL2lpby9hZGMvaW5nZW5pYy1hZGMuYyAgICAgICAg
ICAgIHwgICA4ICstCj4gIGRyaXZlcnMvaWlvL2FkYy9xY29tLXBtOHh4eC14b2FkYy5jICAgICAg
fCAgNTggKysrLS0KPiAgZHJpdmVycy9paW8vYWRjL3Fjb20tc3BtaS1hZGM1LmMgICAgICAgICB8
ICA2MyArKystLS0KPiAgZHJpdmVycy9paW8vYWRjL3Fjb20tc3BtaS12YWRjLmMgICAgICAgICB8
ICA0NCArKy0tCj4gIGRyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMuYyAgICAgICAgICAgICAgfCAx
MjEgKysrKystLS0tLQo+ICBkcml2ZXJzL2lpby9pbmtlcm4uYyAgICAgICAgICAgICAgICAgICAg
IHwgMjcxICsrKysrKysrKysrKystLS0tLS0tLS0tCj4gIGRyaXZlcnMvdGhlcm1hbC9xY29tL3Fj
b20tc3BtaS1hZGMtdG01LmMgfCAgIDMgKy0KPiAgaW5jbHVkZS9saW51eC9paW8vY29uc3VtZXIu
aCAgICAgICAgICAgICB8ICAyOCArLS0KPiAgaW5jbHVkZS9saW51eC9paW8vaWlvLmggICAgICAg
ICAgICAgICAgICB8ICAgOCArLQo+ICAxMSBmaWxlcyBjaGFuZ2VkLCAzNDcgaW5zZXJ0aW9ucygr
KSwgMzE0IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjM3LjAKPgoKCi0tIApXaXRoIEJlc3QgUmVn
YXJkcywKQW5keSBTaGV2Y2hlbmtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
