Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 957F86884A3
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Feb 2023 17:40:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47A6BC64107;
	Thu,  2 Feb 2023 16:40:42 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45438C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Feb 2023 16:40:41 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id bk15so7591641ejb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Feb 2023 08:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1JxadcUmstQQisxG5SMmC/yE89rXvA6AYxcU2YUnVDQ=;
 b=F0H3B8NAgseBrYAc9OhvFrrJcHUs5RxsmEgusiWeYI4oHZkbOFHj9Ncu15Uvbi4tCO
 GCoGClEA/o94QYw0U1UfeOAEL80uwq+5tCfPJWGsWnHH8HpmO1lWGzeCrAsIdF4Fu6zR
 kNR+WhBg1xqNyaBWvq3l+bklN9GSWeF5rkZflnjP5JjP6Pm7phnd2Ab56G7cA8boFLp0
 xzt+aopsRq/bEYAtjRCwCMmTji3jBwX9xCOCD4tzAC2fkbovQWodfYFH0SLzujYlkR2S
 3SeXJQSQvZdrRrWbPhPWjXi7p2pGkVjdnp+X80CVTlvacpypSO18F0i1MgCSG84IgzXR
 jpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1JxadcUmstQQisxG5SMmC/yE89rXvA6AYxcU2YUnVDQ=;
 b=Q/rM+07DjTVnc0nDnvLc4xbpl+cZTsijqxFpF4okrTIbq/IrF6TTK5LM6/RAfY+esL
 qKv80/Sb6FJt8f6UgZXUps+D0V1kUQBaXsSZvQ14yz89BzB95O+KHIx8ijA5qxkYmuPG
 mNWda5RKy9woMmQQRYVaCtPnixAI+DDCI6YauZFflpY81/aLiHbOxC7drhya2cdj/Wx5
 QuQ4guMR5v3AbnR8t0b8BFnlKEb97lrXn1F1fXU840sjWWb895IvhOm4FvayUOOr97bX
 x1RP5NmQNCBxwY6hzjt/UkaRnKkXEOPLxMlKJqqiLDWSnEEcznuyy98qO0WAEs+aH0yQ
 GS1g==
X-Gm-Message-State: AO0yUKX8q/BRUICc0iyVTGkKcZvpc8GBklXehQS0gWl0ZyOV45Wq+1vm
 VjZAHl12AwZI3SesJg+cp3s=
X-Google-Smtp-Source: AK7set8DElzpOFybgSqmpPkVSDP76pQ9uMXg+BggB0EZ9TIGd1XdSGpOOvGTm4L9iJVvil59yp3mTw==
X-Received: by 2002:a17:906:c156:b0:88d:ba89:1835 with SMTP id
 dp22-20020a170906c15600b0088dba891835mr2844484ejc.6.1675356040636; 
 Thu, 02 Feb 2023 08:40:40 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net.
 [82.149.19.102]) by smtp.gmail.com with ESMTPSA id
 by13-20020a0564021b0d00b004a277d55a6csm3387108edb.1.2023.02.02.08.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 08:40:40 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: broonie@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, jic23@kernel.org, tudor.ambarus@microchip.com,
 pratyush@kernel.org, sanju.mehta@amd.com, chin-ting_kuo@aspeedtech.com,
 clg@kaod.org, kdasu.kdev@gmail.com, f.fainelli@gmail.com, rjui@broadcom.com,
 sbranden@broadcom.com, eajames@linux.ibm.com, olteanv@gmail.com,
 han.xu@nxp.com, john.garry@huawei.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, narmstrong@baylibre.com, khilman@baylibre.com,
 matthias.bgg@gmail.com, haibo.chen@nxp.com, linus.walleij@linaro.org,
 daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
 agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de,
 krzysztof.kozlowski@linaro.org, andi@etezian.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, samuel@sholland.org,
 masahisa.kojima@linaro.org, jaswinder.singh@linaro.org, rostedt@goodmis.org,
 mingo@redhat.com, l.stelmach@samsung.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 alex.aring@gmail.com, stefan@datenfreihafen.org, kvalo@kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, palmer@dabbelt.com
Date: Thu, 02 Feb 2023 17:40:35 +0100
Message-ID: <4802797.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230202152258.512973-2-amit.kumar-mahapatra@amd.com>
References: <20230202152258.512973-1-amit.kumar-mahapatra@amd.com>
 <20230202152258.512973-2-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Cc: alexandre.belloni@bootlin.com, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 konrad.dybcio@somainline.org, tali.perry1@gmail.com, ldewangan@nvidia.com,
 linux-mtd@lists.infradead.org, alim.akhtar@samsung.com,
 linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com, git@amd.com,
 linux-samsung-soc@vger.kernel.org, benjaminfair@google.com,
 yogeshgaur.83@gmail.com, openbmc@lists.ozlabs.org, yuenn@google.com,
 bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-imx@nxp.com, martin.blumenstingl@googlemail.com,
 linux-arm-msm@vger.kernel.org, radu_nicolae.pirea@upb.ro,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, avifishman70@gmail.com,
 venture@google.com, libertas-dev@lists.infradead.org,
 linux-wireless@vger.kernel.org, nicolas.ferre@microchip.com,
 fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, andrew@aj.id.au,
 thierry.reding@gmail.com, kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com
Subject: [Linux-stm32] Re: [PATCH v3 01/13] spi: Replace all
 spi->chip_select and spi->cs_gpiod references with function call
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

SGkhCgpEbmUgxI1ldHJ0ZWssIDAyLiBmZWJydWFyIDIwMjMgb2IgMTY6MjI6NDYgQ0VUIGplIEFt
aXQgS3VtYXIgTWFoYXBhdHJhIApuYXBpc2FsKGEpOgo+IFN1cHBvcnRpbmcgbXVsdGktY3MgaW4g
c3BpIGRyaXZlcnMgd291bGQgcmVxdWlyZSB0aGUgY2hpcF9zZWxlY3QgJiBjc19ncGlvZAo+IG1l
bWJlcnMgb2Ygc3RydWN0IHNwaV9kZXZpY2UgdG8gYmUgYW4gYXJyYXkuIEJ1dCBjaGFuZ2luZyB0
aGUgdHlwZSBvZiB0aGVzZQo+IG1lbWJlcnMgdG8gYXJyYXkgd291bGQgYnJlYWsgdGhlIHNwaSBk
cml2ZXIgZnVuY3Rpb25hbGl0eS4gVG8gbWFrZSB0aGUKPiB0cmFuc2l0aW9uIHNtb290aGVyIGlu
dHJvZHVjZWQgZm91ciBuZXcgQVBJcyB0byBnZXQvc2V0IHRoZQo+IHNwaS0+Y2hpcF9zZWxlY3Qg
JiBzcGktPmNzX2dwaW9kIGFuZCByZXBsYWNlZCBhbGwgc3BpLT5jaGlwX3NlbGVjdCBhbmQKPiBz
cGktPmNzX2dwaW9kIHJlZmVyZW5jZXMgd2l0aCBnZXQgb3Igc2V0IEFQSSBjYWxscy4KPiBXaGls
ZSBhZGRpbmcgbXVsdGktY3Mgc3VwcG9ydCBpbiBmdXJ0aGVyIHBhdGNoZXMgdGhlIGNoaXBfc2Vs
ZWN0ICYgY3NfZ3Bpb2QKPiBtZW1iZXJzIG9mIHRoZSBzcGlfZGV2aWNlIHN0cnVjdHVyZSB3b3Vs
ZCBiZSBjb252ZXJ0ZWQgdG8gYXJyYXlzICYgdGhlCj4gImlkeCIgcGFyYW1ldGVyIG9mIHRoZSBB
UElzIHdvdWxkIGJlIHVzZWQgYXMgYXJyYXkgaW5kZXggaS5lLiwKPiBzcGktPmNoaXBfc2VsZWN0
W2lkeF0gJiBzcGktPmNzX2dwaW9kW2lkeF0gcmVzcGVjdGl2ZWx5Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFtaXQgS3VtYXIgTWFoYXBhdHJhIDxhbWl0Lmt1bWFyLW1haGFwYXRyYUBhbWQuY29tPgo+
IEFja2VkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPiAjIFJvY2tjaGlwIGRy
aXZlcnMKPiBSZXZpZXdlZC1ieTogTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAYW1kLmNvbT4K
PiBSZXZpZXdlZC1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4gIyBBc3BlZWQg
ZHJpdmVyCj4gUmV2aWV3ZWQtYnk6IERocnV2YSBHb2xlIDxkLWdvbGVAdGkuY29tPiAjIFNQSSBD
YWRlbmNlIFFTUEkKPiBSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3Rh
cmRAZm9zcy5zdC5jb20+ICMgc3BpLXN0bTMyLXFzcGkKPiBBY2tlZC1ieTogV2lsbGlhbSBaaGFu
ZyA8d2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20+ICMgYmNtNjN4eC1oc3NwaSBkcml2ZXIKPiAt
LS0KPiAgZHJpdmVycy9zcGkvc3BpLWFsdGVyYS1jb3JlLmMgICAgIHwgIDIgKy0KPiAgZHJpdmVy
cy9zcGkvc3BpLWFtZC5jICAgICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL3NwaS9zcGkt
YXI5MzR4LmMgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3NwaS9zcGktYXJtYWRhLTM3MDAu
YyAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMgICAgICB8IDEz
ICsrKysrKystLS0tLS0KPiAgZHJpdmVycy9zcGkvc3BpLWF0OTEtdXNhcnQuYyAgICAgIHwgIDIg
Ky0KPiAgZHJpdmVycy9zcGkvc3BpLWF0aDc5LmMgICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2
ZXJzL3NwaS9zcGktYXRtZWwuYyAgICAgICAgICAgfCAyNiArKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLQo+ICBkcml2ZXJzL3NwaS9zcGktYXUxNTUwLmMgICAgICAgICAgfCAgNCArKy0tCj4gIGRy
aXZlcnMvc3BpL3NwaS1heGktc3BpLWVuZ2luZS5jICB8ICAyICstCj4gIGRyaXZlcnMvc3BpL3Nw
aS1iY20tcXNwaS5jICAgICAgICB8IDEwICsrKysrLS0tLS0KPiAgZHJpdmVycy9zcGkvc3BpLWJj
bTI4MzUuYyAgICAgICAgIHwgMTkgKysrKysrKysrKy0tLS0tLS0tLQo+ICBkcml2ZXJzL3NwaS9z
cGktYmNtMjgzNWF1eC5jICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvc3BpL3NwaS1iY202M3h4
LWhzc3BpLmMgICB8IDIyICsrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9zcGkvc3Bp
LWJjbTYzeHguYyAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVh
ZHNwaS5jIHwgIDUgKysrLS0KPiAgZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UteHNwaS5jICAgIHwg
IDQgKystLQo+ICBkcml2ZXJzL3NwaS9zcGktY2FkZW5jZS5jICAgICAgICAgfCAgNCArKy0tCj4g
IGRyaXZlcnMvc3BpL3NwaS1jYXZpdW0uYyAgICAgICAgICB8ICA4ICsrKystLS0tCj4gIGRyaXZl
cnMvc3BpL3NwaS1jb2xkZmlyZS1xc3BpLmMgICB8ICA4ICsrKystLS0tCj4gIGRyaXZlcnMvc3Bp
L3NwaS1kYXZpbmNpLmMgICAgICAgICB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQo+ICBkcml2ZXJz
L3NwaS9zcGktZGxuMi5jICAgICAgICAgICAgfCAgNiArKystLS0KPiAgZHJpdmVycy9zcGkvc3Bp
LWR3LWNvcmUuYyAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9zcGkvc3BpLWR3LW1taW8uYyAg
ICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL3NwaS9zcGktZmFsY29uLmMgICAgICAgICAgfCAg
MiArLQo+ICBkcml2ZXJzL3NwaS9zcGktZnNpLmMgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2
ZXJzL3NwaS9zcGktZnNsLWRzcGkuYyAgICAgICAgfCAxNiArKysrKysrKy0tLS0tLS0tCj4gIGRy
aXZlcnMvc3BpL3NwaS1mc2wtZXNwaS5jICAgICAgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL3Nw
aS9zcGktZnNsLWxwc3BpLmMgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3NwaS9zcGktZnNsLXFz
cGkuYyAgICAgICAgfCAgNiArKystLS0KPiAgZHJpdmVycy9zcGkvc3BpLWZzbC1zcGkuYyAgICAg
ICAgIHwgIDIgKy0KPiAgZHJpdmVycy9zcGkvc3BpLWdlbmktcWNvbS5jICAgICAgIHwgIDYgKysr
LS0tCj4gIGRyaXZlcnMvc3BpL3NwaS1ncGlvLmMgICAgICAgICAgICB8ICA0ICsrLS0KPiAgZHJp
dmVycy9zcGkvc3BpLWd4cC5jICAgICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL3NwaS9z
cGktaGlzaS1zZmMtdjN4eC5jICAgfCAgMiArLQo+ICBkcml2ZXJzL3NwaS9zcGktaW1nLXNwZmku
YyAgICAgICAgfCAxNCArKysrKysrLS0tLS0tLQo+ICBkcml2ZXJzL3NwaS9zcGktaW14LmMgICAg
ICAgICAgICAgfCAzMCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9z
cGkvc3BpLWluZ2VuaWMuYyAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL3NwaS9zcGktaW50
ZWwuYyAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3NwaS9zcGktamNvcmUuYyAgICAgICAg
ICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvc3BpL3NwaS1sYW50aXEtc3NjLmMgICAgICB8ICA2ICsr
Ky0tLQo+ICBkcml2ZXJzL3NwaS9zcGktbWVtLmMgICAgICAgICAgICAgfCAgNCArKy0tCj4gIGRy
aXZlcnMvc3BpL3NwaS1tZXNvbi1zcGljYy5jICAgICB8ICAyICstCj4gIGRyaXZlcnMvc3BpL3Nw
aS1taWNyb2NoaXAtY29yZS5jICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL3NwaS9zcGktbXBjNTEy
eC1wc2MuYyAgICAgfCAgOCArKysrLS0tLQo+ICBkcml2ZXJzL3NwaS9zcGktbXBjNTJ4eC5jICAg
ICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3NwaS9zcGktbXQ2NXh4LmMgICAgICAgICAgfCAgNiAr
KystLS0KPiAgZHJpdmVycy9zcGkvc3BpLW10NzYyMS5jICAgICAgICAgIHwgIDIgKy0KPiAgZHJp
dmVycy9zcGkvc3BpLW11eC5jICAgICAgICAgICAgIHwgIDggKysrKy0tLS0KPiAgZHJpdmVycy9z
cGkvc3BpLW14aWMuYyAgICAgICAgICAgIHwgMTAgKysrKystLS0tLQo+ICBkcml2ZXJzL3NwaS9z
cGktbXhzLmMgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3NwaS9zcGktbnBjbS1maXUu
YyAgICAgICAgfCAyMCArKysrKysrKysrLS0tLS0tLS0tLQo+ICBkcml2ZXJzL3NwaS9zcGktbnhw
LWZzcGkuYyAgICAgICAgfCAxMCArKysrKy0tLS0tCj4gIGRyaXZlcnMvc3BpL3NwaS1vbWFwLTEw
MGsuYyAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvc3BpL3NwaS1vbWFwLXV3aXJlLmMgICAgICB8
ICA4ICsrKystLS0tCj4gIGRyaXZlcnMvc3BpL3NwaS1vbWFwMi1tY3NwaS5jICAgICB8IDI0ICsr
KysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL3NwaS9zcGktb3Jpb24uYyAgICAgICAg
ICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvc3BpL3NwaS1wY2kxeHh4eC5jICAgICAgICB8ICA0ICsr
LS0KPiAgZHJpdmVycy9zcGkvc3BpLXBpYzMyLXNxaS5jICAgICAgIHwgIDIgKy0KPiAgZHJpdmVy
cy9zcGkvc3BpLXBpYzMyLmMgICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL3NwaS9zcGkt
cGwwMjIuYyAgICAgICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvc3BpL3NwaS1weGEyeHguYyAg
ICAgICAgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL3NwaS9zcGktcWNvbS1xc3BpLmMgICAgICAg
fCAgMiArLQo+ICBkcml2ZXJzL3NwaS9zcGktcmI0eHguYyAgICAgICAgICAgfCAgMiArLQo+ICBk
cml2ZXJzL3NwaS9zcGktcm9ja2NoaXAtc2ZjLmMgICAgfCAgMiArLQo+ICBkcml2ZXJzL3NwaS9z
cGktcm9ja2NoaXAuYyAgICAgICAgfCAyNiArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICBk
cml2ZXJzL3NwaS9zcGktcnNwaS5jICAgICAgICAgICAgfCAxMCArKysrKy0tLS0tCj4gIGRyaXZl
cnMvc3BpL3NwaS1zM2M2NHh4LmMgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvc3BpL3NwaS1z
YzE4aXM2MDIuYyAgICAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9zcGkvc3BpLXNoLW1zaW9mLmMg
ICAgICAgIHwgIDYgKysrLS0tCj4gIGRyaXZlcnMvc3BpL3NwaS1zaC1zY2kuYyAgICAgICAgICB8
ICAyICstCj4gIGRyaXZlcnMvc3BpL3NwaS1zaWZpdmUuYyAgICAgICAgICB8ICA2ICsrKy0tLQo+
ICBkcml2ZXJzL3NwaS9zcGktc24tZi1vc3BpLmMgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3Nw
aS9zcGktc3Qtc3NjNC5jICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3NwaS9zcGktc3RtMzIt
cXNwaS5jICAgICAgfCAxMiArKysrKystLS0tLS0KPiAgZHJpdmVycy9zcGkvc3BpLXN1bjRpLmMg
ICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9zcGkvc3BpLXN1bjZpLmMgICAgICAgICAgIHwg
IDIgKy0KCkZvciBzdW40aSwgc3VuNmk6CkFja2VkLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVq
LnNrcmFiZWNAZ21haWwuY29tPgoKQmVzdCByZWdhcmRzLApKZXJuZWoKCj4gIGRyaXZlcnMvc3Bp
L3NwaS1zeW5xdWFjZXIuYyAgICAgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL3NwaS9zcGktdGVn
cmExMTQuYyAgICAgICAgfCAyOCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gIGRyaXZl
cnMvc3BpL3NwaS10ZWdyYTIwLXNmbGFzaC5jICB8ICAyICstCj4gIGRyaXZlcnMvc3BpL3NwaS10
ZWdyYTIwLXNsaW5rLmMgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL3NwaS9zcGktdGVncmEyMTAt
cXVhZC5jICAgfCAgOCArKysrLS0tLQo+ICBkcml2ZXJzL3NwaS9zcGktdGktcXNwaS5jICAgICAg
ICAgfCAxNiArKysrKysrKy0tLS0tLS0tCj4gIGRyaXZlcnMvc3BpL3NwaS10b3BjbGlmZi1wY2gu
YyAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9zcGkvc3BpLXdwY20tZml1LmMgICAgICAgIHwgMTIg
KysrKysrLS0tLS0tCj4gIGRyaXZlcnMvc3BpL3NwaS14Y29tbS5jICAgICAgICAgICB8ICAyICst
Cj4gIGRyaXZlcnMvc3BpL3NwaS14aWxpbnguYyAgICAgICAgICB8ICA2ICsrKy0tLQo+ICBkcml2
ZXJzL3NwaS9zcGkteGxwLmMgICAgICAgICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvc3BpL3Nw
aS16eW5xLXFzcGkuYyAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvc3BpL3NwaS16eW5xbXAtZ3Fz
cGkuYyAgICB8ICAyICstCj4gIGRyaXZlcnMvc3BpL3NwaWRldi5jICAgICAgICAgICAgICB8ICA2
ICsrKy0tLQo+ICBpbmNsdWRlL3RyYWNlL2V2ZW50cy9zcGkuaCAgICAgICAgfCAxMCArKysrKy0t
LS0tCj4gIDkyIGZpbGVzIGNoYW5nZWQsIDMxNSBpbnNlcnRpb25zKCspLCAzMTAgZGVsZXRpb25z
KC0pCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
