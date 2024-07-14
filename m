Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4DF9309F6
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jul 2024 14:47:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DE17C6C841;
	Sun, 14 Jul 2024 12:47:38 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C52A1C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jul 2024 12:47:30 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52ea7d2a039so3570037e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jul 2024 05:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720961250; x=1721566050;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bYeW1aUqkkqQu0pvxg2P+XASuy3RpuxEzFGY7FDRapU=;
 b=kM7bqbYr2h4PflqDaj29ABovkSdlVcD4BMa02ZLzyHspRFYc6LPEKFhGcxIMpBFv4y
 k54/ndVP6pIRqqpwACwke7TTWaYlRKQkcl9pVqYc0BvINwwsB4LCMRN8KQPT920o7Ao4
 ZM5fsZFaRkgcO8fdPOSxx2jjVBDUtRLzuU03oLLVpd4MR4ro/wa2sKRccBfC2C2Dpp0v
 ltmmQ1CnM+YM4j2TcVHW9RNnZMaw/jTiI14+T/G0QwPO70+hN3ekTalj1xUxgX0ukJMq
 +HbCr1kM5rX6/2EVFNg3yTc/FMLnIdVzDbsY1xeMcZf76yPhjBWn6eRuShVbDgKTlisg
 Verg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720961250; x=1721566050;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bYeW1aUqkkqQu0pvxg2P+XASuy3RpuxEzFGY7FDRapU=;
 b=YuF1n7Khw3HCeaLQmiBkdJMtVz5iw0pL1EQf2nnUO+2E75+cMLwq3i8RmS96o5lpWT
 3L8c2uOP+dOjWr3LQVtp6zaCAhrGkpJreUkc8loG1mnG5fBLE8tFpzUG3BFPe7YW4CnG
 KXKaq80wSfjo2MWqnHnBHV1+3j30PvWeepDYt4I0NsF9TdVLCX1DI7SjrqfbXrjWmEZf
 N0n7OUHviWnilNjWaTTdjXsA2hEjRsekwgY6khL+ODFHOAik77nctGOeVZHCM+cpGn4r
 gKZk1xoBWYDlumTkvjMZglAeYOHYYAZcT8OqFcKsluqsJh93aXNrzTeTuMT2BRTDu0w0
 JCNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVylgKlY2HA2ALqxFzWtar/S0SLq7ahhwsBg8nlmvLiIq3vyw7b2cKAC+dwoAoCLWyyNg+eEV/ktmecv9i8nqDhl9eQ5cZwxIEhD8qMFdaiJZ6MALZe16XJ
X-Gm-Message-State: AOJu0YxdPM2XkLrzTXIY1r7h/wKbfzGurAmuuWZNhNWwXlevyQKeTi0q
 XACSBa5fxPciKYR/9dYaVrTKuUMLIp6Ln3zZwx7EF70xImDpuyLX
X-Google-Smtp-Source: AGHT+IExx4Gr8Umbg0gbYQ03/bv/pYqJqX/EK/+AOIRZKuLKmJm7iyM5zUZI7yWzpxPPD+pjOE17rw==
X-Received: by 2002:a05:6512:3b82:b0:52c:e084:bb1e with SMTP id
 2adb3069b0e04-52eb999126bmr11827758e87.13.1720961248544; 
 Sun, 14 Jul 2024 05:47:28 -0700 (PDT)
Received: from mobilestation (pppoe77-82-205-78.kamchatka.ru. [77.82.205.78])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ed24f3b90sm451958e87.113.2024.07.14.05.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 05:47:28 -0700 (PDT)
Date: Sun, 14 Jul 2024 15:46:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Drew Fustini <drew@pdp7.com>
Message-ID: <ywwl3eaamj3d7dhwkhcoglxwxqmpwd5dewkq6ldmrfqdfgnlu3@rawh4yhkuh6h>
References: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
 <20240713-thead-dwmac-v1-1-81f04480cd31@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240713-thead-dwmac-v1-1-81f04480cd31@tenstorrent.com>
Cc: Eric Dumazet <edumazet@google.com>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 1/4] dt-bindings: net: snps,
 dwmac: allow dwmac-3.70a to set pbl properties
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

On Sat, Jul 13, 2024 at 03:35:10PM -0700, Drew Fustini wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> snps dwmac 3.70a also supports setting pbl related properties, such as
> "snps,pbl", "snps,txpbl", "snps,rxpbl" and "snps,no-pbl-x8".

No longer needed due to the recent commit:
https://git.kernel.org/netdev/net-next/c/d01e0e98de31

-Serge(y)

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Link: https://lore.kernel.org/r/20230827091710.1483-2-jszhang@kernel.org
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Drew Fustini <drew@pdp7.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 21cc27e75f50..0ad3bf5dafa7 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -584,6 +584,7 @@ allOf:
>                - qcom,sa8775p-ethqos
>                - qcom,sc8280xp-ethqos
>                - snps,dwmac-3.50a
> +              - snps,dwmac-3.70a
>                - snps,dwmac-4.10a
>                - snps,dwmac-4.20a
>                - snps,dwmac-5.20
> 
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
