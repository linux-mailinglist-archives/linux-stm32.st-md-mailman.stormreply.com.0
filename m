Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CB1373260
	for <lists+linux-stm32@lfdr.de>; Wed,  5 May 2021 00:33:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 858FEC59784;
	Tue,  4 May 2021 22:33:43 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 489EAC59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 May 2021 22:33:41 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id p12so265365pgj.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 May 2021 15:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N/iQQC7fp/dtYGOuSg6VYXx30On1O4Podmv44Ld28t8=;
 b=cRTWCW0YlQcO68lQFrrYGCgLtQegbYPyhazNFTL3zL/R64bBPmvH0h5Tu9vqfIBhaF
 5KQaPkKxiejgQSJLD35yHwKXO0kqounJlwAw12ms9nnlolkco/OLqwvBLIhVZ3C8JiL9
 8QerknFPKHi/YlICqWSzmNX6BblRirN0iXoFDw4ZIy8Hr59eS6FCsdDuzxZtcEE+Se7S
 tF/BiljZhJZJA8XSMtEuRt9vzw2v9nvF3If9rwpc+sblXIiv5OGLf4zcqo44zSfNuLPS
 ZlrFjXr20bvOQdxkEgH4wAMqttnO4rhW1AwDhYnHNV++ihpOU8IzPzEwjUlM8cXiLYNM
 iGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N/iQQC7fp/dtYGOuSg6VYXx30On1O4Podmv44Ld28t8=;
 b=sLCOKzNKPygy+qYaL1NOG8VfdfEk0zKqJPTLMpNMHugxYNpVkd+wq2+I/nRYLb77Tm
 mH39FSu/3uzSw6wo+hNCO7GvBb7Z+sUV9b+4PiyH3+g9zsLBIKduoQhzqhAJdZy+Mb/E
 aTxpz/+rEsiPllFJjR7D5ZOILORL1va1+Xwp6txWnfBWMGgddw5GJ6BHb1YSGXhvja8X
 nIfnWNOj2BMUiRGZ4UgiuoKV9tHHq3e3VePhKC98zXWF9ApMrEsE4rwBE7Rpp0FCVCG2
 CjeA+I7FCniHressYHUIH58sx8IpIPdvGmLzTgJFK/zvB3AOO3yt4R1UWnKT2MqNV5b0
 HRdw==
X-Gm-Message-State: AOAM531MFMM4TS0H1GsJXU3vbbQligpUvSusulG9kgJ/hgxKyZpwfD0h
 xHFKeBEE4ZRzePfWhP/iXlc=
X-Google-Smtp-Source: ABdhPJxeUdey3txVslmafHpEU1z7jkArZjP7M9glN+el45WexOPrS6npD8eEng0OPRAMcqu3zUpE0A==
X-Received: by 2002:a63:f443:: with SMTP id p3mr25493518pgk.378.1620167619709; 
 Tue, 04 May 2021 15:33:39 -0700 (PDT)
Received: from [10.67.49.104] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id j16sm5013761pgh.69.2021.05.04.15.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 15:33:39 -0700 (PDT)
To: Ansuel Smith <ansuelsmth@gmail.com>
References: <20210504222915.17206-1-ansuelsmth@gmail.com>
 <20210504222915.17206-17-ansuelsmth@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <79cd97fe-02e8-4373-75a5-78ad0179c42b@gmail.com>
Date: Tue, 4 May 2021 15:33:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210504222915.17206-17-ansuelsmth@gmail.com>
Content-Language: en-US
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

On 5/4/21 3:29 PM, Ansuel Smith wrote:
> Add support for phylink_connect_phy to pass dev_flags to the PHY driver.
> Change any user of phylink_connect_phy to pass 0 as dev_flags by
> default.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

I do not think that this patch and the next one are necessary at all,
because phylink_of_phy_connect() already supports passing a dev_flags.

That means that you should be representing the switch's internal MDIO
bus in the Device Tree and then describe how each port of the switch
connects to the internal PHY on that same bus. Once you do that the
logic in net/dsa/slave.c will call phylink_of_phy_connect() and all you
will have to do is implement dsa_switch_ops::get_phy_flags. Can you try
that?
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
