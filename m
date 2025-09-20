Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E33BDB8C5E4
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Sep 2025 12:49:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64721C3F949;
	Sat, 20 Sep 2025 10:49:36 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4F5EC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Sep 2025 10:49:34 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b0473327e70so531731666b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Sep 2025 03:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758365374; x=1758970174;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QJc0EGzS/+BK6QuDuFmI2nY7ewfLLXuJxl0wU299He8=;
 b=nTbMf+oZlNGehtrKJm+qxVSdzm9SAOGdE9Vt2eFZKWJoVD9FV9AdItMxlypYgkQYXn
 ecbV++lU4z7fqzvzI/qt7Y6N/LSpifFMQMYapX48c/3mAAvBbEydBUe2rbtaYe9z8/n9
 080JeDCgU5TpQexFOB4Dr3KV2/fs0n1DgcTZtxa1tiVe3ov6Wesui3Ym5xDEvxnxYC12
 jTaEjJ6pCd2hLOUXSwa1nbVinX0som2FRXr90+IP/yTOnoH+XXA1+j47h2Q4JbTr7EuT
 0I8It0TA30HRT1gyw4Pq2tQ+htfdjn6CuvNbohojTmnAiP5sF4Z97KZYmMVGV9YYRqHv
 uYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758365374; x=1758970174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QJc0EGzS/+BK6QuDuFmI2nY7ewfLLXuJxl0wU299He8=;
 b=MluA2++AyabzqLlC84atoGryY8EEtEy6AcGHcqmhUFkYPq4O0GBYmzguug2rY9ak73
 denknydGuta/WyIzTTJ0TSki0LkLUdtZDX+yyVhC0eEIbNMHFKEFvLm8W2m953hj9zGw
 5NtX95PZnGWMCkEBrmB3UdzCLIzLiNNGgyEi8HEsxZherLam/CbjvfYeVIkcO08LU+eT
 bmNPrQNEW3QnfIr5QrzPMyeYFa8qqBIgY7yI2WutMStPDkiv1rDvmud5f6fQul5KTnZ2
 FGNE7fqKcaZ0VHRBrdb1aHIwyiFLaKlnccB8tunvujVhY87AhiKG20vPh5VnqRb5SeHX
 TXfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd+qw40+tZ2lE9/DXVOGcBVfJ4Hsf+U7yW32wzz1E4IQDrvaVfb7dr4YnWfpzMC3eb/zuOaq617Uv6Ug==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzSDWng2k/ADSusaMNV4gEQGtiaf5Opxn/YtldWwI2va+NVOPkj
 UrYpnSojq/eGzd/Diid2X0xjhRTUeIOFS23oGXBnAKVExvo5KnwlJD9bNlb4mjPgUwQjD8uSHha
 v1yNsyLFR2NbaLi3BTeD6s5IcwbUf6Gk=
X-Gm-Gg: ASbGnctNN9eKP8k50D3MmOEFFLLO8UYs8QwbNCfFB13kgMs8AxyXJiYUA9SFXFR8gGJ
 /sBCGfQSk2p0dp98yvejXlFFEvKRcN+D0qS0uLJ3RnjYT/3dFfd9gObaRBDPCfnGbp5c6DGCPDQ
 qSZM/tArKcvbHkwoZNhEGkl9e6al2UVTX4S2/rl8u8YeTll9uJugsUKNLo4YMm5bVidbyQCV7sI
 LB2bfQ=
X-Google-Smtp-Source: AGHT+IHHbhBTYGUaEQMbVjyA0lAj2luPxy2XsbzoJZ2rvsPEEjKDVfN8Ekg2zTb0h70UHa/ky/mxQ7DHX1RPk/WuHD8=
X-Received: by 2002:a17:907:2d86:b0:afe:f418:2294 with SMTP id
 a640c23a62f3a-b24f4cd1612mr662812666b.49.1758365373591; Sat, 20 Sep 2025
 03:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
In-Reply-To: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 20 Sep 2025 13:48:57 +0300
X-Gm-Features: AS18NWAsgghzm2kBTHVAUWgTvM4Rjv6fz5BEJyNeWi6WNSHflPsd2h04LFjYcyQ
Message-ID: <CAHp75Vfx9kyP-rVtfvyyMK4VH+oiRVjP1fZOtbVH14iLh98Jxw@mail.gmail.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>, Plamen Atanasov <tigerment@mail.bg>,
 Heiko Stuebner <heiko@sntech.de>, Devarsh Thakkar <devarsht@ti.com>,
 Eddie James <eajames@linux.ibm.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Christian Gromm <christian.gromm@microchip.com>,
 Dmitry Osipenko <digetx@gmail.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Bingbu Cao <bingbu.cao@intel.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Shuah Khan <skhan@linuxfoundation.org>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Nas Chung <nas.chung@chipsnmedia.com>,
 Andy Shevchenko <andy@kernel.org>, Andy Walls <awalls@md.metrocast.net>,
 Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-usb@vger.kernel.org,
 Michael Tretter <m.tretter@pengutronix.de>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Jai Luthra <jai.luthra@linux.dev>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Ming Qian <ming.qian@nxp.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-aspeed@lists.ozlabs.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 Matt Ranostay <matt@ranostay.sg>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>, kernel@collabora.com,
 Ingo Molnar <mingo@kernel.org>, Matthew Majewski <mattwmajewski@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 linux-media@vger.kernel.org, Joseph Liu <kwliu@nuvoton.com>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 linux-input@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-rpi-kernel@lists.infradead.org, Zhou Peng <eagle.zhou@nxp.com>,
 Chen Ni <nichen@iscas.ac.cn>, Samuel Holland <samuel@sholland.org>,
 linux-renesas-soc@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stefan Wahren <wahrenst@gmx.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Marvin Lin <kflin@nuvoton.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 imx@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 "Everest K.C." <everestkc@everestkc.com.np>,
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
 Andrey Utkin <andrey_utkin@fastmail.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Mike Isely <isely@pobox.com>, Jackson Lee <jackson.lee@chipsnmedia.com>,
 linux-staging@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bin Liu <bin.liu@mediatek.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Ray Jui <rjui@broadcom.com>, Steve Longerbeam <slongerbeam@gmail.com>,
 Akash Kumar <quic_akakum@quicinc.com>, Mark Brown <broonie@kernel.org>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Martin Kepplinger <martink@posteo.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Yunseong Kim <ysk@kzalloc.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Tomasz Figa <tfiga@chromium.org>,
 Dan Scally <djrscally@gmail.com>, Sean Young <sean@mess.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Shawn Guo <shawnguo@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Ludwig Disterhof <ludwig@disterhof.eu>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Nick Dyer <nick@shmanahar.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Todor Tomov <todor.too@gmail.com>, Mirela Rabulea <mirela.rabulea@nxp.com>,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 Fabio Luongo <f.langufo.l@gmail.com>, Alexey Klimov <alexey.klimov@linaro.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, openbmc@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, Yang Yingliang <yangyingliang@huawei.com>,
 Michael Krufky <mkrufky@linuxtv.org>, Corentin Labbe <clabbe@baylibre.com>,
 Ismael Luceno <ismael@iodev.co.uk>, Yong Zhi <yong.zhi@intel.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>, Ma Ke <make24@iscas.ac.cn>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Eduardo Valentin <edubezval@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Hans Verkuil <hverkuil@kernel.org>, Yong Deng <yong.deng@magewell.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Purism Kernel Team <kernel@puri.sm>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, mjpeg-users@lists.sourceforge.net,
 Philipp Zabel <p.zabel@pengutronix.de>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Keke Li <keke.li@amlogic.com>
Subject: Re: [Linux-stm32] [PATCH v2 00/10] media: Introduce video device
	state management
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

T24gRnJpLCBTZXAgMTksIDIwMjUgYXQgMTI6NTfigK9QTSBKYWkgTHV0aHJhIDxqYWkubHV0aHJh
QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBUaGlzIHBhdGNoIHNlcmllcyBp
bnRyb2R1Y2VzIHN0YXRlIG1hbmFnZW1lbnQgZm9yIHZpZGVvIGRldmljZXMuCj4KPiBDdXJyZW50
bHksIFY0TDIgc3ViZGV2aWNlcyBoYXZlIGEgd2VsbC1lc3RhYmxpc2hlZCBzdGF0ZSBtYW5hZ2Vt
ZW50Cj4gc3lzdGVtIFsxXSB0aGF0IGFsbG93cyB0aGUgZnJhbWV3b3JrIHRvIHN0b3JlIHRoZSBz
dWJkZXZpY2Ugc3RhdGUKPiBhdCBhIGNlbnRyYWwgbG9jYXRpb24uCj4KPiBWaWRlbyBkZXZpY2Vz
IGhvd2V2ZXIgbGFjayB0aGlzLCBsZWFkaW5nIHRvIGluY29uc2lzdGVudCBzdGF0ZSBoYW5kbGlu
Zwo+IGFjcm9zcyBkcml2ZXJzIGFuZCBtYWtpbmcgaXQgZGlmZmljdWx0IHRvIGltcGxlbWVudCBm
ZWF0dXJlcyBsaWtlCj4gaGFyZHdhcmUgbXVsdGlwbGV4aW5nIGluIGNvbXBsZXggbWVkaWEgcGlw
ZWxpbmVzIFsyXS4KPgo+IFRoZSBzZXJpZXMgaXMgY29tcG9zZWQgb2YgdGhyZWUgcGFydHM6Cj4K
PiAtIENvcmUgSW5mcmFzdHJ1Y3R1cmUgKFBBVENIIDEtNCkKPiAgICAgICAgIEludHJvZHVjZXMg
dGhlIGJhc2ljIHN0YXRlIHN0cnVjdHVyZSwgdHJ5IHN0YXRlIHN1cHBvcnQsCj4gICAgICAgICBp
bml0aWFsaXphdGlvbiBjYWxsYmFja3MsIGFuZCBkcml2ZXIgaGVscGVycwo+IC0gRnJhbWV3b3Jr
IEludGVncmF0aW9uIChQQVRDSCA1LTcpCj4gICAgICAgICBJbnRlZ3JhdGVzIHN0YXRlIHBhc3Np
bmcgdGhyb3VnaCB0aGUgaW9jdGwgd3JhcHBlcnMgYW5kIGRyaXZlcgo+ICAgICAgICAgaW1wbGVt
ZW50YXRpb25zCj4gLSBEcml2ZXIgRXhhbXBsZXMgKFBBVENIIDgtMTApCj4gICAgICAgICBVc2Ug
dGhlIHN0YXRlIHRvIHN0b3JlIGZvcm1hdHMgaW4gVEkgSjcyMUUgQ1NJMlJYIGFuZCBSb2NrY2hp
cAo+ICAgICAgICAgUktJU1AxIGRyaXZlcnMKPgo+IFRoaXMgc2hvdWxkIGFsc28gcHJvdmlkZSBh
IGZvdW5kYXRpb24gZm9yIGRyaXZlcnMgdG8gZXh0ZW5kIG9yIHN1YmNsYXNzCj4gdGhlIHN0YXRl
IHN0cnVjdHVyZSB3aXRoIGRldmljZS1zcGVjaWZpYyB2YXJpYWJsZXMgaW4gZnV0dXJlLgo+Cj4g
SSBoYXZlIHRlc3RlZCBjYXB0dXJlIGFuZCBmb3JtYXQgbmVnb3RpYXRpb24gd2l0aCB0aGUgY29u
dmVydGVkIGRyaXZlcnMKPiBvbiBTSyBBTTYyQSAoajcyMWUtY3NpMnJ4KSBhbmQgRGViaXggTW9k
ZWwgQSAocmtpc3AxKS4KPgo+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVk
aWEvMjAyMTA2MTAxNDU2MDYuMzQ2ODIzNS0xLXRvbWkudmFsa2VpbmVuQGlkZWFzb25ib2FyZC5j
b20vCj4gWzJdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDI1MDcyNC1t
dWx0aWNvbnRleHQtbWFpbmxpbmUtMjAyNS12Mi0wLWM5YjMxNjc3MzQ4NkBpZGVhc29uYm9hcmQu
Y29tLwoKV2hlbiB5b3UgYWRkIGEgQ2MgbGlzdC4sIGRvIGl0IGFmdGVyIHRoZSAnLS0tJyAodGhy
ZWUgbWludXMgc2lnbnMpCmxpbmUsIG90aGVyd2lzZSB0aGF0IGh1Z2UgdW5uZWVkZWQgbm9pc2Ug
d2lsbCBiZWNvbWUgcGFydCBvZiB0aGUKY29tbWl0IG1lc3NhZ2UuCgoKLS0gCldpdGggQmVzdCBS
ZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
