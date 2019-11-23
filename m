Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4280108009
	for <lists+linux-stm32@lfdr.de>; Sat, 23 Nov 2019 19:38:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33736C36B0B;
	Sat, 23 Nov 2019 18:38:49 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04F04C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Nov 2019 18:38:47 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k1so5033201pgg.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Nov 2019 10:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=nDRorgsBSVXUioZFMrZk0EkNmQVKU+AZrP50cmXnyC4=;
 b=uEsVTv/IY5hG62Wu9vwmfYFRVZtJMQEmvbpSxd8EASyANasSlZHDLbnv19sgBybHPZ
 sLaFJZ4ptRzpx2pp8bzaDde5oUsHabEPhJbnYrt8i/cBsmVfH40RjfsGk4MNOWiUF9e0
 p8b0FNKNG2LJhSAXzZGlcy2QGKRkFwep6PbcXeYJxDW2ICh5V5aFtBne8QHoXwSBmeTb
 VOWx7vsReEMXwyuVr4A7IBBksaZ2w0+u512zQ3uiZgWpiuk+uwyT4RU+vS1D9XA58mGM
 j527Jxpoegjg53FzKsvTEvOfUlUWr1ykfKHB1GNaYEGCPObTDePqloRawIEjCkgB6ibX
 NWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=nDRorgsBSVXUioZFMrZk0EkNmQVKU+AZrP50cmXnyC4=;
 b=hjPxLSCEbQVVSA8UAOaBevMp1TQQWK+K4VhWxncQLr5VEWDjZ9p6Lnxr2Py+AearLk
 CY+BQOQDBH8URFefxMWH56lmb8M4fBm0ACc+xL5MhsPQG4KQylIYHBCRgXiSMJwhFO4x
 RGdffX0dZpy22xIf1OiYVW9WamcR0Q/0dYQPdwkys3FeCZXCSzrtJYh5tJtSjn/+8tpJ
 O4oPhiwLAzgLCgQdposYn18oP/qdktqHsNs7grFZBQUgxrQCzOxNxKuXnBkphfPSgxzM
 ErefOUHsoF8ImZphk7++hfAPsFVXhGRGLpwKhiS6NO8vsJdbn7gi9J/QjueAObBMR1sH
 WvGw==
X-Gm-Message-State: APjAAAVJs9AcNI4DEH6NjjSHy5zmG0Hoj5dJfaeggKkdcL2jzcXvNgMx
 CEHnxFKeXxi3p1DGVsRQYRZJiw==
X-Google-Smtp-Source: APXvYqz1czMH9OjFLmttmObRqksQ19SQZuwNAxgR+QJ3jRnmZqw4PC8qOzxHsQAhx9c2AwtLrQZJyw==
X-Received: by 2002:a62:6404:: with SMTP id y4mr24169935pfb.170.1574534326304; 
 Sat, 23 Nov 2019 10:38:46 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net.
 [73.202.202.92])
 by smtp.gmail.com with ESMTPSA id v3sm2350025pfn.129.2019.11.23.10.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2019 10:38:45 -0800 (PST)
Date: Sat, 23 Nov 2019 10:38:40 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Florian Fainelli
 <f.fainelli@gmail.com>
Message-ID: <20191123103840.76c5d63f@cakuba.netronome.com>
In-Reply-To: <20191122092136.GJ25745@shell.armlinux.org.uk>
References: <E1iXaSM-0004t1-9L@rmk-PC.armlinux.org.uk>
 <20191121.191417.1339124115325210078.davem@davemloft.net>
 <0a9e016b-4ee3-1f1c-0222-74180f130e6c@gmail.com>
 <20191122092136.GJ25745@shell.armlinux.org.uk>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: andrew@lunn.ch, nbd@openwrt.org, sean.wang@mediatek.com,
 netdev@vger.kernel.org, peppe.cavallaro@st.com, radhey.shyam.pandey@xilinx.com,
 michal.simek@xilinx.com, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 linux-mediatek@lists.infradead.org, thomas.petazzoni@bootlin.com,
 john@phrozen.org, matthias.bgg@gmail.com, vivien.didelot@gmail.com,
 hkallweit1@gmail.com, David Miller <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Mark-MC.Lee@mediatek.com
Subject: Re: [Linux-stm32] [CFT PATCH net-next v2] net: phylink: rename
 mac_link_state() op to mac_pcs_get_state()
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

On Fri, 22 Nov 2019 09:21:37 +0000, Russell King - ARM Linux admin
wrote:
> On Thu, Nov 21, 2019 at 07:36:44PM -0800, Florian Fainelli wrote:
> > Russell, which of this patch or: http://patchwork.ozlabs.org/patch/1197425/
> > 
> > would you consider worthy of merging?  
> 
> Let's go with v2 for now - it gets the rename done with less risk that
> there'll be a problem.  I can always do the remainder in a separate
> patch after the merge window as a separate patch.

Florian, I assume you asked because you wanted to do some testing?
Please let me know if you need more time, otherwise I'll apply this
later today.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
