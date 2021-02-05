Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B87AE312B39
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 08:43:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED787C57189;
	Mon,  8 Feb 2021 07:43:48 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C1BCC3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 22:39:17 +0000 (UTC)
IronPort-SDR: mqW9QPVDjFGHm6Fy6aeRiLQS6TBbEWxjoRLKTA9e3nVd9aBcHzBr0lhKfLbvzDm3z0Vpn26ZMu
 MFWuiqARicFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="177991643"
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="177991643"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 14:39:15 -0800
IronPort-SDR: KFM8S8tiDOmPq7MD68erqsL7cRkFyJbtugSKuT6jXOfB2SS0Ua3XNKA6uUnESEWmyhRTtrCDFC
 AGacYmQyPwAA==
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="373541870"
Received: from iayoung-mobl1.amr.corp.intel.com (HELO
 vcostago-mobl2.amr.corp.intel.com) ([10.212.100.97])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 14:39:14 -0800
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S .
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>
In-Reply-To: <1612447396-20351-1-git-send-email-yoong.siang.song@intel.com>
MIME-Version: 1.0
References: <1612447396-20351-1-git-send-email-yoong.siang.song@intel.com>
Date: Fri, 05 Feb 2021 14:38:57 -0800
Message-ID: <8735yap2bi.fsf@vcostago-mobl2.amr.corp.intel.com>
X-Mailman-Approved-At: Mon, 08 Feb 2021 07:43:46 +0000
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: set TxQ mode back to
 DCB after disabling CBS
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

Song Yoong Siang <yoong.siang.song@intel.com> writes:

> From: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
>
> When disable CBS, mode_to_use parameter is not updated even the operation
> mode of Tx Queue is changed to Data Centre Bridging (DCB). Therefore,
> when tc_setup_cbs() function is called to re-enable CBS, the operation
> mode of Tx Queue remains at DCB, which causing CBS fails to work.
>
> This patch updates the value of mode_to_use parameter to MTL_QUEUE_DCB
> after operation mode of Tx Queue is changed to DCB in stmmac_dma_qmode()
> callback function.
>
> Fixes: 1f705bc61aee ("net: stmmac: Add support for CBS QDISC")
> Suggested-by: Gomes, Vinicius <vinicius.gomes@intel.com>

Just a nitpick/formality, I would prefer if you used:

Suggested-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>

> Signed-off-by: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
> Signed-off-by: Song, Yoong Siang <yoong.siang.song@intel.com>

Patch looks good.

Acked-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>

Cheers,
-- 
Vinicius
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
