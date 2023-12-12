Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C62A380E710
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Dec 2023 10:08:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76FBAC6B45B;
	Tue, 12 Dec 2023 09:08:13 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DCFFC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 09:08:12 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-50be24167efso6214745e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 01:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702372091; x=1702976891;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QIjPBVeqkpjJISDqusXw3EmS1YdMB1wPejTAPOdPhFM=;
 b=QXq14XEc6F/KLnPkj9jTGJgciCseupDhT+9DrpmgHV8ojXrLQ+lbP7fZgMyrgQsFDa
 f09B5Q++4Fu72Ip5saafOU7cVEZH6+6zxaADWDLkB1fKB3Xn46lOKTfjde+BY07qARHx
 RHdRvmRnIcyiE0CleE3QyQoIHX1WpuSlTMxPMCDWyavcNc/a8/rln4XQq1PlaVE4j/PE
 UHHpX3ho5AdNwthSRBWcn5mBcXWNacdDpipI4lGUjCdZcrGfp6CwOuO3DJAPotshzXGu
 9jlxcXCaxSKAYqew9R3LIVw81eD/lAkSMvbtVJSecakpSSLJNlUZ6TYVVpM7nGSY48wy
 pDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702372091; x=1702976891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QIjPBVeqkpjJISDqusXw3EmS1YdMB1wPejTAPOdPhFM=;
 b=rktqHqdNM+1TstDCGytvipKl/FDsPsKikT679NmDTsub3SNd0Nld/EgSH1nW7y18uC
 RpgGTrzIyc0j+Ambj6pSrF6Oc5JN4WnkCa/Fki0c/YTSCJlXLUC1o3aOFItl9sWl/A5Y
 6qXc0AW65kfQRzKJ2WbQBMwS1h75WxuWPDHz02/lTujIldtLj8Q3jF8e0xMPs6tgPNQc
 Q2TofHWrfzn0dZfZkPsK1Xwi0fbpMacjbevfBvFQhHlL9Vz+N3uTQPkqcSqHjuCbZ6/K
 i+rCzSQ4nJxj+vBDnL1M2hrYKe+tPmNNwKnoLRBC2le7WC7DG9/HcwlDV2quv8o7q1Ph
 lBNw==
X-Gm-Message-State: AOJu0YzCdcD27nKfNtqi3NJDXXt2HHBnze2nqhRBAkfUtPMfKr09M9nL
 JrT6iJM8+M16OZKylGOdnSw=
X-Google-Smtp-Source: AGHT+IHt99lcd5IUKs49PKtCTF0cKUj5I2Ik89wnLq7Asjoik1V8IuHwNphFLryPGu803yiXf3w+fw==
X-Received: by 2002:a05:6512:46f:b0:50b:ed48:247a with SMTP id
 x15-20020a056512046f00b0050bed48247amr1240510lfd.246.1702372091059; 
 Tue, 12 Dec 2023 01:08:11 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a19ad08000000b0050c0f5ce8c2sm1290876lfc.124.2023.12.12.01.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 01:08:10 -0800 (PST)
Date: Tue, 12 Dec 2023 12:08:07 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jianheng Zhang <Jianheng.Zhang@synopsys.com>
Message-ID: <ulsdbn3iqzyokqbfejp5krrpbkzz3rqpxfw53m2rfm2ouzs2bz@ys4ynwqwewjo>
References: <CY5PR12MB63726FED738099761A9B81E7BF8FA@CY5PR12MB6372.namprd12.prod.outlook.com>
 <d202770a-3a3a-4ee2-b0de-b86e2f3e83ce@lunn.ch>
 <CY5PR12MB6372C8770900AFF821325400BF8EA@CY5PR12MB6372.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY5PR12MB6372C8770900AFF821325400BF8EA@CY5PR12MB6372.namprd12.prod.outlook.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 open list <linux-kernel@vger.kernel.org>, James Li <James.Li1@synopsys.com>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Martin McKenny <Martin.McKenny@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: xgmac3+: add FPE
 handshaking support
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

On Tue, Dec 12, 2023 at 07:22:24AM +0000, Jianheng Zhang wrote:
> Hi Andrew,  
> 
> > > +static int dwxgmac3_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
> > > +{
> > > +	u32 value;
> > > +	int status;
> > >
> > > -		writel(value, ioaddr + XGMAC_FPE_CTRL_STS);
> > > -		return;
> > > +	status = FPE_EVENT_UNKNOWN;
> > > +
> > > +	/* Reads from the XGMAC_FPE_CTRL_STS register should only be performed
> > > +	 * here, since the status flags of MAC_FPE_CTRL_STS are "clear on read"
> > > +	 */
> > > +	value = readl(ioaddr + XGMAC_FPE_CTRL_STS);
> > > +
> > > +	if (value & XGMAC_TRSP) {
> > > +		status |= FPE_EVENT_TRSP;
> > > +		netdev_info(dev, "FPE: Respond mPacket is transmitted\n");
> > 
> > netdev_info()?  Is this going to spam the logs? Should it be netdev_dbg()
> 
> Yes, netdev_dbg() should be better, let me fix it in the next patch.

Please do not forget to keep this change in the refactoring patch (if
one will be introduced). So instead of preserving the DW QoS Eth FPE
code snipped with netdev_info() utilized, the common FPE
implementation would have the netdev_dbg() calls.

-Serge(y)

> 
> Jianheng
> > 
> > 	Andrew
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
