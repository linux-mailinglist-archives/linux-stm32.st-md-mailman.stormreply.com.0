Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31422691EC3
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Feb 2023 13:01:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8C7BC6A5EA;
	Fri, 10 Feb 2023 12:01:25 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92D9FC65E73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 12:01:24 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso3885910wms.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 04:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QmYEIB8KrKW3cTGNucQLIpq5xEhcRy52ps+CHHF2rNU=;
 b=mS7c+3f585HLLEal9khepFx94ipTA4PXqk1U7OFFknmgbTjOMXuIRX4fDGlifyRmmK
 vtdaw1MuQV5pUUimF5LlQ+uguZjxILxV+ICSWprHYqZAYrpeM3Lz+C1t/Nv8b+1r9inY
 9jtVvWfRS0KgvGyEgmOV9cai4kwJGO1PRk16PPdfOObGiVIcTIH6PgShE0yuUAJpecLQ
 qSip6oBXx/2G1+YRtZAvjP8VMkPrSR3SvxENacoHMqfJDxwCeAmwkZ80WYbieRvG/ifs
 iD5niK3IxeDeMb+5eq18lRCBy459BF+NjnBhtnmugYgaNAHcup+EuoZWz9AL6wfwge47
 6vzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QmYEIB8KrKW3cTGNucQLIpq5xEhcRy52ps+CHHF2rNU=;
 b=pad51a3KamFgDn43Jy1fiSQTcUOSddo51FdukSwHgbK3OjXD7yr9tGUdFQbFC+ofS8
 V+yptqTPDno9RCegK7sM34+fnX103Mz/LTEHCPhutJd2H3DNFfblUdC/6+R3JFvrJOX9
 3z0bj0Av/encz8cgc8YAKPl0uB+pUgc+XTz2wGzidHVClrGgZal16qJt0hPmbLI9puK+
 IRICfmUPe/N91l+0Chi6d0OnVUD+TOsNiq8pQ0JoN7stWkYydiNjmGSn5d/yCU8Sb08T
 WWESdEwaCXsxeqVIaq7HNch6/VlaErXnTlwDqisdAINNmxqOqaLXnB7yI2m1aStguif4
 wFBQ==
X-Gm-Message-State: AO0yUKVabiGQHqK0GxjmkOcMx+szzZUkBKl//iwQsFNLb8sz+F7nUHBl
 ULEe4DxLCWobBEwJqNBJ9dOWEw==
X-Google-Smtp-Source: AK7set/ez76U2EuZthXspsPO3fkp0PVI0WuDaCS5K7oSHsbZtQRPUPIvrpCDrvIZU8lJYfhGbFSs3g==
X-Received: by 2002:a05:600c:4a8a:b0:3de:d9f:3025 with SMTP id
 b10-20020a05600c4a8a00b003de0d9f3025mr12984366wmp.0.1676030484050; 
 Fri, 10 Feb 2023 04:01:24 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c459200b003db03725e86sm5538429wmo.8.2023.02.10.04.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 04:01:23 -0800 (PST)
Message-ID: <f894aa27-0f14-5bc9-2eae-114fae7ef3b0@linaro.org>
Date: Fri, 10 Feb 2023 13:01:01 +0100
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
References: <20230209151632.275883-1-clement.leger@bootlin.com>
 <20230209151632.275883-5-clement.leger@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209151632.275883-5-clement.leger@bootlin.com>
Cc: devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-renesas-soc@vger.kernel.org,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>, Jimmy Lalande <jimmy.lalande@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 4/6] dt-bindings: net: renesas,
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

T24gMDkvMDIvMjAyMyAxNjoxNiwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IEFkZCAicmVuZXNh
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
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wMjljZTc1OGEyOWMKPiAtLS0gL2Rldi9udWxsCj4g
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
IC0gZW51bToKPiArICAgICAgICAgIC0gcmVuZXNhcyxyOWEwNmcwMzItZ21hYwo+ICsgICAgICAt
IGNvbnN0OiByZW5lc2FzLHJ6bjEtZ21hYwo+ICsgICAgICAtIGNvbnN0OiBzbnBzLGR3bWFjCgpU
aGFua3MsIGxvb2tzIGdvb2Qgbm93LgoKPiArCj4gKyAgcGNzLWhhbmRsZToKPiArICAgIGRlc2Ny
aXB0aW9uOgo+ICsgICAgICBwaGFuZGxlIHBvaW50aW5nIHRvIGEgUENTIHN1Yi1ub2RlIGNvbXBh
dGlibGUgd2l0aAo+ICsgICAgICByZW5lc2FzLHJ6bjEtbWlpYy55YW1sIwo+ICsgICAgJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQoKeW91IGRvIG5vdCBuZWVk
IHJlZiBoZXJlIC0gaXQgaXMgY29taW5nIGZyb20gZXRoZXJuZXQtY29udHJvbGxlci55YW1sCnZp
YSBzbnBzLGR3bWFjLnlhbWwuIFlvdSBhY3R1YWxseSBjb3VsZCBkcm9wIGVudGlyZSBwcm9wZXJ0
eSwgYnV0IGl0IGNhbgphbHNvIHN0YXkgZm9yIHRoZSBkZXNjcmlwdGlvbi4KCj4gKwo+ICtyZXF1
aXJlZDoKPiArICAtIGNvbXBhdGlibGUKPiArCj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFs
c2UKPiArCj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L2Nsb2NrL3I5YTA2ZzAzMi1zeXNjdHJsLmg+Cj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgo+ICsKPiArICAgIGV0aGVybmV0QDQ0MDAw
MDAwIHsKPiArICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA2ZzAzMi1nbWFjIiwgInJl
bmVzYXMscnpuMS1nbWFjIiwgInNucHMsZHdtYWMiOwo+ICsgICAgICByZWcgPSA8MHg0NDAwMDAw
MCAweDIwMDA+Owo+ICsgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+Owo+ICsgICAgICBp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgMzQgSVJRX1RZUEVfTEVWRUxfSElHSD4sCj4gKyAgICAgICAg
ICAgICA8R0lDX1NQSSAzNiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKClBsZWFzZSBhbGlnbiB3aXRo
IHByZXZpb3VzIDwKCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
