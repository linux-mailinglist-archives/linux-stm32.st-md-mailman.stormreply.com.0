Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9694275D8D4
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jul 2023 03:56:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DDE4C6A61D;
	Sat, 22 Jul 2023 01:56:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EB55C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Jul 2023 01:56:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 016A661D2F;
 Sat, 22 Jul 2023 01:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DDFBC433C7;
 Sat, 22 Jul 2023 01:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689990959;
 bh=YIMeHkWDQz0s9WX+GvHlnTsrUYqiF/JbCOjQIvlM93w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QtG+EqkDWjYmXfT6W2+RRIIw3VCT7iNprPoryweITTLIZQAFRd3gVufVMWUxmmsul
 HCKR1AN0lxPA3hmXAiLaXAVRuKsI2gc+opDB2OjYyOMIdj3TpUcB4uZAXG84LT8AiK
 Ris27qqhb6z6/DcvMi6iORTY3J9T2iSD6evm9sIK4BvedCmlTyRcPW+QhpL4MA5ki1
 tiYrRGQaOBr/oeJ9jfuUtH1bDrayxlOTcNcAMpk5oNHYJKqSvVAz6YFQnU6zDNti4W
 5+SDb60GfJEblfk6305HyRSK2/rf1QC2g91xGVXnUyhaq9GCzeaU6tQ3SZv4zmLkO+
 VMBF6BtTXD6YA==
Date: Fri, 21 Jul 2023 18:55:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20230721185557.199fb5b8@kernel.org>
In-Reply-To: <8e2f9c5f-6249-4325-58b2-a14549eb105d@kernel.org>
References: <20230721062617.9810-1-boon.khai.ng@intel.com>
 <20230721062617.9810-2-boon.khai.ng@intel.com>
 <e552cea3-abbb-93e3-4167-aebe979aac6b@kernel.org>
 <DM8PR11MB5751EAB220E28AECF6153522C13FA@DM8PR11MB5751.namprd11.prod.outlook.com>
 <8e2f9c5f-6249-4325-58b2-a14549eb105d@kernel.org>
MIME-Version: 1.0
Cc: Shevchenko Andriy <andriy.shevchenko@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Ng,
 Boon Khai" <boon.khai.ng@intel.com>, "Tham, Mun Yew" <mun.yew.tham@intel.com>,
 "Boon@ecsmtp.png.intel.com" <Boon@ecsmtp.png.intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "Khai@ecsmtp.png.intel.com" <Khai@ecsmtp.png.intel.com>, "Swee,
 Leong Ching" <leong.ching.swee@intel.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joe Perches <joe@perches.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "G Thomas, Rohan" <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Subject: Re: [Linux-stm32] [Enable Designware XGMAC VLAN Stripping Feature
 1/2] dt-bindings: net: snps, dwmac: Add description for rx-vlan-offload
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

On Fri, 21 Jul 2023 18:21:32 +0200 Krzysztof Kozlowski wrote:
> > $ ./scripts/get_maintainer.pl  --scm  -f drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c  
> 
> That's not how you run it. get_maintainers.pl should be run on patches
> or on all files, not just some selection.

Adding Joe for visibility (I proposed to print a warning when people 
do this and IIRC he wasn't on board).
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
