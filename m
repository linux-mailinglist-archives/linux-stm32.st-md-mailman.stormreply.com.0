Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA161A45A7
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2020 13:28:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA795C36B0B;
	Fri, 10 Apr 2020 11:28:41 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D791C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 11:28:40 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id k18so584530pll.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 04:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AO5eo+r5I1TiZXg+2m7xv1M8c8Hmwzbdi6osh2dcAjw=;
 b=SHGMPucKD2h7jediRM2bzxjyjUV0rSgHtlebSGTYKI94B7TWRVO6Fgm8GEQxjBnABZ
 4m9/vN1yA4766aF/S7iiv0fiztaBr1zVc9Y20iOJFGtNNY1f/LBc6xeg01xRvEkj0Mq2
 7VsP2o7Y9G/ZupgAVCUveXYlYmqC0/Dh9VNpO/hpzzfw412V4yceoUt6kFueXaktL3+Z
 5knqtqQ2hrVpRXsyKWFUWS5aXaNLZxE4Xo5RZuop1w8bFVjyzWoLEeS5xg2IZdoBTrfV
 h2VwltewuB3Twx6I4moVCDrQKT0dq2ZvYBvFn5lmsr+bt+g+8pHBtKI/M2kVaPeRta++
 zfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AO5eo+r5I1TiZXg+2m7xv1M8c8Hmwzbdi6osh2dcAjw=;
 b=VoNYDNf2JrGs9EWlC5NOW+kc+iAObYfrpuQdWI3llAuc2engkUgdBHUyBZo2j8luTZ
 wuEkkp5PcwzyPTXihqN5ul4WCNY13a0bTv2Vm4zeMgTuHboUPZDA2oO22poUKsqGy70U
 ZE2DIgJbShmaZwB8Wdr/9CKLCf2zrL8ZU0PzJ/U98bV2J52pjvL50qgNOAcUXh4Z0Bq8
 6nWBLdlszvY/YwygpmNmfZT56IeZmijy9++17FMdj25KLwUafp/tferZncxSTkrvjJYd
 T0tayxrK5yI0+ftUWXJ3BI+ERTiTiZIJy4WMOoASfAxwdvngq43BY5aiZxU4hRtBS/j6
 hiRA==
X-Gm-Message-State: AGi0PuamsIywD1UCNAGGEbuXb9fi1yE1o9CQE81nr1uImt+Y1tUwlkOz
 mpsQRRkOnNKGweQxa8gC9VYc
X-Google-Smtp-Source: APiQypLTbOpUh1VQspoYmYDVVGVcK0Ly+KQcuRobnohiScDB5yYlvXG1Vb+V6FsinpDPpb8SlMlxfA==
X-Received: by 2002:a17:902:8ec8:: with SMTP id
 x8mr4224577plo.204.1586518118503; 
 Fri, 10 Apr 2020 04:28:38 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:315:a1e8:ac45:4d4a:5a11:afed])
 by smtp.gmail.com with ESMTPSA id f15sm1539587pfd.215.2020.04.10.04.28.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 Apr 2020 04:28:37 -0700 (PDT)
Date: Fri, 10 Apr 2020 16:58:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200410112829.GA27211@Mani-XPS-13-9360>
References: <20200401132237.60880-1-marex@denx.de>
 <20200406072728.GI2937@Mani-XPS-13-9360>
 <9c51236f-a543-99dc-ca4f-5113831451ea@denx.de>
 <20200410090024.GB5723@Mani-XPS-13-9360>
 <7035b570-d1aa-532d-c70b-2fc1e04f9c28@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7035b570-d1aa-532d-c70b-2fc1e04f9c28@denx.de>
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

On Fri, Apr 10, 2020 at 11:55:57AM +0200, Marek Vasut wrote:
> On 4/10/20 11:00 AM, Manivannan Sadhasivam wrote:
> > Hi,
> 
> Hi,
> 
> > On Tue, Apr 07, 2020 at 05:32:31PM +0200, Marek Vasut wrote:
> >> On 4/6/20 9:27 AM, Manivannan Sadhasivam wrote:
> >>> Hi,
> >>
> >> Hi,
> >>
> >>> On Wed, Apr 01, 2020 at 03:22:15PM +0200, Marek Vasut wrote:
> >>>> The AV96 board device tree is completely broken and does not match the
> >>>> hardware. This series fixes it up.
> >>>>
> >>>> Marek Vasut (22):
> >>>>   ARM: dts: stm32: Add alternate pinmux for ethernet RGMII
> >>>>   ARM: dts: stm32: Repair ethernet operation on AV96
> >>>>   ARM: dts: stm32: Add missing ethernet PHY reset on AV96
> >>>>   ARM: dts: stm32: Add missing ethernet PHY skews on AV96
> >>>
> >>> Ethernet works fine with cold boot but after warm reboot it fails with below
> >>> message,
> >>>
> >>> [   18.192842] stm32-dwmac 5800a000.ethernet eth0: no phy at addr -1
> >>> [   18.197539] stm32-dwmac 5800a000.ethernet eth0: stmmac_open: Cannot attach to PHY (err)
> >>
> >> Try this patch:
> >>
> > 
> > [   17.270826] stm32-dwmac 5800a000.ethernet eth0: no phy at addr -1
> > [   17.275519] stm32-dwmac 5800a000.ethernet eth0: stmmac_open: Cannot attach to PHY (err)
> > 
> > It doesn't work. Sorry, I don't have much time to dig into this issue so
> > I'll leave it up to you :)
> 
> I see, it does work on the new board, so I don't really know what to do
> here. Maybe we should just not support the old prototype board ?

Sorry, it turned out to be a DT issue. My script was not updated when I switched
to upstream bootloader. This patch works perfectly on both old and new boards.

Feel free to add,

Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
