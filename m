Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1098A8583BB
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Feb 2024 18:13:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBF82C65E42;
	Fri, 16 Feb 2024 17:13:57 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDE71C6410C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 17:13:56 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-42c754ddbc9so5708071cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 09:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708103635; x=1708708435;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pjvfE09Bk+j8kTulAxyHuFEo7lsn+ZYbAj8sdSsLEQI=;
 b=AhXlAgWGD/6tMjvQoGbvGjkV5RajgbhoEDGrrz/w0wIexkjyRmqlv5W4kp+XgNFJcq
 yS9cFfkA4yd1zVarD4tUYfcYWoLsAfHPdowNK6Ucox9T0kyaU6YKHHE7UlJMJqdNo9ob
 y9ddtXK9QZKNOgrhH6GLmmcPqamLa/SjdUqZaqRHAkrZRAeLtOw8wF61F6eWXtbJijcZ
 1xsR+xkae5MXMm1CoV1xOUnBNP73g1Ag26WckZ0n2LGDjqMSX4lgIIR3/eVIeGihoJZH
 xURKt6Lgp8aAoybNqBN+FU5nu68LkMUojbMIXicAlonauzeoyW5VaxQaecMtR3Z+eTNM
 2GeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708103635; x=1708708435;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pjvfE09Bk+j8kTulAxyHuFEo7lsn+ZYbAj8sdSsLEQI=;
 b=RUcLwZQfRfZF9EWNGhP/f/cfe3hOh+Tp4I3MxkEpUsbpUt11zEPNU6rRD7LWXV6Unm
 8lgp18yktLa3q8IH+tIT7klYo6kYocyn1IeU7+itQcr64Kvp/YV9ST4/BNdHIej5nhbJ
 zrFJnQy1DPUGRfQY42veC7wXScBX/hJLfEmYnR0RlfF0g6XxBmlXmvteKMjx+jYK7SjL
 0zjnB4b7kgPx4+PsnlecUO/zlFOXJE4hj7qgkBfv49iPMxutS3JXekCmGyc7B09JwXfn
 NE1mx68KBDcf0zv9DIy4+xK/qxUL6j7ef5AgSnCmGe5L/o1jxPbpp8upZBFNdlk5hv1L
 zXPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUod4a49y7h4k1UDhVyjzdoF4JB9zLfpKM7/dQ+l4kxlTfBR4cm18IwhiAu/IOgoknpXx/g/pYS/jkQyg6Jn9PxCtry3BNecC4IIKm55TMTXTyfHYvZyQN3
X-Gm-Message-State: AOJu0Yy0q60Y+PGE+cGe52jQywQmppo8xrb29EAJGe722RecGohARBNz
 MLQv7QdbhiRN3boMHZZx4FobRslKonVpTDiK7vxtrdCmwNTILGhL
X-Google-Smtp-Source: AGHT+IGwY7as3MWB8rYJ4I9pgzQYCKHYP5+MPcdYB0dE1tHD/o8J8JD84q4msCMJqeg9XyYibSA/xg==
X-Received: by 2002:a05:622a:15d6:b0:42c:7c75:b73b with SMTP id
 d22-20020a05622a15d600b0042c7c75b73bmr6001337qty.18.1708103635473; 
 Fri, 16 Feb 2024 09:13:55 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 y20-20020ac85f54000000b0042c5512c329sm105660qta.17.2024.02.16.09.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 09:13:54 -0800 (PST)
Message-ID: <61bdd802-abe4-4544-8e48-9493a6bb99c8@gmail.com>
Date: Fri, 16 Feb 2024 09:13:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jesper Nilsson <jesper.nilsson@axis.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20240216-stmmac_stats-v1-1-7065fa4613f8@axis.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240216-stmmac_stats-v1-1-7065fa4613f8@axis.com>
Cc: netdev@vger.kernel.org, kernel@axis.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: mmc_core: Assign,
 don't add interrupt registers
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 2/16/24 07:24, Jesper Nilsson wrote:
> The MMC IPC interrupt status and interrupt mask registers are of
> little use as Ethernet statistics, but incrementing counters
> based on the current interrupt and interrupt mask registers
> makes them worse than useless.
> 
> For example, if the interrupt mask is set to 0x08420842,
> the current code will increment by that amount each iteration,
> leading to the following sequence of nonsense:
> 
> mmc_rx_ipc_intr_mask: 969816526
> mmc_rx_ipc_intr_mask: 1108361744
> 
> Change the increment to a straight assignment to make the
> statistics at least nominally useful.
> 
> Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/mmc_core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
> index 6a7c1d325c46..6051a22b3cec 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
> @@ -280,8 +280,8 @@ static void dwmac_mmc_read(void __iomem *mmcaddr, struct stmmac_counters *mmc)
>   	mmc->mmc_rx_vlan_frames_gb += readl(mmcaddr + MMC_RX_VLAN_FRAMES_GB);
>   	mmc->mmc_rx_watchdog_error += readl(mmcaddr + MMC_RX_WATCHDOG_ERROR);
>   	/* IPC */
> -	mmc->mmc_rx_ipc_intr_mask += readl(mmcaddr + MMC_RX_IPC_INTR_MASK);
> -	mmc->mmc_rx_ipc_intr += readl(mmcaddr + MMC_RX_IPC_INTR);
> +	mmc->mmc_rx_ipc_intr_mask = readl(mmcaddr + MMC_RX_IPC_INTR_MASK);
> +	mmc->mmc_rx_ipc_intr = readl(mmcaddr + MMC_RX_IPC_INTR);

So in premise I agree with the patch, that incrementing those is not the 
right way to go about them. However these registers are currently 
provided as part of the statistics set, but they should instead be 
accessed via the register dumping method.

In either case you will get at best a snapshot of those two registers at 
any given time and I suppose this can help diagnose a stuck RX 
condition, but not much more than that.
-- 
Florian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
