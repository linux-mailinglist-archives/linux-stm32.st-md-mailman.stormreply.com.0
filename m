Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF1594E1B4
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Aug 2024 16:42:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0198C78006;
	Sun, 11 Aug 2024 14:42:01 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2B15C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Aug 2024 14:41:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 236DBCE01B6;
 Sun, 11 Aug 2024 14:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD0DC32786;
 Sun, 11 Aug 2024 14:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723387311;
 bh=e9DgOEq6OLvmcRv/CH6wRxKEHV8xntvIpbRaCP8T9Pg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u2JtRZCQUiBO8aEG94JtdjaLJL1ab3qWYNwtnmPDDaR1GVWCLpZUIuLzm2qf9LpsQ
 QtHuo/VuhFaH2bn7DNb9dAWd7z/cmi26koZ5LJPCsvnjKMJGhzudAt67ADkRhXFfAe
 nBRWsMyD2ZPzeOPEBp4XoMn6rcTkVIXwfvLFrT0aFlE2MrwZg+5+Wfjm5mt0oKnSDx
 F1y89gru3HUTcDbHsVNfLGaMALb9/zmYZg1IvH5PNoNsb4S5tvoD4SPYjrx5tfTOTp
 K24kZh2ELuvrd0Rcv/aaJMzD1rNJu0I/K/g1CJR3LUdDR3kONDxIEFTYPmH4LxCL8R
 +3ZwF5RI5uL5w==
Date: Sun, 11 Aug 2024 15:41:47 +0100
From: Simon Horman <horms@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <20240811144147.GL1951@kernel.org>
References: <20240809082146.3496481-1-o.rempel@pengutronix.de>
 <20240810095129.GH1951@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240810095129.GH1951@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 kernel@pengutronix.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] arm: dts: st: stm32mp151a-prtt1l: Fix
 QSPI configuration
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

On Sat, Aug 10, 2024 at 10:51:29AM +0100, Simon Horman wrote:
> On Fri, Aug 09, 2024 at 10:21:46AM +0200, Oleksij Rempel wrote:
> > Rename 'pins1' to 'pins' in the qspi_bk1_pins_a node to correct the
> > subnode name. The incorrect name caused the configuration to be
> > applied to the wrong subnode, resulting in QSPI not working properly.
> > 
> > To avoid this kind of regression, all references to pin configuration
> > nodes are now referenced directly using the format &{label/subnode}.
> > 
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> 
> Pass

Sorry about the noise here. This was supposed to be a note to myself, that
I am not planning to review this.  It doesn't imply anything about the
patch.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
