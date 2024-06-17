Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED95B90CB87
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2024 14:20:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96748C78001;
	Tue, 18 Jun 2024 12:20:58 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50AF0C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 23:22:18 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a6f0dc80ab9so738128066b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 16:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718666538; x=1719271338;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wKRTlIR7nnOjM0KXV8XEYm+3gbeEEjKGhoRIr/a9C1M=;
 b=RDsJiSCajt3CnOGwOajT+gFllncHNthVBzAH6nu+rmgd1fjO9llc5Ytim/Up4pRN5V
 SnyCd63jbqcWYuOzkeVt3u/WU6KjJiaIsxO6kOK1YnlzDs5R4v0/pjphqh0QtEWKjC11
 QCCeRKjDXX6AqvVbW4qiTv5X4yom4iuehKCaNNPdmdlovDWZW8Y573DNdfxRam1UUgmf
 BBkIQ5zkxXLl0HLrUjYSOaYUUA9cm1L1pI6f6TzDwkF6IFSN8usxvOKebwTD/dOUX+FN
 kVHwPAESj1EfjVbhwciNLQ1XrQp/tE8evF7omKyUDWzC1Wl2AVC9V3FA5HFwTDbeRiUk
 hVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718666538; x=1719271338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wKRTlIR7nnOjM0KXV8XEYm+3gbeEEjKGhoRIr/a9C1M=;
 b=VxeopYJfCkL5QiBEAeigZFq5xoWjSIjNLvUoKJBwOnkZ1410Ua+kl/OrZP7l6PRKQB
 P7vCE006wk6MAsYRx4bPqckBBikwF+FJ3kHCbl4TEti6Imtx5lbKaQKGy4lHaLQOKDvp
 W/RawD9RjoI7FdjfK1RxPg2lrEWiknUKdIEdZ10nieicEVme/Tx7BrfFKqvcEGy4AHcA
 tzefLt8pRpnLGsuV4K6A2W1RZQFq6FkZavvyXVZoF1rag/8JpSp01TIYTcERvOEjqgaV
 rsLbIIRkxMP1YkJsqAlaeRmmtR/BTxuLVu6sOZe4g4V5sRrgxfwR1k78xffzz9bYbCMM
 U9UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjT4iYNNUggIXOSsfy3aiEw30GifrOdSKpAtrMpbUAUi7NGt0DN+l+/9g39vxDb4uojra8WYEyu+ZAThQ5Z4u6fgSPBQMxfJ8m+5Lp/1Luqg3ePEECbKHt
X-Gm-Message-State: AOJu0YxRJCEZ7zlIJOYBLv7K0hUIFL9ZSkXE5eK0ahDI1JltY43SlxWC
 6kas+S9C9KL0LnzO2c1XtQ3qXsJjCwB+z2o38E2AedpNiq020xTZ
X-Google-Smtp-Source: AGHT+IGjp3Ii1wNb0dBKA712QfgjfMKbqZ/mXIwxAYEF4EPT50uybie8uvCZMH9EY/OD9lYqsMYbEw==
X-Received: by 2002:a17:906:d18f:b0:a6f:256c:8163 with SMTP id
 a640c23a62f3a-a6f60bca7a3mr697845766b.0.1718666537578; 
 Mon, 17 Jun 2024 16:22:17 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:82:7577:b152:a6ad:d6c8:f0e8])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f6b2b04f5sm411879666b.192.2024.06.17.16.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 16:22:17 -0700 (PDT)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: tgamblin@baylibre.com
Date: Tue, 18 Jun 2024 01:22:12 +0200
Message-Id: <20240617232212.34280-1-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240617-review-v3-35-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-35-88d1338c4cca@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Jun 2024 12:20:57 +0000
Cc: imx@lists.linux.dev, cmo@melexis.com, linux-iio@vger.kernel.org,
 linus.walleij@linaro.org, jmaneyrol@invensense.com, nuno.sa@analog.com,
 sravanhome@gmail.com, ddrokosov@sberdevices.ru, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 lars@metafoo.de, khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 wens@csie.org, bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com,
 orsonzhai@gmail.com, mcoquelin.stm32@gmail.com, Michael.Hennerich@analog.com,
 cosmin.tanislav@analog.com, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, Vasileios Amoiridis <vassilisamir@gmail.com>,
 hdegoede@redhat.com, u.kleine-koenig@baylibre.com,
 baolin.wang@linux.alibaba.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 sbranden@broadcom.com, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 zhang.lyra@gmail.com, shawnguo@kernel.org, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 35/41] iio: pressure: bmp280-core: make
	use of
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

For the bmp280-core.c part, in Patch 35/41:

Tested-By: Vasileios Amoiridis <vassilisamir@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
