Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F00AB64EF
	for <lists+linux-stm32@lfdr.de>; Wed, 14 May 2025 09:56:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C032C7128A;
	Wed, 14 May 2025 07:56:33 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96734C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 May 2025 07:56:32 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a0b28d9251so963692f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 May 2025 00:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747209392; x=1747814192;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzdTMooCqa1ypmINEmlgL2G2QWjmPcr5NoyztBa2Ur4=;
 b=SpNVEZhrFdwQsxONULg7572Ef3ijSoecDWRCiyD0HSCSsZzsyMghXRO8O1/07WSv5Q
 x8ngtM5pH5MZW5uZoZWdWEkhCTb9CTllgFkFdRy4WHtkX8eyTlzTxgfoJsfL4pdxR8FB
 /jp4F3pN65C9elbfcFPgYgRO8y2fEZ4my5sCl7cCCtqAqBJST7+KNI4Z3NEhfIEgZdJ0
 VFcxM3ZhUpH73fFnAF3QDbgjhqaJSvEE4qB8djv7yCmLpEgFXehuUS431+XTWcBXdxyo
 6+EOLaYelc0WsF7om3TZQVM4BjheG9MoemNCtWoNMe+2/yKnfyzn80SfRoT+R7KlT89P
 pdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747209392; x=1747814192;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kzdTMooCqa1ypmINEmlgL2G2QWjmPcr5NoyztBa2Ur4=;
 b=Dm4Hcc2R2fXLi4R6+Nfl9BggWhzXQFCutO6oF7TYtIP+Xd8jqLyrne6GXhOvQtBZMN
 qpXj1gvAGmoBVGFJvtqHtZce12wvOBnjZAypWSdvTx8/OjlB1Y0vi/6qvlI7lKtuEPw7
 79cid1Ns+ZvcHwup74W43c6EKoX3oi9X8+HS+MfeTFlsd0KelA+emdaWe9N9aV6y7HY+
 rTbAgfcQZpacYYYeUQOgr5XJnQwOyTcYmsz7Z8QZGkzhlfxm1muG2LijlunBHVAzUTIo
 wcmMaGd5JVcEdnB0kunZrG9gK0IAqvpGGX+7jYuc7m21l9SI5ZLcCc/j/LI/0Q+ER9K+
 o2kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWWB2zbIc0+w9eJ/RQSgkmKILfAvKo2W2MojZNSnQ2VE5ClyL/b7a0XpksUqq1jy9ac6p9t7NiVJeBmA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx1PZ/c+16IO3hBxp2DdHZEMcZobn78+B4MRtLlSrGEGZXhyPDB
 QrTb9W9rxoC6a0dGivR3vLcubFuMNeNkeEV8ZdLLejfbO8NdDKawcGEtbeg7Uls=
X-Gm-Gg: ASbGncs0IlC9bb/EE69cdSb6RbBxxY3XK2SqcPzj5dWpTNLG9g/e9dI8OGy0KhjDVCY
 DriXynfYfUfcZpU9MbIwJ1cl5LvSj1qQ6GG8rtZcmGG7rmKRkQiQ8N5FHcAv70G9P1UJFPfWeSe
 BQXvrq7lcdYBVbrmCwjo1K+JMphk4fYfEnmICkLPrO/ECQWt2/mKyxd7z314t06vHydqAsW90Y9
 Ndqp8112f6HHCST6W6PeAfI5Mk4LdxtQ4pjehhTsCmKjYTKyNxanL9RMgKXUnLpvoF8C/uxC+YR
 eGOWt/n1uolp9yJ3lN7mL/ybeDAGOwLOUk9o+Ml8EuZU6x6gHo9UjIuKtU8wv9zCp5Y3/y90LvQ
 b4Rj65+xHDXYx6S9Dmw==
X-Google-Smtp-Source: AGHT+IHHtmTfTDqpI8/MhLKS2/FzVY2p3LpVRtEE1jaQ17ol8rPj7ZAtenjeKA2K6/4xZEMzO4yRQg==
X-Received: by 2002:a05:6000:4007:b0:3a0:75ff:2d94 with SMTP id
 ffacd0b85a97d-3a349699c5bmr668843f8f.1.1747209391885; 
 Wed, 14 May 2025 00:56:31 -0700 (PDT)
Received: from [10.61.0.48] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58ebd75sm19067112f8f.34.2025.05.14.00.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 00:56:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20250513-stm32_omm_fix_typo-v1-1-5b90ec8b52e7@foss.st.com>
References: <20250513-stm32_omm_fix_typo-v1-1-5b90ec8b52e7@foss.st.com>
Message-Id: <174720939065.5575.14505161452787178403.b4-ty@linaro.org>
Date: Wed, 14 May 2025 09:56:30 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] memory: stm32_omm: Fix error handling in
 stm32_omm_disable_child()
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


On Tue, 13 May 2025 17:34:31 +0200, Patrice Chotard wrote:
> Fix stm32_omm_toggle_child_clock() return value test, we should exit
> only on non zero value.
> 
> 

Applied, thanks!

[1/1] memory: stm32_omm: Fix error handling in stm32_omm_disable_child()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/388d0cc33cc6fc876e053644d6af694b9d5c639f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
