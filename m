Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C46BF39A22F
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jun 2021 15:28:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A555C57B69;
	Thu,  3 Jun 2021 13:28:13 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D024C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jun 2021 13:28:11 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id g18so5115558edq.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Jun 2021 06:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AsY4CC2jUsbhA7Sh7zEuXYTCJ/q9mQ3pTZZVOhrOvaw=;
 b=YI+sslnEov5+3qblH1HHF/85Z7lGvnkhNs9kvYTyd8zfuO3C2acB8IK0YN3hPZrlII
 mmeqPrcJ2ci2otKqp3ZygBHDes6X7oiyCxj5ImpkmheOTInQLuO59NIB0lCg7/fVEO8d
 nXjGfvrYthHtj13R6iRTCjgbT4haRmRVJhaduDFaoBFW1E54z1sxs7YGG04jt3e7JFC8
 7I945rGXSK4fGdjAgwHfvyfNLfnN5zi5Joe/GjgxPMxSD8e/UI5J5NJQAX93N64jCDLX
 /7fwjPOMqlEO/LXzIBgWiWkgztzmEn9/TANNSQfDQfQiYKaAFN/7xkRgykObXZCFK+CZ
 fwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AsY4CC2jUsbhA7Sh7zEuXYTCJ/q9mQ3pTZZVOhrOvaw=;
 b=NGKu/fPoUhR6fyn+pdUEQuILL+ryCVgnc6pRJHs3KuVKoZpaAFZ2MFVj8HOetyp4et
 g7Z6eIda5t56yl5J39MR/Myq50om9X6DyXL8f0+pHZLhj4wxJlmqLtdAAywnJzpmmqr3
 8vzWf7aD8FP1XSkupop4fwN7Yko/XfCQ0hN6rOLwQWj/hgou6WRr4iu9pEzD3sTDxOQj
 qADFdIkqKssBfBoCEqFmtsas0a+kzEBEyr4+8AO6vyzEcsjrytlY2R7ku+oSuan64mag
 JyReL5+wOxicIOZydWSvgBgZVuyS3FjblnrKOZ8R1kYFRX3vfcdRXX5fF3rf89x51JId
 c5ew==
X-Gm-Message-State: AOAM530qztTLKCTT0M1rZMDRmOoPKmRYqWj0pZvGhtEp5rC6ZrNB5YO9
 1TXBF7W6Av//hTVkrSVWWkU=
X-Google-Smtp-Source: ABdhPJwC4Eb4uhIsV+JBMZdkSQBTOHkx9nuChPxQic5GV974vvB4qh3kqgw+xBz93xsL3q9Jdwurjw==
X-Received: by 2002:aa7:c799:: with SMTP id n25mr41586057eds.16.1622726891599; 
 Thu, 03 Jun 2021 06:28:11 -0700 (PDT)
Received: from skbuf ([188.26.52.84])
 by smtp.gmail.com with ESMTPSA id u4sm1515033eje.81.2021.06.03.06.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 06:28:11 -0700 (PDT)
Date: Thu, 3 Jun 2021 16:28:09 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20210603132809.2z3jhpuxaryaql6v@skbuf>
References: <20210603115032.2470-1-michael.wei.hong.sit@intel.com>
 <20210603130851.GS30436@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210603130851.GS30436@shell.armlinux.org.uk>
Cc: Jose.Abreu@synopsys.com, andrew@lunn.ch, vee.khee.wong@linux.intel.com,
 linux-kernel@vger.kernel.org, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, tee.min.tan@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 boon.leong.ong@intel.com, kuba@kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [RESEND PATCH net-next v4 0/3] Enable 2.5Gbps
	speed for stmmac
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

Michael,

On Thu, Jun 03, 2021 at 02:08:51PM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> On Thu, Jun 03, 2021 at 07:50:29PM +0800, Michael Sit Wei Hong wrote:
> > Intel mGbE supports 2.5Gbps link speed by overclocking the clock rate
> > by 2.5 times to support 2.5Gbps link speed. In this mode, the serdes/PHY
> > operates at a serial baud rate of 3.125 Gbps and the PCS data path and
> > GMII interface of the MAC operate at 312.5 MHz instead of 125 MHz.
> > This is configured in the BIOS during boot up. The kernel driver is not able
> > access to modify the clock rate for 1Gbps/2.5G mode on the fly. The way to
> > determine the current 1G/2.5G mode is by reading a dedicated adhoc
> > register through mdio bus.
> 
> How does this interact with Vladimir's "Convert xpcs to phylink_pcs_ops"
> series? Is there an inter-dependency between these, or a preferred order
> that they should be applied?
> 
> Thanks.

My preferred order would be for my series to go in first, if possible,
because I don't have hardware readily available to test, and VK already
has tested my patches a few times until they reached a stable state.

I went through your patches and I think rebasing on top of my
phylink_pcs_ops conversion should be easy.

Thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
