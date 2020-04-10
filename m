Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E041A443B
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2020 11:08:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E45EC36B0B;
	Fri, 10 Apr 2020 09:08:40 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3EE4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 09:08:37 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id c5so751895pgi.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 02:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SarLi1PRzF64qy8fzOc7J54ATYrGPWgHsJKTIfsQelY=;
 b=nOTgMRp40ilO6W7Q7nIS2dkmQsY+3CtU60Uexa/gXwqHjj3BCOhZ6PFTpwNyAG8/uF
 n41fGPffby19S7s9P5eA9GB13o1x8hYYa51QMT5ycN/j4ZdODxLKUz7ZwSWWSDPp8sh9
 QaXMF2iO7Oij97cFE3nybcC0VIXnxw2B4/5MOQdzD/z1GDPScs9AhXk/lTYzypeWhwCN
 wO+0KMHPSys/NJoOd0FFvVq6TLKBZeseA5sZy6fTjJSEmFsH6DkE4wCCdHCzUIQG5+Z4
 BiAAwpvar08yateFWe0nIa8z0jDbiP0YvJM7xoLpOpAIGxQYt95MGWMeKTe+lAVicPXi
 sK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SarLi1PRzF64qy8fzOc7J54ATYrGPWgHsJKTIfsQelY=;
 b=tD2JzQGgTThUCdRAMWX8eyJxCdTePnS0vUz9uH0hl+afVE0cX7lYKslJwvD1lBBUvs
 Zn0zbmYkSiECi7GMz/9yDyq8vTg9/nen4bZeBkCVCm4gYewK1BECgljHguHNktYIJ5y7
 eWp7CZQu70oFc+5KCZ0NCNssdgHJAK5T+CTX/gh4K6iG9Yb5Sr4oWXDQSHVLPxKl7qQO
 2EhoNoaMjH2QDRsNLJy7Z8dKBXU/SGmNV9WzW70R7J7M9SUseZBsThkpA+m9UFFtx8xH
 k7YEQX+WefsJpT0XOMAONH4zODQ3ZC+XZcE4ty64MJYpO6pCmJ+f54GeFhxOJj5KYgT/
 /2aQ==
X-Gm-Message-State: AGi0Pua54sRwjibiMK8zaQtITjz9t25diCfenescK+cv+zMVFVx3ZBZy
 xwGd1Gbt5umZDuVssjUMdsM1
X-Google-Smtp-Source: APiQypKxRv7GK9PQjZT+jtoLP//aw98pK+L2n2e5E9kDgv24JHO8+pJ67xlE+uq27IkGarYweW/70g==
X-Received: by 2002:a62:19d8:: with SMTP id 207mr4205797pfz.278.1586509716293; 
 Fri, 10 Apr 2020 02:08:36 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:999:4ceb:ac45:4d4a:5a11:afed])
 by smtp.gmail.com with ESMTPSA id z15sm1265921pfg.152.2020.04.10.02.08.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 Apr 2020 02:08:35 -0700 (PDT)
Date: Fri, 10 Apr 2020 14:38:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200410090828.GC5723@Mani-XPS-13-9360>
References: <20200401132237.60880-1-marex@denx.de>
 <20200401132237.60880-22-marex@denx.de>
 <20200406072242.GG2937@Mani-XPS-13-9360>
 <59d1cc85-a65e-d2bf-4591-0828cf7b8390@denx.de>
 <f952f1ad-53bb-7b85-caad-2174a4333a2c@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f952f1ad-53bb-7b85-caad-2174a4333a2c@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V4 21/22] ARM: dts: stm32: Add bindings
	for USB on AV96
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

Hi,

On Tue, Apr 07, 2020 at 08:37:50PM +0200, Marek Vasut wrote:
> On 4/6/20 1:08 PM, Marek Vasut wrote:
> > On 4/6/20 9:22 AM, Manivannan Sadhasivam wrote:
> >> On Wed, Apr 01, 2020 at 03:22:36PM +0200, Marek Vasut wrote:
> >>> Fill in the bindings for USB host and gadget on AV96.
> >>>
> >>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>
> >> I can't get the USB B-Micro OTG port to work with this patch. Do I need to
> >> enable any configs other than PHY and USB DWC2 drivers?
> > 
> > Only the DWC2 GADGET (and possibly host, for dual-role) and some gadget
> > implementation (e.g. gadget zero).
> 
> I think I see what doesn't work for you.
> 
> It seems the following works on next:
> power on -> plug in USB stick (or any other USB device) -> unplug ->
> plug in usb host (e.g. PC)
> 
> But this does not:
> power on -> plug in usb host (e.g. PC)
>  - the PC is not detected
> 

Both doesn't work. I have the rndis gadget configured in userspace but plugging
in the micro-b cable doesn't do anything.

> Did that ^ ever work for you before ? I suspect this is a bug in the
> DWC2 driver. The OTG operation there is known to be flaky at best.

Not on this board. I don't recall what happended with vendor image. But I do
have another STM32MP1 based 96Board (which will be submitted soon), there I can
get OTG port working.

But in that board a BG96 modem is connected to USB2 port on the board itself
which gets enumerated during probe.

Thanks,
Mani

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
