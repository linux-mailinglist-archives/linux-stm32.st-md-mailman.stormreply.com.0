Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 433971CDD96
	for <lists+linux-stm32@lfdr.de>; Mon, 11 May 2020 16:45:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE0BDC36B2D;
	Mon, 11 May 2020 14:45:34 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3D9EC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 14:45:31 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5EA232000D;
 Mon, 11 May 2020 14:45:29 +0000 (UTC)
Date: Mon, 11 May 2020 16:45:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20200511164524.3f94ba31@xps13>
In-Reply-To: <6f822f79-18f1-5308-16cc-b31f0be80d5a@st.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-11-git-send-email-christophe.kerello@st.com>
 <20200511111855.48216940@xps13>
 <3377adc6-3e5e-b9b7-12be-c7aa44bfac82@st.com>
 <20200511135926.3e5c622d@xps13>
 <0c704fea-f2a6-2cec-8741-d322acf6afd5@st.com>
 <20200511145855.35c6abfb@xps13>
 <6f822f79-18f1-5308-16cc-b31f0be80d5a@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, gregkh@linuxfoundation.org, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, boris.brezillon@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 10/10] mtd: rawnand: stm32_fmc2: get
 resources from parent node
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

Hi Christophe,

Christophe Kerello <christophe.kerello@st.com> wrote on Mon, 11 May
2020 16:19:47 +0200:

> Hi Miquel,
> 
> On 5/11/20 2:58 PM, Miquel Raynal wrote:
> > Hi Christophe,
> > 
> > Christophe Kerello <christophe.kerello@st.com> wrote on Mon, 11 May
> > 2020 14:47:09 +0200:
> >   
> >> Hi Miquel,
> >>
> >> On 5/11/20 1:59 PM, Miquel Raynal wrote:  
> >>> Hi Christophe,
> >>>
> >>> Christophe Kerello <christophe.kerello@st.com> wrote on Mon, 11 May
> >>> 2020 12:21:03 +0200:  
> >>>    >>>> Hi Miquel,  
> >>>>
> >>>> On 5/11/20 11:18 AM, Miquel Raynal wrote:  
> >>>>> Hi Christophe,
> >>>>>
> >>>>> Christophe Kerello <christophe.kerello@st.com> wrote on Wed, 6 May 2020
> >>>>> 11:11:19 +0200:  
> >>>>>     >>>> FMC2 EBI support has been added. Common resources (registers base  
> >>>>>> and clock) are now shared between the 2 drivers. It means that the
> >>>>>> common resources should now be found in the parent device when EBI
> >>>>>> node is available.
> >>>>>>
> >>>>>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> >>>>>> ---  
> >>>>>
> >>>>> [...]  
> >>>>>     >>>> +  
> >>>>>> +static bool stm32_fmc2_nfc_check_for_parent(struct platform_device *pdev)
> >>>>>> +{
> >>>>>> +	u32 i;
> >>>>>> +	int nb_resources = 0;
> >>>>>> +
> >>>>>> +	/* Count the number of resources in reg property */
> >>>>>> +	for (i = 0; i < pdev->num_resources; i++) {
> >>>>>> +		struct resource *res = &pdev->resource[i];
> >>>>>> +
> >>>>>> +		if (resource_type(res) == IORESOURCE_MEM)
> >>>>>> +			nb_resources++;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	/* Each CS needs 3 resources defined (data, cmd and addr) */
> >>>>>> +	if (nb_resources % 3)
> >>>>>> +		return false;
> >>>>>> +
> >>>>>> +	return true;
> >>>>>> +}  
> >>>>>
> >>>>> This function looks fragile. Why not just checking the compatible
> >>>>> string of the parent node?  
> >>>>>     >>  
> >>>> Yes, it is another way to check that we have an EBI parent node.
> >>>>
> >>>> In this implementation, I was checking the number of reg tuples.
> >>>> In case we have 6, it means that the register base address is defined in the parent node (EBI node).
> >>>> In case we have 7, it means that the register base address is defined in the current node (NFC node).  
> >>>
> >>> Yes, I understand what you are doing, but I kind of dislike the logic.
> >>> Relying on the number of reg tuples is something that can be done (I
> >>> used it myself one time), but I think this is more a hack that you do
> >>> when you have no other way to differentiate. I guess the proper way
> >>> would be to look at the parent's compatible. If it matches what you
> >>> expect, then you can store the dev->of_node->parent->dev somewhere in
> >>> your controller's structure and then use it to initialize the clock and
> >>> regmap. This way you don't have to move anything else in the probe path.  
> >>>    >>  
> >> OK, I will check the compatible string of the parent device using of_device_is_compatible API in v5.
> >> In case of the parent is found, I will add it in the structure of the controller (dev_parent).
> >> I will rely on this field only to get the common resources (the register base address and the clock) in the NFC node or in the EBI node.  
> > 
> > I had something slightly different in mind: what about setting a
> > default value to this field as being the controller's device itself.
> > This way, once it is set to either the parent device or the device
> > itself, you can use it "blindly" in your devm_clk_get/regmap_init calls?
> >   
> 
> I will try to explain what I have in mind.
> 
> I will add a new field in the structure of the controller (not called dev_parent but cdev)
> struct device *cdev;
> 
> Then, at probe time, this field will be assigned:
> nfc->cdev = of_device_is_compatible(dev->parent->of_node, "bla bla") : dev->parent ? dev;

That's what I had in mind. Maybe you'll have to use
dev->of_node->parent though, I think they are not equivalent.

> 
> For the clock, it will be
> nfc->clk = devm_clk_get(nfc->cdev, NULL);
> 
> For the register base, I need to replace:
> res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> mmio = devm_ioremap_resource(dev, res);
> if (IS_ERR(mmio))
> 	return PTR_ERR(mmio);
> 
> nfc->regmap = devm_regmap_init_mmio(dev, mmio, &stm32_fmc2_regmap_cfg);
> if (IS_ERR(nfc->regmap))
> 	return PTR_ERR(nfc->regmap);
> 
> nfc->io_phys_addr = res->start;
> 
> With:
> 
> ret = of_address_to_resource(nfc->cdev->of_node, 0, &res);
> if (ret)
> 	return ret;
> 
> nfc->io_phys_addr = res.start;
> 
> nfc->regmap = device_node_to_regmap(nfc->cdev->of_node);
> if (IS_ERR(nfc->regmap))
> 	return PTR_ERR(nfc->regmap);
> 
> I expect that you were thinking about something like this proposal.

This means the regmap has already been initialized, can you make sure
it is actually the case? What if the probe of the EBI block happens
next, or is deferred? (maybe you'll get a -EPROBE_DEFER, which is fine
then). Please try booting with the EBI node but without the EBI driver
and see if this is handled gracefully.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
