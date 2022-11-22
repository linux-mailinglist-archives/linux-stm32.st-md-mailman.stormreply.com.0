Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 535CE6331E2
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Nov 2022 02:08:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03603C65E43;
	Tue, 22 Nov 2022 01:08:15 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E97C8C65041
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 01:08:12 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id z18so18597437edb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 17:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=22cpIMVo0mA6Jzd/hOHKABBmcBen8QvMhPR2HSaKBfQ=;
 b=LRmSuVMnncjGcUb8pM7UB1DOpIbSDESZoRfDOnAXZaN8BoBbkDvlUt+uVm4Hib7uuS
 Ip4tdmCk4thVn2IupNxpnmo1/gud2XUpxZ5lmFTOJMZlkMAQlalllgrI/ZKc78NbCJtt
 hjEpqtqtgkUp2f0J5r2ERbSih32Ldc2ngjNALYTeJgfp8nmZr+qQb5rf1RCzjLkiTxOJ
 eESiK3Vp8E6sc+ZXFvyaux4WvrRI0dW/uHOv2QtvgcDyzhbY5HYHOaWfrHEB6gY9vuL9
 Klx5jJBW6hCdUfkWEqDsrKxSW0TgClohG3ZW5l3SDYPr7pctr1KJlnlY1mWBI/yOt6pU
 s0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=22cpIMVo0mA6Jzd/hOHKABBmcBen8QvMhPR2HSaKBfQ=;
 b=cUsj5a8OwMF+Tr8Pi1a+j86JBE7dlyLCtNo++3hlaSTVm5gdDdM1A6peiUmNAWHGmN
 5/3zNcr64IIFM/R8h9wFjOLyrTWhabGae3yza1hSqwQMdG4etocJ7K/4fptkwfs4/wTC
 rflId9zif1YLA0J1ZF4jFmluz1/B2kWqzJg6nN9yxqiTGPqAml31Oe68WDLLU++niUEr
 99PlveGVicrzG5WBmWdw/FQOkB852wJpe3jupz0UvTsUkm+KD8XGabDuD5Q/j8OyjTxt
 gCrod78m3Wow92JSGhPGFAjun1Umww4b9rsL9GCw6x7WoLzZmzRq45CFI/1nyJNdnIoD
 krtQ==
X-Gm-Message-State: ANoB5plJ3ug4vGzvTkCtpX+aOUtYpDHXboU/Um+L/0j+r7y4QsQYQp+O
 T2vm0S9txpD1acF34cYeVK4cOg==
X-Google-Smtp-Source: AA0mqf6RkthBpqU68CQBd+vmDxOO1uiFkhkP9+BnLWGQjYO0j8vRPC7xMyHfe5FD8ZpgEeJ9TX4Szg==
X-Received: by 2002:a05:6402:294b:b0:458:cd82:91a with SMTP id
 ed11-20020a056402294b00b00458cd82091amr18650253edb.15.1669079292221; 
 Mon, 21 Nov 2022 17:08:12 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a1709064dcd00b007030c97ae62sm5514683ejw.191.2022.11.21.17.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 17:08:11 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Tue, 22 Nov 2022 02:07:51 +0100
Message-Id: <20221122010753.3126828-6-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122010753.3126828-1-bero@baylibre.com>
References: <20221122010753.3126828-1-bero@baylibre.com>
MIME-Version: 1.0
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: [Linux-stm32] [PATCH v2 5/7] arm64: dts: mediatek: Remove
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

UmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eSBmcm9tCmFy
bTY0IE1lZGlhdGVrIERldmljZVRyZWVzCgpTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmty
w6RuemVyIDxiZXJvQGJheWxpYnJlLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8g
RGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CkFja2Vk
LWJ5OiBLZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPgotLS0KIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQyNzEyZS5kdHNpICAgIHwgMSAtCiBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODE2Ny5kdHNpICAgICB8IDEgLQogYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxNzMtZWxtLmR0c2kgfCAxIC0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTczLmR0c2kgICAgIHwgMSAtCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
ODUxNi5kdHNpICAgICB8IDEgLQogNSBmaWxlcyBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQyNzEyZS5kdHNpIGIvYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDI3MTJlLmR0c2kKaW5kZXggOWRjMDc5NGZjZDJl
Ni4uYWNlOGU3NTFjOGVhNCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDI3MTJlLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDI3MTJl
LmR0c2kKQEAgLTI3MCw3ICsyNzAsNiBAQCBwaW86IHBpbmN0cmxAMTAwMDUwMDAgewogCQljb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10MjcxMi1waW5jdHJsIjsKIAkJcmVnID0gPDAgMHgxMDAwYjAw
MCAwIDB4MTAwMD47CiAJCW1lZGlhdGVrLHBjdGwtcmVnbWFwID0gPCZzeXNjZmdfcGN0bF9hPjsK
LQkJcGlucy1hcmUtbnVtYmVyZWQ7CiAJCWdwaW8tY29udHJvbGxlcjsKIAkJI2dwaW8tY2VsbHMg
PSA8Mj47CiAJCWludGVycnVwdC1jb250cm9sbGVyOwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxNjcuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTY3LmR0c2kKaW5kZXggZmJlMWExMTI4Y2M2YS4uNmE1NDMxNWNmNjUwMiAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNjcuZHRzaQorKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE2Ny5kdHNpCkBAIC0xMTcsNyArMTE3LDYgQEAg
cGlvOiBwaW5jdHJsQDEwMDBiMDAwIHsKIAkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTY3
LXBpbmN0cmwiOwogCQkJcmVnID0gPDAgMHgxMDAwYjAwMCAwIDB4MTAwMD47CiAJCQltZWRpYXRl
ayxwY3RsLXJlZ21hcCA9IDwmc3lzY2ZnX3BjdGw+OwotCQkJcGlucy1hcmUtbnVtYmVyZWQ7CiAJ
CQlncGlvLWNvbnRyb2xsZXI7CiAJCQkjZ3Bpby1jZWxscyA9IDwyPjsKIAkJCWludGVycnVwdC1j
b250cm9sbGVyOwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgx
NzMtZWxtLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My1lbG0uZHRz
aQppbmRleCBlMjFmZWI4NWQ4MjJiLi4xOGUyMTQ0NjRhMmQzIDEwMDY0NAotLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My1lbG0uZHRzaQorKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210ODE3My1lbG0uZHRzaQpAQCAtOTI5LDcgKzkyOSw2IEBAIGNsb2Nr
OiBtdDYzOTdjbG9jayB7CiAKIAkJcGlvNjM5NzogcGluY3RybCB7CiAJCQljb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10NjM5Ny1waW5jdHJsIjsKLQkJCXBpbnMtYXJlLW51bWJlcmVkOwogCQkJZ3Bp
by1jb250cm9sbGVyOwogCQkJI2dwaW8tY2VsbHMgPSA8Mj47CiAJCX07CmRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My5kdHNpIGIvYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaQppbmRleCA3NjQwYjUxNThmZjlkLi5jNDdkN2Q5MDBm
MjgzIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My5kdHNp
CisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2kKQEAgLTM3NSw3
ICszNzUsNiBAQCBwaW86IHBpbmN0cmxAMTAwMGIwMDAgewogCQkJY29tcGF0aWJsZSA9ICJtZWRp
YXRlayxtdDgxNzMtcGluY3RybCI7CiAJCQlyZWcgPSA8MCAweDEwMDBiMDAwIDAgMHgxMDAwPjsK
IAkJCW1lZGlhdGVrLHBjdGwtcmVnbWFwID0gPCZzeXNjZmdfcGN0bF9hPjsKLQkJCXBpbnMtYXJl
LW51bWJlcmVkOwogCQkJZ3Bpby1jb250cm9sbGVyOwogCQkJI2dwaW8tY2VsbHMgPSA8Mj47CiAJ
CQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4NTE2LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODUx
Ni5kdHNpCmluZGV4IGQxYjY3YzgyZDc2MTcuLjExODAyNTI2M2EyOWIgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4NTE2LmR0c2kKKysrIGIvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDg1MTYuZHRzaQpAQCAtMjI5LDcgKzIyOSw2IEBAIHBpbzogcGlu
Y3RybEAxMDAwYjAwMCB7CiAJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODUxNi1waW5jdHJs
IjsKIAkJCXJlZyA9IDwwIDB4MTAwMGIwMDAgMCAweDEwMDA+OwogCQkJbWVkaWF0ZWsscGN0bC1y
ZWdtYXAgPSA8JnN5c2NmZ19wY3RsPjsKLQkJCXBpbnMtYXJlLW51bWJlcmVkOwogCQkJZ3Bpby1j
b250cm9sbGVyOwogCQkJI2dwaW8tY2VsbHMgPSA8Mj47CiAJCQlpbnRlcnJ1cHQtY29udHJvbGxl
cjsKLS0gCjIuMzguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
