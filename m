Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C882F41AA14
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Sep 2021 09:49:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 700E4C5A4D0;
	Tue, 28 Sep 2021 07:49:53 +0000 (UTC)
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6F6DC57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Sep 2021 07:49:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 46945580C56;
 Tue, 28 Sep 2021 03:49:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 28 Sep 2021 03:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=W1gTysFUCeHCFA697MxJ7RHRRe/
 6ka4WMwz+p8/IZsg=; b=hEojnP22XPcGnEnxkVQa4yKcHzpbA5C4R8n21q/flzo
 Z7/18QIyEjpb4D70QOmLH6DLs8TgYkPB9aalehoUrc2OHvwD7pOUjJqdWgmh06w1
 C/GLUQqWEhxFjHepQmy0LC/DqFaU+cVoofEFfJCH4KnzF3fdwfVo6gINnv9MUwRa
 MItl2MCT7R0x5/kIIOzQNFdAyc3iQ9NJfDcakjdjuz6Nll+W89XPTH7jph9ziRKL
 TASTIKT+3hNbsIMQZBq0wcGiGvLQ3zjB3nxF79qSm+ofvhBPWZL6ecK9aHITirii
 DquuJLYoen09F7+KGfsp6dl6iSCf12+cbBBOwuqELGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=W1gTys
 FUCeHCFA697MxJ7RHRRe/6ka4WMwz+p8/IZsg=; b=uRdWG9QqQbQi8PgDbRACtw
 kHFp5cFmNnlCIheCsKPpL5H8fLb50fqptgpfkDnfTSI6fvUJ1a1F26eWdumVY2IK
 q/4yJ8gjydEbODr+9OpuJA6oS+zkT+RKbwdrL6LHUQnZskPW/l2iEeeLDgIiQxLr
 O4mUP0NT82prseC1ijBDW8To/s8RqAO8YWkosl+crm8TDivCwhUYsND+eEbVaNox
 kuy9tGYWfqZruXpvLCUQkJ88RwSfNWMT8MdutRfjbwsbpd799Liw3trJY1AIxNut
 3NPuceCXSRjDYzyOxTyItRPa4A8psIbLOqkouoRHaHZe6KJzUL/L6h6huyjI0TmA
 ==
X-ME-Sender: <xms:HMlSYTgfgHC1NMelg3XOGENjEUQTCCwvwWorJsdmDfSG0FGWSdG3Ag>
 <xme:HMlSYQC3L6IKKzfdB9OF6qmwgCgA5MxPzhj8EnASQTo0f4MhgcbLj02Ajh3XJEb4R
 2fqPLI5BrfM5A>
X-ME-Received: <xmr:HMlSYTFDG5i2jDLoEeW2-0xcDtwhGAwzSCEq83zWPEr8vZHUk97I8vwQIlnR4xHDbAANeyhRwZk3o7HA7kGM5UzjLhDy6ztR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejledguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
 ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:HMlSYQQOCfaa1Q4DUgvAIgMU659QePbUU65zRvSepId7Linfkl6cAA>
 <xmx:HMlSYQxUZoTxx9bBPG1zkJna2lup90jKHc-j0HXUC5OOJQ3c_NJr3g>
 <xmx:HMlSYW4tC7MQnQ4J5RvzcN1MPkyFI7JlUf1WO7bndCGnJZCJ1mS5uw>
 <xmx:HclSYRS4PI7qTS6AGin8LTYIYAeF-m3qJu2umnsKShY-JX6Cb7RpkQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 03:49:48 -0400 (EDT)
Date: Tue, 28 Sep 2021 09:49:45 +0200
From: Greg KH <greg@kroah.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Message-ID: <YVLJGT7JAVc7rnBx@kroah.com>
References: <20210927104500.1505-1-macpaul.lin@mediatek.com>
 <20210928074349.24622-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928074349.24622-1-macpaul.lin@mediatek.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, Leon Yu <leoyu@nvidia.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Fabien Parent <fparent@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, Pablo Sun <pablo.sun@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bear Wang <bear.wang@mediatek.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Macpaul Lin <macpaul@gmail.com>
Subject: Re: [Linux-stm32] backport commit ("31096c3e8b11 net: stmmac: don't
 attach interface until resume finishes") to linux-5.4-stable
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

On Tue, Sep 28, 2021 at 03:43:49PM +0800, Macpaul Lin wrote:
> Hi reviewers,
> 
> I suggest to backport 
> commit "31096c3e8b11 net: stmmac: don't attach interface until resume finishes"
> to linux-5.4 stable tree.
> 
> This patch fix resume issue by deferring netif_device_attach().
> 
> However, the patch cannot be cherry-pick directly on to stable-5.4.
> A slightly change to the origin patch is required.
> I'd like to provide the modification to stable-5.4 if it is needed.

Ok, can you please send a properly backported patch so that we can apply
it?

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
