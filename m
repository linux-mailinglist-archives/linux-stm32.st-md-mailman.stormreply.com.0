Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D459B90B28D
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 16:42:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AC25C69067;
	Mon, 17 Jun 2024 14:42:34 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED088C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 14:42:26 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-57c61165af6so5788357a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 07:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718635346; x=1719240146;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=E2YQNX6Tuz8HfUHpOihGxh9fyCb+mnp+I4qgACuBpKE=;
 b=nJO/t57IUbaXlO/ITpMBvKBYFr2YB3uZG70YPZKGVlpE6X4qqdQXgHSPVCGv8Ot0f9
 ncfb+xnZHifbHfogkqPVl3GGC/M41Gshp9Xf/JLF3uwnQplyU16qQSKV8/NMN+17i2cx
 UAzChnaR+Cpq7OyyWm5yqLQ5lrF7zNkX3wSaK3h6lKSw2XHCVXha0Q/v1kfE8rFQQHdd
 6wldcnyO50uMuHUa8KW8iq665wFTMFpDCsrAbyk16y3l0B0P459tLFABfAGEgYrj0dUz
 7E47NWPmlYkeo85K39npJC/C4wHNr/Ivr2+UWBMJwK3AIUq+k8njQadY5bOSMiJzDaIr
 sMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718635346; x=1719240146;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E2YQNX6Tuz8HfUHpOihGxh9fyCb+mnp+I4qgACuBpKE=;
 b=h8akcbuivAP1yYBz+4eeo1rNvRYCyc5wzhX6oic/VOJ6/EO4hLshGnd/nGWTedevZ5
 U8gphGbzqL+FSEDRNvr+CQ9PCIzrKZOmZUPLiIwmGJh1EroayIoG/QinVqOPp+WvDlSy
 hnXDZgnnP7uFNZID4s9qwJErva+tQynvOkVBSFqkTEVMlUYyDjIIgO50K76VF9GfExf6
 5tM9HS6PF6Cr/hms0WzN17fxX5A2s8go0JBoW6fV2jGQ1UwwAmHfSoK1+AFF1zTch1YC
 dOtMu+wI2X8RgPxo+lodGoIrUTYVcL4XFfom0oxqYSb+uo1EBw2tWkyC84LveugXc8DQ
 KM0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR9RkHWW3SnF9H9wuZHwiIoEfhymfmSeAlooreeWOPbiyN9RTcalCTy8JLbWnucAJXWFzftfq6GxayrsEVTdJFBvZqCm5v00GNjh9snJN2vfSgB9IBmPHe
X-Gm-Message-State: AOJu0YxBzSVxnvCgknAis2u98gn46DjW9W1br/GJ16JVbyjaK9kuDBvj
 J0G26qdZ1HxYCQcZE/G3KqxPQJFcDrnAHt0ARymkCAjFSRTEozr/
X-Google-Smtp-Source: AGHT+IGkzpQ7qdmk73JHhNvar3yzbeO/0JuLTETghlv9ovmWg6RAvgWc3MKokHO04h0aGO4cAJzoZA==
X-Received: by 2002:a50:8753:0:b0:578:6378:bc4 with SMTP id
 4fb4d7f45d1cf-57cbd69d997mr5941494a12.10.1718635346075; 
 Mon, 17 Jun 2024 07:42:26 -0700 (PDT)
Received: from ?IPv6:2001:a61:35f9:9001:40df:88bb:5090:7ab6?
 ([2001:a61:35f9:9001:40df:88bb:5090:7ab6])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb743890dsm6514525a12.83.2024.06.17.07.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 07:42:25 -0700 (PDT)
Message-ID: <a818344871a1dd2bf139732a7de9016ece456288.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Trevor Gamblin <tgamblin@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>,  Lars-Peter Clausen <lars@metafoo.de>, Dmitry Rokosov
 <ddrokosov@sberdevices.ru>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>,  Chen-Yu Tsai <wens@csie.org>, Hans de Goede
 <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>,  Scott Branden
 <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Saravanan Sekar
 <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>,  Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Crt Mori
 <cmo@melexis.com>
Date: Mon, 17 Jun 2024 16:42:24 +0200
In-Reply-To: <20240617-review-v3-4-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
 <20240617-review-v3-4-88d1338c4cca@baylibre.com>
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 04/41] iio: adc: ad4130: make use of
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

T24gTW9uLCAyMDI0LTA2LTE3IGF0IDA5OjQ5IC0wNDAwLCBUcmV2b3IgR2FtYmxpbiB3cm90ZToK
PiBJbnN0ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRhdGVfYml0cygpIGFuZCBwYXNzaW5nIHZhbCA9
IDAsIHVzZQo+IHJlZ21hcF9jbGVhcl9iaXRzKCkuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBVd2UgS2xl
aW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBUcmV2b3IgR2FtYmxpbiA8dGdhbWJsaW5AYmF5bGlicmUuY29tPgo+IC0tLQoKUmV2aWV3ZWQt
Ynk6IE51bm8gU2EgPG51bm8uc2FAYW5hbG9nLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
