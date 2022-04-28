Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAD551292A
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Apr 2022 03:57:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30DF4C60467;
	Thu, 28 Apr 2022 01:57:57 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66D6DC5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Apr 2022 01:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651111075; x=1682647075;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/vhHc0ORGV2b1XZMIu39ZLL/Kp9lOxc3E0MqPGKIEJE=;
 b=MmjK5U8zwE9fjwx4FRZKtoKA00O2l2yYuYY/zJvpPj+Kkdd6SQkYObqm
 C9ph47zDHBBygO76kFW26/pIWvjbcE5z6pQQ32fJUem8QMFAkHx8+IUff
 W7HT9ckziib2dVJFn72kfdMBN35pMm2iHe4GKcMiXoz+FCJ+2mgASmkpn
 D3Oed5Ye08Yg+P3db/kyvppWHGGwR/1ceN+QtusKcFeCM6WhhtGmAU8Oe
 B6rE8B4h71X+UblQWtKae/iJWwz6rdUFhiKiSK4S2NnzycD8e0p6k0qjC
 ZwnowbpsxVPR8glCFCYK7i5rPkOoCHL96tlidEB6Xoc6zDqfeWyMn8PrF Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="248061159"
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="248061159"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 18:57:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="681605449"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 27 Apr 2022 18:57:52 -0700
Received: from linux.intel.com (ssid-ilbpg3-teeminta.png.intel.com
 [10.88.227.74])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 00BCC580569;
 Wed, 27 Apr 2022 18:57:46 -0700 (PDT)
Date: Thu, 28 Apr 2022 09:55:38 +0800
From: Tan Tee Min <tee.min.tan@linux.intel.com>
To: Kurt Kanzenbach <kurt@linutronix.de>
Message-ID: <20220428015538.GC26326@linux.intel.com>
References: <20220426074531.4115683-1-tee.min.tan@linux.intel.com>
 <8735i0ndy7.fsf@kurt>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8735i0ndy7.fsf@kurt>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Xiaoliang Yang <xiaoliang.yang_1@nxp.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Ling Pei Lee <pei.lee.ling@intel.com>, Ong@vger.kernel.org,
 Tan Tee Min <tee.min.tan@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: disable Split Header
 (SPH) for Intel platforms
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

On Tue, Apr 26, 2022 at 03:58:56PM +0200, Kurt Kanzenbach wrote:
> Hi,
> 
> On Tue Apr 26 2022, Tan Tee Min wrote:
> > Based on DesignWare Ethernet QoS datasheet, we are seeing the limitation
> > of Split Header (SPH) feature is not supported for Ipv4 fragmented packet.
> > This SPH limitation will cause ping failure when the packets size exceed
> > the MTU size. For example, the issue happens once the basic ping packet
> > size is larger than the configured MTU size and the data is lost inside
> > the fragmented packet, replaced by zeros/corrupted values, and leads to
> > ping fail.
> >
> > So, disable the Split Header for Intel platforms.
> 
> Does this issue only apply on Intel platforms?

According to Synopsys IP support, they have confirmed the header-payload
splitting for IPv4 fragmented packets is not supported for the Synopsys
Ether IPs.

Intel platforms are integrating with GMAC EQoS IP which is impacted by the
limitation above, so we are changing the default SPH setting to disabled
for Intel Platforms only.

If anyone can confirm on their platform also having the same issues,
then we would change the SPH default to disable across the IPs.

Thanks,
Tee Min

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
