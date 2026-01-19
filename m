Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CE8D3AAF9
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 15:00:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02356C36B3C;
	Mon, 19 Jan 2026 14:00:31 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50AEBC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 14:00:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6429660155
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 14:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B156C116C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 14:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768831228;
 bh=nNTJfPbd1YV6us6RVjuHf5jxYqDR5Sbvdeb3Dsc1xvI=;
 h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
 b=pdYbfJGHG6uBap4/e9bmMarjkkiNdRe9fRYqdN7i4A/sdOiO4T4cy1mApkJOZL9BF
 xyw38NWyAgJQf0wpL2/5yVZOnSxh1jPyZgJiCQ/A5dvfiNhy22KA1nsGtMruS1yGj6
 JjTL8m1bSaJRKrB/TDYrL2sXtbSpNuFNnoq7yqgvlwWw+IMDlzjj326C0IvYcV1RTr
 /pv5Ly6VU6tj9BPDAimXxLHPxOkpN7P95mQ0e31Dm99oOPzF/jj3IwNmjjmCcKSIhD
 LMztVe4CV+6kCHOCRxg+NWSIKu9rr5pTEe9gw20oFSMcthwlondgL+h+OTL9gt4TFj
 8gTA5Qj4nmRgg==
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-59b6c905a46so4407556e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 06:00:28 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUvDE7CizOO74KB0NksK+aC8ljfFb8ahyzGybn90RmJ52Eu8LngwKk1s/v8mS5/pnizJyUmtkmbaVX1Mw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwkPp2WRSg2w/PehHGYh9Tbx+C0fmGLVDVbfrZYP5En5AHLOM+r
 gDj2FCkWZwahYZ2QWqlzFssrLqLwieYe9mxExKkxTKNTPEB7yEmfbxOY7hoHL4aqs+EdBUVDikE
 jeLd1B44K72XVFKb6jSNJhAaIubWBzblWOS67TPb+yA==
X-Received: by 2002:a05:6512:3c90:b0:59b:809c:f659 with SMTP id
 2adb3069b0e04-59baef00064mr3462366e87.40.1768831225908; Mon, 19 Jan 2026
 06:00:25 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Jan 2026 14:00:24 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Jan 2026 14:00:24 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <E1vhoS2-00000005H1N-12dx@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
References: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
 <E1vhoS2-00000005H1N-12dx@rmk-PC.armlinux.org.uk>
Date: Mon, 19 Jan 2026 14:00:24 +0000
X-Gmail-Original-Message-ID: <CAMRc=Me9wAstONC60jdu0z1QrADZ01_2+goZ1pOXbAx04W5LDA@mail.gmail.com>
X-Gm-Features: AZwV_QiictzFqKNrCGHQtJGJYIyDzY-qHcNhS9W5nbIYTCl5UyVNn5jCiAv_d8c
Message-ID: <CAMRc=Me9wAstONC60jdu0z1QrADZ01_2+goZ1pOXbAx04W5LDA@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next 02/14] net: stmmac: qcom-ethqos:
 convert to set_clk_tx_rate() method
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

On Mon, 19 Jan 2026 13:33:46 +0100, "Russell King (Oracle)"
<rmk+kernel@armlinux.org.uk> said:
> Set the RGMII link clock using the set_clk_tx_rate() method rather than
> coding it into the .fix_mac_speed() method. This simplifies ethqos's
> ethqos_fix_mac_speed().
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
