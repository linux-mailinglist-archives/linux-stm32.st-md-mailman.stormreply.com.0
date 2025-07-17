Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF73B08EB4
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Jul 2025 16:02:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFC99C36B38;
	Thu, 17 Jul 2025 14:02:08 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25D4EC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jul 2025 14:02:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C3EF1A5792E;
 Thu, 17 Jul 2025 14:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFEEC4CEE3;
 Thu, 17 Jul 2025 14:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752760926;
 bh=KVyD7lFOvqRuleMrpnlzsXkDQLyNjWkA4eJ+WSGLfM4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZmtHm77uIqjEh59AdgGwDJEJaViM6/f/YJFwK9E6S0h9Jb+XTbD2nn+cBLESgGHZQ
 omlIP7Xe9cSwaYxSoQsMHKbiAd6hkGVfcndXC/En/OWCAyWb/A0Wagx4KFMj2SQ2Ik
 p1yl8sXB2Rj4ZRagval+STgnQDrvGomb4jyw9d2PS+ym0A7UcrNFLX4h2QbMRxSqoG
 VoXEI8xMv532qlMB4fDRCL2mVA4L0na3En5rKaxLfunh9WginRpyv4gIUZExr51dXn
 O6WcCGjQHPvqrRgcTum2IPACtAg8SYiQm41myJMz4XvBHXr6X1eCDcn3U2Tm+rMv6W
 f/ItZzHvIOzog==
Date: Thu, 17 Jul 2025 07:02:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Primoz Fiser <primoz.fiser@norik.com>
Message-ID: <20250717070204.66e34588@kernel.org>
In-Reply-To: <20250717090037.4097520-1-primoz.fiser@norik.com>
References: <20250717090037.4097520-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, upstream@lists.phytec.de,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Wei Fang <wei.fang@nxp.com>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/2] Populate of_node for i.MX netdevs
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

On Thu, 17 Jul 2025 11:00:35 +0200 Primoz Fiser wrote:
> Recently when working on predictable network names for i.MX SoCs, it
> was discovered that of_node sysfs properties are missing for FEC and
> EQOS interfaces.
> 
> Without this, udev is unable to expose the OF_* properties (OF_NAME,
> OF_FULLNAME, OF_COMPATIBLE, OF_ALIAS, etc.) and thus we cannot identify
> interface based on those properties.
> 
> Fix this by populating netdev of_node in respective drivers.

Seems legit, but would be good to CC Open Firmware maintainers.

If we want to make propagating the OF linkage a think I think we should
add a flavor of SET_NETDEV_DEV() which does that for the caller.
SET_NETDEV_DEV_OF() ?
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
