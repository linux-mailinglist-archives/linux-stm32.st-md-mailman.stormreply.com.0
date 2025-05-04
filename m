Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 741CEAA8695
	for <lists+linux-stm32@lfdr.de>; Sun,  4 May 2025 15:50:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0ED58C78034;
	Sun,  4 May 2025 13:50:45 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F275C7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 May 2025 13:50:44 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43cee550af2so4487355e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 May 2025 06:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746366644; x=1746971444;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z+WxkHYKUkzW4ER/6Z9ItH8b6boPBxhsY28VmZL6mAc=;
 b=uW57A4t23fPmYGNDdO/ZqwhfxwV5LeJZR9gQSRyODOlFSqw/uIJklcOkW2678XGBpP
 GgRutQ4A0ciITEy3JLQW1a5uDvZdqpanO9zoDoI/2nbcdUh5qF9ta0mle6RQGf5Un9OT
 lRk3MBM4KHZpjHoal4wPRV9WUTlrnfSs2BDjtpGst5f+ecwFOeryLa0ph/ZTF8y9yze7
 UpoCzm8SON18Tt7oz8AP4OErAynvbs6TBPHzo9NjyaxeT3JAVw91LtbJ4kDQXzJCzasc
 oSksAhvqfLwK06Rhbb/z44Rf4vcOl4Gio+USzEh7tm/fenzc+dU37kvUg1JLp03oy3Ce
 PEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746366644; x=1746971444;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z+WxkHYKUkzW4ER/6Z9ItH8b6boPBxhsY28VmZL6mAc=;
 b=iSsNK4mKhPOP11Ib9H8OsjInN+Xt6gUznQFxqexa9XFvlqxGJKgN3GlC+XCURPrtoK
 VBhPVdIKaUqvL8Czhf5e+kaK8ASKPriEvYofp1rczfG9dm5kPTsKlDXwZHgHr+YfvPi0
 YInMhaDCMH9nz4WSAfwrd2Q5fWKQR9cvhaI8Y/5FXtZbJXjEpBO218SEsDwDbE14JxWr
 QkQ1v/VNkOYeu1nhIbd4uLKcZFlpVJJfJ+T5haxhJE40u3FcQ/qO9YH1zOtpSJz/X8Zr
 07IGpokYYn/X5KYxjW6aL5GBM3IsSIblg1CQdUS10ohyKOqEfAYZr18hTk0SbOlLh7z7
 TCnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWis5ZZswz5KRdFwkkPhrkkZWKihf06Hj1ZmpNZzbCFohXZvXY1a39B9DjtC5b8ikHpcW5T9Ybv5K2C4g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzt4bOVh0IEDPqmjKA1DGAmIiAZeAw+DFcOd/tz6mF2RNq8L2FT
 yufwGaGFPtyqCUzH/89yYwAjyKhcyOsmCD02XnYzfacnkI+nGFNRCwWMiXHGn+8=
X-Gm-Gg: ASbGnctBRnhQBYW57HHB29gosUnvNwIdflYM10aN78OhEKIiLDUFstA/PukkyTXGVHx
 zuVCIN5xd/jQRqrl7gzNKaubuKAqOMwxPfDSiOaxN8fvBknlK8ZpdYlR5QgyYslhWzYGlUgTnUP
 qTmg5eykQrOR6swZG+Ptl9Vt+QcVA1l8vwryaetenfBT9uC2OAGqiqcjdcVi5qpC6aTc5RAWZ1F
 r7fDOTG6sZo1WW1LQesqDjzaaVt/Ru9WAez/+ftcXR4nRzmfyk7I7Y+Fzx9iSJAz6htPMB4wYAz
 iA0/OY4UyotUvBhgGIzXE6xFDMoKZVv6wW/DKzx0Zc9QB4EOAghRuU5oihg=
X-Google-Smtp-Source: AGHT+IEYCOZ+iY0a8P6rTepTPbdUWPxKR+5HMLJYKNnujHoa+RcUI4iTDfxw5wNiB9aCsPGWAf+6xg==
X-Received: by 2002:a5d:64ef:0:b0:3a0:86f3:451f with SMTP id
 ffacd0b85a97d-3a099af1f69mr2481210f8f.12.1746366643823; 
 Sun, 04 May 2025 06:50:43 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae7bbesm7343717f8f.49.2025.05.04.06.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 06:50:43 -0700 (PDT)
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
Message-Id: <174636664232.45285.4829080141383638928.b4-ty@linaro.org>
Date: Sun, 04 May 2025 15:50:42 +0200
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
      https://git.kernel.org/krzk/linux-mem-ctrl/c/43eb1b288072641b7de8f5d5c15bde69e6e8589a
[2/3] memory: Add STM32 Octo Memory Manager driver
      https://git.kernel.org/krzk/linux-mem-ctrl/c/daee9b249992a88cb64fb6a67eeb333d359c6242
[3/3] MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
      https://git.kernel.org/krzk/linux-mem-ctrl/c/ab455b75de7351a0277be3261af180e326b74605

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
