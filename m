Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D84D84867D
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Feb 2024 14:18:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CDF5C6DD9D;
	Sat,  3 Feb 2024 13:18:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97BCEC6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Feb 2024 13:18:47 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-40fc654a718so12707825e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 03 Feb 2024 05:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1706966327; x=1707571127;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DWfHGvyLS9Vdj8BUW4SV7fQsQn/7GRDVDPI4v8u0+as=;
 b=naqhf74QSJlW+EIi/qnF/OsvOpiXgShRduMr77dPJc2Q0QFp+g83QLUeR3MrUonR9y
 R7GcIVzy/HCQFAtL1K05QlXHJFnv7h4EHsxpWPk3WigZP0Imf0/1A2ky501SKuhPEM6T
 VmrWx+8/mtdhC/AIsGEQP3euq/Xd/lQG5CXV+QtEZvLGMixPS8n/MfCJY5M0tEqKhdIV
 rLBhki3JuZL/888P6KNkIffU4vB7BnmKf+rRlh7K/GvyFW9gVz6k087lSnAqly/wKwbK
 4tt9a8va7/7nRbWDhYQf7kt25iaZmNTlEHd2v6H4GfqyffztFGSCm6IaJHPKUQyDpfRQ
 BY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706966327; x=1707571127;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DWfHGvyLS9Vdj8BUW4SV7fQsQn/7GRDVDPI4v8u0+as=;
 b=A79dmpNZ2Nym17pAsN12+jQ8HSY3kmeZye+9oHX58cgsy7FbQSlbn3XBw1VcHdz+PC
 GYC76ahm4vXQay6H4UYxpMhMW/Aym67mnUAEi8vCHbbkdvveT+A6n2Ej8cMjgkXV4q3y
 PP4If581Z06GhiICcNOz/RnFdPtNmYJ68ADtFgdmVTKURKx7iO0QawvAMdHN5VuPEawl
 1DFCuqeOE+RF0CNwIeOc//rDUilta7guVuHI8h8Wp2DBs0c6AaMlYbxDA0WRMK0WbAsU
 tmdBF0kK7MDf+X3NxEnkvDAEdkCMY6NQ54gz5IQIPF3sN39MHg4p+v+WT85x+s3c36Li
 pg5w==
X-Gm-Message-State: AOJu0Yw9jyARurUTaCwFfw4ZepobbSkypU5iPIQ9m7G72EhjlcdAc6cL
 P7D3p9Bys4C8bjufWH/Fa617I8MPY/dqKRaYuC0dD9Yf2ZgAutccTebGSg9tSo0=
X-Google-Smtp-Source: AGHT+IHbhiTWLBl6YahL3JztbgGYK6YB780/wlpqRr77AzqPbB4zWyVEyfXchL5cgCYGdII6nMrG2w==
X-Received: by 2002:adf:fd45:0:b0:33a:e56f:1ddb with SMTP id
 h5-20020adffd45000000b0033ae56f1ddbmr3178428wrs.46.1706966326943; 
 Sat, 03 Feb 2024 05:18:46 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCX8boruPRGCZlECRQFcP7XDgA7uXo0XyWVGVmXTuh79Q8jTdX7LTleA+Kmy8ecCa7gYnyawFJUfOGf7YK4k0mXE9M0sARfiyGnPPXQplpXIfF3PumEU7SNPYCLOnpvAiDwylGD2nvgqJA7odDPvgNY2XcYbigJx7JsdXGMo6/fNe7fmEI92Qn/M3FEBfMHgoMMEQK4gkSDxXz213p4Jf7WGlwY2aJWz4elfy+2MYDVb+vLDpira3eEBq7dgeMDsXQClnsaCgJEvd668GohgqIsWKU6zshmBGvOLTNxAsCa+ONdEEu71kfrwfinkI4ZoT3hnE0GeOim2oXmtYDs+B3mNYMyz0w57NkRwKC9CvyWh77yFKFdXYhj99/ZIU4Mnb6fT4r8H3Gr8Wm/TTzh1VY9MM1W+lZIAstMUREHZfOWiMrLDjv9ILLWxdyZcs3lL1sbRIaG3f/nv4V3aweMSBgXb4ksqXuu82PUIU8StcD8oEqPaSGVopkrptkmFtuO5wE7SCsjNzOu4aLpYMzsiSX+FM7gZCLfV6GSILppQhIvkJWiYIFHJ8OkW/+JJ1Fy9zEk=
Received: from localhost ([193.47.165.251]) by smtp.gmail.com with ESMTPSA id
 s2-20020a056402164200b0055f2af9b01bsm1729280edx.17.2024.02.03.05.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 05:18:46 -0800 (PST)
Date: Sat, 3 Feb 2024 14:18:43 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <Zb49M9fKRR2HeGhR@nanopsycho>
References: <20240203053133.1129236-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240203053133.1129236-1-0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: xgmac: fix a typo of
 register name in DPP safety handling
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

Sat, Feb 03, 2024 at 06:31:33AM CET, 0x1207@gmail.com wrote:
>DDPP is copied from Synopsys Data book:
>
>DDPP: Disable Data path Parity Protection.
>    When it is 0x0, Data path Parity Protection is enabled.
>    When it is 0x1, Data path Parity Protection is disabled.
>
>The macro name should be XGMAC_DPP_DISABLE.
>
>Fixes: 46eba193d04f ("net: stmmac: xgmac: fix handling of DPP safety error for DMA channels")
>Signed-off-by: Furong Xu <0x1207@gmail.com>

Looks okay, but this is net-next material.


>---
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h      | 2 +-
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
>index 5c67a3f89f08..6a2c7d22df1e 100644
>--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
>+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
>@@ -304,7 +304,7 @@
> #define XGMAC_TXCEIE			BIT(0)
> #define XGMAC_MTL_ECC_INT_STATUS	0x000010cc
> #define XGMAC_MTL_DPP_CONTROL		0x000010e0
>-#define XGMAC_DDPP_DISABLE		BIT(0)
>+#define XGMAC_DPP_DISABLE		BIT(0)
> #define XGMAC_MTL_TXQ_OPMODE(x)		(0x00001100 + (0x80 * (x)))
> #define XGMAC_TQS			GENMASK(25, 16)
> #define XGMAC_TQS_SHIFT			16
>diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
>index 04d7c4dc2e35..323c57f03c93 100644
>--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
>+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
>@@ -928,7 +928,7 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
> 	/* 5. Enable Data Path Parity Protection */
> 	value = readl(ioaddr + XGMAC_MTL_DPP_CONTROL);
> 	/* already enabled by default, explicit enable it again */
>-	value &= ~XGMAC_DDPP_DISABLE;
>+	value &= ~XGMAC_DPP_DISABLE;
> 	writel(value, ioaddr + XGMAC_MTL_DPP_CONTROL);
> 
> 	return 0;
>-- 
>2.34.1
>
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
