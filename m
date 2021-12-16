Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F65476A98
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 07:48:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F7BEC5E2C6;
	Thu, 16 Dec 2021 06:48:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0AACC5E2C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 06:48:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5CFA61B9D;
 Thu, 16 Dec 2021 06:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02AD7C36AE4;
 Thu, 16 Dec 2021 06:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639637324;
 bh=m5vS1HxsTPT0xOHjuF/PpXUmvflQ2rhqdTD07eZ9ZMY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=THf9PKLwUtd/Yuv7bkKpf3yjfQE/UGTgfp6NXrD9xUJokhhNasudxxL0ktKGvcCsK
 ATS5t36Tp1ihLKAGOXZnTRdLjRFAOT+OAsNb/FVSI5GwhubXPJjQNAUbk1x8Xx/zQS
 y+mQ+jCkuJi6hMS1I2yx18UQLQ7We1bgmFnvZSUMFfNBsLhARPSbs+3JHBxVbSvbMR
 /+6RkBZRqUSAOsWqSGcVnHaL4DqGICGT+CZu+4fABNyfBN4xvqK2P5gsbx79eoz5Mv
 hUrC3dFJzE2Aj34hs084DQq9qqtISzRTgxtU1DLbmv3PYaQTw18D5BevcNIiLXmd7F
 WPpSBhNh/ZM7w==
MIME-Version: 1.0
In-Reply-To: <20211126221239.1100960-1-colin.i.king@gmail.com>
References: <20211126221239.1100960-1-colin.i.king@gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Colin Ian King <colin.i.king@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 15 Dec 2021 22:48:42 -0800
User-Agent: alot/0.9.1
Message-Id: <20211216064844.02AD7C36AE4@smtp.kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] clk: stm32mp1: remove redundant
	assignment to pointer data
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

Quoting Colin Ian King (2021-11-26 14:12:39)
> The pointer data is being initialized with a value and a few lines
> later on being re-assigned the same value, so this re-assignment is
> redundant. Clean up the code and remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Applied to clk-next
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
