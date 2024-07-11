Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7479D92E493
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jul 2024 12:26:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2516DC6DD9D;
	Thu, 11 Jul 2024 10:26:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25970C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jul 2024 10:25:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0B039603F7;
 Thu, 11 Jul 2024 10:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57ED1C32786;
 Thu, 11 Jul 2024 10:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720693550;
 bh=IFR2JhJFc02dzT2z2GEn9H0aw1jGLPZSx+VQlPtx9L4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fojr8kMGKInK0IDLpuIVMx4THW2CfOSmQ3CeL0youvhDSgQXXlhNOUwE5hHPVLl8t
 YmjZCgum8XLjeyP4TupeU2qBsz+czzDd7AndriuvN90q9jroo5PiKix3eGaDZhNCSa
 KHmTyNmPaMjF9YvN9U6FklD1wPwKKXIdfoWKRDVWt8yux2leBVY9i0EYg2aL0G1gWD
 J8bR3iujeuRjuvWspjtNMZ+8uddFeFP56Wzfb/M7H2M3Xoaev62VYOnd4fOY1CjIy6
 zDxnbjIIsF2eBJag2XLNuFtmM3hopJXvox9n/xtL48yJVZ5XNfZzk6JJp+Vqp6Rn8Y
 d3sZV7elOVkNQ==
Date: Thu, 11 Jul 2024 12:25:47 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <4jfq7tsdyztvwcgg7fg5buy27tqrndcds5dssjnpnnn72v7qaz@sz5vwesh3kpc>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-48-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-48-wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 47/60] i2c: stm32f4: reword according
 to newest specification
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

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:47PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
