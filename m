Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DEAA25A57
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 14:07:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26E0DC78F7C;
	Mon,  3 Feb 2025 13:07:49 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2595CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 08:13:05 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so3495073f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Feb 2025 00:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738570385; x=1739175185;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2IIA2EevMgnUnT2y0Tcftlgxz2rZdSe6sO6t8T4gDhc=;
 b=uXtlQJJfx++d1Tk6+ZuwH5tS1YqMN3xr9OVAzPIFaSbpQDLcwtCGwD44dyPPGz0Lqc
 mbz721qpV4yyxQhss/MTkJsM7ZdJ9UeCXSG4Ctv43G9filIRwTKICQ+/BzFW3Ek1L7eZ
 BzLT6vh0XimAogKd2fNTsbDi9ytlXDmT+afqk2TgCetFUXkTgaAEswpIIhtKce+6sBAL
 F/DyFIWJHjnDrMXZp0cyZIqBjHyNFvnxnsVRL/fFwnpCd1s04apAtywpzULo6FPXF0wx
 VgH7que4QbT6TpLWyk9UbjjzAAymakX0772NUWE2I3l6Zvx+trwZsTDrsRKhWaRabywx
 1cHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738570385; x=1739175185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2IIA2EevMgnUnT2y0Tcftlgxz2rZdSe6sO6t8T4gDhc=;
 b=UuzPptObI+NV7xPwn0SAy/BxE5g+62fXkHiTEIGHEP0Z4gcBZOcJ0soRjaAb7jWYC6
 jUSogj8oeZAYbCVdjc/bF4rAg2/jSZEmlmYqcdxj5j6+OEkAU0ZelVDQmwFBdbvStEmC
 NhNlLjcXWgptk+MSDCfdpyqnH7BS667cY0cw5T+B9N2ojzJ0hUFtIDtXFCk/ydTaplmp
 GtOZE8t27/ZilJN4ZdTUFg3EBD4tmzTOiR0SYdXNJVk29kemc3L5tWamfLojZGweb6WP
 cue0MYILIDxq7b1DDFPGakARokE6XspMG+7bGKlf/MUPIQEX6bqAYC8/ulIiX6bzNLGM
 8vRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVtcPmc0IgRbnjvS+J1PkL5i3Kj7ieAcccHR8NWetOzlFEqr8ZlPchrfFiSx0ogzUH1DbHesCwqbcceg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzOHsF1KmgB3HK3yHQqcZOf8bErK6FU3zsKXd7R6YFgo5Z0Kb81
 AX2WRF4yNt69I+PivxpIOr6esfRo9udQWKSbvVlIgsHrXF+W9TVtVpLkqtxcUGY=
X-Gm-Gg: ASbGnctA0IMhVF3UOrGb/pNu0Vi4viPpy55u2ohouCRyd5jEMxEEyr/g2YDCJKds8Gv
 KLsbMWCOBG2b/XQD/XTO0l7kq1aJMz8Nrm7SapZ0xmmv/fIeyFrEyK22zXqoP9jt+z0DsONDn8B
 ZbIOdOkNiur4O0Um64XmzpWViJ/kieTrMJFsqtwujnnjhWqznxylC5HpnsrOp1eOywYkAW+w0oK
 9fByOE16rsZ+FOB7X5Y4Ke0EWVHdg/eREmSP+jU5llxXEd5xCIYN7zaBsK7VoBKdq9j1oMl/Seb
 uN2xJWt/pj3ykg==
X-Google-Smtp-Source: AGHT+IF3lNNZmS2B9T8gXfcE5kd5EuOjnSuh3iWUdY1d50Algj3kP3sHpQaRcW0lvgZf4+fEDGkUsw==
X-Received: by 2002:a05:6000:18a9:b0:385:df6d:6fc7 with SMTP id
 ffacd0b85a97d-38c51b5efb4mr18533137f8f.25.1738570385202; 
 Mon, 03 Feb 2025 00:13:05 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:62d7:938e:c76:df44])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b574fsm12019825f8f.70.2025.02.03.00.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 00:13:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Nandor Han <nandor.han@ge.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon,  3 Feb 2025 09:13:02 +0100
Message-ID: <173857038027.20723.17081473974273068659.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
References: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Feb 2025 13:07:48 +0000
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2] gpio: Use str_enable_disable-like
	helpers
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 14 Jan 2025 20:14:38 +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> [...]

Applied, thanks!

[1/1] gpio: Use str_enable_disable-like helpers
      commit: de454ac4fc5a117a4264e8bdf60fca58021574b1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
