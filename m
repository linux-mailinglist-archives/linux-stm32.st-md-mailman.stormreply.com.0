Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C25DB13A129
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2020 07:57:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7967EC36B0D;
	Tue, 14 Jan 2020 06:57:01 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F656C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 06:56:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 22:56:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,431,1571727600"; d="scan'208";a="217650453"
Received: from pgsmsx112.gar.corp.intel.com ([10.108.55.201])
 by orsmga008.jf.intel.com with ESMTP; 13 Jan 2020 22:56:54 -0800
Received: from pgsmsx114.gar.corp.intel.com ([169.254.4.192]) by
 PGSMSX112.gar.corp.intel.com ([169.254.3.207]) with mapi id 14.03.0439.000;
 Tue, 14 Jan 2020 14:56:53 +0800
From: "Ong, Boon Leong" <boon.leong.ong@intel.com>
To: Jakub Kicinski <kubakici@wp.pl>
Thread-Topic: [PATCH net 3/7] net: stmmac: fix missing netdev->features in
 stmmac_set_features
Thread-Index: AQHVyfomk1Civpoau0S27mPh9DveG6foDXcAgAGt5vA=
Date: Tue, 14 Jan 2020 06:56:53 +0000
Message-ID: <AF233D1473C1364ABD51D28909A1B1B75C45CC79@pgsmsx114.gar.corp.intel.com>
References: <1578967276-55956-1-git-send-email-boon.leong.ong@intel.com>
 <1578967276-55956-4-git-send-email-boon.leong.ong@intel.com>
 <20200113051712.73442991@cakuba>
In-Reply-To: <20200113051712.73442991@cakuba>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, "Voon,
 Weifeng" <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Tan, 
 Tee Min" <tee.min.tan@intel.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net 3/7] net: stmmac: fix missing
 netdev->features in stmmac_set_features
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

>On Tue, 14 Jan 2020 10:01:12 +0800, Ong Boon Leong wrote:
>
>Please fix the date on your system.
>
>Please always provide a patch description. For bug fixes description of
>how the bug manifest to the users is important to have.
>
>> Fixes: d2afb5bdffde ("stmmac: fix the rx csum feature")
>>
>
>Please remove the empty lines between the Fixes tag and the other tags
>on all patches.

Thanks for input. Will fix. 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
