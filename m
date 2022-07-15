Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E66576910
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jul 2022 23:40:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9977AC640F4;
	Fri, 15 Jul 2022 21:40:17 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64867C640F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 21:40:16 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id j1so3969699wrs.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 14:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=J6BSJtpNWZ2Z1cUANVaPa8k/01zDYr+V4xutkYf54NQ=;
 b=EiZ/Jmkz5DdkNRwJGtK9gVoZ3BcJ8ejMk3yeeSneUGJiCM2csICY8AdW61vGapRVcY
 UVEs2lvDUtUmSWhTy5Riy+DiODr1rNBvvUK4wbrRLT25XjOXefr0/051txgAy4PBorpi
 GKNcSgswr6pLYwYHFSVzvB34JMrg+jT1ikpzno4L0ZOP0gQXJvWnMhCAGwkPbk+zk4T6
 NHUHFy/WsEuLp1Gd3GTwIoolQEUdfvT1tqqUGbfp80W8fFmVfSTmouc1u2k89r7uyeR9
 nYK4zK2wqlmEsLRHEwqRtcub6mC9oo2ROYXHqnHla+d+LumXFIkgFPThdJfozfzXSQFb
 VGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J6BSJtpNWZ2Z1cUANVaPa8k/01zDYr+V4xutkYf54NQ=;
 b=uGJIuyB3W8BQ1Nd3WiUXUPd7+Ht4FgAywPHndzTzhyR9YY0GfypUutdEHe/ogdItgJ
 bNoUaQwYv5XgE7eyTgAdZy/QCbDTB69I7cSoe6SxncpDwciCOyeP+OGfZEjXrRs27gya
 0y1sD/6Oaj0bJL5DuOh6NInnouOWeFPqz+bus7v1razpLqwdxqMhcIe5Bhsjrv8mzddR
 6VMfgApS6uzYZ8Fevpx1f7NT5igmiprVzdfLs0Xo78I1+Jer6G1ag5AMaxc//LL2Vdry
 ckysUtECUP8mbKKVTl3SvXn6rH3lXfOhddcwyaGJNXFKEfQJ79mJ/KfH/3AbWz6VWCN0
 zRbQ==
X-Gm-Message-State: AJIora9fBpvNuaa29lmrcjvIrp2BCQ8H72NgnxVu6GsPDwXPung9cib6
 twlOAwaRADa3fpxGdbara34XMA==
X-Google-Smtp-Source: AGRyM1vl55wMLC6v4FE7361A1EgLL5IjuxGDiU+pOGyn8ZoWrdHGmzM+ZMQkW7lv66vojAGIB7e/MQ==
X-Received: by 2002:a5d:4e04:0:b0:21d:6ec3:38a2 with SMTP id
 p4-20020a5d4e04000000b0021d6ec338a2mr14182586wrt.362.1657921215858; 
 Fri, 15 Jul 2022 14:40:15 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a223:f4b3:40c9:43fa?
 ([2a05:6e02:1041:c10:a223:f4b3:40c9:43fa])
 by smtp.googlemail.com with ESMTPSA id
 j27-20020a05600c1c1b00b0039c4ba160absm17678280wms.2.2022.07.15.14.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 14:40:15 -0700 (PDT)
Message-ID: <563e92de-68aa-7382-2564-c1ccc270c571@linaro.org>
Date: Fri, 15 Jul 2022 23:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>, openbmc@lists.ozlabs.org,
 linux-imx@nxp.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-iio@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-arm-msm@vger.kernel.org
References: <20220715122903.332535-1-nuno.sa@analog.com>
 <20220715122903.332535-7-nuno.sa@analog.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220715122903.332535-7-nuno.sa@analog.com>
Cc: Gwendal Grignou <gwendal@chromium.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>,
 Christophe Branchereau <cbranchereau@gmail.com>, Nancy Yuen <yuenn@google.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Saravanan Sekar <sravanhome@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Cai Huoqing <cai.huoqing@linux.dev>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thara Gopinath <thara.gopinath@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 06/15] thermal: qcom:
 qcom-spmi-adc-tm5: convert to IIO fwnode API
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMTUvMDcvMjAyMiAxNDoyOCwgTnVubyBTw6Egd3JvdGU6Cj4gTWFrZSB1c2FnZSBvZiB0aGUg
bmV3IGZpcm13YXJlIGFnbm9zdGljIEFQSQo+ICdkZXZtX29mX2lpb19jaGFubmVsX2dldF9ieV9u
YW1lKCknIHRvIGdldCB0aGUgSUlPIGNoYW5uZWwuCj4gCj4gU2lnbmVkLW9mZi1ieTogTnVubyBT
w6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxh
bmR5LnNoZXZjaGVua29AZ21haWwuY29tPgoKQWNrZWQtYnk6IERhbmllbCBMZXpjYW5vIDxkYW5p
ZWwubGV6Y2Fub0BsaW5hcm8ub3JnPgoKPiAtLS0KPiAgIGRyaXZlcnMvdGhlcm1hbC9xY29tL3Fj
b20tc3BtaS1hZGMtdG01LmMgfCAzICsrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvcWNv
bS9xY29tLXNwbWktYWRjLXRtNS5jIGIvZHJpdmVycy90aGVybWFsL3Fjb20vcWNvbS1zcG1pLWFk
Yy10bTUuYwo+IGluZGV4IGQ5YzljOTc1ZjkzMS4uMGI4NTQzYzYyN2YwIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvdGhlcm1hbC9xY29tL3Fjb20tc3BtaS1hZGMtdG01LmMKPiArKysgYi9kcml2ZXJz
L3RoZXJtYWwvcWNvbS9xY29tLXNwbWktYWRjLXRtNS5jCj4gQEAgLTgyNSw3ICs4MjUsOCBAQCBz
dGF0aWMgaW50IGFkY190bTVfZ2V0X2R0X2NoYW5uZWxfZGF0YShzdHJ1Y3QgYWRjX3RtNV9jaGlw
ICphZGNfdG0sCj4gICAJfQo+ICAgCWNoYW5uZWwtPmFkY19jaGFubmVsID0gYXJncy5hcmdzWzBd
Owo+ICAgCj4gLQljaGFubmVsLT5paW8gPSBkZXZtX29mX2lpb19jaGFubmVsX2dldF9ieV9uYW1l
KGFkY190bS0+ZGV2LCBub2RlLCBOVUxMKTsKPiArCWNoYW5uZWwtPmlpbyA9IGRldm1fZndub2Rl
X2lpb19jaGFubmVsX2dldF9ieV9uYW1lKGFkY190bS0+ZGV2LAo+ICsJCQkJCQkJICAgb2ZfZndu
b2RlX2hhbmRsZShub2RlKSwgTlVMTCk7Cj4gICAJaWYgKElTX0VSUihjaGFubmVsLT5paW8pKSB7
Cj4gICAJCXJldCA9IFBUUl9FUlIoY2hhbm5lbC0+aWlvKTsKPiAgIAkJaWYgKHJldCAhPSAtRVBS
T0JFX0RFRkVSKQoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIg
T3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6
Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0
ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGlu
YXJvLWJsb2cvPiBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
