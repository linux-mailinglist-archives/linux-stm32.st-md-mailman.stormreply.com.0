Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DABB94D824
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Aug 2024 22:41:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3481FC78021;
	Fri,  9 Aug 2024 20:41:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 812FCC78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Aug 2024 20:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723236070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XNEXIEJzPBMlsAjpwHn7jEhkWltbTdI4oT0K7wYk6s4=;
 b=gzJBBR0aXdssxPlutpr8zx0l+xRC7q7C/VfwCQOwRQ3kwOwYasAaAZSgjY2eCupXeqLsnn
 C1b0fP40cnIqQ2VTViB+96CGDYQiWdm2FWpOfy/W7DSGIHvWrYYN1XOwhkQ390SiGebmqe
 FlV62KUyb9HPztecHhU2x1ATtz2Oh5k=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-hsqocX4JM7atUQPR-V3jYw-1; Fri, 09 Aug 2024 16:41:09 -0400
X-MC-Unique: hsqocX4JM7atUQPR-V3jYw-1
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-492901b9bedso1299980137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Aug 2024 13:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723236069; x=1723840869;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XNEXIEJzPBMlsAjpwHn7jEhkWltbTdI4oT0K7wYk6s4=;
 b=IAA7F5ZTQDLaR82rr+YN9atz3keAvLH6JXPekr414gQg6yiUQg6eLCqghPpytp35RK
 S723yfYlhHeo76f6DR8NBdnUka1qX0aVz0mdO3IC02d0uJLnrWe6bBOxBbly1MGaqEBG
 x0pgPmKcPvFTHlTMyKELKFkkiCfC+tNvfOvth8JTvS+6cTMyjpG/wbz1N2VuWD+hQ0qy
 pLci22AhVy9uUQYLFNyOPDWO9Hcd4Bh3a7/eMB5bJllKEjKdIl/nJ9jPwzrsds9ptpHw
 hbKM9J6jtJchqyeYaM97TrbOlBwj2/VpLyWOXgYo7bzQEyZJFFRA4scuv04Q0lU2QZ7J
 Kw4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzymceF4HUBcvRK7zXhvFxlMRPsp3aHCJZmTYWNYdW/hrI6c2trvQkAMCwC6m+WWAdsZS/tjlKjppvdbFqNfpdzOCvJfaYoIy9SyMydMdTqoCn+C4/fofA
X-Gm-Message-State: AOJu0Yw3jfl1ZNaHBxzw8ykL83igVCMnEMMvwWuOXRJEQ5EuB/sWXIOI
 OalOiUUH0RiuXm8CoxqHTNldK/C/9B4/DDcAZ1LLNuN187SIwNtTDfgNXu2NASDGCgSKC2Xq/zm
 D5jbXf3AzgHu486hBLnvR3+udRRL8RD1/qd3zsi/p4PMH9gCJE7yz9+rFGk94zTu/bZD6xNns6H
 ZMGw==
X-Received: by 2002:a05:6102:3a06:b0:48f:eb5f:84d8 with SMTP id
 ada2fe7eead31-495d85e952emr3059704137.27.1723236068646; 
 Fri, 09 Aug 2024 13:41:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhReBDQpsSa/QW032kDulYMN60Yhxqd+Hhm6w1zY++jeYljBNaq2SJ1k5pPC7La1xrvy/g7w==
X-Received: by 2002:a05:6102:3a06:b0:48f:eb5f:84d8 with SMTP id
 ada2fe7eead31-495d85e952emr3059671137.27.1723236068218; 
 Fri, 09 Aug 2024 13:41:08 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::13])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4531c1c322csm1137141cf.26.2024.08.09.13.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 13:41:07 -0700 (PDT)
Date: Fri, 9 Aug 2024 15:41:04 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <32bevr5jxmmm3ynnj3idpk3wdyaddoynyb7hv5tro3n7tsswwd@bbly52u3mzmn>
References: <20240809192150.32756-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240809192150.32756-1-fancer.lancer@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Fix false "invalid port
	speed" warning
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

On Fri, Aug 09, 2024 at 10:21:39PM GMT, Serge Semin wrote:
> If the internal SGMII/TBI/RTBI PCS is available in a DW GMAC or DW QoS Eth
> instance and there is no "snps,ps-speed" property specified (or the
> plat_stmmacenet_data::mac_port_sel_speed field is left zero), then the
> next warning will be printed to the system log:
> 
> > [  294.611899] stmmaceth 1f060000.ethernet: invalid port speed
> 
> By the original intention the "snps,ps-speed" property was supposed to be
> utilized on the platforms with the MAC2MAC link setup to fix the link
> speed with the specified value. But since it's possible to have a device
> with the DW *MAC with the SGMII/TBI/RTBI interface attached to a PHY, then
> the property is actually optional (which is also confirmed by the DW MAC
> DT-bindings). Thus it's absolutely normal to have the
> plat_stmmacenet_data::mac_port_sel_speed field zero initialized indicating
> that there is no need in the MAC-speed fixing and the denoted warning is
> false.

Can you help me understand what snps,ps-speed actually does? Its turned
into a bool and pushed down into srgmi_ral right now:

	/**
	 * dwmac_ctrl_ane - To program the AN Control Register.
	 * @ioaddr: IO registers pointer
	 * @reg: Base address of the AN Control Register.
	 * @ane: to enable the auto-negotiation
	 * @srgmi_ral: to manage MAC-2-MAC SGMII connections.
	 * @loopback: to cause the PHY to loopback tx data into rx path.
	 * Description: this is the main function to configure the AN control register
	 * and init the ANE, select loopback (usually for debugging purpose) and
	 * configure SGMII RAL.
	 */
	static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
					  bool srgmi_ral, bool loopback)
	{
		u32 value = readl(ioaddr + GMAC_AN_CTRL(reg));

		/* Enable and restart the Auto-Negotiation */
		if (ane)
			value |= GMAC_AN_CTRL_ANE | GMAC_AN_CTRL_RAN;
		else
			value &= ~GMAC_AN_CTRL_ANE;

		/* In case of MAC-2-MAC connection, block is configured to operate
		 * according to MAC conf register.
		 */
		if (srgmi_ral)
			value |= GMAC_AN_CTRL_SGMRAL;

		if (loopback)
			value |= GMAC_AN_CTRL_ELE;

		writel(value, ioaddr + GMAC_AN_CTRL(reg));
	}

What is that bit doing exactly? The only user upstream I see is
sa8775p-ride variants, but they're all using a phy right now (not
fixed-link aka MAC2MAC iiuc)... so I should probably remove it from
there too.

I feel like that property really (if I'm following right) should be just
taken from a proper fixed-link devicetree description? i.e. we already
specify a speed in that case. Maybe this predates that (or reinvents it)
and should be marked as deprecated in the dt-bindings.

But I'm struggling to understand what the bit is really doing based
on the original commit that added it, so I don't know if my logic is
solid. i.e., what's different in the phy case vs mac2mac with this
particular bit?

Thanks for your never ending patience about my questions wrt the
hardware and this driver.

- Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
