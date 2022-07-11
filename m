Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B079B570507
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Jul 2022 16:05:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74E71C035BF;
	Mon, 11 Jul 2022 14:05:51 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CFDAC035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 14:05:50 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id d16so7139374wrv.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 07:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=OpuAbJzOZmkFVUVRYRfhJb2EZ79ErPrcazI4dJRRIZw=;
 b=AxqKn1jFCUvR9r8eF6G9LQNJai0j26cooZSTaW/y5LjqtvcEM/8McIf/+yQzlzaUFd
 LwcEnbV3x0T98SP3+BJlr0dZ/4NoEFEHYkvinYuvlXRJ/rScOUvz84TzCH0CqciB5xr3
 70JCY+zxyG19vqUL7fnu7cTlKI0FIx088QGgbn+DUglz7JpgcVQ5PpQGbQcOhaZFlPbl
 Sj/1dCgEulNZFTYu6gtOT+azXEODMFcBsZXMw1Holn5VdIjBppSACDRDbXOOwlKV+GrT
 gUqBD8ESK3VZeUfDigHKr2IQSaYpAIV6HBehOLe57cJG8VwM+8e6vaZ86/RiS+6W3xCR
 PgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=OpuAbJzOZmkFVUVRYRfhJb2EZ79ErPrcazI4dJRRIZw=;
 b=xyBiU/mVD5mZ5Jj9P9tXpCP4d7xdkW+MISxq2zGDo2sE6wxnEqn0kZPOtwRoHdOG5U
 xKpQ23+ER7Xn1NLZI6K1OOve4EzOmn/8wOqzj/q5fujN0Yxm8xBlw0VpQgt9LQivsmcm
 xyAK78haQTrz3a8xz99/GhKB+EWf+IQKOfMn4s0bv1WEEu2xgmvDMdByAwD0hdPS/7aZ
 82G0twFCuQt1Kbj2JZ0SFduXjbc5nKnqo1CPZk+YwAwTlS2YF8rqDA1CoG57UerQIBeA
 ppyJIfTiE2Nzinc0pFQuavqeM9PcFRP2dienpLnj2t5p+x3EP7Vi5MDO+Gpj+WS7jwL/
 BvTg==
X-Gm-Message-State: AJIora919DViHZ49rpKhZ5ik4SreiD0vuziyFl7KeOvroGMRFmMEPyAz
 /t8UzRZTzDw3aObbaw6FRMM=
X-Google-Smtp-Source: AGRyM1vjxZ3LaYt2iroYaYC6yqBPM5QdYtXuGkJjk8H9N1njA0MUYRP5ggIbz4O4J7Zmd/vjCEw/YA==
X-Received: by 2002:adf:f581:0:b0:21d:1e01:e9b7 with SMTP id
 f1-20020adff581000000b0021d1e01e9b7mr16555540wro.529.1657548349537; 
 Mon, 11 Jul 2022 07:05:49 -0700 (PDT)
Received: from p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de
 (p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de.
 [2003:f6:ef03:6f00:5de6:a4d0:d791:ed01])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a05600c000100b00397623ff335sm6700494wmc.10.2022.07.11.07.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 07:05:49 -0700 (PDT)
Message-ID: <bb0aaee46261295e333c02d771a627d3695fdba2.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>
Date: Mon, 11 Jul 2022 16:06:50 +0200
In-Reply-To: <CAHp75VcxcmH5QoheyERAXrUeqMtJidKLBYH1T6dr6vb7yGKqWg@mail.gmail.com>
References: <20220711123835.811358-1-nuno.sa@analog.com>
 <20220711123835.811358-4-nuno.sa@analog.com>
 <CAHp75VcxcmH5QoheyERAXrUeqMtJidKLBYH1T6dr6vb7yGKqWg@mail.gmail.com>
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
Cc: Cai Huoqing <cai.huoqing@linux.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J.
 Wysocki" <rafael@kernel.org>, linux-iio <linux-iio@vger.kernel.org>,
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
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
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
Subject: Re: [Linux-stm32] [PATCH v2 03/15] iio: inkern: only return error
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

T24gTW9uLCAyMDIyLTA3LTExIGF0IDE1OjI5ICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gTW9uLCBKdWwgMTEsIDIwMjIgYXQgMjozOCBQTSBOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKPiA+IAo+ID4gQVBJcyBsaWtlIG9mX2lpb19jaGFubmVsX2dldF9ieV9u
YW1lKCkgYW5kIG9mX2lpb19jaGFubmVsX2dldF9hbGwoKQo+ID4gd2VyZQo+ID4gcmV0dXJuaW5n
IGEgbWl4IG9mIE5VTEwgYW5kIHBvaW50ZXJzIHdpdGggTlVMTCBiZWluZyB0aGUgd2F5IHRvCj4g
PiAibm90aWZ5IiB0aGF0IHdlIHNob3VsZCBkbyBhICJzeXN0ZW0iIGxvb2t1cCBmb3IgY2hhbm5l
bHMuIFRoaXMKPiA+IG1ha2UKPiA+IGl0IHZlcnkgY29uZnVzaW5nIGFuZCBwcm9uZSB0byBlcnJv
cnMgYXMgY29tbWl0IDlmNjNjYzA5MjFlYwo+ID4gKCJpaW86IGlua2VybjogZml4IHJldHVybiB2
YWx1ZSBpbgo+ID4gZGV2bV9vZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZSgpIikKPiA+IHByb3Zl
cy4gT24gdG9wIG9mIHRoaXMsIHBhdHRlcm5zIGxpa2UgJ2lmIChjaGFubmVsICE9IE5VTEwpIHJl
dHVybgo+ID4gY2hhbm5lbCcgd2VyZSBiZWluZyB1c2VkIHdoZXJlIGNoYW5uZWwgY291bGQgYWN0
dWFsbHkgYmUgYW4gZXJyb3IKPiA+IGNvZGUKPiA+IHdoaWNoIG1ha2VzIHRoZSBjb2RlIGhhcmQg
dG8gcmVhZC4KPiA+IAo+ID4gVGhpcyBjaGFuZ2UgYWxzbyBtYWtlcyBzb21lIGZ1bmN0aW9uYWwg
Y2hhbmdlcyBvbiBob3cgZXJyb3JzIHdlcmUKPiA+IGJlaW5nCj4gPiBoYW5kbGVkLiBJbiB0aGUg
b3JpZ2luYWwgYmVoYXZpb3IsIGV2ZW4gaWYgd2UgZ2V0IGFuIGVycm9yIGxpa2UgJy0KPiA+IEVO
T01FTScsCj4gPiB3ZSBzdGlsbCBjb250aW51ZSB3aXRoIHRoZSBzZWFyY2guIFdlIHNob3VsZCBv
bmx5IGNvbnRpbnVlIHRvCj4gPiBsb29rdXAgZm9yCj4gPiB0aGUgY2hhbm5lbCB3aGVuIGl0IG1h
a2VzIHNlbnNlIHRvIGRvIHNvLiBIZW5jZSwgdGhlIG1haW4gZXJyb3IKPiA+IGhhbmRsaW5nCj4g
PiBpbiAnb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoKScgaXMgY2hhbmdlZCB0byB0aGUgZm9s
bG93aW5nCj4gPiBsb2dpYzoKPiA+IAo+ID4gwqAqIElmIGEgY2hhbm5lbCAnbmFtZScgaXMgcHJv
dmlkZWQgYW5kIHdlIGRvIGZpbmQgaXQgdmlhCj4gPiAnaW8tY2hhbm5lbC1uYW1lcycsIHdlIHNo
b3VsZCBiZSBhYmxlIHRvIGdldCBpdC4gSWYgd2UgZ2V0IGFueQo+ID4gZXJyb3IsCj4gPiB3ZSBz
aG91bGQgbm90IHByb2NlZWQgd2l0aCB0aGUgbG9va3VwLiBNb3Jlb3Zlciwgd2Ugc2hvdWxkIHJl
dHVybgo+ID4gYW4gZXJyb3IKPiA+IHNvIHRoYXQgY2FsbGVycyB3b24ndCBwcm9jZWVkIHdpdGgg
YSBzeXN0ZW0gbG9va3VwLgo+ID4gwqAqIElmIGEgY2hhbm5lbCAnbmFtZScgaXMgcHJvdmlkZWQg
YW5kIHdlIGNhbm5vdCBmaW5kIGl0ICgnaW5kZXggPAo+ID4gMCcpLAo+ID4gJ29mX3BhcnNlX3Bo
YW5kbGVfd2l0aF9hcmdzKCknIGlzIGV4cGVjdGVkIHRvIGZhaWwgd2l0aCAnLUVJTlZBTCcuCj4g
PiBIZW5jZSwKPiA+IHdlIHNob3VsZCBvbmx5IGNvbnRpbnVlIGlmIHdlIGdldCB0aGF0IGVycm9y
Lgo+ID4gwqAqIElmIGEgY2hhbm5lbCAnbmFtZScgaXMgbm90IHByb3ZpZGVkIHdlIHNob3VsZCBv
bmx5IGNhcnJ5IG9uIHdpdGgKPiA+IHRoZQo+ID4gc2VhcmNoIGlmICdvZl9wYXJzZV9waGFuZGxl
X3dpdGhfYXJncygpJyByZXR1cm5zICctRU5PRU5UJy4KPiA+IAo+ID4gQWxzbyBub3RlIHRoYXQg
YSBzeXN0ZW0gY2hhbm5lbCBsb29rdXAgaXMgb25seSBkb25lIGlmIHRoZSByZXR1cm5lZAo+ID4g
ZXJyb3IgY29kZSAoZnJvbSAnb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoKScgb3IKPiA+ICdv
Zl9paW9fY2hhbm5lbF9nZXRfYWxsKCknIGlzIC1FTk9ERVYuCj4gCj4gTEdUTSAoYnV0IEkgbWln
aHQgbWlzcyBzb21ldGhpbmcsIGl0J3MgYSBiaXQgdG9vIG1hbnkgY29uZGl0aW9uYWxzKSwKPiBS
ZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPgo+
IAoKQWdyZWVkLiBJdCBlbmRlZCB1cCBiZWluZyBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gSSB0aG91
Z2h0Li4uCgotIE51bm8gU8OhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
