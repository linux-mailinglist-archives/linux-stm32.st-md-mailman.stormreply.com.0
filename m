Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7ADAB2FC1
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 08:38:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66A78C78F8C;
	Mon, 12 May 2025 06:38:39 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D9FEC78F87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 06:38:38 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5fad4f524e4so531878a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 May 2025 23:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747031917; x=1747636717;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7vkhL0nOODbXgDR4wi4Zsc+hIMhl6G/kmLyU640sopY=;
 b=COOGLrDB2/xLU7Wh2sZxs7rYqLy+nsDIQvujRBWoFSTH7RPaLRd4z8S2T5kl0heMVg
 DF9ebS92vFyCs9BqyL9BvTItdka51kVUmengVsl4unPy2QiXdpCiZDe0+0o1WbujCXVx
 bhmjtI/GdNERg/mv6DbZ5MdKjhMvNmBqPnYc152X9A+H3JBoIpUCRdgs3t2UekxCQERh
 naScizrR+Ep+Arf8YHGNY5+2vVQE0fdrVNI+wWfi8slLqaNOP1yFiMlaYTNXfse+AgKm
 yqFhNpkHZoLvSkUvvyxUP4gjv02aUIalEw4siGbBQIqlj8F+Ss/MdFbn8jk6BpkKCpkI
 NESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747031917; x=1747636717;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7vkhL0nOODbXgDR4wi4Zsc+hIMhl6G/kmLyU640sopY=;
 b=FPjLhQk42I2LAoZzo3qQk7oKiZ5re2i5kHJ7gDI8znRzjap36kkF+xmnYbRDYJTBan
 2ig9trguWgXt+FsEDFmhIxPfqqfNAsrEhtQ97xXduRMFQUAnjjlLI1npdp+xTu7InUek
 CYBPPadMg5v7UoKNR4L5vZyNXaROI6op6oIYO+gKlj2NJqI9qvkzSkia2R3YAEKCZRBY
 B+LXEQBtE/stTSTr749V7VwIFKNJoGONO3AE3nATiQ3JBs3VJWa+rOjhjF28DFLHiPZm
 33F3SBw7m4DUsNZDRx86Ye/fWTg+iJb/zBY5sAB6u8tiPhtV/UjTmCcxuZ2VhvnEt5dW
 PF5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG4C6d3IlPWFwllx0Df4jUsGgfA8QTXrPd8ynb3Ta6Scz0zx5xtGgYWsa7gCOP/N0Zl9LMSsqujN1NAw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzyOe63ySz8rD5FumXEYuyYFEcVoz/097zwCd2l3go79AVb6dTV
 6sezoEHF5s720UiMzq5qDWg+pCZaYpwESMZjI/WSrwM4APm9wpUnbhFw6VAl0QM=
X-Gm-Gg: ASbGncvF8VVZDkzcbzK7hAuDEYqwaqFTkfJCzJp0wFrbFL1gR2hMj0wm0xOWPPkW6f5
 GXIRO09GTSCpE3wVsq7dewnCml/WbhptUZwCvTDf8g8sGAV4iau1PhPUjaksUYpFyKcc7q/dB1o
 onJy+jUDsy3PCjmIfGlg7t22XaKLxklTckUmrN31RdsMaewZSZcvLmDXf2eHnvorq3eAaZ0kP2J
 y7It/V34x20iekt2Ow64zIi84Cay6FljQ2rueFS9n8u4vTgCv70kCuVty4FmCdPdQpZCc3a9Tlq
 w8tGgcEVbOOKQlp2Bd/HdbQPPCXQnUqVTmSLxe72C3PMBBcFo6obUD5EzisbOOUu8F4ei4A=
X-Google-Smtp-Source: AGHT+IFiYR8aqbHYam+4dCJWIuEBLrMR51O5qEO8DmYKMA5elm1tOP7pc2ZsyT0EJd9dssnjv/KG+A==
X-Received: by 2002:a05:6402:4309:b0:5f8:e24b:c8c1 with SMTP id
 4fb4d7f45d1cf-5fca10e40bbmr4214805a12.9.1747031917576; 
 Sun, 11 May 2025 23:38:37 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.234])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9d700e92sm5210075a12.55.2025.05.11.23.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 May 2025 23:38:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Colin Ian King <colin.i.king@gmail.com>
In-Reply-To: <20250509104459.28167-1-colin.i.king@gmail.com>
References: <20250509104459.28167-1-colin.i.king@gmail.com>
Message-Id: <174703191639.30920.15410579051169981008.b4-ty@linaro.org>
Date: Mon, 12 May 2025 08:38:36 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH][next] memory: stm32: Fix spelling mistake
 "resset" -> "reset"
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


On Fri, 09 May 2025 11:44:58 +0100, Colin Ian King wrote:
> There is a spelling mistake in a dev_err message. Fix it.
> 
> 

Applied, thanks!

[1/1] memory: stm32: Fix spelling mistake "resset" -> "reset"
      https://git.kernel.org/krzk/linux-mem-ctrl/c/9c03507fcd6feae37a94eff376a1aa79700dd54a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
