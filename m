Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE1F63B7F4
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Nov 2022 03:34:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A831FC65E6C;
	Tue, 29 Nov 2022 02:34:11 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DD96C65E69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Nov 2022 02:34:10 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id td2so16416905ejc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Nov 2022 18:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/GylWv8dDUhA43mvLSIaB6C4Oy4jyZ7+vGJ/Fsw+O6A=;
 b=0m6ouxXw30oIxgRwgkPo6CeHsm2CLaN1oSS8RgoHzFTHSmFM+QcNJX9b5Iltq9nX7H
 cHRMOO0mzso4wPyjWuZbtB+LrGId1phqwBtFQV2MDd6gywKVrletV3RiYjj73uW/LOh8
 yGYyFJrlpqWHXOfZQ/sckRPJpwRoQQGS8xl2hZo/CPyG71xdROgL+XBDHsU/HPWewRgP
 D2ecAUrlMpWT2G7A2cxmgL2wb1gZO2UWiXmQrWI/6hKna/4xofs6gRoxkmEezPBKDjg2
 Ec1FzbRFuuxfpYU5c6wHJYbtGXQQvFeL8oZbHtH/6wlQzheQylfWgCXax0gXkfCkRc+V
 agdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/GylWv8dDUhA43mvLSIaB6C4Oy4jyZ7+vGJ/Fsw+O6A=;
 b=GWcdkDB45KBguKKQ6U3QzyX+XjcFrr/ISywW0FPzTZJw7lk3/mMfCTLWTHA4F4I7Hy
 rofF/VCCVaByEcAsiV2w15xlwOZkZwlIZBXxQ3jshAcGFZbxGGVVFUQeIA/zkWowMJJs
 gVlGVv+grYOtjiusJwIGwbZQkOHawq7xBc0vK2GUekFK1giEsg7igmFAu1K6x1kWUciv
 b53OtVacM1cocsvWNAwHQW25H9H/VCn7AYzf+iKjRG3biVf6aFeeUjwd1PYqYbHXB99D
 W39HyelJtHbmjnwn0gnPn+bXW3pi9WGuTA+ribHhqSArwJUboLdOwTpvTeasAIX95ssx
 5P/Q==
X-Gm-Message-State: ANoB5pld6govUH84Jd6i06ZMeWufRxAXXePGGkgeUpoSkff8ra4ZFH5s
 /PnGMFqknmKhODO+EwMyH0FkwA==
X-Google-Smtp-Source: AA0mqf5dNW9VEmEdHrazpTchJx5yo9e4tUL2Lviv2XCBayhBYwcC0BZ3jGo9WYO2bpTIIPeJczirWg==
X-Received: by 2002:a17:907:9854:b0:7bc:30e0:6bea with SMTP id
 jj20-20020a170907985400b007bc30e06beamr17870029ejc.49.1669689249990; 
 Mon, 28 Nov 2022 18:34:09 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
 by smtp.gmail.com with ESMTPSA id
 a4-20020aa7d744000000b004615f7495e0sm5733817eds.8.2022.11.28.18.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 18:34:09 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Tue, 29 Nov 2022 03:34:01 +0100
Message-Id: <20221129023401.278780-8-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129023401.278780-1-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
MIME-Version: 1.0
Cc: khilman@baylibre.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: [Linux-stm32] [PATCH v3 7/7] ARM: dts: stm32: Remove the
	pins-are-numbered property
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

UmVtb3ZlIHRoZSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eSBmcm9tIFNUTTMyIERldmljZVRy
ZWVzCgpTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmtyw6RuemVyIDxiZXJvQGJheWxpYnJl
LmNvbT4KUmV2aWV3ZWQtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5j
b20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNC1waW5jdHJsLmR0c2kgfCAxIC0KIGFy
Y2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjctcGluY3RybC5kdHNpIHwgMSAtCiBhcmNoL2FybS9ib290
L2R0cy9zdG0zMmg3NDMuZHRzaSAgICAgICB8IDEgLQogYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJt
cDEzMS5kdHNpICAgICAgfCAxIC0KIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTEuZHRzaSAg
ICAgIHwgMiAtLQogNSBmaWxlcyBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQtcGluY3RybC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9k
dHMvc3RtMzJmNC1waW5jdHJsLmR0c2kKaW5kZXggNTAwYmNjMzAyZDQyMi4uNDUyM2M2MzQ3NWU0
YyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNC1waW5jdHJsLmR0c2kKKysr
IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNC1waW5jdHJsLmR0c2kKQEAgLTUxLDcgKzUxLDYg
QEAgcGluY3RybDogcGluY3RybEA0MDAyMDAwMCB7CiAJCQlyYW5nZXMgPSA8MCAweDQwMDIwMDAw
IDB4MzAwMD47CiAJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZleHRpPjsKIAkJCXN0LHN5c2NmZyA9
IDwmc3lzY2ZnIDB4OD47Ci0JCQlwaW5zLWFyZS1udW1iZXJlZDsKIAogCQkJZ3Bpb2E6IGdwaW9A
NDAwMjAwMDAgewogCQkJCWdwaW8tY29udHJvbGxlcjsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMyZjctcGluY3RybC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNy1w
aW5jdHJsLmR0c2kKaW5kZXggOGYzN2FlZmE3MzE1MC4uYzhlNmM1MmZiMjQ4ZSAxMDA2NDQKLS0t
IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNy1waW5jdHJsLmR0c2kKKysrIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvc3RtMzJmNy1waW5jdHJsLmR0c2kKQEAgLTE1LDcgKzE1LDYgQEAgcGluY3RybDog
cGluY3RybEA0MDAyMDAwMCB7CiAJCQlyYW5nZXMgPSA8MCAweDQwMDIwMDAwIDB4MzAwMD47CiAJ
CQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZleHRpPjsKIAkJCXN0LHN5c2NmZyA9IDwmc3lzY2ZnIDB4
OD47Ci0JCQlwaW5zLWFyZS1udW1iZXJlZDsKIAogCQkJZ3Bpb2E6IGdwaW9ANDAwMjAwMDAgewog
CQkJCWdwaW8tY29udHJvbGxlcjsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMy
aDc0My5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJoNzQzLmR0c2kKaW5kZXggMjhlM2Rl
YjIwZTFlMS4uZjMwNzk2ZjdhZGYzNiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Rt
MzJoNzQzLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJoNzQzLmR0c2kKQEAgLTU4
OCw3ICs1ODgsNiBAQCBwaW5jdHJsOiBwaW5jdHJsQDU4MDIwMDAwIHsKIAkJCXJhbmdlcyA9IDww
IDB4NTgwMjAwMDAgMHgzMDAwPjsKIAkJCWludGVycnVwdC1wYXJlbnQgPSA8JmV4dGk+OwogCQkJ
c3Qsc3lzY2ZnID0gPCZzeXNjZmcgMHg4PjsKLQkJCXBpbnMtYXJlLW51bWJlcmVkOwogCiAJCQln
cGlvYTogZ3Bpb0A1ODAyMDAwMCB7CiAJCQkJZ3Bpby1jb250cm9sbGVyOwpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDEzMS5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Rt
MzJtcDEzMS5kdHNpCmluZGV4IDJhOWIzYTViYmE4MzAuLmFkYWVlMGY5ZTEyNjMgMTAwNjQ0Ci0t
LSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxMzEuZHRzaQorKysgYi9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTMxLmR0c2kKQEAgLTU0OSw3ICs1NDksNiBAQCBwaW5jdHJsOiBwaW5jdHJs
QDUwMDAyMDAwIHsKIAkJCXJhbmdlcyA9IDwwIDB4NTAwMDIwMDAgMHg4NDAwPjsKIAkJCWludGVy
cnVwdC1wYXJlbnQgPSA8JmV4dGk+OwogCQkJc3Qsc3lzY2ZnID0gPCZleHRpIDB4NjAgMHhmZj47
Ci0JCQlwaW5zLWFyZS1udW1iZXJlZDsKIAogCQkJZ3Bpb2E6IGdwaW9ANTAwMDIwMDAgewogCQkJ
CWdwaW8tY29udHJvbGxlcjsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAx
NTEuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTEuZHRzaQppbmRleCA1NDkxYjZj
NGRlYzIwLi40ZTQzN2QzZjJlZDY2IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0z
Mm1wMTUxLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1MS5kdHNpCkBAIC0x
NjYwLDcgKzE2NjAsNiBAQCBwaW5jdHJsOiBwaW5jdHJsQDUwMDAyMDAwIHsKIAkJCXJhbmdlcyA9
IDwwIDB4NTAwMDIwMDAgMHhhNDAwPjsKIAkJCWludGVycnVwdC1wYXJlbnQgPSA8JmV4dGk+Owog
CQkJc3Qsc3lzY2ZnID0gPCZleHRpIDB4NjAgMHhmZj47Ci0JCQlwaW5zLWFyZS1udW1iZXJlZDsK
IAogCQkJZ3Bpb2E6IGdwaW9ANTAwMDIwMDAgewogCQkJCWdwaW8tY29udHJvbGxlcjsKQEAgLTE3
ODksNyArMTc4OCw2IEBAIHBpbmN0cmxfejogcGluY3RybEA1NDAwNDAwMCB7CiAJCQkjc2l6ZS1j
ZWxscyA9IDwxPjsKIAkJCWNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDE1Ny16LXBpbmN0cmwiOwog
CQkJcmFuZ2VzID0gPDAgMHg1NDAwNDAwMCAweDQwMD47Ci0JCQlwaW5zLWFyZS1udW1iZXJlZDsK
IAkJCWludGVycnVwdC1wYXJlbnQgPSA8JmV4dGk+OwogCQkJc3Qsc3lzY2ZnID0gPCZleHRpIDB4
NjAgMHhmZj47CiAKLS0gCjIuMzguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
