Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8035C8564DB
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 14:51:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35871C6410C;
	Thu, 15 Feb 2024 13:51:35 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AE21C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 13:51:34 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4121954d4c0so3306305e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 05:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708005094; x=1708609894;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5t9mkBRSLuX6Whm+p+USkACVg0A1ZTFUPoQmMKDP/ks=;
 b=EtNCW3aoii3G4qU6koOVrcalKWbQ6kW2H+Lsl0xmC9F4wgdFATf6UXEppEhwiqIVBr
 hGRxoG6U3yb5BIhbet6cqVb8yJVHSDSDU+TJlW3sAILQKXRCkSUPlQmVzoQaJWVzJbpG
 JjueTCW3C5nmF6OgYpxj3n3raJKtdkPUR3ACYT2aFRdWApcgl8mRLhvvq0NWKVbS99L+
 13RvYceZnR8YK6w5oBhw+GSdNgEXfegtu8p6uuUkXS6wGNDm30X7QddMWP8VRRnDmlXc
 3a/n8/jwE7dtG4QU2hCcgowF4BulJmeoLSEyPG+T4+dwPAz1BEa8MDplCxWAUOCyxtlA
 RY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708005094; x=1708609894;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5t9mkBRSLuX6Whm+p+USkACVg0A1ZTFUPoQmMKDP/ks=;
 b=n+ngMYe+XkjP2cX59dyHdBld9OcXnhAVk3rA6nqT0kD2rAeHz5bforGICBN1jqloz1
 ZYVqei0pRO60PXkZ1o1PHC9zT/9BqOXCMeV11HlbjiA/K4rjRUpEM+q+/2Hvm22jlW2N
 v6/kusWhlrWwwbYl+gVjaGOqiJcA5oUoiWtmnZHEY8XctSzt+HZ5O8wbQDw63yWKnJXs
 zZv3rM/ml/vSbgdU0qi1wMNUXIhNotASTcNj9lhDitCoPh/hwDUWYAat4qsONjyqKEVb
 bdjm6TqwxTkQXrK6qfMO3z2ULVUwPL499Ltk/BjQWFEKd/VvU1S7Q77FzRh6D34uRrsO
 mXYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLrfBkzvx8kFhy4pFYYVTBdz6AbhMFF+HRzU73f5cKkxgv1IYxdQn26KM4y+0ABCmiej75LEtvhvrK2OljuLGfTt+2SVAIVKz2rk6CIXITbbwiXThC25OF
X-Gm-Message-State: AOJu0YzHqzyTXzysWfRBMOjMij3RR8OpmlQwYKRqZ3yr3YQZNCV/3G6L
 1WjNAll4YRGCR4RYsViXzjLY0yJb7ZToXFXBC6qTJwUnKWEr9BCA
X-Google-Smtp-Source: AGHT+IH7k9jN1LEPjklm49kSSJGmdKPhxpWNQecPQqPdKhvRMqEI/U195h3M4bWUY8DUrcLpEFVYaQ==
X-Received: by 2002:a05:600c:3503:b0:412:7d0:d83 with SMTP id
 h3-20020a05600c350300b0041207d00d83mr1601111wmq.16.1708005093670; 
 Thu, 15 Feb 2024 05:51:33 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc?
 ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c290700b00410add3af79sm5061337wmd.23.2024.02.15.05.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 05:51:33 -0800 (PST)
Message-ID: <63b248efcbd62a121610cbf37ea0339bd87c99e7.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 15 Feb 2024 14:51:31 +0100
In-Reply-To: <ws4ybgtvfxqz53vk3i67suipzyqpy5y5fqeee5uf3ua6ow222n@i4ktjuorq3nl>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
 <9577d6053a5a52536057dc8654ff567181c2da82.1707900770.git.u.kleine-koenig@pengutronix.de>
 <Zcy21tsntcK80hef@smile.fi.intel.com>
 <ws4ybgtvfxqz53vk3i67suipzyqpy5y5fqeee5uf3ua6ow222n@i4ktjuorq3nl>
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Hector Martin <marcan@marcan.st>, Michael Walle <mwalle@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, James Clark <james.clark@arm.com>,
 Pavel Machek <pavel@ucw.cz>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Guenter Roeck <groeck@chromium.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-riscv@lists.infradead.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Michal Simek <michal.simek@amd.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Lee Jones <lee@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-leds@vger.kernel.org,
 Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-sunxi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pwm@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Kees Cook <keescook@chromium.org>, Rob Herring <robh@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, Sven Peter <sven@svenpeter.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Scott Branden <sbranden@broadcom.com>, linux-gpio@vger.kernel.org,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alexander Shiyan <shc_work@mail.ru>, Palmer Dabbelt <palmer@dabbelt.com>,
 asahi@lists.linux.dev, kernel@pengutronix.de,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Anjelique Melendez <quic_amelende@quicinc.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH v6 003/164] pwm: Provide pwmchip_alloc()
 function and a devm variant of it
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

T24gVGh1LCAyMDI0LTAyLTE1IGF0IDEzOjAxICswMTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToKPiBPbiBXZWQsIEZlYiAxNCwgMjAyNCBhdCAwMjo0OToyNlBNICswMjAwLCBBbmR5IFNoZXZj
aGVua28gd3JvdGU6Cj4gPiBPbiBXZWQsIEZlYiAxNCwgMjAyNCBhdCAxMDozMDo1MEFNICswMTAw
LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiA+ID4gVGhpcyBmdW5jdGlvbiBhbGxvY2F0ZXMg
YSBzdHJ1Y3QgcHdtX2NoaXAgYW5kIGRyaXZlciBkYXRhLiBDb21wYXJlZCB0bwo+ID4gPiB0aGUg
c3RhdHVzIHF1byB0aGUgc3BsaXQgaW50byBwd21fY2hpcCBhbmQgZHJpdmVyIGRhdGEgaXMgbmV3
LCBvdGhlcndpc2UKPiA+ID4gaXQgZG9lc24ndCBjaGFuZ2UgYW55dGhpbmcgcmVsZXZhbnQgKHll
dCkuCj4gPiA+IAo+ID4gPiBUaGUgaW50ZW50aW9uIGlzIHRoYXQgYWZ0ZXIgYWxsIGRyaXZlcnMg
YXJlIHN3aXRjaGVkIHRvIHVzZSB0aGlzCj4gPiA+IGFsbG9jYXRpb24gZnVuY3Rpb24sIGl0cyBw
b3NzaWJsZSB0byBhZGQgYSBzdHJ1Y3QgZGV2aWNlIHRvIHN0cnVjdAo+ID4gPiBwd21fY2hpcCB0
byBwcm9wZXJseSB0cmFjayB0aGUgbGF0dGVyJ3MgbGlmZXRpbWUgd2l0aG91dCB0b3VjaGluZyBh
bGwKPiA+ID4gZHJpdmVycyBhZ2Fpbi4gUHJvcGVyIGxpZmV0aW1lIHRyYWNraW5nIGlzIGEgbmVj
ZXNzYXJ5IHByZWNvbmRpdGlvbiB0bwo+ID4gPiBpbnRyb2R1Y2UgY2hhcmFjdGVyIGRldmljZSBz
dXBwb3J0IGZvciBQV01zICh0aGF0IGltcGxlbWVudHMgYXRvbWljCj4gPiA+IHNldHRpbmcgYW5k
IGRvZXNuJ3Qgc3VmZmVyIGZyb20gdGhlIHN5c2ZzIG92ZXJoZWFkIG9mIHRoZSAvc3lzL2NsYXNz
L3B3bQo+ID4gPiB1c2Vyc3BhY2Ugc3VwcG9ydCkuCj4gPiA+IAo+ID4gPiBUaGUgbmV3IGZ1bmN0
aW9uIHB3bWNoaXBfcHJpdigpIChvYnZpb3VzbHk/KSBvbmx5IHdvcmtzIGZvciBjaGlwcwo+ID4g
PiBhbGxvY2F0ZWQgd2l0aCBwd21jaGlwX2FsbG9jKCkuCj4gPiAKPiA+IC4uLgo+ID4gCj4gPiA+
ICsjZGVmaW5lIFBXTUNISVBfQUxJR04gQVJDSF9ETUFfTUlOQUxJR04KPiA+ID4gKwo+ID4gPiAr
c3RhdGljIHZvaWQgKnB3bWNoaXBfcHJpdihzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCj4gPiA+ICt7
Cj4gPiA+ICsJcmV0dXJuICh2b2lkICopY2hpcCArIEFMSUdOKHNpemVvZigqY2hpcCksIFBXTUNI
SVBfQUxJR04pOwo+ID4gPiArfQo+ID4gCj4gPiBXaHkgbm90IHVzZSBkbWFfZ2V0X2NhY2hlX2Fs
aWdubWVudCgpID8KPiAKPiBIbW0sIHRoYXQgZnVuY3Rpb24gcmV0dXJucyAxIGlmIEFSQ0hfSEFT
X0RNQV9NSU5BTElHTiBpc24ndCBkZWZpbmVkLiBUaGUKPiBpZGVhIG9mIHVzaW5nIEFSQ0hfRE1B
X01JTkFMSUdOIHdhcyB0byBlbnN1cmUgdGhhdCB0aGUgcHJpdiBkYXRhIGhhcyB0aGUKPiBzYW1l
IG1pbmltYWwgYWxpZ25tZW50IGFzIGttYWxsb2MoKS4gVG9vayBteSBpbnNwcmlyYXRpb24gZnJv
bQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAyMDktY291bnRlci1hbGlnbi1maXgt
djItMS01Nzc3ZWEwYTI3MjJAYW5hbG9nLmNvbQo+IC4gVGhlIGltcGxlbWVudGF0aW9uIG9mIGRt
YV9nZXRfY2FjaGVfYWxpZ25tZW50IHN1Z2dlc3RzIHRoYXQgbm90IGFsbAo+IGFyY2hzIHByb3Zp
ZGUgQVJDSF9ETUFfTUlOQUxJR04/IEFsc28gdGhlcmUgaXMgQVJDSF9LTUFMTE9DX01JTkFMSUdO
Lgo+IEhtbSwgZG9uJ3Qga25vdyB5ZXQgd2hhdCB0byBkbyBoZXJlLgoKSGVyZSBpdCBnb2VzIG15
IDIgY2VudHMuLi4gQUZBSUssIEFSQ0hfRE1BX01JTkFMSUdOIGdpdmVzIHlvdSB0aGUgc2FtZSBh
bGlnbm1lbnQKZ3VhcmFudGVlcyB0aGFuIGRldm1fa21hbGxvYygpIGZvciBpbnN0YW5jZS4gSW4g
c29tZSBhcmNocyBpdCB3aWxsIGVmZmVjdGl2ZWx5IGJlIHRoZQpzYW1lIGFzIEFSQ0hfS01BTExP
Q19NSU5BTElHTi4gTm93LCBJIHRoaW5rIGl0IG9ubHkgbWF0dGVycyBpZiB0aGUgb3duZXJzIG9m
IHByaXZhdGUKZGF0YSBpbnRlbmQgdG8gaGF2ZSBhIERNQSBzYWZlIGJ1ZmZlciBpbiB0aGVpciBz
dHJ1Y3RzLiBJZiB0aGF0IGlzIHRoZSBjYXNlLCB3ZSBuZWVkCnRvIGVuc3VyZSBhIHByb3BlciBh
bGlnbm1lbnQgZm9yIHRoYXQgc3RydWN0dXJlLiBJbiBJSU8gZm9yIGV4YW1wbGUsIHRoZSBjb25z
dHJ1Y3QgaXMKbGlrZSB0aGlzOgoKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0
ZXN0L3NvdXJjZS9kcml2ZXJzL2lpby9kYWMvbHRjMjY4OC5jI0w5NgoKVGhlIGJ1ZmZlcnMgc2hv
dWxkIGNvbWUgbGFzdCBpbiB0aGUgc3RydWN0IHNvIHRoZXkgYXJlIGFsb25lIGluIHRoZSBsaW5l
LiBJbiBJSU8sCkpvbmF0aGFuIGhhcyBhIHN0cmljdCBwb2xpY3kgZm9yIHRoaXMuIExpa2UsIGV2
ZW4gaWYgeW91IGp1c3Qgd2FudCB0byB0cmFuc2ZlciAyLzQKYnl0ZXMgdmlhIHNwaSwgd2UgbmVl
ZCB0byBtYWtlIHRoZSBidWZmZXIgc2FmZSAoYXBwYXJlbnRseSB0aGVyZSBhcmUgc29tZSBjb250
cm9sbGVycwpvbmx5IGRvaW5nIERNQSAtIGV2ZW4gZm9yIHNtYWxsIHRyYW5zZmVycykuCgpJIHdv
dWxkIHNheSB0aGF0IGlmIHVuc3VyZSwgZ28gd2l0aCBBUkNIX0RNQV9NSU5BTElHTi4gWW91IGp1
c3QgbWlnaHQgd2FzdGUgc29tZQpzcGFjZSBpbiBzb21lIGFyY2hzLiBPVE9ILCBpZiB5b3UgdGhp
bmsgRE1BIGlzIG5vdCByZWFsbHkgYSB0aGluZyBmb3IgcHdtIGNoaXBzLCB5b3UKbWlnaHQgZ28g
QVJDSF9LTUFMTE9DX01JTkFMSUdOLiBBbmQgc2luY2UgeW91IGFscmVhZHkgaGF2ZSB5b3VyIG93
biBQV01DSElQX0FMSUdOLCBpdApzaG91bGQgYmUgZWFzeSB0byBjaGFuZ2UgdGhlIHJlcXVpcmVt
ZW50cyBkb3duIHRoZSByb2FkIChpZiBuZWVkZWQpLgoKVGhhdCBzYWlkLCBJJ20gbm90IGZhbWls
aWFyIHdpdGggZG1hX2dldF9jYWNoZV9hbGlnbm1lbnQoKS4KCi0gTnVubyBTw6EKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
