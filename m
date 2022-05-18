Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C363852C0FC
	for <lists+linux-stm32@lfdr.de>; Wed, 18 May 2022 19:31:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6649EC03FE2;
	Wed, 18 May 2022 17:31:29 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1268C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 May 2022 17:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652895087; x=1684431087;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BoOLoJEyDFfO0iEr6PodmlZMpo8kGeXxw5b90DAP5hw=;
 b=fmxNqrDeszMBNtZTzKSziKYe9oO1rKOsB6XGdrYc5ASErO3l3cFSpkkL
 xA2vSMl8T6hWOYxnRnTK7alMySe3/6/2fypsBAZzV3VjDmaWDABDThreH
 Y5UOQhmaAobQgVmury5l+b6LEZSv8EAjn7BakZqGX0EFz3GK5qOzYEqgU
 i02vKbKIwr1/8AE3j8mgt4pRCOoiydlLOyQSs+9LdnZb+zm9TtHZMSHIu
 VK2fT+gC7WYYc009UfWF1WEyyHZou1g5GxyTIrQJ0qUpOdvDqjY/XVFg/
 qwDHaUHRq8yvk2t79Jnl7efRXt+OmF5elOxee2+ALlzePtEoz7HwDxbdh w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="269375169"
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; d="scan'208";a="269375169"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 10:09:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; d="scan'208";a="605989915"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com)
 ([10.237.72.43])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 10:08:56 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id 79AFF20387;
 Wed, 18 May 2022 20:08:53 +0300 (EEST)
Date: Wed, 18 May 2022 20:08:53 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Message-ID: <YoUoJRzStCnzhxUK@paasikivi.fi.intel.com>
References: <20220516092048.264036-1-hugues.fruchet@foss.st.com>
 <20220516150237.v3xt7onp2lpmellw@uno.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220516150237.v3xt7onp2lpmellw@uno.localdomain>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Alain Volmat <alain.volmat@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: stm32-dcmi: add support of 1X16
 serial pixel formats variant
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

Hi Jacopo,

On Mon, May 16, 2022 at 05:02:37PM +0200, Jacopo Mondi wrote:
> Hi Hugues,
> 
> On Mon, May 16, 2022 at 11:20:48AM +0200, Hugues Fruchet wrote:
> > From: Hugues Fruchet <hugues.fruchet@st.com>
> >
> > Add support of 1X16 serial pixel formats in order to support
> > CSI-2 camera sensor exposing 1x16 pixel formats only.
> >
> > Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> 
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> Sakari, if you're sending a new pull request for the ov5640 series,
> could you include this one as otherwise dcmi would be broken when used
> with that sensor.

Just took this into my tree, with your refreshed ov5640 set.

Thanks!

-- 
Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
