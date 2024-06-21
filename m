Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14775911AD2
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 08:02:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD0FDC7128E;
	Fri, 21 Jun 2024 06:02:15 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0A86C7128D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 06:02:07 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42278f3aea4so16509435e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 23:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718949727; x=1719554527;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=g0Hfq3q6+Bq2sBAL3y5mfWY6pJX0OWp0a47XCpnciK0=;
 b=ycvLApitIxHkYRmKSRG6zwzrlenuImqPm3JwH7aanUM0idmoyox3BouWebnuphYSED
 JC66n7Zy/X3EF/l6g8KrAccK4q+YGbiJ3z4Pd5RY+zwXvcsyXVLMt7nawP0zAkhh/8lx
 ybAFsda9UdmEVJAvAPMaEL7O4z1ubyoWbB8lWgwOHxCeI5cJDGskrIC6lL3s2f8i/3om
 J85qfQc9AS9oXnwQSL++ARA640WS+nOFXGOA7m5FQZ6yNGZIroGMI7OCt+SMtvqPzM5S
 fN4QQisvGkGDLKEB0vxdGPWS+njUNlICJ4hBUdOEI/0xc+rowaq7nIDTlB3+Mff8M76L
 PxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718949727; x=1719554527;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g0Hfq3q6+Bq2sBAL3y5mfWY6pJX0OWp0a47XCpnciK0=;
 b=XIxJelZJcE0CKF0WuE5mp83M0fQaNaQzyaxPZKQ+oRX/rn37dqnSqsZIpviBTF+P2I
 PCDNWdYnnxqyXVspFWu0oRPVhz/7QAvhdVNpx6LOvnHg3iide605ksUijS7n52dQOs0f
 xViCnKiUGHgr9K+6LNFKD5S6pJBzVeniWzep751bct4wgjQsR3+hBr1IWPqI97SIj71A
 h0s2DRLK+19gH4xjlAZx7X3/mQTpYoneEFSEy+pPrwCQZu6sxMsLKNctSBVVCoTBCj8v
 e8a2XJiyCMp41IMgeKNbMePZ6WuCqbn9JEELf5epbIjxYgPkLQnoAv6q5diLr8j2x80x
 yy9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNBxge5TbOjEOB/SxNg+519ojnrtT1GGPfloG/MjMCCLCuWTT9sJ7OF4bbCcCDXCDy54dcCXXtqdIqGqCDdQeI8x+/XTj7+6Qcb4xw/Yi767YLCuoE5spx
X-Gm-Message-State: AOJu0Yw55CkHm0jDUFsd+xs9unn4hahkySwb9KxMvuPNv9bjWHOwD0as
 7/i7loGRBvh11808BfVC7sZlJF6673PwhLcVaAZmvX16NnZrSC7aGEOlMQ3MFf8=
X-Google-Smtp-Source: AGHT+IHuLT4dvAGw8hgAgzMvFAkauYtoD8jvXQ839+22x26JdT6wezqq6/7vvbhnIarTtr6Rq71dLw==
X-Received: by 2002:a05:600c:4c92:b0:423:2a9:19ce with SMTP id
 5b1f17b1804b1-42475296becmr51344535e9.25.1718949727044; 
 Thu, 20 Jun 2024 23:02:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a2f693fsm760617f8f.69.2024.06.20.23.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 23:02:06 -0700 (PDT)
Message-ID: <6bc864d6-11de-4762-b309-2e2a3bffaa24@linaro.org>
Date: Fri, 21 Jun 2024 08:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andi Shyti <andi.shyti@kernel.org>
References: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
 <qru4aqjphjnjpo6yjxl2oznhlz774iv77u4u7u4jldnmlanps5@vpzxntuz6arp>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <qru4aqjphjnjpo6yjxl2oznhlz774iv77u4u7u4jldnmlanps5@vpzxntuz6arp>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh R <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Sergiu Moga <sergiu.moga@microchip.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, chrome-platform@lists.linux.dev,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org, Doug Anderson <dianders@chromium.org>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Enric Balletbo i Serra <eballetbo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 0/7] dt-bindings: i2c: few fixes and
	cleanups
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

T24gMjEvMDYvMjAyNCAwMTowNSwgQW5kaSBTaHl0aSB3cm90ZToKPiBDemXFm8SHIEtyenlzenRv
ZiwKPiAKPiBPbiBUaHUsIEp1biAyMCwgMjAyNCBhdCAwMTozNDo0OFBNIEdNVCwgS3J6eXN6dG9m
IEtvemxvd3NraSB3cm90ZToKPj4gRmV3IGZpeGVzIGZvciBJMkMgY29udHJvbGxlciBzY2hlbWFz
LiBUaGUgdGhpcmQgcGF0Y2ggKGF0bWVsLGF0OTFzYW0pCj4+IGRlcGVuZHMgb24gZmlyc3QsIHNv
IEkgc3VnZ2VzdCBub3Qgc3BsaXR0aW5nIHRoaXMgaW50byBmaXhlcyBicmFuY2ggYnV0Cj4+IHRh
a2UgYXMgaXMgdmlhIG5leHQgYnJhbmNoLgo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IEtyenlzenRv
Zgo+Pgo+PiAtLS0KPj4gS3J6eXN6dG9mIEtvemxvd3NraSAoNyk6Cj4+ICAgICAgIGR0LWJpbmRp
bmdzOiBpMmM6IGF0bWVsLGF0OTFzYW06IGNvcnJlY3QgcGF0aCB0byBpMmMtY29udHJvbGxlciBz
Y2hlbWEKPj4gICAgICAgZHQtYmluZGluZ3M6IGkyYzogZ29vZ2xlLGNyb3MtZWMtaTJjLXR1bm5l
bDogY29ycmVjdCBwYXRoIHRvIGkyYy1jb250cm9sbGVyIHNjaGVtYQo+IAo+IG1lcmdlZCB0byBp
MmMvaTJjLWhvc3QtZml4ZXMKPiAKPj4gICAgICAgZHQtYmluZGluZ3M6IGkyYzogYXRtZWwsYXQ5
MXNhbTogZHJvcCB1bm5lZWRlZCBhZGRyZXNzL3NpemUtY2VsbHMKPj4gICAgICAgZHQtYmluZGlu
Z3M6IGkyYzogbnZpZGlhLHRlZ3JhMjA6IGRyb3AgdW5uZWVkZWQgYWRkcmVzcy9zaXplLWNlbGxz
Cj4+ICAgICAgIGR0LWJpbmRpbmdzOiBpMmM6IHNhbXN1bmcsczNjMjQxMDogZHJvcCB1bm5lZWRl
ZCBhZGRyZXNzL3NpemUtY2VsbHMKPj4gICAgICAgZHQtYmluZGluZ3M6IGkyYzogdGksb21hcDQ6
IHJlZmVyZW5jZSBpMmMtY29udHJvbGxlci55YW1sIHNjaGVtYQo+PiAgICAgICBkdC1iaW5kaW5n
czogaTJjOiBhZGp1c3QgaW5kZW50YXRpb24gaW4gRFRTIGV4YW1wbGUgdG8gY29kaW5nIHN0eWxl
Cj4gCj4gbWVyZ2VkIHRvIGkyYy9pMmMtaG9zdAoKU28geW91IGJyb2tlIHRoZSBiaW5kaW5nLi4u
IFdoeSBvcGVubHkgaWdub3JpbmcgbXkgZmlyc3Qgc2VudGVuY2U/CgpCZXN0IHJlZ2FyZHMsCkty
enlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
