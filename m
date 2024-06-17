Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FB590B009
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:49:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 234C2C78002;
	Mon, 17 Jun 2024 13:49:58 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 773DCC78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:49:56 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-797e2834c4eso366677085a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632195; x=1719236995;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6sTXUSoBs+YlsgH71N9X/wOixyDVYk1BR8pUCCabPaI=;
 b=lGbAldo5ed6d1v8BgjBBDmHh9gvzPVhUKVLr9MVg8swZ8Km7t0dp/pYIo/BOXs7HPf
 +w5Fw870ME6pD6dUwq9NIlO3b1dxekcqpgOSNm3fQp5g8DqwLHF4T3H45SYO4sDgvgoa
 spp5D9aPkIxR/Xww688L8Mh1wqra4HMW2zVqMCARzaeM72r5tPq/0glUZVlh6VbwzxrC
 sgJmMON86zXlp8kjUlQTH1e487XAYEAZZxJ9mDIcVV8e+PTxfGP4g2JzbZya+OjUhuHx
 YtxICH8lCbJqoGBChP2MpdSk5CATrAfBp7PqBDeg9ap695RedKuMWaKX+7gByQpPP4Wv
 hvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632195; x=1719236995;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6sTXUSoBs+YlsgH71N9X/wOixyDVYk1BR8pUCCabPaI=;
 b=PPcvwna8jzl43lUnMz7nFcpJ1TT15vulxX+slVl550PP17KonPgeyuU3zEZcXGrBjD
 QE556VYkvJXGFWIf9vEyLc/xUJIaiH+RHP9NWfou+3SBgRj+c8J1d9KIHStj60fB3SRZ
 1QhuXNFfw8S7GsF76Fy4nAy0N3kxWUwJLHt/U/aBqE9SmEQO1cWMRPCrv6L+oTUqxBSf
 OpySTXMYuHbXRGf2WBNGA2WUzIvmmigOAooDON+L3yoyIJMpSq1qcBWVFXetwCLxBXdY
 hN2m3Es0ueH/PUBCoRemWLTG+odUgToLVKILhCPWC1mz/0DJQ3WjHj5v42ANkUAq68Wx
 hYVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFoMuUxZ0XIT376Od+dom5o/0k1RGH+qOf5e1ncgOeu4uJ+JtpHud0UVmRZaHJXsxUacAVxKMULDlxoEExA2I7dssx+t++1wh6EEqeby16XRse3w24U+ee
X-Gm-Message-State: AOJu0YxE4Rgz/LQtI93OHHeiVoTuGFzeNd2mXYeGpa7F7KtIM9JQKcML
 5WkVWygno9uzDKqbjJn7CMXmB+ijnUBGt9yUwwWD3kDpfOOVhcQxGpqcWyTpAXw=
X-Google-Smtp-Source: AGHT+IGjHbBOrTl20NthbniN5xVzM8rCge08JoanAoI0amw+zX4G0dqtT7iYT1wcjjqa5iiFtvInEw==
X-Received: by 2002:a05:620a:44c4:b0:795:5b00:edcb with SMTP id
 af79cd13be357-798d0243396mr1793084785a.21.1718632195400; 
 Mon, 17 Jun 2024 06:49:55 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:49:55 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:45 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-5-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, 
 Crt Mori <cmo@melexis.com>
X-Mailer: b4 0.13.0
Cc: Trevor Gamblin <tgamblin@baylibre.com>, imx@lists.linux.dev,
 linux-iio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 05/41] iio: adc: axp20x_adc: make use of
 regmap_set_bits()
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

SW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB0aGUgbWFz
ayB0d2ljZSwgdXNlCnJlZ21hcF9zZXRfYml0cygpLgoKU3VnZ2VzdGVkLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KU2lnbmVkLW9mZi1ieTogVHJl
dm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2lpby9hZGMv
YXhwMjB4X2FkYy5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvYXhwMjB4X2FkYy5j
IGIvZHJpdmVycy9paW8vYWRjL2F4cDIweF9hZGMuYwppbmRleCBkNmM1MWIwZjQ4ZTMuLjAwYzFh
MDFjYWM2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vYWRjL2F4cDIweF9hZGMuYworKysgYi9k
cml2ZXJzL2lpby9hZGMvYXhwMjB4X2FkYy5jCkBAIC03MTIsOSArNzEyLDggQEAgc3RhdGljIGlu
dCBheHAyMHhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZWdtYXBfd3Jp
dGUoaW5mby0+cmVnbWFwLCBBWFAyMFhfQURDX0VOMSwgaW5mby0+ZGF0YS0+YWRjX2VuMV9tYXNr
KTsKIAogCWlmIChpbmZvLT5kYXRhLT5hZGNfZW4yX21hc2spCi0JCXJlZ21hcF91cGRhdGVfYml0
cyhpbmZvLT5yZWdtYXAsIEFYUDIwWF9BRENfRU4yLAotCQkJCSAgIGluZm8tPmRhdGEtPmFkY19l
bjJfbWFzaywKLQkJCQkgICBpbmZvLT5kYXRhLT5hZGNfZW4yX21hc2spOworCQlyZWdtYXBfc2V0
X2JpdHMoaW5mby0+cmVnbWFwLCBBWFAyMFhfQURDX0VOMiwKKwkJCQlpbmZvLT5kYXRhLT5hZGNf
ZW4yX21hc2spOwogCiAJLyogQ29uZmlndXJlIEFEQ3MgcmF0ZSAqLwogCWluZm8tPmRhdGEtPmFk
Y19yYXRlKGluZm8sIDEwMCk7CgotLSAKMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
