Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC5B83B76F
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jan 2024 03:56:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1342C6B444;
	Thu, 25 Jan 2024 02:56:34 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB40EC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 02:56:33 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-5bdbe2de25fso4776384a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 18:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706151392; x=1706756192;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CAtjtX8uRHdeTdOQ8Q4YA1xyY3aCTVDq4V147zUqCqw=;
 b=DKrWhQUtkGAs4x2xQaCNh7BIhYf4nr5g8R2T7Ef8BTdsDXQKaFjsgwwISDxgZ3IeD4
 j3N0EXqVq/J8ChJ/2MBtTnMnGlgm9yrd0KaGQrbs5SRkF3E2x8QB1WCfWj4WA9Vwi+i6
 ek5fssbhcbz8FnTfGx7zL+S/0iPYI66Zg86D79WL1rYGK6meLoEMMYY0HHqjMLbOtuBU
 ucJbwncSBh3BNSLLWI62CFzdbC9JIGsgWId2epa2hin22sf/u5XLHkme7/Suo1xsA4bY
 nd6c/BVNxv5olULbiRgVHlPz9IQgreMeis9zvB4t3LgSDu8HnOuTD94KgxkJySev86sR
 /n9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706151392; x=1706756192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CAtjtX8uRHdeTdOQ8Q4YA1xyY3aCTVDq4V147zUqCqw=;
 b=BBfqzgSeTWYA+70lPw1IbrwC3E5zKTNiYpF7P1ZsEstJweE2Z13qALSwojjudYlBVw
 K5W4UvJ2FdExzVbsUAd7ki4ItVQgY79HlbahVjeRvafyKjfChO6xRcLI/FsHCkTujsH+
 ib0bxvAvAh1370BrP7QWaN0t6dV+qOTn3z8A0BeSHDkrzdvUXW2+muUmEAe04OSbD+aV
 FSftmpQw12P8yhEuR1hPkT/3QgekSUbriW7wNU/6dgembI76UmmEiLqdJo4ksGBguLsT
 58Gj90GFFUKRrZaKv9NGd+XSNd1I6MSDv2Ct6NS37qdRlofPqfJWy2LRYmGSaaJwbr+H
 zpVA==
X-Gm-Message-State: AOJu0YwlX3afFNSIGWMSxVxnTJlY4tttaHYSK+t8wa4JgyBRiO8S0CxS
 yIUqMp0NRc7DCR8UaVAmBBGrzvNKPy2ULeqrMuI20OgXOZX2UWgY
X-Google-Smtp-Source: AGHT+IHmOZl3WFAS3aX7eXdFgA5GZQc6ihdPemj+TBpuUr5gXwegwYuc5rfG68dVm8ND54WylOQJPg==
X-Received: by 2002:a05:6a20:54a4:b0:19c:700b:a164 with SMTP id
 i36-20020a056a2054a400b0019c700ba164mr646602pzk.49.1706151392331; 
 Wed, 24 Jan 2024 18:56:32 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 m5-20020a62f205000000b006ddc5d8ecd7sm507224pfh.32.2024.01.24.18.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 18:56:32 -0800 (PST)
Date: Thu, 25 Jan 2024 10:56:20 +0800
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <20240125105620.000040b7@gmail.com>
In-Reply-To: <vsert76o6lxxc676tjiiikir577qobfonyo6sgo5eek6alzxlo@tb6hq5s2qcsp>
References: <20240123095006.979437-1-0x1207@gmail.com>
 <vsert76o6lxxc676tjiiikir577qobfonyo6sgo5eek6alzxlo@tb6hq5s2qcsp>
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

On Wed, 24 Jan 2024 17:36:10 +0300
Serge Semin <fancer.lancer@gmail.com> wrote:

> On Tue, Jan 23, 2024 at 05:50:06PM +0800, Furong Xu wrote:
> > Commit 56e58d6c8a56 ("net: stmmac: Implement Safety Features in
> > XGMAC core") checks and reports safety errors, but leaves the
> > Data Path Parity Errors for each channel in DMA unhandled at all, lead to
> > a storm of interrupt.
> > Fix it by checking and clearing the DMA_DPP_Interrupt_Status register.
> > 
> > Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC core")
> > Signed-off-by: Furong Xu <0x1207@gmail.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h      | 1 +
> >  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 6 ++++++
> >  2 files changed, 7 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > index 207ff1799f2c..188e11683136 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > @@ -385,6 +385,7 @@
> >  #define XGMAC_DCEIE			BIT(1)
> >  #define XGMAC_TCEIE			BIT(0)
> >  #define XGMAC_DMA_ECC_INT_STATUS	0x0000306c
> > +#define XGMAC_DMA_DPP_INT_STATUS	0x00003074
> >  #define XGMAC_DMA_CH_CONTROL(x)		(0x00003100 + (0x80 * (x)))
> >  #define XGMAC_SPH			BIT(24)
> >  #define XGMAC_PBLx8			BIT(16)
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > index eb48211d9b0e..874e85b499e2 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > @@ -745,6 +745,12 @@ static void dwxgmac3_handle_mac_err(struct net_device *ndev,
> >  
> >  	dwxgmac3_log_error(ndev, value, correctable, "MAC",
> >  			   dwxgmac3_mac_errors, STAT_OFF(mac_errors), stats);
> > +
> > +	value = readl(ioaddr + XGMAC_DMA_DPP_INT_STATUS);
> > +	writel(value, ioaddr + XGMAC_DMA_DPP_INT_STATUS);
> > +
> > +	if (value)
> > +		netdev_err(ndev, "Found DMA_DPP error, status: 0x%x\n", value);  
> 
> 1. Why not to implement this in the same way as the rest of the safety
> errors handle code? (with the flags described by the
> dwxgmac3_error_desc-based table and the respective counters being
> incremented should the errors were detected)
> 
XGMAC_DMA_DPP_INT_STATUS is just a bitmap of DMA RX and TX channels,
bottom 16 bits for 16 DMA TX channels and top 16 bits for 16 DMA RX channels.
No other descriptions.

And the counters should be updated, I will send a new patch.

> 2. I don't see this IRQ being enabled in the dwxgmac3_safety_feat_config()
> method. How come the respective event has turned to be triggered
> anyway?
This error report is enabled by default, and cannot be disabled or marked(as Synopsys Databook says).
What we can do is clearing it when it asserts.
> 
> -Serge(y) 
> 
> >  }
> >  
> >  static const struct dwxgmac3_error_desc dwxgmac3_mtl_errors[32]= {
> > -- 
> > 2.34.1
> > 
> >   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
