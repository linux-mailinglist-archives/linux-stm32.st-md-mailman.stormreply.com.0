Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 177E990B01F
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2116C78002;
	Mon, 17 Jun 2024 13:50:31 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04060C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:31 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7953f1dcb01so389062385a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632230; x=1719237030;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DerxFnnoYXb7MP4GOUVN2xlgxjAao77OyLSOrDCydO0=;
 b=g/3HR2xQHI3FcgB0jbLzSFLqrka9eHJ2dTR7As6vYP1/JpuHUvyxCcZdDM3dx2YD81
 Jf8zV3q9v33qj8XIpMlRqM8V1mDaPayAzAMvXF6+2IU9ThDOhnU84CLtLCDA8M6lNDCf
 tdhcFcwe1rLgHgg+aPvNZ9iQb6kK1zS+oy6hyamjqXQADGgjOZVnnlVZucFN4XRv5Rre
 0iCTq8C6ZJ/goMTKVcf1aFP1OV2Lea7mDlMDiFt63OqWcvm+GY+8P6K04pNHh5sjQ1Jk
 UqBrlt7Qssxji7Sg6ooQKRKhtZwxHAr+yTAAyB3lHl4Q/sgk1cBLFYMfutcLSC+bhvOK
 TC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632230; x=1719237030;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DerxFnnoYXb7MP4GOUVN2xlgxjAao77OyLSOrDCydO0=;
 b=NN6L3QsZYiwhByv6G51vOOPHUYk/NletmX70DFV5oL2EW51aCRVijnC9B/OW0IkfTM
 MaR50oiguwrBYaeMcm1F0TC8N+ZOJQsa+YX4ziR10obmEkEIQ7OdW9aFPwclFFQhRRnt
 6MwjNIA7n/6Dc3uIn8j9lrmcQVDlGLBvrschEIexxXjldWZ+mycI3zvpOF0NtV0faWCj
 h8l2suKsc522FfRSzt+vj3738sM2g8sdDY09bk/saadwmgPYCHkXsP7UrMStaKA6w2Z6
 RxwAX4XcQyVAcDvFHbAM4hOoUfg47mu9/zRqLbwrtaldI1E6LGOVx5qZWAG61fOWPBO1
 ibNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIcmpndknFclK4/yQQDNyvote1eupWxh7nF+24HI/FJTikf2G0/e0i1D5LoR0a7c3zdJeQMiBCaE3D4PTpK/BpDYFl10sQ0ZfGw1/jc5GtxlcLQz/NVR15
X-Gm-Message-State: AOJu0YwNn4/dsCf4cVSHe4ZIA/qFmKMsZyLTc/QXMMmtKBdrU061ujvm
 ZABc+CnOzoHBMS1/8bbaIQby7HfYOG5VXXG2eROe0sYs5yd7K3PPAFL58n5KmMA=
X-Google-Smtp-Source: AGHT+IHxtzkdFJwlDchh8tO2N+M/GUfc/zgUMeSNzO08CBN63HSCP+uPJVwg8RWxzdMRcwiKU/TPZA==
X-Received: by 2002:a05:620a:2443:b0:795:4e2c:eabf with SMTP id
 af79cd13be357-798d240dcf1mr1259752585a.26.1718632229931; 
 Mon, 17 Jun 2024 06:50:29 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:29 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:01 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-21-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 21/41] iio: gyro: bmg160_core: make use of
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
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vZ3lyby9ibWcx
NjBfY29yZS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2d5cm8vYm1nMTYwX2NvcmUuYyBi
L2RyaXZlcnMvaWlvL2d5cm8vYm1nMTYwX2NvcmUuYwppbmRleCAwZTJlYjBlOTgyMzUuLjEwNzI4
ZDVjY2FlMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vZ3lyby9ibWcxNjBfY29yZS5jCisrKyBi
L2RyaXZlcnMvaWlvL2d5cm8vYm1nMTYwX2NvcmUuYwpAQCAtMjg1LDggKzI4NSw4IEBAIHN0YXRp
YyBpbnQgYm1nMTYwX2NoaXBfaW5pdChzdHJ1Y3QgYm1nMTYwX2RhdGEgKmRhdGEpCiAJZGF0YS0+
c2xvcGVfdGhyZXMgPSB2YWw7CiAKIAkvKiBTZXQgZGVmYXVsdCBpbnRlcnJ1cHQgbW9kZSAqLwot
CXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhkYXRhLT5yZWdtYXAsIEJNRzE2MF9SRUdfSU5UX0VO
XzEsCi0JCQkJIEJNRzE2MF9JTlQxX0JJVF9PRCwgMCk7CisJcmV0ID0gcmVnbWFwX2NsZWFyX2Jp
dHMoZGF0YS0+cmVnbWFwLCBCTUcxNjBfUkVHX0lOVF9FTl8xLAorCQkJCUJNRzE2MF9JTlQxX0JJ
VF9PRCk7CiAJaWYgKHJldCA8IDApIHsKIAkJZGV2X2VycihkZXYsICJFcnJvciB1cGRhdGluZyBi
aXRzIGluIHJlZ19pbnRfZW5fMVxuIik7CiAJCXJldHVybiByZXQ7CgotLSAKMi40NS4yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
