Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2478683D25B
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 03:09:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1F97C6B444;
	Fri, 26 Jan 2024 02:09:01 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B64DC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 02:09:00 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-6da6b0eb2d4so232277b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 18:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706234939; x=1706839739;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Br6VJLagRb3AfSDX41gJAp6j1fOegiaHY5+r3X1kYKU=;
 b=Eh3bUl4UMH294pEirefxttyp+oKX3/LtaQ3yzx5Qu3urTl9vNtHn+0hjK9cDkyTQG/
 4CtHBjZ2iJDR5ptMYUZ6Z3Tl5d5ecCdddJArWB+C004YH01vUTSdjWPZnFmmtRWkD+Th
 E3HxMCE57eYcvuxthCDJZFaVOX93101Qe1sEGP9Myyki+bYP3cgG71EG52Wl30lmEQ73
 VVBnmuadRBbSBy7I5EU0qKQ2NLMi5MR7YQAmXUN4hPvaE1MD7el/ZCM7jjeoXoqXdv6m
 4/3zCBaHPbNf569EeqNTgoP0J05OQCvHdALYzm6YkWlM06ru/a0Xv8x+eOTjAoik5YvO
 zpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706234939; x=1706839739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Br6VJLagRb3AfSDX41gJAp6j1fOegiaHY5+r3X1kYKU=;
 b=sS9GthNJfEINHK5etE8xwecW1uwsR9hCET76i+zMzTT51w263XQYGdBl2mWbdP3nkB
 nvj+lnFhVTuW1rhX4ArpcvV4bHcHFj2a3DI9ddn7Vv9YexK5PZPejO8WB/stJOeCJqhb
 4dBMOb1pTVcDaHEZzOdekWlmz4/UR5JD6UzkbiGfs0geLgPzF7GcJUTKXP8cJuQ2PSRK
 Wl7mHftAXhD7ODieEBmA1sajDTBT+UVQ4ojvXyewCt1FLDOq/Ij9Frb2JQoWlH/39pNK
 FCzi7qZMOwjD88E1tySGlefvDIS6sRXNGULxYLyS2bvZ9ySnq89DYDr4K4ljTlUIYBhU
 1s6g==
X-Gm-Message-State: AOJu0Yyho+T6qEs7aI9zTSq3pkZxu7l5JeX0O8aEds9YZCF82WT8go9O
 lW0WEyl6rbi8rbWOiuwc6XNBSPUW8y7nHvefQEJ71x1jBmrbMvvt
X-Google-Smtp-Source: AGHT+IFpXDfDdLfol3GnedT7BVcJU3Lg5lPS/W1n8oFL0fn5cIeJRsE+SQKAsKBssVzbjlUXZm9qHA==
X-Received: by 2002:a05:6a20:6a03:b0:19a:404b:86c3 with SMTP id
 p3-20020a056a206a0300b0019a404b86c3mr631310pzk.70.1706234938867; 
 Thu, 25 Jan 2024 18:08:58 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 m13-20020a17090ade0d00b0028ddfb484bfsm2251209pjv.49.2024.01.25.18.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 18:08:58 -0800 (PST)
Date: Fri, 26 Jan 2024 10:08:47 +0800
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <20240126100847.0000370e@gmail.com>
In-Reply-To: <4coefc2fqtc2eoereds3rf7vudci5l7ahme2wydocjepk2wrwy@ncgwl3j3koyu>
References: <20240123085037.939471-1-0x1207@gmail.com>
 <ii3muj3nmhuo6s5hm3g7wuiubtyzr632klrcesubtuaoyifogb@ohmunpxvdtsv>
 <20240125103454.0000312a@gmail.com>
 <4coefc2fqtc2eoereds3rf7vudci5l7ahme2wydocjepk2wrwy@ncgwl3j3koyu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-w64-mingw32)
MIME-Version: 1.0
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

On Thu, 25 Jan 2024 16:48:23 +0300
Serge Semin <fancer.lancer@gmail.com> wrote:

> On Thu, Jan 25, 2024 at 10:34:54AM +0800, Furong Xu wrote:
> > On Wed, 24 Jan 2024 17:25:27 +0300
> > Serge Semin <fancer.lancer@gmail.com> wrote:
> >   
> > > On Tue, Jan 23, 2024 at 04:50:37PM +0800, Furong Xu wrote:  
> > > > Commit 56e58d6c8a56 ("net: stmmac: Implement Safety Features in
> > > > XGMAC core") prints safety error descriptions when safety error assert,
> > > > but missed some special errors, and mixed correctable errors and
> > > > uncorrectable errors together.
> > > > This patch complete the error code list and print the type of errors.    
> > > 
> > > The XGMAC ECC Safety code has likely been just copied from the DW GMAC
> > > v5 (DW QoS Eth) part. So this change is partly relevant to that code too. I
> > > can't confirm that the special errors support is relevant to the DW
> > > QoS Eth too (it likely is though), so what about splitting this patch
> > > up into two:
> > > 1. Elaborate the errors description for DW GMAC v5 and DW XGMAC.
> > > 2. Add new ECC safety errors support.
> > > ?
> > > 
> > > On the other hand if we were sure that both DW QoS Eth and XGMAC
> > > safety features implementation match the ideal solution would be to
> > > refactor out the common code into a dedicated module.
> > > 
> > > -Serge(y)
> > >   
> >   
> 
> > Checked XGMAC Version 3.20a and DW QoS Eth Version 5.20a, the safety error
> > code definitions are not identical at all, they do have some differences,
> > about more than 20 bits of status register are different.
> > I think we should just leave them in individual implementations.  
> 
> For some reason you answered to the last part of my comment and
> completely ignored the first part which was the main point of my
> message.
> 
> Regarding the Safety Feature support implemented in QoS Eth and XGMAC
> STMMAC modules. You were wrong in using the statement "at all". Except
> the optional events enable/disable procedure introduced in the commit
> 5ac712dcdfef ("net: stmmac: enable platform specific safety
> features"), there aren't many differences: at least the errors
> handling and report are identical, MTL and DMA error flags match, even
> MTL and DMA ECC/Safety IRQ flags match. The only difference is in the
> MTL/MAC DPP (Data Parity Protection) part which can be easily factored
> out based on the device ID should we attempt to refactor the safety
> feature code. See the attached html-diff for more details of what
> match and what is different.
> 
> Anyway I am not insisting on the refactoring. That was just a
> proposal, a more preferred alternative to simultaneously patching two
> parts of the drivers looking very much alike. Such refactoring would
> improve the code maintainability. The main point of my comment was to
> extend your patch for DW QoS Eth safety feature implementation too
> since some of the changes you introduced were useful for it too, and
> in splitting the patch up since your patch added new flags support
> which was unrelated change.  Thus your patch would turned into the
> two-patches patchset like this:
> [Patch 1] would provide an elaborated errors description for both DW
> QOS Eth (GMAC v5.x) and DW XGMAC.
> [Patch 2] would introduce the new ECC safety errors support.
> 
> See my further comments about the respective changes.
> 
> >   
> > > > 
> > > > Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC core")
> > > > Signed-off-by: Furong Xu <0x1207@gmail.com>
> > > > ---
> > > >  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 36 +++++++++----------
> > > >  1 file changed, 18 insertions(+), 18 deletions(-)
> > > > 
> > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > > > index eb48211d9b0e..ad812484059e 100644
> > > > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > > > @@ -748,29 +748,29 @@ static void dwxgmac3_handle_mac_err(struct net_device *ndev,
> > > >  }
> > > >  
> > > >  static const struct dwxgmac3_error_desc dwxgmac3_mtl_errors[32]= {  
> 
> > > > -	{ true, "TXCES", "MTL TX Memory Error" },
> > > > +	{ true, "TXCES", "MTL TX Memory Correctable Error" },  
> 
> Applicable for both IP-cores
> [Patch 1] +QoS, +XGMAC
> please apply this change to dwmac5.c too.
> 
> > > >  	{ true, "TXAMS", "MTL TX Memory Address Mismatch Error" },  
> 
> > > > -	{ true, "TXUES", "MTL TX Memory Error" },
> > > > +	{ true, "TXUES", "MTL TX Memory Uncorrectable Error" },  
> 
> [Patch 1] +QoS, +XGMAC
> ditto
> 
> > > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 3 */  
> 
> > > > -	{ true, "RXCES", "MTL RX Memory Error" },
> > > > +	{ true, "RXCES", "MTL RX Memory Correctable Error" },  
> 
> [Patch 1] +QoS, +XGMAC
> ditto
> 
> > > >  	{ true, "RXAMS", "MTL RX Memory Address Mismatch Error" },  
> 
> > > > -	{ true, "RXUES", "MTL RX Memory Error" },
> > > > +	{ true, "RXUES", "MTL RX Memory Uncorrectable Error" },  
> 
> [Patch 1] +QoS, +XGMAC
> ditto
> 
> > > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 7 */  
> 
> > > > -	{ true, "ECES", "MTL EST Memory Error" },
> > > > +	{ true, "ECES", "MTL EST Memory Correctable Error" },  
> 
> [Patch 1] +QoS, +XGMAC
> ditto
> 
> > > >  	{ true, "EAMS", "MTL EST Memory Address Mismatch Error" },  
> 
> > > > -	{ true, "EUES", "MTL EST Memory Error" },
> > > > +	{ true, "EUES", "MTL EST Memory Uncorrectable Error" },  
> 
> [Patch 1] +QoS, +XGMAC
> ditto
> 
> > > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 11 */  
> 
> > > > -	{ true, "RPCES", "MTL RX Parser Memory Error" },
> > > > +	{ true, "RPCES", "MTL RX Parser Memory Correctable Error" },  
> 
> [Patch 1] +QoS, +XGMAC
> ditto
> 
> > > >  	{ true, "RPAMS", "MTL RX Parser Memory Address Mismatch Error" },  
> 
> > > > -	{ true, "RPUES", "MTL RX Parser Memory Error" },
> > > > +	{ true, "RPUES", "MTL RX Parser Memory Uncorrectable Error" },  
> 
> [Patch 1] +QoS, +XGMAC
> ditto
> 
> > > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 15 */  
> 
> > > > -	{ false, "UNKNOWN", "Unknown Error" }, /* 16 */
> > > > -	{ false, "UNKNOWN", "Unknown Error" }, /* 17 */
> > > > -	{ false, "UNKNOWN", "Unknown Error" }, /* 18 */
> > > > +	{ true, "SCES", "MTL SGF GCL Memory Correctable Error" },
> > > > +	{ true, "SAMS", "MTL SGF GCL Memory Address Mismatch Error" },
> > > > +	{ true, "SUES", "MTL SGF GCL Memory Uncorrectable Error" },
> > > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 19 */
> > > > -	{ false, "UNKNOWN", "Unknown Error" }, /* 20 */
> > > > -	{ false, "UNKNOWN", "Unknown Error" }, /* 21 */
> > > > -	{ false, "UNKNOWN", "Unknown Error" }, /* 22 */
> > > > +	{ true, "RXFCES", "MTL RXF Memory Correctable Error" },
> > > > +	{ true, "RXFAMS", "MTL RXF Memory Address Mismatch Error" },
> > > > +	{ true, "RXFUES", "MTL RXF Memory Uncorrectable Error" },  
> 
> This introduces the new flags support. Please move this change into a
> separate patch (Patch 2):
> [Patch 2] +XGMAC only.
> 
> My DW QoS Eth v5.10a databook doesn't have these flags defined. If
> your 5.20a HW-manual have them described then please add them for DW
> QoS Eth too.
> 
> > > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 23 */
> > > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 24 */
> > > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 25 */
> > > > @@ -796,13 +796,13 @@ static void dwxgmac3_handle_mtl_err(struct net_device *ndev,
> > > >  }
> > > >  
> > > >  static const struct dwxgmac3_error_desc dwxgmac3_dma_errors[32]= {  
> 
> > > > -	{ true, "TCES", "DMA TSO Memory Error" },
> > > > +	{ true, "TCES", "DMA TSO Memory Correctable Error" },  
> 
> Applicable for both IP-cores
> [Patch 1] +QoS, +XGMAC
> please apply this change to dwmac5.c too.
> 
> > > >  	{ true, "TAMS", "DMA TSO Memory Address Mismatch Error" },  
> 
> > > > -	{ true, "TUES", "DMA TSO Memory Error" },
> > > > +	{ true, "TUES", "DMA TSO Memory Uncorrectable Error" },  
> 
> [Patch 1] +QoS, +XGMAC
> ditto
> 
> > > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 3 */  
> 
> > > > -	{ true, "DCES", "DMA DCACHE Memory Error" },
> > > > +	{ true, "DCES", "DMA DCACHE Memory Correctable Error" },
> > > >  	{ true, "DAMS", "DMA DCACHE Address Mismatch Error" },
> > > > -	{ true, "DUES", "DMA DCACHE Memory Error" },
> > > > +	{ true, "DUES", "DMA DCACHE Memory Uncorrectable Error" },  
> 
> AFAICS applicable for XGMAC only
> [Patch 1] +XGMAC only.
> Once again, My DW QoS Eth v5.10a databook doesn't have these flags
> defined. So if your DW QoS Eth 5.20a HW-manual do have them described
> please add them for DW QoS Eth with the elaborated description in the
> framework of the Patch 2.
> 
> -Serge(y)
> 
> > > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 7 */
> > > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 8 */
> > > >  	{ false, "UNKNOWN", "Unknown Error" }, /* 9 */
> > > > -- 
> > > > 2.34.1
> > > > 
> > > >     
> >   

Hi Serge:
Thanks for your detailed explanation, new refactoring will be sent to net-next.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
