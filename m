Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB4063B7E7
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Nov 2022 03:34:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A41EC65E69;
	Tue, 29 Nov 2022 02:34:06 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7584C65E5E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Nov 2022 02:34:04 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id vv4so30545191ejc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Nov 2022 18:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZTx+TtbHQiuyemeCcK5ytUKmVUVmCoh0H5eAmJ4K4qk=;
 b=zdPnBz8LuT1eYde2dmjuvmer7HQPreaOkL/J34wCWMTbFXn/rlUkZgCRefXxmTxSd6
 ynHItCJhUlhX/oB2no2KlunwGK6IeCorVQeNAtZFV3oyjteMsRZVQXkWRXhjrRtoPFfv
 5dTvbspYt2uIpdh6UQQCegMEKg5YRfpqkfvCrZnv6NCgczSc7qKFiDJhgpL7nq5Ix5Yw
 JDv1wHyuf8+45dqkj6Blp5k9x5lc7FxsVJyBNVTlGlCM/p0CjKi6p8sx7XCmaYgR/Pso
 n4+SrZ1GsX9KXdHppUTzlSbDJaxWGT0Of3R5Nsw2oApzRycZvxrSZv00CIsPOmdE/UTR
 YTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZTx+TtbHQiuyemeCcK5ytUKmVUVmCoh0H5eAmJ4K4qk=;
 b=kRyaJsTylcAR7/1nCSNvaYHRzDsN0P9UGrObrNgY6jkATxyOTsqGHOMLNQfyJK3MMr
 7AAdAWJRKlcFCBW+iGS9WPlLrHbjmlBu4WH/GlsW+etd11M52/5N9LlmtovUn4egW3ll
 qhiFaWdIyyT/5mmHdclXOdJtMstwyCWArZTFYw/3BZZMEvKQuQDzNXUxo1a92avEl5yc
 3S/agvIGBndx0051XApvlh6XQqMETbrGoQatrySXvi6/WugREU3/UUgYjfFlvudcZSTM
 FixMEl4b0kNOKkjix5ACGX4461djn3DdYO0petyTEL3ZCDVc8bzDUfXlGaw/+4CogxDv
 oWcQ==
X-Gm-Message-State: ANoB5pnWgE9yHUDQn2lx4wBVMWYivD9CQJaJmqQaxbxcphHh9SYdOGqh
 02Itvaj8iAPhpQFc5p9ZutfZKf/PVkPP1Q==
X-Google-Smtp-Source: AA0mqf7cNqtLS8XZxcIEfqpN/Zg8AfFILEVbgilC7PIW1LJ9tdQClOSPyxdLvja1MaMQAwYiJDpXfQ==
X-Received: by 2002:a17:906:8465:b0:7bd:7253:457a with SMTP id
 hx5-20020a170906846500b007bd7253457amr13730873ejc.81.1669689244396; 
 Mon, 28 Nov 2022 18:34:04 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
 by smtp.gmail.com with ESMTPSA id
 a4-20020aa7d744000000b004615f7495e0sm5733817eds.8.2022.11.28.18.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 18:34:04 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Tue, 29 Nov 2022 03:33:55 +0100
Message-Id: <20221129023401.278780-2-bero@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 1/7] pinctrl: mediatek: common: Remove
	check for pins-are-numbered
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

UmVtb3ZlIHRoZSBjaGVjayBmb3IgdGhlIHVubmVjZXNzYXJ5IHBpbnMtYXJlLW51bWJlcmVkIERl
dmljZXRyZWUgcHJvcGVydHkuCgpTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmtyw6RuemVy
IDxiZXJvQGJheWxpYnJlLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJl
Z25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+ClJldmlld2VkLWJ5
OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgpBY2tlZC1ieTogS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgpBY2tlZC1i
eTogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL3BpbmN0
cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLmMgfCA2IC0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVr
L3BpbmN0cmwtbXRrLWNvbW1vbi5jIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwt
bXRrLWNvbW1vbi5jCmluZGV4IDA3NmFlMGIzOGUzZDcuLjU1M2QxNjcwMzQ3NWIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1jb21tb24uYworKysgYi9k
cml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLmMKQEAgLTEwNTcsNyAr
MTA1Nyw2IEBAIGludCBtdGtfcGN0cmxfaW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
LAogCXN0cnVjdCBwaW5jdHJsX3Bpbl9kZXNjICpwaW5zOwogCXN0cnVjdCBtdGtfcGluY3RybCAq
cGN0bDsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gcGRldi0+ZGV2Lm9mX25vZGUsICpub2Rl
OwotCXN0cnVjdCBwcm9wZXJ0eSAqcHJvcDsKIAlpbnQgcmV0LCBpOwogCiAJcGN0bCA9IGRldm1f
a3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnBjdGwpLCBHRlBfS0VSTkVMKTsKQEAgLTEwNjYs
MTEgKzEwNjUsNiBAQCBpbnQgbXRrX3BjdHJsX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldiwKIAogCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHBjdGwpOwogCi0JcHJvcCA9IG9m
X2ZpbmRfcHJvcGVydHkobnAsICJwaW5zLWFyZS1udW1iZXJlZCIsIE5VTEwpOwotCWlmICghcHJv
cCkKLQkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRUlOVkFMLAotCQkJCSAgICAgIm9ubHkg
c3VwcG9ydCBwaW5zLWFyZS1udW1iZXJlZCBmb3JtYXRcbiIpOwotCiAJbm9kZSA9IG9mX3BhcnNl
X3BoYW5kbGUobnAsICJtZWRpYXRlayxwY3RsLXJlZ21hcCIsIDApOwogCWlmIChub2RlKSB7CiAJ
CXBjdGwtPnJlZ21hcDEgPSBzeXNjb25fbm9kZV90b19yZWdtYXAobm9kZSk7Ci0tIAoyLjM4LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
