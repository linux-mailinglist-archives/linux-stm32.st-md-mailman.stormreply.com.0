Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1195468E5
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 16:57:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FCCDC5F1D7;
	Fri, 10 Jun 2022 14:57:35 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A124C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 14:57:34 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id h23so42930669ejj.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 07:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FiFiZSOb5fy9Qyr8SrnJ9LwGpGEbO4FbIZTS4c08mfw=;
 b=mHU8yDAtySOxuZnlqlJbNLpyJN3LBFi9PrnPSFEfeFm7M2jv5fjv8Qf76KtG5ym6pL
 zkZuCdBdSgbcyNoKtu/B6lszfOt0Fqu8SsJ8CMw5fYM1VNDA/Y+sUBYi+0zJpPpd0xpX
 GqJnvLd7h8gOjOxHxYZ/XhWYDauZ6ABgtRMVuL/FwV9lajqaalv5jN2AMxSm1u+li79y
 SOozLN5MSK0xUqb+vCqGOgxuxQhV6pd7co2o75pIOxdiwQ9NIOtUiXyicUlKY7RcEXkx
 D2hlqs1xCK/BKhcwcnjRNBLBnLizBihH24xIJcCjwlZlIblip3w3rkDylnKfA4zaFT3C
 1Rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FiFiZSOb5fy9Qyr8SrnJ9LwGpGEbO4FbIZTS4c08mfw=;
 b=Hqynhdk60iwWT4RCAFwQ+fbjmGpb9JtpTzomcPpL5Dk5hD11bRWvS1+tplFSW9JEiP
 Pfaf21M3Dr4xnN2jW3qRoFm+nJaHSSCW8kCJ4SROcc7yM/EVXc2BQCRAe71N02HKv+A/
 PBxO8C6D6oRqOkruw9eMStXSSBEWVdQi9Z6pj1f2Qu5VO4bC95XnSfijvnu3inhWuWyw
 KjQG5qSy6vC3WARAEofFPd7ZrGdyXq4HgoKNnSXz1VIg6CYZyM21hdqKLLif+G+PmPyx
 HK0UypErdqiuKej5Zd0LpgGTseTFsp0thteHw3ksEvbDKJyOizB2cpCh6E9GW8bmH8RU
 g9WQ==
X-Gm-Message-State: AOAM532Gbg3KfiBel3fOw6DLcIO4HvgMhd7A5VIjVPEx+Tvpmcz5JISB
 nd5lc2yY3fyi/+vbzPYmpyNAcsOJEA3bs3gp3Hg=
X-Google-Smtp-Source: ABdhPJwgw1cdwy7+7BSEWyUuttbgW9nGvtz5OwQueP4zXXWoa6V054VmGJY2Kj9j5Z7jUAiFw2Aa2m1Mt+A03k0tKIs=
X-Received: by 2002:a17:906:434f:b0:711:eb76:c320 with SMTP id
 z15-20020a170906434f00b00711eb76c320mr15425618ejm.636.1654873054113; Fri, 10
 Jun 2022 07:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-22-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-22-nuno.sa@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 Jun 2022 16:56:57 +0200
Message-ID: <CAHp75VdpAaO1VCy1WxUgR6z2LZ62gE+6Gp5aE=UrYdCqmZtBWw@mail.gmail.com>
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Andy Gross <agross@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Zhang Rui <rui.zhang@intel.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Thara Gopinath <thara.gopinath@linaro.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 21/34] iio: inkern: fix return value in
	devm_of_iio_channel_get_by_name()
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

T24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDggQU0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9n
LmNvbT4gd3JvdGU6Cj4KPiBvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZSgpIGNhbiBlaXRoZXIg
cmV0dXJuIE5VTEwgb3IgYW4gZXJyb3IgcG9pbnRlcgo+IHNvIHRoYXQgb25seSBkb2luZyBJU19F
UlIoKSBpcyBub3QgZW5vdWdoLiBGaXggaXQgYnkgY2hlY2tpbmcgdGhlIE5VTEwKPiBwb2ludGVy
IGNhc2UgYW5kIHJldHVybiAtRU5PREVWIGluIHRoYXQgY2FzZS4gTm90ZSB0aGlzIGlzIGRvbmUg
bGlrZSB0aGlzCj4gc28gdGhhdCB1c2VycyBvZiB0aGUgZnVuY3Rpb24gKHdoaWNoIG9ubHkgY2hl
Y2sgZm9yIGVycm9yIHBvaW50ZXJzKSBkbwo+IG5vdCBuZWVkIHRvIGJlIGNoYW5nZWQuIFRoaXMg
aXMgbm90IGlkZWFsIHNpbmNlIHdlIGFyZSBsb3NpbmcgZXJyb3IgY29kZXMKPiBhbmQgYXMgc3Vj
aCwgaW4gYSBmb2xsb3cgdXAgY2hhbmdlLCB0aGluZ3Mgd2lsbCBiZSB1bmlmaWVkIHNvIHRoYXQK
PiBvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZSgpIG9ubHkgcmV0dXJucyBlcnJvciBjb2Rlcy4K
ClJldmlld2VkLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+
Cgo+IEZpeGVzOiA2ZTM5YjE0NWNlZjcgKCJpaW86IHByb3ZpZGUgb2ZfaWlvX2NoYW5uZWxfZ2V0
X2J5X25hbWUoKSBhbmQgZGV2bV8gdmVyc2lvbiBpdCIpCj4gU2lnbmVkLW9mZi1ieTogTnVubyBT
w6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9paW8vaW5rZXJuLmMgfCAy
ICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2lpby9pbmtlcm4uYyBiL2RyaXZlcnMvaWlvL2lua2Vybi5jCj4gaW5kZXggOWQ4NzA1
Nzc5NGZjLi44N2ZkMmEwZDQ0ZjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9paW8vaW5rZXJuLmMK
PiArKysgYi9kcml2ZXJzL2lpby9pbmtlcm4uYwo+IEBAIC00MTIsNiArNDEyLDggQEAgc3RydWN0
IGlpb19jaGFubmVsICpkZXZtX29mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKHN0cnVjdCBkZXZp
Y2UgKmRldiwKPiAgICAgICAgIGNoYW5uZWwgPSBvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZShu
cCwgY2hhbm5lbF9uYW1lKTsKPiAgICAgICAgIGlmIChJU19FUlIoY2hhbm5lbCkpCj4gICAgICAg
ICAgICAgICAgIHJldHVybiBjaGFubmVsOwo+ICsgICAgICAgaWYgKCFjaGFubmVsKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKPgo+ICAgICAgICAgcmV0ID0gZGV2
bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgZGV2bV9paW9fY2hhbm5lbF9mcmVlLCBjaGFubmVs
KTsKPiAgICAgICAgIGlmIChyZXQpCj4gLS0KPiAyLjM2LjEKPgoKCi0tIApXaXRoIEJlc3QgUmVn
YXJkcywKQW5keSBTaGV2Y2hlbmtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
