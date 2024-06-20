Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8147191051A
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 15:02:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37A34C6DD6E;
	Thu, 20 Jun 2024 13:02:35 +0000 (UTC)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33A89C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 09:41:48 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 095FB10001E;
 Thu, 20 Jun 2024 12:41:47 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 095FB10001E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
 s=mail; t=1718876507;
 bh=eHWSHU6IOFj9d81lzeTSCSoajp29AFtL+A3T39sy4lk=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
 b=SJ9C2RT/3zxNcETOlA+R7zdR9bgqCBWrTAJKs6yKjHsLD92MS0HKFRJ6tgF47uJdC
 2D8JzU4ZBZKqQnlDmhNQ+jJtM1LsUuZBkWCbqfNu2SC19RrO0B826IIgjtAkuiNku/
 qBYufLJfpgbHyadnxpSGN91F/1bTEMqag/3CjsSxfsBxyU+Hzwmh/fAn5uZs9e27rS
 8oFLwkDs8ETXGGDo8UvUi5s1W0z8adnonSe/14p0m+nKmy8Hi7+NN62ydlW+kqKcR0
 rpbSQTmuo0fxX2N5/quj+Z7SS1mGSIC/X9sZm23PbhFf7smSqqyLTNQZASjKuMF15q
 OepCAAht5MUOg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru
 [172.16.192.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Thu, 20 Jun 2024 12:41:46 +0300 (MSK)
Received: from [172.28.129.141] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 20 Jun 2024 12:41:46 +0300
Message-ID: <dc787966-2920-459f-b091-ce09fe97315d@salutedevices.com>
Date: Thu, 20 Jun 2024 12:41:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Trevor Gamblin <tgamblin@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
 <20240617-review-v3-13-88d1338c4cca@baylibre.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20240617-review-v3-13-88d1338c4cca@baylibre.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186025 [Jun 20 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20
 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f,
 {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 127.0.0.199:7.1.2;
 salutedevices.com:7.1.1;
 100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/06/20 08:22:00 #25655230
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Approved-At: Thu, 20 Jun 2024 13:02:33 +0000
Cc: imx@lists.linux.dev, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 13/41] iio: adc: meson_saradc: make use
 of regmap_clear_bits(), regmap_set_bits()
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

T24gNi8xNy8yNCAxNjo0OSwgVHJldm9yIEdhbWJsaW4gd3JvdGU6Cj4gSW5zdGVhZCBvZiB1c2lu
ZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB0aGUgbWFzayB0d2ljZSwgdXNlCj4g
cmVnbWFwX3NldF9iaXRzKCkuCj4gCj4gSW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRlX2Jp
dHMoKSBhbmQgcGFzc2luZyB2YWwgPSAwLCB1c2UKPiByZWdtYXBfY2xlYXJfYml0cygpLgo+IAo+
IFN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJy
ZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVHJldm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJl
LmNvbT4KClJldmlld2VkLWJ5OiBHZW9yZ2UgU3RhcmsgPGduc3RhcmtAc2FsdXRlZGV2aWNlcy5j
b20+CgotLSAKQmVzdCByZWdhcmRzCkdlb3JnZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
