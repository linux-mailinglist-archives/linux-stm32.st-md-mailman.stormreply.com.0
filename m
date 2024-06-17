Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7135090B00C
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3704CC78002;
	Mon, 17 Jun 2024 13:50:02 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8C51C78001
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:00 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-797b24b8944so418358885a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632200; x=1719237000;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YrcJbk8xCEXw8t4EaXrcTeVF+NCC1LSKzcpZFP4BG5g=;
 b=l2td2rKU92QBOsjr70oupbjr/QcDkyMmydaRmPCI6lQKZ8S5qcJXnCl9/T6s+8F/Ud
 c57UCHkw9VVg24HOzaRLeOBF9VZko8IXTgxLKuPIIWs+jdCH5flmGzZ3317gJ3rrJuPj
 LBhoDp6rwbEAKOLo6xW5WNfoPo08g/Uoqt+C42ikmWIDtwBGLhblk5kLa1vVjpA1wSS0
 HoGpnixPDGZLt3FkiU4t5VZX9BegzlPLp4LJ7+8voVW8H4CzlJxWx5hRCfzciOgly/vI
 X392AEtuu16d1YBhUoZAc2zh64yUfJsz7oLENat0/v0+uadGMuYMYEJnmCZ3jOmfOku2
 TMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632200; x=1719237000;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YrcJbk8xCEXw8t4EaXrcTeVF+NCC1LSKzcpZFP4BG5g=;
 b=WSktz0faoj5/iC5smuVvlSmo/i78RnQEZrbldR8Qo1or57fqBB+aTiE5gyG3IJ/R7I
 6zfUBXNPyPRRfhy/W1Pw0gQPwY3nH2GCZfhLLmmzvArpZfJHrikqqIzjMZypiI8au0/L
 wIcUI/B0eYWllFURwL4icH6oIIC/r/4/2SsOZA8jQPsv1jNZV8k5iT58xGuCQ++2hkrO
 h4PUzj0MpgkJSm9EDjTwJZFjUr8RVYSFbk5Cwgs2vF+FGOBSY+l5fiNPG7fybZONwqtf
 H9yi3BpRsBtoDq8SRqkF481EN9i5uGNGqHBI+KsJh0h+NVcTaeVln0zE73XOvxkKKyM7
 eOdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUjjc/arR5takR3fmaAw3PO2bIBLzCIIT8anguamdhPKZ7GR1Cg6WctCsn8QMs85zDgEKgQPLAbOr1nfS9VHdfxq7lWarDWwXa6cd/oVe+/7BVD4k8OAzU
X-Gm-Message-State: AOJu0Yx1yqHsG0FSdNZnfSeuFGGDZnXBtn8w41AfSnW07BkrXTrXJt5r
 qdV+ZmCfp2J00y1XGJXlaoyxdCVOsj+ydun/NxSrG2LYxvnWpLw+LawSlYQdLUc=
X-Google-Smtp-Source: AGHT+IE5uBXfLurzd0jxJqKEavsP5xlBerQNz/5zZPhVz/sS8JYp4QTVcbxX+BgweFysUZBWMYLagg==
X-Received: by 2002:a05:620a:1a81:b0:795:4e35:ea9d with SMTP id
 af79cd13be357-798d2692fc4mr1312471985a.60.1718632199656; 
 Mon, 17 Jun 2024 06:49:59 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:49:59 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:47 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-7-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 07/41] iio: adc: bcm_iproc_adc: make use of
 regmap_clear_bits()
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

SW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB2YWwgPSAw
LCB1c2UKcmVnbWFwX2NsZWFyX2JpdHMoKS4KClN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7Zu
aWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+ClNpZ25lZC1vZmYtYnk6IFRyZXZvciBH
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL2JjbV9p
cHJvY19hZGMuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL2JjbV9pcHJvY19h
ZGMuYyBiL2RyaXZlcnMvaWlvL2FkYy9iY21faXByb2NfYWRjLmMKaW5kZXggNWJjNTE0YmQ1ZWJj
Li42YmMxNDljNTE0MTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2FkYy9iY21faXByb2NfYWRj
LmMKKysrIGIvZHJpdmVycy9paW8vYWRjL2JjbV9pcHJvY19hZGMuYwpAQCAtMzU3LDggKzM1Nyw4
IEBAIHN0YXRpYyBpbnQgaXByb2NfYWRjX2VuYWJsZShzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2
KQogCWludCByZXQ7CiAKIAkvKiBTZXQgaV9hbXV4ID0gM2InMDAwLCBzZWxlY3QgY2hhbm5lbCAw
ICovCi0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGFkY19wcml2LT5yZWdtYXAsIElQUk9DX0FO
QUxPR19DT05UUk9MLAotCQkJCUlQUk9DX0FEQ19DSEFOTkVMX1NFTF9NQVNLLCAwKTsKKwlyZXQg
PSByZWdtYXBfY2xlYXJfYml0cyhhZGNfcHJpdi0+cmVnbWFwLCBJUFJPQ19BTkFMT0dfQ09OVFJP
TCwKKwkJCQlJUFJPQ19BRENfQ0hBTk5FTF9TRUxfTUFTSyk7CiAJaWYgKHJldCkgewogCQlkZXZf
ZXJyKCZpbmRpb19kZXYtPmRldiwKIAkJCSJmYWlsZWQgdG8gd3JpdGUgSVBST0NfQU5BTE9HX0NP
TlRST0wgJWRcbiIsIHJldCk7CkBAIC01NDMsOCArNTQzLDggQEAgc3RhdGljIGludCBpcHJvY19h
ZGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAoYWRjX3ByaXYtPmly
cW5vIDwgMCkKIAkJcmV0dXJuIGFkY19wcml2LT5pcnFubzsKIAotCXJldCA9IHJlZ21hcF91cGRh
dGVfYml0cyhhZGNfcHJpdi0+cmVnbWFwLCBJUFJPQ19SRUdDVEwyLAotCQkJCUlQUk9DX0FEQ19B
VVhJTl9TQ0FOX0VOQSwgMCk7CisJcmV0ID0gcmVnbWFwX2NsZWFyX2JpdHMoYWRjX3ByaXYtPnJl
Z21hcCwgSVBST0NfUkVHQ1RMMiwKKwkJCQlJUFJPQ19BRENfQVVYSU5fU0NBTl9FTkEpOwogCWlm
IChyZXQpIHsKIAkJZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIHdyaXRlIElQUk9DX1JF
R0NUTDIgJWRcbiIsIHJldCk7CiAJCXJldHVybiByZXQ7CgotLSAKMi40NS4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
