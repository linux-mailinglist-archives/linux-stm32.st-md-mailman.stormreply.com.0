Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B4C7A3269
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Sep 2023 22:17:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 207C0C6B45F;
	Sat, 16 Sep 2023 20:17:06 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A55CBC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Sep 2023 20:17:04 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-500cfb168c6so5351459e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Sep 2023 13:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694895424; x=1695500224;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UNhhSv5EciaOBb+e1S2UjWYyLKGfXoLDerHcISpMZ/M=;
 b=Gy9ArOV9pyRJci4fGtP9p1bMjjES9zfQutGfUtTnCG4H1MUSLh67roZ7zF6yuyDF+x
 n6c6E0O3EPICjjI3FQV7GNfqLCLoQkK9OkzM/6iIKHUNzS0sZVsRKBMXpO2d2o7J3hvO
 VXizSB4BBdlYxlC/zyd5QPCP3WoTbJ36ZgyoeM4vWs9kHQ6zfGZs5P90axF3ZG7ZVvZY
 rknwroW68/Kzfc9A8M3Nqvvn6bjMqD9491VF+QDgTzJUsO3bCOeO8tnC2xIIR7ZMLxZM
 lolNvBUNUL4UiF2pn9440HqzEI4eqHGcX88o5d5xkce9PyM6hJt4CgyMBJCRmldW7B6S
 /imQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694895424; x=1695500224;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UNhhSv5EciaOBb+e1S2UjWYyLKGfXoLDerHcISpMZ/M=;
 b=UEfUk7jDI8wdm/QQQUvLFPTCiHzBKApyWKdHtnjQ3d3GE6fj28An8HPfxky4j7mIKy
 Ud/BlbJeSUnWc7M+Z5X42m5x06+aKTRZLYle+WDro87SQqQjwzdUClQxRkn6MCEPnQvp
 i+QlkOGrEc/+BR5v2J04Y+TYJDXKHd3BTrWQV1qc9H8VcPNfV50GIuWqdNGaYdyiT5vp
 KldzzgXHYZQHqFNrlJJQnHlw6+VNRRoDC0Udw4LaOlPkdMlHpgg2V1HHSSCOKfJEHEQ8
 beuPD5TU0jTkeJMeSqyeH/CkSmyMmmNGuFVmtj3RpsJ1wav+lO04VmZpxqzQfh1NTNv7
 fRWg==
X-Gm-Message-State: AOJu0Ywy74pbHpxl4sC8LNpYvcTbaQuccizxd37DswW1Tmu8zJP6qYq9
 4yluk+TS5SEpF0a1HQ4JcXk=
X-Google-Smtp-Source: AGHT+IH/c4i0uop45XSoB3FVHudZLfQx+wFFjmngE5fSGUxt14oE+PYAFRWGPEKb4HXVctYTbkYdMQ==
X-Received: by 2002:a05:6512:a96:b0:4f8:7513:8cac with SMTP id
 m22-20020a0565120a9600b004f875138cacmr5451811lfu.48.1694895423484; 
 Sat, 16 Sep 2023 13:17:03 -0700 (PDT)
Received: from mobilestation ([95.79.219.206])
 by smtp.gmail.com with ESMTPSA id
 h10-20020ac25d6a000000b004f85d80ca64sm1140038lft.221.2023.09.16.13.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 13:17:02 -0700 (PDT)
Date: Sat, 16 Sep 2023 23:17:00 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <c7jenrfdzdbvg4wa4pukan7qb6sumigulafmwgmiyjoexr5w3d@djcti5cf6b6s>
References: <ZQMPnyutz6T23E8T@shell.armlinux.org.uk>
 <E1qgmkp-007Z4s-GL@rmk-PC.armlinux.org.uk>
 <7vhtvd25qswsju34lgqi4em5v3utsxlvi3lltyt5yqqecddpyh@c5yvk7t5k5zz>
 <ZQMgtXSTsNoZohnx@shell.armlinux.org.uk>
 <rene2x562lqsknmwpaxpu337mhl4bgynct6vcyryebvem2umso@2pjocnxluxgg>
 <ZQMmV2pSCAX8AJzz@shell.armlinux.org.uk>
 <ZQMnA1PgPDDQzDrC@shell.armlinux.org.uk>
 <DM4PR12MB50888CA414C76F5C59C27E50D3F7A@DM4PR12MB5088.namprd12.prod.outlook.com>
 <uzvjph54kg2jkfbmwrvmunqv64ig7j6szr6pxxbiesnz5lletg@zq57w7jj2up4>
 <DM4PR12MB5088A61E5F067EB459C06CCFD3F6A@DM4PR12MB5088.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM4PR12MB5088A61E5F067EB459C06CCFD3F6A@DM4PR12MB5088.namprd12.prod.outlook.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Samin Guo <samin.guo@starfivetech.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alexei Starovoitov <ast@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 4/6] net: stmmac: rk: use
 stmmac_set_tx_clk_gmii()
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

On Fri, Sep 15, 2023 at 08:38:51AM +0000, Jose Abreu wrote:
> From: Serge Semin <fancer.lancer@gmail.com>
> Date: Thu, Sep 14, 2023 at 18:05:09
> 
> > I actually thought the driver has been long abandoned seeing how many
> > questionable changes have been accepted. That's why I decided to step
> > in with more detailed reviews for now. Anyway It's up to you to
> > decide. You are the driver maintainer after all.
> 

> It's up to everyone to decide. I understand your comments on the patchset
> and agree with most of them 

Ok. Thanks for clarification. I'll keep reviewing the bits then
submitted for the STMMAC driver based on my knowledges of the driver
guts and the DW GMAC/XGMAC/Eth QoS IP-cores implementation.

> but on the topic of changing the entire
> patchset to add the fix on "plat_stmmacenet_data->fix_mac_speed",
> I don't think it's on the scope of this series.

That's what I meant in my comment. Of course it's out of the series
scope.

-Serge(y)

> 
> Thanks,
> Jose
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
