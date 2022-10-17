Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB00460063C
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Oct 2022 07:25:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5402CC63325;
	Mon, 17 Oct 2022 05:25:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3E0DC03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 05:25:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9844460DF2;
 Mon, 17 Oct 2022 05:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A2BC433D6;
 Mon, 17 Oct 2022 05:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665984341;
 bh=QLTUjN8wz1TtW0LObJouIjCQHTrwqKczV/PmiieRk1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ovFPID7s6qzGHC0D3Xke7f+LPCp8gLARW8Nmy0NhMC+GLkYiT0eQpco/2VuoZTaSj
 wRBc9JcsSb9Tu2GlYJuwGP2QfrHb0HUxLVZI4e8ZKSXNenoPj1JBN81hVi+Kb4EfAL
 QinXZvMiyHT4iAxuRQ6o9M5vN/sqCYS/7IoC+wNA89eIBTgN6N1/q4VweLB+AEcQpQ
 sLwz01/Irs3XR7ElEh3/JMeVN9kpbGDFDYhOAg5ieexqT0gLsxk9unJUqQGFXqkw9i
 2iACfAH7W7XF0FEON81Q2eUYNpJMvceh3KUtFZ8KfTRbsVG+oCpVmHJxWOlz9q38R3
 NRoZcRzb5X+9Q==
Date: Mon, 17 Oct 2022 10:55:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <Y0znUJMwFbOAPYpj@matsya>
References: <Y0kq8j6S+5nDdMpr@kili>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0kq8j6S+5nDdMpr@kili>
Cc: kernel-janitors@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] phy: stm32: fix an error code in probe
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

On 14-10-22, 12:25, Dan Carpenter wrote:
> If "index > usbphyc->nphys" is true then this returns success but it
> should return -EINVAL.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
