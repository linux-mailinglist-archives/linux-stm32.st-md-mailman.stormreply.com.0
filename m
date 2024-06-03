Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2E68FA398
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 23:46:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 717B0C6DD67;
	Mon,  3 Jun 2024 21:39:27 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C8D1C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2024 21:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717450758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rW72wPodY1wqzDmVcaAF9S5heqN9gcWtpGc5h9hRyuM=;
 b=FEjSYCIZQxxetuh1lgeiFxoqfnz963yVzrYPVwL70MOQF3QddSYgDe3MyrRT3NVgpUIOIN
 uRfNWcAovjNJBzmawr05MgxlU70XTCnWdm8Tat6dLYL/S8vxC9U5SvGsaM5mAnkP/xv5GE
 XTE43CDW3+Z6yOVmpK1Nda9DjDndpnM=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-Q6mGeoBYN3S3XHHyfSUz-w-1; Mon, 03 Jun 2024 17:39:17 -0400
X-MC-Unique: Q6mGeoBYN3S3XHHyfSUz-w-1
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-3d1fde80c6dso8369b6e.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Jun 2024 14:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717450756; x=1718055556;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rW72wPodY1wqzDmVcaAF9S5heqN9gcWtpGc5h9hRyuM=;
 b=iOU2AWJtsaHRKh7fKuaIo/zEf1xZ9q1W0yfLsdu5j3B+C3w2q7SkcFpuO3/MPAaKgL
 A2rvyjFIrEs0grUuiV4iNAh3BRFpIx++za615TO6gOA2gnGxjTKRSJ3WYFeWkXUCj+8R
 C0Q56wwAQoKU04twr/x1vW34Txz/9+AVaZB0BLFS+FPyRlfjaMDsYyTRpIbbbKde7lJf
 Viqnra5Fo0/uXkMSe1fGHb6gxMqLaBtAA7XTFR3jGhDyfcbXjHOv/4KhgUe0I3NT0a2g
 JwzZNzzcnkQxF6NxZ0wRXfaEoQVuu66MLJ/X3+F2d6JVeTbwDuImtwcc2L6j5TnhW30y
 jsrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJCrIgwA5QwUbunlHMm5cPNiOVR0ZZXX5tiXQHySO5E9w5gtj6IR0J3S0AF9xvFyd5fTS5b5zXo+7q9bPP0Jv4Pnhj/izUXPVJV0/p5FxGAF/pvGXNm73o
X-Gm-Message-State: AOJu0Yy85i9KFjq6h5FVCyRBSocEblT+AV34yli4PwFUQ4ypEck9Bccj
 7TGTNPTKzjRsqtnxpEyUpKA/fycxNBDbBuq1jykWHycvSUAqzrHTSrqjPSglSnDfvv1jwPa5mF1
 3Vvv02+eXFbhtfwyYZYIFy8ikjtoNGeqLUhwn0MIwm9YTuSa9zIu6AMboKN3kwfQc0duKbPgmKN
 JNyw==
X-Received: by 2002:a05:6808:1415:b0:3c9:9404:6c99 with SMTP id
 5614622812f47-3d1e35b9151mr13207012b6e.42.1717450754999; 
 Mon, 03 Jun 2024 14:39:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0ANFMBW6FTFEVnKixIfi5ytjIlsmW/YQ1Vrkemo+hu+JY0Vxa8xEcTgWh83KSdzdWL3Pt3Q==
X-Received: by 2002:a05:6808:1415:b0:3c9:9404:6c99 with SMTP id
 5614622812f47-3d1e35b9151mr13206977b6e.42.1717450753926; 
 Mon, 03 Jun 2024 14:39:13 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ae4a74dee1sm33877926d6.56.2024.06.03.14.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 14:39:13 -0700 (PDT)
Date: Mon, 3 Jun 2024 16:39:11 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <tukyfritbypmq3cf2mkasoaqq7lbjf6owaltghosx37df4cg3b@4mpglxfda25a>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC v2 0/8] net: stmmac: convert stmmac
	"pcs" to phylink
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

On Fri, May 31, 2024 at 12:25:47PM GMT, Russell King (Oracle) wrote:
> Hi,
> 
> This is version 2 of the series switching stmmac to use phylink PCS
> instead of going behind phylink's back.
> 
> Changes since version 1:
> - Addition of patches from Serge Semin to allow RGMII to use the
>   "PCS" code even if priv->dma_cap.pcs is not set (including tweaks
>   by me.)
> - Restructuring of the patch set to be a more logical split.
> - Leave the pcs_ctrl_ane methods until we've worked out what to do
>   with the qcom-ethqos driver (this series may still end up breaking
>   it, but at least we will now successfully compile.)
> 
> A reminder that what I want to hear from this patch set are the results
> of testing - and thanks to Serge, the RGMII paths were exercised, but
> I have not had any results for the SGMII side of this.

I took this for a brief spin on the sa8775p-ride eval board from
Qualcomm, as a reminder here's the dts to show the setup:

    https://elixir.bootlin.com/linux/v6.9-rc3/source/arch/arm64/boot/dts/qcom/sa8775p-ride.dts#L288

I didn't notice any issues with traffic on either interface (there's two
stmmac device instances, both using SGMII to a marvell 88ea1512 phy).
Did some basic link up / down tests, iperf3, etc.

If there's anything in specific you'd like exercised, please let me
know. I'll try and find time to look over the patches more carefully
tomorrow for review purposes, but I only know what I know from reading
the driver some, so I can't answer any of the open questions with any
official documentation.

Tested-by: Andrew Halaney <ahalaney@redhat.com>

> 
> There are still a bunch of outstanding questions:
> 
> - whether we should be using two separate PCS instances, one for
>   RGMII and another for SGMII. If the PCS hardware is not present,
>   but are using RGMII mode, then we probably don't want to be
>   accessing the registers that would've been there for SGMII.
> - what the three interrupts associated with the PCS code actually
>   mean when they fire.
> - which block's status we're reading in the pcs_get_state() method,
>   and whether we should be reading that for both RGMII and SGMII.
> - whether we need to activate phylink's inband mode in more cases
>   (so that the PCS/MAC status gets read and used for the link.)
> 
> There's probably more questions to be asked... but really the critical
> thing is to shake out any breakage from making this conversion. Bear
> in mind that I have little knowledge of this hardware, so this
> conversion has been done somewhat blind using only what I can observe
> from the current driver.
> 
> Original blurb below.
> 
> As I noted recently in a thread (and was ignored) stmmac sucks. (I
> won't hide my distain for drivers that make my life as phylink
> maintainer more difficult!)
> 
> One of the contract conditions for using phylink is that the driver
> will _not_ mess with the netif carrier. stmmac developers/maintainers
> clearly didn't read that, because stmmac messes with the netif
> carrier, which destroys phylink's guarantee that it'll make certain
> calls in a particular order (e.g. it won't call mac_link_up() twice
> in a row without an intervening mac_link_down().) This is clearly
> stated in the phylink documentation.
> 
> Thus, this patch set attempts to fix this. Why does it mess with the
> netif carrier? It has its own independent PCS implementation that
> completely bypasses phylink _while_ phylink is still being used.
> This is not acceptable. Either the driver uses phylink, or it doesn't
> use phylink. There is no half-way house about this. Therefore, this
> driver needs to either be fixed, or needs to stop using phylink.
> 
> Since I was ignored when I brought this up, I've hacked together the
> following patch set - and it is hacky at the moment. It's also broken
> because of recentl changes involving dwmac-qcom-ethqos.c - but there
> isn't sufficient information in the driver for me to fix this. The
> driver appears to use SGMII at 2500Mbps, which simply does not exist.
> What interface mode (and neg_mode) does phylink pass to pcs_config()
> in each of the speeds that dwmac-qcom-ethqos.c is interested in.
> Without this information, I can't do that conversion. So for the
> purposes of this, I've just ignored dwmac-qcom-ethqos.c (which means
> it will fail to build.)
> 
> The patch splitup is not ideal, but that's not what I'm interested in
> here. What I want to hear is the results of testing - does this switch
> of the RGMII/SGMII "pcs" stuff to a phylink_pcs work for this driver?
> 
> Please don't review the patches, but you are welcome to send fixes to
> them. Once we know that the overall implementation works, then I'll
> look at how best to split the patches. In the mean time, the present
> form is more convenient for making changes and fixing things.
> 
> There is still more improvement that's needed here.
> 
> Thanks.
> 
>  drivers/net/ethernet/stmicro/stmmac/Makefile       |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/common.h       |  12 +-
>  .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   | 146 ++++++++++++++-------
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  | 131 +++++++++++++-----
>  drivers/net/ethernet/stmicro/stmmac/hwif.h         |  19 ++-
>  .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 111 +---------------
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  33 ++---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   |  58 ++++++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   |  34 +----
>  9 files changed, 298 insertions(+), 248 deletions(-)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
