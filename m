Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E32D07A2E28
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Sep 2023 08:17:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71401C6B47C;
	Sat, 16 Sep 2023 06:17:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07581C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Sep 2023 06:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694845048; x=1726381048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dpw80PtFYNDVGjI+iulRnzMBDHhLG8ZhcBIQvgHxF4s=;
 b=ka3Rgi9a+ae0yT9X8nPwgzQfui1vZpi7wU9kbJ/ddheleTSfLRpbei+d
 iYUR/zHpalQJUW4Et18aSaGjJmhy+8UU0I39JXPGeAAj4eAIxMZKeSkA3
 OZ9iX4SJZUe0fLc4OV9FuZmsP2I1Zd2x32IAXI/sC7SvPdUVrZiAZvMTx
 71NZiiE5ghcgEVBF/HKeXgVVdSSVIys3i4yd8pjZf5P1fmpSOA1p0GMvD
 XqhgmXKWGZTWJsMwlgkVsZ8pVUa1EGfQAfBGOBDUC+aH/6feaZOSQN/TL
 j5/Mg2cp8uNSRSWK2gzxfdgVlHZXEDrxyAzMqxvP9I8cu5DAexZArs0zd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="443461812"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; d="scan'208";a="443461812"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 23:17:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="738564989"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; d="scan'208";a="738564989"
Received: from pglc00032.png.intel.com ([10.221.207.52])
 by orsmga007.jf.intel.com with ESMTP; 15 Sep 2023 23:17:21 -0700
From: rohan.g.thomas@intel.com
To: robh@kernel.org
Date: Sat, 16 Sep 2023 14:17:18 +0800
Message-Id: <20230916061718.336-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915154258.GA3769303-robh@kernel.org>
References: <20230915154258.GA3769303-robh@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, edumazet@google.com,
 joabreu@synopsys.com, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, kuba@kernel.org, rohan.g.thomas@intel.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [linux-drivers-review] [PATCH net-next v2 1/3]
	net: stmmac: xgmac: EST interrupts handling
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

Thanks for the review comments.
Will address this in the next version.

On Fri, Sep 15, 2023 at 05:54:16PM +0800, Rohan G Thomas wrote:
>> Add dt-bindings for coe-unsupported property per tx queue.
>
>Why? (What every commit msg should answer)
>
>> 
>> Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
>> ---
>>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> index ddf9522a5dc2..365e6cb73484 100644
>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> @@ -394,6 +394,9 @@ properties:
>>                When a PFC frame is received with priorities matching the bitmask,
>>                the queue is blocked from transmitting for the pause time specified
>>                in the PFC frame.
>
>blank line needed
>
>> +          snps,coe-unsupported:
>> +            type: boolean
>> +            description: TX checksum offload is unsupported by the TX queue.
>
>And here.
>
>>          allOf:
>>            - if:
>>                required:
>> -- 
>> 2.25.1
>> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
