Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7974AADB9B
	for <lists+linux-stm32@lfdr.de>; Wed,  7 May 2025 11:40:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9055C7A821;
	Wed,  7 May 2025 09:40:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AE95C78F9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 May 2025 09:40:56 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-440668acbf3so8563565e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 May 2025 02:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746610856; x=1747215656;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SsMa39hOSR7BVVNPX8WISfqJOyg0i9Y558xWbDK1MN4=;
 b=G+PRBWQuDJfjnvt6rBCcuODSsPxrRxUh6IL8jWULqcAwmTQ3yTLvCQgy+CYrpJEDSr
 vVZ8YQf5tBPXMDRUemZ5nSPnOa4URGz4QQeAalG9WHUZhnxXLgJBkvxgPbeiwmQrqowD
 DMrCI4b66sKtHrYKKkX03ZONcdvGOS9Yh/X2TUet8pS6jPE1HZSU34pTIRvKEgZfTNg4
 CrzGegNZSA86/e924FVfcW011m8PvS1ighMYPDXN7yTgh61EpDI4KeH8BWJUTndLhOiO
 gAZLXBi5bLgrDk4n6cMd++LbG2pxx5QfyR8VmxMD1LO7qWzRjJyl+giwIFpU/zh1hnWV
 haJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746610856; x=1747215656;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SsMa39hOSR7BVVNPX8WISfqJOyg0i9Y558xWbDK1MN4=;
 b=ZMTbZCkG313DfaeiFUl8pN0+wjb5j8M6bQZto8oCDhC0gTgbkvANwtPMiPDM46FBBO
 l2tK1h1qUsRZA/6lGW8issadbMxVEFFh1J3NkLMeHJptHLrdwdNkIhioZWru3e4kaSrL
 5k+oW1z9+9qc+1WMEq6jHvYFACBxJWrF/vsMB0TZRc4lN750y/1DfRKJgLg/8Z0CerHE
 Hc6zGNBlQ1AeV3Rpf3hXX+/A8bk+d8CcpfMrLwyJTVvaaxDF5nhjtD3lkgKF9yqxnJOG
 hxL2DehLzZ9+QVP0aUPpcpm8KPggNgwxFTe9oqU0UIMjW2XoKWqn6ORLdEugYQAAMsO+
 dy9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo5khxJdqN92uaq7I+QGqrVtNawL8sCu8aK7QJadhNj1l16IgCXn1vv5v74mxRZGI8rjHyAOGgulZwxw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwttCv98McnXnjn5NDSPUIeJgU+TF81HVyr5YzgcII/ECCcdtpf
 VkydDVKCBQffGV3XoAPfwj3ZWpBYQvwbcwUYJVh/EB9NiYY92sjQLNo03rQKA+CatVOCfhyEdAT
 o
X-Gm-Gg: ASbGncvwmT5dCDM+BRu5LPD5aD1sGdHf52uC4YvI/Ix5oSntq4hsLLYoWwCfPiGWFOi
 Psc+RDWkh3dZWJLbqIxB+f5xnEpCEQarb/rKMCwmMEZ1hM3W+EVUjj2ll9NxRg1aMQc4bO15Bqk
 0yNngImTThOZdYtxSIQ7qjHGgtvFVSRcDUQRbVFrohCHT9Z+o26vF5pI5GdyXNjWDDmNWOG2VOI
 zKw42xDjybJBA3B3ZI7P494UNRcwFBSccUPKG1Gp9iEpW29XHXobe4/SAiLGeWDpna0fb9q7gsH
 l9mLriKvvCOmhcfGXe7zi1tGbF3oNFsXHkrK54KEn2vpZanbCfkPyp3qC2Y=
X-Google-Smtp-Source: AGHT+IHHRs9t+0O91vMmvLRz0jrF3T3wosfwokty0h5PfPEgbCXS3pXL2K3J+ylcQS0xgqc/9SJF9w==
X-Received: by 2002:a05:600c:a36d:b0:43b:c844:a4ba with SMTP id
 5b1f17b1804b1-441d44c28edmr7459275e9.3.1746610856002; 
 Wed, 07 May 2025 02:40:56 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441d438e7f0sm25374535e9.29.2025.05.07.02.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 02:40:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20250428-upstream_ospi_v6-v11-0-1548736fd9d2@foss.st.com>
References: <20250428-upstream_ospi_v6-v11-0-1548736fd9d2@foss.st.com>
Message-Id: <174661085466.105567.8801540643758026671.b4-ty@linaro.org>
Date: Wed, 07 May 2025 11:40:54 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v11 0/3] Add STM32MP25 SPI NOR support
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


On Mon, 28 Apr 2025 10:58:29 +0200, Patrice Chotard wrote:
> This series adds SPI NOR support for STM32MP25 SoCs from STMicroelectronics.
> 
> On STM32MP25 SoCs family, an Octo Memory Manager block manages the muxing,
> the memory area split, the chip select override and the time constraint
> between its 2 Octo SPI children.
> 
> Due to these depedencies, this series adds support for:
>   - Octo Memory Manager driver.
>   - Octo SPI driver.
>   - yaml schema for Octo Memory Manager and Octo SPI drivers.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
      https://git.kernel.org/krzk/linux-mem-ctrl/c/4a98ec836a201d34ac27636960c2c81d9b3b7e19
[2/3] memory: Add STM32 Octo Memory Manager driver
      https://git.kernel.org/krzk/linux-mem-ctrl/c/8181d061dcff140fd5a40e568d8adb81f1403a28
[3/3] MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
      https://git.kernel.org/krzk/linux-mem-ctrl/c/02eaee70babd860d76dc23f9165f4496d0ffe77f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
