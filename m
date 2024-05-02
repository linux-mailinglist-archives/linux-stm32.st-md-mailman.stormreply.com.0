Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEDC8BA235
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2024 23:26:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83CB5C712A0;
	Thu,  2 May 2024 21:26:23 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D19DC7129F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2024 21:26:16 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51aa6a8e49aso10388857e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 May 2024 14:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714685176; x=1715289976;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=C1gB8YjsPz4rQpEmCzwrb8+wB0LWmO1Pmfg0vfLQCl8=;
 b=PmZbGFJNzGfaOUdGd1aJA9QlvspMn8rjqrb22VGuMSyY1roHim+Ah3OmPBE1SuSa6E
 aJsWNmcSlcTm4F5OsAMgwtpgXrqSik+xX2K0GttAKLLF4NUfvYW7wFZxCrOpM/DMb++H
 4RiyAMUtpPTXoayv3s4sgoIUejCKH0o/iSJIgfSc5j3p+2Hxjuoz4GYCVfbKbzOvFR2J
 8QrXExlosxYgt2oZ6U/W+03By8dzx6vqHkpNIHNTUektaEPyvDPpVsSQyalOHCZxb7R8
 THDS+aQsDanZW7suCw3dnRF5neQnWzjbTQSeGYc3u2fL80HpiF8UD0BfSEqGlSMQXut8
 AsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714685176; x=1715289976;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C1gB8YjsPz4rQpEmCzwrb8+wB0LWmO1Pmfg0vfLQCl8=;
 b=rXqOgAzgrWjunhk/RLX4szJcFfLe+2HQSgHcyaKW5sBVlK/xqwAG7F7qyDUT/46cj3
 L5Z3tzEgShSFutjNjdD4pe5BAc5OH0Klx3hTXmM4LHv9U8Mfbg9+PYDsLQDGSfcjgpih
 1e70nIvMLx/BDsaSFZ+zLYJMw4mkqxK7oruMZgUJcvafQR/oF37S3ENqavxToQ0WBu+c
 tUwWjN3DwJUwrw9XkqyqCh8RQf0HptF52exsDTcX03eBp0cwbd4UZNPhe/Z0aZEI780k
 onZi648UuZdpCVXdd795wJoWrCLzV3pvITCkzAvE09sv/IUIkF772dI0ea9dCUQezo+b
 cZcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFjp5eDnkJMyns4YciDt7GE9MzomxL3Urd7s7VaNw0cVm9KZXm/9XCqDxpcvnSkACBq5CUW08SZkN/cX9SHkToE1kd/wUI8wDfLWYa1SdpjDkkfS/d5VdW
X-Gm-Message-State: AOJu0Ywh2oGYvG9/3DV+4oZL0o1vRVpXb6KQ0SSNANijIXIeClT9eWIf
 3wP8Li9OW1jsznLoaRWNwsMnCL0/JvlJeuMuJOjxhx19CxYOYrfw
X-Google-Smtp-Source: AGHT+IGAOdvGGIhOITqF96Naz8xBqcBwgssy/49bKxqTCGIDKIoeJMyFV6DuUxugWQXBUhdk06ALbg==
X-Received: by 2002:a19:5219:0:b0:51c:b8ec:c46f with SMTP id
 m25-20020a195219000000b0051cb8ecc46fmr584721lfb.22.1714685175418; 
 Thu, 02 May 2024 14:26:15 -0700 (PDT)
Received: from mobilestation ([95.79.182.53]) by smtp.gmail.com with ESMTPSA id
 p25-20020ac246d9000000b0051b41844048sm301735lfo.285.2024.05.02.14.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 14:26:14 -0700 (PDT)
Date: Fri, 3 May 2024 00:26:12 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Halaney <ahalaney@redhat.com>, 
 "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
Message-ID: <7723d4l2kqgrez3yfauvp2ueu6awbizkrq4otqpsqpytzp45q2@rju2nxmqu4ew>
References: <uz66kbjbxieof6vkliuwgpzhlrbcmeb2f5aeuourw2vqcoc4hv@2adpvba3zszx>
 <ZjFl4rql0UgsHp97@shell.armlinux.org.uk>
 <ykdqxnky7shebbhtucoiokbews2be5bml6raqafsfn4x6bp6h3@nqsn6akpajvp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ykdqxnky7shebbhtucoiokbews2be5bml6raqafsfn4x6bp6h3@nqsn6akpajvp>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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

Hi all

On Thu, May 02, 2024 at 12:43:27PM -0500, Andrew Halaney wrote:
> On Tue, Apr 30, 2024 at 10:42:58PM +0100, Russell King (Oracle) wrote:
> > On Tue, Apr 30, 2024 at 04:02:19PM -0500, Andrew Halaney wrote:
> > > Basically, NetworkManager is setting both interfaces to up, and end1's
> > > phy doesn't seem to be ready when ndo_open() runs, returning
> > > -ENODEV in phylink_fwnode_phy_connect() and bubbling that back up. This doesn't
> > 
> > Let's get something clear - you're attributing phylink to this, but this
> > is not the case. phylink doesn't deal directly with PHYs, it makes use
> > of phylib for that, and merely passes back to its caller whatever status
> > it gets from phylib. It's also not fair to attribute this to phylib as
> > we will see later...
> 
> Sorry for the delay, I wanted to try and test with some extra logs in
> the legit setup (not my "simulate via EPROBE_DEFER delays" approach)
> which is tedious with the initramfs (plus I wasted time failing to
> ftrace some stuff :P) to reconvince me of old notes. Thanks for the
> explanation above on the nuances between phylink and phylib, I really
> appreciate it.
> 
> > 
> > There are a few reasons for phylink_fwnode_phy_connect() would return
> > -ENODEV:
> > 
> > 1) fwnode_get_phy_node() (a phylib function) returning an error,
> > basically meaning the phy node isn't found. This would be a persistent
> > error, so unlikely to be your issue.
> > 
> > 2) fwnode_phy_find_device() (another phylib function) not finding the
> > PHY device corresponding to the fwnode returned by the above on the
> > MDIO bus. This is possible if the PHY has not been detected on the
> > MDIO bus, but I suspect this is not the cause of your issue.
> 
> So I think we're in this case. I added some extra logs to see which
> of the cases we were hitting, as well as some extra logs in phy creation
> code etc to come to that conclusion:
> 
>     # end1 probe start (and finish)
>     [    1.424099] qcom-ethqos 23000000.ethernet: Adding to iommu group 2
>     ...
>     [    1.431267] qcom-ethqos 23000000.ethernet: Using 40/40 bits DMA host/device width
> 
>     # end0 probe start
>     [    1.440517] qcom-ethqos 23040000.ethernet: Adding to iommu group 3
>     ...
>     [    1.443502] qcom-ethqos 23040000.ethernet: Using 40/40 bits DMA host/device width
> 
>     # end0 starts making the mdio bus, and phy devices
>     [    1.443537] qcom-ethqos 23040000.ethernet: Before of_mdiobus_reg
> 
>     # create phy at addr 0x8, end0's phy
>     [    1.450118] Starting phy_create_device for addr: 8
> 
>     # NetworkManager up'ed end1! and again. But the device we're needing
>     # (0xa) isn't created yet
>     [    1.459743] qcom-ethqos 23000000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-0
>     ...
>     [    1.465168] Failed at fwnode_phy_find_device
>     [    1.465174] qcom-ethqos 23000000.ethernet end1: __stmmac_open: Cannot attach to PHY (error: -19)
>     [    1.473687] qcom-ethqos 23000000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-0
>     ...
>     [    1.477637] Failed at fwnode_phy_find_device
>     [    1.477643] qcom-ethqos 23000000.ethernet end1: __stmmac_open: Cannot attach to PHY (error: -19)
> 
>     # device created for 0x8, probe it
>     [    1.531617] Ending phy_create_device for addr: 8
>     [    1.627462] Marvell 88E1510 stmmac-0:08: Starting probe
>     [    1.627644] hwmon hwmon0: temp1_input not attached to any thermal zone
>     [    1.627650] Marvell 88E1510 stmmac-0:08: Ending probe
> 
>     # device created for 0xa, probe it
>     [    1.628992] Starting phy_create_device for addr: a
>     [    1.632615] Ending phy_create_device for addr: a
>     [    1.731552] Marvell 88E1510 stmmac-0:0a: Starting probe
>     [    1.731732] hwmon hwmon1: temp1_input not attached to any thermal zone
>     [    1.731738] Marvell 88E1510 stmmac-0:0a: Ending probe
> 
>     # end0 is done probing now
>     [    1.732804] qcom-ethqos 23040000.ethernet: After of_mdiobus_reg
>     [    1.820725] qcom-ethqos 23040000.ethernet end0: renamed from eth0
> 
>     # NetworkManager up's end0
>     [    1.851805] qcom-ethqos 23040000.ethernet end0: Register MEM_TYPE_PAGE_POOL RxQ-0
>     ...
>     [    1.914980] qcom-ethqos 23040000.ethernet end0: PHY [stmmac-0:08] driver [Marvell 88E1510] (irq=233)
>     ...
>     [    1.939432] qcom-ethqos 23040000.ethernet end0: configuring for phy/sgmii link mode
>     ...
>     [    4.451765] qcom-ethqos 23040000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx
> 
> So end1 is up'ed before end0 can finish making its mdio bus / phy
> devices, and therefore we fail to find it. I can easily simulate this
> situation as well by -EPROBE_DEFER'ing end0 for say 10 seconds.

AFAICS the problem is in the race between the end0 and end1 device
probes. Right?
If so then can't the order be fixed by adding the links between the
OF-devices?  As it's already done for various phandle-based references
like "clocks", "gpios", "phys", etc?

* Before this topic was raised I had thought it was working for any
phandle-based dependencies, but apparently it wasn't and the
supplier/consumer linkage was supposed to be implemented for each
particular case. The "phy-handle" property lacks that feature support
(see drivers/of/property.c:of_supplier_bindings and
of_fwnode_add_links() for details).

-Serge(y)

> [...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
