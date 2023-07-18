Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5589C758519
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jul 2023 20:54:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05DD4C6B442;
	Tue, 18 Jul 2023 18:54:16 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67D32C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 18:54:15 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-4fbbfaacfc1so9943899e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 11:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689706454; x=1692298454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NvHXXC5n1uZ0AxYD49mZD4I5ePIf6P0IGN301whWC4Y=;
 b=YCw2FxaQe0fS746f3Zg6kyy0mPHJFPcxQCuz3iBYO6KWAVJR8biEfK+xTD235L54HY
 y5UnQ8yOUM13/lODRTtZGLicYIbcAnbgvQJA6rWXGC5Af/eIhkuTMF1C2uOe2wBKktDh
 L4FiJm8+ZJPPFgRaqOP06mdrXOqnezk06nq3DpdjCfdFO9kKkuNB1FNg6GuPwil7+Ft4
 emC3DdI9a1DWGEmVYUR7XNE4IJMTpdd9q11l0uTDp/t5kQaglbLVgV3K/2s4ayH1BP/1
 UfymOZncKXJJp79doaeRDjUEKhK/ayHBPYK2GqLwY82fU3Mtxh5mU3DTxmc8wVmFLdoN
 Qj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689706454; x=1692298454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NvHXXC5n1uZ0AxYD49mZD4I5ePIf6P0IGN301whWC4Y=;
 b=LrMdPldXrZiX7tOAB+Bhx7l+/G9x06P0PujDYewKXzqwkhbNtUrB5TbxlE/brAz6A7
 /Cs3Js7eHoe/MbWZQ9ySoz1WoKPIRkN6/pVdT7gWyLkF7S7uyPlGw8dZoVqCVhAfNfOa
 iI5vP0aepJcmbdpy2n3hR09q17+rGOUZInCp6uxIg2pU6cgRNlIjR4fJ6fk5XYyXgxW9
 Az8X7EKWDhltlCMoYDpQF76FDpDSjmJgiOEUHa6dg+Y/LAcSZ2rAr//Jq4/KPPcOnycI
 37xV5cB2ScXqDvTorFyri+UsDSwAUSjy1BQYd0xHItLP2t5sVNnxR1UTPQ+dhEmtehks
 A/yw==
X-Gm-Message-State: ABy/qLYZdN+H8r4uE6dSQb7+ndV3oHdJmUC9ZTBXrTvQZ7nHJ0eN1wM6
 iVIrOOsGK7euGlAJdlmYc3k22Q==
X-Google-Smtp-Source: APBJJlEmJtRDRmErj1dWjqW5H0FvmW0qCWd77Rraj/v2e0/CrlF8S9Qa+VC3Pmb+EFFauDws5ZkCFA==
X-Received: by 2002:a05:6512:1320:b0:4f8:7803:64e6 with SMTP id
 x32-20020a056512132000b004f8780364e6mr10007681lfu.41.1689706454522; 
 Tue, 18 Jul 2023 11:54:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104]) by smtp.gmail.com with ESMTPSA id
 z11-20020aa7cf8b000000b0051df13f1d8fsm1608611edx.71.2023.07.18.11.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 11:54:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Markus Mayer <mmayer@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Michal Simek <michal.simek@amd.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>
Date: Tue, 18 Jul 2023 20:53:55 +0200
Message-Id: <168970643388.118933.13930948330074254710.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714174717.4059518-1-robh@kernel.org>
References: <20230714174717.4059518-1-robh@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] memory: Explicitly include correct DT
	includes
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


On Fri, 14 Jul 2023 11:47:16 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied, thanks!

[1/1] memory: Explicitly include correct DT includes
      https://git.kernel.org/krzk/linux-mem-ctrl/c/0b7fd1fa7a048b444b56f9d217c5917aa255d5a5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
