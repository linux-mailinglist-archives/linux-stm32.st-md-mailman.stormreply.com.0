Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C58381B98A
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 15:30:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F178AC6B477;
	Thu, 21 Dec 2023 14:30:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA4C2C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 14:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703169054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zig8qc3IDsKkD4ExqdB1/amOsrM6X3FD08f8jHvUYWI=;
 b=huh96UwLLUW16q3IxdjGT2jnsBKDv0CsLsIuL8prFrNLL70SwOPH4qNcHRD90JtDHDwB01
 pdtZAuEXAQdbAGeNAAnGrMxAURI83HtMzc7b0kK+eewHOjIszudD059xeQJWe3tzXUCqc+
 dx+bKoWySnEcBSUtmpZO7UfDE1g//Uw=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-3JQV2g3kMmmSHK2xAw05dw-1; Thu, 21 Dec 2023 09:30:53 -0500
X-MC-Unique: 3JQV2g3kMmmSHK2xAw05dw-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3b88ac1f09cso786954b6e.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 06:30:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703169052; x=1703773852;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zig8qc3IDsKkD4ExqdB1/amOsrM6X3FD08f8jHvUYWI=;
 b=RSkRHxAnepQEW/JPSuCmr+/NQOLAwh5McISJQ1/h5ilISx04eNod0QVTVBjBcEif69
 H71G70ZXFkngmHsUGmPUAMRT2TszygY/hpAxcNYhokX5NARu+cRGl6XL5yQvj8AlkZVz
 JCQAREFlYa1AbCL50wj3agG9F/nNfovnKeZW14Sj9Ydu6Fp6TD9RwB7qya191A3BzPoY
 s0eTNe4WlNj3gqSCRBcnqEEd9vfWs+YhCu6jZBy9WeaDjnT32jqEXHoP5jzbz0cTvNXu
 +WhIQCPlS6t2MBDs+oJallrJTUCwA6KNJBRoCsQcnKzy0RQuuY2pF9FlHFrzpS9YthMt
 0Q3g==
X-Gm-Message-State: AOJu0YxSFT32Jvt8sHIZ5EsLaGQATb/sAC4C/8iD4ORAaDs+owAjjg5C
 wPZnowEokaGf9fl1c28zM+H+uq56uOEhzNnqypucrP618U/xTbQs04DdhQ8ixs7soPwKhgEvTVx
 GFibJ9MxshvknHcMxLKpawgQVcW1ZnKyNc7/02Wr4
X-Received: by 2002:a05:6808:3a13:b0:3b9:e779:8a0e with SMTP id
 gr19-20020a0568083a1300b003b9e7798a0emr24604045oib.1.1703169052140; 
 Thu, 21 Dec 2023 06:30:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGh5JWE7xwkRuEZs5f8huoPHHsEpTlNPmCqmNG9XaohXtJYkwK7dgrejxTjPDpZalyNe4H8Tw==
X-Received: by 2002:a05:6808:3a13:b0:3b9:e779:8a0e with SMTP id
 gr19-20020a0568083a1300b003b9e7798a0emr24604029oib.1.1703169051803; 
 Thu, 21 Dec 2023 06:30:51 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a0cfe8b000000b0067f14259eb7sm658817qvs.76.2023.12.21.06.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 06:30:51 -0800 (PST)
Date: Thu, 21 Dec 2023 08:30:49 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <vvlnwiobrgcwuam6lkud2np5xqocj6asjf627j3gekkhm4hfp5@vhdd47fyortm>
References: <20231218071118.21879-1-quic_snehshah@quicinc.com>
 <4zbf5fmijxnajk7kygcjrcusf6tdnuzsqqboh23nr6f3rb3c4g@qkfofhq7jmv6>
 <8b80ab09-8444-4c3d-83b0-c7dbf5e58658@quicinc.com>
 <wvzhz4fmtheculsiag4t2pn2kaggyle2mzhvawbs4m5isvqjto@lmaonvq3c3e7>
 <8f94489d-5f0e-4166-a14e-4959098a5c80@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <8f94489d-5f0e-4166-a14e-4959098a5c80@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac-qcom-ethqos:
 Add support for 2.5G SGMII
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

On Thu, Dec 21, 2023 at 02:23:57PM +0530, Sneh Shah wrote:
> 
> 
> On 12/20/2023 9:29 PM, Andrew Halaney wrote:
> > On Wed, Dec 20, 2023 at 01:02:45PM +0530, Sneh Shah wrote:
> >>
> >>
> >> On 12/18/2023 9:50 PM, Andrew Halaney wrote:
> >>> On Mon, Dec 18, 2023 at 12:41:18PM +0530, Sneh Shah wrote:
> >>>> Serdes phy needs to operate at 2500 mode for 2.5G speed and 1000
> >>>> mode for 1G/100M/10M speed.
> >>>> Added changes to configure serdes phy and mac based on link speed.
> >>>>
> >>>> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
> >>>> ---
> >>>>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 31 +++++++++++++++++--
> >>>>  1 file changed, 29 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> >>>> index d3bf42d0fceb..b3a28dc19161 100644
> >>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> >>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> >>>> @@ -21,6 +21,7 @@
> >>>>  #define RGMII_IO_MACRO_CONFIG2		0x1C
> >>>>  #define RGMII_IO_MACRO_DEBUG1		0x20
> >>>>  #define EMAC_SYSTEM_LOW_POWER_DEBUG	0x28
> >>>> +#define ETHQOS_MAC_AN_CTRL		0xE0
> >>>>  
> >>>>  /* RGMII_IO_MACRO_CONFIG fields */
> >>>>  #define RGMII_CONFIG_FUNC_CLK_EN		BIT(30)
> >>>> @@ -78,6 +79,10 @@
> >>>>  #define ETHQOS_MAC_CTRL_SPEED_MODE		BIT(14)
> >>>>  #define ETHQOS_MAC_CTRL_PORT_SEL		BIT(15)
> >>>>  
> >>>> +/*ETHQOS_MAC_AN_CTRL bits */
> >>>> +#define ETHQOS_MAC_AN_CTRL_RAN			BIT(9)
> >>>> +#define ETHQOS_MAC_AN_CTRL_ANE			BIT(12)
> >>>> +
> >>>
> >>> nit: space please add a space before ETHQOS_MAC_AN_CTRL
> >>>
> >> will take care of this in next patch
> >>
> >>>>  struct ethqos_emac_por {
> >>>>  	unsigned int offset;
> >>>>  	unsigned int value;
> >>>> @@ -109,6 +114,7 @@ struct qcom_ethqos {
> >>>>  	unsigned int num_por;
> >>>>  	bool rgmii_config_loopback_en;
> >>>>  	bool has_emac_ge_3;
> >>>> +	unsigned int serdes_speed;
> > 
> > Another nit as I look closer: I think this should be grouped by phy_mode
> > etc just for readability.
> Didn't get this. can you please elaborate more?

I meant instead of this:

    struct qcom_ethqos {
	    struct platform_device *pdev;
	    void __iomem *rgmii_base;
	    void __iomem *mac_base;
	    int (*configure_func)(struct qcom_ethqos *ethqos);

	    unsigned int link_clk_rate;
	    struct clk *link_clk;
	    struct phy *serdes_phy;
	    unsigned int speed;
	    phy_interface_t phy_mode;

	    const struct ethqos_emac_por *por;
	    unsigned int num_por;
	    bool rgmii_config_loopback_en;
	    bool has_emac_ge_3;
	    unsigned int serdes_speed;
    };

I think this would make more logical sense:

    struct qcom_ethqos {
	    struct platform_device *pdev;
	    void __iomem *rgmii_base;
	    void __iomem *mac_base;
	    int (*configure_func)(struct qcom_ethqos *ethqos);

	    unsigned int link_clk_rate;
	    struct clk *link_clk;
	    struct phy *serdes_phy;
	    unsigned int serdes_speed;
	    unsigned int speed;
	    phy_interface_t phy_mode;

	    const struct ethqos_emac_por *por;
	    unsigned int num_por;
	    bool rgmii_config_loopback_en;
	    bool has_emac_ge_3;
    };

It is definitely nit picking though :)
> > 
> >>>>  };
> >>>>  
> >>>>  static int rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
> >>>> @@ -600,27 +606,47 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
> >>>>  
> >>>>  static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
> >>>>  {
> >>>> -	int val;
> >>>> -
> >>>> +	int val, mac_an_value;
> >>>>  	val = readl(ethqos->mac_base + MAC_CTRL_REG);
> >>>> +	mac_an_value = readl(ethqos->mac_base + ETHQOS_MAC_AN_CTRL);
> >>>>  
> >>>>  	switch (ethqos->speed) {
> >>>> +	case SPEED_2500:
> >>>> +		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
> >>>> +		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> >>>> +			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> >>>> +			      RGMII_IO_MACRO_CONFIG2);
> >>>> +		if (ethqos->serdes_speed != SPEED_2500)
> >>>> +			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
> >>>> +		mac_an_value &= ~ETHQOS_MAC_AN_CTRL_ANE;
> >>>> +		break;
> >>>>  	case SPEED_1000:
> >>>>  		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
> >>>>  		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> >>>>  			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> >>>>  			      RGMII_IO_MACRO_CONFIG2);
> >>>> +		if (ethqos->serdes_speed != SPEED_1000)
> >>>> +			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
> >>>> +		mac_an_value |= ETHQOS_MAC_AN_CTRL_RAN | ETHQOS_MAC_AN_CTRL_ANE;
> >>>>  		break;
> >>>>  	case SPEED_100:
> >>>>  		val |= ETHQOS_MAC_CTRL_PORT_SEL | ETHQOS_MAC_CTRL_SPEED_MODE;
> >>>> +		if (ethqos->serdes_speed != SPEED_1000)
> >>>> +			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
> >>>> +		mac_an_value |= ETHQOS_MAC_AN_CTRL_RAN | ETHQOS_MAC_AN_CTRL_ANE;
> >>>>  		break;
> >>>>  	case SPEED_10:
> >>>>  		val |= ETHQOS_MAC_CTRL_PORT_SEL;
> >>>>  		val &= ~ETHQOS_MAC_CTRL_SPEED_MODE;
> >>>> +		if (ethqos->serdes_speed != SPEED_1000)
> >>>> +			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
> >>>> +		mac_an_value |= ETHQOS_MAC_AN_CTRL_RAN | ETHQOS_MAC_AN_CTRL_ANE;
> >>>>  		break;
> >>>>  	}
> >>>>  
> >>>>  	writel(val, ethqos->mac_base + MAC_CTRL_REG);
> >>>> +	writel(mac_an_value, ethqos->mac_base + ETHQOS_MAC_AN_CTRL);
> >>>> +	ethqos->serdes_speed = ethqos->speed;
> >>>
> >>> I see these bits are generic and there's some functions in stmmac_pcs.h
> >>> that muck with these...
> >>>
> >>> Could you help me understand if this really should be Qualcomm specific,
> >>> or if this is something that should be considered for the more core bits
> >>> of the driver? I feel in either case we should take advantage of the
> >>> common definitions in that file if possible.
> >>>
> >> we do have function dwmac_ctrl_ane in core driver which updates same registers. However, it does not have the option to reset ANE bit, it can only set bits. For SPEED_2500 we need to reset ANE bit. Hence I am adding it here. Not sure if we can extend dwmac_ctrl_ane function to reset bits as well.
> > 
> > I'd evaluate if you can update that function to clear the ANE bit when
> > the ane boolean is false. From the usage I see I feel that makes sense,
> > but correct me if you think I'm wrong.
> > At the very least let's use the defines from there, and possibly add a
> > new function if clearing is not acceptable in dwmac_ctrl_ane().
> > 
> > Stepping back, I was asking in general is the need to muck with ANE here
> > is a Qualcomm specific problem, or is that a generic thing that should be
> > handled in the core (and the phy_set_speed() bit stay here)? i.e. would
> > any dwmac5 based IP need to do something like this for SPEED_2500?
> I think disabling ANE for SPEED_2500 is generic not specific to qualcomm. Even in dwxgmac2 versions also we need to disable ANE for SPEED_2500. Autoneg clause 37 stadard doesn't support 2500 speed. So we need to disable autoneg for speed 2500

Another nit, sorry for being so picky. Can you please wrap your emails
to around 80 characters? That's the general etiquette when replying
on-list, makes it easier to read (similar to say a commit message).

Thanks for explaining that. Then in my opinion based on what you've said
I think the disabling of ANE for SPEED_2500 should be done outside of
the Qualcomm platform code.

Note, I'm struggling to keep up with the standards at play here, so if
someone else who's a bit more wise on these topics has an opinion I'd
listen to them. I find myself rewatching this presentation from
Maxime/Antoine as a primer on all of this:

    https://www.youtube.com/watch?v=K962S9gTBVM

If anyone's got any recommended resources for me to read in particular I
am all ears.

I'll be out the next 2-3 weeks, so don't wait for any responses from me
:)

Thanks,
Andrew

> 
> > 
> >>>>  
> >>>>  	return val;
> >>>>  }
> >>>> @@ -789,6 +815,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
> >>>>  				     "Failed to get serdes phy\n");
> >>>>  
> >>>>  	ethqos->speed = SPEED_1000;
> >>>> +	ethqos->serdes_speed = SPEED_1000;
> >>>>  	ethqos_update_link_clk(ethqos, SPEED_1000);
> >>>>  	ethqos_set_func_clk_en(ethqos);
> >>>>  
> >>>> -- 
> >>>> 2.17.1
> >>>>
> >>>
> >>
> > 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
