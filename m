Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD088CF631
	for <lists+linux-stm32@lfdr.de>; Sun, 26 May 2024 23:57:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC75FC6DD72;
	Sun, 26 May 2024 21:57:13 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 984FDC6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 May 2024 21:57:06 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5296935252dso2461749e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 May 2024 14:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716760626; x=1717365426;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wSLYbNOc0WXKT9eTO9El1tEl9xgGnuLjqap+6tcHEXk=;
 b=YOW83Pmtn+Bi+lm8A45Ltjp+Ib75z0P5OHK9PHggmqjvCTjNTSt+0RDNhdeDvxE39B
 jJO4o4HzlniAZOBzEemZSgmjDQFMbF2IfG02xeXPARGaPt7GNRjJYkALEyxrzGcyVOnm
 I8emx6p9V5Rr3TSmQHfDfr/ggK9m6Ii5JX3i8tJ2O0ZsU6UoTTsndL7SuNhHvSwaOM/g
 Wjpfde4jv2yjLR345QTIje+JPWy6+Zlcy7GO8eB8wXMYqPu3Eu9gfoTFSQClwqP24p48
 6NdaSYME3cWfmKJ03b76oM4Js1Ldm5owRWOSQGoz7Pn8+vX0fdNz9dZif7oXOUExSrHb
 U5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716760626; x=1717365426;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wSLYbNOc0WXKT9eTO9El1tEl9xgGnuLjqap+6tcHEXk=;
 b=meyl8Bvw6i7YvLSK34LkMqT3hEawAjX30kVH51wCtRD1AYdaFMrE2vRL2OoiQFms+9
 A5sWv5gbdfo7jHklBV9UrpFsGqp2H9dIdrK+cHg3KJx06o2FTGxh+VouughFkeWN+A+o
 4XBoomfGurUB4mUVw689F8sAskDWU3+c5v/dEdgWDrxnpM3xXOPjdAcH6s2HF97P9pkk
 AUOZOtD6NvT7vENx5K38oDrDYcGNPPMtD2BBqfXBch4z6+tkIDKIGEgOKSBHdM0nDIa/
 elDRukfG8qiN2ztUBfC6d8wII8VntgtEzgh8DjigF7FnIiRV0HwzjH4KXGjcNhc5PmM0
 q4Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjFXUd+t6W7PTg0jxVGw15JvGMIG0qWQmp9NaRUZaHotrOG1w/KQPNfe4EWefJXS7O6QUcVMhHkyHytnyR2OBmBMXJeVCKBTxB5gIQPsuB7S9eCxw9TOl9
X-Gm-Message-State: AOJu0YwmeptGvZSnFNPvPbK0PlwYGRYu/jLYkYD79qb4DiUSqhZ/9Hdk
 icFj8GrYWE3j/kXM9lpTXruXpevPNd8eFJNYt2ZYRdZvQWfp7J4E
X-Google-Smtp-Source: AGHT+IELJz1bfY7qab9MN0pLBVMuQ7fP28zkZOcK3TiIbIg7HQ+RVmpy5KdYhCO/w//q2oL5AJ01vQ==
X-Received: by 2002:ac2:5dca:0:b0:51e:150e:2c45 with SMTP id
 2adb3069b0e04-52966e9ac88mr4682197e87.63.1716760625412; 
 Sun, 26 May 2024 14:57:05 -0700 (PDT)
Received: from mobilestation ([95.79.182.53]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529716dd12fsm453116e87.305.2024.05.26.14.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 May 2024 14:57:04 -0700 (PDT)
Date: Mon, 27 May 2024 00:57:02 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <fvjrnunu4lriegq3z7xkefsts6ybn2vkxmve6xzi73krjgvcj6@bhf4b4xx3x72>
References: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
 <20240524210304.9164-1-fancer.lancer@gmail.com>
 <20240524210304.9164-2-fancer.lancer@gmail.com>
 <ZlNoLHoHjt3BsFde@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZlNoLHoHjt3BsFde@shell.armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, Byungho An <bh74.an@samsung.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 2/3] net: stmmac: Activate
 Inband/PCS flag based on the selected iface
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

On Sun, May 26, 2024 at 05:49:48PM +0100, Russell King (Oracle) wrote:
> On Sat, May 25, 2024 at 12:02:58AM +0300, Serge Semin wrote:
> > The HWFEATURE.PCSSEL flag is set if the PCS block has been synthesized
> > into the DW GMAC controller. It's always done if the controller supports
> > at least one of the SGMII, TBI, RTBI PHY interfaces. If none of these
> > interfaces support was activated during the IP-core synthesize the PCS
> > block won't be activated either and the HWFEATURE.PCSSEL flag won't be
> > set. Based on that the RGMII in-band status detection procedure
> > implemented in the driver hasn't been working for the devices with the
> > RGMII interface support and with none of the SGMII, TBI, RTBI PHY
> > interfaces available in the device.
> > 
> > Fix that just by dropping the dma_cap.pcs flag check from the conditional
> > statement responsible for the In-band/PCS functionality activation. If the
> > RGMII interface is supported by the device then the in-band link status
> > detection will be also supported automatically (it's always embedded into
> > the RGMII RTL code). If the SGMII interface is supported by the device
> > then the PCS block will be supported too (it's unconditionally synthesized
> > into the controller). The later is also correct for the TBI/RTBI PHY
> > interfaces.
> > 
> > Note while at it drop the netdev_dbg() calls since at the moment of the
> > stmmac_check_pcs_mode() invocation the network device isn't registered. So
> > the debug prints will be for the unknown/NULL device.
> 

> Thanks. As this is a fix, shouldn't it be submitted for the net tree as
> it seems to be fixing a bug in the driver as it stands today?

From one point of view it could be submitted for the net tree indeed,
but on the second thought are you sure we should be doing that seeing
it will activate the RGMII-inband detection and the code with the
netif-carrier toggling behind the phylink back? Who knows what new
regressions the activated PCS-code can cause?..

> 
> Also, a build fix is required here:
> 
> > -	if (priv->dma_cap.pcs) {
> > -		if ((interface == PHY_INTERFACE_MODE_RGMII) ||
> > -		    (interface == PHY_INTERFACE_MODE_RGMII_ID) ||
> > -		    (interface == PHY_INTERFACE_MODE_RGMII_RXID) ||
> > -		    (interface == PHY_INTERFACE_MODE_RGMII_TXID)) {
> > -			netdev_dbg(priv->dev, "PCS RGMII support enabled\n");
> > -			priv->hw->pcs = STMMAC_PCS_RGMII;
> > -		} else if (interface == PHY_INTERFACE_MODE_SGMII) {
> > -			netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
> > -			priv->hw->pcs = STMMAC_PCS_SGMII;
> > -		}
> > -	}
> > +	if (phy_interface_mode_is_rgmii(interface))
> > +		priv->hw.pcs = STMMAC_PCS_RGMII;
> > +	else if (interface == PHY_INTERFACE_MODE_SGMII)
> > +		priv->hw.pcs = STMMAC_PCS_SGMII;
> 
> Both of these assignments should be priv->hw->pcs not priv->hw.pcs.

Ah, right. Originally I applied your patchset on top of my fixes,
cleanups and platform glue-driver patchsets. One of the cleanups
implied the mac_device_info instance movement to the stmmac_priv
structure. When I was moving my changes onto your original series I
just missed that part of the patch. Sorry about that. The rest of my
patches seems free from such problem.

> 
> I think there's also another bug that needs fixing along with this.
> See stmmac_ethtool_set_link_ksettings(). Note that this denies the
> ability to disable autoneg, which (a) doesn't make sense for RGMII
> with an attached PHY, and 

This doesn't make sense for RGMII also due to DW GMAC/QoS Eth not having
anything AN-related for the RGMII PHY interface. RGMII mode permits
the Link status detection via the in-band signal retrieved from the
PHY and nothing else. AN, if enabled, is performed on the PHY side.

> (b) this code should be passing the
> ethtool op to phylink for it to pass on to phylib so the PHY can
> be appropriately configured for the users desired autoneg and
> link mode settings.

I am not that well aware of the phylink internals to be saying for
100% sure, but thinking logically it would be indeed better if phylink
was aware of the PCS state changes. But in case of the STMMAC PCS
implementation I guess that the original PCS-code was designed to work
with no PHY being involved:
e58bb43f5e43 ("stmmac: initial support to manage pcs modes")
See that commit prevented the MDIO-bus registration and PHY
initialization in case of the PCS/RGMII-inband being available. But in
practice the implementation turned to be not that well thought
through. So eventually, commit-by-commit, the implementation was
effectively converted to the no longer used code. At least for the
MACs with just RGMII interface and no additional SGMII/TBI/RTBI
interfaces, which I guess is the vast majority of the real devices
with RGMII.

> 
> I also don't think it makes any sense for the STMMAC_PCS_SGMII case
> given that it means Cisco SGMII - which implies that there is also
> a PHY (since Cisco SGMII with inband is designed to be coupled with
> something that looks like a PHY to send the inband signalling
> necessary to configure e.g. the SGMII link symbol replication.

AFAICS the STMMAC driver supports the MAC2MAC case connected over
SGMII with no intermediate PHY. In that case the speed will be just
fixed to what was set in the "snps,ps-speed" property. The RAL (Rate
Adapter Layer) is configured to do that by having the SGMRAL flag set
(see your dwmac_pcs_config() and what is done if hw->ps is non-zero).

> 
> In both of these cases, even if the user requests autoneg to be
> disabled, that _shouldn't_ affect internal network driver links.
> This ethtool op is about configuring the externally visible media
> side of the network driver, not the internal links.

IMO considering all the driver over-complexity (that's the most polite
definition I managed to come up to.)) it would be much easier and
likely safer not to try to fix the PCS-code and just convert it to
something sane. At least the RGMII/In-band functionality we'll be able
to test on my device. If the PCS SGMII part is still utilized by
anybody, then if there are problems there the new kernel RCs will get
to reveal them.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
