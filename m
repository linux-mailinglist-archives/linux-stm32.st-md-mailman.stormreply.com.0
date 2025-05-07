Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA64EAADB9A
	for <lists+linux-stm32@lfdr.de>; Wed,  7 May 2025 11:40:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D93AC7A820;
	Wed,  7 May 2025 09:40:56 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 346BECFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 May 2025 09:40:55 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43d16a01deaso6197045e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 May 2025 02:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746610854; x=1747215654;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JjJVOzsV/sS1KqYgiKb6WpgqfUC9eIpjHHMhaITJ/3o=;
 b=MUM2x1VpirAQlEZE2vz94wLqb/QtPREtaXffg2kjG0aPfL08OagHecRBK4zj8Nuqja
 b8TpEx4BLzEOuG5Zv6R5ApZLuuPYJTJQ50195WDmt6ATy24pxQ7BbQyd7sGjpMiJvbG+
 StILZIsDVrtvLKq1lhzECjDJznOsSpYESh1cAz35zbq6u0oCdVgJTactMj/xM8ibnUox
 Pp1Q3ckdElIvjwIXiV7au02e0HfDzavAsKqffMyeXNwYBtGR5ak9UPLN8EI4sZLKGTSo
 S9qV2VeKpCHPOdJZNM2BvsaKfQP22YbygdP772zIPL5Vv9NKlxtCjbqKnUXPThhF4KlQ
 Cn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746610854; x=1747215654;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JjJVOzsV/sS1KqYgiKb6WpgqfUC9eIpjHHMhaITJ/3o=;
 b=g+5p9sRU4qMnep64rxdwG4d6p01Mzg1BgdkDaaE90cBHlBBVxYcNhjGzaP0Of3FDOE
 /seE72HNAbc91YGcJdJ5Fi8TgKctKEwwPPaQnytLe+IDa2IlF7gcGL3ghkh/MFnPD8DM
 ZCu4X8R45Yxv3LEHNLz75FGatCMHXZGVk/6k3t7/iB0yl6sYZFQP70oXa8fHKtxRG2OX
 Y/jU2bFsOiE/N9u022gHqlkdbtjI6yHwOtvqLScvI++z4DROL1TtEyfERx4V/6OzBCbH
 iXxxiOyUz/QXaGnsVGq6lE4Mj3aIdA2CvQ//XNcixa7YM6fzUZxBgB0u2SOuczSiTyhh
 +bGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7N/gkVOSS+KmnyzRLU22MSpApFMG1md1H/Sc9qtgurY8f3luvBhCbrt9iF6TvWQT/kPdxQg2nprjG9w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwyKxlm0uHZDxAA13PbVYfm2UQwMrS8jNm5Dtcagq2nx7L0r4+l
 GBozToaR37vcPkf/pmjzhDWMGjQZ3kCzjj1aUkydHjNjbs7ha8+mbOw6Vsgv2LY=
X-Gm-Gg: ASbGnctEu2U3urugu3OAqwg6XQNyechxD7lq8AWz/VP61EBQGxwyjg4CCHnYzF3/9PO
 8sUrjx5w1+3rFLDKe9tTFbe2jNXAELaWTtIhTXuyxbw6kWGK0g9rKdCj35lT51DT3eEwLUAKkff
 rwtyK4pAIbK4HXlo6jQHk6fnwZQQX3dyDc1uivIGVotAnziZJGC5lFDO6VqmiI3K/+DGdkqkx04
 rhCxDxIdj5iN82MeW++jfneyBv/HHJHEz2wT49f2EJh5+dg7+RCspUAFeQ57yBqRvAOvfhP+sVt
 6t43KL2LPcaHDR/es9TaoldDKkP5mzR9pkoo24P+bqkKthQYG6JOHFGmJWs=
X-Google-Smtp-Source: AGHT+IGTYzGThTxOdxwaI5G+9aUb3aVHRykaAtXbsesYBP9DWb7wZzv8RquKPzZDNQ1IOuOLVdxb7w==
X-Received: by 2002:a05:600c:1c8c:b0:441:b397:e324 with SMTP id
 5b1f17b1804b1-441d44ed543mr6268495e9.9.1746610854412; 
 Wed, 07 May 2025 02:40:54 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441d438e7f0sm25374535e9.29.2025.05.07.02.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 02:40:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250507092121.95121-2-krzysztof.kozlowski@linaro.org>
References: <20250507092121.95121-2-krzysztof.kozlowski@linaro.org>
Message-Id: <174661085321.105567.10502174461599708056.b4-ty@linaro.org>
Date: Wed, 07 May 2025 11:40:53 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: stable@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] bus: firewall: Fix missing static inline
 annotations for stubs
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


On Wed, 07 May 2025 11:21:22 +0200, Krzysztof Kozlowski wrote:
> Stubs in the header file for !CONFIG_STM32_FIREWALL case should be both
> static and inline, because they do not come with earlier declaration and
> should be inlined in every unit including the header.
> 
> 

Applied, thanks!

[1/1] bus: firewall: Fix missing static inline annotations for stubs
      https://git.kernel.org/krzk/linux-mem-ctrl/c/66db876162155c1cec87359cd78c62aaafde9257

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
