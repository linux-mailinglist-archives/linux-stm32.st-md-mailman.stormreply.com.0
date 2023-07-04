Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6EB7471B8
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jul 2023 14:50:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 724C9C6B45B;
	Tue,  4 Jul 2023 12:50:25 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10769C6A5E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jul 2023 12:50:23 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3143b70d6easo1705599f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Jul 2023 05:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688475023; x=1691067023;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=khN7qL20jiNV+2YUoL2VVrDQ7HuxSVd+7myuCssgPgE=;
 b=lhpZ5J9XdadmPSr1QR/AG8UcCx6nsBh7S96ptZWO01NVbdAD32ga6ND/rHGK/0nLeG
 OcILfAAZH2QGjuXC0E1sxnz8ySI0riahZV4a/8Vh0qOFuPLDeYuLhNivNpQ42YBQZpR1
 n52OFNS0gHnHJ4ORnADm7dkH4XGhkKGL6bdV3HcGb/JLkgwlITETOv6im3jy+/aeghKo
 SoRqplSJRCRJRm91vnJY56FDVLzwhoIazir8wpfpbMjF7lfBWguiZ9/WFTsJGIwwwgsO
 /SRYchDhQsYGOB5Pi+dm1/EQ35yHwT5u3gaFUFxuzSwiOobh/h9Vc1OIagL99AHBAmRV
 s8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688475023; x=1691067023;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=khN7qL20jiNV+2YUoL2VVrDQ7HuxSVd+7myuCssgPgE=;
 b=OkAoYCD4vfWStZRsGS8bSOE7OjnGKVBWzhtLXmsU7/kLzjJiZJVlZanB4D5v65twLw
 5pavQRbtnxrXLEFrw4Us4F3y+CI0jdd9xAIdTWiwASSU0r/gvqfIXFMXCIA8dX1uStKb
 f2FcCEl7QZpNxSECQHqeAzogaQ166txVYDhH79nKnhdhOfu/4iyA1FAPWMx2agcDtxTK
 iVslwWA7WsBjp8VpoxJC4C8undPtaPoDbFAmgxdkeaa6BpVJ2gVIXP5l69Bc1ub8ocOo
 aEy0QkMFtZ9oV/Oc6K6IpvzJbC1htmRdWph/GxgWbZP+bwnsnkX/2D9h7c+cbF4d6ZNQ
 RO3w==
X-Gm-Message-State: ABy/qLa+MtKkEYCkaOOH81jf56rYgJsGHCcCX4XBVlHOW508xQW/NDAG
 RnkbqwVc1w6drYBYrSwU/kYjjQ==
X-Google-Smtp-Source: APBJJlGYnTg9Odl6AdblWp67O67QkMbjypzSdthrdvhcA+ODLfuCZz/bh+UKd6Sl1gTFpqUPb6nUyw==
X-Received: by 2002:a5d:4203:0:b0:313:f395:f5a3 with SMTP id
 n3-20020a5d4203000000b00313f395f5a3mr9492911wrq.38.1688475023459; 
 Tue, 04 Jul 2023 05:50:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:106:cd85:84ae:7b?
 ([2a01:e0a:982:cbb0:106:cd85:84ae:7b])
 by smtp.gmail.com with ESMTPSA id
 g5-20020adff405000000b003143cb109d5sm2634842wro.14.2023.07.04.05.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 05:50:23 -0700 (PDT)
Message-ID: <12266deb-4602-c557-fd80-689765fbf302@linaro.org>
Date: Tue, 4 Jul 2023 14:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-6-fb6ab3dea87c@linaro.org>
 <20230704103026.6db56915@xps-13>
Organization: Linaro Developer Services
In-Reply-To: <20230704103026.6db56915@xps-13>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Daniel Golle <daniel@makrotopia.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andy@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-oxnas@groups.io,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 06/15] dt-bindings: mtd: oxnas-nand:
 remove obsolete bindings
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgTWlxdWVsLAoKT24gMDQvMDcvMjAyMyAxMDozMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBOZWlsLAo+IAo+IG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmcgd3JvdGUgb24gRnJpLCAzMCBK
dW4gMjAyMyAxODo1ODozMSArMDIwMDoKPiAKPj4gRHVlIHRvIGxhY2sgb2YgbWFpbnRlbmFuY2Ug
YW5kIHN0YWxsIG9mIGRldmVsb3BtZW50IGZvciBhIGZldyB5ZWFycyBub3csCj4+IGFuZCBzaW5j
ZSBubyBuZXcgZmVhdHVyZXMgd2lsbCBldmVyIGJlIGFkZGVkIHVwc3RyZWFtLCByZW1vdmUgdGhl
Cj4+IGZvciBPWDgxMCBhbmQgT1g4MjAgbmFuZCBiaW5kaW5ncy4KPj4KPj4gQWNrZWQtYnk6IEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KPj4gQWNr
ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPj4gQWNrZWQt
Ynk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4+IEFja2VkLWJ5OiBEYW5pZWwgR29s
bGUgPGRhbmllbEBtYWtyb3RvcGlhLm9yZz4KPj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJv
bmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+Cj4gCj4gQWNrZWQtYnk6IE1pcXVlbCBSYXlu
YWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gCj4gSSBhc3N1bWUgdGhlc2UgdHdvIG10
ZCByZWxhdGVkIHBhdGNoZXMgd2lsbCBiZSBwaWNrZWQtdXAgdGhyb3VnaCB0aGUKPiBzb2MgdHJl
ZSBhcyB3ZWxsLCBpZiB0aGF0J3Mgbm90IHRoZSBjYXNlIGp1c3QgcGluZyBtZSBhbmQgSSdsbCB0
YWtlCj4gdGhlbS4KCkFzIG9mIHRvZGF5LCB0aGVyZSdzIG5vIHN0cm9uZyBwbGFuLCBzbyBtYWlu
dGFpbmVycyBjYW4gcGljayB0aGVpciBwYXRjaGVzCmFuZCBJJ2xsIHByb2JhYmx5IGZ1bm5lbCB0
aGUgcmVtYWluaW5nIG9uZXMgdmlhIGEgZmluYWwgU29DIFBSLgoKVGhhbmtzLApOZWlsCgo+IAo+
IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
