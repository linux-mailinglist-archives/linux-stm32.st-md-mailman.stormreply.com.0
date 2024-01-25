Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D48D583C40D
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jan 2024 14:48:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 616C3C6B444;
	Thu, 25 Jan 2024 13:48:30 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B410BC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 13:48:28 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2cdfa8e69b5so73567371fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 05:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706190508; x=1706795308;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/C2tExOyKm07kGJJDKhOXfKEbEgJDFItKOdJX+74LMA=;
 b=REpi8YVCtm/UjsSWXjowVWZrXqK/21WT4vrqvrN9KsZsFf3dqu9Sp0z5bWcmXqQUsE
 yJp2FvZKjEwLLfmWPNg/WLXDIaQKm3fSMeiXmLOpJqfOOLV/lh8uHa+2vVCqUAZLzaFK
 jvkh3ctIflBts+uGOph8mCL5uSt/S8n/WGpy3N+JgB/5iLFlRZmlvuI4SRFYz0v/kWCs
 7iPqYOsG/oeX//XMJ9Z5gEDwCJTIszrABJzXeFKbC9eyo2+KG32GRlxndTnJ4l5pFKtg
 7moy/au1QN29OqwOmZDt7kAX/1KtRowfGUhrNewE1ClQEU7D846ncMLE1vfaLr+hVvww
 owxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706190508; x=1706795308;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/C2tExOyKm07kGJJDKhOXfKEbEgJDFItKOdJX+74LMA=;
 b=cy9QZMOxncH7CAhRyLGkP1eojTIF3QTOUhcyT4CVrbju9P/Td6OMU1gGE509KTKRvX
 WMDgRM1ZpMzoXIQvY/hdJ8VHLMXPuZT4nNRJwxwZTrR4Aq7It9sSwbZH9tC9b/NBYwtT
 GMsimrXKCcIoxnUJ+JWfw9g3X+/blY6tC10UQTZsXtR2ixm2pdaQi70RmuIRFeDHT+1b
 0VqlIGTdx+RNNmgoWTslP1hQYjh+0DDiQyQ1tbocM15Nmk2POvljsS+jhY87LmdYR1lC
 9eYmEx3FKb3ZF8NjbcYTA3jezwERWELftZGSEifEdztkGY2h1DqT38GsVS7BU/twMS/B
 9Q5A==
X-Gm-Message-State: AOJu0YzsKJTnFHYyQZdS2hX3S3fci9mFHY3xbTkYDK8DP36y1hqpRIFy
 5MPKkHZSDY+CBWNBreFizT7MAkdPPQtTeMNO1GxTSCdDSnld1KX1
X-Google-Smtp-Source: AGHT+IHiKoinOLqsPFox/XY+nniYFc50yjL1JfNhRaridaHruwwCIAJaoSJCYedVpj7jYE5TdKINVg==
X-Received: by 2002:a19:5f58:0:b0:510:ec4:4ee4 with SMTP id
 a24-20020a195f58000000b005100ec44ee4mr314091lfj.152.1706190507526; 
 Thu, 25 Jan 2024 05:48:27 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 b5-20020ac247e5000000b005100cfedda5sm571015lfp.61.2024.01.25.05.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 05:48:27 -0800 (PST)
Date: Thu, 25 Jan 2024 16:48:23 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <4coefc2fqtc2eoereds3rf7vudci5l7ahme2wydocjepk2wrwy@ncgwl3j3koyu>
References: <20240123085037.939471-1-0x1207@gmail.com>
 <ii3muj3nmhuo6s5hm3g7wuiubtyzr632klrcesubtuaoyifogb@ohmunpxvdtsv>
 <20240125103454.0000312a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240125103454.0000312a@gmail.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: xgmac: fix safety error
	descriptions
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

On Thu, Jan 25, 2024 at 10:34:54AM +0800, Furong Xu wrote:
> On Wed, 24 Jan 2024 17:25:27 +0300
> Serge Semin <fancer.lancer@gmail.com> wrote:
> 
> > On Tue, Jan 23, 2024 at 04:50:37PM +0800, Furong Xu wrote:
> > > Commit 56e58d6c8a56 ("net: stmmac: Implement Safety Features in
> > > XGMAC core") prints safety error descriptions when safety error assert,
> > > but missed some special errors, and mixed correctable errors and
> > > uncorrectable errors together.
> > > This patch complete the error code list and print the type of errors.  
> > 
> > The XGMAC ECC Safety code has likely been just copied from the DW GMAC
> > v5 (DW QoS Eth) part. So this change is partly relevant to that code too. I
> > can't confirm that the special errors support is relevant to the DW
> > QoS Eth too (it likely is though), so what about splitting this patch
> > up into two:
> > 1. Elaborate the errors description for DW GMAC v5 and DW XGMAC.
> > 2. Add new ECC safety errors support.
> > ?
> > 
> > On the other hand if we were sure that both DW QoS Eth and XGMAC
> > safety features implementation match the ideal solution would be to
> > refactor out the common code into a dedicated module.
> > 
> > -Serge(y)
> > 
> 

> Checked XGMAC Version 3.20a and DW QoS Eth Version 5.20a, the safety error
> code definitions are not identical at all, they do have some differences,
> about more than 20 bits of status register are different.
> I think we should just leave them in individual implementations.

For some reason you answered to the last part of my comment and
completely ignored the first part which was the main point of my
message.

Regarding the Safety Feature support implemented in QoS Eth and XGMAC
STMMAC modules. You were wrong in using the statement "at all". Except
the optional events enable/disable procedure introduced in the commit
5ac712dcdfef ("net: stmmac: enable platform specific safety
features"), there aren't many differences: at least the errors
handling and report are identical, MTL and DMA error flags match, even
MTL and DMA ECC/Safety IRQ flags match. The only difference is in the
MTL/MAC DPP (Data Parity Protection) part which can be easily factored
out based on the device ID should we attempt to refactor the safety
feature code. See the attached html-diff for more details of what
match and what is different.

Anyway I am not insisting on the refactoring. That was just a
proposal, a more preferred alternative to simultaneously patching two
parts of the drivers looking very much alike. Such refactoring would
improve the code maintainability. The main point of my comment was to
extend your patch for DW QoS Eth safety feature implementation too
since some of the changes you introduced were useful for it too, and
in splitting the patch up since your patch added new flags support
which was unrelated change.  Thus your patch would turned into the
two-patches patchset like this:
[Patch 1] would provide an elaborated errors description for both DW
QOS Eth (GMAC v5.x) and DW XGMAC.
[Patch 2] would introduce the new ECC safety errors support.

See my further comments about the respective changes.

> 
> > > 
> > > Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC core")
> > > Signed-off-by: Furong Xu <0x1207@gmail.com>
> > > ---
> > >  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 36 +++++++++----------
> > >  1 file changed, 18 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > > index eb48211d9b0e..ad812484059e 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > > @@ -748,29 +748,29 @@ static void dwxgmac3_handle_mac_err(struct net_device *ndev,
> > >  }
> > >  
> > >  static const struct dwxgmac3_error_desc dwxgmac3_mtl_errors[32]= {

> > > -	{ true, "TXCES", "MTL TX Memory Error" },
> > > +	{ true, "TXCES", "MTL TX Memory Correctable Error" },

Applicable for both IP-cores
[Patch 1] +QoS, +XGMAC
please apply this change to dwmac5.c too.

> > >  	{ true, "TXAMS", "MTL TX Memory Address Mismatch Error" },

> > > -	{ true, "TXUES", "MTL TX Memory Error" },
> > > +	{ true, "TXUES", "MTL TX Memory Uncorrectable Error" },

[Patch 1] +QoS, +XGMAC
ditto

> > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 3 */

> > > -	{ true, "RXCES", "MTL RX Memory Error" },
> > > +	{ true, "RXCES", "MTL RX Memory Correctable Error" },

[Patch 1] +QoS, +XGMAC
ditto

> > >  	{ true, "RXAMS", "MTL RX Memory Address Mismatch Error" },

> > > -	{ true, "RXUES", "MTL RX Memory Error" },
> > > +	{ true, "RXUES", "MTL RX Memory Uncorrectable Error" },

[Patch 1] +QoS, +XGMAC
ditto

> > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 7 */

> > > -	{ true, "ECES", "MTL EST Memory Error" },
> > > +	{ true, "ECES", "MTL EST Memory Correctable Error" },

[Patch 1] +QoS, +XGMAC
ditto

> > >  	{ true, "EAMS", "MTL EST Memory Address Mismatch Error" },

> > > -	{ true, "EUES", "MTL EST Memory Error" },
> > > +	{ true, "EUES", "MTL EST Memory Uncorrectable Error" },

[Patch 1] +QoS, +XGMAC
ditto

> > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 11 */

> > > -	{ true, "RPCES", "MTL RX Parser Memory Error" },
> > > +	{ true, "RPCES", "MTL RX Parser Memory Correctable Error" },

[Patch 1] +QoS, +XGMAC
ditto

> > >  	{ true, "RPAMS", "MTL RX Parser Memory Address Mismatch Error" },

> > > -	{ true, "RPUES", "MTL RX Parser Memory Error" },
> > > +	{ true, "RPUES", "MTL RX Parser Memory Uncorrectable Error" },

[Patch 1] +QoS, +XGMAC
ditto

> > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 15 */

> > > -	{ false, "UNKNOWN", "Unknown Error" }, /* 16 */
> > > -	{ false, "UNKNOWN", "Unknown Error" }, /* 17 */
> > > -	{ false, "UNKNOWN", "Unknown Error" }, /* 18 */
> > > +	{ true, "SCES", "MTL SGF GCL Memory Correctable Error" },
> > > +	{ true, "SAMS", "MTL SGF GCL Memory Address Mismatch Error" },
> > > +	{ true, "SUES", "MTL SGF GCL Memory Uncorrectable Error" },
> > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 19 */
> > > -	{ false, "UNKNOWN", "Unknown Error" }, /* 20 */
> > > -	{ false, "UNKNOWN", "Unknown Error" }, /* 21 */
> > > -	{ false, "UNKNOWN", "Unknown Error" }, /* 22 */
> > > +	{ true, "RXFCES", "MTL RXF Memory Correctable Error" },
> > > +	{ true, "RXFAMS", "MTL RXF Memory Address Mismatch Error" },
> > > +	{ true, "RXFUES", "MTL RXF Memory Uncorrectable Error" },

This introduces the new flags support. Please move this change into a
separate patch (Patch 2):
[Patch 2] +XGMAC only.

My DW QoS Eth v5.10a databook doesn't have these flags defined. If
your 5.20a HW-manual have them described then please add them for DW
QoS Eth too.

> > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 23 */
> > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 24 */
> > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 25 */
> > > @@ -796,13 +796,13 @@ static void dwxgmac3_handle_mtl_err(struct net_device *ndev,
> > >  }
> > >  
> > >  static const struct dwxgmac3_error_desc dwxgmac3_dma_errors[32]= {

> > > -	{ true, "TCES", "DMA TSO Memory Error" },
> > > +	{ true, "TCES", "DMA TSO Memory Correctable Error" },

Applicable for both IP-cores
[Patch 1] +QoS, +XGMAC
please apply this change to dwmac5.c too.

> > >  	{ true, "TAMS", "DMA TSO Memory Address Mismatch Error" },

> > > -	{ true, "TUES", "DMA TSO Memory Error" },
> > > +	{ true, "TUES", "DMA TSO Memory Uncorrectable Error" },

[Patch 1] +QoS, +XGMAC
ditto

> > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 3 */

> > > -	{ true, "DCES", "DMA DCACHE Memory Error" },
> > > +	{ true, "DCES", "DMA DCACHE Memory Correctable Error" },
> > >  	{ true, "DAMS", "DMA DCACHE Address Mismatch Error" },
> > > -	{ true, "DUES", "DMA DCACHE Memory Error" },
> > > +	{ true, "DUES", "DMA DCACHE Memory Uncorrectable Error" },

AFAICS applicable for XGMAC only
[Patch 1] +XGMAC only.
Once again, My DW QoS Eth v5.10a databook doesn't have these flags
defined. So if your DW QoS Eth 5.20a HW-manual do have them described
please add them for DW QoS Eth with the elaborated description in the
framework of the Patch 2.

-Serge(y)

> > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 7 */
> > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 8 */
> > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 9 */
> > > -- 
> > > 2.34.1
> > > 
> > >   
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
