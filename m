Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C87948016
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2024 19:11:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2ECF3C71290;
	Mon,  5 Aug 2024 17:11:22 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB1D8C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2024 17:11:14 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52efaae7edfso9925509e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Aug 2024 10:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722877874; x=1723482674;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=T+a9I4B8X1X5aIxeJdN5EzFMzXDoBQTuQJmnsOqPxxQ=;
 b=HsEP+KrdSlLP0LcM02C0Cl3iZ04zDicMQWaOrN1AbnM630dh6c52BpTylRk8bYyCpG
 aUQIXNx4OYO+ScH7mqrLx73rioMnt9YsOMEWItfbo+75YUwm+s3bYcH11I8++cWWZPDw
 fwHa7Frp2DINavqAI5a0qzeBQ4hXb7DQ1Gi/Fm/m7jSXuGtqt84tow9bnsygTP5zkqBZ
 MKxFP0tTuay8MXvgZOdkgXuAB1nUQxlpPS/g40t/fIFq/4q3fhHCbyL8Y+G0tOM35cGm
 BQ5g0Ov0QVGPsLYLHWjgecCRwO4IUuBNCVt+CcmxBtrtmi1SCnAKhQLxI7BPMgCmeha/
 hmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722877874; x=1723482674;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T+a9I4B8X1X5aIxeJdN5EzFMzXDoBQTuQJmnsOqPxxQ=;
 b=eUHQWoEaThGa3Rv6Wqe1h1mw1jkjaGmEoWMgRM453CmIugita9YZOq6fPUDFTeFjTY
 Np4A8ZGakEbE3yCOy2A/nsB2HIm5gMG4n2/Pr81I0Pmx8DCuwBF5bsf97AD0Bxf9oS2Z
 xQ0q2OnzLs4RFyuJECxb+OjOH41IJO1oSBjG9QOd03AF+zQPJO0H1FUrNKvUuj5KPo9X
 Qm0gmNkpEsLcxT9z08MqR0OSYOdKi7Q/03rJrNYqgAfVsLfyQXj5WSATJ3mUFLH6eEc5
 25OwqyP9IZGeiOyRnkQpp2eJBPiHUBXRx3UtbpYu/JHJcchADsfMu8FAcB2G1VyuTsQW
 lVjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7WicIVWD1hRKvQ2qhEfDYreWeCJthP/nPABRl+tYIoShDbBxWfqYz1Yj5QpYzs877hdrAfM0yTiQwprfIqtGgfbuXc81GSMjlJL427V4NZBlGWG2HQg3j
X-Gm-Message-State: AOJu0YyQBzNQhiIb3OyREogLKDsf50Vqr5hfnkjcJnZD/KSzlTIiUOWs
 j9fcLQv0QLtJB2DWgUWQupvA13OCUyInJarVvmHWRUIMWT3jaGhO
X-Google-Smtp-Source: AGHT+IGReApxJ2c/JFELCklqQSZ8g1Zowv7VKiMDnfR8yosFr20pzjqYqbBTCKh6qA5FufB227lXRg==
X-Received: by 2002:a05:6512:3b06:b0:52e:9dee:a6f5 with SMTP id
 2adb3069b0e04-530bb4d7621mr7953615e87.46.1722877873589; 
 Mon, 05 Aug 2024 10:11:13 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba4aa0esm1202769e87.309.2024.08.05.10.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 10:11:13 -0700 (PDT)
Date: Mon, 5 Aug 2024 20:11:10 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Furong Xu <0x1207@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
Message-ID: <max7qd6eafatuse22ymmbfhumrctvf2lenwzhn6sxsm5ugebh6@udblqrtlblbf>
References: <cover.1722421644.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1722421644.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, rock.xu@nio.com,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 0/5] net: stmmac: FPE via
	ethtool + tc
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

Hi Furong

On Wed, Jul 31, 2024 at 06:43:11PM +0800, Furong Xu wrote:
> Move the Frame Preemption(FPE) over to the new standard API which uses
> ethtool-mm/tc-mqprio/tc-taprio.

Thank you very much for the series. I am not that much aware of the
FPE and ethtool MAC Merge guts. But I had a thoughtful glance to the
FPE-handshaking algo and got to a realization that all the FPE-related
data defined in the include/linux/stmmac.h weren't actually
platform-data. All of that are the run-time settings utilized during
the handshaking algo execution.

So could you please move the fpe_cfg field to the stmmac_priv data and
move the FPE-related declarations from the include/linux/stmmac.h
header file to the drivers/net/ethernet/stmicro/stmmac/stmmac.h file?
It's better to be done in a pre-requisite (preparation) patch of your
series.

Another useful cleanup would be moving the entire FPE-implementation
from stmmac_main.c to a separate module. Thus the main
driver code would be simplified a bit. I guess it could be moved to
the stmmac_tc.c file since FPE is the TC-related feature. Right?

Vladimir, what do you think about the suggestions above?

-Serge(y)

> 
> Furong Xu (5):
>   net: stmmac: configure FPE via ethtool-mm
>   net: stmmac: support fp parameter of tc-mqprio
>   net: stmmac: support fp parameter of tc-taprio
>   net: stmmac: drop unneeded FPE handshake code
>   net: stmmac: silence FPE kernel logs
> 
>  .../net/ethernet/stmicro/stmmac/dwmac4_core.c |   6 +
>  drivers/net/ethernet/stmicro/stmmac/dwmac5.c  |  37 +++++-
>  drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |   7 ++
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    |  14 +++
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   3 +
>  .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 111 ++++++++++++++++++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  25 ++--
>  .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |  95 ++++++++++-----
>  include/linux/stmmac.h                        |   2 +-
>  9 files changed, 248 insertions(+), 52 deletions(-)
> 
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
