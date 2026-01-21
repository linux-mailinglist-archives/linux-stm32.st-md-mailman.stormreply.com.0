Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGbIOuEDcWmgbAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 17:50:41 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3C75A217
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 17:50:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B612C58D7C;
	Wed, 21 Jan 2026 16:50:41 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD669C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 16:16:57 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-42fbbc3df8fso3972358f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 08:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1769012217; x=1769617017;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=BzzB/JdMiWn1k4ZgZ9PFa4Ldz6czCrDQgy/x5b2bitI=;
 b=Mkd3dJK4vMuTIJOOnYidBCED0U9pu38vaixBkS/xBAcZgF28/Dtfzm5G9sdgQJCrSI
 qXQWElVq94qSdmT6G5h7JOnJLg1NNSM1Cc30cS2VLp6FstOifNj70Japbjl+u6Dew4Gc
 msddj1eGtqN5Fi8d7okGdrFeo95Xqf2uuj9CV6mh3Ya6n+FWAXmaDFfMMVMhvv08hh2k
 coHmHF7DN/Au7U9OL2h+zCeSVamAAElqf47az6u5NSBi3CTd6D31oKnTYVPjLqzY5yep
 6I/ioWYd5HXbIdsHjWlkv14rr6P9JSQLJ1haWehB8/TFVoLfbo1rK96nWVdzL02pzG7/
 pkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769012217; x=1769617017;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BzzB/JdMiWn1k4ZgZ9PFa4Ldz6czCrDQgy/x5b2bitI=;
 b=nm5f2zkBBQR96iIFPDbbRFueFrIFAulYsR5XDVbvf2os4a1E0DdW8tZIGDogQ7uLf4
 7/Q6ocX7M53isJu0s65cG62j+MMNgj94hAcUpaNTlHX3jHhnVJZasn7kBYFh92sjjlVs
 bPLvAzmDB3dFAWQstR1d5DDAD12GQkiYac6VNb0dceq9cLEj/fnXaOJQ3DBEllupm5MA
 7UcmRcp5LpSfLpo4zUBx8JJFrfE4vtPrtfS/YfcLWLVKG9w+aiN6wZMhTFtFgPVR7b9v
 s0AskfXGnyMPpsdTbomc9cd5PkAhsNQYEbjnVtCSyq6IS1OaJXKc/zxwio381gJ0g7Ic
 odow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCXKbuNRHCbQN4ddmHIoRVTomGRE9oHob9n4sZd6BiOI/UvFZ9J/TsWpqnOeYXZhprlvnzRLhbvKA0zw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxRIc9PEHG0Kcb5Ztlw62wBEyhTg8oPzcvhS9pk2e5iy8owoU5r
 J4iJYEBeBozojn7EwFhwb+cUnqh1BCzr4cFNj4lNTDD4+LRRzsU+ODZfd/byycxqb8o=
X-Gm-Gg: AZuq6aJQfH6Jk3jzKIvB+oNQ+QlgEVRGG9H+a1RotZKomoAewqmmDCI8tIHmF325Kdm
 E0OeaxUahPHPHeVsGG/S1lznvERUmOgHzXCvd3X5Yel7ScjRVnE5VO1+0LiWmL2aN7E1hFLXdbc
 fCFaP+z+k718k4QbrY0sqjKdWP0qVA3vYdIKX6VyKkZ2H8C46Mwd1qWRJ4VQP2uUaQFohSU0Re1
 2/98diXB2pddd7uRlNhd1T2YWv74sshloTOuESP+/5KFjTKUEGDv7YOUaLi4g6RtYacrQt9sE5U
 XMGCpjidRYR4JIQT/IjWU67x8x1vEdcxxXBbX6UkrxVefTldmPiTjg2tvdglD69JOiR0B6agOrP
 iDfTp5BtkPwlkiwBCmYWNaJKalazJe+Xcb6YN+qEO+z8TsIBQAlTaqb5lbR2Hc2KduPwB6wlyY3
 6X38HQCfhCPnjrYzDaL28jq6f+i9vBgDbegFWQ0+s4WoLefLNgO2elKJEQ7tJDroDA
X-Received: by 2002:a05:6000:220e:b0:435:9770:9eb8 with SMTP id
 ffacd0b85a97d-4359770a243mr7280369f8f.25.1769012216858; 
 Wed, 21 Jan 2026 08:16:56 -0800 (PST)
Received: from [192.168.0.29] (static-95-59-231-77.ipcom.comunitel.net.
 [77.231.59.95]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4358e24cef3sm12633429f8f.0.2026.01.21.08.16.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 08:16:56 -0800 (PST)
Message-ID: <1e2d0c75-35d1-4096-a96f-c3fc6f7ce52a@suse.com>
Date: Wed, 21 Jan 2026 17:16:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jan.petrous@oss.nxp.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260121-dwmac_multi_irq-v2-0-3b829230d071@oss.nxp.com>
 <20260121-dwmac_multi_irq-v2-4-3b829230d071@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20260121-dwmac_multi_irq-v2-4-3b829230d071@oss.nxp.com>
X-Mailman-Approved-At: Wed, 21 Jan 2026 16:50:39 +0000
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC v2 4/4] stmmac: s32: enable support
	for Multi-IRQ mode
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[suse.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[suse.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jan.petrous@oss.nxp.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:chester62515@gmail.com,m:ghennadi.procopciuc@oss.nxp.com,m:s32@nxp.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[mbrugger@suse.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[oss.nxp.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,nxp.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[mbrugger@suse.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,suse.com:email,suse.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,4033c000:email,nxp.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: BB3C75A217
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 21/01/2026 15:23, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> To get enabled Multi-IRQ mode, the driver checks:
> 
>    1) property of 'snps,mtl-xx-config' subnode
>       defines 'snps,xx-queues-to-use' bigger then one, ie:
> 
>       ethernet@4033c000 {
>           compatible = "nxp,s32g2-dwmac";
>           ...
>           snps,mtl-rx-config = <&mtl_rx_setup>;
>           ...
> 
>           mtl_rx_setup: rx-queues-config {
>               snps,rx-queues-to-use = <2>;
>           };
> 
>    2) queue based IRQs are set, ie:
> 
>       ethernet@4033c000 {
>           compatible = "nxp,s32g2-dwmac";
>           ...
>           interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
>                        /* CHN 0: tx, rx */
>                        <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
>                        <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
>                        /* CHN 1: tx, rx */
>                        <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
>                        <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
>           interrupt-names = "macirq",
>                             "tx-queue-0", "rx-queue-0",
>                             "tx-queue-1", "rx-queue-1";
> 
> If those prerequisites are met, the driver switch to Multi-IRQ mode,
> using per-queue IRQs for rx/tx data pathr:
> 
> [    1.387045] s32-dwmac 4033c000.ethernet: Multi-IRQ mode (per queue IRQ) selected
> 
> Now the driver owns all queues IRQs:
> 
> root@s32g399aevb3:~# grep eth /proc/interrupts
>   29:    0    0    0    0    0    0    0    0    GICv3  89 Level   eth0:mac
>   30:    0    0    0    0    0    0    0    0    GICv3  91 Level   eth0:rx-0
>   31:    0    0    0    0    0    0    0    0    GICv3  93 Level   eth0:rx-1
>   32:    0    0    0    0    0    0    0    0    GICv3  95 Level   eth0:rx-2
>   33:    0    0    0    0    0    0    0    0    GICv3  97 Level   eth0:rx-3
>   34:    0    0    0    0    0    0    0    0    GICv3  99 Level   eth0:rx-4
>   35:    0    0    0    0    0    0    0    0    GICv3  90 Level   eth0:tx-0
>   36:    0    0    0    0    0    0    0    0    GICv3  92 Level   eth0:tx-1
>   37:    0    0    0    0    0    0    0    0    GICv3  94 Level   eth0:tx-2
>   38:    0    0    0    0    0    0    0    0    GICv3  96 Level   eth0:tx-3
>   39:    0    0    0    0    0    0    0    0    GICv3  98 Level   eth0:tx-4
> 
> Otherwise, if one of the prerequisite don't met, the driver
> continue with MAC IRQ mode:
> 
> [    1.387045] s32-dwmac 4033c000.ethernet: MAC IRQ mode selected
> 
> And only MAC IRQ will be attached:
> 
> root@s32g399aevb3:~# grep eth /proc/interrupts
>   29:    0    0    0    0    0    0    0    0    GICv3  89 Level   eth0:mac
> 
> What represents the original MAC IRQ mode and is fully backward
> compatible.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> index 5a485ee98fa7..823700219534 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> @@ -2,7 +2,7 @@
>   /*
>    * NXP S32G/R GMAC glue layer
>    *
> - * Copyright 2019-2024 NXP
> + * Copyright 2019-2026 NXP
>    *
>    */
>   
> @@ -149,6 +149,17 @@ static int s32_dwmac_probe(struct platform_device *pdev)
>   	plat->core_type = DWMAC_CORE_GMAC4;
>   	plat->pmt = 1;
>   	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
> +
> +	/* Check for multi-IRQ config. Assumption: symetrical rx/tx queues */
> +	if (plat->rx_queues_to_use > 1 &&
> +	    (res.rx_irq[0] >= 0 || res.tx_irq[0] >= 0)) {
> +		plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
> +		dev_info(dev, "Multi-IRQ mode (per queue IRQ) selected\n");
> +	} else {
> +		dev_info(dev, "MAC IRQ mode selected\n");
> +	}
> +
> +	plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
>   	plat->rx_fifo_size = 20480;
>   	plat->tx_fifo_size = 20480;
>   
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
