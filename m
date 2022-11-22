Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9162F6331E5
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Nov 2022 02:08:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5022DC65E4C;
	Tue, 22 Nov 2022 01:08:15 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79B46C03FE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 01:08:13 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id n21so32312410ejb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 17:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M8Z/CuSU+65/xoefFvoUYNSAqkT5w7zFjiS9CzpEsgo=;
 b=khl3j/XE7m0EGnorZA5Q3DsiTbyoBwHi5GUL7KsN5WlbQ+h1lY66BGMbM+GhD9kaMz
 u47U0zrTL0kvn7kfYNZRORwbSPyXy0piyY8zcGPxNckS1lhvn6VR8nu13RnVQQ0XbgmN
 0KI3ZRrknYNP6Oh7kYy/xVEcCuU+e6yxPxPfz1P9vEm2T4Rn+GdfM6OOPnRXK6UTo8LN
 SDHXV/U2xOlAaiu0s8kV6f0i6hk1zkL1yaJU4GlQFS61EyqKe7kZa+nux6/RbpzqoF7d
 2y37q0+hcsMmpuWIk/qYoT/rFdaz1C3009x2XE7O/z6IaXZpW/GlAGBWwCjFFYvGP2ZR
 mnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M8Z/CuSU+65/xoefFvoUYNSAqkT5w7zFjiS9CzpEsgo=;
 b=hjgP18lpcbHOMbeoPv2jr11viind7yKPmiZqEJYyrHw2gac8JNbDkUtDxhEKuUHOU6
 pL4Arvc75xWG1U9YIE1sCU7TeE59n6KLzM2qI9lGxw/F8y8hggn2I09fGMbVnazmFl8H
 wLfDrGJx9wMpGPuvDXRwMIsy4oTKP8ffhL11jQqz3VmyveYwxmIvhtWk4LUVuKcUvDpk
 6mylF4ELSI1631PFKGx3o5pvRMbl33PHGlOGGdzZcW77ouP2JZ7k4ioEk67LE8Pjeoja
 vCO1eV7qBFXlPmMfmv6OHCp1cVG50kNWswmoq3piWdWhqnH82JMTUlfyUADBxn6hsgVP
 Aurg==
X-Gm-Message-State: ANoB5plckwyQvHiQrA2wb2QoR/GFxzM0NkJK/0DQbI/VDezXYoX/076q
 snWk16WysqB86Fc0UhHpAOQjVw==
X-Google-Smtp-Source: AA0mqf7Go5aHljXna58A3ki2BugYv1A9YAbDkmIxbJqzeq58ZihN3W52HFeTXtwAFk/yPKe8S3aGLQ==
X-Received: by 2002:a17:906:1ecf:b0:7ad:902c:d1d6 with SMTP id
 m15-20020a1709061ecf00b007ad902cd1d6mr6197186ejj.143.1669079293135; 
 Mon, 21 Nov 2022 17:08:13 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a1709064dcd00b007030c97ae62sm5514683ejw.191.2022.11.21.17.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 17:08:12 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Tue, 22 Nov 2022 02:07:52 +0100
Message-Id: <20221122010753.3126828-7-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122010753.3126828-1-bero@baylibre.com>
References: <20221122010753.3126828-1-bero@baylibre.com>
MIME-Version: 1.0
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: [Linux-stm32] [PATCH v2 6/7] ARM: dts: mediatek: Remove
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
