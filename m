Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A510B7BB4D1
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Oct 2023 12:08:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59F7FC6C836;
	Fri,  6 Oct 2023 10:08:38 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B26AC6C835
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 10:08:37 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-503f39d3236so2408285e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Oct 2023 03:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696586917; x=1697191717;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=osJYzTdN8E4ajBT02BHqBdC7TAGRf8KWAino8TfH2Do=;
 b=F8aHRv8tNDumnKxvhjdE6PidUtEb6l7H2WxXUkBeJYO++I4w5DkjNeeXG+0BpmEdab
 YMOnSVknR8gWjYDxQ/nYNi2RAhnq4aDAPx1h+ks84QIeSqlXtoFHRIpz0xNVAgHgkhTb
 c49dpxoUKJ91+T4M7lXH4x6xfjvZCSh203qJPy2R7ZprR41FtE70DaowBfOZdh3wthFk
 WFLJCsYHxdwJQ0CiR9Sp7pcn0faTQeBl9oB6l2ExH+u2u8KHF1l1oVm++KmiteKcGWCu
 K16nsYYdn23D+7Sw4iSZhND5LcUqYtA+H5cSm2BhbK6lHcNieMrkeJuJq+ndgSwENAP5
 s40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696586917; x=1697191717;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=osJYzTdN8E4ajBT02BHqBdC7TAGRf8KWAino8TfH2Do=;
 b=m9R2mUoa/fGBz8ly4URM+tvlCxc/MECfmOKYovJpdozpun2QWXM4FWekyi+QLGhnvD
 hJVH/AKAgCyfP4rOQFIFCTFcITsQe0hFeLaR3R0kwoq1FAbaPWEXsmPzyqroiBwIECrT
 8+QSUn9yYA23W7XgEH/PGCngSXwsYYIn+mLnoArXR7hEV/yoLzsDA9C+KH1NKkrjIRtA
 2JMc+zsLkgKA0DxtKMH/n4Eo8aeDBobBXMxoa6rIHsemMpasBs+Gn1otc115Jk4csbmD
 Ax05fxi0kKh/gbX6CSTmTVYq58nb6j/cj+J5GiBP0LQ9SHIA1n+rC1l6Me+h94QgNtYs
 HLLg==
X-Gm-Message-State: AOJu0YxCXkgzVw3sRK+14fO1D5l5M21kBkWtAaxrE7SvrXQa2iEt6aXP
 U79wERq0io/Fen0z8HwI6KI=
X-Google-Smtp-Source: AGHT+IED9GQikXczfKT0cS5GMmyEBz/AdHxccg6OjFgXOMmxPrn1cm+Z3Q6ubL10fyYOPOdv4cLdvQ==
X-Received: by 2002:ac2:5b83:0:b0:503:3787:f75a with SMTP id
 o3-20020ac25b83000000b005033787f75amr6234875lfn.62.1696586916355; 
 Fri, 06 Oct 2023 03:08:36 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a056512040700b00501ce0cacb6sm243567lfk.188.2023.10.06.03.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 03:08:35 -0700 (PDT)
Date: Fri, 6 Oct 2023 13:08:33 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Rohan G Thomas <rohan.g.thomas@intel.com>, 
 Jakub Kicinski <kuba@kernel.org>
Message-ID: <cjgx6e3agc6gpvs75nhkf6wlztk73epmct6tcuooyqvk2nx2o2@vr5buyk637t3>
References: <20231005070538.0826bf9d@kernel.org>
 <20231006072319.22441-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231006072319.22441-1-rohan.g.thomas@intel.com>
Cc: devicetree@vger.kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 andriy.shevchenko@linux.intel.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: xgmac: EST
	interrupts handling
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

Hi Rohan, Jakub

On Fri, Oct 06, 2023 at 03:23:19PM +0800, Rohan G Thomas wrote:
> On Thu, 5 Oct 2023 07:05:38 -0700 Jakub Kicinski wrote:
> > On Thu, 5 Oct 2023 20:14:41 +0800 Rohan G Thomas wrote:
> > > > So the question now is whether we want Rohan to do this conversion
> > > > _first_, in DW QoS 5, and then add xgmac part. Or the patch should
> > > > go in as is and you'll follow up with the conversion?

Jakub, this was my intention if Rohan wouldn't have agreed to perform
the cleanup. Though I couldn't promise to do that in an instant.
I would have needed a month or two to find a free time-spot for that.

> > >
> > > If agreed, this commit can go in. I can submit another patch with the
> > > refactoring suggested by Serge.
> > 
> > Did you miss the emphasis I put on the word "first" in my reply?
> > Cleanup first, nobody will be keeping track whether your fulfilled your
> > promises or not :|
> 
> Hi Jakub,
> 
> Agreed. I'll do the cleanup first.

Rohan, thanks in advance. Although I don't see why it's required to be
done in the prescribed order only as long as the update comes in a
_single_ patchset. Adding EST IRS-status support to XGMAC core module
first, then factoring out both XGMAC and QoS (note both 4.x and 5.x
seems to support that) EST code would be also acceptable. Seeing you
have already done the first part, it would have taken less work in
general.

Jakub, what do you say if Rohan will just re-submit v2 with the
addition cleanup patch and let him to decided whether the cleanup
should be done first or after his XGMAC-EST IRQ update?

> > > Again, thanks Serge for the prompt response. Regarding the below point in your
> > > earlier response,

> > > > > 2. PTP time offset setup performed by means of the
> > > > > MTL_EST_CONTROL.PTOV field. DW QoS Eth v5.x HW manual claims it's "The
> > > > > value of PTP Clock period multiplied by 6 in nanoseconds." So either Jose got
> > > > > mistaken by using _9_ for DW XGMAC v3.x or the DW XGMAC indeed is
> > > > > different in that aspect.
> > > 
> > > This is a little confusing...
> > > I referred databooks for DW QoS Eth v5.30a and DW XGMAC v3.10a. In both this is
> > > mentioned as "The value of PTP Clock period multiplied by 9 in nanoseconds".

Interesting thing. My DW QoS Eth _v5.10a_ HW manual explicitly states
that it's multiplied by _6_ in nanoseconds (just rechecked). So either
there is a difference between the minor DW QoS Eth IP-core releases or
the older HW-manuals have had a typo in the MTL_EST_CONTROL.PTOV field
description. Synopsys normally describes such changes (whether it was
a mistake or a functional change) in the IP-core release notes. The
release notes document is supplied as a separate pdf file. Alas I
don't have one.( Even if I had it it would have been useless since the
change was introduced in the newer QoS IP-cores. Rohan, do you happen
to have the release notes for DW QoS Eth IP-core v5.30 at hands?
Something like DWC_ether_qos_rc_relnotes.pdf?

Also please double check that your DW QoS Eth v5.30a for sure states
that MTL_EST_CONTROL.PTOV contains value multiplied by _6_. So we
wouldn't be wasting time trying to workaround a more complex problem
than we already have.

-Serge(y)

> 
> Best Regards,
> Rohan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
