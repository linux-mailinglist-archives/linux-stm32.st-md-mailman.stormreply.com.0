Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B4F1A4DC0
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Apr 2020 06:12:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25DEDC36B0B;
	Sat, 11 Apr 2020 04:12:25 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19FAAC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Apr 2020 04:12:23 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id u65so1911516pfb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 21:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bPb+QNwH7oVZoU6e5v2DwAVPzHg2QhsdVYytLq5Z1Nc=;
 b=JcMwtPdN51eAbJq4wmxBBACa7MHlV7MnOv6HH4olGOH2h+sccEbOSDEK1a0zSXa++s
 q4UKdbwyl0EdlitspsRpgsw9UPjgZOElW01JUxHTyNLbu16RJ1rk/jNV3tIFvmcUS/QN
 OpYzCsr6Ivllr3Cyeop2i70RG+DQtdxzPejj+pzw7xGs6aRlLowE/2oatHSn/1O0zQeC
 XTFq08/nx7gBJH+w3zJnlUExA5HZHVSSAnIl6sMzbwgTmhKWvD6pWHCwiQh7qmnBk5Nj
 4CHfDr01xM9OhJRp7oyCm6ijAahVh3lGTv42YAiop2CpsdnOHWyX+6RLf5i8PiPJ/3yJ
 0JkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bPb+QNwH7oVZoU6e5v2DwAVPzHg2QhsdVYytLq5Z1Nc=;
 b=Ryg9Vq6xJ2wlT4cXaI59C6MXZgRaSUg+YWe683lVFbPKaA4UfjMyJrQZFSU7a6te5n
 vSknORw0WnYngaxnkNa/cTqdDA53ew5WGTH0//cROrHwSUl4x8dcWF1cJbQqaj4yysdI
 L+MlBxdgII4wFMtflXqrMo0Lpdz0IIBS9Sbk/08IluI6E2IwzRlpAsOtjjYWUHteLA9X
 B8YvYowFs+HR8Y6vfDnTQE1F7SA5zgjXNkLAzcvdS/PLc40sRo5ombPeoCJG/OzUnI9h
 yw+8FkIkn8yoQpicmTfsE12VakArzUP2a/61XhBSUquYP9HsSKtor812+LqM94mNQlSf
 p1bQ==
X-Gm-Message-State: AGi0PubaPYjWiq1kEYPI3muwkCQPJcrBimJV11n8bXFZWW/m7oHp45n+
 XqaOJxBATXB1AM1BsEC0zWIN
X-Google-Smtp-Source: APiQypJOC+BODV7Kr+qfFWPtolIzApihVHhwDc1jJtmGjDvTNXLwne45N3KRi0wChYGiCMXZ+CdbLw==
X-Received: by 2002:a63:a55b:: with SMTP id r27mr4213140pgu.141.1586578341414; 
 Fri, 10 Apr 2020 21:12:21 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:89:182f:8ca9:73df:c140:559e])
 by smtp.gmail.com with ESMTPSA id o40sm1152889pjb.18.2020.04.10.21.12.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 Apr 2020 21:12:20 -0700 (PDT)
Date: Sat, 11 Apr 2020 09:42:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200411041213.GA11800@Mani-XPS-13-9360>
References: <20200401132237.60880-1-marex@denx.de>
 <20200401132237.60880-22-marex@denx.de>
 <20200406072242.GG2937@Mani-XPS-13-9360>
 <59d1cc85-a65e-d2bf-4591-0828cf7b8390@denx.de>
 <f952f1ad-53bb-7b85-caad-2174a4333a2c@denx.de>
 <20200410090828.GC5723@Mani-XPS-13-9360>
 <9d3b3a76-9711-6fd9-cb1b-af412c2babcd@denx.de>
 <20200410113429.GB27211@Mani-XPS-13-9360>
 <3c342261-eb66-4c03-6981-65b4463e09cf@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c342261-eb66-4c03-6981-65b4463e09cf@denx.de>
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

On Fri, Apr 10, 2020 at 08:02:51PM +0200, Marek Vasut wrote:
> On 4/10/20 1:34 PM, Manivannan Sadhasivam wrote:
> > On Fri, Apr 10, 2020 at 11:16:53AM +0200, Marek Vasut wrote:
> >> On 4/10/20 11:08 AM, Manivannan Sadhasivam wrote:
> >>> Hi,
> >>
> >> Hi,
> >>
> >>> On Tue, Apr 07, 2020 at 08:37:50PM +0200, Marek Vasut wrote:
> >>>> On 4/6/20 1:08 PM, Marek Vasut wrote:
> >>>>> On 4/6/20 9:22 AM, Manivannan Sadhasivam wrote:
> >>>>>> On Wed, Apr 01, 2020 at 03:22:36PM +0200, Marek Vasut wrote:
> >>>>>>> Fill in the bindings for USB host and gadget on AV96.
> >>>>>>>
> >>>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>>>>>
> >>>>>> I can't get the USB B-Micro OTG port to work with this patch. Do I need to
> >>>>>> enable any configs other than PHY and USB DWC2 drivers?
> >>>>>
> >>>>> Only the DWC2 GADGET (and possibly host, for dual-role) and some gadget
> >>>>> implementation (e.g. gadget zero).
> >>>>
> >>>> I think I see what doesn't work for you.
> >>>>
> >>>> It seems the following works on next:
> >>>> power on -> plug in USB stick (or any other USB device) -> unplug ->
> >>>> plug in usb host (e.g. PC)
> >>>>
> >>>> But this does not:
> >>>> power on -> plug in usb host (e.g. PC)
> >>>>  - the PC is not detected
> >>>>
> >>>
> >>> Both doesn't work. I have the rndis gadget configured in userspace but plugging
> >>> in the micro-b cable doesn't do anything.
> >>>
> >>>> Did that ^ ever work for you before ? I suspect this is a bug in the
> >>>> DWC2 driver. The OTG operation there is known to be flaky at best.
> >>>
> >>> Not on this board. I don't recall what happended with vendor image. But I do
> >>> have another STM32MP1 based 96Board (which will be submitted soon), there I can
> >>> get OTG port working.
> >>>
> >>> But in that board a BG96 modem is connected to USB2 port on the board itself
> >>> which gets enumerated during probe.
> >>
> >> But it's not configured as OTG on this other board, right ?
> > 
> > It is configured as a OTG port. But that board has a different issue which
> > resets the board when we connect any OTG cable to act as a host. That's not
> > related to DWC2 or this issue btw.
> 
> Do I misunderstand the part where you claim there is a modem connected
> to the DWC2 ? That would mean it's in Host mode, no ?
> 

Let me make it clear. On that board, the USB connection is almost similar to
Avenger96 except that there is only one host port used and it is connected to
the BG96 modem onboard. The other OTG port is connected to micro-b connector.

There I can _only_ get the OTG port to work in device mode. I haven't figured
out what is the exact issue yet. So in the meantime, I may use

dr_mode = "peripheral"

to avoid it being used as host. But on Avenger96 board, the host ports are
working but the OTG port is neither working as host nor as device.

> > Anyway, I can't get OTG (device/host) to work on both old and new boards.
> 
> Do you have 588-200 now too ?
> 

I have both 588-100 and 588-200 now. I told you that at the time of initial
upstreaming I had only 588-100 but later Arrow sent me the new board.

> I think there is some fix in current linux-next which partly fixes the
> DWC2 role switching, so rebase this patchset on current linux-next and
> see what happens. But it's still not perfect. I also think that ST
> managed to side-step this issue by using the STUSB1600 chip, but I might
> be wrong.

Okay, I'll try for both Avenger96 and Stinger96 (yeah that's the name of the
board I'm working on right now).

Thanks,
Mani
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
