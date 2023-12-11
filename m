Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 301AD80CB3C
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Dec 2023 14:40:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D23B9C6B458;
	Mon, 11 Dec 2023 13:40:13 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5DC9C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 13:40:11 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a1ca24776c3so1131501166b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 05:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702302011; x=1702906811;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1DOYBiSnMBUZpB8aPlwqoVslXzDkYwM7n0lC23HDZjU=;
 b=acXmH+w7ylDLRXpL9VApgd8Tpt+p0oGKvG8N/RDc3EZLYE4sz9i8DnJX941o9rolrs
 valRy3H1I3wDQpdXcDLjcAEvQFiC8t6QECrleJphpRgfS2vSBHNeZAIeezpb23a6OesS
 BknKxk2wtRi0J5bI/uDNU09ZAwpjXTAbCVbtiXeHUbzgdZTC9EImNy3+ueCVbSaHao//
 w7lnQ4K5fk8Lftu8UMGzBQsjx8GZSNtfetDazd0eqIg/L9J3nyy0n5KOoWMEOpsWy8sp
 ytVjNYSr+K5UNirS2igV3SV059OMIixO3VjqWCpul7qYlSx62pwIqvcDdF8+fnJkByKz
 a6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702302011; x=1702906811;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1DOYBiSnMBUZpB8aPlwqoVslXzDkYwM7n0lC23HDZjU=;
 b=SS7XsKlnDQxSxzgwEIVFm44M6Z9aQKk1jgwDCb+Xlvt1vB7Vz4BldebA43Vh537+Gq
 Ofgza/CaOJ6nwBNE155MGkQk0V8AkciU27G9PGFcl0V4FMFI5dpFs+6UNjrdCVD1Wq8R
 t+dW7O3FERADv2z52AEb8SQC8bCnG7+NPl2rWuTWhhj7UC2TyHsSl8YYj3BQwu3yvmQ3
 zMLvVOtvboNLo5KEeKDYb7+JEwaQs+Z4HvlFUo+kDzcMGxtmGjTYaj7kM0PMFQReil31
 SYszNvzlCwgseOWFpQj5KufAzxbXCvSs5CayfAWuHL5/jl2/iKKH9Y2qqnADOg3MvVxU
 5Wjg==
X-Gm-Message-State: AOJu0YyPu6IPQmPPL41nBfAkdSQ+EoKCWruW2ttjfrp3F8jqCe7P7dWz
 m4ICJO9hFbLLVy5N7awR/DE=
X-Google-Smtp-Source: AGHT+IG1DcEeU91kg6P+z6Hh0pDv+PfBGoLPpOL7Q7t0PdRFfZLow75jSesZQXYB3JHKVwCeNnRYBQ==
X-Received: by 2002:a17:906:241:b0:a1e:842d:ccd5 with SMTP id
 1-20020a170906024100b00a1e842dccd5mr3960239ejl.48.1702302010984; 
 Mon, 11 Dec 2023 05:40:10 -0800 (PST)
Received: from skbuf ([188.27.185.68]) by smtp.gmail.com with ESMTPSA id
 vx6-20020a170907a78600b00a1e852ab3f0sm4911417ejc.15.2023.12.11.05.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 05:40:10 -0800 (PST)
Date: Mon, 11 Dec 2023 15:40:08 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Jianheng Zhang <Jianheng.Zhang@synopsys.com>
Message-ID: <20231211134008.lbtm6pjtufkhtvfj@skbuf>
References: <CY5PR12MB63726FED738099761A9B81E7BF8FA@CY5PR12MB6372.namprd12.prod.outlook.com>
 <CY5PR12MB63726FED738099761A9B81E7BF8FA@CY5PR12MB6372.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY5PR12MB63726FED738099761A9B81E7BF8FA@CY5PR12MB6372.namprd12.prod.outlook.com>
 <CY5PR12MB63726FED738099761A9B81E7BF8FA@CY5PR12MB6372.namprd12.prod.outlook.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 open list <linux-kernel@vger.kernel.org>, James Li <James.Li1@synopsys.com>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Martin McKenny <Martin.McKenny@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: xgmac3+: add FPE
 handshaking support
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

Hi Jianheng,

On Mon, Dec 11, 2023 at 06:13:21AM +0000, Jianheng Zhang wrote:
> Adds the HW specific support for Frame Preemption handshaking on XGMAC3+
> cores.
> 
> Signed-off-by: Jianheng Zhang <Jianheng.Zhang@synopsys.com>
> ---

It's nice to see contributions from Synopsys!

Have you seen the (relatively newly introduced) common framework for
Frame Preemption and the MAC Merge layer?
https://docs.kernel.org/networking/ethtool-netlink.html#mm-get
https://man7.org/linux/man-pages/man8/ethtool.8.html
https://man7.org/linux/man-pages/man8/tc-mqprio.8.html # "fp" option
https://man7.org/linux/man-pages/man8/tc-taprio.8.html # "fp" option

I think it would be valuable if the stmmac driver would also use it, so
it could support openlldp and pass the selftest at
https://github.com/torvalds/linux/blob/master/tools/testing/selftests/net/forwarding/ethtool_mm.sh
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
