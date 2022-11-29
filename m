Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB86163B7F2
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Nov 2022 03:34:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F6F2C65E60;
	Tue, 29 Nov 2022 02:34:11 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40D2CC65E5E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Nov 2022 02:34:08 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id vv4so30545399ejc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Nov 2022 18:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tY5QKpgq2/3jzaTOJQNlt/Q86yQh5wKQ2sDulmkg2KI=;
 b=iILHEhBDJeI6roPJ+yKBiU7KMlVgcArUjotoW4AxLsih2mo1ghMrCxS09gQE+29dmU
 +RbUeMblWHDQ89WPsSfHBHa1Cg/FPw/y93DB0GeFVIREpHEdfiWBQEg/+q23ll+jonTt
 VLlqquvqbMNJI0FrjDlhm9d2ZSHuec7UkUKFF+5CYgB3MR/ZZzyGqt2XvmvQ/9d9cg+y
 krG7lMW9sr2YN8MwJeTgyXazold705MzoT1+u6hzff+Y6niIK3qC0Ohciys7rc/U/aeM
 dLfjnSw3GDkQA7ntnFduQxUaOuGK1fEpo1q7ejXYnM0tDIukVJ/lrxbEb+YErEcXr3Tl
 KloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tY5QKpgq2/3jzaTOJQNlt/Q86yQh5wKQ2sDulmkg2KI=;
 b=idNQyz6RaD7CJBE5xCwzuurswcDEhixUHaSe/Fi7Rmt0yklonFF7ZoFVKW4LOAM2Ct
 p5rarRUgqOtVO11tibIMu8x6Kh3y5jun9ty3oeNAp1I3IQmRy9dJZ8JDgcutH40TJtAE
 8SLsH2mFfOjL7VHDMAzCxDO22ey2NN+N/RhRO/apjk7eOGv7Xx7X6THzUoaJ4fAT9305
 nwF0g1TeHe/B1aXZz3b7FUNol4N/UdFpwCxxEVblrX+r/rO09jnekepZzYhsv7+G85+I
 X6VIxuUzDAQofKWSnPtMWcUIlDtHTqydTsLoQRcI6pO9XsyGaiKOktoqSEmVWBIjfv1Z
 A+Pw==
X-Gm-Message-State: ANoB5pmZsfCz3Am7R6d6QZoVLeRnYEOqrwIBcX/taT8zf5LBC0MZDFlt
 aCqqhHsByvv5CPjF//XhL4zyLA==
X-Google-Smtp-Source: AA0mqf7yhvrPVC0kUAVz2nWRfivf1QRifx3vYbKDMiHnNxce2TQlEbllXiOrJ3+ZNhog43flqf5Omg==
X-Received: by 2002:a17:906:cf85:b0:78d:b66d:749f with SMTP id
 um5-20020a170906cf8500b0078db66d749fmr43970741ejb.566.1669689248073; 
 Mon, 28 Nov 2022 18:34:08 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
 by smtp.gmail.com with ESMTPSA id
 a4-20020aa7d744000000b004615f7495e0sm5733817eds.8.2022.11.28.18.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 18:34:07 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Tue, 29 Nov 2022 03:33:59 +0100
Message-Id: <20221129023401.278780-6-bero@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 5/7] arm64: dts: mediatek: Remove
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
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDI3MTJlLmR0c2kKaW5kZXggOTIyMTJjZGRkMzdl
Ni4uODc5ZGZmMjRkY2QzYiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDI3MTJlLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDI3MTJl
LmR0c2kKQEAgLTI3MCw3ICsyNzAsNiBAQCBwaW86IHBpbmN0cmxAMTAwMGIwMDAgewogCQljb21w
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
