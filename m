Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0473068F85B
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Feb 2023 20:51:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 910EDC6A5E8;
	Wed,  8 Feb 2023 19:51:05 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23AF1C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Feb 2023 19:51:04 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id ba1so13884555wrb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Feb 2023 11:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cY1HwE63r9UqyW6Gdx6yhcFxmTguDnqyz+SAe6KoqOQ=;
 b=Hn2pHT7CPTC3o8c4Wpog/hsIQx7uvafsHgvOxeofLCyAJV9L7gPsNScf3TeLdqqPnr
 LUzNnDUuUwSEk4aAlXxfEaM0zrMXnNq/Cz9jO8mHY2YrfNr8ZSfgFLz3JafNViK1B0bT
 53rAEhyJo2OFPoJrvYYNaSFu+AOUT2z3hE6WS4W+99iNSs+K++NUxAAHsqs+vnQswru7
 g2c2FQ5Zbky3mbyXl60E6JmICG07hRBCes7yafGv0Boq39tw4NTKpnaCMM8GPAJALkiJ
 IzP9WQ7KcVyZ+MritmxJAz+n/lPp2+TSmLh2MLkT3IRzrHIZ1barAg2zteWvZOip25aT
 bkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cY1HwE63r9UqyW6Gdx6yhcFxmTguDnqyz+SAe6KoqOQ=;
 b=bf4Ji9iNe/53UIOGPC6kfy6nGV4XqNIsEkuFnd8eo+acHneIxjEW2aV5KUkwWqMdkh
 +YmHIji9TWIv86NTCaqL9yBRsS56DP2jIaEXU/j9+gL3qcUbexzpSln9L/OLnwg9mr15
 tbgNFFeZdWrTcAGQcIEATT7a+Sjy2XOmlLnaCVqV7u2dJkm2R6ykQG3s6MRkx/aMGjnw
 NmmXA72yN8IblKnnrinxy6Od81EhAFVjKWdlOuJU49XWB7/L2V1pGWVGezSSoPkip36I
 9rvRzaZlyPIheoYRDaeGNeI9YV/3jDbCZBrbkBxmLg5jKQjTWbs2bMo59ygAHhiTv4Dr
 waxg==
X-Gm-Message-State: AO0yUKXZyfKYh0w5iW3NfoLei4+yY6Mh378G7U0d2fMyQKRvp8edq+uS
 QA+56Vwt/X/eqT07M8lel+dDxA==
X-Google-Smtp-Source: AK7set9dhkugBafQNUYIvCX0R36B8oLdf4eHcflcqRkwcR7SGvh653bV+4HiKahZLc+dRe/stewv5A==
X-Received: by 2002:adf:ef0d:0:b0:2c4:645:da36 with SMTP id
 e13-20020adfef0d000000b002c40645da36mr2643620wro.24.1675885863619; 
 Wed, 08 Feb 2023 11:51:03 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 f9-20020adff989000000b002c3e6b39512sm8933760wrr.53.2023.02.08.11.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 11:51:03 -0800 (PST)
Message-ID: <55f02cd9-d191-8454-ef67-613bc8373f9f@linaro.org>
Date: Wed, 8 Feb 2023 20:51:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Tan Tee Min <tee.min.tan@linux.intel.com>
References: <20230208164203.378153-1-clement.leger@bootlin.com>
 <20230208164203.378153-5-clement.leger@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208164203.378153-5-clement.leger@bootlin.com>
Cc: devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-renesas-soc@vger.kernel.org,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>, Jimmy Lalande <jimmy.lalande@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 4/6] dt-bindings: net: renesas,
 rzn1-gmac: Document RZ/N1 GMAC support
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

T24gMDgvMDIvMjAyMyAxNzo0MiwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IEFkZCAicmVuZXNh
cyxyem4xLWdtYWMiIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiB3aGljaCBpcyBjb21wYXRpYmxlIHdp
dGgKPiAic25wcyxkd21hYyIgY29tcGF0aWJsZSBkcml2ZXIgYnV0IHVzZXMgYSBjdXN0b20gUENT
IHRvIGNvbW11bmljYXRlCj4gd2l0aCB0aGUgcGh5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KPiAtLS0KPiAgLi4uL2JpbmRp
bmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sICAgICAgIHwgNjcgKysrKysrKysrKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEt
Z21hYy55YW1sCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9uZXQvcmVuZXNhcyxyem4xLWdtYWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9uZXQvcmVuZXNhcyxyem4xLWdtYWMueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi45NDRmZDBkOTdkNzkKPiAtLS0gL2Rldi9udWxsCj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEt
Z21hYy55YW1sCj4gQEAgLTAsMCArMSw2NyBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICsk
aWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55
YW1sIwo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUu
eWFtbCMKPiArCj4gK3RpdGxlOiBSZW5lc2FzIEdNQUMKPiArCj4gK21haW50YWluZXJzOgo+ICsg
IC0gQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgo+ICsKPiArc2Vs
ZWN0Ogo+ICsgIHByb3BlcnRpZXM6Cj4gKyAgICBjb21wYXRpYmxlOgo+ICsgICAgICBjb250YWlu
czoKPiArICAgICAgICBlbnVtOgo+ICsgICAgICAgICAgLSByZW5lc2FzLHI5YTA2ZzAzMi1nbWFj
Cj4gKyAgICAgICAgICAtIHJlbmVzYXMscnpuMS1nbWFjCj4gKyAgcmVxdWlyZWQ6Cj4gKyAgICAt
IGNvbXBhdGlibGUKPiArCj4gK2FsbE9mOgo+ICsgIC0gJHJlZjogc25wcyxkd21hYy55YW1sIwo+
ICsKPiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgaXRlbXM6Cj4gKyAgICAg
IC0gZW51bToKPiArICAgICAgICAgIC0gcmVuZXNhcyxyOWEwNmcwMzItZ21hYwo+ICsgICAgICAg
ICAgLSByZW5lc2FzLHJ6bjEtZ21hYwo+ICsgICAgICAgICAgLSBzbnBzLGR3bWFjCgpUaGlzIGlz
IHN0aWxsIG5vdCBjb3JyZWN0IGFuZCBkb2VzIG5vdCBtYWtlIGFueSBzZW5zZS4KCldoYXQgZG8g
eW91IHdhbnQgdG8gc2F5IGhlcmUgd2l0aCBzdWNoIGJpbmRpbmc/IFRoYXQgeW91IGRlc2NyaWJl
CiJzbnBzLGR3bWFjIiBoZXJlPyBUaGVuIGl0J3MgZHVwbGljYXRlZCB3aXRoIHNucHMsZHdtYWMu
eWFtbC4uLiBEcm9wCnRoYXQgZW51bSBhbmQgbWFrZSBpdCBhIHByb3BlciBsaXN0LgoKQmVzdCBy
ZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
