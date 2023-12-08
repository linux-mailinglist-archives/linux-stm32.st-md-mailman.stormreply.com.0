Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BFA80A1B8
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Dec 2023 12:03:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BCD9C6907A;
	Fri,  8 Dec 2023 11:03:10 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACCF7C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Dec 2023 11:03:09 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a1caddd6d28so257669166b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Dec 2023 03:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702033389; x=1702638189;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bEwLnBOC/qdcYM4M+jPElLEilL4x4aw3f3zZi3BYaWQ=;
 b=CJ68EBXMJbyuUsMtUDXqhmsmDECITqcM76g1QVtVFPwF+QYK5NdRVc0F7HFUxcmLO/
 Q+aSdDRaMFLa88cvUcE5SwHa2zEzx7s/IwGcluo25zCyYN+xBSRO4vNtaYe8DueIguid
 kcqClvEK+GXnEFtULUVW29Da5tYDaVZkCRwVlD5Fp7z8+Ffmqc6O0kQzZzZphg2NImZ8
 yb1uYcVBFBZ3bWvZo0DnOTy78WWhbQDRrsGMwNFFRwMjc6fkY4qIjBUL9h9/Ej3vyA38
 gXRQB9gUA+BtNrM9B21RqEzyMG/bWMWz+mPCDWpnqAHQ7/HIh9wMg9Jq31BnVMfVU0IV
 AunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702033389; x=1702638189;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bEwLnBOC/qdcYM4M+jPElLEilL4x4aw3f3zZi3BYaWQ=;
 b=H0ecH3WtGAnKUwRrXdRgZZ80QxJEJgO11C4LGCfuBMkEQl85jf2GK0mxmyz3EefgHJ
 ytpftsFGNWC7oErAk3CxC/DKlYV9XNBsIjn+uxI9venpIv8GEnW3X6uC2Kj4RS3Lm7Rl
 UKXyqgHK0aCMcCgmwlkx0Hgezi5XHqSvf8AzbBttomypxsCWZYKfX7PgfB38FLhg5iwW
 gIAoMp2NQUVs5cZcFPTvqfb5eOiVHJhf4QcOmeiHXa4JENFEM5SxjUyYhhFwLUtgD15L
 wBkNOSsVfspIUWmYvyc9HdQroHJL8kdBF1Mvb7pCfzQil/ejYg7R7zQrum7mCOr01aaj
 Gz8w==
X-Gm-Message-State: AOJu0Yx2hK4MaYh5ot9N8Ltb10Ggl0Qu8OOflJyugjyeRsu+dT8ioKt1
 fojd98YBLLyvOKoobo6JSotmgw==
X-Google-Smtp-Source: AGHT+IEUCMIetzDx1rq/yfoOzbKLkqMRhi9m4z8qeP/XugdovkyE4akMeKajgqnm0Gd5Eej4Ijodhw==
X-Received: by 2002:a17:906:81c4:b0:a19:a19b:4254 with SMTP id
 e4-20020a17090681c400b00a19a19b4254mr1634063ejx.191.1702033389036; 
 Fri, 08 Dec 2023 03:03:09 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 tm6-20020a170907c38600b00a1db955c809sm862184ejc.73.2023.12.08.03.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 03:03:08 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>
In-Reply-To: <20231117143338.1173475-1-patrick.delaunay@foss.st.com>
References: <20231117143338.1173475-1-patrick.delaunay@foss.st.com>
Message-Id: <170203338747.19730.10941929995611139048.b4-ty@linaro.org>
Date: Fri, 08 Dec 2023 11:03:07 +0000
MIME-Version: 1.0
X-Mailer: b4 0.12.2
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 Udit Kumar <u-kumar1@ti.com>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Linux-stm32] (subset) [PATCH 0/4] stm32: add support for
 STM32MP25 BSEC to control OTP data
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


On Fri, 17 Nov 2023 15:33:33 +0100, Patrick Delaunay wrote:
> Non volatile memory area is available on STM32MP25 with OTP in BSEC.
> 
> The 12 Kbits of OTP (effective) for STM32MP25x SoC Family
> are organized into the following regions:
> - lower OTP (OTP0 to OTP127) = 4096 lower OTP bits,
>   bitwise (1-bit) programmable
> - mid OTP (OTP128 to OTP255) = 4096 middle OTP bits,
>   bulk (32-bit) programmable
> - upper OTP (OTP256 to OTP383) = 4096 upper OTP bits,
>   bulk (32-bit) programmable,
>   only accessible when BSEC is in closed state.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: nvmem: add new stm32mp25 compatible for stm32-romem
      commit: d062d18d0e30e46e88a3b0f9fb2549393b7d7adf
[2/4] nvmem: stm32: add support for STM32MP25 BSEC to control OTP data
      commit: 2015e5f4d01fb76fca69047f870035e214d6d2d0

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
