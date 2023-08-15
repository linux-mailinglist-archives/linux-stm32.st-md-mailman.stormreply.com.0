Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED10977C67D
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Aug 2023 05:51:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9725AC6B472;
	Tue, 15 Aug 2023 03:51:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0F7BC6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Aug 2023 03:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692071514; x=1723607514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0U5mVMBc7pOFHVeJVlzVG7Zb1up3kpgr5XH1w5CKdFQ=;
 b=czIlcxZpuNdGYzAPRV3LcmyfQg7NZdkbquqyFjIXxsQi5Mdr3RFz/U9f
 IMC6o1OWMCkb6NmkrPEwOFhVI6zV/7p9+rwOZvEdMOeC5M/frV4GJTCQW
 X/wtXxP+FB/p+5SaQAnfFHi9O53pxwtHi5xo86aZwWpnrflmJGlLpSjAq
 nMjokeCLgt7kdRPLgFNlOeNH7afhC2XDAY2qE9n1zxWMJISAGW5AXYwiM
 ge9khM503vOQTRzA4NVID1tuCAPHEcYplq5wBNhm1n4WlDRO6JljqoxTz
 W9WXSfAUmDn/wlfl4sROmHlbgM+Bp0wKpeWO0oQBt8V4p7ZnsmjQ2HnMN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403176411"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="403176411"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 20:51:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="847904364"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="847904364"
Received: from pglc00067.png.intel.com ([10.221.207.87])
 by fmsmga002.fm.intel.com with ESMTP; 14 Aug 2023 20:51:48 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: Jose Abreu <joabreu@synopsys.com>
Date: Tue, 15 Aug 2023 11:51:45 +0800
Message-Id: <20230815035145.16990-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20230814181354.8603-1-rohan.g.thomas@intel.com>
References: <20230814181354.8603-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, peppe.cavallaro@st.com, kuba@kernel.org,
 Rohan G Thomas <rohan.g.thomas@intel.com>, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/2] net: stmmac: Tx coe sw
	fallback
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

From: Rohan G Thomas <rohan.g.thomas@intel.com>
Date: Mon, Aug 14, 2023 at 15:06:37
> > > +	bool tx_q_coe_lmt;
> >
> > Please use a flag here instead of "tx_q_coe_lmt". This is the
> > preferrable method now.
> >
> > Thanks,
> > Jose
> 
> Thanks Jose for the feedback. If I read that correctly, your suggestion is to
> change " tx_q_coe_lmt" to something more readable, like "has_txcoe_limit".
> Please correct me if I understand it wrongly.
> 
> BR,
> Rohan
>

Or, use int instead of bool?

BR,
Rohan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
