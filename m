Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9D750E610
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 18:45:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A126BC60479;
	Mon, 25 Apr 2022 16:45:09 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24317C5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Apr 2022 07:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649921509; x=1681457509;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xTe/USNWGaWU+a+ifxzMMD7mLSnomvLGY2rXT/S2iZk=;
 b=iJW8fCPog+PkkopNiQBEphvwXyn6lXvLHVoiB8JWb5aU5xo+R8piR13f
 /dNbTMhAr3OuICI95cB/Lf+q4OJFQLhDKkDFfVthtHcfR4fxlzvs4Ut5M
 tsOMf0FhBHY3pqq1pI41NUCVj3bpAY3/MwpK7f4dmK4ydZPKnfalEbvUz
 zQl45b2jGcjaQB204k0NUfXWDyi/v+1zKKlT+WXj8bA7Wl5zlzk40qCL0
 2My340a8hkU1B42kSfxiafjgutxxzgPkIb1rVQ8wdD6yJxTiaT2Stq7Ba
 mjxz0t4hf7U8cd3WdcLeUy1XzByyTujfXE+IyixSMUeDp+mVKbnOovnk1 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="263048277"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="263048277"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 00:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="624010417"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 14 Apr 2022 00:31:46 -0700
Received: from linux.intel.com (ssid-ilbpg3-teeminta.png.intel.com
 [10.88.227.74])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 527075807E8;
 Thu, 14 Apr 2022 00:31:42 -0700 (PDT)
Date: Thu, 14 Apr 2022 15:29:34 +0800
From: Tan Tee Min <tee.min.tan@linux.intel.com>
To: Richard Cochran <richardcochran@gmail.com>
Message-ID: <20220414072934.GA10025@linux.intel.com>
References: <20220413040115.2351987-1-tee.min.tan@intel.com>
 <20220413125915.GA667752@hoboy.vegasvil.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220413125915.GA667752@hoboy.vegasvil.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Mon, 25 Apr 2022 16:45:09 +0000
Cc: Song Yoong Siang <yoong.siang.song@intel.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 Tan Tee Min <tee.min.tan@intel.com>,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: add fsleep() in HW
 Rx timestamp checking loop
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

On Wed, Apr 13, 2022 at 05:59:15AM -0700, Richard Cochran wrote:
> On Wed, Apr 13, 2022 at 12:01:15PM +0800, Tan Tee Min wrote:
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> > index d3b4765c1a5b..289bf26a6105 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> > @@ -279,10 +279,11 @@ static int dwmac4_wrback_get_rx_timestamp_status(void *desc, void *next_desc,
> >  			/* Check if timestamp is OK from context descriptor */
> >  			do {
> >  				ret = dwmac4_rx_check_timestamp(next_desc);
> > -				if (ret < 0)
> > +				if (ret <= 0)
> >  					goto exit;
> >  				i++;
> >  
> > +				fsleep(1);
> 
> This is nutty.  Why isn't this code using proper deferral mechanisms
> like work or kthread?

Appreciate your comment.
The dwmac4_wrback_get_rx_timestamp_status() is called by stmmac_rx()
function which is scheduled by NAPI framework.
Do we still need to create deferred work inside NAPI work?
Would you mind to explain it more in detail?

> 
> >  			} while ((ret == 1) && (i < 10));
> >  
> >  			if (i == 10)
> > -- 
> > 2.25.1
> > 
> 
> Thanks,
> Richard

Thanks,
Tee Min
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
