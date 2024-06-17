Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E0B90B013
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DC0DC78002;
	Mon, 17 Jun 2024 13:50:13 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A555BC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:11 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7955f3d4516so481862785a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632210; x=1719237010;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DyBlb3Ba1k/jlth0MsPpVigCEg60zHZmfggBIvSR+YQ=;
 b=OMVnAR7XR/PbYww/CmUrBnwrn65mgiJtP8P91OVW5Vbqs0xU16LMiuD5xdVHu/8ZdI
 sqLM9giXr7dr1l1HVRt/+KYh4CjptS6qbNNyz5hdtg9rZNIeC3JyVsNCEqJtnvheDPg3
 mhfFrMSXTrRrFmeZddM3wttru4xnoHNzvjrpApSnSr/sxF429vyhZy9+NRm1I0GrPIc9
 NpntJKvXtAEfRVojWFL0Y5RzMnEdHmB3XXERGoUJ27SnV09IQathFqQX6kBkqNEaQ2Nb
 1fScbJgXclGnzBnWuwHu00f4TpUpMxj8nq4bXmFJfrjC6ew61gDAwgySGQNNcIGf7Btr
 94LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632210; x=1719237010;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DyBlb3Ba1k/jlth0MsPpVigCEg60zHZmfggBIvSR+YQ=;
 b=TQk2ruHgT2+rG+k8wboy6MvNZQiihNN1EnBO6GgDyHaPwss1gsyDQv3koto37cJAil
 5HcONG9n3s2zf4/5f+owkLsx++N9Hb2+Wq1Onv/nwUIKH6Kn0v/1owKmUvr/+6g+wi9t
 AXcbt5WErxWQkLyPyslfvYXrHBsQ5uSUodidjz2Ljhq7GaY5qh7as4EZVqH4FmAXKd/4
 wfN5Ha2FTuLJT98EzGNVGnjNfKJjQtwAVXZbbSndlE9W6O9T5GEjjkvHFsJNTeYXA2iL
 4qSrPgxgqwcIKDGtq90HSGQ6GQenKciAuutohTOC0RE944KmtJMS8KuCEODf3HrJuxqg
 QpMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5H3WqOr3wxIgfsy7CToF7w4R0n/oJX1g/saVXpGMSFfwFOlibPC/ftJFVFDw+v2/Iq7xnuN6MPvu2W9rkjp+ldO+4KKLPJasD9wly3lH1+5XrS3LsbFva
X-Gm-Message-State: AOJu0YzuZS3f8vyAbprlg/R1pYHiFXVCq0X/vB4imxjzZKK6lBHz5y43
 yTM8cb9swopLIsX2NJYaTN+TG5PM3VpFd1LjllBDEpmben0P+tuvSjTqjukcOwc=
X-Google-Smtp-Source: AGHT+IHWmg+UOH3erM5jeRd6l80OV3UNPvKSawdtaAa099apOKn54lBrRboJnTNNmboBsmxvynve5Q==
X-Received: by 2002:a05:620a:408a:b0:799:b171:b1fe with SMTP id
 af79cd13be357-799b171b5f4mr1409403885a.14.1718632210646; 
 Mon, 17 Jun 2024 06:50:10 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:10 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:52 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-12-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 12/41] iio: adc: intel_mrfld_adc: make use
 of regmap_clear_bits()
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
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL2ludGVs
X21yZmxkX2FkYy5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9pbnRlbF9tcmZsZF9h
ZGMuYyBiL2RyaXZlcnMvaWlvL2FkYy9pbnRlbF9tcmZsZF9hZGMuYwppbmRleCBjN2Y0MGFlNmU2
MDguLjA1OTBhMTI2ZjMyMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vYWRjL2ludGVsX21yZmxk
X2FkYy5jCisrKyBiL2RyaXZlcnMvaWlvL2FkYy9pbnRlbF9tcmZsZF9hZGMuYwpAQCAtODEsOCAr
ODEsOCBAQCBzdGF0aWMgaW50IG1yZmxkX2FkY19zaW5nbGVfY29udihzdHJ1Y3QgaWlvX2RldiAq
aW5kaW9fZGV2LAogCiAJcmVpbml0X2NvbXBsZXRpb24oJmFkYy0+Y29tcGxldGlvbik7CiAKLQly
ZWdtYXBfdXBkYXRlX2JpdHMocmVnbWFwLCBCQ09WRV9NQURDSVJRLCBCQ09WRV9BRENJUlFfQUxM
LCAwKTsKLQlyZWdtYXBfdXBkYXRlX2JpdHMocmVnbWFwLCBCQ09WRV9NSVJRTFZMMSwgQkNPVkVf
TFZMMV9BREMsIDApOworCXJlZ21hcF9jbGVhcl9iaXRzKHJlZ21hcCwgQkNPVkVfTUFEQ0lSUSwg
QkNPVkVfQURDSVJRX0FMTCk7CisJcmVnbWFwX2NsZWFyX2JpdHMocmVnbWFwLCBCQ09WRV9NSVJR
TFZMMSwgQkNPVkVfTFZMMV9BREMpOwogCiAJcmV0ID0gcmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0
KHJlZ21hcCwgQkNPVkVfR1BBRENSRVEsIHJlcSwKIAkJCQkgICAgICAgIShyZXEgJiBCQ09WRV9H
UEFEQ1JFUV9CVVNZKSwKCi0tIAoyLjQ1LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
