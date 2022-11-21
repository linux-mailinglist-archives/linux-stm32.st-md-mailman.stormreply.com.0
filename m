Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCD9631AA0
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 08:49:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90004C65E60;
	Mon, 21 Nov 2022 07:49:14 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BCE1C65052
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 01:55:15 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id ud5so25363570ejc.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Nov 2022 17:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ceFmBEehHLI+ITdAPlxa6x5ctDzSMQAGOAJN5msaS7Y=;
 b=ZuKr/0Zc29q+ZYF7gRE55Vbwj+z/hYLrFwmhPnFhQxvbUtoIUGYXO/jAAegCGo8Z2U
 At24z1lPg2jroJx0YN6UU0W3Nas9o9tdrUDN4tKP/drF/gavXWF3Q1ij/ACjI+yd1v59
 kGxTJh0yngyQ6tSXBMvPGXE79aLk03MEq58v5hbFoNW+Q6PY0fSJhls4R4pNAkS/7k29
 jJ7/sANZO9TvVJ9FfIefpTFUKskoS28yzqWuU0po2+JPUznsHDfwJe4TU3BTx8Q1y5mX
 u8+I7iyMtB07mcONXkN215YOmN14qLYw/rLzX16158JSw0nwu+zb/+Rp/Fbuw3UiDw0h
 3ShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ceFmBEehHLI+ITdAPlxa6x5ctDzSMQAGOAJN5msaS7Y=;
 b=WLkziJWqbwfLOsQEFMK7CTAPwCj+Rni0i7ln5eOyAb9hCDnUEHIOPIrBkZpfCwVX2F
 EB5T+5GTHqqcIaCtXYcGOwuqN58GXLjQtB+04/DNXQ5RCCAkEfM4dqFQGG7BlnHvI6xB
 ueodX8nzMSgUPfIooXwFQavvP22olsG/sHUjysqM7VssErE+bU5ukolk42EnpZJTPATL
 oHQ8mQ7LAf5K+jYbLEuUpt7rL+0VYgPxs6bvhX2wiY4P64zO2JpzLIeBPaf6cTH9g6pC
 p0EUqtQzpx9URuq3AewC805gZKcd3CALj1egpBTwL+GZeyLQL4xNY/JBT0ZNtP4XWZ0g
 L+4w==
X-Gm-Message-State: ANoB5pmQ6y2Bhp3JMLyP7AqTl5ohcJURP0Ki7+308RLUq3gGJXgrOD2n
 5vnVAgK6YHH8FLyg+r4+RmvcRO0COcK8ObAM
X-Google-Smtp-Source: AA0mqf6GyYZ2MDoz5DmOIUHPUfsFhTnyAk1GDDWwK4E8E+3sEktkUs6XwVC5a+TccSYHOAq2BHzuQA==
X-Received: by 2002:a17:906:1498:b0:73f:40a9:62ff with SMTP id
 x24-20020a170906149800b0073f40a962ffmr13976603ejc.678.1668995714821; 
 Sun, 20 Nov 2022 17:55:14 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 17:55:14 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Mon, 21 Nov 2022 02:54:51 +0100
Message-Id: <20221121015451.2471196-10-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Nov 2022 07:49:11 +0000
Cc: khilman@baylibre.com, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 9/9] dt-bindings: pinctrl: st,
	stm32: Remove the pins-are-numbered property
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

UmVtb3ZlIHRoZSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eSBmcm9tIHRoZSBTVE0zMiBEZXZp
Y2VUcmVlIHNjaGVtYQoKU2lnbmVkLW9mZi1ieTogQmVybmhhcmQgUm9zZW5rcsOkbnplciA8YmVy
b0BiYXlsaWJyZS5jb20+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9zdCxz
dG0zMi1waW5jdHJsLnlhbWwgICAgICAgICAgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BpbmN0cmwvc3Qsc3RtMzItcGluY3RybC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BpbmN0cmwvc3Qsc3RtMzItcGluY3RybC55YW1sCmluZGV4IDdjMDhkMzYyMTMy
YTQuLmRjMTExMTIyZmY1ZDIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9waW5jdHJsL3N0LHN0bTMyLXBpbmN0cmwueWFtbAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9zdCxzdG0zMi1waW5jdHJsLnlhbWwKQEAgLTM0
LDcgKzM0LDYgQEAgcHJvcGVydGllczoKICAgICBjb25zdDogMQogCiAgIHJhbmdlczogdHJ1ZQot
ICBwaW5zLWFyZS1udW1iZXJlZDogdHJ1ZQogICBod2xvY2tzOiB0cnVlCiAKICAgaW50ZXJydXB0
czoKQEAgLTIxOSw3ICsyMTgsNiBAQCBleGFtcGxlczoKICAgICAgICAgICAgICAgI3NpemUtY2Vs
bHMgPSA8MT47CiAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzJmNDI5LXBpbmN0
cmwiOwogICAgICAgICAgICAgICByYW5nZXMgPSA8MCAweDQwMDIwMDAwIDB4MzAwMD47Ci0gICAg
ICAgICAgICAgIHBpbnMtYXJlLW51bWJlcmVkOwogCiAgICAgICAgICAgICAgIGdwaW9hOiBncGlv
QDAgewogICAgICAgICAgICAgICAgICAgICAgIGdwaW8tY29udHJvbGxlcjsKQEAgLTIzNyw3ICsy
MzUsNiBAQCBleGFtcGxlczoKICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47CiAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzJmNDI5LXBpbmN0cmwiOwogICAgICAgICAg
ICAgICByYW5nZXMgPSA8MCAweDUwMDIwMDAwIDB4MzAwMD47Ci0gICAgICAgICAgICAgIHBpbnMt
YXJlLW51bWJlcmVkOwogCiAgICAgICAgICAgICAgIGdwaW9iOiBncGlvQDEwMDAgewogICAgICAg
ICAgICAgICAgICAgICAgIGdwaW8tY29udHJvbGxlcjsKLS0gCjIuMzguMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
