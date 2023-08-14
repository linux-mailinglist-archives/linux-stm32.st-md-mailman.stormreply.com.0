Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C24B377BF98
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Aug 2023 20:14:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C555C6B472;
	Mon, 14 Aug 2023 18:14:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D5B8C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 18:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692036845; x=1723572845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZPxt2QQcAtgeUsWpZ4wBDio4lSa6brn/TkPHu4rCISE=;
 b=m84v/0pJhzUQJ3TXdgCtjUW1Y2+5UF0e/kYQEal9XQOHOkFWhp4aDrNN
 U3xhyAy7tRzAnQ99WRk8EoLciKpxd5pKjYA7OSoS+Mexyl+vS66Q9bTID
 6lAbGwq3qdxBJo1Vw2M5vSPTWpPwU5Fv/EMIYDe21y4NuySm/6Uy1VHsT
 klZyzImeAw2fJbKQNFYDAt6cSYnlKhAGBleRWWZRSocawVkC287izi1sO
 TYge0j67JV/jzZFMrqwRIDeIk2OHc7fEvHbbzuD5lM1YMpqEsRYLjED8V
 cSnamLDtodpG6ap6jZW+jhXdTRfzSpddWFGheB7hEh1yYOAso4BDuGIUX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="438439545"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="438439545"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 11:14:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="877060648"
Received: from pglc00067.png.intel.com ([10.221.207.87])
 by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2023 11:14:02 -0700
From: rohan.g.thomas@intel.com
To: jose.abreu@synopsys.com
Date: Tue, 15 Aug 2023 02:13:54 +0800
Message-Id: <20230814181354.8603-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <DM4PR12MB50889D6CC25880757AB8F146D317A@DM4PR12MB5088.namprd12.prod.outlook.com>
References: <DM4PR12MB50889D6CC25880757AB8F146D317A@DM4PR12MB5088.namprd12.prod.outlook.com>
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

From: Rohan G Thomas <rohan.g.thomas@intel.com>
Date: Mon, Aug 14, 2023 at 15:06:37
> 
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > @@ -219,6 +219,8 @@ struct stmmac_priv {
> >  	int hwts_tx_en;
> >  	bool tx_path_in_lpi_mode;
> >  	bool tso;
> > +	bool tx_q_coe_lmt;
> 
> Please use a flag here instead of "tx_q_coe_lmt". This is the preferrable
> method now.
> 
> Thanks,
> Jose

Thanks Jose for the feedback. If I read that correctly, your
suggestion is to change " tx_q_coe_lmt" to something more readable,
like "has_txcoe_limit". Please correct me if I understand it wrongly.

BR,
Rohan

> 
> > +	u32 tx_q_with_coe;
> >  	int sph;
> >  	int sph_cap;
> >  	u32 sarc_type;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
