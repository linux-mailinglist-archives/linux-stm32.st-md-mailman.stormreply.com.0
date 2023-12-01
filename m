Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EF180100E
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Dec 2023 17:25:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 196B9C6A61A;
	Fri,  1 Dec 2023 16:25:25 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4D0CC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 16:25:23 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-50bbb4de875so3221272e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Dec 2023 08:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701447923; x=1702052723;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1Fe9LinVeEIS31sVu9a8Ip9icgC4gCnScZC9xWW4pX4=;
 b=QX29W6DH+uhX8TTFEMV9avQr2QgRZgJEjXgTNul6QfaI9V3I/HCqw3Y3MyfZ8eQK02
 fMA95LVOUzYcGtwLjwqaCc3t3yVpyB7KfdaJz5OcAUzqgrgEctZ2WN/vXS6C8NUs9uvr
 NLhU3mfkBDNJLguv9ecoRo7hnpc2wi7alf6CxFQmPljUF8K7FdknutYqF20UjYLnXV1w
 66rDWq1EOM/NsZ6f6mhtnBZwaisNjwE6gDRIPNEBrIw+Ij3TQs+wqdMYwURfftl4Q874
 BLRNIX+eivhhviR4S4IvfG+mT+Kn7I8ZxGuRXjXELVuofNSYo8PLPkAjTUqux1dvYTkq
 QcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701447923; x=1702052723;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Fe9LinVeEIS31sVu9a8Ip9icgC4gCnScZC9xWW4pX4=;
 b=Oql+WChOtBpzHvrXQmr5p7yj3gwZ/l+a7Nt4LRA3ewaOcrd2QTmLrYsYX6JD1Hc3Mw
 roe0SRto6yXpPKKoYVE8tO5ehZO2cjQAEwdmG0PWE9cT930yRVNcdTQhvbYt0sn6z/oE
 W5c/f2Ad6Yb5yRX5Xpr1DDmDc67yjFzMnSGHQS79YZl3FDJoOXZ5k/LMGyWxL++BStY5
 GAq1FviVzDmQEe+ELOrBkaozevuljErHBdzDeWhnHf0G0D9SMMyVxGP/VK7AgovTT3U/
 rLTxK2BXRWKgPWDpm7FHdh888M+EOr554mZmQddK39cga+4TUsQGyMqofZjjzbcZb4bR
 +iuA==
X-Gm-Message-State: AOJu0YxVwuWABtW8rb46X9lL2kJ/RWyXKTLEgNabflC7b3kmBkZtxOff
 CItDHT/yXZH+ZW16HZvksL8=
X-Google-Smtp-Source: AGHT+IED2w+hujxue7bm9bOGpjjCdvrKzr90/3i7E5Xd7uj7qqmqvOaSeS01ayw0GAygOWScKCMiaA==
X-Received: by 2002:a05:6512:280b:b0:50b:d764:64c0 with SMTP id
 cf11-20020a056512280b00b0050bd76464c0mr1188134lfb.117.1701447922712; 
 Fri, 01 Dec 2023 08:25:22 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a056512340f00b0050bc303f3cbsm232121lfr.173.2023.12.01.08.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 08:25:22 -0800 (PST)
Date: Fri, 1 Dec 2023 19:25:19 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <dfbwvsvefbkj6lodj5nmj2up32vnai32u3qk667mpfjytvmp4z@uvny7nhaykzi>
References: <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch>
 <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
 <9ad42fef-b210-496a-aafc-eb2a7416c4df@lunn.ch>
 <CAP6Zq1jw9uLP_FQGR8=p3Y2NTP6XcNtzkJQ0dm3+xVNE1SpsVg@mail.gmail.com>
 <CAP6Zq1ijfMSPjk1vPwDM2B+r_vAH3DShhSu_jr8xJyUkTQY89w@mail.gmail.com>
 <a551aefa-777d-4fd3-b1a5-086dc3e62646@lunn.ch>
 <CAP6Zq1jVO5y3ySeGNE5-=XWV6Djay5MhGxXCZb9y91q=EA71Vg@mail.gmail.com>
 <25d0c091-3dce-4d62-a112-c82106809c65@lunn.ch>
 <xvy2coamb6cl3wcbkl32f6w7kksoxfocyd63t7k7bz4pne2gyx@lktivhqovy7p>
 <20231130213441.032a661c@device.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231130213441.032a661c@device.home>
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 joabreu@synopsys.com, tali.perry1@gmail.com, edumazet@google.com,
 robh+dt@kernel.org, joel@jms.id.au, mcoquelin.stm32@gmail.com,
 j.neuschaefer@gmx.net, peppe.cavallaro@st.com, netdev@vger.kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 benjaminfair@google.com
Subject: Re: [Linux-stm32] [PATCH v1 2/2] net: stmmac: Add NPCM support
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

Hi Maxime

On Thu, Nov 30, 2023 at 09:34:41PM +0100, Maxime Chevallier wrote:
> Hello,
> 
> On Thu, 30 Nov 2023 22:59:32 +0300
> Serge Semin <fancer.lancer@gmail.com> wrote:
> 
> > On Thu, Nov 30, 2023 at 06:26:13PM +0100, Andrew Lunn wrote:
> > > > I will check with the xpcs maintainer how can we add indirect access
> > > > to the xpcs module.  
> > > 
> > > https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c#L449
> > > 
> > > It creates a regmap for the memory range. On top of that it creates an
> > > MDIO bus. You can then access the PCS in the normal way.  
> > 
> > Actually Synopsys DW XPCS can be synthesized with two types of the CSR
> > interfaces:
> > 1. MDIO: device looks as a normal MDIO device. This option is currently
> >    supported by the STMMAC MDIO driver.
> > 2. MCI/APB3: device MMD CSRs are directly (all CSRs are visible) or
> >    indirectly (paged-base access) accessible over the system memory bus.
> > 
> > In addition to the above XPCS device can be equipped with separate
> > clock sources (at least to feed the MCI or APB3 interface) and may
> > have dedicated IRQ line to signal various events like link
> > establishing, failures, etc. From that perspective XPCS in both cases
> > looks as a normal platform device for which would be better to have a
> > special DT-node defined with all those resources supplied. Then the
> > XPCS DT-node could be passed to the DW MAC DT-node via the already
> > standardized "pcs-handle" DT-property.
> 

> To my understanding, this should work, there's another PCS that works
> this way : 
> https://elixir.bootlin.com/linux/v6.7-rc3/source/drivers/net/pcs/pcs-rzn1-miic.c

It is similar to that, but since DW XPCS can reside on the normal MDIO
bus and in the system memory I took a liberty to implement the DW XPCS
MCI/APB3 interface support in the framework of the MDIO subsystem,
especially seeing Synopsys call them just "Management Interfaces", the
MMD CSRs can be indirectly accessible and since potentially there can
be more than one XPCS device on the same MCI/APB3 bus.

> 
> Are you still able to use the mdio-regmap glue that Andrew mentioned,
> to avoid the duplication between the mdio and mmio register accesses ?

Andrew cited the glue code using the Lynx PCS driver. In my case it's
DW XPCS driver. In anycase my patchset is designed in a way so not to
break (hopefully) the current DW XPCS driver users (STMMAC Eth for
sure, WangSun XGBE, SJA1105 DSA). So it will be still possible to create a
dedicated MDIO bus (using mdio-regmap API too) with the XPCS device
being detectable on it.

-Serge(y)

> 
> Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
