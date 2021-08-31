Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B123FCC14
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Aug 2021 19:10:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC360C57B7A;
	Tue, 31 Aug 2021 17:10:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE38CC5718F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Aug 2021 17:10:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF8D6610E7;
 Tue, 31 Aug 2021 17:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630429825;
 bh=SGthlE0tQcMKpKjS99fGoaAVfKC/MRfiSGJ7XgdTMp8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DksdIv0u7iVWQU3Sh6CAnRCqvOP7QkB8EwwOP5Iuz3SKfuiVKhfigCLHsUnQAG8/9
 bYk6ccn7Z0MCrZWMRt4+emPh3jk4fxXIrZoCFt4RDbx8RJIpQgffqc3pKzXsoolTEN
 khMMXeHXkVNctplMAEeV5B7sL90HcrPMwcKzXp3oCGsFKrn1MhQ8VZxGwK1BJjlsVN
 aj4R8AfmvPCIjUrhsKAQ0oyNlComIaogc1VT66walKdelkBGjvugJEXR/jUHRr3tFB
 i1Rd/pktp+Qfpq8HOzJApj9wf5+SK4I4dXF0RzFV2PLDG7BhU8KUOYMrtRHQ+wcYqS
 g0H+PLXVcYXfg==
Date: Tue, 31 Aug 2021 10:10:23 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: zhaoxiao <zhaoxiao@uniontech.com>
Message-ID: <20210831101023.53c3f67b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210831012523.2691-1-zhaoxiao@uniontech.com>
References: <20210831012523.2691-1-zhaoxiao@uniontech.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 John 'Warthog9' Hawley <warthog9@kernel.org>, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] stmmac: dwmac-loongson: change the
 pr_info() to dev_err() in loongson_dwmac_probe()
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

On Tue, 31 Aug 2021 09:25:23 +0800 zhaoxiao wrote:
> Change the pr_info to dev_err.
> 
> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>

Your patches seem to not show up on the netdev mailing list.
They do make it to lkml and linux-arm tho, strangely.

Are you seeing any errors when sending them?

Please repost this one and CC warthog9@kernel.org - let's see 
if it gets thru..
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
