Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 064EC90C6CE
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2024 12:27:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB010C78001;
	Tue, 18 Jun 2024 10:27:00 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4B15C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 10:26:53 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52c7fbad011so6174787e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 03:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718706413; x=1719311213;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Hk2nCrXYKa/i3AuAbXWHqowD8DL46I50YE8wSmEWrP4=;
 b=T+b5R1Oaqo7B9QhPud0EkHhfWKEMbDU2rYv+KLx263yo6Qcww3v1FnssSOV1Temrcl
 cYf/IZB+O401m/HHFNAq4c2MiolgV/s0/U/CBErYDDFBU1du+lomwrUBSvMpoNB6OQWx
 rUwGUdOCkdsOmKke2cMv2ntRevEdI8+KdnQL3CtQ665Xap1+LF90Uu7espTIEIxgE+Un
 TwVo5OyDz+pBt3TsBUpQVxGl1Tg94jWxxx6bunc/+ZiHEBvWHFlqD6pJDcC2hOtotbS9
 p8tytM3/I260rZJ6mjlWL1BLHDZIXHcL0y9ouFIiDXEH1gxUFINGnVy28HliwxV6W5OQ
 nj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718706413; x=1719311213;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hk2nCrXYKa/i3AuAbXWHqowD8DL46I50YE8wSmEWrP4=;
 b=hdHnorzpZilc/N8jGf/dJLOtSuxDsTb9qkD6xW/N2R3pGc7G+vDIVkfIeTUpvJlrZi
 FtBmZfhheeniMU+01ElyY8vYQ+ZsfFD4MQmmayGPirz38nhsT5kWoCLSrOGEJI0CbKpy
 AGfEQGduw3NTmEaJsg/PvBLqQIEMLI3uVk1o6+PFOtP6lsMdK7YzI2l2LgkfUfTfEMqv
 5VElCjksZxjIpkC04ILo0eqtW4518EtGAXpp47IYuCvr4T19cMrGwYHFAI1fLnGbIc1b
 dNEN/wLRsd2rbL25VJQoARW0TvJzhIUfs1KBfVntK9ooESf8zHW3G8h29vabgy6vASB5
 u+kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNX7UM7rxBQTB+LpjnO785xFvKx0vW4aX938b7xHSx110gC5ZuZfEbNmjEynxwVMZQStoExdOdEUHy/DS2wjbbc7IdtdZNSjJ9kfOh8ZytfV5Q4EnE7L2e
X-Gm-Message-State: AOJu0YyI/OCs3djSg7zb/r3UN4M+felwXHyErYOM7pT4MNBdalloGV4D
 3dPRE0PNR5M406cI7XWhvapYZlcrxavp661hV3/Y7meXYLGEKSIU
X-Google-Smtp-Source: AGHT+IE7iaQ4aAesL72SBnry72umoPj/MPIxf/7q3WKQGtDtNwoXCYXe4NQkqU47oIbZwd6Zm79q+g==
X-Received: by 2002:ac2:5295:0:b0:52c:8944:2427 with SMTP id
 2adb3069b0e04-52ca6e6e293mr7261489e87.31.1718706412752; 
 Tue, 18 Jun 2024 03:26:52 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52caecd7edasm1049484e87.275.2024.06.18.03.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 03:26:52 -0700 (PDT)
Date: Tue, 18 Jun 2024 13:26:49 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <v5apa7efqvhh4yu5jnfkgtgp2ozhqyafhm7nddvdtls5toduas@7bynm2cts2ec>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <E1sD0Ov-00EzBu-BC@rmk-PC.armlinux.org.uk>
 <6n4xvu6b43aptstdevdkzx2uqblwabaqndle2omqx5tcxk4lnz@wm3zqdrcr6m5>
 <ZmbFK2SYyHcqzSeK@shell.armlinux.org.uk>
 <dz34gg4atjyha5dc7tfgbnmsfku63r7faicyzo3odkllq3bqin@hho3kj5wmaat>
 <ZmobWwS5UapbhdmT@shell.armlinux.org.uk>
 <doeizqmec22tqez5zwhysppmm2vg2rhzp2siy5ogdncitbtx5b@mycxnahybvlp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <doeizqmec22tqez5zwhysppmm2vg2rhzp2siy5ogdncitbtx5b@mycxnahybvlp>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 3/8] net: stmmac:
 dwmac1000: convert sgmii/rgmii "pcs" to phylink
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

On Fri, Jun 14, 2024 at 12:14:21AM +0300, Serge Semin wrote:
> On Wed, Jun 12, 2024 at 11:04:11PM +0100, Russell King (Oracle) wrote:
> > On Tue, Jun 11, 2024 at 03:25:14PM +0300, Serge Semin wrote:
> > > Hi Russell, Andrew
> > >
> > > Should we have a DW IP-core-specific getter like
> > > stmmac_ops::pcs_get_config_reg() which would return the
> > > tx_config_reg[15:0] field then we could have cleared the IRQ by just
> > > calling it, we could have had the fields generically
> > > parsed in the dwmac_pcs_isr() handler and in the
> > > phylink_pcs_ops::pcs_get_state().
> > 
> 
> [...]
> 
> > 
> > There's a good reason for this - dealing with latched-low link failed
> > indications, it's necessary that pcs_get_state() reports that the link
> > failed if _sometime_ between the last time it was called and the next
> > time the link has failed.
> > 
> > So, I'm afraid your idea of simplifying it doesn't sound to me like a
> > good idea.
> 
> No caching or latched link state indications. Both the GMAC_RGSMIIIS
> and GMAC_PHYIF_CONTROL_STATUS registers contain the actual link state
> retrieved the PHY. stmmac_pcs_get_config_reg() will just return the
> current link state.
> 
> Perhaps my suggestion might haven't been well described. Providing the
> patches with the respective changes shall better describe what was
> meant. So in a few days I'll submit an incremental patch(es) with the
> proposed modifications for your series

The incremental patchset is ready. I need to give it some more
tests, then rebase onto the kernel 6.10. It'll be done in one-two
days.

Thanks
-Serge(y)
.
> 
> -Serge(y)
> 
> > 
> > -- 
> > RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> > FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
