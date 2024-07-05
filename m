Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCD29287AC
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 13:18:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67ECBC71282;
	Fri,  5 Jul 2024 11:18:37 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8893FC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 11:18:29 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ee910d6aaeso15095581fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2024 04:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720178309; x=1720783109;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OgGdrMJAOOlmaDA5n6UZ/NcHyTcSq/fRMMLBh3RpPPA=;
 b=MMcDaw9DHvZhVj8rFeBW7BWkeKh1oMck0KDWEf3bFirc+NK/gk+jCuQZgP67ghe3JX
 FZhYFHF4TdK5+iqcS/NP8Pj9WgtlXVoHfhPPmAnzOjBtkjHEPRhhx0P0N/CZVCiQ59zX
 pLrJL01kuz0vuWO49fpU5lOIr9BWHubD+shtckwI7nayxIqQTGR1XYXsD7RAdlze21vP
 kS/XD5dGWsjm4rt7i5ZTILs6HvJiHcpRh5e2jAX656pKYwoR+KKpi84mliUfnNX0gtcw
 DjtwgBeb9kn6w6vV/HUrXiyII5LeXUFw6rhTtXf4moRRleQ/v0HOfyn+smHih8LmEIXj
 GkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720178309; x=1720783109;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OgGdrMJAOOlmaDA5n6UZ/NcHyTcSq/fRMMLBh3RpPPA=;
 b=kujocT4nZNmJsuO2YwDEW+hQtOyG/PgI+MTK50GzxVlFN8NJrTawsdbtbkKoG8Sx2Q
 00MrVquO3CYpwdrhR1GL0NIXegXficTzqvx2hnHMXb9EZwd/uaMPMkSlQNpWcOr+MLtN
 snJLp3L3GnsDTDoquA2MnN5SpwzY8x/NQPVjmos/TW9kNK43ZOP1ljdklU8O8CiUAgkT
 Vsatvjfct2TjeLNiwbkWdBoZGRQXdkPjnpxxPNtwgObLwm7URrZnOnHasVHDnLzoD0eY
 voTV2Di7hi1RqWGtZrSF0VLaScS/2AtSPMJ96JKJLWhGjAlv37khF6nTQTixZv3OQUO6
 8RjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCX9U5jOq3L/yUZ/TmI0cEgpCyrRScToC7/porZKaue8t7N3Gzb7vG/K/XtBF1T5VOC6qJpUdvnN/Fk1H8uZTb5Boq5nJ9PseMO7KIEoJ5xb7TguC4QgZ7
X-Gm-Message-State: AOJu0Yzha/GEmoJC780LjwmNaJSrKoD754Lm6LWlMMjRzWff5XM5z80O
 FSb+hlU9cQCDM0mGaB3fxZ3qMYjKuPXm0Lq47FEN6ljI3iP3QhmeTwoKgIdGqG8=
X-Google-Smtp-Source: AGHT+IHyMkgn3/gFNE4gv4OJO59bQCoHWgHlPXJAezaplNmRkJ1y1keb/pz2mmb4jwElkz5448BGKA==
X-Received: by 2002:a2e:2e06:0:b0:2ee:8815:8b28 with SMTP id
 38308e7fff4ca-2ee8edd3ec5mr24871001fa.33.1720178308668; 
 Fri, 05 Jul 2024 04:18:28 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0?
 ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3678fe13ef4sm7369352f8f.117.2024.07.05.04.18.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jul 2024 04:18:28 -0700 (PDT)
Message-ID: <2aa71d0f-6e4a-4056-9deb-a46526b423a9@linaro.org>
Date: Fri, 5 Jul 2024 13:18:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Fabio Estevam <festevam@gmail.com>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
 Amit Kucheria <amitk@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Linux-stm32] [PATCH RESEND 00/22] dt-bindings: thermal: few
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMDUvMDcvMjAyNCAxMTo1MSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBIaSwKPiAK
PiBSZXNlbmRpbmcgKHdpdGggYWRkZWQgdGFncykgYmVjYXVzZSBwYXRjaHNldCB3YXMgc3RpbGwg
bm90IGFwcGxpZWQuCj4gRGFuaWVsLCBjYW4geW91IHBpY2sgaXQgdXA/CgpZZXMKCj4gRmV3IGNs
ZWFudXBzIHdpdG91dCBwcmFjdGljYWwgaW1wYWN0LCBleGNlcHQgbWF5YmUgdGhlIEFtbG9naWMg
c2NoZW1hCj4gKGJyaW5naW5nIHJlcXVpcmVkIGNlbGxzKS4KPiAKPiBMaW5rIHRvIHYxOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNjE0LWR0LWJpbmRpbmdzLXRoZXJtYWwtYWxsb2Yt
djEtMC0zMGIyNWE2YWUyNGVAbGluYXJvLm9yZwo+IAo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0
b2YKPiAKPiAtLS0KPiBLcnp5c3p0b2YgS296bG93c2tpICgyMik6Cj4gICAgICAgIGR0LWJpbmRp
bmdzOiB0aGVybWFsOiBzYW1zdW5nLGV4eW5vczogc3BlY2lmeSBjZWxscwo+ICAgICAgICBkdC1i
aW5kaW5nczogdGhlcm1hbDogYW1sb2dpYzogcmVmZXJlbmNlIHRoZXJtYWwtc2Vuc29yIHNjaGVt
YQo+ICAgICAgICBkdC1iaW5kaW5nczogdGhlcm1hbDogYWxsd2lubmVyLHN1bjhpLWE4M3QtdGhz
OiByZWZlcmVuY2UgdGhlcm1hbC1zZW5zb3Igc2NoZW1hCj4gICAgICAgIGR0LWJpbmRpbmdzOiB0
aGVybWFsOiBicmNtLGF2cy1ybzogcmVmZXJlbmNlIHRoZXJtYWwtc2Vuc29yIHNjaGVtYQo+ICAg
ICAgICBkdC1iaW5kaW5nczogdGhlcm1hbDogZ2VuZXJpYy1hZGM6IHJlZmVyZW5jZSB0aGVybWFs
LXNlbnNvciBzY2hlbWEKPiAgICAgICAgZHQtYmluZGluZ3M6IHRoZXJtYWw6IGlteDhtbTogcmVm
ZXJlbmNlIHRoZXJtYWwtc2Vuc29yIHNjaGVtYQo+ICAgICAgICBkdC1iaW5kaW5nczogdGhlcm1h
bDogbnZpZGlhLHRlZ3JhMTg2LWJwbXA6IHJlZmVyZW5jZSB0aGVybWFsLXNlbnNvciBzY2hlbWEK
PiAgICAgICAgZHQtYmluZGluZ3M6IHRoZXJtYWw6IG52aWRpYSx0ZWdyYTMwLXRzZW5zb3I6IHJl
ZmVyZW5jZSB0aGVybWFsLXNlbnNvciBzY2hlbWEKPiAgICAgICAgZHQtYmluZGluZ3M6IHRoZXJt
YWw6IHFjb20tc3BtaS1hZGMtdG0taGM6IHJlZmVyZW5jZSB0aGVybWFsLXNlbnNvciBzY2hlbWEK
PiAgICAgICAgZHQtYmluZGluZ3M6IHRoZXJtYWw6IHFjb20tc3BtaS1hZGMtdG01OiByZWZlcmVu
Y2UgdGhlcm1hbC1zZW5zb3Igc2NoZW1hCj4gICAgICAgIGR0LWJpbmRpbmdzOiB0aGVybWFsOiBx
Y29tLXRzZW5zOiByZWZlcmVuY2UgdGhlcm1hbC1zZW5zb3Igc2NoZW1hCj4gICAgICAgIGR0LWJp
bmRpbmdzOiB0aGVybWFsOiBxb3JpcTogcmVmZXJlbmNlIHRoZXJtYWwtc2Vuc29yIHNjaGVtYQo+
ICAgICAgICBkdC1iaW5kaW5nczogdGhlcm1hbDogcmNhci1nZW4zOiByZWZlcmVuY2UgdGhlcm1h
bC1zZW5zb3Igc2NoZW1hCj4gICAgICAgIGR0LWJpbmRpbmdzOiB0aGVybWFsOiByb2NrY2hpcDog
cmVmZXJlbmNlIHRoZXJtYWwtc2Vuc29yIHNjaGVtYQo+ICAgICAgICBkdC1iaW5kaW5nczogdGhl
cm1hbDogcnpnMmw6IHJlZmVyZW5jZSB0aGVybWFsLXNlbnNvciBzY2hlbWEKPiAgICAgICAgZHQt
YmluZGluZ3M6IHRoZXJtYWw6IHNvY2lvbmV4dCx1bmlwaGllcjogcmVmZXJlbmNlIHRoZXJtYWwt
c2Vuc29yIHNjaGVtYQo+ICAgICAgICBkdC1iaW5kaW5nczogdGhlcm1hbDogc3ByZDogcmVmZXJl
bmNlIHRoZXJtYWwtc2Vuc29yIHNjaGVtYQo+ICAgICAgICBkdC1iaW5kaW5nczogdGhlcm1hbDog
c3Qsc3RtMzI6IHJlZmVyZW5jZSB0aGVybWFsLXNlbnNvciBzY2hlbWEKPiAgICAgICAgZHQtYmlu
ZGluZ3M6IHRoZXJtYWw6IHRpLGFtNjU0OiByZWZlcmVuY2UgdGhlcm1hbC1zZW5zb3Igc2NoZW1h
Cj4gICAgICAgIGR0LWJpbmRpbmdzOiB0aGVybWFsOiB0aSxqNzJ4eDogcmVmZXJlbmNlIHRoZXJt
YWwtc2Vuc29yIHNjaGVtYQo+ICAgICAgICBkdC1iaW5kaW5nczogdGhlcm1hbDogc2ltcGxpZnkg
ZmV3IGJpbmRpbmdzCj4gICAgICAgIGR0LWJpbmRpbmdzOiB0aGVybWFsOiBjbGVhbnVwIGV4YW1w
bGVzIGluZGVudGF0aW9uCj4gCj4gICAuLi4vYmluZGluZ3MvdGhlcm1hbC9hbGx3aW5uZXIsc3Vu
OGktYTgzdC10aHMueWFtbCB8ICA2ICstCj4gICAuLi4vYmluZGluZ3MvdGhlcm1hbC9hbWxvZ2lj
LHRoZXJtYWwueWFtbCAgICAgICAgICB8IDIyICsrLS0tCj4gICAuLi4vYmluZGluZ3MvdGhlcm1h
bC9icmNtLGF2cy1yby10aGVybWFsLnlhbWwgICAgICB8IDIyICsrLS0tCj4gICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy90aGVybWFsL2JyY20sYXZzLXRtb24ueWFtbCB8IDE3ICsrLS0KPiAgIC4u
Li9iaW5kaW5ncy90aGVybWFsL2JyY20sYmNtMjgzNS10aGVybWFsLnlhbWwgICAgIHwgIDEgLQo+
ICAgLi4uL2JpbmRpbmdzL3RoZXJtYWwvZnNsLHNjdS10aGVybWFsLnlhbWwgICAgICAgICAgfCAg
MSAtCj4gICAuLi4vYmluZGluZ3MvdGhlcm1hbC9nZW5lcmljLWFkYy10aGVybWFsLnlhbWwgICAg
ICB8ICA1ICstCj4gICAuLi4vYmluZGluZ3MvdGhlcm1hbC9pbXg4bW0tdGhlcm1hbC55YW1sICAg
ICAgICAgICB8ICA1ICstCj4gICAuLi4vYmluZGluZ3MvdGhlcm1hbC9sb29uZ3NvbixsczJrLXRo
ZXJtYWwueWFtbCAgICB8ICAxIC0KPiAgIC4uLi9iaW5kaW5ncy90aGVybWFsL21lZGlhdGVrLGx2
dHMtdGhlcm1hbC55YW1sICAgIHwgIDEgLQo+ICAgLi4uL2JpbmRpbmdzL3RoZXJtYWwvbnZpZGlh
LHRlZ3JhMTI0LXNvY3RoZXJtLnlhbWwgfCAgMSAtCj4gICAuLi4vdGhlcm1hbC9udmlkaWEsdGVn
cmExODYtYnBtcC10aGVybWFsLnlhbWwgICAgICB8IDEyICstLQo+ICAgLi4uL2JpbmRpbmdzL3Ro
ZXJtYWwvbnZpZGlhLHRlZ3JhMzAtdHNlbnNvci55YW1sICAgfCAgOSArLQo+ICAgLi4uL2JpbmRp
bmdzL3RoZXJtYWwvcWNvbSxzcG1pLXRlbXAtYWxhcm0ueWFtbCAgICAgfCAgMSAtCj4gICAuLi4v
YmluZGluZ3MvdGhlcm1hbC9xY29tLXNwbWktYWRjLXRtLWhjLnlhbWwgICAgICB8ICA4ICstCj4g
ICAuLi4vYmluZGluZ3MvdGhlcm1hbC9xY29tLXNwbWktYWRjLXRtNS55YW1sICAgICAgICB8ICA4
ICstCj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL3Fjb20tdHNlbnMueWFtbCAg
ICB8IDk2ICsrKysrKysrKystLS0tLS0tLS0tLS0KPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3RoZXJtYWwvcW9yaXEtdGhlcm1hbC55YW1sIHwgIDUgKy0KPiAgIC4uLi9iaW5kaW5ncy90aGVy
bWFsL3JjYXItZ2VuMy10aGVybWFsLnlhbWwgICAgICAgIHwgNjkgKysrKysrKystLS0tLS0tLQo+
ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1hbC9yY2FyLXRoZXJtYWwueWFtbCAgfCA2
MCArKysrKysrLS0tLS0tLQo+ICAgLi4uL2JpbmRpbmdzL3RoZXJtYWwvcm9ja2NoaXAtdGhlcm1h
bC55YW1sICAgICAgICAgfCAgNSArLQo+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1h
bC9yemcybC10aGVybWFsLnlhbWwgfCA0MSArKysrLS0tLS0KPiAgIC4uLi9iaW5kaW5ncy90aGVy
bWFsL3NhbXN1bmcsZXh5bm9zLXRoZXJtYWwueWFtbCAgIHwgIDMgKy0KPiAgIC4uLi90aGVybWFs
L3NvY2lvbmV4dCx1bmlwaGllci10aGVybWFsLnlhbWwgICAgICAgIHwgIDUgKy0KPiAgIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvc3ByZC10aGVybWFsLnlhbWwgIHwgNDcgKysrKyst
LS0tLS0KPiAgIC4uLi9iaW5kaW5ncy90aGVybWFsL3N0LHN0bTMyLXRoZXJtYWwueWFtbCAgICAg
ICAgIHwgIDUgKy0KPiAgIC4uLi9iaW5kaW5ncy90aGVybWFsL3RpLGFtNjU0LXRoZXJtYWwueWFt
bCAgICAgICAgIHwgMTUgKystLQo+ICAgLi4uL2JpbmRpbmdzL3RoZXJtYWwvdGksajcyeHgtdGhl
cm1hbC55YW1sICAgICAgICAgfCAgNSArLQo+ICAgMjggZmlsZXMgY2hhbmdlZCwgMjMwIGluc2Vy
dGlvbnMoKyksIDI0NiBkZWxldGlvbnMoLSkKPiAtLS0KPiBiYXNlLWNvbW1pdDogMGI1OGUxMDgw
NDJiMGVkMjhhNzFjZDdlZGY1MTc1OTk5OTU1YjIzMwo+IGNoYW5nZS1pZDogMjAyNDA2MTQtZHQt
YmluZGluZ3MtdGhlcm1hbC1hbGxvZi00MDFjNTBlNjFlZjIKPiAKPiBCZXN0IHJlZ2FyZHMsCgot
LSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNv
ZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29r
LmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5h
cm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxv
ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
