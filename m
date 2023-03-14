Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 257C56B915F
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 12:17:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D638FC65E60;
	Tue, 14 Mar 2023 11:17:00 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3A3CC64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 11:16:59 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id br6so1336315lfb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 04:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678792619;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xqpuC0LKrzGcakbAULieo80qd/AxM1sSXYQ7KZfz9CA=;
 b=JfWQLDnss9RLHNQT55qIGS7gtnCy62QpDQIUDeg79wYVY91Jw/3YXc1F0z+nyOtiO2
 nFkf2/EEka2c/FmumixC9rihiTVJW3OJjXdGGjtfhIznb+dubYo3ONv0+F0XS+PXyRDD
 IWagIto5G2xwdRaSrZQ7Wd5dexIqaV34M4cKotJLIAIogNdJh/bqyv6qG2NUCJ3rn15G
 7nipq10oEMqOSJOfHKzu0U7dJRX0IusaF3FFWe37xqJMi+K3F/6iLJaPxgdshwhkQvma
 vMqNjiONBJOFOEgEk58PdFrCMWluAibeawFS1u/PPyXAIAzv9JV1QnJzNUtP31E3sdQR
 kQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678792619;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xqpuC0LKrzGcakbAULieo80qd/AxM1sSXYQ7KZfz9CA=;
 b=4Nz5GdMlDWjdtOgSjDVHk3hKvqyBNMegWsXuWnQcVE7YsLQIEr+VU8XTUJoDfNTfrO
 2LQTzwhARBEWifL/05xfrqdsOCLezRDrSDEivioUmu8cE2yQN7QYyPRa+ZDjKWoFT8Bg
 fabDfiI8bVQcC++y1j7L2m3VrsrfZae6Dgh9+fvky5e7p73dVVRauN9Z4lhuUoOo+r91
 eaux1L697woWWyBDNmDv4CKIG+HwOVRKoxpnqKqNnzrhy0N8d9OPnE15NxN+4oJ9ovDS
 zzggNnImlNSR5j6OL/JD3Aw0u6AnRMJ5mWVojihW6NOojbt2aXILgSBxJWsJj81nhm4I
 8o3A==
X-Gm-Message-State: AO0yUKUKjtDb7T6DPPHR3F2gHH0/PBnK3WippJvKPW1az5P2T5yfO9ru
 8cNKRJcHfTD9fJL0P6CayPY=
X-Google-Smtp-Source: AK7set9ZcenVszb/blJH1/YrWz7TaGM2/EeKvjtDVgJWlZfEvoGSveVyrjgsuwIuViFfdf8ZyAN9/Q==
X-Received: by 2002:a05:6512:4c7:b0:4b4:8f01:f8b1 with SMTP id
 w7-20020a05651204c700b004b48f01f8b1mr628005lfq.31.1678792618656; 
 Tue, 14 Mar 2023 04:16:58 -0700 (PDT)
Received: from mobilestation ([95.79.133.202])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a056512040a00b004dd7ddc696esm356706lfk.293.2023.03.14.04.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 04:16:57 -0700 (PDT)
Date: Tue, 14 Mar 2023 14:16:54 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20230314111654.x2nsdr7jmumg6bp7@mobilestation>
References: <20230313224237.28757-1-Sergey.Semin@baikalelectronics.ru>
 <20230313224237.28757-2-Sergey.Semin@baikalelectronics.ru>
 <c87c9964-af29-4885-a977-c8a4a2fe704e@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c87c9964-af29-4885-a977-c8a4a2fe704e@lunn.ch>
Cc: linux-kernel@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Russell King <linux@armlinux.org.uk>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Christian Marangi <ansuelsmth@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net 01/13] net: phy: realtek: Fix events
 detection failure in LPI mode
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

Hi Andrew

On Tue, Mar 14, 2023 at 01:39:43AM +0100, Andrew Lunn wrote:
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
> Since this is for net, you need to provide a Fixes: tag.

Hm, for some reason I was sure that all the patches in this series were
equipped with the Fixes-tags. Anyway since the patch fixes the particular
device malfunction then it's relevant to the commit initially adding the
device support:
Fixes: ef3d90491a15 ("net: phy: realtek: add rtl8211e driver")

I'll add that tag on v2. Thanks for reminding.

-Serge(y)

> 
>       Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
