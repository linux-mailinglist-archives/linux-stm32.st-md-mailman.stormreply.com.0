Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F455A8F43
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Sep 2022 09:06:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37216C03FDB;
	Thu,  1 Sep 2022 07:06:56 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C26E6C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Sep 2022 07:06:54 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id j204so7352822ybj.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Sep 2022 00:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=zK32TEUGn/Arvhzey5bx898nOws+A6RDwPmVxDOXRRM=;
 b=OeX9NMuQiEuDkLAHz6Ts3OmmYlLl/gRRAxrz7ydEg+aQp8cEQtJZfKwW/oJrZ+zanE
 tF3nN9vStDEFgDenYvzGX0NBE4v+G4psAcvPmmQamitEnSSosX0riC0+jT3/41smTjP8
 LqO9qCYy9QmD3bN1ulpmxxOHu1NpEv5uBHkmHb75WJ/01LdBb6rsB7tKCrloecTfLtRi
 KCXy+BAIb5ZFvTM8WYDJ+PHmkDnj0YTfUCozOZPmfppZMWF0YL0OYMGh0H9TJBmA65ut
 HyNnkayrlawPVD9Ny9t0S3Jpz9y6Ar8pddjDRVC0QnR7bLqlZrpV1vXa0dEYWnG40mz5
 KKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=zK32TEUGn/Arvhzey5bx898nOws+A6RDwPmVxDOXRRM=;
 b=LyqAnQuOw80tNh7Pi+IB9R7RodQgyvAFQA1EXT2aJ2lkvt7mpoNq+gVW7kfuAl5C+z
 0sQHDgs7oYZ5J5yF5nNnbKoJXKT9g7fdjUfidOkmGj90KNTI9HdHWZBy0AG/5mK3+4Yt
 7c9Tf3zFEPKAT4ztwAGmtOSoCtqSr1uyi8qU+aHIgHGz+yb2oPa2WcfIJhAzQwJTgi5l
 M6PiSnX9HBrerE1DuiUqUrdqn6aYaGhKtCJegX6/avHXaNu+kIzDzd3tU5x9HIr/VKCc
 +hHL2pL4S+47SYIh5efqa100IorSVm3owzGFYe7sHFwU23KyWrESAND64QYiMsKqti+R
 9Stg==
X-Gm-Message-State: ACgBeo09IyrOi0xj9td7Af1U7UXB6KIFdprQOqYKk7rbc2AqgQX+YpDm
 5AD/ocr9/py1QqYF7AZwzDo3WPv1PawdFVk3H+SqAw==
X-Google-Smtp-Source: AA6agR7txfyyGwgcudxqDLdEC3BY5D6O/gOKss/ew2QiR82vMl/EkDoLUSR9VwKAqGazOuqej+7FuDxpZ3nJTHT+438=
X-Received: by 2002:a25:485:0:b0:69e:f6e0:abb9 with SMTP id
 127-20020a250485000000b0069ef6e0abb9mr3103346ybe.524.1662016013713; Thu, 01
 Sep 2022 00:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220829065044.1736-1-anand@edgeble.ai>
 <20220829065044.1736-2-anand@edgeble.ai> <Ywy6o2d9j4Z7+WYX@lunn.ch>
In-Reply-To: <Ywy6o2d9j4Z7+WYX@lunn.ch>
From: Anand Moon <anand@edgeble.ai>
Date: Thu, 1 Sep 2022 12:36:43 +0530
Message-ID: <CACF1qnfmzcq55GvsD=GQ+ciLRstZ-7ef1EDaBzKMqBzU0O+WRw@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 David Wu <david.wu@rock-chips.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@edgeble.ai>, Sugar Zhang <sugar.zhang@rock-chips.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] net: ethernet: stmicro: stmmac:
	dwmac-rk: Add rv1126 support
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

Hi Andrew,

On Mon, 29 Aug 2022 at 18:40, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Aug 29, 2022 at 06:50:42AM +0000, Anand Moon wrote:
> > Rockchip RV1126 has GMAC 10/100/1000M ethernet controller
> > via RGMII and RMII interfaces are configured via M0 and M1 pinmux.
> >
> > This patch adds rv1126 support by adding delay lines of M0 and M1
> > simultaneously.
>
> What does 'delay lines' mean with respect to RGMII?
>
> The RGMII signals need a 2ns delay between the clock and the data
> lines. There are three places this can happen:
>
> 1) In the PHY
> 2) Extra long lines on the PCB
> 3) In the MAC
>
> Generally, 1) is used, and controlled via phy-mode. A value of
> PHY_INTERFACE_MODE_RGMII_ID passed to the PHY driver means it will add
> these delays.
>
> You don't want both the MAC and the PHY adding delays.
>
These are set to enable MAC transmit clock delay set for Tx and Rx for
iomux group.
>
>     Andrew

Thanks
-Anand
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
