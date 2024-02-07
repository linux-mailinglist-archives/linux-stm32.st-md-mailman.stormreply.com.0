Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F93384C71B
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 10:19:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49BD6C6DD97;
	Wed,  7 Feb 2024 09:19:19 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BB51C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 09:19:18 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4101d08c34cso144865e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Feb 2024 01:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707297557; x=1707902357;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3E4sDqzii/6R8d7i8uvIM9PeK0fYlmETkH8H6KbNcjA=;
 b=o4h3lCn+Zqg5YgSltXG0Z76xO5Rhlv8DAYA2B9vYs9q8JzDX81Qfs86A4NAvVcVu/n
 w3WVyXSsZG0UIJhw7XTcwJDjJXiWQyMFZMeIw+uxcJtj4EA3c2AB/1JsKNEAwFg7zVcb
 7/ce0nRHOZFbi1zxRTDHTgQ9qJpqj2tVFG3vFnRzrzEs1cjXb/eXhX/GUAoS7LtpL3Lt
 Lv+rAM6rpJyYnx5KXs5klRXWNRfT9MboZfSAeuGoB14w4ooPbuL1HY79OaiSnrbZCEAh
 MPgAtEA1FJFigrcYJFuaLMJHAb6eVxrSc2Yy0eq1lqci4HuFCGe5Q462a0CgOfGLub7H
 8C+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707297557; x=1707902357;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3E4sDqzii/6R8d7i8uvIM9PeK0fYlmETkH8H6KbNcjA=;
 b=TKWKHwbjVvITBuphB475LlZYbCCIRRlQx17CUApLtKb8RfB6V74flJA2MJEUid+6wr
 TdZwsPvdPnevTgeQQntsjaBeU/X5DPNFLuATgvUSSJSUYQ+bpVpirO9ZaIsHb1kfnSvP
 6QWzq/Ufib9OgVychzBRh/Hm3VydTzpoDxaKcygrhfMfOrNz3eJXuCKmFYwsrI5dTYAa
 VM+aFPjtahMID778uk4A6DyZn2YsAY7+rzpfH4fefSHYL9ncgCQGGb5SsdrgLv7CVaZZ
 RJKxUrdh9E0DnoBegBihlrdMAH4DFjDjSB3i5QSN13O1dULTqiTloiYIv5uXQu4Xx2ix
 ZjCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm9nhLTvy3be9eXpdgVy7BfsV8qFs95gyYUcWLUT3JOEf4AQgj3A+oRpNhzJrCssH0BTrf+mUkOtP47wWXWg52gmPz4huW+j0r2/vta3ltCXwWkGNj1e74
X-Gm-Message-State: AOJu0YzHiB8osOtpXphadU1DwjSKgt3uF1u7zG8e2McWI1xxwYpHpUhA
 Xws4lIuh6zrXRb+oLQKGX/gOshwUTAE7JJCLDHjjdVVH64glL1gMuNhi6yWgKyc=
X-Google-Smtp-Source: AGHT+IGWzAsUTDmBmLWHnB0zSYQvDAlkA/M0ZyEQ9KVtZ5H+fM6jmNNCaOcPYRkzWHOKIg5Lztf8QA==
X-Received: by 2002:a05:600c:502a:b0:410:1d5f:5bc with SMTP id
 n42-20020a05600c502a00b004101d5f05bcmr7264wmr.31.1707297557602; 
 Wed, 07 Feb 2024 01:19:17 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUs/M/jhqlfqTPEJC9TWo03wE+lL81k14rkOIobGRfNTLxv0PThTJ+BtQKuutnm0kxgX4FMDgJQ0IHyuCD33UsPM9Qxq3PYM+rFgkZMn5IDVREVm//fUXqYkMhNkdAD4ksZyt28tJbXb5paKj0nmDdeFX26/TpWOCy4I5CQXzB3YfZr2lc2Fslb81CxPqZpznSKGYimpvNE4b5YSsZHjLOuANGREgLCvA2+iSSxVUBp4elFleBXjzGyL6u9fLlpxy2TaS0shtyXTb+nuSFh3DFWptHtXhmTt0lAaPRLR8rZNuLvTovJvFsA0gQpCu2wCrNxmiU7nsSkPyWACOR0cTLeguUzKyS9KjofmhqbOE/JW7v+5MCdsfjopyqaHPSksgho4FqUKKdxN2LFHAe9IwmSHa5paMu/Tn0WdFqQ+COOmolv3vO4qq3QnIUSdWpJCb+DjY2H3dp2Y5teYCdPA5HFlcY7I5SpT9oBajGcJZkRgWIPdfgVzEQxMXP4mgQdro4qPhxXz8aM1+09hGwofBjAg5R3KL3vdtvJqGrHWoC8bnD5eEsX0Gt7z6jxnD3EM/ZxRiOrtms/ckzwKP+WrDF3/Tji/p44zCslZeULCOJDvIjNTbUM2MT1Mv5iQRDaK0cEYJyBI7h7UJEesus=
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r20-20020adfb1d4000000b00337d6f0013esm1003490wra.107.2024.02.07.01.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 01:19:17 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240205-ltdc_mp13-v1-5-116d43ebba75@foss.st.com>
References: <20240205-ltdc_mp13-v1-0-116d43ebba75@foss.st.com>
 <20240205-ltdc_mp13-v1-5-116d43ebba75@foss.st.com>
Message-Id: <170729755662.1647630.425379349649657352.b4-ty@linaro.org>
Date: Wed, 07 Feb 2024 10:19:16 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 5/5] drm/panel: simple: push blanking
 limit on RK32FN48H
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

Hi,

On Mon, 05 Feb 2024 10:26:50 +0100, Raphael Gallais-Pou wrote:
> Push horizontal front porch and vertical back porch blanking limit.
> This allows to get a 60 fps sharp.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[5/5] drm/panel: simple: push blanking limit on RK32FN48H
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c9424076d7642bf6e214eccf34904848c8b53515

-- 
Neil

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
