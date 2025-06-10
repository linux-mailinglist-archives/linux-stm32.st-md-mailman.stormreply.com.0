Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FACAD2FFA
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jun 2025 10:23:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F619C36B38;
	Tue, 10 Jun 2025 08:23:31 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42335C36B2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 08:23:31 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-450d0526132so2289955e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 01:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749543810; x=1750148610;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CbFRS50PxBtzhNgDQ/26OkD0E53SIgINiCNYBdMhaMs=;
 b=PMu6gwjcqpKMFY1VKb0dqtWSTFfRaNbdi5xkyo5lNAyRGuawdo+RbZ/5bGbRX/qa44
 dv41DqXs1TSTraNe1VwqGEIvdYEW35KtCSPCUcB5lA2pZsOI4t9AzVDvITh2j8R4UeZJ
 GU1/pwOlX/bCHZkP0eF2sw9RG9dxsBlfMlppxFbSCVKoPN21OLkhxt/UbS94jv1iTVn9
 cfj8p8oE/2sYpaa1Ysj23C561Ok8MQQe85ohwAj0w155MGSn813GZG8QH5aKrSsbFhdo
 w0OB6Uw0kyNG2rPu5xuPiePqzMFafch0smKt9BHojxafIFeIUoxxpJ231S33LFMu9LHp
 ErtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749543810; x=1750148610;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CbFRS50PxBtzhNgDQ/26OkD0E53SIgINiCNYBdMhaMs=;
 b=ch0AI5nX8RmZFxzE9hJRAR/WOPMnKogtmzEgLyFGltcCb8+KQLQK01FhmF/WE4cvrv
 g8ovX3hkh5yPNL4y43n+5yKw/n4KqAkWLkEIFO+bLdKLJvbNT74XlNHP+UmUSnZiac4x
 3ax7vGBL85dZZ0XtWqS9s21izJDN3zAD2K93xYxc4vunMUEWXl2LGXAOQGlSIlbeKQtQ
 TZTABLD3wA6Eo5GPjKWFtiLxoZK9YX/HAFWAHkwZEgquvFqDInwGfZMK8tl4oJb31x0f
 Ov41TGjGSFSlBc2CrW1S+0aKeKzDuoq3kKgTKeuV07PZ8J+iJkfKY/Le4rBB3knwg6Tl
 Fxfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWhUi7iXuBuHos0eh/eu00qU5TAL9wLm8zrhyProIVw/kjbq/8Bh82lIHMZzq375zaVX1c4PED/XJjSg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YysbS8wbbcwazge+tuO62bt8zL48sESJhGc5O9GR7Tp8VHGXBNw
 OBC5Z4pXu/P6kidicacqzz6oQNNqKV3f2uzKM9p1xzhRoZRFRA4UPmH4YFvUn1Q6eTY=
X-Gm-Gg: ASbGncvpJzfnpgw3Pc9EoO4jtEd29/CX32mUtF6lUV1Xvb4k97aTcwAqJJWiIQ7Y+Do
 3CaZzdcrcCznNw22vUNFDraK0OrJ5B2sOTxcirjTQgrn8qqMiSDfkMzkLev2PxYjkKPYBf0sKnd
 TkhKcZxtD3umLTP5cddP0NrpdS/PK4RGcQwCb1jPmD49L/JQxTtGR/yq+sF4saYVpsPNiaufUbz
 mc9S3Ltq7YFgSpFVeQfOGKI7/w7sDN/DCmDfiIQjH2ZXqLxnbuuhgSTnzMKGno+BTcwxMThx1Xu
 Dj4tq1bG6aQG/hMqnrJ4Ogata7DqxrMQTEMe2iipZQaOnXwdPbhcEWNfLNfLI9GHLomGX1ZQu77
 oF/vu/g==
X-Google-Smtp-Source: AGHT+IGuYXZh60MnbA75lkN4+EYNXF7PNeMVfx0sLkMy+S89GOUa8ZzBhu0Y6PM8zBmmRjjQtSKupg==
X-Received: by 2002:a05:600c:c491:b0:439:8c80:6aee with SMTP id
 5b1f17b1804b1-452014b3fdfmr47660345e9.4.1749543810522; 
 Tue, 10 Jun 2025 01:23:30 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4526e155ce7sm131726125e9.10.2025.06.10.01.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 01:23:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250525191300.50873-2-krzysztof.kozlowski@linaro.org>
References: <20250525191300.50873-2-krzysztof.kozlowski@linaro.org>
Message-Id: <174954380836.117761.16870623685676642048.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:23:28 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Subject: Re: [Linux-stm32] [PATCH] memory: stm32_omm: Use
 syscon_regmap_lookup_by_phandle_args
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


On Sun, 25 May 2025 21:13:00 +0200, Krzysztof Kozlowski wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> 

Applied, thanks!

[1/1] memory: stm32_omm: Use syscon_regmap_lookup_by_phandle_args
      https://git.kernel.org/krzk/linux-mem-ctrl/c/6d8b18ae647bb456d2a2dac9771d007f243537cf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
