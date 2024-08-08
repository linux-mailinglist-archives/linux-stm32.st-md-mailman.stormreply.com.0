Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CB194C5E4
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Aug 2024 22:43:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2976C78019;
	Thu,  8 Aug 2024 20:42:59 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B8D5C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Aug 2024 20:42:58 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52f00ad303aso1749813e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Aug 2024 13:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723149777; x=1723754577;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tGUitiYVYitFcN4JMPacup/eKd8LJWBR2TLhG9ytri8=;
 b=DkYsLLzxckzcoGn8rN8EmGjsW2RxaxcbBScsxF3lq6NpNqePmANf1pl6iVmeld1uBp
 65C1vqgl8kiBMB5ryQbTWbQR1CHqYFqMl87sadKzNC+yN2diHPm3wdboeOr0c+rMWHUM
 tuns9SYUDAjOX4WToU/+2solqWQPu86RhATH/8No+KR+f5K9vXcsy7fbpCC6fuBnKiII
 CFaf0aWcWhxe3c/0m44mv/CChkVhy+lVZR2N767iLkb9kVpPn7dE6RJYwS8LbGooHZL4
 m8Uq94WEMCXHsJLWIYTmwIAez0oqYbWNN/lji8okxJnivkrWDGBWoyOsjLYI0tHiL4Z+
 5jwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723149777; x=1723754577;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tGUitiYVYitFcN4JMPacup/eKd8LJWBR2TLhG9ytri8=;
 b=pGPDX8/FIB+aD56FuUXRAyl/b3zZscH7fYHWqdN6er0wyki7t5dEX6tNwFQt/w3b7C
 q/Zr26SqKpSx+KYsr0nw/2RduYKT9gKPTGIo7PWBnFaK+6vMe5QbgeyZ0d4tLhMn0jYU
 kUA7Qtxj0Ykx0AUw4kfufBMXlsPzSQOscsRo+C4sfJlHo/t/2gRVaQCdIYc3wpKdqXFW
 /UAMaJjb4axf5so0xVv5BzYjP3Qlut6n9upLQ6mnXmPjsYwyc6TG7C3Z3Z+IR8h606xE
 DUpX6Op6JJGN5eoXGJK8I+9LqZZ/bOBjGvFkdG2EbN9H+byID2CuPgT+86M96jjzaY4U
 jqZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhBh7irgLsVasx/IjiULQ38RcKL9nYUhB2JyruVVfyhVyv6oH7hDvxLGiENVt3/0/JZx8B349FYjzEfuT9GTd31BbbQ8flvsJ4pFz8QtVxIeSC1og/dfek
X-Gm-Message-State: AOJu0YxhSlki9wg/TKbKwH3XU33ghU3n3lccgawOuBFLK92AUL0DZ+qS
 xU1mo0FcfDimrmJIKA80X/Pk2qe94/GoJDSTzjossIT8/KArWZzK
X-Google-Smtp-Source: AGHT+IH9N9oxY53zP8QTt5y/XprisO8MFH32Z0u3yvJrevbkHXIKKbuJO+7pbjLm75UmPLEdWjGoQQ==
X-Received: by 2002:a05:6512:3c9e:b0:52e:9619:e26a with SMTP id
 2adb3069b0e04-530e5844362mr2507786e87.26.1723149776749; 
 Thu, 08 Aug 2024 13:42:56 -0700 (PDT)
Received: from mobilestation ([95.79.225.241])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530de481f4esm751928e87.287.2024.08.08.13.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 13:42:56 -0700 (PDT)
Date: Thu, 8 Aug 2024 23:42:53 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <d3yg5ammwevvcgs3zsy2fdvc45pce5ma2yujz7z2wp3vvpaim6@wgh6bb27c5tb>
References: <ZrCoQZKo74zvKMhT@shell.armlinux.org.uk>
 <rq2wbrm2q3bizgxcnl6kmdiycpldjl6rllsqqgpzfhsfodnd3o@ymdfbxq2gj5j>
 <ZrM8g5KoaBi5L00b@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZrM8g5KoaBi5L00b@shell.armlinux.org.uk>
Cc: Sneh Shah <quic_snehshah@quicinc.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next v4 00/14] net: stmmac:
 convert stmmac "pcs" to phylink
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

On Wed, Aug 07, 2024 at 10:21:07AM +0100, Russell King (Oracle) wrote:
> On Tue, Aug 06, 2024 at 09:56:04PM +0300, Serge Semin wrote:
> > Hi Russell
> > 
> > Got this series tested on my DW GMAC v3.73a + Micrel KSZ9031RNX PHY
> > with the in-band link status management enabled. The same positive result
> > as before, on v1-v2:
> > [  294.651324] stmmaceth 1f060000.ethernet eth1: configuring for inband/rgmii-rxid link mode
> > [  294.582498] stmmaceth 1f060000.ethernet eth1: Register MEM_TYPE_PAGE_POOL RxQ-0
> > [  294.594308] stmmaceth 1f060000.ethernet eth1: PHY [stmmac-1:03] driver [RTL8211E Gigabit Ethernet] (irq=POLL)
> > [  294.605453] dwmac1000: Master AXI performs any burst length
> > [  294.611899] stmmaceth 1f060000.ethernet: invalid port speed
> > [  294.618229] stmmaceth 1f060000.ethernet eth1: No Safety Features support found
> > [  294.626412] stmmaceth 1f060000.ethernet eth1: No MAC Management Counters available
> > [  294.634912] stmmaceth 1f060000.ethernet eth1: IEEE 1588-2008 Advanced Timestamp supported
> > [  294.644380] stmmaceth 1f060000.ethernet eth1: registered PTP clock
> > [  294.651324] stmmaceth 1f060000.ethernet eth1: configuring for inband/rgmii-rxid link mode
> > ...
> > [  298.772917] stmmaceth 1f060000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx/tx
> > 
> > So feel free to add:
> > Tested-by: Serge Semin <fancer.lancer@gmail.com>
> 
> Thanks.
> 
> > Please note the warning: "stmmaceth 1f060000.ethernet: invalid port
> > speed" in the log above. This is a false negative warning since my
> > network devices isn't of MAC2MAC-type and there is no snps,ps-speed
> > property in my dts. So having the priv->hw.ps set to zero should be
> > fine. That said I guess we need to add the warning fix to the 14/14
> > patch which would permit the plat_stmmacenet_data::mac_port_sel_speed
> > field being zero.
> 

> I think this is a separate issue - one which exists even today with
> the stmmac driver as this code hasn't changed. Maybe it should be a
> separate patch targetting the net tree?

Ok. Tomorrow I'll submit the patch fixing that case.

> 
> > > Previous cover messages from earlier posts below:
> > > 
> > > This is version 3 of the series switching stmmac to use phylink PCS
> > > isntead of going behind phylink's back.
> > > 
> > > Changes since version 2:
> > > - Adopted some of Serge's feedback.
> > > - New patch: adding ethqos_pcs_set_inband() for qcom-ethqos so we
> > >   have one place to modify for AN control rather than many.
> > > - New patch: pass the stmmac_priv structure into the pcs_set_ane()
> > >   method.
> > > - New patch: remove pcs_get_adv_lp() early, as this is only for TBI
> > >   and RTBI, support for which we dropped in an already merged patch.
> > > - Provide stmmac_pcs structure to encapsulate the pointer to
> > >   stmmac_priv, PCS MMIO address pointer and phylink_pcs structure.
> > > - Restructure dwmac_pcs_config() so we can eventually share code
> > >   with dwmac_ctrl_ane().
> > > - New patch: move dwmac_ctrl_ane() into stmmac_pcs.c, and share code.
> > > - New patch: pass the stmmac_pcs structure into dwmac_pcs_isr().
> > > - New patch: similar to Serge's patch, rename the PCS registers, but
> > >   use STMMAC_PCS_ as the prefix rather than just PCS_ which is too
> > >   generic.
> > > - New patch: incorporate "net: stmmac: Activate Inband/PCS flag
> > >   based on the selected iface" from Serge.
> > > 
> > > On the subject of whether we should have two PCS instances, I
> > > experimented with that and have now decided against it. Instead,
> > > dwmac_pcs_config() now tests whether we need to fiddle with the
> > > PCS control register or not.
> > > 
> > 
> > > Note that I prefer not to have multiple layers of indirection, but
> > > instead prefer a library-style approach, which is why I haven't
> > > turned the PCS support into something that's self contained with
> > > a method in the MAC driver to grab the RGSMII status.
> > 
> > I understand the reason of your choice in this case. As a result a
> > some part of my changes haven't been merged in into your series. But I
> > deliberately selected the approach with having the simple PCS
> > HW-interface callbacks utilized for a self-contained internal PCS
> > implementation. Here is why:
> > 1. Signify that the DW GMAC and DW QoS Eth internal PCSs are the
> > same.
> > 2. Reduce the amount of code.
> > 3. Collects the entire PCS implementation in a single place which
> > improves the code readability.
> > 4. The PCS ops initialization is implemented in the same way as the
> > PTP, MMC and EST (and likely FPE in some time in future), in the
> > hwif.c and the interface/core callbacks in the dedicated files
> > (stmmac_ptp.c, mmc_core.c, stmmac_est.c, etc). So the PCS
> > implementation would be in general unified with what has been done for
> > PTP/MMC/EST/etc. 
> > 5. ...
> > 
> > Taking that into account I am still convinced that my approach worth
> > to be implemented. Hope you won't mind, if after your series is merged
> > in I'll submit another patch set which would introduce some of my
> > PCS-changes not included into your patch set. Like this:
> > 1. Move the mac_device_info instance to being defined in the
> > stmmac_priv structure (new patch, so to drop the stmmac_priv pointer
> > from stmmac_pcs).
> > 2. Introduce stmmac_priv::pcsaddr (to have the PCS CSR base address
> > defined in the same way as for PTP/MMC/EST/etc).
> > 3. Provide the HWIF ops:
> >    stmmac_pcs_ops {
> >         pcs_get_config_reg;
> >         pcs_enable_irq;
> >         pcs_disable_irq;
> >    } for DW GMAC and DW QoS Eth.
> > 4. Move PCS implementation to stmmac_pcs.c
> > 5. Direct using the plat_stmmacenet_data::mac_port_sel_speed field
> > instead of the mac_device_info::ps.
> > 6. Some more cleanups like converting the struct stmmac_hwif_entry
> > field from void-pointers to the typed-pointers, ...
> 

> I guessed that you would dig your heals in over this, and want to do
> it your own way despite all the points I raised against your patch
> series on my previous posting arguing against much of this.
> 
> So, at this point I give up with this patch series - clearly there is
> no room for discussion about the way forward, and you want to do it
> your way no matter what.

I actually thought that in general the approach implemented in my
patches didn't meet much dislikes from your side. Just several notes
which could be easily fixed in the next revisions.

Anyway thanks for understanding. I'll wait for your series to be
merged in. Then I'll submit my patch set based on top of it (of course
taking into account all the notes raised by you back then).

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
