Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B599B5568
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2024 22:59:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A679EC7801A;
	Tue, 29 Oct 2024 21:59:07 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E586FC78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 21:59:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EDA21A42FB6;
 Tue, 29 Oct 2024 21:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4230C4CECD;
 Tue, 29 Oct 2024 21:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730239139;
 bh=UbpQzkUTWm45exTpBQeEuDpUh3FZIWDnpsfqppEizFY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fKvwbwPDX1QEZAkInxmLMERwCC9dXfCjlxRKFKad97pu5hmalG/XidGR6iXzoIonN
 1dnlJ+TvmYvcumjcmunMSE1nxbVVFyEAdXZilfpnVBYcT9feDz9dCRQ0JcS2Zyulz8
 WY2yxYtS3Tz4f+EpHAErjsP/y1LR/daXhP+jqZ48PlTUhwgR6bP3pb0IsiYHV27y0y
 7UXHQH3pl4p3+qU8eVhQdbSQN1+cU6ScSZpbnXjPaE9J0zSBjDeMXLF+dZscPMphnt
 ZlH3tuTLB5qhRH1W8FfyXv97pl08Y36R8woemgaQYSKFfypi2pbN8H101Kwq5G/aYd
 AE/hnF+IFwtbg==
Date: Tue, 29 Oct 2024 14:58:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lothar Rubusch <l.rubusch@gmail.com>
Message-ID: <20241029145857.29a4f360@kernel.org>
In-Reply-To: <20241029202349.69442-13-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
 <20241029202349.69442-13-l.rubusch@gmail.com>
MIME-Version: 1.0
Cc: marex@denx.de, robh@kernel.org, conor+dt@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 dinguyen@kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, s.trumtrar@pengutronix.de,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 12/23] dt-bindings: net: snps,
 dwmac: add support for Arria10
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

On Tue, 29 Oct 2024 20:23:38 +0000 Lothar Rubusch wrote:
> The hard processor system (HPS) on the Intel/Altera Arria10 provides
> three Ethernet Media Access Controller (EMAC) peripherals. Each EMAC
> can be used to transmit and receive data at 10/100/1000 Mbps over
> ethernet connections in compliance with the IEEE 802.3 specification.
> The EMACs on the Arria10 are instances of the Synopsis DesignWare
> Universal 10/100/1000 Ethernet MAC, version 3.72a.
> 
> Support the Synopsis DesignWare version 3.72a, which is used in Intel's
> Arria10 SoC, since it was missing.

Please split out patches 11 and 12 as a separate series.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
