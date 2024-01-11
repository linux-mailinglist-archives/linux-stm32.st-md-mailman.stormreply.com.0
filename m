Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C889282ABE8
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jan 2024 11:26:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7045EC6DD66;
	Thu, 11 Jan 2024 10:26:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8BE5C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 10:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704968790; x=1736504790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=75Kadan5gs4ZuP5cPTGG7+GIKF7osPeROaXB2BrU9gM=;
 b=mUMzXeYDiEoAaZMXsmyJrFRUYXVQiOjzTyN03fevuSiyZc3xgEXx9pkt
 6CUITRhntKb5JOWE60nKCjTBJ+icxpt9llVDYweEXYugXFo9VBSb+CAIm
 NzbYbWDY/kKZL0NQ27hV86dlbikLBcXNPBUkz53U6FAUKs4hErZChQR5/
 qiZect1P2puUUxwovAIjQXex3Da4E7Cwivtin5seM/xySiOED63jvl+wR
 wVhy0Jo1f9avm31lsKDxPAc15RSwCmo+Iw+/wY7HGJqXD6GkzzNIoJBc7
 oY+dHlS2rM4lT8cPzsCTVzX6JVcLUqql1N7Zc5LmVv7oqEvdI28Uiu0Cg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="463093410"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="463093410"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 02:26:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="30950728"
Received: from ppglcf0286.png.intel.com ([10.126.161.20])
 by orviesa001.jf.intel.com with ESMTP; 11 Jan 2024 02:26:22 -0800
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: quic_abchauha@quicinc.com
Date: Thu, 11 Jan 2024 18:26:18 +0800
Message-Id: <20240111102618.17734-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <92892988-bb77-4075-812e-19f6112f436e@quicinc.com>
References: <92892988-bb77-4075-812e-19f6112f436e@quicinc.com>
MIME-Version: 1.0
Cc: edumazet@google.com, krzysztof.kozlowski+dt@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 elder@linaro.org, kuba@kernel.org, rohan.g.thomas@intel.com, pabeni@redhat.com,
 ahalaney@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 quic_bhaviks@quicinc.com, robh+dt@kernel.org, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, kernel.upstream@quicinc.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, fancer.lancer@gmail.com,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: TBS support for
	platform driver
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

On Wed, 10 Jan 2024 20:20:39 +0000 : Abhishek Chauhan (ABC) wrote:

> Qualcomm had similar discussions with respect to enabling of TBS for a
> particular queue.
> We had similar discussion on these terms yesterday with Redhat. Adding
> Andrew from Redhat here
> 
> What we discovered as part of the discussions is listed below.
> 
> 1. Today upstream stmmac code is designed in such a way that TBS flag is put
> as part of queue configurations(see below snippet) and as well know that
> stmmac queue configuration comes from the dtsi file.
> 
> //ndo_open => stmmac_open
> int tbs_en = priv->plat->tx_queues_cfg[chan].tbs_en;(comes from
> tx_queues_cfg)
> 
> /* Setup per-TXQ tbs flag before TX descriptor alloc */ tx_q->tbs |= tbs_en ?
> STMMAC_TBS_AVAIL : 0;
> 
> 2. There is a no way to do this dynamically from user space because we don't
> have any API exposed which can do it from user space and also TBS rely on
> special descriptors aka enhanced desc this cannot be done run time and
> stmmac has to be aware of it before we do DMA/MAC/MTL start. To do this
> dynamically would only mean stopping DMA/MAC/MTL realloc resources for
> enhanced desc and the starting MAC/DMA/MTL. This means we are disrupting
> other traffic(By stopping MAC block).
> 
> 3. I dont think there is a way we can enable this dynamically today. I would like
> upstream community to share your thoughts as well.
> 
> 4. I agree with Rohan's patch here and want upstream community to accept it.
> This will allow use to configure the queues where TBS needs to be enabled as
> hardcoding in the code unless upstream has better way to this using
> userspace.
> 
> Please let us know if you think otherwise.
> 
> 

Hi Abhishek,

Thanks for bringing this to discussion and a better explanation from
your side. I agree with you.

Best Regards,
Rohan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
