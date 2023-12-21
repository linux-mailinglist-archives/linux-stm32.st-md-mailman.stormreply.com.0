Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF85A81B1BD
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 10:11:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EB83C6C841;
	Thu, 21 Dec 2023 09:11:09 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF7EAC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 09:11:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 2DDCDB81F9A;
 Thu, 21 Dec 2023 09:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B60C433C8;
 Thu, 21 Dec 2023 09:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1703149867;
 bh=/WzNv9MnpdH5DL+RbcHgW/lhQEnlhmwuWZbe7H2FjoI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zbt+M9FvnqygUuM7jlyguqNlW2VmMiyfgcxqdiEa3FDBXrccfvI55WRXCFP5zcIrl
 jWL/AidAA8QFWGEt6e6VJyeOh0sQv36uLT2RzJQCClFYma8Dl/19W5HYdmNAQLC4p8
 b/dZVANnIoJp+s3NmVmALYa6SKFkzZBaTHMVBI3A=
Date: Thu, 21 Dec 2023 10:11:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Gan, Yi Fang" <yi.fang.gan@intel.com>
Message-ID: <2023122141-smuggling-confidant-d1d8@gregkh>
References: <20231221085109.2830794-1-yi.fang.gan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221085109.2830794-1-yi.fang.gan@intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Weifeng <weifeng.voon@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Eric Dumazet <edumazet@google.com>, John Stultz <jstultz@google.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, Choong Yong Liang <yong.liang.choong@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net v2 0/2] Fix phylink unloadable issue
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

On Thu, Dec 21, 2023 at 04:51:07PM +0800, Gan, Yi Fang wrote:
> Add module_exit_stub() for phylink module.
> 
> Changes since v1:
> - Introduce a helper macro for module_exit() boilerplate
> 
> This series is the combination of following:
> v1 with empty phylink_exit():
> https://lore.kernel.org/all/20231127101603.807593-1-yi.fang.gan@intel.com/
> v1 of module_exit_stub():
> https://lore.kernel.org/all/20231212094352.2263283-1-yi.fang.gan@intel.com/

As I said before, no, this isn't ok.  Why just resubmit a patch when
it's already been rejected?

This patch series should NOT be accepted as-is, you know this!

Also, you are not following the documented and REQUIRED rules for Intel
developers to be submitting kernel patches, so on that reason alone
these need to be rejected.

Please work with the Intel internel developers to do this correctly if
you wish to submit this again in the future.

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
