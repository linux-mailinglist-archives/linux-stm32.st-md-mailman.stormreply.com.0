Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1303883B72A
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jan 2024 03:35:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2639C6B444;
	Thu, 25 Jan 2024 02:35:10 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 822D0C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 02:35:09 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-290a55f3feaso2922514a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 18:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706150108; x=1706754908;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ElI5s79820kPutuntGaxiQesjo2hgbJF7ifEMpPB0Eg=;
 b=NPzi3EFzpsTGIRzB1gPwnR7bKSkSRgmZRT+qYK1mKSaJZSBbp7q4kV8j4iFnjNHKHh
 VQ9l7ic3cZ3zfcpmHpdjyglNfsafUC0LtW4owYZSUEIJ98AxyTwBBg/gMkLyAEevgkLj
 s2CRq3sg+SmnDhqOATqSgylD8RPf8tdULe/m2G9s1bkthLNbMEGIw1hCxey/Otgq3ZdM
 hwd99k2jSa5+N6tXAp2wVI7CaW6bCdq+Fmr6xcczExzHZZh/dPFb532f2xABZ/FXkJ9f
 uGEYNj7kvOZj/7RORU/MBfoIPVmc5nwN1ynm6xMH1iSBewXpycYR7+C9ITuipEv6D/mL
 lxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706150108; x=1706754908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ElI5s79820kPutuntGaxiQesjo2hgbJF7ifEMpPB0Eg=;
 b=hkWV/k8XSvOgLrY6QEGGXA+8Jf/5jhsYw5iWnkPlp67+rfxV7tzNryGRQ/Osh9wLk3
 9ENd4AJ7NrlkgWDEqTmjlz2EsQYW2fOR0UPv/fB78+gaKL3qSFccVrZSHwsm9xedvAq5
 ChRu8YiJ1WDncVXBZdX8QylWO8X8FFDRCwAhJlDvO3zK8agAP12MgRZh6rJUp3QwkYEu
 Je8MqTCp/m6Q1FtNjP5ZJWhP5sHtZaAsnnxwgDNsSITLw6YJIZjJH26qj1Re5ALS9WKz
 J46TjM1rPymyU6Zv55zw9LyOosJHJj42/2EHBbNxIAMB7+cVRZCsoqGuUIbaBSVQCKCm
 dLXg==
X-Gm-Message-State: AOJu0Yz5hmkHFRLbliFUQmxaF/1up8i6v92Yg/EP9Ev8M++er+PsVnhc
 UuyI90Pm3PZ+qvQXx6WVmNsLpJRXeFWlKuIH1vsy9IttjAk0ApUQ
X-Google-Smtp-Source: AGHT+IH0qJiBgXBUOvhArhS7A5BZqdhwGL4PVANneN5oH8MrPA9qqy+6X4q55NX/xqbSsqPnc7Qb7A==
X-Received: by 2002:a17:90a:e543:b0:28d:dbe8:aa6c with SMTP id
 ei3-20020a17090ae54300b0028ddbe8aa6cmr255558pjb.36.1706150107884; 
 Wed, 24 Jan 2024 18:35:07 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 sx8-20020a17090b2cc800b0028ac1112124sm358775pjb.30.2024.01.24.18.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 18:35:07 -0800 (PST)
Date: Thu, 25 Jan 2024 10:34:54 +0800
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <20240125103454.0000312a@gmail.com>
In-Reply-To: <ii3muj3nmhuo6s5hm3g7wuiubtyzr632klrcesubtuaoyifogb@ohmunpxvdtsv>
References: <20240123085037.939471-1-0x1207@gmail.com>
 <ii3muj3nmhuo6s5hm3g7wuiubtyzr632klrcesubtuaoyifogb@ohmunpxvdtsv>
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

On Wed, 24 Jan 2024 17:25:27 +0300
Serge Semin <fancer.lancer@gmail.com> wrote:

> On Tue, Jan 23, 2024 at 04:50:37PM +0800, Furong Xu wrote:
> > Commit 56e58d6c8a56 ("net: stmmac: Implement Safety Features in
> > XGMAC core") prints safety error descriptions when safety error assert,
> > but missed some special errors, and mixed correctable errors and
> > uncorrectable errors together.
> > This patch complete the error code list and print the type of errors.  
> 
> The XGMAC ECC Safety code has likely been just copied from the DW GMAC
> v5 (DW QoS Eth) part. So this change is partly relevant to that code too. I
> can't confirm that the special errors support is relevant to the DW
> QoS Eth too (it likely is though), so what about splitting this patch
> up into two:
> 1. Elaborate the errors description for DW GMAC v5 and DW XGMAC.
> 2. Add new ECC safety errors support.
> ?
> 
> On the other hand if we were sure that both DW QoS Eth and XGMAC
> safety features implementation match the ideal solution would be to
> refactor out the common code into a dedicated module.
> 
> -Serge(y)
> 

Checked XGMAC Version 3.20a and DW QoS Eth Version 5.20a, the safety error
code definitions are not identical at all, they do have some differences,
about more than 20 bits of status register are different.
I think we should just leave them in individual implementations.

> > 
> > Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC core")
> > Signed-off-by: Furong Xu <0x1207@gmail.com>
> > ---
> >  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 36 +++++++++----------
> >  1 file changed, 18 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > index eb48211d9b0e..ad812484059e 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > @@ -748,29 +748,29 @@ static void dwxgmac3_handle_mac_err(struct net_device *ndev,
> >  }
> >  
> >  static const struct dwxgmac3_error_desc dwxgmac3_mtl_errors[32]= {
> > -	{ true, "TXCES", "MTL TX Memory Error" },
> > +	{ true, "TXCES", "MTL TX Memory Correctable Error" },
> >  	{ true, "TXAMS", "MTL TX Memory Address Mismatch Error" },
> > -	{ true, "TXUES", "MTL TX Memory Error" },
> > +	{ true, "TXUES", "MTL TX Memory Uncorrectable Error" },
> >  	{ false, "UNKNOWN", "Unknown Error" }, /* 3 */
> > -	{ true, "RXCES", "MTL RX Memory Error" },
> > +	{ true, "RXCES", "MTL RX Memory Correctable Error" },
> >  	{ true, "RXAMS", "MTL RX Memory Address Mismatch Error" },
> > -	{ true, "RXUES", "MTL RX Memory Error" },
> > +	{ true, "RXUES", "MTL RX Memory Uncorrectable Error" },
> >  	{ false, "UNKNOWN", "Unknown Error" }, /* 7 */
> > -	{ true, "ECES", "MTL EST Memory Error" },
> > +	{ true, "ECES", "MTL EST Memory Correctable Error" },
> >  	{ true, "EAMS", "MTL EST Memory Address Mismatch Error" },
> > -	{ true, "EUES", "MTL EST Memory Error" },
> > +	{ true, "EUES", "MTL EST Memory Uncorrectable Error" },
> >  	{ false, "UNKNOWN", "Unknown Error" }, /* 11 */
> > -	{ true, "RPCES", "MTL RX Parser Memory Error" },
> > +	{ true, "RPCES", "MTL RX Parser Memory Correctable Error" },
> >  	{ true, "RPAMS", "MTL RX Parser Memory Address Mismatch Error" },
> > -	{ true, "RPUES", "MTL RX Parser Memory Error" },
> > +	{ true, "RPUES", "MTL RX Parser Memory Uncorrectable Error" },
> >  	{ false, "UNKNOWN", "Unknown Error" }, /* 15 */
> > -	{ false, "UNKNOWN", "Unknown Error" }, /* 16 */
> > -	{ false, "UNKNOWN", "Unknown Error" }, /* 17 */
> > -	{ false, "UNKNOWN", "Unknown Error" }, /* 18 */
> > +	{ true, "SCES", "MTL SGF GCL Memory Correctable Error" },
> > +	{ true, "SAMS", "MTL SGF GCL Memory Address Mismatch Error" },
> > +	{ true, "SUES", "MTL SGF GCL Memory Uncorrectable Error" },
> >  	{ false, "UNKNOWN", "Unknown Error" }, /* 19 */
> > -	{ false, "UNKNOWN", "Unknown Error" }, /* 20 */
> > -	{ false, "UNKNOWN", "Unknown Error" }, /* 21 */
> > -	{ false, "UNKNOWN", "Unknown Error" }, /* 22 */
> > +	{ true, "RXFCES", "MTL RXF Memory Correctable Error" },
> > +	{ true, "RXFAMS", "MTL RXF Memory Address Mismatch Error" },
> > +	{ true, "RXFUES", "MTL RXF Memory Uncorrectable Error" },
> >  	{ false, "UNKNOWN", "Unknown Error" }, /* 23 */
> >  	{ false, "UNKNOWN", "Unknown Error" }, /* 24 */
> >  	{ false, "UNKNOWN", "Unknown Error" }, /* 25 */
> > @@ -796,13 +796,13 @@ static void dwxgmac3_handle_mtl_err(struct net_device *ndev,
> >  }
> >  
> >  static const struct dwxgmac3_error_desc dwxgmac3_dma_errors[32]= {
> > -	{ true, "TCES", "DMA TSO Memory Error" },
> > +	{ true, "TCES", "DMA TSO Memory Correctable Error" },
> >  	{ true, "TAMS", "DMA TSO Memory Address Mismatch Error" },
> > -	{ true, "TUES", "DMA TSO Memory Error" },
> > +	{ true, "TUES", "DMA TSO Memory Uncorrectable Error" },
> >  	{ false, "UNKNOWN", "Unknown Error" }, /* 3 */
> > -	{ true, "DCES", "DMA DCACHE Memory Error" },
> > +	{ true, "DCES", "DMA DCACHE Memory Correctable Error" },
> >  	{ true, "DAMS", "DMA DCACHE Address Mismatch Error" },
> > -	{ true, "DUES", "DMA DCACHE Memory Error" },
> > +	{ true, "DUES", "DMA DCACHE Memory Uncorrectable Error" },
> >  	{ false, "UNKNOWN", "Unknown Error" }, /* 7 */
> >  	{ false, "UNKNOWN", "Unknown Error" }, /* 8 */
> >  	{ false, "UNKNOWN", "Unknown Error" }, /* 9 */
> > -- 
> > 2.34.1
> > 
> >   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
