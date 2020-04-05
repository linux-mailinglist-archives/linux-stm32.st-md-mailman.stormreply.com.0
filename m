Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9503519ED5D
	for <lists+linux-stm32@lfdr.de>; Sun,  5 Apr 2020 20:37:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B98EC36B0B;
	Sun,  5 Apr 2020 18:37:38 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C0A3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Apr 2020 18:37:36 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id m17so407112pgj.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 05 Apr 2020 11:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=r/V8xd48qmZ3Tejwsg4uBw3R9OCUKDXWmgs0tD6ufjM=;
 b=L2on1fYhGNBawXv6/jnFwWDhknkWKqq5q+rA9VgKHFe5sD+XmwpdZP/CYX2iLsmWb6
 as4PbmFjU1bkxGoGX5OTvJ3tkF59UDXK1dBBGyheqiDx4sRB9b9K7K0AbcXgw5KZsoIx
 b6zNCtHhsutOsmprl7smP3wcXJTb9Ma5MleU99OKZZm82fqElDUPQgGBaODIa7ShSnEd
 jplXT7J+sGPiqdTAZncH1pF73WEJXwpFoZaWQCzuPMUB/LEKaCVXUl9d3MP/DzV+Oo+A
 kvAE/2cjr0kRbsAlvaASDtj5dDvGk+w9/GN3sPOILpSUzkN6Bq/VY0VSlnrKXCJRmHY2
 8Wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=r/V8xd48qmZ3Tejwsg4uBw3R9OCUKDXWmgs0tD6ufjM=;
 b=WjxsJZa2ep3HHBT9BpeaTNPp4s7PTFJnGbXxJGti9VfAQMzAmdDDLy+HWd+ePngkM7
 Y5f4YJt6iNzDX38rI1fkbWKKtBtVHpcG6meY6hny0qx4SZeguIqZnYSZZBen4AT8kvrk
 W9cdK+ZhkQMgUSAKkWQnxlOUutnUDwgkWqCrGUC7BAPDuam0O6hmoKo/O24bCc8kTucG
 mVgo9gIXpv8uGJqU6n7unO1idc82IBn/vXWODqtw4LXaqAMAHfpjCCb27p340FyWirXl
 aAXm9BOZ6H3HlZf52a6RLEUVZQV087uIei2lIy91BHaHp6EbD8y8xPJgydn7DiYhwcub
 I5Ig==
X-Gm-Message-State: AGi0Pubny5EjZRnuIUQXUn9pK3Q/OD5h/pEe4HHkrmITfOs87+tfy2tA
 TolN84Uyt25OtTM9iGRo2X9q
X-Google-Smtp-Source: APiQypInL/Tpz4PVWz0R2bHqtkcOI8x3gaf98ELwYcqe4gYzx4f3CfI5QxvBE8L1c/LoRI/KQJe8Lw==
X-Received: by 2002:aa7:9888:: with SMTP id r8mr18233535pfl.293.1586111855211; 
 Sun, 05 Apr 2020 11:37:35 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([157.51.125.214])
 by smtp.gmail.com with ESMTPSA id v20sm9197825pgo.34.2020.04.05.11.37.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 05 Apr 2020 11:37:34 -0700 (PDT)
Date: Mon, 6 Apr 2020 00:07:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200405183729.GA9410@Mani-XPS-13-9360>
References: <20200401132237.60880-1-marex@denx.de>
 <20200405144305.GT8912@Mani-XPS-13-9360>
 <38dc1697-28e3-8680-4998-74e30339a2eb@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38dc1697-28e3-8680-4998-74e30339a2eb@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V4 00/22] ARM: dts: stm32: Repair AV96
	board
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

On Sun, Apr 05, 2020 at 04:55:54PM +0200, Marek Vasut wrote:
> On 4/5/20 4:43 PM, Manivannan Sadhasivam wrote:
> > Hi Marek,
> 
> Hi,
> 
> > On Wed, Apr 01, 2020 at 03:22:15PM +0200, Marek Vasut wrote:
> >> The AV96 board device tree is completely broken and does not match the
> >> hardware. This series fixes it up.
> >>
> > 
> > Can you please share a git tree with all these patches? These are not
> > applying cleanly on top of mainline/master or linux-next/master.
> 
> Alex asked for them to be rebased on
> git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git
> branch
> stm32-next
> 

Thanks, I'm able to build with your patches. Btw, I just found that the
current mainline versions of u-boot and Linux kernel are certainly broken
on old Avenger96 (588-100) as well.

u-boot doesn't boot while linux kernel has MMC2 and Ethernet broken as you
reported. However, checking out the commit which added Avenger96 board support
in both projects works fine.

So this clearly tells that there is a regression which caused the board support
to be broken with mainline u-boot and kernel. I didn't try to find the offending
commit(s) as the support for STM32MP1 got matured in both the projects. But
we can go ahead with your patches.

I will review the remaining patches tomorrow.

Thanks,
Mani

> So that's where they apply.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
