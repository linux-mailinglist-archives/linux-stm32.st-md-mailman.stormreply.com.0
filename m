Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA6483C47D
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jan 2024 15:14:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62FB1C6B444;
	Thu, 25 Jan 2024 14:14:39 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABA56C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 14:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706192078;
 bh=xuWotEzSelSVBqWujYKbIOXX960an6aLcCPwqSUkjtM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nSMrqxBc5B0zoxSh7oM+5Fjyr3Ev/UxHPkW05LIh9tqvVs8PD+gCaNAqlz5QsrhBH
 HbSRK9bawmsg86dsQH2IjMpDCUePRyRF5oM8aEVzAti4uMMz1HRIpPYLi32u2KBQJ+
 AliVBErnUM3jUPU81ZHJPCNYmhPMgUeAyPCVcAL4Hih1LBsQ2CGmIALnpwgLpButSL
 rbFGcAbYC6BY3TnD/ujgbQgo1zc9++xbkTUK6KOdcjliB5wx4T3j9bIncv2DioZft3
 9ALNYJlMlexd763yE/DkmWdIt93ZLBCvhepEUEmz9UsnHPTMiD95fyECCAAuyLjyhN
 8xG5LCL5+b38A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3B7E43782057;
 Thu, 25 Jan 2024 14:14:35 +0000 (UTC)
Message-ID: <4079a650-74a6-49bc-87a9-c5729fb6e8d1@collabora.com>
Date: Thu, 25 Jan 2024 15:14:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-pwm@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Benson Leung <bleung@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <1cae6f73264ab313205eaa9483251f7aaf259cb4.1706182805.git.u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1cae6f73264ab313205eaa9483251f7aaf259cb4.1706182805.git.u.kleine-koenig@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 greybus-dev@lists.linaro.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Douglas Anderson <dianders@chromium.org>,
 kernel@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v5 003/111] pwm: Provide a macro to get
 the parent device of a given chip
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

SWwgMjUvMDEvMjQgMTM6MDgsIFV3ZSBLbGVpbmUtS8O2bmlnIGhhIHNjcml0dG86Cj4gQ3VycmVu
dGx5IGEgcHdtX2NoaXAgc3RvcmVzIGluIGl0cyBzdHJ1Y3QgZGV2aWNlICpkZXYgbWVtYmVyIGEg
cG9pbnRlcgo+IHRvIHRoZSBwYXJlbnQgZGV2aWNlLiBQcmVwYXJpbmcgYSBjaGFuZ2UgdGhhdCBl
bWJlZHMgYSBmdWxsIHN0cnVjdAo+IGRldmljZSBpbiBzdHJ1Y3QgcHdtX2NoaXAsIHRoaXMgYWNj
ZXNzb3IgbWFjcm8gc2hvdWxkIGJlIHVzZWQgaW4gYWxsCj4gZHJpdmVycyBkaXJlY3RseSBhY2Nl
c3NpbmcgY2hpcC0+ZGV2IG5vdy4gVGhpcyB3YXkgc3RydWN0IHB3bV9jaGlwIGFuZAo+IHRoaXMg
bWFjcm8gY2FuIGJlIGNoYW5nZWQgd2l0aG91dCBoYXZpbmcgdG8gdG91Y2ggYWxsIGRyaXZlcnMg
aW4gdGhlCj4gc2FtZSBjaGFuZ2Ugc2V0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUt
S8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CgpSZXZpZXdlZC1ieTogQW5n
ZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFi
b3JhLmNvbT4KCj4gLS0tCj4gICBpbmNsdWRlL2xpbnV4L3B3bS5oIHwgNSArKysrKwo+ICAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L3B3bS5oIGIvaW5jbHVkZS9saW51eC9wd20uaAo+IGluZGV4IDhmZmU5YWU3YTIzYS4uZDc5
NjY5MThmMzAxIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvcHdtLmgKPiArKysgYi9pbmNs
dWRlL2xpbnV4L3B3bS5oCj4gQEAgLTI4OSw2ICsyODksMTEgQEAgc3RydWN0IHB3bV9jaGlwIHsK
PiAgIAlzdHJ1Y3QgcHdtX2RldmljZSAqcHdtczsKPiAgIH07Cj4gICAKPiArc3RhdGljIGlubGlu
ZSBzdHJ1Y3QgZGV2aWNlICpwd21jaGlwX3BhcmVudChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCj4g
K3sKPiArCXJldHVybiBjaGlwLT5kZXY7Cj4gK30KPiArCj4gICAjaWYgSVNfRU5BQkxFRChDT05G
SUdfUFdNKQo+ICAgLyogUFdNIHVzZXIgQVBJcyAqLwo+ICAgaW50IHB3bV9hcHBseV9taWdodF9z
bGVlcChzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLCBjb25zdCBzdHJ1Y3QgcHdtX3N0YXRlICpzdGF0
ZSk7CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
