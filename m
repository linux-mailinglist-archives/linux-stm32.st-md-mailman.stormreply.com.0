Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB8E927A80
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2024 17:51:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 785FAC7129D;
	Thu,  4 Jul 2024 15:51:31 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AA9FC6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 20:32:05 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42562a984d3so41298945e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jul 2024 13:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720038725; x=1720643525;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=soNpQ58Fz2hm7V5JZ9ZEYAVAikWNhIPt2irm4De+WfA=;
 b=ePfUTKASEj/PoM50vNmfWAb82dsrGO2KtWLMyCLBEusl0HC9pRIFmtZIH0wPWv4102
 xyZfvdPJJ9d5bSbNWjwLSvfE/OnZOB5f9Wn5W5H5g1k9GpoMiFjtGjau63Pow5erT2qH
 kOCZhiky3XjyzDUGbwZaf8+k1Y/9mW3Why6Py1v0LLouRF2yrHbXVMYHzlDrb8S9dB1Y
 BaIpXMMiUk8c29IfuQJGLpnOC6lJMTOeoWURZY+VfDZin7OvS6nt9I3uhwbBTUtGgmbB
 b1KvvLzHS5is1NCF8Jh0kTu6ns/vomi8vM7vXaAgu2DUrNamGejedykKSEJnTeNlhjOS
 fSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720038725; x=1720643525;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=soNpQ58Fz2hm7V5JZ9ZEYAVAikWNhIPt2irm4De+WfA=;
 b=R7k1uYqXj6W5Hmnw9vxO/B5Alxl1xSrqv/DMgNRANMdxRd3XAhp9Q0N4+wYFN0kBUl
 JMp84JkSx+7UpnIZP80hMXJRZdOnJiNq2yb+Jg3X0K4bFeWzcW6CowVQ/aLQjX0vmxDK
 f7PYovVW7mMR01js5wh96FW4lvY3yPlytIvsVttJ0xGxOyc1SNFb6WkQCyKCfVsPnZv8
 Fcx9O9qHTfQh/YTf4pwBq+FoWKD82vJw8mXtnCoBHs65jL7OAk4D77uaPX7YF9+FaijU
 OPL04et6lZ5Rjiq4k/EnvJSTKGwmQ1tuftrpSru1WkXZnRj97oS8vps97aSy2jQSPocf
 Fw/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU26q8BSR9yXuslKaXPMxIBqktGVxyEX3gC7BK0t1VQ6e7NWM9qbrtkyA3PrltLRUbgHJ8SJ4JeLaix2JumvxR5/1xvYkQM7SpcMZMlY2m0mJuSTtP46hg1
X-Gm-Message-State: AOJu0YzYxoGjYe0ZXRHtlmle6xFG0Yr5xFmrNBGdeOyFJ8z5UBYhJHAk
 itGf7vMfjOsihH4VFSQ8tVJt6mX7LHI8IgyBlWVpO2Zs1o3IxEu2bzJBXYm45rE=
X-Google-Smtp-Source: AGHT+IEQBwm7OCqJ0C1+sLPedSZoAnvYatAaOS5AYpVWYgjgIYzIeidjLFDv/zxc1QKpmoxHnzRP3w==
X-Received: by 2002:a05:600c:4f52:b0:424:aa64:e9b3 with SMTP id
 5b1f17b1804b1-4257a02b701mr80619975e9.29.1720038724401; 
 Wed, 03 Jul 2024 13:32:04 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:10a5:e010:6751:db24:f67e:fa2e?
 ([2a05:6e02:10a5:e010:6751:db24:f67e:fa2e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-426487c1c66sm1528905e9.0.2024.07.03.13.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 13:32:03 -0700 (PDT)
Message-ID: <922ef023-4375-4a89-af1e-bd9bcf90f750@baylibre.com>
Date: Wed, 3 Jul 2024 22:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 zhanghongchen <zhanghongchen@loongson.cn>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-2-30b25a6ae24e@linaro.org>
Content-Language: en-US
From: Guillaume LA ROQUE <glaroque@baylibre.com>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-2-30b25a6ae24e@linaro.org>
X-Mailman-Approved-At: Thu, 04 Jul 2024 15:51:31 +0000
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/22] dt-bindings: thermal: amlogic:
 reference thermal-sensor schema
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

TGUgMTQvMDYvMjAyNCDDoCAxMTo0NiwgS3J6eXN6dG9mIEtvemxvd3NraSBhIMOpY3JpdMKgOgo+
IERldmljZSBpcyBhIHRoZXJtYWwgc2Vuc29yIGFuZCBhbGwgaW4tdHJlZSBEVFMgcHJvdmlkZQo+
ICcjdGhlcm1hbC1zZW5zb3ItY2VsbHMnLCBzbyByZWZlcmVuY2UgdGhlIHRoZXJtYWwtc2Vuc29y
LnlhbWwgdG8KPiBzaW1wbGlmeSBpdCwgYnJpbmcgdGhlIGNvbW1vbiBkZWZpbml0aW9uIG9mICcj
dGhlcm1hbC1zZW5zb3ItY2VsbHMnCj4gcHJvcGVydHkgYW5kIHJlcXVpcmUgaXQuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFy
by5vcmc+Cj4gLS0tCj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1h
bC9hbWxvZ2ljLHRoZXJtYWwueWFtbCB8IDQgKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL2FtbG9naWMsdGhlcm1hbC55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvYW1sb2dpYyx0aGVybWFsLnlhbWwK
PiBpbmRleCAwMWZjY2RmYzQxNzguLmU1MmZjNDBlMjE1ZCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1hbC9hbWxvZ2ljLHRoZXJtYWwueWFtbAo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL2FtbG9naWMs
dGhlcm1hbC55YW1sCj4gQEAgLTExLDYgKzExLDggQEAgbWFpbnRhaW5lcnM6Cj4gICAKPiAgIGRl
c2NyaXB0aW9uOiBCaW5kaW5nIGZvciBBbWxvZ2ljIFRoZXJtYWwKPiAgIAo+ICskcmVmOiB0aGVy
bWFsLXNlbnNvci55YW1sIwo+ICsKPiAgIHByb3BlcnRpZXM6Cj4gICAgIGNvbXBhdGlibGU6Cj4g
ICAgICAgb25lT2Y6Cj4gQEAgLTQ0LDcgKzQ2LDcgQEAgcmVxdWlyZWQ6Cj4gICAgIC0gY2xvY2tz
Cj4gICAgIC0gYW1sb2dpYyxhby1zZWN1cmUKPiAgIAo+IC1hZGRpdGlvbmFsUHJvcGVydGllczog
ZmFsc2UKPiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+ICAgCj4gICBleGFtcGxlczoK
PiAgICAgLSB8Cj4KUmV2aWV3ZWQtYnk6IEd1aWxsYXVtZSBMQSBST1FVRSA8Z2xhcm9xdWVAYmF5
bGlicmUuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
