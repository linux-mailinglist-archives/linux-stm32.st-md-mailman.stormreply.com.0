Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D537FFBDF
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Nov 2023 20:59:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 065DAC6B47A;
	Thu, 30 Nov 2023 19:59:38 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61AA5C6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 19:59:36 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2c9d33f049cso9971241fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 11:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701374375; x=1701979175;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VOrjiusb1CkTjaA85Fcf3elk7qFz3xbmkdXxylcNE28=;
 b=IMU4kP00UpOohymfAEU8owhfNWsVRIlztwHRSvq3oakVwPoO1hzHLyXonzGO8s66Yu
 K117RehHZd6IkP40FLCglwR/AH4Dk2j9Y7dflxSkLLlS8FCkU4iRYMacBEVd3yHiwSxQ
 enyk+KrUvhdpNWQ9qx0wPOMupvx5e5Hf6cZfEWPVKLlsff3hd6nBPbC2LyQ0y4RgMqOv
 h5uLmVKhHhTZU8GLpfY9YgXN8KiTi1cfquenNpix2lEOvdtGcOS0Nx6Lo2XpALuRAntZ
 IuiS8HcJbQENz9LzLz8O7HKqWuNcAECv0/46RKBiPiYs43P2EOolCxT10EEgjJtvXuX+
 1zLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701374375; x=1701979175;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VOrjiusb1CkTjaA85Fcf3elk7qFz3xbmkdXxylcNE28=;
 b=DvvvoD/LO06TS+ndFG1SFRXwlK12zF8lfd+YApBm4hGsO9H8HrL/OoAbz6F9vCdV4T
 kNWCq4HintwdkwH/2xV3/IdukVg9FwdZfm+ahct6vnyi6cUmXl/qF6Z8cxN8+g2BEV65
 KGytWY5KK9NHD4iRyA3akhzW2T52c6dcKHDeGTkDhgSu/c+Z2ZoAED738Uqnc/egqqNt
 x6BQfkJGo4NtMc3WuGBA7hDOUieUzmpx6HNIJj2V/uO0Fx/nQZnkOrzZTTyIWxNt4nvl
 okfQtHN5IJrvD7cx6QrdZYGNzm6fpfkhowd15iIIWAQFmC1KovprN2xTGZyaG8GGDeaX
 TYig==
X-Gm-Message-State: AOJu0YwJuxjyJWsa6V6RikcLLMTpguO5qq+Z7YoVgInO1Y5UrHn+NOuw
 EYyXalz1cskwNgn4iTTUlK8=
X-Google-Smtp-Source: AGHT+IHUjij89dN7TIrQl0G91Pfh+h20hbyKUIOT6zGRwQNGTZnnP7/pfZPelhLBC+F8nHc0nEECjw==
X-Received: by 2002:a2e:9219:0:b0:2c9:d874:20c4 with SMTP id
 k25-20020a2e9219000000b002c9d87420c4mr62616ljg.78.1701374375270; 
 Thu, 30 Nov 2023 11:59:35 -0800 (PST)
Received: from mobilestation ([95.79.203.166])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a2e8091000000b002b9e5fe86dasm227571ljg.81.2023.11.30.11.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 11:59:34 -0800 (PST)
Date: Thu, 30 Nov 2023 22:59:32 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <xvy2coamb6cl3wcbkl32f6w7kksoxfocyd63t7k7bz4pne2gyx@lktivhqovy7p>
References: <20231121151733.2015384-1-tmaimon77@gmail.com>
 <20231121151733.2015384-3-tmaimon77@gmail.com>
 <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch>
 <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
 <9ad42fef-b210-496a-aafc-eb2a7416c4df@lunn.ch>
 <CAP6Zq1jw9uLP_FQGR8=p3Y2NTP6XcNtzkJQ0dm3+xVNE1SpsVg@mail.gmail.com>
 <CAP6Zq1ijfMSPjk1vPwDM2B+r_vAH3DShhSu_jr8xJyUkTQY89w@mail.gmail.com>
 <a551aefa-777d-4fd3-b1a5-086dc3e62646@lunn.ch>
 <CAP6Zq1jVO5y3ySeGNE5-=XWV6Djay5MhGxXCZb9y91q=EA71Vg@mail.gmail.com>
 <25d0c091-3dce-4d62-a112-c82106809c65@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25d0c091-3dce-4d62-a112-c82106809c65@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>, davem@davemloft.net,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 robh+dt@kernel.org, tali.perry1@gmail.com, mcoquelin.stm32@gmail.com,
 edumazet@google.com, joabreu@synopsys.com, joel@jms.id.au,
 krzysztof.kozlowski+dt@linaro.org, peppe.cavallaro@st.com,
 j.neuschaefer@gmx.net, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
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

On Thu, Nov 30, 2023 at 06:26:13PM +0100, Andrew Lunn wrote:
> > I will check with the xpcs maintainer how can we add indirect access
> > to the xpcs module.
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c#L449
> 
> It creates a regmap for the memory range. On top of that it creates an
> MDIO bus. You can then access the PCS in the normal way.

Actually Synopsys DW XPCS can be synthesized with two types of the CSR
interfaces:
1. MDIO: device looks as a normal MDIO device. This option is currently
   supported by the STMMAC MDIO driver.
2. MCI/APB3: device MMD CSRs are directly (all CSRs are visible) or
   indirectly (paged-base access) accessible over the system memory bus.

In addition to the above XPCS device can be equipped with separate
clock sources (at least to feed the MCI or APB3 interface) and may
have dedicated IRQ line to signal various events like link
establishing, failures, etc. From that perspective XPCS in both cases
looks as a normal platform device for which would be better to have a
special DT-node defined with all those resources supplied. Then the
XPCS DT-node could be passed to the DW MAC DT-node via the already
standardized "pcs-handle" DT-property.

I have such approach implemented in my local repo. If you consider
this as a proper solution, after a small modification I'll be able to
submit a patchset for review tomorrow.

-Serge(y)

> 
> 	Andrew
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
