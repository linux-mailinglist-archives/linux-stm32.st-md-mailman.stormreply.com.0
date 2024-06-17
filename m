Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C54C590B016
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89278C78015;
	Mon, 17 Jun 2024 13:50:16 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF483C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:15 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-79a3f1d007fso174520685a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632215; x=1719237015;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GyaMuqBhP7o7wmqZwNnsnkbTtRp5AugJ4lcsefsATFM=;
 b=qBBXRiURbnEWXuTX+7Q4MIZ+9MH2WoA41iglQDdUOs0syC2bgnVHPHMvAuCOG35MHU
 HqKyoivAlpcDVoc4RgtpxUDQgOZN8uq19R1UPBRaC98X5Cmt1kyKN8WohBDNHM75S7Ee
 C0DkTOORXL94A/8jpG9hP9uP1xS9dQTPeFiggOeiSZPU6VFx9mRLeYSRKLk4A6wixLYU
 o94uIPK7E/FacS6oDpiEOBvoahlqAQRaaJB8nO81Hz4GqCXEARUwwJ7TwbOshI0hcioF
 Onh8oMby106gMnUx3wXxRk0jNM1qg+CHAZF+9JAXKV2l4kbl5dpnw71wq+1Fi5FraBIE
 gwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632215; x=1719237015;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GyaMuqBhP7o7wmqZwNnsnkbTtRp5AugJ4lcsefsATFM=;
 b=rJDk/3PEzUuRgq/DBF4aTXtZpmOTyfbaYxUWuyyg3cdwVG9m8ZxoFXsrJqGnzGzPQG
 yfBrwWb4tnTtP9aqZIddo47sV0CTp/cJnsVh0UPdZQPwil4CP79quaJItETT5BPKuBhO
 E5pXHc/V0HkuQSmPL0wQ/OfwbsPp0oI/EdNltqzANm/wPigKCV7ERqnwJ+jm+jF/B+Vt
 +VDmCQ7xnY9nODMlqJtQL2FqnIIOVdiEgtmjO+NQE5y9Sla2aGUxPbfSRPmhs9IW/Fzg
 QjG/kiosEl00z3e7phwY0yK6K5DLW7ZzyG7TJnRvHHn59ssIgdyqVq8jl9xU3maKrDTz
 +ObA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoWX8dc1QbmGZ7RCMkDnHXF+2s+NYWaGNPmBw920BsdqAGijs/A29Qi9o/VUQssFqvXr864ykG48eADKV68qmSj3yKjOjzi609OejFGPoAeBzpan0K74JB
X-Gm-Message-State: AOJu0YzweS4xg07uKbk0W8+8cuGpjIKGjdSDbnivUm/s0PrfbfL7TQp2
 Ax58ogQrOVV3CN8vRjlfUcU1+35Ts7Z/oBoIcJZm/AmiWJOGsljsVxXP1s8sPlQ=
X-Google-Smtp-Source: AGHT+IG9rvLxXHys5yM3fiDf+G14AWJNmGoLIu5wSpeGGOXNzHBF3wjPuE24N3ncETdlUUNQNA6oSA==
X-Received: by 2002:a05:620a:45aa:b0:795:4e64:dbbe with SMTP id
 af79cd13be357-798d1f824a7mr1191474185a.0.1718632214915; 
 Mon, 17 Jun 2024 06:50:14 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:14 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:54 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-14-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 14/41] iio: adc: mp2629_adc: make use of
 regmap_clear_bits(), regmap_set_bits()
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
ayB0d2ljZSwgdXNlCnJlZ21hcF9zZXRfYml0cygpLgoKSW5zdGVhZCBvZiB1c2luZyByZWdtYXBf
dXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB2YWwgPSAwLCB1c2UKcmVnbWFwX2NsZWFyX2JpdHMo
KS4KClN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXls
aWJyZS5jb20+ClNpZ25lZC1vZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJy
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL21wMjYyOV9hZGMuYyB8IDE5ICsrKysrKysrLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9tcDI2MjlfYWRjLmMgYi9kcml2ZXJzL2lp
by9hZGMvbXAyNjI5X2FkYy5jCmluZGV4IDdjNjZjMmNkNWJlMi4uNWY2NzI3NjVkNGEyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2lpby9hZGMvbXAyNjI5X2FkYy5jCisrKyBiL2RyaXZlcnMvaWlvL2Fk
Yy9tcDI2MjlfYWRjLmMKQEAgLTEzMSw5ICsxMzEsOCBAQCBzdGF0aWMgaW50IG1wMjYyOV9hZGNf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpbmZvLT5kZXYgPSBkZXY7CiAJ
cGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgaW5kaW9fZGV2KTsKIAotCXJldCA9IHJlZ21hcF91
cGRhdGVfYml0cyhpbmZvLT5yZWdtYXAsIE1QMjYyOV9SRUdfQURDX0NUUkwsCi0JCQkJTVAyNjI5
X0FEQ19TVEFSVCB8IE1QMjYyOV9BRENfQ09OVElOVU9VUywKLQkJCQlNUDI2MjlfQURDX1NUQVJU
IHwgTVAyNjI5X0FEQ19DT05USU5VT1VTKTsKKwlyZXQgPSByZWdtYXBfc2V0X2JpdHMoaW5mby0+
cmVnbWFwLCBNUDI2MjlfUkVHX0FEQ19DVFJMLAorCQkJICAgICAgTVAyNjI5X0FEQ19TVEFSVCB8
IE1QMjYyOV9BRENfQ09OVElOVU9VUyk7CiAJaWYgKHJldCkgewogCQlkZXZfZXJyKGRldiwgImFk
YyBlbmFibGUgZmFpbDogJWRcbiIsIHJldCk7CiAJCXJldHVybiByZXQ7CkBAIC0xNjMsMTAgKzE2
Miw5IEBAIHN0YXRpYyBpbnQgbXAyNjI5X2FkY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCWlpb19tYXBfYXJyYXlfdW5yZWdpc3RlcihpbmRpb19kZXYpOwogCiBmYWlsX2Rp
c2FibGU6Ci0JcmVnbWFwX3VwZGF0ZV9iaXRzKGluZm8tPnJlZ21hcCwgTVAyNjI5X1JFR19BRENf
Q1RSTCwKLQkJCQkJIE1QMjYyOV9BRENfQ09OVElOVU9VUywgMCk7Ci0JcmVnbWFwX3VwZGF0ZV9i
aXRzKGluZm8tPnJlZ21hcCwgTVAyNjI5X1JFR19BRENfQ1RSTCwKLQkJCQkJIE1QMjYyOV9BRENf
U1RBUlQsIDApOworCXJlZ21hcF9jbGVhcl9iaXRzKGluZm8tPnJlZ21hcCwgTVAyNjI5X1JFR19B
RENfQ1RSTCwKKwkJCSAgTVAyNjI5X0FEQ19DT05USU5VT1VTKTsKKwlyZWdtYXBfY2xlYXJfYml0
cyhpbmZvLT5yZWdtYXAsIE1QMjYyOV9SRUdfQURDX0NUUkwsIE1QMjYyOV9BRENfU1RBUlQpOwog
CiAJcmV0dXJuIHJldDsKIH0KQEAgLTE4MCwxMCArMTc4LDkgQEAgc3RhdGljIHZvaWQgbXAyNjI5
X2FkY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWlpb19tYXBfYXJy
YXlfdW5yZWdpc3RlcihpbmRpb19kZXYpOwogCi0JcmVnbWFwX3VwZGF0ZV9iaXRzKGluZm8tPnJl
Z21hcCwgTVAyNjI5X1JFR19BRENfQ1RSTCwKLQkJCQkJIE1QMjYyOV9BRENfQ09OVElOVU9VUywg
MCk7Ci0JcmVnbWFwX3VwZGF0ZV9iaXRzKGluZm8tPnJlZ21hcCwgTVAyNjI5X1JFR19BRENfQ1RS
TCwKLQkJCQkJIE1QMjYyOV9BRENfU1RBUlQsIDApOworCXJlZ21hcF9jbGVhcl9iaXRzKGluZm8t
PnJlZ21hcCwgTVAyNjI5X1JFR19BRENfQ1RSTCwKKwkJCSAgTVAyNjI5X0FEQ19DT05USU5VT1VT
KTsKKwlyZWdtYXBfY2xlYXJfYml0cyhpbmZvLT5yZWdtYXAsIE1QMjYyOV9SRUdfQURDX0NUUkws
IE1QMjYyOV9BRENfU1RBUlQpOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCBtcDI2MjlfYWRjX29mX21hdGNoW10gPSB7CgotLSAKMi40NS4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
