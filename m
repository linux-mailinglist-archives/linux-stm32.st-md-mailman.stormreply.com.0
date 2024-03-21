Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FCC885B5C
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Mar 2024 16:04:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E98AC6DD68;
	Thu, 21 Mar 2024 15:04:28 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20A8EC6C85A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 15:04:27 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a46dec5d00cso148445566b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 08:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1711033466; x=1711638266;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=C+M26qwP0oSliowXOMgjRNibYsMtGqN5dSYVPUjBSio=;
 b=Nzqsv6rjivD+rmbWilpRyqA98TNwEOhDSWDRhZ0gypMIBmwva9Ub84E2jX4r4U7Mpi
 PJJoioU5LpI2JVXeK4bfigy7rcwGSeJ51RIPOmUQZVeQZccVxKSJyhItG5SiFxiC/UB2
 tpuMholmBk5PAGoC6ZqU+wQst+BzPekI56SlUbxlvUIhpoTLyyLyxMl4UNh87IRvB76C
 nW+mR3nAcvUvmCwLEq+65qF1j5TaTl3NxvdmT8/PwW8aNtBfGU1kcv6TafynvhugsKeY
 082QHv4RdW8IM5VsjYzVGxdfOlYVserF7WjYA+EhJzHZedhNW4Zr4k+GENBj54xy/65h
 X/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711033466; x=1711638266;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C+M26qwP0oSliowXOMgjRNibYsMtGqN5dSYVPUjBSio=;
 b=Yhyhf9s9MB/uDXTdjNwUUgV3tErd+uTSWJmLI9OxIxQMBd/CuDeso/uozmfycIA7Go
 UweY2jWyv6BFeypyBfTF3KK7F7H2ksznSwDi0AUFY05nt+9ABBKk78rejRocVe7H1lvo
 MABFfy02XFk5otjzeS8Hf3M1U0g/QcIg3+9G8KJdSGY+mwL+ALGqIbHKxRq0YV8qqC88
 KlbTULfovJZelp9MiMLfE0zkojfktvnY6XEsYS6LXiyKHO1FGQtab4Oc3CUY8us6M5as
 1tvR1t3vnGXa+yhFhq6H1kpoD0Q0YQVeM+gjbTyJPhxbclbzvo0lF+C4i13NZhUDGUCe
 jmbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7kfajHFUWxCohqiE3jmRN9RPyFPB2wvDorN9X0E8JeKCXU+yEpulxONO+1zHr/W9Wajap4VOzL31nDUXX1J+rFRhS67M7IXtOqn9Y39lsO8revM4xIpO1
X-Gm-Message-State: AOJu0YwdJ/4IJU7/NtWLlx6x7rgy0A+Nlmqt6w1iCnxhkSN0D+bRmDA9
 CZyMWrQdq5XeJY47eGJgt77YR718p275zAscKyADAjviooUIe0apYoV8Qt0yJaM=
X-Google-Smtp-Source: AGHT+IHEcr1Lc61NMyPIBSb8z115P5vSr6cXrLSqEMELys5uxp7RSzY4HAP3yVuJ9q6mhhIjpF5WHw==
X-Received: by 2002:a17:906:1817:b0:a46:af3e:dedc with SMTP id
 v23-20020a170906181700b00a46af3ededcmr1426310eje.40.1711033466146; 
 Thu, 21 Mar 2024 08:04:26 -0700 (PDT)
Received: from localhost ([193.47.165.251]) by smtp.gmail.com with ESMTPSA id
 t21-20020a170906179500b00a46cffe6d06sm13598eje.42.2024.03.21.08.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 08:04:25 -0700 (PDT)
Date: Thu, 21 Mar 2024 16:04:22 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Mikhail Malyshev <mike.malyshev@gmail.com>
Message-ID: <ZfxMdihnVqSNJZG6@nanopsycho>
References: <20240321-stmmac-fix-v1-1-3aef470494c6@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240321-stmmac-fix-v1-1-3aef470494c6@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Do not enable/disable
 runtime PM for PCI devices
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

Thu, Mar 21, 2024 at 02:54:15PM CET, mike.malyshev@gmail.com wrote:
>Common function stmmac_dvr_probe is called for both PCI and non-PCI
>device. For PCI devices pm_runtime_enable/disable are called by framework
>and should not be called by the driver.

I don't follow. The rest of the pm_runtime* functions are okay to call,
but enable() is not. Why? You need to provide more reasoning.


>
>For PCI devices plat->pdev != NULL. Use this fact to detect PCI devices

Sentence ends with "."

I assume this is a bug fix. Do you have a trace or some other symptoms?
Please add it to the patch description. You also need to add "Fixes"
tag.

Make sure you read:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html?highlight=network#tl-dr

Thanks

pw-bot: cr


>
>Signed-off-by: Mikhail Malyshev <mike.malyshev@gmail.com>
>---
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>index 24cd80490d19..db45d8dbc1eb 100644
>--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>@@ -7743,7 +7743,9 @@ int stmmac_dvr_probe(struct device *device,
> 
> 	pm_runtime_get_noresume(device);
> 	pm_runtime_set_active(device);
>-	if (!pm_runtime_enabled(device))
>+
>+	/* For PCI devices PM is disabled/enabled by the framework */
>+	if (!priv->plat->pdev)
> 		pm_runtime_enable(device);
> 
> 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
>@@ -7846,7 +7848,10 @@ void stmmac_dvr_remove(struct device *dev)
> 	mutex_destroy(&priv->lock);
> 	bitmap_free(priv->af_xdp_zc_qps);
> 
>-	pm_runtime_disable(dev);
>+	/* For PCI devices PM is disabled/enabled by the framework */
>+	if (!priv->plat->pdev)
>+		pm_runtime_disable(dev);
>+
> 	pm_runtime_put_noidle(dev);
> }
> EXPORT_SYMBOL_GPL(stmmac_dvr_remove);
>
>---
>base-commit: 23956900041d968f9ad0f30db6dede4daccd7aa9
>change-id: 20240321-stmmac-fix-f506d52882d2
>
>Best regards,
>-- 
>Mikhail Malyshev <mike.malyshev@gmail.com>
>
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
