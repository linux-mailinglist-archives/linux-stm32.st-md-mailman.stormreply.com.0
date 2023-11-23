Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1457B7F5C37
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 11:24:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C640FC6B476;
	Thu, 23 Nov 2023 10:24:17 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BB8BC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 10:24:17 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-da37522a363so720105276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 02:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700735056; x=1701339856;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MQufmsQMrPSkS7WJd7xjAFVYdq3ncbNsEnifCOHUlJ4=;
 b=ejbdUjNqSi9DYom3IdDgFmPzEGaIglUIQd1PLbbcuJ7KZ7+vG3utLppudx6NVJexv8
 3aY0cjlVos6IOaSAaG9rY56zLawy7000Uo024ze5DqvRO7YwuTmenK+eYc4v2I796Ikp
 uMCiJ/mATpaoTyWR8Ga11upkrl+VMEHA10X2zxFyU/pUV/sPfZJdQw8krnRrG88WZmuY
 CyrqICnRZ995itu0SIMOFe25pGOgULKFc2Q9X97ydtIggBpn0IDP6DSZUCivnPmFHp1O
 bntP79JmP2XGnz6O/hMdNNdOIpui/8v4JFQQWHALybI3XzcJaw8s8LNQiODelI+arwaL
 or1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700735056; x=1701339856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MQufmsQMrPSkS7WJd7xjAFVYdq3ncbNsEnifCOHUlJ4=;
 b=rOlKIvTLl0SK3CuiUDo/rb91IpW2sMpzpeHob64g6d8kralNkuq/p50Vo5oVqgGMkl
 rHYvvKdUzecFRrl2gJ8HRqm2pQ4IfwEPdSkJGgrl1ASeYO0OtrVmCj6IqizTbobzoSr7
 J8yTFJ6UoAEdtT4w7mNnqckTnOF7atHClr19zTTAK1E14cPw7HgRmkzvq82CleyCg2lI
 npzguHmuwJ6VvehqTD2bFv07iZhxad9AZMMBd6Vcri6HRzBei5awYeHtdR9aspV7Ks6p
 cq2WXb81ElSRNJH88f+U0moRyb+9SddQRCc7D9gglrwIF5QP8+I6TElU7Rluw/QUjJ5t
 T/CQ==
X-Gm-Message-State: AOJu0YwrbAg0jjgTuYxZ9j8czXbpXkO3aBE1w6wDsty/obBDiBmKvWQz
 Sd99ERCGmsYs3B97eaBiJu4=
X-Google-Smtp-Source: AGHT+IENgIG/WZEXSmFCwcoG/xkUbrQpBfoOkPI+26QxfSOl6uNAZx8VFJ+tevbjUvS1yTo6nh0i8g==
X-Received: by 2002:a25:b309:0:b0:d91:c3fe:6144 with SMTP id
 l9-20020a25b309000000b00d91c3fe6144mr4983504ybj.3.1700735056068; 
 Thu, 23 Nov 2023 02:24:16 -0800 (PST)
Received: from localhost ([74.48.130.204]) by smtp.gmail.com with ESMTPSA id
 z6-20020a256646000000b00da0c63aa9f1sm237492ybm.20.2023.11.23.02.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 02:24:15 -0800 (PST)
Date: Thu, 23 Nov 2023 18:24:05 +0800
From: Furong Xu <0x1207@gmail.com>
To: Wojciech Drewek <wojciech.drewek@intel.com>
Message-ID: <20231123182405.00006454@gmail.com>
In-Reply-To: <2c2d0641-002c-4ce6-9df4-bc633e602721@intel.com>
References: <20231123093538.2216633-1-0x1207@gmail.com>
 <2c2d0641-002c-4ce6-9df4-bc633e602721@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: xgmac: Disable FPE
	MMC interrupts
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

On Thu, 23 Nov 2023 11:17:17 +0100
Wojciech Drewek <wojciech.drewek@intel.com> wrote:

> On 23.11.2023 10:35, Furong Xu wrote:
> > Commit aeb18dd07692 ("net: stmmac: xgmac: Disable MMC interrupts
> > by default") leaves the FPE(Frame Preemption) MMC interrupts enabled.
> > Now we disable FPE TX and RX interrupts too.  
> 
> Hi,
> Thanks for the patch, one question:
> Why do we have to disable them?
> 

The original commit aeb18dd07692 by Jose Abreu says:

    MMC interrupts were being enabled, which is not what we want because it
    will lead to a storm of interrupts that are not handled at all. Fix it
    by disabling all MMC interrupts for XGMAC.

> > 
> > Fixes: aeb18dd07692 ("net: stmmac: xgmac: Disable MMC interrupts by default")
> > Signed-off-by: Furong Xu <0x1207@gmail.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/mmc_core.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
> > index ea4910ae0921..cdd7fbde2bfa 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
> > @@ -177,8 +177,10 @@
> >  #define MMC_XGMAC_RX_DISCARD_OCT_GB	0x1b4
> >  #define MMC_XGMAC_RX_ALIGN_ERR_PKT	0x1bc
> >  
> > +#define MMC_XGMAC_FPE_TX_INTR_MASK	0x204
> >  #define MMC_XGMAC_TX_FPE_FRAG		0x208
> >  #define MMC_XGMAC_TX_HOLD_REQ		0x20c
> > +#define MMC_XGMAC_FPE_RX_INTR_MASK	0x224
> >  #define MMC_XGMAC_RX_PKT_ASSEMBLY_ERR	0x228
> >  #define MMC_XGMAC_RX_PKT_SMD_ERR	0x22c
> >  #define MMC_XGMAC_RX_PKT_ASSEMBLY_OK	0x230
> > @@ -352,6 +354,8 @@ static void dwxgmac_mmc_intr_all_mask(void __iomem *mmcaddr)
> >  {
> >  	writel(0x0, mmcaddr + MMC_RX_INTR_MASK);
> >  	writel(0x0, mmcaddr + MMC_TX_INTR_MASK);
> > +	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_FPE_TX_INTR_MASK);
> > +	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_FPE_RX_INTR_MASK);
> >  	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_RX_IPC_INTR_MASK);
> >  }
> >    

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
