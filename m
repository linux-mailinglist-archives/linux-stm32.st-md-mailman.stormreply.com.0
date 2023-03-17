Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 570386BDD42
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Mar 2023 01:00:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C310C69067;
	Fri, 17 Mar 2023 00:00:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A81BC6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Mar 2023 00:00:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 30FF86215E;
 Fri, 17 Mar 2023 00:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16AEC433D2;
 Fri, 17 Mar 2023 00:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679011214;
 bh=W4U2BfVaQ0aO+oyBYlt3Jue0ripQY6SGpEmF8ls7mEY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H5OtqcsX5HfJTH3128KYYQibr1vGA7nrxZcQkyf67dMwbO5S0Sr1gX+fDd+2gPQDh
 RDU5CmrzjF4xoEHdXnKgEFmPYzlsTldrw0z/uXODxCifxAZN1j3Oexrtw6yYi7+JjJ
 rIZMrjaJWb9MM3DGJK7CfOcx877YLH5yKDGFjwjeVYZ+SXobysufainCMf4Qofi47r
 /u0DOUpB8fPA9LgR8hAakSwX28tnzCQYRvKBa7pSUI5OhaPVsdGuBmbQPDsqM6dWKo
 zVYMaPqSKQtCUFMCBlaCJZjYxwhnhNj5nyrWg3w2E5dHrm5v84O7X2dx9axKwgJ1l4
 boEaMFn7ve5UQ==
Date: Thu, 16 Mar 2023 17:00:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Message-ID: <20230316170013.4681d0f3@kernel.org>
In-Reply-To: <20230314070208.3703963-2-michael.wei.hong.sit@intel.com>
References: <20230314070208.3703963-1-michael.wei.hong.sit@intel.com>
 <20230314070208.3703963-2-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
X-Topics: 
Cc: linux-kernel@vger.kernel.org, Voon Weifeng <weifeng.voon@intel.com>,
 netdev@vger.kernel.org, Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S
 . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 1/2] net: stmmac: fix PHY handle
	parsing
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

On Tue, 14 Mar 2023 15:02:07 +0800 Michael Sit Wei Hong wrote:
> +		fixed_node = fwnode_get_named_child_node(fwnode, "fixed-link");
> +		fwnode_handle_put(fixed_node);

fwnode_property_present() ?

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
