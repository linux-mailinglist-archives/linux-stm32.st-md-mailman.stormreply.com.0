Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4027998D835
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Oct 2024 15:58:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E810DC78020;
	Wed,  2 Oct 2024 13:58:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FDBCC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Oct 2024 13:58:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 477AC5C4276;
 Wed,  2 Oct 2024 13:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC30CC4CEC2;
 Wed,  2 Oct 2024 13:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727877483;
 bh=mjanN9GeGC4nh8dJ7hZsfZmAW3eRQ//5yJPpCjN6w6c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i3X0+eKlv6JkUVi2aOcUsN5GoimQJCi89BsLebI4cw4ECXwfJMPL5i6u22XQihBEF
 qTlUnCjqiYYtEsbZ7CxHitGBV1ktdaw9vBmBQCYZnf//zlTCdoHjgh3T2lImH/lveM
 Qd2nMK0dc88KjwDQTKbkv6ROUJORWtxGK1CmpCj96l7k2VwShFleze5U+CY6lrQVaj
 yclegzCFl+Jk6yPKrS8xkuJSUchEkdUfQ+7TLtpKNaK0uVJNoIPEaRIdOveSj+zPx3
 2+pdRa5SuaD7mcrLN/r3Xuo2kKRUv4t+qcyzSGfH+cbI9VdIsGGRtjMrSRT0lhLcZT
 tAYzvEE4uXFxA==
Date: Wed, 2 Oct 2024 06:58:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Message-ID: <20241002065801.595db51a@kernel.org>
In-Reply-To: <20240930110205.44278-1-minda.chen@starfivetech.com>
References: <20240930110205.44278-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: dwmac4: Add ip
 payload error statistics
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

On Mon, 30 Sep 2024 19:02:05 +0800 Minda Chen wrote:
> Add dwmac4 ip payload error statistics, and rename discripter bit macro

descriptor
        ^

> because latest version descriptor IPCE bit claims ip checksum error or
> l4 segment length error.

What is an L4 segment length error on Rx?
Seems to me that reusing ip_payload_err here will be confusing
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
