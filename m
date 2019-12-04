Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 046AA1130A9
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2019 18:19:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0E4BC36B0B;
	Wed,  4 Dec 2019 17:19:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29FDFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2019 17:19:05 +0000 (UTC)
Received: from localhost (unknown [217.68.49.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 536602073B;
 Wed,  4 Dec 2019 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575479943;
 bh=LpkBJRqlGFpEhqibsZPnh433kIeVDQm45qfIiUzRROc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IpppSis9yCeWRnPBBb5/AA2PW8ICGTMFwwU9u3NCkIf/JkvBcPrL7pO3mjloI3cF5
 xOxC14/h5bsmKIemliWM4tfhMsb/f3C/9+nwl50Qq6BDFkc8Ca2b9HAtjE2BhwG+m3
 z4gkvjMBJCuRb4qN3AKA4NWaJcKwqb5BbwKE46jw=
Date: Wed, 4 Dec 2019 18:19:01 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <20191204171901.GD3627415@kroah.com>
References: <20191104143713.11137-1-alexandre.torgue@st.com>
 <faff6224-11b6-b055-1a80-fda0ff7c1724@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <faff6224-11b6-b055-1a80-fda0ff7c1724@st.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [Linux-stm32] [PATCH] phy: core: Add consumer device link
	support
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

On Wed, Dec 04, 2019 at 04:33:14PM +0100, Alexandre Torgue wrote:
> Hi,
> 
> Gentle ping, in case you missed this.

It's the middle of the merge window, we can't add anything to our trees
at this point in time, sorry.

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
