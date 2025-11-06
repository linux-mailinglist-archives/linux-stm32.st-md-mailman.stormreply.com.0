Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D6FC39708
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 08:46:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B94DC349C4;
	Thu,  6 Nov 2025 07:46:47 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B7D8C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 07:46:44 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b8c0c0cdd61so554706a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Nov 2025 23:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762415203; x=1763020003;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0f5wmX+yoZg0wz1UxGaCZPnItqaKdkuDqolTF8KvNuo=;
 b=KdGoJ/US9pMHnPTIcH6qV9r8HUhC3J5WYyTQlcs0WGC3Jz+WwLMjNDB+AZ3wN3d+Gj
 5kb9TDfk01LP1s14hobRQO7wM01Y2AYYbTWHRfrzF5iKhFEFoTw8A0Ck2z+FxdOjoBWT
 jpR2mjjNgh77aRRt+p1VoBAIvz62/Mj+mamNGrMRmwhv0h2bHdpmi+JN9Em9+mY0BjvV
 521St+878fKaHk+Isp3FYsaq+utET+NDeyiKbkLjCPnY1UppTvshpVMgYdZkRgCfdf4q
 481yHQDHgUE9kyO+ba7ZViHQ3VqSuzmveAHcmtugqftlMPcWDTjmQ0ny27+XXCrJ0+/d
 CKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762415203; x=1763020003;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0f5wmX+yoZg0wz1UxGaCZPnItqaKdkuDqolTF8KvNuo=;
 b=VLfz/D/YAjkCPA9D30KoOaXToHUFcp4zTZpWEbJQ/R1fyluAZPnpDOs4elihOwRxpR
 Aim5FDRRG3x0wcchkn0D1XLPNSWaFXrJsotVwTYvAN336hs08A+520TSxR7dV2rI4sR8
 IUM5Lcytlj/ny7dfj2AlE+IO0bTSSOHHwkpfQEG1Q8lyZWAPnmw0eXx2pCHmOvCLP26Y
 GVz3TKVKx5XShMhnpYy5TUDIk/uVTaqboozRf8jfuPZf9vy0PmcMpmCTZ0uKsUP+vS77
 3OzEe/iax2BJoZw+vBZwgpmS2pWMcX9cslMBgVo+UqYQqaAlaDenP0tD7aiaqTZZuauL
 vMZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu+14U61JnZXVCiHL8zylTlxHheFOCrqS9JwRAyYAbWX9o5nfezHeKYOr8QJXHsvO2xuMupPFsLGShSQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzATUPqXauVZOiJ8leDuA+k1FZ6OKtm+ZAaleOCrK5ov5DvoDqJ
 yPvUhHkLXqn5z1ZN/dDF9H9bfWL4UVoCRCVlxg3/+FglW4o9AxntLyR/NmceMG4jbYPXzeOAR0W
 Ew3DTroHc+eLCDCRRg04lqx7FZLbIPa5IOCP1uvGjHA==
X-Gm-Gg: ASbGnctekmlzjyLo5qxxNjwH/27CrNJeZWGtpVpeCFQHP7iGB0ydjtDsmmXAxxbUcIU
 UxvyW3v9UL1u3uODa42fvwmnFVmmaBovV96Xm21lWq13pObQDIPe8fFDYLZkS7cxeK1VJ0/FSeK
 9umCMBz+Plfb7MD0ZVQlchNy88dsR+r27x5fZugfBoGZdEEGFhXV0m3Ajw6Dbe+DOI48XrXi+qE
 5bIeTuoWtiPJvQlocnBPn4avcdQ0o0aPipmUEZ6tS/iDk0Bocsu1yHCy0uDmA==
X-Google-Smtp-Source: AGHT+IFvj7BYATFPUUfyyTquYUZ+XG2ltlcW863lIimOI+3G3/lJLUOzbLQ43b0xX7YM+rdDM6ZeBwU/rpFRv4aSwps=
X-Received: by 2002:a05:6a20:728f:b0:350:ee00:3c9f with SMTP id
 adf61e73a8af0-350ee004101mr3256044637.48.1762415203454; Wed, 05 Nov 2025
 23:46:43 -0800 (PST)
MIME-Version: 1.0
References: <CAKfTPtCtHquxtK=Zx2WSNm15MmqeUXO8XXi8FkS4EpuP80PP7g@mail.gmail.com>
 <20251106000531.GA1930429@bhelgaas>
In-Reply-To: <20251106000531.GA1930429@bhelgaas>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 6 Nov 2025 08:46:27 +0100
X-Gm-Features: AWmQ_bmqVCNR3dJpEZPSNIsk4oiASQ7wTNG-cdh5_x2RX44MkoIq9HcAbtR0V5w
Message-ID: <CAKfTPtA+_VgQQB37Y8qCd6cc5U22kqUkagy2PFnB-5biWUhB9w@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: imx@lists.linux.dev, s32@nxp.com, linux-pci@vger.kernel.org,
 lpieralisi@kernel.org, Frank.li@nxp.com, cassel@kernel.org,
 ghennadi.procopciuc@oss.nxp.com, Christian Bruel <christian.bruel@foss.st.com>,
 kwilczynski@kernel.org, robh@kernel.org, larisa.grigore@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, Ionut.Vicovan@nxp.com,
 Mingkai Hu <mingkai.hu@nxp.com>, bogdan.hamciuc@nxp.com,
 Ghennadi.Procopciuc@nxp.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Richard Zhu <hongxing.zhu@nxp.com>, mani@kernel.org,
 ciprianmarian.costea@nxp.com, bhelgaas@google.com,
 linux-arm-kernel@lists.infradead.org, chester62515@gmail.com,
 Roy Zang <roy.zang@nxp.com>, mbrugger@suse.com,
 Minghuan Lian <minghuan.Lian@nxp.com>, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH 3/4 v3] PCI: s32g: Add initial PCIe
	support (RC)
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

On Thu, 6 Nov 2025 at 01:05, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> [+cc imx6, layerscape, stm32 maintainers for possible suspend bug]
>
> On Fri, Oct 24, 2025 at 08:50:46AM +0200, Vincent Guittot wrote:
> > On Wed, 22 Oct 2025 at 21:04, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Wed, Oct 22, 2025 at 07:43:08PM +0200, Vincent Guittot wrote:
> > > > Add initial support of the PCIe controller for S32G Soc family. Only
> > > > host mode is supported.
>
> > > > +static void s32g_init_pcie_controller(struct s32g_pcie *s32g_pp)
> > > > +{
> > > > ...
> > > > +     /*
> > > > +      * Make sure we use the coherency defaults (just in case the settings
> > > > +      * have been changed from their reset values)
> > > > +      */
> > > > +     s32g_pcie_reset_mstr_ace(pci, memblock_start_of_DRAM());
> > >
> > > This seems sketchy and no other driver uses memblock_start_of_DRAM().
> > > Shouldn't a physical memory address like this come from devicetree
> > > somehow?
> >
> > I was using DT but has been asked to not use it and was proposed to
> > use memblock_start_of_DRAM() instead
>
> Can you point me to that conversation?

https://lore.kernel.org/all/CAKfTPtDcvrAcgFcyFLnzaKnfuU3iB551qed4fnZH=b7Ntkpxpg@mail.gmail.com/

>
> > > > +     s32g_pp->ctrl_base = devm_platform_ioremap_resource_byname(pdev, "ctrl");
> > > > +     if (IS_ERR(s32g_pp->ctrl_base))
> > > > +             return PTR_ERR(s32g_pp->ctrl_base);
> > >
> > > This looks like the first DWC driver that uses a "ctrl" resource.  Is
> > > this something unique to s32g, or do other drivers have something
> > > similar but use a different name?
> >
> > AFAICT this seems to be s32g specific in the RM
>
> It does look like there's very little consistency in reg-names across
> drivers, so I guess it's fine.
>
> > > > +static int s32g_pcie_suspend_noirq(struct device *dev)
> > > > +{
> > > > +     struct s32g_pcie *s32g_pp = dev_get_drvdata(dev);
> > > > +     struct dw_pcie *pci = &s32g_pp->pci;
> > > > +
> > > > +     if (!dw_pcie_link_up(pci))
> > > > +             return 0;
> > >
> > > Does something bad happen if you omit the link up check and the link
> > > is not up when we get here?  The check is racy (the link could go down
> > > between dw_pcie_link_up() and dw_pcie_suspend_noirq()), so it's not
> > > completely reliable.
> > >
> > > If you have to check, please add a comment about why this driver needs
> > > it when no other driver does.
> >
> > dw_pcie_suspend_noirq returns an error and the suspend fails
>
> The implication is that *every* user of dw_pcie_suspend_noirq() would
> have to check for the link being up.  There are only three existing
> callers:
>
>   imx_pcie_suspend_noirq()
>   ls_pcie_suspend_noirq()
>   stm32_pcie_suspend_noirq()
>
> but none of them checks for the link being up.
>
> > I will add a comment
> > /*
> >  * If the link is not up, there is nothing to suspend and resume
>
> Sometimes true, but still racy as I mentioned, and doesn't explain why
> s32g is different from imx, ls, and stm32.
>
> > > > +     return dw_pcie_suspend_noirq(pci);
> > > > +}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
