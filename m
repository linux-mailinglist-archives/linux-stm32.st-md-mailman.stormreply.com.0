Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE7790B02E
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 446F8C78012;
	Mon, 17 Jun 2024 13:50:59 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60069C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:54 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7955c585af0so274846485a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632253; x=1719237053;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8+9CxU2CvbNCydIwkwVi62wLJsPjXvn/mOpa7x+p1k8=;
 b=23iibYttUxG1YSCcEhl56YFI+4e4kQCr8ukP6ffPmetucsYawmJlQSjn6z9sWx3exr
 aTM0x2RAjI2095pa5FZh9teY5X3GXzyVKmjIrldcupN7F+m4OcguPMqBUMgV1VvAutSw
 qwz1ZKThWJ6VGQWRgpH9eF1goEgUp4HoidlBNAvKG988LFXPnkkvEVhyblUbvagZqYed
 qM12Jq4jvKZCDutRoinSeux7pfMeTPrxZodxMhI0/flrNA5d5B3Fh61BSM3RJUnsDOaO
 5jR+i8AGUlw1EOhlmgaWNgUVTh2RnOhYsMGTJD9YQve6eOSIdSukFaS7KX2j/wQM52Ix
 3/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632253; x=1719237053;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8+9CxU2CvbNCydIwkwVi62wLJsPjXvn/mOpa7x+p1k8=;
 b=kvaIYjSUfPo64l/TCDzWEVtMejpNLT3hw0ZmzJ1n2biW3WMLwNwRLKc71ZfNVZmgTi
 q15/F8SME8dkKLAsPtoHRybJm+9JUeDPmB6IC0hBn/n90/bG5FqFIHfp7W2UmAWW8WCe
 soYCqBx3ZsPsfPWBjSKVjQWG8vzhzXF+HrfJylhJ9z2QFlUac0DT1MEuS2FOnhMungda
 RE/Fnd6t7wB8bNY4wF71JkKoUvSOljj4zsvSk1n4oCtyiJeQ/lloPf1dkk7y+4lrKJGD
 X/LWzpr0ElLwaIyU8pzV7XTZOf2uQ7JGt8SSwtn/9tSgsmPrk0uP2TjS/b+Y7/E+7krE
 9Emw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA3WKc/Y+2RgBfXwiEDJy2IMw1Ad0dD/3zKUx5UE5a0GaQXa4CpcENyq4ftY0Eqk4pvVzxb2VMCEkQQP2zuj5/t1BnPDQw/4sWWfsIHT39Yz6mc89WntqV
X-Gm-Message-State: AOJu0Yyb1VwYp4jmGoy7QKCvFWTw63KfqNBh9CPqt3xNPoHStCcElBZA
 TprNJmHLLuSgCmlhh90x881cFlQRl7HzXNvfjcuKiKNpDFi2Zj5EfAzSPCOROWo=
X-Google-Smtp-Source: AGHT+IF0QBpD3doG6Fp1c+vnf+YJQ81FC5gB6//3DNzmC1F9GzI4GVFvf6U3tYk3LEdICO36nL3YKg==
X-Received: by 2002:a05:620a:2a0a:b0:795:5c3e:eb45 with SMTP id
 af79cd13be357-798d2531f98mr1137480985a.34.1718632253384; 
 Mon, 17 Jun 2024 06:50:53 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:53 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:12 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-32-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 32/41] iio: light: veml6030: make use of
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
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vbGlnaHQvdmVt
bDYwMzAuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9saWdodC92ZW1sNjAzMC5jIGIvZHJp
dmVycy9paW8vbGlnaHQvdmVtbDYwMzAuYwppbmRleCAwNDNmMjMzZDliZGIuLmY3Y2NiY2U0NWYz
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vbGlnaHQvdmVtbDYwMzAuYworKysgYi9kcml2ZXJz
L2lpby9saWdodC92ZW1sNjAzMC5jCkBAIC0xNDQsOCArMTQ0LDggQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgdmVtbDYwMzBfZXZlbnRfYXR0cl9ncm91cCA9IHsKIAogc3Rh
dGljIGludCB2ZW1sNjAzMF9hbHNfcHdyX29uKHN0cnVjdCB2ZW1sNjAzMF9kYXRhICpkYXRhKQog
ewotCXJldHVybiByZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFwLCBWRU1MNjAzMF9SRUdf
QUxTX0NPTkYsCi0JCQkJIFZFTUw2MDMwX0FMU19TRCwgMCk7CisJcmV0dXJuIHJlZ21hcF9jbGVh
cl9iaXRzKGRhdGEtPnJlZ21hcCwgVkVNTDYwMzBfUkVHX0FMU19DT05GLAorCQkJCSBWRU1MNjAz
MF9BTFNfU0QpOwogfQogCiBzdGF0aWMgaW50IHZlbWw2MDMwX2Fsc19zaHV0X2Rvd24oc3RydWN0
IHZlbWw2MDMwX2RhdGEgKmRhdGEpCgotLSAKMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
