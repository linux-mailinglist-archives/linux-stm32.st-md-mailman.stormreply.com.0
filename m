Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F7790A8D5
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 10:56:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F5B1C6B45B;
	Mon, 17 Jun 2024 08:56:34 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEC7CC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 02:36:35 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-254925e6472so447591fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Jun 2024 19:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718591794; x=1719196594;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3S2YurUrl5MC+fkMuKFY0ClzSCLEfz1Oc40ER8vtAUk=;
 b=ffqkMj1xA0Tmw9FFXmxANPdNnwoEtnQ1b79qWXopvqERggIpMfmgRcUc5TxnOUS2Gp
 W4Pv+LmJnjVJvIfM1Ndb7svWqSOEUzU+wX2D/qazeEe5D/pyPis6x4T4eBgOlsHarv7S
 Sgl5PPNk+E6r0cmeJosn9F7R/fhl8wE4ufNHCiLRno+8DjuUcErtNX3QvOsfJ6AZo1d6
 Px/Vg38bTm1tJFktVh1cU87MsEGQepKQFCXulX7wJOQX8X/kN3VnjaEdn84BHNY68nY+
 gNZkyZ4zFPH3k1W/kudym0anFbiy5Rb/wPrCcRhVFbvMmYxhGWJ0tY3JNbMG/zldkGqU
 26sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718591794; x=1719196594;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3S2YurUrl5MC+fkMuKFY0ClzSCLEfz1Oc40ER8vtAUk=;
 b=aOh+2EBuJfZ5NBbt0kFG0iCB1Nty03v7U1R557bCdmzvx0M0PrV/m9b/51BQiXeMxn
 82xSX3WrGtz/GrUU5XlTXrCxeTQSWQGFojSubRaQew5P6u8rsrv8Q02jHRg1VLKKaA+o
 QuxTd5itGwLZVwEph6zxZmaTh3MLIc9cYWF1IrbN+J+XUuXTIIFxioXiFz9YWwpahgZL
 SwFxGK8FYbQEFWIpaEyKTFIc+pME3nvtz0vLZo8lK/ruo05lK/nFfVoXq0Ss99swgZd6
 WIohcsue5GFpZGwEdtQNlHKfqmG6IHhq/H47VqxGr70GOkarvcb37pvdLqyOY+N8/k//
 PQrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaNHqunEUIEJCDc9IKx6JzYhWi1RoAvG9sV6NQkbp1PnJH7n8rcAu3pCLeYhDhQBeK/LYdkB08I/aaONoPlt3R54H3aIUH1uruDHDw5sxCncJwWDIUAMQt
X-Gm-Message-State: AOJu0YypAFJmSb7BVFFBQtRkltZG8exWoVGvYDaip6DPmG+skDoSRArG
 YrGZLeYrr1D8/vNd1Lapm6hTSmRt7WmO8RmfPvVgksR6JqdSqgmxfgpmJCuZgAdp0NsYfOhrNzr
 42J9vh84mjUZw9OvfT2VeXXRXOHE=
X-Google-Smtp-Source: AGHT+IGltFa0bQ5GCz9R8Qfp8q4AWMyO+O31iG05ayKCR1g5p5BB0jiP/wIlvjmzI8GEc+sBuDPZkWfe/0K++X8dom4=
X-Received: by 2002:a05:6870:469f:b0:254:d417:351f with SMTP id
 586e51a60fabf-258429511admr9266807fac.1.1718591794255; Sun, 16 Jun 2024
 19:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-3-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-3-30b25a6ae24e@linaro.org>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sun, 16 Jun 2024 19:36:08 -0700
Message-ID: <CA+E=qVdpw5dMSdZiBkX5i6y18vHzfG2JnBSmd2Rq=y4kkgZLQw@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Mon, 17 Jun 2024 08:56:33 +0000
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Amit Kucheria <amitk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Anson Huang <Anson.Huang@nxp.com>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 zhanghongchen <zhanghongchen@loongson.cn>,
 Pascal Paillet <p.paillet@foss.st.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Keerthy <j-keerthy@ti.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH 03/22] dt-bindings: thermal: allwinner,
 sun8i-a83t-ths: reference thermal-sensor schema
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

T24gRnJpLCBKdW4gMTQsIDIwMjQgYXQgMjo0NuKAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBEZXZpY2UgaXMgYSB0aGVy
bWFsIHNlbnNvciBhbmQgaXQgcmVxdWlyZXMgJyN0aGVybWFsLXNlbnNvci1jZWxscycsIHNvCj4g
cmVmZXJlbmNlIHRoZSB0aGVybWFsLXNlbnNvci55YW1sIHRvIHNpbXBsaWZ5IGl0IGFuZCBicmlu
ZyB0aGUKPiBjb21tb24gZGVmaW5pdGlvbiBvZiAnI3RoZXJtYWwtc2Vuc29yLWNlbGxzJyBwcm9w
ZXJ0eS4KPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IFZhc2lseSBLaG9ydXpoaWNrIDxhbmFy
c291bEBnbWFpbC5jb20+Cgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFs
L2FsbHdpbm5lcixzdW44aS1hODN0LXRocy55YW1sICAgICAgIHwgNiArKystLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1hbC9hbGx3aW5uZXIsc3Vu
OGktYTgzdC10aHMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVy
bWFsL2FsbHdpbm5lcixzdW44aS1hODN0LXRocy55YW1sCj4gaW5kZXggNmIzYWVhNmQ3M2IwLi5k
YWQ4ZGU5MDA0OTUgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3RoZXJtYWwvYWxsd2lubmVyLHN1bjhpLWE4M3QtdGhzLnlhbWwKPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1hbC9hbGx3aW5uZXIsc3VuOGktYTgzdC10
aHMueWFtbAo+IEBAIC0xMCw2ICsxMCw4IEBAIG1haW50YWluZXJzOgo+ICAgIC0gVmFzaWx5IEto
b3J1emhpY2sgPGFuYXJzb3VsQGdtYWlsLmNvbT4KPiAgICAtIFlhbmd0YW8gTGkgPHRpbnkud2lu
ZHp6QGdtYWlsLmNvbT4KPgo+ICskcmVmOiB0aGVybWFsLXNlbnNvci55YW1sIwo+ICsKPiAgcHJv
cGVydGllczoKPiAgICBjb21wYXRpYmxlOgo+ICAgICAgZW51bToKPiBAQCAtNTUsNyArNTcsNiBA
QCBwcm9wZXJ0aWVzOgo+ICAgICAgbWF4SXRlbXM6IDEKPiAgICAgIGRlc2NyaXB0aW9uOiBwaGFu
ZGxlIHRvIGRldmljZSBjb250cm9sbGluZyB0ZW1wZXJhdGUgb2Zmc2V0IFNZU19DRkcgcmVnaXN0
ZXIKPgo+IC0gICMgU2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFs
L3RoZXJtYWwtc2Vuc29yLnlhbWwgZm9yIGRldGFpbHMKPiAgICAiI3RoZXJtYWwtc2Vuc29yLWNl
bGxzIjoKPiAgICAgIGVudW06Cj4gICAgICAgIC0gMAo+IEBAIC0xMzUsOSArMTM2LDggQEAgcmVx
dWlyZWQ6Cj4gICAgLSBjb21wYXRpYmxlCj4gICAgLSByZWcKPiAgICAtIGludGVycnVwdHMKPiAt
ICAtICcjdGhlcm1hbC1zZW5zb3ItY2VsbHMnCj4KPiAtYWRkaXRpb25hbFByb3BlcnRpZXM6IGZh
bHNlCj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPgo+ICBleGFtcGxlczoKPiAgICAt
IHwKPgo+IC0tCj4gMi40My4wCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
