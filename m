Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 742261A45B0
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2020 13:34:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26862C36B0B;
	Fri, 10 Apr 2020 11:34:40 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3D8EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 11:34:38 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id n13so872961pgp.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 04:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QZkfzAjz6DZ50KEIpaOba4ZV1jldPscE4OK3uFoHY2s=;
 b=TSsoUFPZ+jEfXKBQyMGlUtMWC2iBV1G2r5FzqVp/zaLkkpShuz12bxsj0V8JL9Poqt
 7LMMqUg23fE0mXgL30Nu5R1ds8xu6RTiNdN2j4FXpTv1NVnqER+9lGfS/aMt7P/Q9l1w
 XMqoyhlwbiVRNPAQUkNt02k+X/Pv4nz4za5D9JdqZKrVPhSeEQ0vcp6FqDF+PWHwi8B/
 47SNIY5tnOp3LzjKDlgX9O35SevAznuazUdjqyuWOC4xh/YMs5X3H93uNbsEbuDZFwfG
 ZXqhOsWGgoCWkDi/wAr5uDYgcAcUK6X5Jmx4RvxGi63s0E/kSkVsEnJb7GKz+CxWKbIt
 kuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QZkfzAjz6DZ50KEIpaOba4ZV1jldPscE4OK3uFoHY2s=;
 b=hGzWw/sYOBkCs8ZxVI+170TZLeu5zOJ1DZZTKKQts66I+vu7kBmJdKaaS59MPZo1zS
 4LmSUjwR3EZ1/Q0bRqrdQ57eZKX7qu6S62KFDY5s1/q57CieG+/kFcpKghQXjHJPq1hY
 r+uHzC5xdTfv0YkzP5v0RtRsKlmxyMqov3WbyIRNGSjJGJMWtsJr5vdNGMJuJlT41Hm9
 2CrVEkX9buhv87ttdHiHmy8N4xRBsitgSj521qr0K3pRfpPMmdOzapaLVG14rT5dVRer
 LNKsqyFdVQCdHTWse0GTMuY6clITmvlaZqyQfyV+MTwW0YSlFXAS6mSa+X7UBrQsg/Qi
 HM1Q==
X-Gm-Message-State: AGi0PuYNuagdalPmON7yl/NLz/YQma5TEjrIqwMixxbTyAIpHJip9wMg
 MCJ9jxPDEK6+RPwz8JdtaQnb
X-Google-Smtp-Source: APiQypJS6mU8FRbPFlq8gZgQyNv/dzH9zoanKLSdalIDMa0Nack9tfZT36lsjEd3YACyTb4QEmJ9FA==
X-Received: by 2002:a62:1407:: with SMTP id 7mr1358869pfu.194.1586518477150;
 Fri, 10 Apr 2020 04:34:37 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:315:a1e8:ac45:4d4a:5a11:afed])
 by smtp.gmail.com with ESMTPSA id g3sm1419810pgd.64.2020.04.10.04.34.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 Apr 2020 04:34:36 -0700 (PDT)
Date: Fri, 10 Apr 2020 17:04:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200410113429.GB27211@Mani-XPS-13-9360>
References: <20200401132237.60880-1-marex@denx.de>
 <20200401132237.60880-22-marex@denx.de>
 <20200406072242.GG2937@Mani-XPS-13-9360>
 <59d1cc85-a65e-d2bf-4591-0828cf7b8390@denx.de>
 <f952f1ad-53bb-7b85-caad-2174a4333a2c@denx.de>
 <20200410090828.GC5723@Mani-XPS-13-9360>
 <9d3b3a76-9711-6fd9-cb1b-af412c2babcd@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9d3b3a76-9711-6fd9-cb1b-af412c2babcd@denx.de>
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

On Fri, Apr 10, 2020 at 11:16:53AM +0200, Marek Vasut wrote:
> On 4/10/20 11:08 AM, Manivannan Sadhasivam wrote:
> > Hi,
> 
> Hi,
> 
> > On Tue, Apr 07, 2020 at 08:37:50PM +0200, Marek Vasut wrote:
> >> On 4/6/20 1:08 PM, Marek Vasut wrote:
> >>> On 4/6/20 9:22 AM, Manivannan Sadhasivam wrote:
> >>>> On Wed, Apr 01, 2020 at 03:22:36PM +0200, Marek Vasut wrote:
> >>>>> Fill in the bindings for USB host and gadget on AV96.
> >>>>>
> >>>>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>>>
> >>>> I can't get the USB B-Micro OTG port to work with this patch. Do I need to
> >>>> enable any configs other than PHY and USB DWC2 drivers?
> >>>
> >>> Only the DWC2 GADGET (and possibly host, for dual-role) and some gadget
> >>> implementation (e.g. gadget zero).
> >>
> >> I think I see what doesn't work for you.
> >>
> >> It seems the following works on next:
> >> power on -> plug in USB stick (or any other USB device) -> unplug ->
> >> plug in usb host (e.g. PC)
> >>
> >> But this does not:
> >> power on -> plug in usb host (e.g. PC)
> >>  - the PC is not detected
> >>
> > 
> > Both doesn't work. I have the rndis gadget configured in userspace but plugging
> > in the micro-b cable doesn't do anything.
> > 
> >> Did that ^ ever work for you before ? I suspect this is a bug in the
> >> DWC2 driver. The OTG operation there is known to be flaky at best.
> > 
> > Not on this board. I don't recall what happended with vendor image. But I do
> > have another STM32MP1 based 96Board (which will be submitted soon), there I can
> > get OTG port working.
> > 
> > But in that board a BG96 modem is connected to USB2 port on the board itself
> > which gets enumerated during probe.
> 
> But it's not configured as OTG on this other board, right ?

It is configured as a OTG port. But that board has a different issue which
resets the board when we connect any OTG cable to act as a host. That's not
related to DWC2 or this issue btw.

Anyway, I can't get OTG (device/host) to work on both old and new boards.

Thanks,
Mani
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
