Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB1390B039
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:51:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6B87C78013;
	Mon, 17 Jun 2024 13:51:13 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86389C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:51:11 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7953f1dcb01so389098185a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632270; x=1719237070;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DYef8rADT2ijxxEcxYPLN7/oRY6yNh5EaRUGzmb2a/I=;
 b=oLxrHQuBOAdqGsBOyQhAObVxqJZ5OFsPnKCOLfUe/P12O3WpKtekZpiaKfAzk+sACz
 nS7If+uH689qoaWLWp4e+zFwR6ZQ4aK0RK++lhNisYDB2P2sRh+dWpZnVjYFOHjK/RjT
 egEvgyNFUjmNBY4Lw6TPMhtFbSZ6Ovle9nDwj8tx7B3oZ36rH1GtaxJtHKK5asdwF2uS
 +LenzRKzGa9qMn/c81MGRiYLBPxD445eA9oKgmsyd7JI0eTv/JQl5xG+Iuwc3fPb5xxQ
 kqAz9EtMVZ0NOoKG0yOMiGZ2Q/gDkNUgFuUlcNaZt8mRIFUC7em4TCgNpwCZyK9gakOq
 6F5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632270; x=1719237070;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DYef8rADT2ijxxEcxYPLN7/oRY6yNh5EaRUGzmb2a/I=;
 b=a2odZSWKg+AucN83nWU/QmwpN45/ObJvxHdHfg0WPbDa6Tw6RE+FqigDipdOj+ExAp
 EGjj8WwZyQBwH1lW/mfdKgjgMjT9mAs1o+BoGTRC6O9BmRchmtt6ni/cUemjbOnG4LLO
 6gV9OhuI0il2CMGY8Ei7ayps+fpF9SipVMq/YO3ktcmsA95hO1MyFiQ7ohe7YMt/si5V
 M3xQoWA2j6zZs6dv5EQjwO1p26w0qFg9IIWRvC9nC6/0RTwzTsPGFD5+LXGbPXcuaCdZ
 D4zjxHWH16Gtggfh8K8OGFQKu+F6CgSQ9w2wHGhBLWNxaEZNNVVT/7f2s/4jvJv+jEdK
 oN+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGof256mdyTlH+YhjYFFSVQ7K7PmpbeQRoYAO1FWsto/NUhgJm9NyJ1RkV5gDqH6ltzWS/aPdu8Rjf+zhbnWJk3k3FJU9Y7hunxEKFa6uRURf7an69rNvg
X-Gm-Message-State: AOJu0YyO5C25YkHKIY5Fd1aSrO67xKHNhSgs5MmCsxRLMYs1Y7ybuWbG
 hnrXCNg8RGmog2AepLjnt5HoaZeNHvgokOcql0JK90gh85fP6Hmnfc2EPmoXkcs=
X-Google-Smtp-Source: AGHT+IG+NTpXbmfTtgLV5kgHRYZJqicJgvBNrkkmD2PI5YKClqNlpZ4QFEOEqllRaBP9Jcn3G+Ldqw==
X-Received: by 2002:a05:620a:24d5:b0:795:50ef:4030 with SMTP id
 af79cd13be357-798d242f345mr1050763085a.41.1718632270523; 
 Mon, 17 Jun 2024 06:51:10 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:51:10 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:20 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-40-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 40/41] iio: temperature: mlx90632: make use
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
aWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+CkFja2VkLWJ5OiBDcnQgTW9yaSA8Y21v
QG1lbGV4aXMuY29tPgpTaWduZWQtb2ZmLWJ5OiBUcmV2b3IgR2FtYmxpbiA8dGdhbWJsaW5AYmF5
bGlicmUuY29tPgotLS0KIGRyaXZlcnMvaWlvL3RlbXBlcmF0dXJlL21seDkwNjMyLmMgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9paW8vdGVtcGVyYXR1cmUvbWx4OTA2MzIuYyBiL2RyaXZlcnMvaWlv
L3RlbXBlcmF0dXJlL21seDkwNjMyLmMKaW5kZXggOGE1N2JlMTA4NjIwLi5lN2RlMzBmNjEzZDIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL3RlbXBlcmF0dXJlL21seDkwNjMyLmMKKysrIGIvZHJp
dmVycy9paW8vdGVtcGVyYXR1cmUvbWx4OTA2MzIuYwpAQCAtMzM0LDggKzMzNCw4IEBAIHN0YXRp
YyBpbnQgbWx4OTA2MzJfcGVyZm9ybV9tZWFzdXJlbWVudChzdHJ1Y3QgbWx4OTA2MzJfZGF0YSAq
ZGF0YSkKIAl1bnNpZ25lZCBpbnQgcmVnX3N0YXR1czsKIAlpbnQgcmV0OwogCi0JcmV0ID0gcmVn
bWFwX3VwZGF0ZV9iaXRzKGRhdGEtPnJlZ21hcCwgTUxYOTA2MzJfUkVHX1NUQVRVUywKLQkJCQkg
TUxYOTA2MzJfU1RBVF9EQVRBX1JEWSwgMCk7CisJcmV0ID0gcmVnbWFwX2NsZWFyX2JpdHMoZGF0
YS0+cmVnbWFwLCBNTFg5MDYzMl9SRUdfU1RBVFVTLAorCQkJCU1MWDkwNjMyX1NUQVRfREFUQV9S
RFkpOwogCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0OwogCgotLSAKMi40NS4yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
