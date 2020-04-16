Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5855E1AD0EB
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 22:15:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF92CC36B0C;
	Thu, 16 Apr 2020 20:15:34 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BA65C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 20:15:31 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id q73so2750725qvq.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 13:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RrhoCocMui3bsFc5qkdYNErfeCVARryDRP7TYadbG5M=;
 b=QfKW6F7xCXl6+vxdlzAiOL5ivPMy1SHP4U5CM8CVeegJchb5+KDPwsbTufj449g+u4
 SD8E5bdY6BjaDM0KbK7iKkgwtLkedOn6so4ibg1BTWRdPCngH3jq4GS1rAXU0x3tqAW+
 +Z+52kZuoEnBLuNVBNWfPaISsumvknew1jf03TvmuKfwG9QZs3ABAS2cvd1he0XhnLDQ
 aeKzpcLxXOlZl4GkR6FTBIMSIghnearpfUmTipNkoasRCwGXVJ76zE+VYDzzcJFVV3tu
 IXG/BpW9slI84n6+qwgUnA2Ga9rgXPyqvF4yPDwBPGswDWoEGlWhip+xHunJQ8F1C6C2
 YMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RrhoCocMui3bsFc5qkdYNErfeCVARryDRP7TYadbG5M=;
 b=Fz82017+GHeioFtAfMM8XNLbp0eF+bTmSrMd1LUUfcmBQpg6PI8gh/D8KRgPFMBMyw
 wk8v/mcX08jeuPu67IfQpgw353+9mfxc1kGQ/3nhXtnmILBXOTmQpKxXKvJPdIChDtbR
 fxO2Vk1Tr3SwkW6MBtohJd1rEabR+HASZB2fEBR/MDWwWa2w/XuJALh4mrjWNRcNuhwZ
 J25uXlE8buVOvDyNuxWERbfz0XD1q3bqGtn/vcWK1wsQOLXYeilzlz9Yy4iAWFOP9CtC
 UQGxxfydYB5Gc9bZMzt6e/alt6K6MEQmEL6cGM+gcz3DD2l8bxnF+hsQk9NDPM/pYArP
 5slg==
X-Gm-Message-State: AGi0PuYmIlCH2u66MOvoDEn/0GOhJ3fhp07854jkIXju35oyy0ZpVWOt
 EduVsEN6P4tzpzk0resfHpr6BEz6b8hhbK0cmY4=
X-Google-Smtp-Source: APiQypLEw9l7W2hSliB15jHFogvAHufSRGn0ZYH76LQ8VoeRoID9myxCgGr4Pn9PvD87gHrPUOj8sgZxasNifp8qNh4=
X-Received: by 2002:a0c:f748:: with SMTP id e8mr11834286qvo.237.1587068130311; 
 Thu, 16 Apr 2020 13:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200414151955.311949-1-adrian.ratiu@collabora.com>
 <20200414151955.311949-2-adrian.ratiu@collabora.com>
 <CAFqH_52eKB4jtmn5e4HQubv8ijOPqDqncp1dRGahhU3NOorJMQ@mail.gmail.com>
 <87lfmvjmt5.fsf@collabora.com>
In-Reply-To: <87lfmvjmt5.fsf@collabora.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 16 Apr 2020 22:15:19 +0200
Message-ID: <CAFqH_513KB+En_xbpXSBG6Q38kYxWCgw0KO3NVxCb6fqHDaKBA@mail.gmail.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Adrian Pop <pop.adrian61@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-imx@nxp.com
Subject: Re: [Linux-stm32] [PATCH v6 1/8] drm: bridge: dw_mipi_dsi: add
	initial regmap infrastructure
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

Hi Adrian,

[snip]

> >>
> >> +static void dw_mipi_dsi_get_hw_version(struct dw_mipi_dsi
> >> *dsi) +{ +       regmap_read(dsi->regs, DSI_VERSION,
> >> &dsi->hw_version); +       dsi->hw_version &= VERSION; +
> >> if (!dsi->hw_version) +               dev_err(dsi->dev, "Failed
> >> to read DSI hw version register\n");
> >
> > Is this an error that should be ignored? If you can't get the HW
> > version, probably, there is something wrong with your hardware
> > so, don't you need to return an error?
> >
>
> After thinking a bit more about it, that error should be a
> warning.
>
> I added it because in some cases (for eg. if the peripheral clock
> is disabled) the reads can return 0 which is obviously an invalid
> version and the bridge will error in the next step when not
> finding a layout.
>

If you'll error anyway, why wait? IIUC at this point the clock *must*
be enabled, and if not, something is wrong with the driver, I don't
see any advantage on delay the error. do you have a use case where
this is called and peripheral clock disabled?

> So I'll make this a warning in v7 and explicitely mention that
> reads version == 0 can be caused by a disabled pclk.
>

-- Enric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
