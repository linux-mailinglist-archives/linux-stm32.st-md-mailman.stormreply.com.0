Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4017643551
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 21:11:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 713CAC65E62;
	Mon,  5 Dec 2022 20:11:00 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBA76C6507A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Dec 2022 20:10:58 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id bj12so1119641ejb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Dec 2022 12:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sp/bNT5Sth10xITvOq6/Mc90creRR8yZ/shLGt2Fjbo=;
 b=b6Jb2v7WFhoSvR0qnQE049/t4BrlMrHARODr4SKR7Xn1FQa9HrOT4fkLVGvEHA9Y1j
 1aehg61bR85KIrd2yJzQDQujMLuCNIt+emvdW9fTMhx/4U1IfjkR3nnqFTKD2foaT9Ui
 956X6MJskqO817oItJy60eJ/aPD436SYiI8CtZcVVtFSrPoeWakNB2ZLOP0F+i4StkUL
 nsRQewGeP0UsRkxnq3KtMkx7OiRgubdtkydVEQYG6jK5ZHZmbx0yNK/c8JcyYjD3JIAC
 Ut3m1P+iv3Z6OSkGBM5RkqV2YJSAbtOAlIPpS5aYllY3p4QAyiook36M6HlT+zHtjfwv
 isQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sp/bNT5Sth10xITvOq6/Mc90creRR8yZ/shLGt2Fjbo=;
 b=rxSYFquy+xcQJp5N8qqdOYOpVXKpTRj0HOiLe3+DOGudha+y0zGGpSjHS5Q4nxSpTn
 shkyvOLAa7CFDXHsEDCQRFdSfMylDdf2a4+DfkOcAveE2vm3us0TWenlf3WGY/LlSRd0
 RBOXhEQwTdEC/M7r0OLgSG7eHW0zTpCjgcBVEdKbY/I5OgXOJyVIbV6hicw0SUmS28/z
 dQ3F9lk/DXNSME1aoJiSTQ/oq+dkA1VkHhyNe85IYIoViAIU9AdmVl3E+WV1b+/zCdNA
 1R0Qr7olznRGuiKGmjger6KO42uHfuGuHrV8pvYmMnrpg4VWwBJ6qT7bukW5sx3/9T+2
 EF6Q==
X-Gm-Message-State: ANoB5pljjzccpt5jxNWUsiXFxvzE9vkWQnaFx2E0EVK8CrzEzgIoTmZJ
 zWj8fbHDBljOmpBb1A5VYLY=
X-Google-Smtp-Source: AA0mqf7z2/lysFZiqxK7ulKcSDgTYuqAgvTjsjwNu9269MsuvY9zIMkwT4vKR3jmOkwgiNV/Sr+dWg==
X-Received: by 2002:a17:906:6c93:b0:7c0:ff76:7866 with SMTP id
 s19-20020a1709066c9300b007c0ff767866mr2992853ejr.272.1670271058311; 
 Mon, 05 Dec 2022 12:10:58 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net.
 [82.149.19.102]) by smtp.gmail.com with ESMTPSA id
 d21-20020a170906305500b007838e332d78sm6558596ejd.128.2022.12.05.12.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 12:10:57 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, soc@kernel.org, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Russell King <linux@armlinux.org.uk>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>,
 Heiko Stuebner <heiko@sntech.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Tim Harvey <tharvey@gateworks.com>, Peng Fan <peng.fan@nxp.com>, 
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Frank Wunderlich <frank-w@public-files.de>, 
 Michael Riesch <michael.riesch@wolfvision.net>,
 Oleksij Rempel <linux@rempel-privat.de>
Date: Mon, 05 Dec 2022 21:10:54 +0100
Message-ID: <5625120.DvuYhMxLoT@kista>
In-Reply-To: <20221130141040.32447-3-arinc.unal@arinc9.com>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <20221130141040.32447-3-arinc.unal@arinc9.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/5] arm: dts: remove label = "cpu" from
	DSA dt-binding
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

RG5lIHNyZWRhLCAzMC4gbm92ZW1iZXIgMjAyMiBvYiAxNToxMDozNyBDRVQgamUgQXLEsW7DpyDD
nE5BTCBuYXBpc2FsKGEpOgo+IFRoaXMgaXMgbm90IHVzZWQgYnkgdGhlIERTQSBkdC1iaW5kaW5n
LCBzbyByZW1vdmUgaXQgZnJvbSBhbGwgZGV2aWNldHJlZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPgo+IC0tLQo+ICBhcmNoL2FybS9i
b290L2R0cy9hcm1hZGEtMzcwLXJkLmR0cyAgICAgICAgICAgICAgICAgICAgICAgfCAxIC0KPiAg
YXJjaC9hcm0vYm9vdC9kdHMvYXJtYWRhLTM4MS1uZXRnZWFyLWdzMTEwZW14LmR0cyAgICAgICAg
IHwgMSAtCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2FybWFkYS0zODUtY2xlYXJmb2ctZ3RyLWw4LmR0
cyAgICAgICAgICB8IDEgLQo+ICBhcmNoL2FybS9ib290L2R0cy9hcm1hZGEtMzg1LWNsZWFyZm9n
LWd0ci1zNC5kdHMgICAgICAgICAgfCAxIC0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvYXJtYWRhLTM4
NS1saW5rc3lzLmR0c2kgICAgICAgICAgICAgICAgIHwgMSAtCj4gIGFyY2gvYXJtL2Jvb3QvZHRz
L2FybWFkYS0zODUtdHVycmlzLW9tbmlhLmR0cyAgICAgICAgICAgICB8IDEgLQo+ICBhcmNoL2Fy
bS9ib290L2R0cy9hcm1hZGEtMzg4LWNsZWFyZm9nLmR0cyAgICAgICAgICAgICAgICAgfCAxIC0K
PiAgYXJjaC9hcm0vYm9vdC9kdHMvYXJtYWRhLXhwLWxpbmtzeXMtbWFtYmEuZHRzICAgICAgICAg
ICAgIHwgMSAtCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2F0OTEtc2FtYTVkMl9pY3AuZHRzICAgICAg
ICAgICAgICAgICAgICB8IDEgLQo+ICBhcmNoL2FybS9ib290L2R0cy9hdDkxLXNhbWE1ZDNfa3N6
OTQ3N19ldmIuZHRzICAgICAgICAgICAgfCAxIC0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvYmNtLWN5
Z251cy5kdHNpICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSAtCj4gIGFyY2gvYXJtL2Jvb3Qv
ZHRzL2JjbTQ3MDgtYnVmZmFsby13enItMTE2NmRocC1jb21tb24uZHRzaSB8IDEgLQo+ICBhcmNo
L2FybS9ib290L2R0cy9iY200NzA4LWx1eHVsLXhhcC0xNTEwLmR0cyAgICAgICAgICAgICAgfCAx
IC0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvYmNtNDcwOC1sdXh1bC14d2MtMTAwMC5kdHMgICAgICAg
ICAgICAgIHwgMSAtCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2JjbTQ3MDgtbmV0Z2Vhci1yNjI1MC5k
dHMgICAgICAgICAgICAgICB8IDEgLQo+ICBhcmNoL2FybS9ib290L2R0cy9iY200NzA4LXNtYXJ0
cmctc3I0MDBhYy5kdHMgICAgICAgICAgICAgfCAxIC0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvYmNt
NDcwODEtYnVmZmFsby13enItNjAwZGhwMi5kdHMgICAgICAgIHwgMSAtCj4gIGFyY2gvYXJtL2Jv
b3QvZHRzL2JjbTQ3MDgxLWx1eHVsLXhhcC0xNDEwLmR0cyAgICAgICAgICAgICB8IDEgLQo+ICBh
cmNoL2FybS9ib290L2R0cy9iY200NzA4MS1sdXh1bC14d3ItMTIwMC5kdHMgICAgICAgICAgICAg
fCAxIC0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvYmNtNDcwOS1uZXRnZWFyLXI4MDAwLmR0cyAgICAg
ICAgICAgICAgIHwgMSAtCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2JjbTQ3MDk0LWFzdXMtcnQtYWM4
OHUuZHRzICAgICAgICAgICAgICB8IDMgLS0tCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2JjbTQ3MDk0
LWRsaW5rLWRpci04ODVsLmR0cyAgICAgICAgICAgICB8IDEgLQo+ICBhcmNoL2FybS9ib290L2R0
cy9iY200NzA5NC1saW5rc3lzLXBhbmFtZXJhLmR0cyAgICAgICAgICAgfCA0IC0tLS0KPiAgYXJj
aC9hcm0vYm9vdC9kdHMvYmNtNDcwOTQtbHV4dWwtYWJyLTQ1MDAuZHRzICAgICAgICAgICAgIHwg
MSAtCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2JjbTQ3MDk0LWx1eHVsLXhhcC0xNjEwLmR0cyAgICAg
ICAgICAgICB8IDEgLQo+ICBhcmNoL2FybS9ib290L2R0cy9iY200NzA5NC1sdXh1bC14YnItNDUw
MC5kdHMgICAgICAgICAgICAgfCAxIC0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvYmNtNDcwOTQtbHV4
dWwteHdjLTIwMDAuZHRzICAgICAgICAgICAgIHwgMSAtCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2Jj
bTQ3MDk0LWx1eHVsLXh3ci0zMTAwLmR0cyAgICAgICAgICAgICB8IDEgLQo+ICBhcmNoL2FybS9i
b290L2R0cy9iY200NzA5NC1sdXh1bC14d3ItMzE1MC12MS5kdHMgICAgICAgICAgfCAxIC0KPiAg
YXJjaC9hcm0vYm9vdC9kdHMvYmNtNDcxODktdGVuZGEtYWM5LmR0cyAgICAgICAgICAgICAgICAg
IHwgMSAtCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2JjbTUzMDE1LW1lcmFraS1tcjI2LmR0cyAgICAg
ICAgICAgICAgICB8IDEgLQo+ICBhcmNoL2FybS9ib290L2R0cy9iY201MzAxNi1tZXJha2ktbXIz
Mi5kdHMgICAgICAgICAgICAgICAgfCAxIC0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvYmNtOTUzMDEy
ZXIuZHRzICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSAtCj4gIGFyY2gvYXJtL2Jvb3QvZHRz
L2JjbTk1ODYyMmhyLmR0cyAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgLQo+ICBhcmNoL2Fy
bS9ib290L2R0cy9iY205NTg2MjNoci5kdHMgICAgICAgICAgICAgICAgICAgICAgICAgfCAxIC0K
PiAgYXJjaC9hcm0vYm9vdC9kdHMvYmNtOTU4NjI1aHIuZHRzICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMSAtCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2JjbTk1ODYyNWsuZHRzICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDEgLQo+ICBhcmNoL2FybS9ib290L2R0cy9iY205ODgzMTJoci5kdHMg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAxIC0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvZ2VtaW5p
LWRsaW5rLWRpci02ODUuZHRzICAgICAgICAgICAgICAgIHwgMSAtCj4gIGFyY2gvYXJtL2Jvb3Qv
ZHRzL2dlbWluaS1zbDkzNTEyci5kdHMgICAgICAgICAgICAgICAgICAgICB8IDEgLQo+ICBhcmNo
L2FybS9ib290L2R0cy9nZW1pbmktc3EyMDEuZHRzICAgICAgICAgICAgICAgICAgICAgICAgfCAx
IC0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvaW14NTEtemlpLXJkdTEuZHRzICAgICAgICAgICAgICAg
ICAgICAgIHwgMSAtCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2lteDUxLXppaS1zY3UyLW1lenouZHRz
ICAgICAgICAgICAgICAgICB8IDEgLQo+ICBhcmNoL2FybS9ib290L2R0cy9pbXg1MS16aWktc2N1
My1lc2IuZHRzICAgICAgICAgICAgICAgICAgfCAxIC0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvaW14
NTMta3AtaHNjLmR0cyAgICAgICAgICAgICAgICAgICAgICAgIHwgMSAtCj4gIGFyY2gvYXJtL2Jv
b3QvZHRzL2lteDZkbC15YXBwNC1jb21tb24uZHRzaSAgICAgICAgICAgICAgICB8IDEgLQo+ICBh
cmNoL2FybS9ib290L2R0cy9pbXg2cS1iNDUwdjMuZHRzICAgICAgICAgICAgICAgICAgICAgICAg
fCAxIC0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvaW14NnEtYjY1MHYzLmR0cyAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMSAtCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2lteDZxLWI4NTB2My5kdHMgICAg
ICAgICAgICAgICAgICAgICAgICB8IDEgLQo+ICBhcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLWd3
NTkwNC5kdHNpICAgICAgICAgICAgICAgICAgICAgfCAxIC0KPiAgYXJjaC9hcm0vYm9vdC9kdHMv
aW14NnFkbC1za292LWNwdS5kdHNpICAgICAgICAgICAgICAgICAgIHwgMSAtCj4gIGFyY2gvYXJt
L2Jvb3QvZHRzL2lteDZxZGwtemlpLXJkdTIuZHRzaSAgICAgICAgICAgICAgICAgICB8IDEgLQo+
ICBhcmNoL2FybS9ib290L2R0cy9pbXg2cXAtcHJ0d2QzLmR0cyAgICAgICAgICAgICAgICAgICAg
ICAgfCAxIC0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvaW14N2QtemlpLXJwdTIuZHRzICAgICAgICAg
ICAgICAgICAgICAgIHwgMSAtCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2tpcmt3b29kLWRpcjY2NS5k
dHMgICAgICAgICAgICAgICAgICAgICB8IDEgLQo+ICBhcmNoL2FybS9ib290L2R0cy9raXJrd29v
ZC1sLTUwLmR0cyAgICAgICAgICAgICAgICAgICAgICAgfCAxIC0KPiAgYXJjaC9hcm0vYm9vdC9k
dHMva2lya3dvb2QtbGlua3N5cy12aXBlci5kdHMgICAgICAgICAgICAgIHwgMSAtCj4gIGFyY2gv
YXJtL2Jvb3QvZHRzL2tpcmt3b29kLW12ODhmNjI4MWd0dy1nZS5kdHMgICAgICAgICAgICB8IDEg
LQo+ICBhcmNoL2FybS9ib290L2R0cy9raXJrd29vZC1yZDg4ZjYyODEuZHRzaSAgICAgICAgICAg
ICAgICAgfCAxIC0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzYS1yZmItZW1tYy5kdHMgICAg
ICAgICAgICAgICAgICAgIHwgMSAtCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL210NzYyM2EtcmZiLW5h
bmQuZHRzICAgICAgICAgICAgICAgICAgICB8IDEgLQo+ICBhcmNoL2FybS9ib290L2R0cy9tdDc2
MjNuLWJhbmFuYXBpLWJwaS1yMi5kdHMgICAgICAgICAgICAgfCAxIC0KPiAgYXJjaC9hcm0vYm9v
dC9kdHMvbXQ3NjIzbi1yZmItZW1tYy5kdHMgICAgICAgICAgICAgICAgICAgIHwgMSAtCj4gIGFy
Y2gvYXJtL2Jvb3QvZHRzL29yaW9uNXgtbmV0Z2Vhci13bnI4NTR0LmR0cyAgICAgICAgICAgICB8
IDEgLQo+ICBhcmNoL2FybS9ib290L2R0cy9xY29tLWlwcTgwNjQtcmIzMDExLmR0cyAgICAgICAg
ICAgICAgICAgfCAyIC0tCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL3I5YTA2ZzAzMi5kdHNpICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDEgLQo+ICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUx
YS1wcnR0MWMuZHRzICAgICAgICAgICAgICAgICAgfCAxIC0KPiAgYXJjaC9hcm0vYm9vdC9kdHMv
c3VuN2ktYTIwLWxhbW9iby1yMS5kdHMgICAgICAgICAgICAgICAgIHwgMSAtCgpGb3Igc3VuN2k6
CgpBY2tlZC1ieTogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT4KCkJl
c3QgcmVnYXJkcywKSmVybmVqCgo+ICBhcmNoL2FybS9ib290L2R0cy92ZjYxMC16aWktY2Z1MS5k
dHMgICAgICAgICAgICAgICAgICAgICAgfCAxIC0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvdmY2MTAt
emlpLWRldi1yZXYtYi5kdHMgICAgICAgICAgICAgICAgIHwgMSAtCj4gIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3ZmNjEwLXppaS1kZXYtcmV2LWMuZHRzICAgICAgICAgICAgICAgICB8IDEgLQo+ICBhcmNo
L2FybS9ib290L2R0cy92ZjYxMC16aWktc2N1NC1haWIuZHRzICAgICAgICAgICAgICAgICAgfCAx
IC0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvdmY2MTAtemlpLXNwYjQuZHRzICAgICAgICAgICAgICAg
ICAgICAgIHwgMSAtCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL3ZmNjEwLXppaS1zc21iLWR0dS5kdHMg
ICAgICAgICAgICAgICAgICB8IDEgLQo+ICBhcmNoL2FybS9ib290L2R0cy92ZjYxMC16aWktc3Nt
Yi1zcHUzLmR0cyAgICAgICAgICAgICAgICAgfCAxIC0KPiAgNzUgZmlsZXMgY2hhbmdlZCwgODEg
ZGVsZXRpb25zKC0pCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
