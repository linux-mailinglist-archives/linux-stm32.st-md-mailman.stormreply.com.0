Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF0A37333B
	for <lists+linux-stm32@lfdr.de>; Wed,  5 May 2021 02:35:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0411C59783;
	Wed,  5 May 2021 00:35:32 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA427C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 May 2021 00:35:29 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id d14so12508922edc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 May 2021 17:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GQcBXhiG4WSKbf/NKH+KIteUYu6u/x6SNCEh0wAhXc4=;
 b=MIPpoTfg07W36wb7bopairhQEaQzQYki7Tpcwd8BU+s7fyNlDmnJpkewhI9gD3wVlo
 QkkfmJPdI7MeQBQnqt2zirp41ojwrtpuelnJT3Uwgk3UGLKwfBdDmJLfPIZtJqzifFSv
 rMoSIyTtVygXCpVHDJNBpvRXaFoqvvuL9JBjZjf/FD3tlLptBV6+dJ8RpSGFT5gWgKkn
 TdW1vEJgtdLk+DgqtAITpHO8gheN5qjVZiz0kxazHQkbTx28RTTFR7QdAnaRIQ3p1dCf
 D3LigiZZemA+zx6H1VwgfuBICIZnDpvH3T2YuIFBUeHk9Dh7uGLqSnXHrkMYax55wfMB
 9wSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GQcBXhiG4WSKbf/NKH+KIteUYu6u/x6SNCEh0wAhXc4=;
 b=p/zk26ghitkjVyRbKOwxZElZj68Ly7nkG0QRUQ7M3lyR4p2NNyp6KOrZ2XNOVkwROw
 B/htg8kU/OtzLNdZ/Q3SuNGaRh/rC/3IUXFdqwuCnBsrramRWdhGTUZnDPtcbVPiLq8T
 wbCQMywtRMuzFa0iJT5HGRkkK9JpuJ4gII22QZa8LagfluxgiDPQdl/VQVF2VEpdUU8x
 ymi+Q5Nj3+olKzLaKgKxN7Cc8wzubmR9BAlnnyrQ5fi/cIrO5vW74N9U40H2mK/onqGJ
 4YhUw0N14pT4CXIA/v3ilPbLxvTZE8g1zJdZTbTxRvu5xcRA2DcZSxAkr2a1BQyKVAaa
 K/jw==
X-Gm-Message-State: AOAM533X5aJ9DvUuO1URHYDywgSxzHTq2MD9nMCoUDr90CaZ5+9i/QmC
 wm2/YAP713lON7BIGW5GYzI=
X-Google-Smtp-Source: ABdhPJzJ28LwP1ruNR/6xg95ajBMTXpp2+a15spYOqcq7u3I/Ju4F8LD2joilelT7IoSnEVB/LmYpg==
X-Received: by 2002:a05:6402:36d:: with SMTP id
 s13mr29337677edw.103.1620174929306; 
 Tue, 04 May 2021 17:35:29 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.gmail.com with ESMTPSA id ne17sm2103286ejc.56.2021.05.04.17.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 17:35:28 -0700 (PDT)
Date: Wed, 5 May 2021 02:35:25 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <YJHoTYfa03Yq5NwZ@Ansuel-xps.localdomain>
References: <20210504222915.17206-1-ansuelsmth@gmail.com>
 <20210504222915.17206-17-ansuelsmth@gmail.com>
 <79cd97fe-02e8-4373-75a5-78ad0179c42b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <79cd97fe-02e8-4373-75a5-78ad0179c42b@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [RFC PATCH net-next v3 17/20] net: phy: phylink:
 permit to pass dev_flags to phylink_connect_phy
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

On Tue, May 04, 2021 at 03:33:36PM -0700, Florian Fainelli wrote:
> On 5/4/21 3:29 PM, Ansuel Smith wrote:
> > Add support for phylink_connect_phy to pass dev_flags to the PHY driver.
> > Change any user of phylink_connect_phy to pass 0 as dev_flags by
> > default.
> > 
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> 
> I do not think that this patch and the next one are necessary at all,
> because phylink_of_phy_connect() already supports passing a dev_flags.
> 
> That means that you should be representing the switch's internal MDIO
> bus in the Device Tree and then describe how each port of the switch
> connects to the internal PHY on that same bus. Once you do that the
> logic in net/dsa/slave.c will call phylink_of_phy_connect() and all you
> will have to do is implement dsa_switch_ops::get_phy_flags. Can you try
> that?

I did some testing. Just to make sure I'm correctly implementing this I'm
using the phy-handle binding and the phy-mode set to internal. It does
work with a quick test but I think with this implementation we would be
back to this problem [0].
(I'm declaring the phy_port to the top mdio driver like it was done
before [0])

I was thinking if a good solution would be to register a internal mdio driver
in the qca8k code so that it can use the MASTER reg.
(it's late here so I could be very confused about this)

I think that using this solution we would be able to better describe the phy
by declaring them INSIDE the switch node instead of declaring them
outside in the top mdio node. The internal mdio driver would register
with this new mdio node inside the switch node and use the custom mdio
read/write that use the MASTER reg.

[0] http://patchwork.ozlabs.org/project/netdev/patch/20190319195419.12746-3-chunkeey@gmail.com/

> -- 
> Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
