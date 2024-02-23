Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A75D0861F9E
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Feb 2024 23:25:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33EC7C6B47E;
	Fri, 23 Feb 2024 22:25:00 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86360C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Feb 2024 22:24:58 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-512bd533be0so1767758e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Feb 2024 14:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708727098; x=1709331898;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OOl1lY0a6/dohk1NliPsKFcgM+2fz/8FAtk2Q5fDb1Y=;
 b=b1zLrpgCcrwt63D5TyU+YL2xo4XshR9E32hsPYfu53O/Fu1iPZxeb2FDZ7iGuMWPmX
 SVzvjCUUv7h90gNL19lJnsSlhVZcGxNhaA920v7sO8X19TQv7tfpHS+nRVgiNgx+MGLe
 PpMd8h3HWwYWU6QUIJYCcfEC5je8ROBolwQ2s8qV5RWmGZjIeLqe6HlLK9h/MLQspnUl
 1XvakFOZfu8qXPqUwx/CC5hRRxKonh2OHVTo6yxy8/s/ZRM49qUeAeFch/Dgc3BFn8XH
 NAhY8wGN+XVu7xllb/h1vWBmzinZdg1e1cRGauO9AI4UQLm2Nf3BfKpb7apyPCup63M1
 Vd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708727098; x=1709331898;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OOl1lY0a6/dohk1NliPsKFcgM+2fz/8FAtk2Q5fDb1Y=;
 b=RmV+ajAuCQ6g5c/H+qP7V5wN+Fe/glUNR3CGv+RwuXDeKDkq8MMbN3TJug72yBq1bR
 m4OUvtV9LJEmHQqmaK/HszmK7DRxMB+G995iFzIjNKTm7czFhXPA8ruE9XAIN8qWiL5k
 4jshkgcqUQfWvDVL6vXjqmNHVoJWPK0VDvBaohSl3JU3Qn0GIZVuvdj3V43yTFkrNAmn
 wJr1kzarF87MOhVfI4eUWOVxqoEpZ8ojqPKDUoEPFYBppMj4YeK9NrkjR2B9e+OJhOfl
 BKBlO6/QKKMgGg5K5TeeXbib0emejysKOpIRjhJ/8nhlcALiOS+wfCHA+pOurbA3CuB7
 q1SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7WHOj0m3iss269WCiwcw1UN7+Z3Z03qU7H22VxH0mBsteSdta/b/4rydihoPcDxh5BhRry8w3u+6mo9Wb7KX2jRgUCa3tntCtW0tIe2cLnmrmOdkXoByB
X-Gm-Message-State: AOJu0Yynj8aRb900QseXfbfcUCQ4fPBCGupA5IwMKJ3aKSnNifVnxGr5
 AbIuqoF4l/aLOisPcIqvr6QuA+kXJDDHcQ5cP/S01j1/AIHgQNAv
X-Google-Smtp-Source: AGHT+IEXKLqTCm3Drz6eJFU6W2jRa+bGqgbnfHWqsjRN8it0sQzJZAQ9bhgdCfAAqOYjVLeFlMIwOQ==
X-Received: by 2002:ac2:5e9b:0:b0:512:db76:4e16 with SMTP id
 b27-20020ac25e9b000000b00512db764e16mr642503lfq.4.1708727097314; 
 Fri, 23 Feb 2024 14:24:57 -0800 (PST)
Received: from mobilestation ([95.79.226.168])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a056512398900b00512e14d1218sm610819lfu.261.2024.02.23.14.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 14:24:56 -0800 (PST)
Date: Sat, 24 Feb 2024 01:24:54 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <kns2u6o4nhz4vda74r2mscyyp6yjgo2p62vryeenucm4o3ngzb@j6ch3sl6xha2>
References: <20240219-stmmac-axi-config-v3-0-fca7f046e6ee@nvidia.com>
 <20240219-stmmac-axi-config-v3-3-fca7f046e6ee@nvidia.com>
 <xne2i6jwqaptsrd2hjdahxbscysgtj7iabqendyjb75fnrjc5z@js7n7qngtzym>
 <CZ9Z70HO2C7J.398BRNM8NBIG1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CZ9Z70HO2C7J.398BRNM8NBIG1@gmail.com>
Cc: Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-tegra@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Configure
 AXI on Tegra234 MGBE
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

On Tue, Feb 20, 2024 at 03:28:39PM +0100, Thierry Reding wrote:
> On Mon Feb 19, 2024 at 7:32 PM CET, Serge Semin wrote:
> > On Mon, Feb 19, 2024 at 05:46:06PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > Allow the device to use bursts and increase the maximum number of
> > > outstanding requests to improve performance. Measurements show an
> > > increase in throughput of around 5x on a 1 Gbps link.
> > > 
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
> > > index bab57d1675df..b6bfa48f279d 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
> > > @@ -199,6 +199,12 @@ static void mgbe_uphy_lane_bringup_serdes_down(struct net_device *ndev, void *mg
> > >  	writel(value, mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
> > >  }
> > >  
> > > +static const struct stmmac_axi tegra234_mgbe_axi = {
> > > +	.axi_wr_osr_lmt = 63,
> > > +	.axi_rd_osr_lmt = 63,
> > > +	.axi_blen = { 256, },
> > > +};
> > > +
> > >  static int tegra_mgbe_probe(struct platform_device *pdev)
> > >  {
> > >  	struct plat_stmmacenet_data *plat;
> > > @@ -284,6 +290,9 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
> > >  	if (err < 0)
> > >  		goto disable_clks;
> > >  
> > > +	/* setup default AXI configuration */
> > > +	res.axi = &tegra234_mgbe_axi;
> > > +
> > >  	plat = devm_stmmac_probe_config_dt(pdev, &res);
> > >  	if (IS_ERR(plat)) {
> > >  		err = PTR_ERR(plat);
> >
> > Let's get back to the v2 discussion:
> >
> > On Mon Feb 5, 2024 at 1:44 AM CET, Serge Semin wrote:
> > > The entire series can be converted to just a few lines of change:
> > >     plat = devm_stmmac_probe_config_dt(pdev, res.mac);
> > >     if (IS_ERR(plat)) {
> > >             err = PTR_ERR(plat);
> > >             goto disable_clks;
> > >     }
> > > +
> > > +   if (IS_ERR_OR_NULL(plat->axi)) {
> > > +           plat->axi = devm_kzalloc(&pdev->dev, sizeof(*axi), GFP_KERNEL);
> > > +           if (!plat->axi) {
> > > +                   ret = -ENOMEM;
> > > +                   goto disable_clks;
> > > +           }
> > > +   } /* else memset plat->axi with zeros if you wish */
> > > +
> > > +   plat->axi->axi_wr_osr_lmt = 63;
> > > +   plat->axi->axi_rd_osr_lmt = 63;
> > > +   plat->axi->axi_blen[0] = 256;
> > >  
> > >     plat->has_xgmac = 1;
> > >     plat->flags |= STMMAC_FLAG_TSO_EN;
> > >     plat->pmt = 1;
> > >
> > > Please don't overcomplicate the already overcomplicated driver with a
> > > functionality which can be reached by the default one. In this case
> > > the easiest way is to let the generic code work and then
> > > override/replace/fix/etc the retrieved values. Thus there won't be
> > > need in adding the redundant functionality and keep the generic
> > > DT-platform code a bit simpler to read.
> >
> > You responded with:
> >
> > On Tue, Feb 13, 2024 at 04:51:34PM +0100, Thierry Reding wrote:
> > > I'm not sure I understand how this is overcomplicating things. The code
> > > is pretty much unchanged, except that the AXI configuration can now have
> > > driver-specified defaults before the DT is parsed. Perhaps I need to add
> > > comments to make that a bit clearer?
> > > 
> > > While your version is certainly simpler it has the drawback that it no
> > > longer allows the platform defaults to be overridden in device tree. I
> > > would prefer if the defaults can be derived from the compatible string
> > > but if need be for those defaults to still be overridable from device
> > > tree.
> >
> > Currently available functionality is easier to read and understand: by
> > default the data is retrieved from the DT, if no AXI DT-node found you
> > can allocate/create your own AXI-configs, if there is AXI DT-node you
> > can fix it up in whatever way your wish. Thus the default behavior is
> > straightforward. You on the contrary suggest to add an additional
> > field to the resources structure which would need to be merged in with
> > the data retrieved from DT. It makes the stmmac_axi_setup() method and
> > the entire logic more complex and thus harder to comprehend.
> 
> I suppose that's subjective. Being able to let the driver provide
> defaults that can then be overridden by values from DT doesn't seem like
> a very exotic (or complicated) feature to me. We do that elsewhere all
> the time. Do the comments that I added in this version not sufficiently
> explain what's going on?

I have perfectly understood what was going on since v1. My concern is
the implementation. Here is the way the platform-specific setup
currently works.

There are two structures: stmmac_resources and plat_stmmacenet_data.
The former one contains the generic platform resources like CSRs
mapping, IRQs and MAC-address. The later one mainly has the DW
MAC-specific settings. Yes, plat_stmmacenet_data has been evolved to
an ugly monster with many redundant flags (fixing code and data here
and there in the driver) and with some generic platform resources
(which should have been added to the stmmac_resources structure in the
first place, like clocks and resets). But still it's purpose is
more-or-less defined. Both of these structures can be filled in with
data either directly by the glue drivers or by calling the
ready-to-use DW MAC platform data getters (stmmac_probe_config_dt()
and stmmac_get_platform_resources()). Most importantly is that
currently these structures have independent init semantics: no common
data, no fields used in both contexts. There are tons of problematic
places or questionable implementations in the driver, but at least
this one is more-or-less defined: coherency is minimal, logic is
linear.

You suggest to break that logic by introducing a new stmmac_resources
field which doesn't represent a generic resource data, but which
purpose is to tweak the AXI-settings in the plat_stmmacenet_data
structure. The pointer won't be even ever initialized in the
stmmac_get_platform_resources() method because it's done in the
stmmac_probe_config_dt() function. Based on all of that the change you
suggest look more like a fixup of the problem with your particular
device/platform.

Let's assume you patches are accepted. In sometime an another
developer comes with a need to pre-define say MTL Tx/Rx queue configs,
then another one with DMA configs, MDIO-bus settings, and so on. Thus
the stmmac_resources structure will eventually turn in a set of the
tweaks and the plat_stmmacenet_data pre-defines. That's how the
plat_stmmacenet_data structure has turned in what it is now. This
doesn't look like a right path to take again.

> 
> > The driver is already overwhelmed with flags and private/platform data
> > fixing the code here and there (see plat_stmmacenet_data, it's a
> > madness). So please justify in more details why do you need one more
> > complexity added instead of:
> > 1. overriding the AXI-configs retrieved from DT,
> 
> Again, overriding the AXI configs read from DT doesn't keep the current
> default behaviour of DT being the final authority. That's a policy that
> should remain intact. This patch (series) is about allowing the driver
> to override the AXI defaults with something that's sensible based on
> the compatible string. The current defaults, for example, cause the GBE
> on Tegra devices to run at around 100 Mbps even on a 1 Gbps link.
> 
> > 2. updating DT on your platform
> 

> That's one possibility and was in fact the first variant I used, but it
> has a few drawbacks. For example, it means that I need to create the AXI
> node just to make the device functional, but if possible it's better to
> derive all necessary information from the compatible string. Having this
> in a separate AXI configuration node is duplicating information that's
> already implied by the compatible string.
> 
> Also, on Tegra we have a few instances of this device that are all
> configured the same way. Since the AXI configuration node is supposed to
> be a child of the Ethernet controller node, we end up having to
> duplicate even more information.

None of that sounds like big problems. The default behavior doesn't
make your devices not-working. Yes, the performance is poor, but they
still work. Regarding the AXI-config DT-nodes it's not a problem at
all. A lot of the DW *MAC instances currently have the AXI-config
DT-subnodes. It's absolutely fine to have them setting up the same
configs.

Once again having the pre-defined configs is fine. All I am worried
about is the implementation you suggest especially in using the
stmmac_resources structure to tweak up the plat_stmmacenet_data data.
So the easiest solutions in your case are:
1. Initialize the plat_stmmacenet_data->axi pointer if no AXI
DT-subnode was detected by the stmmac_probe_config_dt() method, after
the method is called. This will provide almost the same semantics as
you suggest. The only difference is that it would work not on the
property level but on the node-level one. (Note the implementation
suggested by you doesn't provide the AXI-configs pre-definition for
the boolean properties. So it doesn't provide a complete AXI-config
default pre-definition.)
2. Add the proper AXI-config DT-subnodes to the respective device tree
sources.

If despite of all my reasoning you still insist on having a
pre-defined setting pattern, then we'll need to come up with some
better solution. On the top of my mind it might be for example a
pre-definition of the entire plat_stmmacenet_data structure instance
or using the software nodes.

-Serge(y)

> 
> Thierry


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
