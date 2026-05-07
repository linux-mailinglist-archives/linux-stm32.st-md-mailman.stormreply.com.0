Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKDDC+q3/GkqTAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 18:03:54 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB7E4EBC4D
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 18:03:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1FCAC8F283;
	Thu,  7 May 2026 16:03:52 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44E34C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 16:03:51 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso10416395e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2026 09:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778169830; x=1778774630;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6okPXnC/tZolkk3p3FjZk+KFTlmCOhId/0Ru10JUIvc=;
 b=NUgL2oUOmiq4U++R26zjf3al6yHsAnXKaCiEAGynA0OkuVuFouSti5hGZyKyflgRo+
 HJDhOUC+5AXgGC58draEEKuBiRRWfs9si97ArE3Q5SZkvfuHpaDKRBO+WdtQHzdD21bP
 o5PvQiSuMehPEfhKPdiyLu1g/qBVdMk99rMzFEajMfTgrjtXH0Kr9I65O0TW5bWT8w7k
 DqaoLpxLowQg3C5GlNs4sim8X8mZ/5tPqDaFKLjHtYAeRxZSfaCaTujanQrqsyU+KTMg
 Bi7Pjh9Rg5wdq9jpYeTbrGLy9JATfEigKFD7k9iuzxDh2h+8oq4g+XfW9dTchMvmXDy7
 z1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778169830; x=1778774630;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6okPXnC/tZolkk3p3FjZk+KFTlmCOhId/0Ru10JUIvc=;
 b=HaajVKydw66yrA71GTazfEe3SUEAJCFlpVOjdFvlkOls7lgglu+1UhwyOB01m4UXJ9
 jXqDgZhGKdU1wP4Znj9bgabT6CFWZYbz0bKndNu2ySMovT0AophSbnRRQuXzZ/gQTT2F
 aFdEHv5/LhZGLcPiv/ox18PHuxSiXEyqKrEvfSoGK5cLLayzlbNoG+gU58tClhig3L0+
 nRd4gibGbh1GS/plZuU/90l6oHIVpBwFfdIe/mFC9N2Pb1M2BakknOtLDk5U9CV3L37A
 LSABeqIdSeNJBHb5mk/B7YFixwlnJ/0kfu/98XhvHs6UA9fwTEmhGRaaFAbUwZ5tTy8Q
 YYAg==
X-Forwarded-Encrypted: i=1;
 AFNElJ88Lzglq6UySO7F7SvbLe1aLbZTjb5mbVRfEwGk++W2ZVyhYEUig5M96dZx5QEtCjajLB1CJKkUqVn2DQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyi07VuRoMYZTSVzzQ4UkjsvcjkSKNWGut3xywM7Sb1PBzRC69N
 NnTn5BfuZw7lbzmNMDws7pkNOiHzwAqT2qht39Gpd/6X4nMKjsXHE/QunYt/RNTkVfA=
X-Gm-Gg: AeBDietScWiMA3f1DKuPmz6ekVJuUXSll+1SqXfgowerOYeGge8r4Bll4vLtDnvK4NH
 f/cJKK9yKJVT6JxyjSDVxsVKYXNNCjPBG6B6doXVfEFxPr+lHEJhYehHxm3yllu/oB9Sjz2lo0S
 p4yDZM2wUQ/T2a6ogZzg03Z1HonO60ha3Zf4TYSqSD4t7zQyKitbzS04ZQxWfbRfh68PxoVh0b3
 dEqpTfmx85pnLYd1gqoqRbbOu0c0X6vFWry8V2MIaNKleJP8k4g1YYgAfEnpi37PAXTV0XVjxiw
 +O9pUb+rMV5LB+SKgMmRJzsEv8XpAkmgY1xXKdeV9l1ME3nO/nnZlT4O1ZtEO+IvnhfcqNBm7KM
 gm8x1t9S5ur4R6RHoC3E3ftBT2QLUUkdRdDLBesI0k3pxHbyL+EjhCD90JI1XR1mNIsCIECh0tb
 507ZUfI+EkpQfAfto7FxfsLxS1+cOgv8YOxXmA9VdUTNcfy7XfyeCIK/rqKL9QRYsgXvdF8QhBW
 QcXmLo7IxY7Uc3DDEi44oAn47+zAHFL44Xj91HF27gse6CojiOyGZXfpxuxKYgZaX47C2pKwhLR
 XW0uIbUR
X-Received: by 2002:a05:600c:a404:b0:488:a824:fdff with SMTP id
 5b1f17b1804b1-48e51f3e0f8mr128948435e9.22.1778169830360; 
 Thu, 07 May 2026 09:03:50 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e53907e8asm130198325e9.13.2026.05.07.09.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 09:03:49 -0700 (PDT)
Date: Thu, 7 May 2026 17:03:46 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <afy34kj2hPxIlArO@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <2ce5897d-5bbb-486a-b0f0-0e30e54b451a@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ce5897d-5bbb-486a-b0f0-0e30e54b451a@lunn.ch>
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 chenchuangyu@xiaomi.com, edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 Alex Elder <elder@riscstar.com>, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, maxime.chevallier@bootlin.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, kuba@kernel.org,
 pabeni@redhat.com, konradybcio@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, hawk@kernel.org, arnd@arndb.de, brgl@kernel.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, linux-gpio@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linusw@kernel.org, a0987203069@gmail.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 inochiama@gmail.com, krzk+dt@kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, andersson@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 10/12] net: stmmac: tc956x: add
 TC956x/QPS615 support
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
X-Rspamd-Queue-Id: 9AB7E4EBC4D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:elder@riscstar.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a0987203069
 @gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,riscstar.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	NEURAL_HAM(-0.00)[-0.818];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,aspen.lan:mid]
X-Rspamd-Action: no action

On Fri, May 01, 2026 at 09:04:58PM +0200, Andrew Lunn wrote:
> > +static struct tc956x_mac_speed mac_speed[] = {
> > +	{ PHY_INTERFACE_MODE_2500BASEX,	SPEED_2500,  SP_SEL_SGMII_2500M, },
> > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_2500,  SP_SEL_SGMII_2500M, },
> > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_1000,  SP_SEL_SGMII_1000M, },
>
> That looks odd. Some vendors implemented 2500BaseX using SGMII
> overclocked. But that is not strictly 2500BaseX. Having the 2500BASEX
> entry suggests you have real 2500BASEX, so why have an SGMII entry
> with SPEED_2500?

This is a consequence of the code that uses this lookup table being
called both during initialization and from the fix_mac_speed() callback.

During initialization we only have the value in plat->phy_interface to
go on so we run the lookup table using plat->phy_interface (which is
typically PHY_INTERFACE_MODE_SGMII) and with the maximum permitted
speed.

I haven't got detailed enough notes to allow me to double check but I
think there were problems completing the initial MAC reset if we didn't
write something sensible to the hardware during initialization.

During fix_max_speed() we get told to adopt 2500base-x. Reviewing the
code I can see we don't propagate that and just use
plat->phy_interface for fix_mac_speed(). I will fix the code to that
the requested interface propagates properly to the lookup table but I
think we would still rely on the SGMII entry to get sane initial values
to write to the hardware.


> > +/* We have one IRQ chip instance with 25 IRQs in its domain */
>
> One per MAC, or one overall?

One per MAC.


> > +static struct irq_domain *
> > +tc956x_msigen_irq_domain_instantiate(struct tc956x_data *td)
> > +{
> > +	struct irq_domain_chip_generic_info dgc_info;
> > +	struct irq_domain_info info;
> > +
> > +	dgc_info.name = "tc956x-msigen";
>
> If it is one per MAC, maybe this name should indicate which instance
> of the MAC this is.

Will do.


> > +static int tc956x_mac_setup(void *apriv, struct mac_device_info *mac)
> > +{
> > +	struct stmmac_priv *priv = apriv;
> > +	struct stmmac_desc_ops *desc;
> > +	struct stmmac_dma_ops *dma;
> > +	struct tc956x_data *td;
> > +
> > +	td = priv->plat->bsp_priv;
> > +
> > +	/* dwxgmac301_dma_ops needs extending to provide DMA address translation */
> > +	dma = &td->dma;
> > +	*dma = dwxgmac301_dma_ops;
> > +	dma->init_rx_chan = tc956x_dma_init_rx_chan;
> > +	dma->init_tx_chan = tc956x_dma_init_tx_chan;
> > +	mac->dma = dma;
>
> I could be reading this wrong....
>
> dma points to the global dwxgmac301_dma_ops, which you added a few
> patches back.
>
> You then modify it, changing two values in it.
>
> Doesn't that break any other dwxgmac301 in the system? Shouldn't you
> be making a copy of the global structure, and then making
> modifications to your copy? mac->dma then points to your copy?

That's exactly what this code does.

`*dma = dwxgmac301_dma_ops` is a structure copy, we never take a pointer
to dwxgmac301_dma_ops (and if we did, dwxgmac301_dma_ops is const so I
think we'd get a kernel oops if we tried to write to rodata).

Would to code be easier to read if we dropped the local `dma` variable
since that would make it clearer that td->dma is not a pointer? More
like:

+       /* dwxgmac301_dma_ops needs extending to provide DMA address translation */
+       td->dma = dwxgmac301_dma_ops;
+       td->dma.init_rx_chan = tc956x_dma_init_rx_chan;
+       td->dma.init_tx_chan = tc956x_dma_init_tx_chan;
+       mac->dma = &dma;


>
> > +	/* dwxgmac210_desc_ops also needs extending for the same reason */
> > +	desc = &td->desc;
> > +	*desc = dwxgmac210_desc_ops;
> > +	desc->set_addr = tc956x_desc_set_addr;
> > +	desc->set_sec_addr = tc956x_desc_set_sec_addr;
> > +	mac->desc = desc;
>
> And the same problem here?
>
> > +/* Called by tc956x_dwmac_probe(); return errors with dev_err_probe() */
> > +static int tc956x_dwmac_parse_dt(struct tc956x_data *td)
> > +{
> > +	struct device_node *mdio_node;
> > +	struct device *dev = td->dev;
> > +	struct device_node *np;
> > +
> > +	np = dev_of_node(dev);
> > +	if (!np)
> > +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
> > +
> > +	/* Find the MDIO bus */
> > +	for_each_child_of_node(np, mdio_node) {
> > +		if (of_device_is_compatible(mdio_node,
> > +					    "snps,dwmac-mdio"))
> > +			break;
> > +	}
>
> It looks like if you put the ethernet properties into an ethernet node
> in DT, this might go away? Or at least allow you to use
> stmmac_of_get_mdio().

Alex has started looking into adding an ethernet node.


Daniel.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
