Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11964310218
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Feb 2021 02:08:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B91FAC57B52;
	Fri,  5 Feb 2021 01:08:52 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2076C5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 01:08:51 +0000 (UTC)
IronPort-SDR: VccFS1G2yrfl7Y7IE4MYrS7Yujgiktl6nUo+whdpVTuXlz8GKWWWcQ/zlVLPScJsT8yR/qcALt
 ByBCBWHrKc2Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="266187421"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="266187421"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 17:08:49 -0800
IronPort-SDR: rSfRk5qnf8S7RAXfEShK9dRTrJv8e2F2Uvfi8eVy379xAp/EEV6qVAXAJ39lCYB+uOohpQ5kLa
 1y52B6iOCZvg==
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="393623628"
Received: from jbrandeb-mobl4.amr.corp.intel.com (HELO localhost)
 ([10.212.188.246])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 17:08:49 -0800
Date: Thu, 4 Feb 2021 17:08:48 -0800
From: Jesse Brandeburg <jesse.brandeburg@intel.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Message-ID: <20210204170848.00000aff@intel.com>
In-Reply-To: <1612447396-20351-1-git-send-email-yoong.siang.song@intel.com>
References: <1612447396-20351-1-git-send-email-yoong.siang.song@intel.com>
X-Mailer: Claws Mail 3.12.0 (GTK+ 2.24.28; i686-w64-mingw32)
MIME-Version: 1.0
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Gomes Vinicius <vinicius.gomes@intel.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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

Song Yoong Siang wrote:

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
> Signed-off-by: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
> Signed-off-by: Song, Yoong Siang <yoong.siang.song@intel.com>

Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
