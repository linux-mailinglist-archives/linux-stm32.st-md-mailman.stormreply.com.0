Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88178602FD
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2019 11:16:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2FA5C35E01
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2019 09:16:45 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A43AC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2019 09:16:43 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jul 2019 02:16:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,454,1557212400"; d="scan'208";a="363551708"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga006.fm.intel.com with ESMTP; 05 Jul 2019 02:16:38 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 07C2820904; Fri,  5 Jul 2019 12:16:37 +0300 (EEST)
Date: Fri, 5 Jul 2019 12:16:37 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <20190705091637.b5626yvkycumsp6z@paasikivi.fi.intel.com>
References: <1560242912-17138-1-git-send-email-hugues.fruchet@st.com>
 <20190620161721.h3wn4nibomrvriw4@kekkonen.localdomain>
 <ae097d67-58fe-82d7-78d6-2445664f28db@st.com>
 <20190626172503.GB6118@pendragon.ideasonboard.com>
 <b21efe64-7762-308b-c2e5-503589041c35@st.com>
 <20190627133824.GC5021@pendragon.ideasonboard.com>
 <20190705075522.o7kuptdy3p3o64l7@paasikivi.fi.intel.com>
 <20190705080424.GA4994@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705080424.GA4994@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: Yannick FERTRE <yannick.fertre@st.com>,
 Mickael GUENE <mickael.guene@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/3] DCMI bridge support
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

Hi Laurent,

On Fri, Jul 05, 2019 at 11:04:24AM +0300, Laurent Pinchart wrote:

...

> > A reasonable compromise would be to add a Kconfig option that allows
> > enabling MC. This way you can provide backwards compatibility and allow
> > making use of the full potential of the hardware. That's also why hardware
> > that may be part of a non-trivial MC pipeline should start with MC-enabled
> > so we wouldn't run into this.
> 
> I really don't like this, as it introduces additional complexity. My
> recommendation is to go for an MC-centric approach. Going for a video
> node-centric approach is really shooting oneself in the foot regarding
> future extensions. But that being said, if there's a strong desire to go
> for foot self-shooting, the way to go is explained above.

Well, there's nothing that can be done anymore as this has already
happened: this is an existing driver in the mainline kernel. Unless you
have a time machine of some sort, of course. :-) The choice is now really
between breaking existing applications (plain V4L2) and supporting new
functionality (MC-centric), so if you need both, I don't really see another
choice than a Kconfig option.

On the other hand, if we know there are no existing users that could not
support the MC-centric view of the device, we could just change the driver
API and forget the Kconfig option. It'd be much more simple that way
indeed. But I don'k know what's the case.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
