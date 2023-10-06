Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AD07BB214
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Oct 2023 09:23:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7DACC6C836;
	Fri,  6 Oct 2023 07:23:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C843FC6B478
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 07:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696577009; x=1728113009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mWHcdTvH6aYA57g0fq1YlCnr+8VV/+w6xGLIONT5Tg4=;
 b=NfDzRLyl76bd+xy9LhEMqpsSRa41DO48mZKICR2jEQfm8hMaeAt3crLq
 v6mQ01UgrB6h6bD0Rbmj8Uu9EkFZ9/lWITTu3sE6LxXzS5njZNY4yKBtN
 bFNbhmcpm2UCE+xOUJIcJhIPSUKyJYCRGEMZwVHSlcupJO0l7Yz4G0DO8
 WoMhHXSHoHUdDTAqtLr0jdOxZRd5D730hH/AvtH0M/JR1LJGxwr7LxUxK
 6sBV5uHsD0wQ3oAxkq7bvtKljEcfxr6d0tf5AdQ30nF6cqq9h3DrsnvU4
 MfI62Blb/PA+0HAwe1rcun02JA0il5f3MfcEN/I2bprOjOPVS7llYI386 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="374046254"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="374046254"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 00:23:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="781543497"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="781543497"
Received: from pglc0394.png.intel.com ([10.221.87.72])
 by orsmga008.jf.intel.com with ESMTP; 06 Oct 2023 00:23:22 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: kuba@kernel.org
Date: Fri,  6 Oct 2023 15:23:19 +0800
Message-Id: <20231006072319.22441-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231005070538.0826bf9d@kernel.org>
References: <20231005070538.0826bf9d@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, fancer.lancer@gmail.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, rohan.g.thomas@intel.com,
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

On Thu, 5 Oct 2023 07:05:38 -0700 Jakub Kicinski wrote:
> On Thu, 5 Oct 2023 20:14:41 +0800 Rohan G Thomas wrote:
> > > So the question now is whether we want Rohan to do this conversion
> > > _first_, in DW QoS 5, and then add xgmac part. Or the patch should
> > > go in as is and you'll follow up with the conversion?
> >
> > If agreed, this commit can go in. I can submit another patch with the
> > refactoring suggested by Serge.
> 
> Did you miss the emphasis I put on the word "first" in my reply?
> Cleanup first, nobody will be keeping track whether your fulfilled your
> promises or not :|

Hi Jakub,

Agreed. I'll do the cleanup first.

Best Regards,
Rohan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
