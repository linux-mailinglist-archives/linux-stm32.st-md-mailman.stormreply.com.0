Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48320D3AAFD
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 15:00:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17E1AC36B3C;
	Mon, 19 Jan 2026 14:00:54 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4AFEC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 14:00:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A277043EC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 14:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79930C19424
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 14:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768831251;
 bh=HE73SGFgiopqRikw2FKculLOZOlYZlR6rqxK/wanCFk=;
 h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
 b=jwVKJjp9fns1b9wcslCE68MTZcgIfU6F5IeoOia67oQxU9ZTsL4T0ai4jPeX69jDG
 vY1+fpZmZcEYK0lqiSXuyy9QJSxNLWqzrEJvUVQuQFWSFaaGmfjPGWH1SzDLo2xz61
 vxns494nw4qas7fTVfZDKloTP6zl1HSMaWQQn2OQoZ69mZ221Udsr5vyEM/Im+rtx+
 tthgza1ro0XjZPTbDSjT1FhE/nNXT0A4u6m6k+nd8e9/ATR2K1gxUmPzsrtEi0Q2U8
 1DvpW+Au1cbaon6rQDxzuh5jY43wdtpylbec8gATzBbHxp53/osb5a2zmVxPuEwco2
 WFyTE1ioCZqAQ==
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-59b6a987346so3942002e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 06:00:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX4JjpSm3ZGEXUUyfY7B1MHZMqGYTHxuSub9L6l2yif46d6POFK5ETnIiSTDI7z0gg5KKME41c1T3WgYw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxGcxDhGovYk9Tq+v1UdmbXMK9oB+cTocQmJ0ChyW1T3SmzUcvq
 q0wY+qQBYGW37YWZx55coxE4XoBBOea0+FsN8M40+XXwJaAkDMOdm79rE64AlHzsUZepvgtbJ7i
 z2adhWuhBAOATNiI9V075TqlkX2BvJCvyzgvCViYl+g==
X-Received: by 2002:a05:6512:3c88:b0:59b:9f6f:20b1 with SMTP id
 2adb3069b0e04-59bafeb6f0dmr3932244e87.21.1768831250152; Mon, 19 Jan 2026
 06:00:50 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Jan 2026 14:00:49 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Jan 2026 14:00:49 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <E1vhoS7-00000005H1T-1dXt@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
References: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
 <E1vhoS7-00000005H1T-1dXt@rmk-PC.armlinux.org.uk>
Date: Mon, 19 Jan 2026 14:00:49 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfqJiHi1Ug92izGoL9CVty7-ijP0+6-m6hMyEJbZeLyBA@mail.gmail.com>
X-Gm-Features: AZwV_QghYvQWH9GY8wcodXLcC8y2z84EtqfT-DXsw94HUPeCH7ZRyaHEOMNrN9A
Message-ID: <CAMRc=MfqJiHi1Ug92izGoL9CVty7-ijP0+6-m6hMyEJbZeLyBA@mail.gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 03/14] phy: qcom-sgmii-eth: add
 .set_mode() and .validate() methods
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

On Mon, 19 Jan 2026 13:33:51 +0100, "Russell King (Oracle)"
<rmk+kernel@armlinux.org.uk> said:
> qcom-sgmii-eth is an Ethernet SerDes supporting only Ethernet mode
> using SGMII, 1000BASE-X and 2500BASE-X.
>
> Add an implementation of the .set_mode() method, which can be used
> instead of or as well as the .set_speed() method. The Ethernet
> interface modes mentioned above all have a fixed data rate, so
> setting the mode is sufficient to fully specify the operating
> parameters.
>
> Add an implementation of the .validate() method, which will be
> necessary to allow discovery of the SerDes capabilities for platform
> independent SerDes support in the stmmac network driver.
>
> Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
