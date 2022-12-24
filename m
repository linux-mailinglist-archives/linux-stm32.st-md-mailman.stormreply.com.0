Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8AB6556BD
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Dec 2022 01:35:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E812C6904D;
	Sat, 24 Dec 2022 00:35:30 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6955C69049
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Dec 2022 00:35:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 33ADEB8219E;
 Sat, 24 Dec 2022 00:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D04C433EF;
 Sat, 24 Dec 2022 00:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671842126;
 bh=LLpp2PZGZ3P0jsNiT1jPH0C8VaOxHKoP9r3oMSLo0UI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jSbHXPTiElo1NJ6miNJKdAE8sMAVnHpWLd4GYXOeyP5OpxT0c9oTR0lS16/W2czmd
 zmZo8NfSvM8hcBWVWa+rglOsD+2QwrQ3yrtCeOQ3+aChhjfqj4b1kH3/UVA37zLfUV
 SUTA++yRFAc9yYQsi9jQ6DqpnpbrFV0BXqSjH9vAJ2+r4TjncZLZg23UiKXQWnoxKs
 mcdYg9MLfz7U5L7z6Jt3vu//BXWS4qlN7IvIgBdWz8Q9q+i0Yy9tInKed8Qjtu/me7
 EAuPLXWx4Q8QkE7uAoPziijjcLEOEtF9MDPijOd5R79hOeNIFj6x0I+l2WvxpkrbEe
 n5rlHZWvgoyDA==
Date: Fri, 23 Dec 2022 19:35:25 -0500
From: Sasha Levin <sashal@kernel.org>
To: ChiYuan Huang <u0084500@gmail.com>
Message-ID: <Y6ZJTXFod+4agKiR@sashalap>
References: <20221218160741.927862-1-sashal@kernel.org>
 <20221218160741.927862-70-sashal@kernel.org>
 <20221219010656.GA6977@cyhuang-hp-elitebook-840-g3.rt>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221219010656.GA6977@cyhuang-hp-elitebook-840-g3.rt>
Cc: markgross@kernel.org, hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, lgirdwood@gmail.com, djrscally@gmail.com,
 ChiYuan Huang <cy_huang@richtek.com>, Mark Brown <broonie@kernel.org>,
 mcoquelin.stm32@gmail.com, Yang Yingliang <yangyingliang@huawei.com>,
 platform-driver-x86@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH AUTOSEL 6.0 70/73] regulator: core: Use
 different devices for resource allocation and DT lookup
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, Dec 19, 2022 at 09:07:01AM +0800, ChiYuan Huang wrote:
>On Sun, Dec 18, 2022 at 11:07:38AM -0500, Sasha Levin wrote:
>Hi,
>  Thanks, but there's one more case not considered.
>  It may cause a unexpected regulator shutdown by regulator core.
>
>  Here's the discussion link that reported from Marek Szyprowski.
>  https://lore.kernel.org/lkml/dd329b51-f11a-2af6-9549-c8a014fd5a71@samsung.com/
>
>  I have post a patch to fix it.
>  You may need to cherry-pick the below patch also.
>  0debed5b117d ("regulator: core: Fix resolve supply lookup issue")

I'll take it too, thanks!

-- 
Thanks,
Sasha
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
