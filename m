Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CBC928595
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 11:52:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEC02C78013;
	Fri,  5 Jul 2024 09:52:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71F52C78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 09:52:18 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-425624255f3so9113875e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Jul 2024 02:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720173138; x=1720777938;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vLdo5ZNT2z5DP6YaYiw/31TFoY7FNKHY9Kz30lffVbQ=;
 b=jlWARIHCIhoSMTRLZsa1TUApId9/4WtHtuwU1GWowbhaKOatdmHABZ/bi7b4nrHRKU
 unSmMblz2u8yobgVz0K7apIfRcJnM54Z4QTz+IZyldvVDEOyVwSMHdrsiD212w+gqUG9
 kcvo9WxQA2DvY3yznD4+RqKQdOhVDRvGsw1kV6X/TOF6hb47f5F/LrtsHqMOhlXWnNqc
 1Czqk1KZmqvlIvCee/J9iGgEzsnEO/5zseLxsrBWYVnWIzPD19gN9+vdVnKEsLpWEkAz
 xSd3mQhOn4ybIj3qEMZnmZkSDsh8Qdx4mmfxaKEp5F9YMPM1ZHo2+kabIBAkauJ4dcPG
 Z2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173138; x=1720777938;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vLdo5ZNT2z5DP6YaYiw/31TFoY7FNKHY9Kz30lffVbQ=;
 b=e1ZL2MElNyRbShGvkTdxeAN1guBS/P3tLhicEmBbJVdhbnhAIGvQ7M6AgejdHq9Oul
 Hfz515Q2EkKpdulPjt2PjSH6EDY/8tYujeTSHCz+TTm+eVXtzEQ+2w3wVj1Pul8wjV1b
 QHqkTZotofB0SVa3ZVLmUXTCrQj3hd6srCL4IRA4xESUEnPbpc9/POlAM/4yoSVANIl/
 jrPzKb0lMGmUkfwL+y/OPmNf3N93yqwsPVLBy6LpJohdM1mFjTfI7MmUWpgxOQQqH102
 8gY5L+N4ovulFy9dun5Cqr7kIPhfTZPbbhewoX5GnE0FwyUjoc8L6qKc5cFL3rbH6ypJ
 MlRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqdBJqa9l5AbnbE5WZvUDtgwwLeQqLdTOSJbAipIGc9zNwU9ZsLUqDhOcCaZ0I8JiV6X53l1cnjt3gteoT7LnAR2NmqWzVw27OoC2QhJwJWS4abvCEDP9R
X-Gm-Message-State: AOJu0YwKZogQhVVQFWrjP7ZV8aOK6TvJg/D7w0p59KOCONxUAYCslLEH
 FlRNILu5ypucnoqaOnSwXz9BoJseVLD8i8XPQmY8E0NeQApNhU78eyDp2PX0GSs=
X-Google-Smtp-Source: AGHT+IHWM39hkrT3BCL3vfzjlAmuka/milJOhLsZ9b2jVVuI/YsPmNdIWSCcp8XEI2B47DXGA4PYGQ==
X-Received: by 2002:a05:600c:6b17:b0:425:8cb6:5613 with SMTP id
 5b1f17b1804b1-4264b131627mr39440625e9.9.1720173138065; 
 Fri, 05 Jul 2024 02:52:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:52:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:32 +0200
MIME-Version: 1.0
Message-Id: <20240705-dt-bindings-thermal-allof-v1-13-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TI55Go07WmwiV/8/mxI1MAibWeb5pb00J67OAZMLAWU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IvuqTqmG0TjJXqzakOUBfK+8z1WVpU62RhN
 HP4ZVcil2aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCLwAKCRDBN2bmhouD
 12L/D/4y67ykiZYFPvIg14LqdydRnQLMNtimrHyOjmnNi6ZkyZiXpMFSLaXCQlRWbqdUt47gam/
 4IjATok/3/SvLkbo2IV0QYXPlGhU1Zp5w/Up82uz74ydZ/Ckw5UK3r7ibxFd6hgrhlGdRtC60vi
 zrTtVOd2njeN40jqyTrNk7hNpBrkllmAX5HdnlDzw2ltUDqIdTSVqMP7KZ7nOcnQ1r70BtEDDCK
 WT9bD9DDbW7kI3Tn0/6r3i9hKfvijriVO0pIWZss/FVZ2zGLp0Qol6i1Ice+xhjO1RlphzZweMS
 qBshFHGYvCQ0nWrECvcUyeIo6lQuaYEZ+pyGu9Z9VRUhsD9TiqUJ4t/0Z269NCKgCvPKB7aZbU0
 TuWY9t8ySj2PLQAtEGegmVToTgHipxADRTx58p2172TdOUAPnPmm3j6lcYmRj5lTZ+lBWkLyL1l
 GEwqIjG0SWSB2TNm8rhntdoW2Imt3Xf2svnNtsCJn2r9w87cP9sdIsO1MXlq0ICfZ0NfznqHkMH
 TP+Nt3lzLEX0KNhP+Xw0Ulr+J7Nz6f7gOL8jbQJfxO5g21KrBeBqPpwhZMjPGWiVXaNi2g0lKu6
 8wTibgLtmpGTEd5TJE+oJlglalDSoEYDgOF/403ECyk+0A5xuSGZtG+9AtTUrJ0v4dodsULFoU3
 Mn5RhWP5AGLuDsg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND 13/22] dt-bindings: thermal: rcar-gen3:
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

RGV2aWNlIGlzIGEgdGhlcm1hbCBzZW5zb3IgYW5kIGl0IHJlcXVpcmVzICcjdGhlcm1hbC1zZW5z
b3ItY2VsbHMnLCBzbwpyZWZlcmVuY2UgdGhlIHRoZXJtYWwtc2Vuc29yLnlhbWwgdG8gc2ltcGxp
ZnkgaXQgYW5kIGJyaW5nIHRoZQpjb21tb24gZGVmaW5pdGlvbiBvZiAnI3RoZXJtYWwtc2Vuc29y
LWNlbGxzJyBwcm9wZXJ0eS4KClJldmlld2VkLWJ5OiBOaWtsYXMgU8O2ZGVybHVuZCA8bmlrbGFz
LnNvZGVybHVuZCtyZW5lc2FzQHJhZ25hdGVjaC5zZT4KQWNrZWQtYnk6IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+ClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3ps
b3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KLS0tCiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1hbC9yY2FyLWdlbjMtdGhlcm1hbC55YW1sIHwgNSAr
KystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGhlcm1hbC9yY2Fy
LWdlbjMtdGhlcm1hbC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Ro
ZXJtYWwvcmNhci1nZW4zLXRoZXJtYWwueWFtbAppbmRleCA2YTgxY2I2ZTExYmMuLmQ5MmU4ODJj
OWU4ZCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJt
YWwvcmNhci1nZW4zLXRoZXJtYWwueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdGhlcm1hbC9yY2FyLWdlbjMtdGhlcm1hbC55YW1sCkBAIC0xNSw2ICsxNSw4IEBA
IGRlc2NyaXB0aW9uOgogbWFpbnRhaW5lcnM6CiAgIC0gTmlrbGFzIFPDtmRlcmx1bmQgPG5pa2xh
cy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPgogCiskcmVmOiB0aGVybWFsLXNlbnNvci55YW1sIwor
CiBwcm9wZXJ0aWVzOgogICBjb21wYXRpYmxlOgogICAgIGVudW06CkBAIC01Nyw3ICs1OSw2IEBA
IHJlcXVpcmVkOgogICAtIGNsb2NrcwogICAtIHBvd2VyLWRvbWFpbnMKICAgLSByZXNldHMKLSAg
LSAiI3RoZXJtYWwtc2Vuc29yLWNlbGxzIgogCiBpZjoKICAgcHJvcGVydGllczoKQEAgLTk2LDcg
Kzk3LDcgQEAgZWxzZToKICAgICByZXF1aXJlZDoKICAgICAgIC0gaW50ZXJydXB0cwogCi1hZGRp
dGlvbmFsUHJvcGVydGllczogZmFsc2UKK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKIAog
ZXhhbXBsZXM6CiAgIC0gfAoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
