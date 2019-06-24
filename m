Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB663519EA
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2019 19:46:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC023C57DD7
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2019 17:46:39 +0000 (UTC)
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3516C57DD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2019 17:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1561398397; bh=l26+171beDHOxmBA8VQOvSCiteWk45rGxm72YTM5O5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pegVqKhp8mz968SWeU+w2vKRP6a4dc5+dBNm3nxwjuqAnevGGPHI4ZwfoFTXH8rjC
 thu7zSl6O4mdMXvGt7ZiNDk2BDZdMjeXRx4UwQIv7JVVJa+Df0sZPc6ZKAo7frELlZ
 9z4OGEpcrYnbZdEHdsuYFHIY74nf+gLab1TwBX54=
Date: Mon, 24 Jun 2019 19:46:37 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: David Miller <davem@davemloft.net>
Message-ID: <20190624174637.6sznc5ifiuh4c3sm@core.my.home>
Mail-Followup-To: David Miller <davem@davemloft.net>,
 linux-sunxi@googlegroups.com, maxime.ripard@bootlin.com,
 wens@csie.org, robh+dt@kernel.org, jernej.skrabec@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
 peppe.cavallaro@st.com, alexandre.torgue@st.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20190620134748.17866-1-megous@megous.com>
 <20190624.102927.1268781741493594465.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624.102927.1268781741493594465.davem@davemloft.net>
Cc: mark.rutland@arm.com, joabreu@synopsys.com, devicetree@vger.kernel.org,
 maxime.ripard@bootlin.com, netdev@vger.kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org, airlied@linux.ie,
 linux-sunxi@googlegroups.com, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 0/6] Add support for Orange Pi 3
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

On Mon, Jun 24, 2019 at 10:29:27AM -0700, David Miller wrote:
> From: megous@megous.com
> Date: Thu, 20 Jun 2019 15:47:42 +0200
> 
> > From: Ondrej Jirman <megous@megous.com>
> > 
> > This series implements support for Xunlong Orange Pi 3 board.
> > 
> > - ethernet support (patches 1-3)
> > - HDMI support (patches 4-6)
> > 
> > For some people, ethernet doesn't work after reboot (but works on cold
> > boot), when the stmmac driver is built into the kernel. It works when
> > the driver is built as a module. It's either some timing issue, or power
> > supply issue or a combination of both. Module build induces a power
> > cycling of the phy.
> > 
> > I encourage people with this issue, to build the driver into the kernel,
> > and try to alter the reset timings for the phy in DTS or
> > startup-delay-us and report the findings.
> 
> This is a mixture of networking and non-networking changes so it really
> can't go through my tree.
> 
> I wonder how you expect this series to be merged?
> 
> Thanks.

This series was even longer before, with patches all around for various
maintainers. I'd expect that relevant maintainers pick the range of patches
meant for them. I don't know who's exactly responsible for what, but I think,
this should work:

- 2 stmmac patches should go together via some networking tree (is there
  something specific for stmmac?)
- all DTS patches should go via sunxi
- hdmi patches via some drm tree

thank you and regards,
	o.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
