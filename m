Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4120878500D
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Aug 2023 07:45:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E230CC6B44B;
	Wed, 23 Aug 2023 05:45:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B8E0C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 05:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692769548; x=1724305548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R2TL6b1MYDr/wlMkuqOdkcsygBWR2VrvBGwVxB879fs=;
 b=XCr1xgL/nlhftqmF0H0B3DIS62IrwXFoDdKMgBDwWgPwD8JU5sSsXm8f
 JudYY85FUpMk61LQ87jWvtE2iuhwIFncm1blQ0P58h+VuUUg8zZWJhIjA
 Vf86SBpJV7EopQG5ru8z1g5X/5m1vZkFm38FQrJKuZiHtDPULgAd/e+ye
 BqZ+yj4i4zBg/XuNAq3D/kHPXQPCqiqyBJDodFICSf91RcqRGA1pU3E7d
 xax+Ekf063rrjveWPeZ5J9ZJKZYHlx4Btc95GDY1/qD7hFm48VT6Iz6Yy
 Iyx0xj76vbiCiOkOJNdoe7JC8w26mBzTqrBzff8+rm8GwqUs7/H1tD9M1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372962258"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="372962258"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 22:45:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="713435761"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="713435761"
Received: from pglc00067.png.intel.com ([10.221.207.87])
 by orsmga006.jf.intel.com with ESMTP; 22 Aug 2023 22:45:41 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: kuba@kernel.org
Date: Wed, 23 Aug 2023 13:45:37 +0800
Message-Id: <20230823054537.23328-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20230822171525.692bd2df@kernel.org>
References: <20230822171525.692bd2df@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, conor.dooley@microchip.com,
 linux-stm32@st-md-mailman.stormreply.com, fancer.lancer@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, edumazet@google.com,
 joabreu@synopsys.com, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, rohan.g.thomas@intel.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 1/2] dt-bindings: net: snps,
	dwmac: Tx queues with coe
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

On Sat, 19 Aug 2023 10:31:31 +0800 Rohan G Thomas wrote:
>> +      snps,tx-queues-with-coe:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description: number of TX queues that support TX checksum 
>> + offloading
>
>Is it going to be obvious that if not present all queues support checksum offload? I think we should document the default.

Agreed. Will add this in the next version.

BR,
Rohan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
