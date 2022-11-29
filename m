Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BF163B7F3
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Nov 2022 03:34:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AFC9C65E69;
	Tue, 29 Nov 2022 02:34:11 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DC6DC65E69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Nov 2022 02:34:09 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id z92so7513624ede.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Nov 2022 18:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M8Z/CuSU+65/xoefFvoUYNSAqkT5w7zFjiS9CzpEsgo=;
 b=TGMnn46CtKmUg45vARZzI+l7g+wJRHX66iFsaESAYfjUreGPhFtBLMrWSVfN8NhQ4R
 EAj8tu1adlY/+N+IFytx6V0pihxUb6rgNkgIhvtEo674brpFnW8vfu7xWJWALL7JtLUM
 OZXaJyvSkMWjBQ2HcTY+/T07EugndtdyOxTAW0ahTze1Z1ZNQvMemygppjQcVhQOBPuT
 WOFzgajTZrV5D4fqhH9WxOTtL5J8mKkhErGwFwJGcuD/SA5SkPVzJt7TTz5oj9QP4Y7A
 poSLVkvYcplY4mgCj0z6tYrs6Oz9E+2nack2BY3eemkJ0u8yVzJbo+mcpjR/U7k+gUId
 CXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M8Z/CuSU+65/xoefFvoUYNSAqkT5w7zFjiS9CzpEsgo=;
 b=GIB1/lJIBp4X9AcC4NOewg0IkkUaOWJgCWC2zFWdByYrL6Szm7FO5RWkilf3bj6WtK
 iICt58izvUurjk8FDagAM6okBDcIOAoccOqg5XtZAWbgVPQuGoylVNNR0oNx+YPScAd2
 lFhDjS3ptiFcXXxEyjiuMbPwwp/cZOQoIJNSiE4OTP258t9WX+aNi+1je5LkLBIXQY1O
 W8nThiArF9NCKUbhPmYFeX8C1RDCdav8B/blgtm/0zKXhmYe1EutwFZADb51AOqRxpcN
 tGRgIeQ6wTH0MnOJixd0rXKDn590NI2WsSbp5LJH8hZorlMMyopvkbDuv+BkSofY2r/m
 yOdQ==
X-Gm-Message-State: ANoB5pkNOlA6b/KgipsDxutVEAG4opiSaBVDp9a/ynDbfv8l9rN4znrS
 KwRHRB7Q+wGyTJkcADT2KngMn+S18Kdk9w==
X-Google-Smtp-Source: AA0mqf60o5tLbeI6S6dpTLzC6o649BcnNTqez9gWqoEhygiGGK9mOCHndjEEV+VdcPsGK1nhuiq4LQ==
X-Received: by 2002:a05:6402:3707:b0:467:6847:83d3 with SMTP id
 ek7-20020a056402370700b00467684783d3mr10333472edb.247.1669689249014; 
 Mon, 28 Nov 2022 18:34:09 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
 by smtp.gmail.com with ESMTPSA id
 a4-20020aa7d744000000b004615f7495e0sm5733817eds.8.2022.11.28.18.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 18:34:08 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Tue, 29 Nov 2022 03:34:00 +0100
Message-Id: <20221129023401.278780-7-bero@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 6/7] ARM: dts: mediatek: Remove
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

UmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eSBmcm9tCk1l
ZGlhdGVrIEFSTSBEZXZpY2VUcmVlcwoKU2lnbmVkLW9mZi1ieTogQmVybmhhcmQgUm9zZW5rcsOk
bnplciA8YmVyb0BiYXlsaWJyZS5jb20+ClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERl
bCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgpBY2tlZC1i
eTogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4KLS0tCiBhcmNoL2FybS9ib290
L2R0cy9tdDI3MDEuZHRzaSB8IDEgLQogYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzLmR0c2kgfCAx
IC0KIGFyY2gvYXJtL2Jvb3QvZHRzL210ODEzNS5kdHNpIHwgMSAtCiAzIGZpbGVzIGNoYW5nZWQs
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvbXQyNzAxLmR0
c2kgYi9hcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaQppbmRleCBiOGViYTNiYTE1M2MyLi4w
YTBmZThjNWE0MDU5IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaQor
KysgYi9hcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaQpAQCAtMTc4LDcgKzE3OCw2IEBAIHBp
bzogcGluY3RybEAxMDAwYjAwMCB7CiAJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzAxLXBp
bmN0cmwiOwogCQlyZWcgPSA8MCAweDEwMDBiMDAwIDAgMHgxMDAwPjsKIAkJbWVkaWF0ZWsscGN0
bC1yZWdtYXAgPSA8JnN5c2NmZ19wY3RsX2E+OwotCQlwaW5zLWFyZS1udW1iZXJlZDsKIAkJZ3Bp
by1jb250cm9sbGVyOwogCQkjZ3Bpby1jZWxscyA9IDwyPjsKIAkJaW50ZXJydXB0LWNvbnRyb2xs
ZXI7CmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9tdDc2MjMuZHRzaSBiL2FyY2gvYXJt
L2Jvb3QvZHRzL210NzYyMy5kdHNpCmluZGV4IDI1ZDMxZTQwYTU1MzUuLjExMzc5YzNlNmI0Y2Eg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL210NzYyMy5kdHNpCisrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL210NzYyMy5kdHNpCkBAIC0yNTMsNyArMjUzLDYgQEAgcGlvOiBwaW5jdHJsQDEw
MDA1MDAwIHsKIAkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDc2MjMtcGluY3RybCI7CiAJCXJl
ZyA9IDwwIDB4MTAwMGIwMDAgMCAweDEwMDA+OwogCQltZWRpYXRlayxwY3RsLXJlZ21hcCA9IDwm
c3lzY2ZnX3BjdGxfYT47Ci0JCXBpbnMtYXJlLW51bWJlcmVkOwogCQlncGlvLWNvbnRyb2xsZXI7
CiAJCSNncGlvLWNlbGxzID0gPDI+OwogCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2Jvb3QvZHRzL210ODEzNS5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvbXQ4
MTM1LmR0c2kKaW5kZXggYTAzMWIzNjM2MzE4Ny4uMGYyOTFhZDIyZDNhZiAxMDA2NDQKLS0tIGEv
YXJjaC9hcm0vYm9vdC9kdHMvbXQ4MTM1LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvbXQ4
MTM1LmR0c2kKQEAgLTE1Miw3ICsxNTIsNiBAQCBwaW86IHBpbmN0cmxAMTAwMDUwMDAgewogCQkJ
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxMzUtcGluY3RybCI7CiAJCQlyZWcgPSA8MCAweDEw
MDBiMDAwIDAgMHgxMDAwPjsKIAkJCW1lZGlhdGVrLHBjdGwtcmVnbWFwID0gPCZzeXNjZmdfcGN0
bF9hICZzeXNjZmdfcGN0bF9iPjsKLQkJCXBpbnMtYXJlLW51bWJlcmVkOwogCQkJZ3Bpby1jb250
cm9sbGVyOwogCQkJI2dwaW8tY2VsbHMgPSA8Mj47CiAJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsK
LS0gCjIuMzguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
