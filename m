Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC258BE662
	for <lists+linux-stm32@lfdr.de>; Tue,  7 May 2024 16:48:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06F0DC5E2D2;
	Tue,  7 May 2024 14:48:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95CEDCFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 May 2024 14:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715093319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mTLDRJ+Y2C9qtVA6GvAyqMW7FNLo8bVgJpqdecb1Xoc=;
 b=fhy8m5BxQSzXx8PhyeVixJNHNA/vRNrZQ9jEmK1Ex5Qz6f1a9fzr3dwj5UKTQAv9yYhWRH
 gygMLGBe2NBbPeIcU8Rc/ojFbJLdIkYBg87sip2FnyshKmAl4iwc6w9qvdyMfY3G38RE/S
 NdgpDkeHUnqz/k+kXmlZ0I5Uguj3Ezo=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-h8TPdd3wM7ewaSakydcGCg-1; Tue, 07 May 2024 10:48:37 -0400
X-MC-Unique: h8TPdd3wM7ewaSakydcGCg-1
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-5ce12b4c1c9so2086421a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 May 2024 07:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715093316; x=1715698116;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mTLDRJ+Y2C9qtVA6GvAyqMW7FNLo8bVgJpqdecb1Xoc=;
 b=HW5pUHrVYpggXOdXIg7DJuV+wmfpTEZ9aCgNL8T0PEcSDUokqNgSo3a8yuTIInAiEg
 eU87XV+ZdMvEIkeW2hfUej6hcZqqICG2j2GmqaSh2WAJVTsRLvQWeE62kwdUkptRdu4D
 rozVrJW3M2QHjO+6/hLIDgS3UMeW5DgY1C+eP9bhA7h/PGq5z85bZda91KJ58kAO9Mj0
 9af5NxwhV67pDw5uzer6hFKvDyqsb0ZOSUyYQ+NDAk/3jJBj4Wpt28w5px2DvucxYPPJ
 2aaWh4LmISOlDZMXO+kp7OE9pFDa3V8GjxE68Rownu2X1+aZQOSHzGyQ9gGI4X5oWmmO
 kySQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj8jEp16tUEHbjGvbn3czRBzOmXKkC18R1pIZ9ZY9Vy6m6BTJWij+cNJKR+0a2lpXgkUJzRy/5anYOf+aHpD5AGiCSkp3gUuf/iVOd2XFBtJvdINGSlkPT
X-Gm-Message-State: AOJu0YxkHQpntyj0ezcHzyA5QzbUrdvPHzslbHn92CFjxRzJbMpO6ZNa
 fHZU2VOXqcet8rJ8p+p8/35uH/U+xDlvFnaNZ21+qGgPR1dI3RcKXaVEO282uuLNVs5/by9zjFa
 ZSL6kkMBoCyRBZG4zpF8oRHZoIe3Q9k6ILD6HydWt4Du7a4IYyzbT8uJUIH/3SOCQS1W4vIOK7Y
 ka8g==
X-Received: by 2002:a05:6a20:2d0a:b0:1ad:31e2:56c with SMTP id
 g10-20020a056a202d0a00b001ad31e2056cmr16115674pzl.8.1715093316040; 
 Tue, 07 May 2024 07:48:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrgeM1ZE9m7PX87R+n+J5zEki5ltNJcbMD3VGwx4A43X3ZXKh0YMm+VM4cmVfuWg9cJpbq9A==
X-Received: by 2002:a05:6a20:2d0a:b0:1ad:31e2:56c with SMTP id
 g10-20020a056a202d0a00b001ad31e2056cmr16115613pzl.8.1715093315306; 
 Tue, 07 May 2024 07:48:35 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a056a0014d600b006f43c013f66sm4429038pfu.173.2024.05.07.07.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 07:48:34 -0700 (PDT)
Date: Tue, 7 May 2024 09:48:30 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <i3w534hh4o2klrehag7cwjshwiqxergidzo4h7zz7oa3prra2k@v6xor5k4dv5x>
References: <uz66kbjbxieof6vkliuwgpzhlrbcmeb2f5aeuourw2vqcoc4hv@2adpvba3zszx>
 <ZjFl4rql0UgsHp97@shell.armlinux.org.uk>
 <ykdqxnky7shebbhtucoiokbews2be5bml6raqafsfn4x6bp6h3@nqsn6akpajvp>
 <7723d4l2kqgrez3yfauvp2ueu6awbizkrq4otqpsqpytzp45q2@rju2nxmqu4ew>
 <25d1164e-0ac2-4311-ad27-aa536dca3882@lunn.ch>
MIME-Version: 1.0
In-Reply-To: <25d1164e-0ac2-4311-ad27-aa536dca3882@lunn.ch>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] racing ndo_open()/phylink*connect() with
	phy_probe()
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

On Fri, May 03, 2024 at 03:25:19AM GMT, Andrew Lunn wrote:
> > AFAICS the problem is in the race between the end0 and end1 device
> > probes. Right?
> > If so then can't the order be fixed by adding the links between the
> > OF-devices?  As it's already done for various phandle-based references
> > like "clocks", "gpios", "phys", etc?

Thanks for the pointer here Serge, I had no idea (still don't have much of an
idea) on how this works. I think this makes sense to explore some more.
Hopefully sometime this week I'll poke at this more.

> 
> It gets tricky because an MDIO bus master device is often a sub device
> of an Ethernet MAC driver. Typically how it works is that a MAC driver
> probes. Part way through the probe it creates an MDIO bus driver,
> which enumerates the MDIO bus and creates the PHYs. Later in the MAC
> driver probe, or maybe when the MAC driver is opened, it follows the
> phy-handle to a PHY on its own MDIO bus.
> 
> If you were to say it cannot probe the MAC driver until the MDIO bus
> driver is created and the PHYs created, you never get anywhere,
> because it is the act of probing the MAC driver which creates the PHYs
> which fulfils the phandle.
> 
> You would need to differentiate between a phandle pointing deeper into
> the same branch of a DT tree, or pointing to a different branch of a
> DT tree. If it is deeper within the same branch, you need to probe in
> order to make progress. If it points to a different branch you need to
> defer until that sub-branch has successfully probed. And if you get
> two branches which are mutually dependent on each other, probe and
> hope EPROBE_DEFER solves it.

I'll keep this relationship in mind. IIUC the fw_devlink stuff sort of handles
cycles, but I need to look into how all that works further. At least in
my example device, end0 is in this situation, whereas end1 is in the
other situation, so I have a decent test setup for that.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
