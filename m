Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 093FA4A5A76
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Feb 2022 11:48:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF97DC60460;
	Tue,  1 Feb 2022 10:48:04 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6764CC5EC43
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Feb 2022 10:48:03 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 211AlUrU118559;
 Tue, 1 Feb 2022 04:47:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1643712450;
 bh=pGKyHfWX15eh3qo2QXJ8np7UoCYvaSlxF+7QvjQhaQE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=hVVcvR9kgztinH1mrkm+VoL1HfIBLNNXiuv2qoH11LD5P+DklIIXVcJy4CWomO1Jq
 UPwNPvZkjXJeOPu/FVts8NC3csau92OcVl/i8P6Xe+aOiVSDgUi4VmJZoIZpfh0jbI
 qMeKUuYESTDIjkP6NQ2p3F30m0Tkgoyry9MHS8LA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 211AlUIk046516
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Feb 2022 04:47:30 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 1
 Feb 2022 04:47:28 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 1 Feb 2022 04:47:28 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 211AlRLd017809;
 Tue, 1 Feb 2022 04:47:28 -0600
Date: Tue, 1 Feb 2022 16:17:27 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <20220201104727.7xvcyexf3yucegcb@ti.com>
References: <20220131095755.8981-1-christophe.kerello@foss.st.com>
 <20220131095755.8981-5-christophe.kerello@foss.st.com>
 <20220131144309.0ffe7cc8@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220131144309.0ffe7cc8@xps13>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, vigneshr@ti.com,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, srinivas.kandagatla@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, chenshumin86@sina.com
Subject: Re: [Linux-stm32] [PATCH v2 4/4] mtd: core: Fix a conflict between
 MTD and NVMEM on wp-gpios property
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

On 31/01/22 02:43PM, Miquel Raynal wrote:
> Hi Vignesh, Tudory, Pratyush,
> 
> + Tudor and Pratyush
> 
> christophe.kerello@foss.st.com wrote on Mon, 31 Jan 2022 10:57:55 +0100:
> 
> > Wp-gpios property can be used on NVMEM nodes and the same property can
> > be also used on MTD NAND nodes. In case of the wp-gpios property is
> > defined at NAND level node, the GPIO management is done at NAND driver
> > level. Write protect is disabled when the driver is probed or resumed
> > and is enabled when the driver is released or suspended.
> > 
> > When no partitions are defined in the NAND DT node, then the NAND DT node
> > will be passed to NVMEM framework. If wp-gpios property is defined in
> > this node, the GPIO resource is taken twice and the NAND controller
> > driver fails to probe.
> > 
> > A new Boolean flag named skip_wp_gpio has been added in nvmem_config.
> > In case skip_wp_gpio is set, it means that the GPIO is handled by the
> > provider. Lets set this flag in MTD layer to avoid the conflict on
> > wp_gpios property.
> > 
> > Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> > ---
> >  drivers/mtd/mtdcore.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> > index 70f492dce158..e6d251594def 100644
> > --- a/drivers/mtd/mtdcore.c
> > +++ b/drivers/mtd/mtdcore.c
> > @@ -546,6 +546,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
> >  	config.stride = 1;
> >  	config.read_only = true;
> >  	config.root_only = true;
> > +	config.skip_wp_gpio = true;
> >  	config.no_of_node = !of_device_is_compatible(node, "nvmem-cells");
> >  	config.priv = mtd;
> >  
> > @@ -833,6 +834,7 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
> >  	config.owner = THIS_MODULE;
> >  	config.type = NVMEM_TYPE_OTP;
> >  	config.root_only = true;
> > +	config.skip_wp_gpio = true;
> >  	config.reg_read = reg_read;
> >  	config.size = size;
> >  	config.of_node = np;
> 
> TLDR: There is a conflict between MTD and NVMEM, who should handle the
> WP pin when there is one? At least for raw NAND devices, I don't want
> the NVMEM core to handle the wp pin. So we've introduced this
> skip_wp_gpio nvmem config option. But there are two places where this
> boolean can be set and one of these is for otp regions (see above). In
> this case, I don't know if it is safe or if CFI/SPI-NOR rely on the
> nvmem protection. Please tell us if you think this is fine for you.

Why does NVMEM touch hardware write protection in the first place? The 
purpose of the framework is to provide a way to retrieve config stored 
in memory. It has no business dealing with details of the chip like the 
WP line. That should be MTD's job (which it should delegate to SPI NOR, 
SPI NAND, etc.). If you want to write protect a cell then do it in 
software. I don't see why NVMEM should be dealing with hardware directly 
at all.

That is my mental model of how things _should_ work. I have not spent 
much time digging into how things actually work currently.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
