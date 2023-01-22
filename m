Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2DF676D95
	for <lists+linux-stm32@lfdr.de>; Sun, 22 Jan 2023 15:19:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DADDC69053;
	Sun, 22 Jan 2023 14:19:30 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B5BCC6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Jan 2023 14:19:29 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id h12so4635220wrv.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Jan 2023 06:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6nP80yt4P2LkjTrQbSApnHJJEUxI5A3MtVuRUI18a3s=;
 b=dBCPnllzquDDUk+9Jg18anFzUDeoLloz26xrT7TaqiuwpuAwleMkzOfivLBXckeIrO
 k0bNfIggIMbd+JwuPaStVNt1bsNmGmvwxM3EAc4japN0UPT0gSC5gHyQRzqOJ91ODpAz
 eyafeA/P2Zymmyht7nTqT+PTmjnpZiD27bR3d9I/1RxPirk1Ax+NWKEJG9f2uP56FUfH
 svloR0GbSWGvZqO75pztznAjiKUj//p1a3q7O1LKJBGQmooStGU53RaRbGvSl6Pfb0WN
 riXvYdvdnlyA6jmMXZfiZr8y5vqWNWgHuNWdBoYOdTiI95sBuM1dfT5H95FPSCIX4Hig
 d3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6nP80yt4P2LkjTrQbSApnHJJEUxI5A3MtVuRUI18a3s=;
 b=IWHJ4VCZmMyofO8E22JY28zftbKJ+/q1e1HIhydsJ1sUcJO7lK+6Bed9nkCXwc1Bqh
 EOB5ggcgtcodM8zNpDUgpLp6EzDpY9WsouK/bUR9YOPf0mx7uqMBP1X8fdGgitehdESa
 /l/5H2CCt8VGan+SvF3A4tBkgJ3MXys3zNLt/+EzF2GvB2pRbYW1jzmtReuBpjIGKSpw
 MSIOus16MhGgyIbD4rOL+5xGw6wtYF8FEIzd+QjEEs4ZMoSzbBJf6k1MnLVgcYAunwVE
 MgKxYOyP8vnqLP13e1ZUYN0mIlJO3mCgMvwvXWT++a2/5oEnnBIk9x55yDvQmKLwCWwT
 UpBQ==
X-Gm-Message-State: AFqh2ko5TVLZFKOBbHNhZp0Tseiron7+PJ+HmpK0kQu7ET/QcxlZ6q7b
 Y5L6wf5bQHAuFnQfutcJOp7ghA==
X-Google-Smtp-Source: AMrXdXt35b+CmPQpFZihlqLeEU0wTQBsOlVJzU5chJmIhwORGBT/y9cFtSOaeQfQF/WddOUFzrntrA==
X-Received: by 2002:adf:f705:0:b0:2bd:d34e:534c with SMTP id
 r5-20020adff705000000b002bdd34e534cmr17454975wrp.36.1674397168563; 
 Sun, 22 Jan 2023 06:19:28 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 n9-20020adf8b09000000b00241d21d4652sm2286368wra.21.2023.01.22.06.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 06:19:28 -0800 (PST)
Message-ID: <435018a3-80a1-2113-23bf-8645e8f6e4e4@linaro.org>
Date: Sun, 22 Jan 2023 15:19:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
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
References: <20230116103926.276869-1-clement.leger@bootlin.com>
 <20230116103926.276869-5-clement.leger@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116103926.276869-5-clement.leger@bootlin.com>
Cc: devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-renesas-soc@vger.kernel.org,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>, Jimmy Lalande <jimmy.lalande@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 4/6] dt-bindings: net: renesas,
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

T24gMTYvMDEvMjAyMyAxMTozOSwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IEFkZCAicmVuZXNh
cyxyem4xLWdtYWMiIGJpbmRpbmcgZG9jdW1lbnRpb24gd2hpY2ggaXMgY29tcGF0aWJsZSB3aGlj
aAo+ICJzbnBzLGR3bWFjIiBjb21wYXRpYmxlIGRyaXZlciBidXQgdXNlcyBhIGN1c3RvbSBQQ1Mg
dG8gY29tbXVuaWNhdGUKPiB3aXRoIHRoZSBwaHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1l
bnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgo+IC0tLQo+ICAuLi4vYmluZGlu
Z3MvbmV0L3JlbmVzYXMscnpuMS1nbWFjLnlhbWwgICAgICAgfCA3MSArKysrKysrKysrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3JlbmVzYXMscnpuMS1n
bWFjLnlhbWwKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmVmZmI5YTMxMjgzMgo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3JlbmVzYXMscnpuMS1n
bWFjLnlhbWwKPiBAQCAtMCwwICsxLDcxIEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRp
ZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbmV0L3JlbmVzYXMscnpuMS1nbWFjLnlh
bWwjCj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55
YW1sIwo+ICsKPiArdGl0bGU6IFJlbmVzYXMgR01BQzEgRGV2aWNlIFRyZWUgQmluZGluZ3MKCkRy
b3AgRGV2aWNlIFRyZWUgQmluZGluZ3MuCgo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAgLSBDbMOp
bWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Cj4gKwo+ICtzZWxlY3Q6Cj4g
KyAgcHJvcGVydGllczoKPiArICAgIGNvbXBhdGlibGU6Cj4gKyAgICAgIGNvbnRhaW5zOgo+ICsg
ICAgICAgIGVudW06Cj4gKyAgICAgICAgICAtIHJlbmVzYXMscjlhMDZnMDMyLWdtYWMKPiArICAg
ICAgICAgIC0gcmVuZXNhcyxyem4xLWdtYWMKPiArICByZXF1aXJlZDoKPiArICAgIC0gY29tcGF0
aWJsZQo+ICsKPiArYWxsT2Y6Cj4gKyAgLSAkcmVmOiAic25wcyxkd21hYy55YW1sIyIKCkRyb3Ag
cXVvdGVzLgoKPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0aWJsZToKPiArICAgIGFkZGl0
aW9uYWxJdGVtczogdHJ1ZQoKTm8uIERyb3AuCgo+ICsgICAgbWF4SXRlbXM6IDMKCk5vLgoKPiAr
ICAgIGl0ZW1zOgo+ICsgICAgICAtIGVudW06Cj4gKyAgICAgICAgICAtIHJlbmVzYXMscjlhMDZn
MDMyLWdtYWMKPiArICAgICAgICAgIC0gcmVuZXNhcyxyem4xLWdtYWMKPiArICAgIGNvbnRhaW5z
Ogo+ICsgICAgICBlbnVtOgo+ICsgICAgICAgIC0gc25wcyxkd21hYwoKTm8sIHBsZWFzZSBsaXN0
IHBvc3NpYmlsaXRpZXMKCj4gKwo+ICsgIHBjcy1oYW5kbGU6Cj4gKyAgICBkZXNjcmlwdGlvbjoK
PiArICAgICAgcGhhbmRsZSBwb2ludGluZyB0byBhIFBDUyBzdWItbm9kZSBjb21wYXRpYmxlIHdp
dGgKPiArICAgICAgcmVuZXNhcyxyem4xLW1paWMueWFtbCMKPiArICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0g
Y29tcGF0aWJsZQo+ICsKPiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKCkJlc3Qg
cmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
