Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7B5547F64
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jun 2022 08:10:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A7DCC60494;
	Mon, 13 Jun 2022 06:10:56 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FB40C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 19:51:18 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id fu3so4250ejc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 12:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=bNY4bb5ZsDGbijlscX/zWHp76bvVhoKTJQjCK2gLBow=;
 b=DTARzN9ZKxLbpM5DnF604iI8/F/84/wIKw08CbQfw05YnVX88YGW6HVfBxQNHvMu4T
 MLrV3I1t6KM5Qc6HlnyeXHSTGoq8+8DaWtqoRUwsLbX6Mzc8EpX122ha3qRBRoFfEqzN
 Jk0f/3X9FLtgjhjaqJKanWVijWyNNRgDw6pmj5+2xfApIvc2SRAwOjLitceTonJ4eGE1
 a1A9wbvVgJFRqD/0S50YXqjQh+yziCS7x5lzFW9SKapPD3uUc9it44OjhImJd8j2+oZt
 Butz14g0HcCbwqNDkTuGrH/EVS+NkDJB41ZnGmOfym00EegEpO7qNAqhl52gA+RezkJc
 GTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=bNY4bb5ZsDGbijlscX/zWHp76bvVhoKTJQjCK2gLBow=;
 b=pDY1kR2P64cHZS7OEKwRTu5BQp7PqJXJlWPXXsw6XbyWFFTMrRZ4G9Xxkfqn01LlJ+
 +737NFPlk/P0aOgC8foTyJFioGlGA+ypZT76MIxFrtSZDKu/yafSAaTjntQ0pDDQ2Eov
 bz7tay7TRiclOg6oelmSZuYthngmIHMcoXOPAOWeEH5EwcFklsxEdC96kpZHHxSJMRdf
 kfpg4pY3eBD7ClzMsJRUzifNWO1MbVFFul69aojvY4UoluCIQDVZyHWJ1mjdjAECcbaJ
 NOZIXzfaeTc2X84qpzp/slN1pRbdwm7Yx71M61UpuzeTD7H8/Cra7LTszyOfS7imDOSY
 Rt5A==
X-Gm-Message-State: AOAM533KNZ37tKL0mklHC9wrr8wi0/4P05rQG/DGABULHXoIcAXDab53
 NoC4E8Ik5AZCElEps460/Bk=
X-Google-Smtp-Source: ABdhPJxHRykgXinV3uoaEPm9Ud4a9M4gnh2v3qf5U98udrI7NhTVLe93fDw1Gnx05NF5PsnFjGIIwQ==
X-Received: by 2002:a17:906:51d6:b0:712:c9:8a1b with SMTP id
 v22-20020a17090651d600b0071200c98a1bmr10665567ejk.656.1654890677793; 
 Fri, 10 Jun 2022 12:51:17 -0700 (PDT)
Received: from ?IPv6:2001:a61:136e:3c01:8bd4:cf6f:76f1:a861?
 ([2001:a61:136e:3c01:8bd4:cf6f:76f1:a861])
 by smtp.gmail.com with ESMTPSA id
 ck16-20020a170906c45000b006feb20b5235sm12715703ejb.84.2022.06.10.12.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 12:51:17 -0700 (PDT)
Message-ID: <d083dd2c7e9e6eefb32124648a06799a9ebe8dfd.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Joe Simmons-Talbott <joetalbott@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>
Date: Fri, 10 Jun 2022 21:51:15 +0200
In-Reply-To: <YqNo6U8r80aNFzUr@spruce>
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-35-nuno.sa@analog.com> <YqNo6U8r80aNFzUr@spruce>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 Jun 2022 06:10:54 +0000
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
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 34/34] iio: inkern: fix coding style
	warnings
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

T24gRnJpLCAyMDIyLTA2LTEwIGF0IDExOjUzIC0wNDAwLCBKb2UgU2ltbW9ucy1UYWxib3R0IHdy
b3RlOgo+IE9uIEZyaSwgSnVuIDEwLCAyMDIyIGF0IDEwOjQ1OjQ1QU0gKzAyMDAsIE51bm8gU8Oh
IHdyb3RlOgo+ID4gSnVzdCBjb3NtZXRpY3MuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVk
Li4uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+
Cj4gPiAtLS0KPiA+IMKgZHJpdmVycy9paW8vaW5rZXJuLmMgfCA2NCArKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAtLS0tCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAz
MiBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaWlvL2lua2Vybi5jIGIvZHJpdmVycy9paW8vaW5rZXJuLmMKPiA+IGluZGV4IDdlYjUz
NjU2MGRlZC4uNTI2NTE5Y2VmY2I5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9paW8vaW5rZXJu
LmMKPiA+ICsrKyBiL2RyaXZlcnMvaWlvL2lua2Vybi5jCj4gPiBAQCAtNDUsMTMgKzQ1LDEzIEBA
IGludCBpaW9fbWFwX2FycmF5X3JlZ2lzdGVyKHN0cnVjdCBpaW9fZGV2Cj4gPiAqaW5kaW9fZGV2
LCBzdHJ1Y3QgaWlvX21hcCAqbWFwcykKPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnQgaSA9IDAsIHJl
dCA9IDA7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGlpb19tYXBfaW50ZXJuYWwgKm1hcGk7
Cj4gPiDCoAo+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKG1hcHMgPT0gTlVMTCkKPiA+ICvCoMKgwqDC
oMKgwqDCoGlmICghbWFwcykKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuIDA7Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoG11dGV4X2xvY2soJmlpb19tYXBfbGlz
dF9sb2NrKTsKPiA+IC3CoMKgwqDCoMKgwqDCoHdoaWxlIChtYXBzW2ldLmNvbnN1bWVyX2Rldl9u
YW1lICE9IE5VTEwpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoHdoaWxlICghbWFwc1tpXS5jb25zdW1l
cl9kZXZfbmFtZSkgewo+IAo+IFNob3VsZG4ndCB0aGlzIGJlPzoKPiB3aGlsZSAobWFwc1tpXS5j
b25zdW1lcl9kZXZfbmFtZSkgewo+IAoKVXBzLi4uIE5pY2UgY2F0Y2ghIEkgd2FzIHByb2JhYmx5
IGluIGJvdCBtb2RlIGFscmVhZHkuCgotIE51bm8gU8OhCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
