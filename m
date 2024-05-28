Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7192A8D1B06
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 14:22:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39CA5C6B47E;
	Tue, 28 May 2024 12:22:45 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D3B1CFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 12:22:44 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-529661f2552so969002e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 05:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716898964; x=1717503764;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=30d0TTe0qu/2T+a0CP2Ht/sekYc/5hfNw/7/ZEtYxu8=;
 b=UYkZqgNqllX+D/1LP6Wya65OvcPf6B6tj009vxKX7+7gOQRaXG4LH/x1lrl1wmDFpW
 Mfg5DufXSPLX5Awpd+HH+/TT3IV5GsASZyI9GSNcoVkjIBMz9aGBJZa8wBNjHQ9FUTnY
 4UyqRUqELt8LVZA9rgt+VuAXnZ0gUTdiuFn0FoWWvpFKqRJVRrbY7SGDpDaWpKpGPu20
 zmjtxGa7hYanniIB6De4oayEWGwhuufgE17XkMhlAiKjP9e8ytfKYe3/xYZYpzix+Vqz
 2mVachffC0b9Wfys9cOv/QFBm+poyB347YTpf/8872VyC8+26/Mb0uFmYlNy+ZMy0M+I
 QzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716898964; x=1717503764;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=30d0TTe0qu/2T+a0CP2Ht/sekYc/5hfNw/7/ZEtYxu8=;
 b=BYK0Su93pWoOj4J6UvWARJYZbh+GIK8WiarxiAJxmtEj50Yr6D0Ta/E1CfUZ1/RIqx
 I+WSbvbd/N2bBE098iSMKXLTlWRsLLCmlPQfJ8D57KC0Muy3RZ9iwVZPwfGdLxmNTHpT
 8Gd0UchPDZHEW+RUyR1nNra+PnBdmIZ2eTbTc84L74hSxAr6WUdWRFfQXlVQlQHSFNT1
 ouIic5JKK7QthZ3lRxNWnA2O8W9hwps9B8wL/B+M5RPX6qtqwQ41u+DRUCLloBws48VY
 mLRY8uEF1D3HWpbt44ugdUIgAU2RR2UT5RcxY1Xt3iINuB4Lp52o1SMRdrDeZzDCjl4M
 tbng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxjlcZumssRWLbVsrwXbJujKlbZCcfYNbEx/SeI9YyNfsk/MvXWJFL/5Di/lWHLRou4t8HN5yN3geiYMgK1pzLtuuwwEVQtXwBYZzg3L7VPhlps8uV8xsE
X-Gm-Message-State: AOJu0YyHoPPeN6K3mvuleE4Vf+0qfYjwu/s6hG01a3uOupzT4B1Hk8Hq
 p1SKj3I62IUV6r51NT8y1VCwmYVIOj9Gj03SCNCgsqnKeaXeyPhX
X-Google-Smtp-Source: AGHT+IEFpxm72+ZufBEpOzTdYaIOWqK1qFRYEzUeMkVy/VVpK/unVesitw9GPmLNPR4IWW5XCaPpGg==
X-Received: by 2002:a19:5e04:0:b0:51a:f84d:1188 with SMTP id
 2adb3069b0e04-52964e93a0dmr7396162e87.19.1716898963461; 
 Tue, 28 May 2024 05:22:43 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296e888b33sm920102e87.8.2024.05.28.05.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 05:22:43 -0700 (PDT)
Date: Tue, 28 May 2024 15:22:40 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <mflda2pvhiilceh4qkyq43jedgx3fxeo7mbs2cfa5c44veygg2@muhwd4gj5mth>
References: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
 <20240524210304.9164-1-fancer.lancer@gmail.com>
 <20240524210304.9164-2-fancer.lancer@gmail.com>
 <ZlNoLHoHjt3BsFde@shell.armlinux.org.uk>
 <fvjrnunu4lriegq3z7xkefsts6ybn2vkxmve6xzi73krjgvcj6@bhf4b4xx3x72>
 <ZlWwMzMZrwb5fscN@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZlWwMzMZrwb5fscN@shell.armlinux.org.uk>
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

On Tue, May 28, 2024 at 11:21:39AM +0100, Russell King (Oracle) wrote:
> On Mon, May 27, 2024 at 12:57:02AM +0300, Serge Semin wrote:
> > On Sun, May 26, 2024 at 05:49:48PM +0100, Russell King (Oracle) wrote:
> > > On Sat, May 25, 2024 at 12:02:58AM +0300, Serge Semin wrote:
> > > > The HWFEATURE.PCSSEL flag is set if the PCS block has been synthesized
> > > > into the DW GMAC controller. It's always done if the controller supports
> > > > at least one of the SGMII, TBI, RTBI PHY interfaces. If none of these
> > > > interfaces support was activated during the IP-core synthesize the PCS
> > > > block won't be activated either and the HWFEATURE.PCSSEL flag won't be
> > > > set. Based on that the RGMII in-band status detection procedure
> > > > implemented in the driver hasn't been working for the devices with the
> > > > RGMII interface support and with none of the SGMII, TBI, RTBI PHY
> > > > interfaces available in the device.
> > > > 
> > > > Fix that just by dropping the dma_cap.pcs flag check from the conditional
> > > > statement responsible for the In-band/PCS functionality activation. If the
> > > > RGMII interface is supported by the device then the in-band link status
> > > > detection will be also supported automatically (it's always embedded into
> > > > the RGMII RTL code). If the SGMII interface is supported by the device
> > > > then the PCS block will be supported too (it's unconditionally synthesized
> > > > into the controller). The later is also correct for the TBI/RTBI PHY
> > > > interfaces.
> > > > 
> > > > Note while at it drop the netdev_dbg() calls since at the moment of the
> > > > stmmac_check_pcs_mode() invocation the network device isn't registered. So
> > > > the debug prints will be for the unknown/NULL device.
> > > 
> > 
> > > Thanks. As this is a fix, shouldn't it be submitted for the net tree as
> > > it seems to be fixing a bug in the driver as it stands today?
> > 
> > From one point of view it could be submitted for the net tree indeed,
> > but on the second thought are you sure we should be doing that seeing
> > it will activate the RGMII-inband detection and the code with the
> > netif-carrier toggling behind the phylink back? Who knows what new
> > regressions the activated PCS-code can cause?..
> 
> If it's not a fix that is suitable without the remainder of the patch
> set, this should be stated in the commit description and it shouldn't
> have a Fixes: tag.
> 
> The reason is because it wouldn't be stable kernel material without the
> other patches - if stable picks it up without the other patches then
> it could end up being applied without the other patches resulting in
> the situation you mention above.
> 
> Shall I remove the Fixes: tag?

Let's drop it then, so not to cause confusion for the maintainers.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
