Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 029D588CE42
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 21:24:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B83CFC71287;
	Tue, 26 Mar 2024 20:24:13 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24321C71281
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 20:24:12 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a44665605f3so705935366b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 13:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711484651; x=1712089451;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=r8vNMvR/OqCzTXRIjmHHetW4mCviwFQpqMvTFrU4HAQ=;
 b=m8JWVpk5nz+J97RHdpxt6KnOvm6qrkcBilSST4jyQxuRsK/qgYOxKiE6lWZLbNXMtj
 DaPtHgDFk+BN2bNZKNlRhTji6OqqRgBt0wPQ/rItSy4BtyKaBeKFC88uQrOWmkHl18Qi
 jM49xebNq775Z8l+prNrggyR77E3VjaGG8Ihg/J1ge1NIQMBVjACaRVYxY4zKWeO6upC
 dmsFdXk1iYEMYml1rYcCIl3nps2Y/7bGIyNjdmV0JfAc+4pSomTOib4buZb76/yMql7l
 JbidcDyO4+RuOPyoGwM5A8n2EDBMqnJcbId0iTOvYZ2wAKCcZZMzgQuK76ul5p5dygrP
 nTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484651; x=1712089451;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r8vNMvR/OqCzTXRIjmHHetW4mCviwFQpqMvTFrU4HAQ=;
 b=l7iCF24ebX5sGvBYDe/ETdY+jryWPHr5FKB5mqcYGyfCtCFUK2GRoG8a+/db/bq9kj
 e9xGjcEjl6hJeVelUZrkdhHWeRzznrnnbogTns9G83VrtQaKH0PvYQ0hewOdqb46Qory
 fHmqVCLwo8kYmR0/Yz2gjA3g8vDKLe72cIRfmtkfhxWPyfSaWNr9jddv02qh9LXu1f87
 94vQhlCsUUG1Pp7HhzK7X0jFyWJAvTp78tynv4INVnLAD8Ip1iUGjf4j3asLUkiNF1In
 YMsFFe9EqMx53m5QkJ5l1ZKPSg2Dps+Ligw71pfanrAnR5MEVW5QrIghcu6jUq8FAeeX
 JC2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIiC68sUasfu9QMVqPzAQ7exlD1XAg4O9xXCemt4jI19kTbDE9fN6Id1F6BGlrhZc94s7u34GDJIh5O60gfMGW78G8T7YTfuLNhYlO+uTK/Qec/5FNb+qU
X-Gm-Message-State: AOJu0Yx8uh8AKmeI+NWnQVtKFj0bK462iv0SiXUatVaAeGeiJA5cj3/P
 aJ6vYsnmPvEmmdHnhRpC+MdI8KtV/IXgzm40kE6/3xoHaHY84H0CCGOoi/aHL3I=
X-Google-Smtp-Source: AGHT+IFb4JEt2HEwLreIO/b4GLNhMD6s6Nzsjk02Z8m3sgEQ5lUEmRg8HRX0TbD5U8VN/PyYeY8C4w==
X-Received: by 2002:a17:906:1713:b0:a47:3378:48f4 with SMTP id
 c19-20020a170906171300b00a47337848f4mr534451eje.35.1711484651709; 
 Tue, 26 Mar 2024 13:24:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:24:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:36 +0100
MIME-Version: 1.0
Message-Id: <20240326-module-owner-amba-v1-6-4517b091385b@linaro.org>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
In-Reply-To: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=771;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qJLPwum/AqfspnIzmOWzjV1qrgzPZNJu8uLTx/4rahU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7Qj2fX0r64FyoRM6EkM5j80xY3af0pmQvFg
 5BtZqFcjQmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu0AAKCRDBN2bmhouD
 1yzGD/4+JGxstrlsdoGYXZj4Ccq4FlQ4VMQFVLyDR7OuFttT2Y1L6Ak9C3zCZZH3Tb/bTppGteK
 ERowKV3waVO5ki0+f6G1rO3fqJn4srZhbqcx70gZurYIkOx8fX4j2qOJAOeYJtVm3ZiQTMsXQAv
 +cPaJulOwu1vBCC7/VjmfQz3ZWkQzHhV3gOQ/6RCjlmflitrfMC3T3v7bqUf2Jm/4MFTW+vYd6K
 dcOUoVmnwq0YDW+IECWoEawjWsU/IeJb64FZDnTF73pcwbZGi8QLGoC0WFO61LjqAXC0tNK1dUr
 hw/oFUL8O9uuhglMRm6kE0XdanRQUedGCFzK0ouqZZow4/x7EMa5C+X8JvVkrASkB2VfWVJmbOm
 DTIeVDfzcI6hr+ZZbAc1dvIqWf2TMTUKKGt4tPz/pOUwVg1KLi7nsDd+r5P6WZHlqvnhwpzusCQ
 CxPZrqUXumahYa5rssLLQWl8N2pE7qWBeFKJMpagZo409EEo5KuHWjU9j2p3378JVPiiInfmaxE
 JawL+ByFkETQw7RNwMOHJlUY6hQYCaGUmGzyx7FsIQR/86JIsrARRnq2M3qx+sKqHR+e6OFbpGx
 bwqotl6/tN4sf28DppeTKsvCy9FiaYdFjeGGb4FzBiW/sEXNLFoPXIGrmvztGjfYYVstUpVC4Sl
 9Wf5eZ2xqdbvs2w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH 06/19] coresight: funnel: drop owner assignment
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

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwtracing/coresight/coresight-funnel.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index ef1a0abfee4e..5ab1f592917a 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -399,7 +399,6 @@ MODULE_DEVICE_TABLE(amba, dynamic_funnel_ids);
 static struct amba_driver dynamic_funnel_driver = {
 	.drv = {
 		.name	= "coresight-dynamic-funnel",
-		.owner	= THIS_MODULE,
 		.pm	= &funnel_dev_pm_ops,
 		.suppress_bind_attrs = true,
 	},

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
