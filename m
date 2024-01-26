Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5763183D2F4
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 04:31:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03C55C65E4F;
	Fri, 26 Jan 2024 03:31:22 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66AE4C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 03:31:20 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-602c91a76b1so2924197b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 19:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706239879; x=1706844679;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cu5uJIW+PgmWmPkTx7ElNgWaV5SHadIfkDdLydfJ9xw=;
 b=RE7HTIaCKpU+TIwiTXdoR2Bpg/pZMhIj8AxheTwe1bSyw7uQ9kM1bky3gUtujd5zrI
 T3nL45uw4FkkDvTrokPshdZbJLQXOttoCsD1+i/i+CVY0TdxOQTp73ITuAXJvjTvbaNn
 1djOdQcR7kWluKQnlQYeWDKZTpQS2nfiEiB9+d0FCxnVdvOUwVkNF1OmQj/FCm+Phf8g
 4vgafUwHzMhFI8Ro4uIrQ8Fk1PdIuySwr4sMOPBWjA4rq7o6afyhBnQdP3xB9FXAlQHB
 WPilkTzl50pbHwII+Zv/yzfyzDvS8wo5aVowXtiRXjKGVur5e5PYWGc8SMTPLy8zdVAM
 Ur8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706239879; x=1706844679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cu5uJIW+PgmWmPkTx7ElNgWaV5SHadIfkDdLydfJ9xw=;
 b=PvtUa0DRRmYqtV+aqNCe7WVIOtntMckqmqHdCLBmtdIejnWupo4nemclb++JLiBNWW
 HS3bSzowF6765Qfsg3STtUqhU1BL8w3mlLMJ20wzEjgViKwmsa2tZLHI0jYHvKfXxQ2A
 v/jsYZHRAR+JRvK9jBCbcI2nEVHjAcfx/p8rYtpwJvdUwafbbIVQk9duP5swA7c7+ZQw
 16qG+seGB/rFLPXMZ4vHMEdy71Js0Ffqp71qNfnNbvqcYT3pf16tkYBg/BiE3X8SimRu
 zDrD6eFqELhaK99omMc/giwcawO6UygOiOsEgyOferHJeiAhv1ckskG3Jm0mWs0uCA1r
 bquQ==
X-Gm-Message-State: AOJu0YwoMCfQo6olyZSelFRo0EIAhYUv/pG2dWIp4VAZR/rZwJPOQIKf
 WB+E/HNYZ6dH0xtay44WW0RhmEWHThBL2o98jxyIpsUs8nDpjZ3o
X-Google-Smtp-Source: AGHT+IEcxOysEBQ87WgKxyfi1nNa59mDc0u82AOGzSYqQQM2UlemhexgEizS4szo4pFI7f9NW/PyVA==
X-Received: by 2002:a05:690c:fd1:b0:5f3:7df:563a with SMTP id
 dg17-20020a05690c0fd100b005f307df563amr1055527ywb.16.1706239879226; 
 Thu, 25 Jan 2024 19:31:19 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 l6-20020a170902eb0600b001d76ced199esm224183plb.31.2024.01.25.19.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 19:31:18 -0800 (PST)
Date: Fri, 26 Jan 2024 11:31:07 +0800
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <20240126113107.000064dc@gmail.com>
In-Reply-To: <czebrzszux2gdik3ey54tr3iewsxs4hjom432eb527jcpftnnr@ftiiwofakorj>
References: <20240123095006.979437-1-0x1207@gmail.com>
 <vsert76o6lxxc676tjiiikir577qobfonyo6sgo5eek6alzxlo@tb6hq5s2qcsp>
 <20240125105620.000040b7@gmail.com>
 <czebrzszux2gdik3ey54tr3iewsxs4hjom432eb527jcpftnnr@ftiiwofakorj>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: xgmac: fix handling of
 DPP safety error for DMA channels
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

On Thu, 25 Jan 2024 22:07:15 +0300
Serge Semin <fancer.lancer@gmail.com> wrote:

> On Thu, Jan 25, 2024 at 10:56:20AM +0800, Furong Xu wrote:
> > On Wed, 24 Jan 2024 17:36:10 +0300
> > Serge Semin <fancer.lancer@gmail.com> wrote:
> >   
> > > On Tue, Jan 23, 2024 at 05:50:06PM +0800, Furong Xu wrote:  
> > > > Commit 56e58d6c8a56 ("net: stmmac: Implement Safety Features in
> > > > XGMAC core") checks and reports safety errors, but leaves the
> > > > Data Path Parity Errors for each channel in DMA unhandled at all, lead to
> > > > a storm of interrupt.
> > > > Fix it by checking and clearing the DMA_DPP_Interrupt_Status register.
> > > > 
> > > > Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC core")
> > > > Signed-off-by: Furong Xu <0x1207@gmail.com>
> > > > ---
> > > >  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h      | 1 +
> > > >  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 6 ++++++
> > > >  2 files changed, 7 insertions(+)
> > > > 
> > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > > > index 207ff1799f2c..188e11683136 100644
> > > > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > > > @@ -385,6 +385,7 @@
> > > >  #define XGMAC_DCEIE			BIT(1)
> > > >  #define XGMAC_TCEIE			BIT(0)
> > > >  #define XGMAC_DMA_ECC_INT_STATUS	0x0000306c
> > > > +#define XGMAC_DMA_DPP_INT_STATUS	0x00003074
> > > >  #define XGMAC_DMA_CH_CONTROL(x)		(0x00003100 + (0x80 * (x)))
> > > >  #define XGMAC_SPH			BIT(24)
> > > >  #define XGMAC_PBLx8			BIT(16)
> > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > > > index eb48211d9b0e..874e85b499e2 100644
> > > > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > > > @@ -745,6 +745,12 @@ static void dwxgmac3_handle_mac_err(struct net_device *ndev,
> > > >  
> > > >  	dwxgmac3_log_error(ndev, value, correctable, "MAC",
> > > >  			   dwxgmac3_mac_errors, STAT_OFF(mac_errors), stats);
> > > > +
> > > > +	value = readl(ioaddr + XGMAC_DMA_DPP_INT_STATUS);
> > > > +	writel(value, ioaddr + XGMAC_DMA_DPP_INT_STATUS);
> > > > +
> > > > +	if (value)
> > > > +		netdev_err(ndev, "Found DMA_DPP error, status: 0x%x\n", value);    
> > > 
> > > 1. Why not to implement this in the same way as the rest of the safety
> > > errors handle code? (with the flags described by the
> > > dwxgmac3_error_desc-based table and the respective counters being
> > > incremented should the errors were detected)
> > >   
> 
> > XGMAC_DMA_DPP_INT_STATUS is just a bitmap of DMA RX and TX channels,
> > bottom 16 bits for 16 DMA TX channels and top 16 bits for 16 DMA RX channels.
> > No other descriptions.
> > 
> > And the counters should be updated, I will send a new patch.  
> 
> Ok. I'll wait for this patch v2 then with the counters fixed. Please
> also note that you are adding the _DMA_ DPP events handling support.
> Thus the more suitable place for this change would be
> dwmac5_handle_dma_err().
> 
> >   
> > > 2. I don't see this IRQ being enabled in the dwxgmac3_safety_feat_config()
> > > method. How come the respective event has turned to be triggered
> > > anyway?  
> > This error report is enabled by default, and cannot be disabled or marked(as Synopsys Databook says).
> > What we can do is clearing it when it asserts.  
> 
> This sounds so strange that I can barely believe in it. The DW QoS Eth
> MTL DPP feature can be enabled/disabled, but the DW XGMAC DMA DPP
> can't? This doesn't look logical. What's the point in having a never
> maskable IRQ for not that much crucial but optional feature? Moreover
> DPP adds some data flow overhead. If we are sure that no problem with
> the device data paths, then it seems redundant to have it always
> enabled. So I guess it must be switchable. Are you completely sure it
> isn't?

Sorry for my bad explanation.

Double checked DMA_DPP error report path on my device.

XGMAC DMA_DPP is enable by DDPP bit of MTL_DPP_Control.
DDPP bit is default to 0(Data path Parity Protection is enabled).
When DDPP bit is set to 1(Data path Parity Protection is disabled), no DMA_DPP interrupt is reported.

Once DMA_DPP interrupt is reported, there is no control bit to disable it or mask it.
DMA_DPP error is unrecoverable type, and unrecoverable error interrupt cannot be disabled or masked,
this is a design(as Synopsys Databook says).

A explicit ops on MTL_DPP_Control to clear DDPP bit can add to dwxgmac3_safety_feat_config
to make code looks better.

> 
> -Serge(y)
> 
> > > 
> > > -Serge(y) 
> > >   
> > > >  }
> > > >  
> > > >  static const struct dwxgmac3_error_desc dwxgmac3_mtl_errors[32]= {
> > > > -- 
> > > > 2.34.1
> > > > 
> > > >     
> >   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
