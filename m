Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 535FE54A8E4
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jun 2022 07:49:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0536DC5F1F0;
	Tue, 14 Jun 2022 05:49:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79A96C5EC76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jun 2022 05:49:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3714B61678;
 Tue, 14 Jun 2022 05:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DAFC3411B;
 Tue, 14 Jun 2022 05:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655185758;
 bh=R+0qAAX6efv+AygD/S2OgXLLIy/Y/Bbh3wzi0ZGiAWQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PYNoPUtL9o4blp5GFVcqKknV93aauo63yGEnKIVW30K7HR/1jkDXld2d/XUhxx6/2
 239sw6OgsseZPYwoxf+GT3DKTYlqIcPibec6wchik4vBaRsXllag2VIz0DPZjEpah2
 yRvOqdBds2oqlZC4fmDYQv/WSMEAWOG3HBLObpjFRlykmKy95Gku+w77MOGKLYDxTy
 qZ8WhEnd9eavxACzB+XBITuOTmBK4sS87kRdCSuEoB+pWIEvoqHQT2R3DAg3E0v5uO
 sIsdRkmRM/VGX8V8mnxPb+1d6DE4PG1YkZOjC4vztpSEbOY5iu5v9DTcNLTISR1vYg
 t5QOZCjsc0QPg==
Date: Mon, 13 Jun 2022 22:49:17 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
Message-ID: <20220613224917.325aca0a@kernel.org>
In-Reply-To: <20220609002831.24236-2-ansuelsmth@gmail.com>
References: <20220609002831.24236-1-ansuelsmth@gmail.com>
 <20220609002831.24236-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Mark Mentovai <mark@moxienet.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH 2/2] net: ethernet: stmmac: reset
 force speed bit for ipq806x
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

On Thu,  9 Jun 2022 02:28:31 +0200 Christian 'Ansuel' Marangi wrote:
> +	dn = of_get_child_by_name(pdev->dev.of_node, "fixed-link");
> +	ret = of_property_read_u32(dn, "speed", &link_speed);
> +	if (ret) {
> +		dev_err(dev, "found fixed-link node with no speed");
> +		return ret;

Doesn't this return potentially leak the reference on dn?
You move the of_node_put() right before the if (ret) {

> +	}
> +
> +	of_node_put(dn);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
