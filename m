Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5DF98E681
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Oct 2024 00:56:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30E9BC78023;
	Wed,  2 Oct 2024 22:56:33 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6153FC78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Oct 2024 22:56:32 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-37cca239886so192334f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Oct 2024 15:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727909792; x=1728514592;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e9nNJHMJzZa//MtYTMs/NP3fiF/jicWlbNBLj+9FqAg=;
 b=ML8zkJZzM8u207mkU8C6OXkJf7EzheJk5BQRlqSAmY5veqG+M7OHrZpdLJkcprlhQn
 P6n9B5GmVe2M2xRUeyUOPKDTFd2r7VbyPRdVQ/x8f9EnuE0jrn0eBYAVoGurzCXfTBv6
 KlGcSHfmeNbmn74cz8cwHECXRUqVRKunlp6iIYklM7ybUGJlJS/0i0Pfu4Qe5XxbLsSF
 lMStF9N6YGr7j5VwpwHI/9xDOE2Fa6ZGQUWoKp26IlyLj3uIZ0xzZ27nKT5M7DEgXNIa
 Wcz8MVQ3Xk9R5rTmV01Z9gOC1i2Dsu+8vQxZT/CEXeP2S8e16NpbAMmQeuz03nv6OAn0
 islw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727909792; x=1728514592;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e9nNJHMJzZa//MtYTMs/NP3fiF/jicWlbNBLj+9FqAg=;
 b=VDsumO4HqB55Q6d+aeKtyIUvwZsAKTzvJ+K64oTWbUpCUtHWq5xEARCDexKwa+nk9z
 9VhUchF2aXdft9G9C+WDPjm7peFQNHJuouAPVknpMY/0OMCeAylBx8tAhiEYDtA4PoYp
 P3phogmsf9hUcay2rp0xSatsB0xzl88/srolViwrNMLPzoAjQqIZetVsA1VC6xGTFEQe
 SffrxG2PRUZ6/vN4tb88lqSVxRAzleJuLzIZcXDqIjfVth8ahATmXmYBjxhEjcNogNiI
 oXUkyeXALoPHlOQPYTiTKXd0ULrmYxsYPf6HcG3fEu0DChxP8FeCQexPmUUIvYSW0Usw
 DzQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9Teyp9bKQvN4yvFKDaeVBiL/LH7AXpeDrtak+GbG3F5NwVoP3X4SfG1bYe5+V6dZsqo55RjrQ+c5xow==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwNMj2MDw6BdkDWBG4GFyZfHv56Vw9o+Qig2H+he5cXdFJpF9YI
 PSOCWEBsbaEsifeh0JTdiElWqylkeDM333k8awmEBhuZICBwdtan
X-Google-Smtp-Source: AGHT+IE427cWTEeq2+pHLe15Z/pWV/cuH7qlt4Cfgx04Usxy8O4WLti3cilzlGBc9RTaaecACAAsvA==
X-Received: by 2002:adf:eb8b:0:b0:37c:cd57:d91a with SMTP id
 ffacd0b85a97d-37cfb8b63b3mr2564996f8f.12.1727909791457; 
 Wed, 02 Oct 2024 15:56:31 -0700 (PDT)
Received: from mobilestation ([95.79.225.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd56e62d5sm14773143f8f.57.2024.10.02.15.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 15:56:30 -0700 (PDT)
Date: Thu, 3 Oct 2024 01:56:27 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
 Andrew Lunn <andrew@lunn.ch>
Message-ID: <pm7v7x2ttdkjygakcjjbjae764ezagf4jujn26xnk7driykbu3@hfh4lwpfuowk>
References: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
 <E1svfMA-005ZI3-Va@rmk-PC.armlinux.org.uk>
 <fp2h6mc2346egjtcshek4jvykzklu55cbzly3sj3zxhy6sfblj@waakp6lr6u5t>
 <ZvxxJWCTD4PgoMwb@shell.armlinux.org.uk>
 <68bc05c2-6904-4d33-866f-c828dde43dff@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68bc05c2-6904-4d33-866f-c828dde43dff@lunn.ch>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 01/10] net: pcs: xpcs: move PCS
 reset to .pcs_pre_config()
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

On Wed, Oct 02, 2024 at 12:09:22AM GMT, Andrew Lunn wrote:
> > I'm wondering why we seem to be having a communication issue here.

No communication issue. I just didn't find the discussion over with
all the aspects clarified. That's why I've got back to the topic here.

> > 
> > I'm not sure which part of "keeping the functional changes to a
> > minimum for a cleanup series" you're not understanding. This is
> > one of the basics for kernel development... and given that you're
> > effectively maintaining stmmac, it's something you _should_ know.
> > 
> > So no, I'm going to outright refuse to merge your patch in to this
> > series, because as I see it, it would be wrong to do so. This is
> > a _cleanup_ series, not a functional change series, and what you're
> > proposing _changes_ the _way_ reset happens in this driver beyond
> > the minimum that is required for this cleanup. It's introducing a
> > completely _new_ way of writing to the devices registers to do
> > the reset that's different.
> 
> I have to agree with Russell. Cleanups should be as simple as
> possible, and hopefully obviously correct. They should be low risk.

In general as a thing in itself with no better option to improve the
code logic I agree, it should be kept simple. But since the cleanups
normally land to net-next, and seeing the patch set still implies some
level of the functional change, I don't see much problem with adding a
one more change to simplify the driver logic, decrease the level
of cohesions (by eliminating the PHY-interface passing to the
soft-reset method) and avoid some unneeded change in this patch set.
Yes, my patch adds some amount of functional change, but is that that
a big problem if both this series and my patch (set) are going to land
in net-next anyway, and probably with a little time-lag?

Here what we'll see in the commits-tree if my patch is applied as a
pre-requisite one of this series:

1.0 Serge: net: pcs: xpcs: Drop compat arg from soft-reset method
- 1.1 Russell: net: pcs: xpcs: move PCS reset to .pcs_pre_config()
* This patch won't be needed since the PHY-interface will be no
  longer used for the soft-reset to be performed.
1.2 Russell: net: pcs: xpcs: drop interface argument from internal functions
- 1.3 net: pcs: xpcs: get rid of xpcs_init_iface()
* This patch won't be applicable since the xpcs_init_iface() method
  will be still utilized for the basic dw_xpcs initializations and the
  controller soft-resetting.
...
1.1x Serge: my series rebased onto the Russell' patch set

Here is what we'll see in the git-tree if my patch left omitted in
this patch set:

2.1 Russell: net: pcs: xpcs: move PCS reset to .pcs_pre_config()
2.2 Russell: net: pcs: xpcs: drop interface argument from internal functions
2.3 Russell: net: pcs: xpcs: get rid of xpcs_init_iface()
...
2.1x Serge: net: pcs: xpcs: Drop compat arg from soft-reset method
+ 2.1y Serge: net: pcs: xpcs: Get back xpcs_init_iface()
* Since the PHY-interface is no longer required for the XPCS soft-resetting
  I'll move the basic dw_xpcs initializations to the xpcs_init_iface()
  in order to simplify the driver logic by consolidating the initial
  setups at the early XPCS-setup stage. This will basically mean to
  revert the Russell' patches 2.1 and 2.3.
2.1z Serge: the rest of my series rebased onto the Russell' patch set

> 
> Lets do all the simple cleanups first. Later we can consider more
> invasive and risky changes.

Based on all the considerations above I still think that option 1.
described above looks better since it decreases the changes volume
in general and decreases the number of patches (by three actually),
conserves the changes linearity.

But if my reasoning haven't been persuasive enough anyway, then fine by
me. I'll just add a new patch (as described in 2.1y) to my series.
But please be ready that it will look as a reversion of the Russell'
patches 2.1 and 2.3.

-Serge(y)

> 
> 	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
