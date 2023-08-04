Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7D97700C4
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Aug 2023 15:05:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70CA3C6B465;
	Fri,  4 Aug 2023 13:05:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46D2BC6B45D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Aug 2023 13:05:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC68A61FD3;
 Fri,  4 Aug 2023 13:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31FCC433C8;
 Fri,  4 Aug 2023 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1691154336;
 bh=CMmrQBOMwR0aByOYeSTrPYxAkxl+tK2+Yy4ucbFVepY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D1Ep/aX1YfrLsVLG16EHNKOMgzJDmwOS7a3oXTfVP4t5UZ98vesrovc3AqG/nV+ua
 zkRweltGyiyd5druyJ+Cydf/yV+EcdLmBC6exbz0mqYMM5OGXGBwCgiADB1WA88qtm
 fucdckWGxZF46V/XbPfI42XaT5T1/9q/XTwinVI8=
Date: Fri, 4 Aug 2023 15:05:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Valentin Caron <valentin.caron@foss.st.com>
Message-ID: <2023080414-props-senior-c40a@gregkh>
References: <20230803130134.155355-1-valentin.caron@foss.st.com>
 <20230803130134.155355-7-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803130134.155355-7-valentin.caron@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 6/6] serial: stm32: synchronize RX DMA
	channel in shutdown
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

On Thu, Aug 03, 2023 at 03:01:34PM +0200, Valentin Caron wrote:
> From: Amelie Delaunay <amelie.delaunay@foss.st.com>
> 
> In shutdown, RX DMA channel is terminated. If the DMA RX callback is
> scheduled but not yet executed, while a new RX DMA transfer is started, the
> callback can be executed, and then disturb the ongoing RX DMA transfer.
> To avoid such a case, call dmaengine_synchronize in shutdown, after the
> DMA RX channel is terminated.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---

You can't forward on a patch from someone else and not sign-off on it
yourself :(

Please fix up and resend the series.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
