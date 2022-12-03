Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CC86417AC
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Dec 2022 17:07:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69070C65E59;
	Sat,  3 Dec 2022 16:07:26 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F10AC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Dec 2022 16:07:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D7157B8069C;
 Sat,  3 Dec 2022 16:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2F4C433C1;
 Sat,  3 Dec 2022 16:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670083643;
 bh=Cxm5cX1/vRr6rTVftoIlwySvdfgJ/QgkmcVNP/aI/3s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rZxwQvjDdNkLrpGiIC1dofLAzcSqRi2r+jlxMyuBRKl9bCsujpO+QhkAC5XndgNh6
 oz2RBT5LJwCuqzg3S1tmbbMJBgM4gkTbu5plpNTfdfjQyxy5GmNWFF/BTytFREh7ya
 X6w7Du1Y3o1u5XqVaHuKyebCjTCAm9GBkaXrkyBBhNFQEFr64LR7blH8/Z9Z2DAFFb
 BpIfc7CNKJ4VJ3Dm/ZRONw8MaKayBodAcE7llWu6FHQsD2WZ7J0YwD0oFhtYeY8q0Q
 5yMWH4B6CZfP5jlgfHts1bhjUq3r4otcHjraXOUDstOe0GIfmVzwxpUSEFg6rzNRg7
 vTHyQtftG4RLA==
Date: Sat, 3 Dec 2022 16:20:08 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <william.gray@linaro.org>
Message-ID: <20221203162008.007df587@jic23-huawei>
In-Reply-To: <Y4KuBicVeRAsfqxq@fedora>
References: <Y0vzlOmFrVCQVXMq@fedora>
 <ec6b8983-1567-92c8-f1cd-baf970ca4046@foss.st.com>
 <Y4KuBicVeRAsfqxq@fedora>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, benjamin.gaignard@st.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] Removing the last of IIO_COUNT
	(stm32-timer-trigger)
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

...

> > ---
> > To conclude, there some open items here, but hopefully nothing blocking.
> > In case we sort all these, this will allow to remove the IIO_COUNT
> > channel (along with the IIO device) being registered.  
> 
> I'm certain Jonathan will want some sort of deprecation schedule first
> to make sure any existing users have time to migrate to the Counter
> interface before we remove the IIO one, but it will give me a nice
> feeling of completion to see the last of IIO_COUNT superceded by the
> Counter interface. ;-)

If there is nothing in tree, I'm fine 'removing' it. However, note
that we'll have to keep a placeholder for some of the defines to avoid
renumbering other types etc.  So probably just stick a couple of underscores
in front to make it __IIO_COUNT and add a comment to say it should not be used.

Jonathan

> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
