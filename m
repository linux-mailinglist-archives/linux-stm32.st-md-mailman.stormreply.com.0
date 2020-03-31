Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 455E719982A
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 16:09:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05CBCC36B0B;
	Tue, 31 Mar 2020 14:09:11 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19F71C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 14:09:09 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id s23so8148714plq.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 07:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lR6VI5TqcpXs87/jqJF1QQ+90aJ9QrWV0oJSvVQnRQQ=;
 b=NerzGeyeJ9FlDvkRfrfYofcHkk1qC3VUaxF4QftaGBZgFiHvxgLme+JxPSitUjIZ2K
 WxyCcCHJ2IBY/LwTpk24N1wIhuOf9YOLlNW+Ax52avGP2RXbC8kavph9YpYowrBAVB2G
 7zTJjXqUEPVntcflGR3uHiCvCqj+k1W2MEZwCJKpAMLeH7ws1+poOtDC+Th27crZpiiX
 dOcjbn6JCPaBfHGRc1lQIpyziB9+FRvgCCBT52OGPayKwy5kB5biP49u0y/ecKIDt2nI
 gLR+EgMEXk9GSMajxM66uL3Veta3UgHduYfAvNM9ycGhHmBBxYHhRCG4QJU5/+ixLNd8
 lFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lR6VI5TqcpXs87/jqJF1QQ+90aJ9QrWV0oJSvVQnRQQ=;
 b=HU4Pz+Wi+Ii1zvz0jKCmm3Oi3cZuooTP9H8OiJ/E+9bX6Ccy8x/+iOouJ0cUTjP6y5
 pxSXDhgR5peyXzhw3pWwXDZ1u5QQrkYeEgtuFVci5Ll6v7iT/OmveHKV17yOkPv/uT+J
 xYj9JXdgQ+TcjM7ay7GT7XGik2ZRADOFNaj8Av3SPCPDSruq2642MIctgUpcmf8v0wVs
 iLF9vSIVb2U8pbWLODTdsVHhVDKwbQr0qhvNNzO7mL3YGwvSfjesH1xINkpcaESCpPfH
 0xFoK3AAbzDDvKl/FGs20gnvkvhizqLk/1qznSCaAb0Ep8qpuFv1ZPKiUIJrnhYdfDuq
 HtVQ==
X-Gm-Message-State: AGi0PuZKb4MVHZt7YadKqlAYYed2ztblLoA7SjWhmVjpXHxedeMqyUPL
 ToZLRGcuYV6hDpv0Uke6aTB9
X-Google-Smtp-Source: APiQypJQI4wztmYl4tQwt4Unamf68Lzj4pC8Kzd6EUoCToLjQF+q9P/wSKrMPgIA2c8YIn3iFa4ijw==
X-Received: by 2002:a17:90a:ad8b:: with SMTP id
 s11mr4229381pjq.8.1585663747471; 
 Tue, 31 Mar 2020 07:09:07 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630f:1337:c28:2530:7bf4:e941])
 by smtp.gmail.com with ESMTPSA id q22sm12710566pfn.22.2020.03.31.07.09.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 31 Mar 2020 07:09:06 -0700 (PDT)
Date: Tue, 31 Mar 2020 19:39:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200331140900.GC17755@Mani-XPS-13-9360>
References: <20200331005701.283998-1-marex@denx.de>
 <20200331040736.GA14274@Mani-XPS-13-9360>
 <7dc86fa9-504c-cbc3-9a24-29644d66f9e3@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7dc86fa9-504c-cbc3-9a24-29644d66f9e3@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 00/22] ARM: dts: stm32: Repair AV96
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

On Tue, Mar 31, 2020 at 03:44:52PM +0200, Marek Vasut wrote:
> On 3/31/20 6:07 AM, Manivannan Sadhasivam wrote:
> > Hi Marek,
> 
> Hi,
> 
> > Thanks for the series. 
> > 
> > On Tue, Mar 31, 2020 at 02:56:39AM +0200, Marek Vasut wrote:
> >> The AV96 board device tree is completely broken and does not match the
> >> hardware. This series fixes it up.
> >>
> > 
> > Completely broken?
> 
> The board didn't even boot.
> 

Hmm. I think you're using a new revision of AV96. I added the board support
with an old version of it (might be an evaluation one). I don't have the delta
or changeset so can't compare. Anyway, DH started selling new boards and I
think the old ones were discontinued or not made available for purchase so we
don't have to worry about breaking the old one.

> > The patch submitted previously was an initial one and there
> > were many interfaces not enabled. I agree that there are few _obvious_ things
> > like SDMMC1/Ethernet pinmux, LED naming were wrong. This was due to the fact the
> > board was on early bringup stage and I couldn't test Ethernet due to my setup
> > issue at that time (yeah I know it is bad). Also, I don't get access to DHCOR
> > schematics as well for things like PMIC. Do you have access to it?
> 
> Yes, I do have access.
> 
> > If possible can you share a link to that if available publicly?
> 
> The SoM schematic is not available in public, no, sorry.
> 

Fine. Just wanted to verify the PMIC part. But I got the information from
DH guy offline.

> > I will test this series and also the uboot one on my board and give my
> > Tested-by tag soon.
> > 
> > Anyway, I think the patchset subject could be something like,
> > "Improve AV96 support" :)
> 
> I think if something doesn't work, "Repair" is the right word for it.

Right. Didn't know that it doesn't boot on newer boards. I do have one but
haven't tried mainline kernel on it, just vendor image for some demos. But
feel free to keep it as it is.

Thanks,
Mani

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
