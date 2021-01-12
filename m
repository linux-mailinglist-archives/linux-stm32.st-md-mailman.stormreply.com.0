Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CF52F2C95
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Jan 2021 11:23:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E2BCC424C0;
	Tue, 12 Jan 2021 10:23:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9BC6C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jan 2021 10:23:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E2A8224BD;
 Tue, 12 Jan 2021 10:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1610446983;
 bh=sZ83tp3PCWrezXxnJ9F+Y/33Czn075FuyrVU0k6CVFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vSm3spjITRpP9whrZzotRPbJT/X/LjPI6w3tx2Osaz0GFVUZUOX56I6vUOaY24WPn
 4zpRrPxcZbOsnC+WrzQ5jGmfKngz4O2YQUou6v412Dq+eMeTO2TyixzBAOr7Rl+T6t
 SX3l9RvpUz6mGN3hlj+957ys9s0L7wHNvz9f739k=
Date: Tue, 12 Jan 2021 11:24:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Erwan LE RAY <erwan.leray@foss.st.com>
Message-ID: <X/14zOkg/NpFjyR/@kroah.com>
References: <20210106162203.28854-1-erwan.leray@foss.st.com>
 <20210106162203.28854-3-erwan.leray@foss.st.com>
 <72c81157-4bd1-6a3e-2415-92a2fb29ab6d@kernel.org>
 <667eb6bd-b612-fd78-0b09-d61eff72d139@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <667eb6bd-b612-fd78-0b09-d61eff72d139@foss.st.com>
Cc: devicetree@vger.kernel.org, Valentin Caron <valentin.caron@foss.st.com>,
 linux-serial@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/8] serial: stm32: fix code cleaning
 warnings and checks
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

On Tue, Jan 12, 2021 at 11:02:43AM +0100, Erwan LE RAY wrote:
> Hello Greg,
> 
> As the V2 is already in your tty-next branch, how do want me to proceed to
> deliver the fix for Jiri remark ?
> Do you expect a V3 or a new fix ?

Patches on top of that tree please, I can't drop something in a public
tree.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
