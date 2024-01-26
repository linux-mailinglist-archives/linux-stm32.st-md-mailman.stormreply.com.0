Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E19783E6BC
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Jan 2024 00:22:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A483C6DD70;
	Fri, 26 Jan 2024 23:22:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A023C6DD6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 23:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706311361; x=1737847361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k1lLM/lKfVzuiaAVJaAchBIOPdQQvb8bXl1o4bfTGKI=;
 b=aTESDSaOprXvkJxDb2iqJ8fJPwf+Sb7I8g5DPVWspvUppNm7XlhnId86
 1XicQq9R6IEV5fN2pVR98G1Q3Reqf+/B6G9fDIo5B1Hc16p1RtOnXDNml
 Tc81o+BWlZ8MFMZ76UTap9ZPtD+NU/HW7tcYU3MUXn4VyDWtP/RPG2cH3
 sgEus7nXYQY3m8hJCKIHrFg/vzuKZUNK+XoVU7Ay26E+zY7pkwRLjw0xD
 otBGTzArSkfT+w2GuuxktGhP3zK+XHqQaqPxKlDq+Liix79K2lD+BXyx+
 ZL0Fx4JOJ6gynnRCRJ68xh68OpsXnHfIC+izvpSiumCLLdQKmBmmL4Dqv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="24065218"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="24065218"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 15:22:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="736831999"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="736831999"
Received: from ppglcf2090.png.intel.com ([10.126.160.96])
 by orsmga003.jf.intel.com with ESMTP; 26 Jan 2024 15:22:34 -0800
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: kuba@kernel.org
Date: Sat, 27 Jan 2024 07:22:30 +0800
Message-Id: <20240126232230.15733-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20240126121928.48a44327@kernel.org>
References: <20240126121928.48a44327@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 robh@kernel.org, netdev@vger.kernel.org, esben@geanix.com,
 linux-stm32@st-md-mailman.stormreply.com, fancer.lancer@gmail.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 krzysztof.kozlowski+dt@linaro.org, peppe.cavallaro@st.com,
 rohan.g.thomas@intel.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] dt-bindings: net: snps,
	dwmac: Time Based Scheduling
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

On Fri, 26 Jan 2024 12:19:28 -0800, Jakub Kicinski wrote:
> > > The tricky part here is that the whole devicetree bindings story for the
> > > stmmac driver is filled with such configuration choices. As such, it is
> > > only natural to add the property you are suggesting here. I completely
> > > agree. But you can also argue that it is "wrong", because it does not
> > > just describe the hardware, but also a configuration choice.
> >
> > Isn't this requirement of using enhanced tx desc instead of normal tx
> > desc to support TBS is specific to Synopsys IP? Switching from
> > normal desc to enhanced desc at the time of tc-etf qdisc offload
> > cannot be done without traffic disruption, which I don't think is
> > acceptable. Since this behavior is IP specific, can we consider
> > this as an OS configuration choice?
> 
> Why is traffic disruption not acceptable when TBS gets turned on?
> User has to install the right qdisc to enable TBS, I presume,
> installing qdiscs destroys the old ones which also leads to packet
> drops.

Hi Jakub,

Agreed that packet loss is acceptable during qdisc install.

Sorry, I'm a little out of context in the above statements.
Switching between normal and enhanced desc is really not needed as
enhanced desc can support transmission of packets that don't have any
launch time also. So for any tbs supported queues we can enable
enhanced desc for tbs during stmmac_open itself.

As I mentioned in my previous reply:

> > Agreed that this feature(use of enhanced desc) can be enabled from
> > glue drivers. But I added this dt property, thinking this feature is
> > specific and common to DWMAC core and we can enable this feature for
> > stmmac platform driver without a glue driver. If this is not
> > acceptable, I can think of doing this from the glue driver.

Like Esben mentioned I think enabling tbs_en flag explicitly from the
glue driver is the way to enable tbs support for a tx-queue right now.

BR,
Rohan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
