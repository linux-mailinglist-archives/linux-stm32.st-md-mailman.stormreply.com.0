Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8137547F66
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jun 2022 08:10:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98B04C6049D;
	Mon, 13 Jun 2022 06:10:56 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7504C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 20:08:44 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 l2-20020a05600c4f0200b0039c55c50482so1654774wmq.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 13:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=EYdxdXjqZnMfe3vNUEt1qvnu5edzLozRvBmutng2gcs=;
 b=CwmfAF6XHzbKO8jEH1gk+bM/1vpPQGL/FBas2sxdEfvaPOWCrmy31A4DGlV+qRbNLh
 EhE7R/0Apge67rflwIqv8xb8iI3MVz4tH/cjgvlR0njUgo8D/mQ1I7jC3EKVSvYMwwcI
 sbxI1wxllvZ09BnK2w2SbAc5pxLTidgyMANYo96BcCZ/obK1SZsjQnLrn4I8/dPp07XC
 G1yQR1Yy0wNiRGatiMcWPC3BBg8FGpQTCb/lIQdyvipx939yxhZ6fvPdX3cj8ChHvy5k
 k6USF7TyLBfpolWfhPNfaJpv5ZIkxehFF9XkoRvK3oVX5QPgU1PKY2VQfWO+6rp3rB/o
 VRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=EYdxdXjqZnMfe3vNUEt1qvnu5edzLozRvBmutng2gcs=;
 b=dYzK5HL3WsZbAxEKKcsXfULOKDPw0EpoZOVRTOaU6xZAS0wNhJVn0ecLkw1AaXXbYV
 hA3+SQYXUv8nrJETQqgpsrK64wfJWRJ4wJQo7i1455dj/VoRIfKHzxnbFrUwtfeIjm6E
 TLQXPES4ZvPTyLfejjDW8K5ksXgdZAC8YonQkjjiDpT2nlw5vkpvpftnVt7I4GjfMQDq
 hNnfaZEkt/8IX/f/+fr8qCFWmJCSGW/1hYqvESZHzzsGSTI0764eq5G4Ap7kefL2uVti
 pn1pyHlO+tqgftRS20t2HBjS5SioTH1yF1iLkfkA1pin1pF8wokbOQvmuYADTpBXuNwE
 vUPQ==
X-Gm-Message-State: AOAM531wLC8kcQgWCrcuTKP8gt9hs4bhytJwzyiByEUFwAbRFNYYAFQ9
 jJoixLs3+lt5brfoZroZWMU=
X-Google-Smtp-Source: ABdhPJzFMI/kZj6Y7ZsIIRkgwHejQ91g4pjv9UVjVQoEdMHpUhK/4CORgOZeBhdrhfbjPGUylvA40Q==
X-Received: by 2002:a1c:f704:0:b0:39c:6684:b375 with SMTP id
 v4-20020a1cf704000000b0039c6684b375mr1346597wmh.66.1654891724476; 
 Fri, 10 Jun 2022 13:08:44 -0700 (PDT)
Received: from ?IPv6:2001:a61:136e:3c01:8bd4:cf6f:76f1:a861?
 ([2001:a61:136e:3c01:8bd4:cf6f:76f1:a861])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d4e8a000000b00210320d9fbfsm436482wru.18.2022.06.10.13.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 13:08:44 -0700 (PDT)
Message-ID: <ef73aa5801ae1c8078e6a930f22feb6214038176.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>
Date: Fri, 10 Jun 2022 22:08:41 +0200
In-Reply-To: <CAHp75VcdwjTYDF2c-StsL7-pLKtV3vGxinX8+1nJydqB_WNXiA@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-21-nuno.sa@analog.com>
 <CAHp75VcdwjTYDF2c-StsL7-pLKtV3vGxinX8+1nJydqB_WNXiA@mail.gmail.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 Jun 2022 06:10:54 +0000
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
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
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

T24gRnJpLCAyMDIyLTA2LTEwIGF0IDE2OjU2ICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDggQU0gTnVubyBTw6EgPG51bm8uc2FAYW5h
bG9nLmNvbT4gd3JvdGU6Cj4gPiAKPiA+ICdvZl9ub2RlX3B1dCgpJyBjYW4gcG90ZW50aWFsbHkg
cmVsZWFzZSB0aGUgbWVtb3J5IHBvaW50ZWQgdG8gYnkKPiA+ICdpaW9zcGVjLm5wJyB3aGljaCB3
b3VsZCBsZWF2ZSB1cyB3aXRoIGFuIGludmFsaWQgcG9pbnRlciAoYW5kIHdlCj4gPiB3b3VsZAo+
ID4gc3RpbGwgcGFzcyBpdCBpbiAnb2ZfeGxhdGUoKScpLiBBcyBzdWNoLCB3ZSBjYW4gb25seSBy
ZWxlYXNlIHRoZQo+ID4gbm9kZQo+ID4gYWZ0ZXIgd2UgYXJlIGRvbmUgd2l0aCBpdC4KPiAKPiBU
aGUgcXVlc3Rpb24geW91IHNob3VsZCBhbnN3ZXIgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGlzIHRo
ZQo+IGZvbGxvd2luZzoKPiAiQ2FuIGFuIE9GIG5vZGUsIGF0dGFjaGVkIHRvIGEgc3RydWN0IGRl
dmljZSwgYmUgZ29uZSBiZWZvcmUgdGhlCj4gZGV2aWNlIGl0c2VsZj8iIElmIGl0IHNvLCB0aGVu
IHBhdGNoIGlzIGdvb2QsIG90aGVyd2lzZSB0aGVyZSBpcyBubwo+IHBvaW50IGluIHRoaXMgcGF0
Y2ggaW4gdGhlIGZpcnN0IHBsYWNlLgo+IAoKWWVhaCwgSSBtaWdodCBiZSB3cm9uZyBidXQgZnJv
bSBhIHF1aWNrIGxvb2suLi4geWVzLCBJIHRoaW5rIHRoZSBub2RlCmNhbiBiZSBnb25lIGJlZm9y
ZSB0aGUgZGV2aWNlLiBUYWtlIGEgbG9vayBvbiB0aGUgc3BpIG9yIGkyYyBvZl9ub3RpZnkKaGFu
ZGxpbmcgYW5kIHlvdSBjYW4gc2VlIHRoYXQgdGhlIG5vZGVzIGFyZSBnZXQvcHV0IG9uIHRoZSBh
ZGQvcmVtb3ZlCm5vdGlmY2F0aW9uLiBNZWFuaW5nIHRoYXQgdGhlIG5vZGUgbGlmZXNwYW4gaXMg
bm90IHJlYWxseSBhdHRhY2hlZCB0bwp0aGUgZGV2aWNlIGxpZmVzcGFuLiBJZiBpdCB3YXMsIEkg
d291bGQgZXhwZWN0IHRvIHNlZSBvZl9ub2RlX3B1dCgpIG9uCnRoZSBkZXZpY2UgcmVsZWFzZSgp
IGZ1bmN0aW9uLi4uCgpBZ2FpbiwgSSBtaWdodCBiZSB3cm9uZyBhbmQgSSBhZG1pdCBJIHdhcyBu
b3Qgc3VyZSBhYm91dCBpbmNsdWRpbmcgdGhpcwpwYXRjaCBiZWNhdXNlIGl0J3MgYSB2ZXJ5IHVu
bGlrZWx5IHNjZW5hcmlvIGV2ZW4gdGhvdWdoIEkgdGhpbmssIGluCnRoZW9yeSwgYSBwb3NzaWJs
ZSBvbmUuCgotIE51bm8gU8OhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
