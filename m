Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC032A95CC
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 12:53:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BF86C3FAD4;
	Fri,  6 Nov 2020 11:53:19 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F13FC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 11:53:15 +0000 (UTC)
IronPort-SDR: Z9bbzuQik9BZXEATAk5yZYU/7evqQi8rsEmlSjlrfwC2cvEDwK9yHZmwyACWxObTRNFb8QVP2R
 FEcqPivpmQvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="187458627"
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; d="scan'208";a="187458627"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 03:53:14 -0800
IronPort-SDR: u5lLLRj4LViCOb/QKvW4vpaGxu7xRftl+vFevt0ogDJ0ptsySK/75DosimeRUmYZquCjychi0+
 MnRticfo+YZQ==
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; d="scan'208";a="307193590"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 03:53:11 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 046CA207BF; Fri,  6 Nov 2020 13:53:08 +0200 (EET)
Date: Fri, 6 Nov 2020 13:53:08 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <20201106115308.GO26150@paasikivi.fi.intel.com>
References: <1604511132-4014-1-git-send-email-hugues.fruchet@st.com>
 <016661fc-e9dd-bd4a-f26d-00e54626f030@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <016661fc-e9dd-bd4a-f26d-00e54626f030@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@st.com>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Alain Volmat <alain.volmat@st.com>, Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 0/4] DCMI BT656 parallel bus mode
	support
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

Hi Alexandre,

On Thu, Nov 05, 2020 at 10:26:37AM +0100, Alexandre Torgue wrote:
> Hi Huges
> 
> On 11/4/20 6:32 PM, Hugues Fruchet wrote:
> > Add support of BT656 embedded synchronization bus.
> > This mode allows to save hardware synchro lines hsync & vsync
> > by replacing them with synchro codes embedded in data stream.
> > Add "bus-type" property and make it required so that there is no
> > ambiguity between parallel mode (bus-type=5) and BT656 mode (bus-type=6).
> > 
> > ===========
> > = history =
> > ===========
> > version 5:
> >    - Add revisited bindings and devicetree with explicit use of "bus-type"
> > 
> > version 4:
> >    - Fix typo in commit message
> > 
> > version 3:
> >    - Fix bus_width print to %u as per Sakari comment
> > 
> > version 2:
> >    - As per Sakari remark, revisit commit message and document
> >      BT656 parallel bus mode in bindings
> > 
> > version 1:
> >    - Initial submission
> > 
> > Hugues Fruchet (4):
> >    media: stm32-dcmi: add support of BT656 bus
> >    media: dt-bindings: media: st,stm32-dcmi: add support of BT656 bus
> >    ARM: dts: stm32: set bus-type in DCMI endpoint for stm32mp157c-ev1
> >      board
> >    ARM: dts: stm32: set bus-type in DCMI endpoint for stm32429i-eval
> >      board
> > 
> >   .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 38 ++++++++++++++++++++++
> >   arch/arm/boot/dts/stm32429i-eval.dts               |  1 +
> >   arch/arm/boot/dts/stm32mp157c-ev1.dts              |  1 +
> >   drivers/media/platform/stm32/stm32-dcmi.c          | 37 +++++++++++++++++++--
> >   4 files changed, 75 insertions(+), 2 deletions(-)
> > 
> 
> I'll take DT patches on stm32-next tree.

Just checking: that is only the two last patches in the set, or also the
binding patch?

-- 
Regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
