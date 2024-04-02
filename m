Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C730489530D
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Apr 2024 14:35:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79B98C6B46B;
	Tue,  2 Apr 2024 12:35:31 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D9BCC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Apr 2024 12:35:29 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6151d79db7bso8119447b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Apr 2024 05:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712061329; x=1712666129;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZhodAsfbqQph/6Oss9KdocUA4jNT8v1VGBe4Vmslbbg=;
 b=FuLEXmtSHxxwpxXou8DRHvgZhJnlpWgAi22YI2EJVCkdhYax9nWC7/I/0GskkBnKxW
 iYhJfQqKw2EQqojFbQdR0vrxMMbHHUV7MG3QHjbjm30EDdTG7UrCoQozIGh+HrY7Bl4D
 F/p5MoQd7ICV25I3qcef9aLc+a22OdXdVHBPEh+V6WbQC7FxY1gW1wM6j9F849ht7xfo
 mWe7pndw82OVxVDMApC7PMloacY6ymBYu9Ejb0a8GSXF4V579U2PvKv2WnxqLqWbvnJM
 Z/gXLk2rW0+ao+7+LdN1nkteRq3+UOov1FJlkG2BSd8Z6Lzn79wUqJ2BplRZryO/cFEw
 lCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712061329; x=1712666129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZhodAsfbqQph/6Oss9KdocUA4jNT8v1VGBe4Vmslbbg=;
 b=H4PMXKN/S/I8OEnej4gZC6tcqc8LHWRBn7dl6ORC3V+Y1r1LUbfsaLDgFiF32+Tftl
 N/ATX7F50dxmt8mH+bIu7hoDALgvSOTh+WmPuNZddNhHlgxg0yvC/dTe+Orh6XitxVwI
 4uIq4pEd8HdYO55JhXNGRA51XkEMil5L0jTfjCCEt3CP4bAHj0CLIcf3MjG8XKq1LN2R
 04u3afcCPaZyg8LqPC4lIqc4jP1Kb1OYfwXBUsoi8nPoiQ2j1v/9AbYaHZufCeYXo4AV
 njsqPRjWsjm2f8+W/og09aZ5upb1THZWZ8uCIgHAOCc0QBw7y7DH0PcPllj6j997R4bq
 g7NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfn9J/aG/nSC4eZUe/V87I78mkf0KSMaKod0Grjt8Gd4000B6c7BW7//qD0MvvG/JnEuQ3n3u2zPMrDofaYIlyqAirqXE7H56gNGfBHKVvnx+r56isNd95
X-Gm-Message-State: AOJu0YxTJKp/4kgIhRc5iZtQyWEEM4i6KpQnQ6KaSycUSfupBSjAw3II
 Cah88wrN4zVUDurWiFICziacLetumzjeV2KnTfOXygtLBXiJ/CtJ+N8fvKbg6IpuWjWaHsOFs88
 V1WlvvGcmME69ri7vECS6YFnqAUxmotFRqhKtXQ==
X-Google-Smtp-Source: AGHT+IG5hxT/EMYnHoU6u7S6MkbvLw5l9U/Ss0P2rks8Fb0m+zQTGqjqkjSlSz0lY1KsLwpjx1moujtIXAN3uBffPV8=
X-Received: by 2002:a25:6d86:0:b0:dc2:2d75:5fde with SMTP id
 i128-20020a256d86000000b00dc22d755fdemr10687728ybc.29.1712061328813; Tue, 02
 Apr 2024 05:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Apr 2024 14:35:17 +0200
Message-ID: <CACRpkdbtRoDtWN4mnyZY_yEfWQFPCQaVudjBki8N1sOXxXWupQ@mail.gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Ajay Gupta <ajayg@nvidia.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Michael Ellerman <mpe@ellerman.id.au>, Khalil Blaiech <kblaiech@nvidia.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Yicong Yang <yangyicong@hisilicon.com>, Laxman Dewangan <ldewangan@nvidia.com>,
 linux-i2c@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Fabio Estevam <festevam@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Nick Hawkins <nick.hawkins@hpe.com>, linux-amlogic@lists.infradead.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Hector Martin <marcan@marcan.st>,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-mediatek@lists.infradead.org,
 imx@lists.linux.dev, Jean-Marie Verdun <verdun@hpe.com>,
 linux-tegra@vger.kernel.org, Elie Morisse <syniurge@gmail.com>,
 Krzysztof Adamski <krzysztof.adamski@nokia.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Peter Korsgaard <peter@korsgaard.com>, Benjamin Fair <benjaminfair@google.com>,
 Michal Simek <michal.simek@amd.com>, Nancy Yuen <yuenn@google.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Robert Richter <rric@kernel.org>, Asmaa Mnebhi <asmaa@nvidia.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Conghui Chen <conghui.chen@intel.com>,
 Benson Leung <bleung@chromium.org>, Qii Wang <qii.wang@mediatek.com>,
 Avi Fishman <avifishman70@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, asahi@lists.linux.dev,
 Shawn Guo <shawnguo@kernel.org>, Vignesh R <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, Tali Perry <tali.perry1@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Jan Dabros <jsd@semihalf.com>,
 openbmc@lists.ozlabs.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Sven Peter <sven@svenpeter.dev>, virtualization@lists.linux.dev,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>, Patrick Venture <venture@google.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 64/64] i2c: reword i2c_algorithm in
 drivers according to newest specification
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

T24gRnJpLCBNYXIgMjIsIDIwMjQgYXQgMjoyN+KAr1BNIFdvbGZyYW0gU2FuZwo8d3NhK3JlbmVz
YXNAc2FuZy1lbmdpbmVlcmluZy5jb20+IHdyb3RlOgoKPiBNYXRjaCB0aGUgd29yZGluZyBpbiBp
MmNfYWxnb3JpdGhtIGluIEkyQyBkcml2ZXJzIHdydC4gdGhlIG5ld2VzdCBJMkMKPiB2NywgU01C
dXMgMy4yLCBJM0Mgc3BlY2lmaWNhdGlvbnMgYW5kIHJlcGxhY2UgIm1hc3Rlci9zbGF2ZSIgd2l0
aCBtb3JlCj4gYXBwcm9wcmlhdGUgdGVybXMuIEZvciBzb21lIGRyaXZlcnMsIHRoaXMgbWVhbnMg
bm8gbW9yZSBjb252ZXJzaW9ucyBhcmUKPiBuZWVkZWQuIEZvciB0aGUgb3RoZXJzIG1vcmUgd29y
ayBuZWVkcyB0byBiZSBkb25lIGJ1dCB0aGlzIHdpbGwgYmUKPiBwZXJmb3JtZWQgaW5jcmVtZW50
YWxseSBhbG9uZyB3aXRoIEFQSSBjaGFuZ2VzL2ltcHJvdmVtZW50cy4gQWxsIHRoZXNlCj4gY2hh
bmdlcyBoZXJlIGFyZSBzaW1wbGUgc2VhcmNoL3JlcGxhY2UgcmVzdWx0cy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+CgpB
Y2tlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMs
CkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
