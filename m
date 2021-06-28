Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 117B33B5DFD
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jun 2021 14:30:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49D52C57B53;
	Mon, 28 Jun 2021 12:30:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7612C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 12:30:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F91A6197F;
 Mon, 28 Jun 2021 12:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1624883400;
 bh=jAiuAP0g+RiIDTJ5WA+otVaDS8UCWm6F8DQd5VL3hs0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n8nfSNbj4EB0/oai0JY5hrMdmxuqFjEFXcY8BKKfGjnrQZdT6eETpH3L0tZqm3aOu
 Z0eDw2v6l4ujf5JEq8D7+G0P3c4T372m0R6O2/r+nVg0+2QgWaWHETTIw9b+eQxTJp
 fsoK4Mzt0xx8WMuq8fcOEKMG9nJD9YwD5iBDKmuc=
Date: Mon, 28 Jun 2021 14:29:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <YNnAxiDMCQ8Y05ll@kroah.com>
References: <20210408230001.310215-1-marex@denx.de>
 <47597d13-e6ec-ccd2-c34b-eb65896cdd70@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47597d13-e6ec-ccd2-c34b-eb65896cdd70@denx.de>
Cc: Sasha Levin <sashal@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stable <stable@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Rework LAN8710Ai PHY
	reset on DHCOM SoM
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

On Mon, Jun 28, 2021 at 12:44:37PM +0200, Marek Vasut wrote:
> On 4/9/21 1:00 AM, Marek Vasut wrote:
> > The Microchip LAN8710Ai PHY requires XTAL1/CLKIN external clock to be
> > enabled when the nRST is toggled according to datasheet Microchip
> > LAN8710A/LAN8710Ai DS00002164B page 35 section 3.8.5.1 Hardware Reset:
> 
> [...]
> 
> > Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2 board")
> 
> Adding stable to CC.
> 
> Patch is now part of Linux 5.13 as commit
> 
> 1cebcf9932ab ("ARM: dts: stm32: Rework LAN8710Ai PHY reset on DHCOM SoM")

$ git show 1cebcf9932ab
fatal: ambiguous argument '1cebcf9932ab': unknown revision or path not in the working tree.
Use '--' to separate paths from revisions, like this:
'git <command> [<revision>...] -- [<file>...]'

Are you sure?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
