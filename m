Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4303D2C6719
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Nov 2020 14:45:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D34A5C56631;
	Fri, 27 Nov 2020 13:45:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28029C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 13:45:16 +0000 (UTC)
Received: from localhost (82-217-20-185.cable.dynamic.v4.ziggo.nl
 [82.217.20.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 142BD2224B;
 Fri, 27 Nov 2020 13:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1606484714;
 bh=NQw72cTse1BafEIim088HPnHlNEV5CfbLc4E4dpqY8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ehWfKKP1UOOn+C9SHVlo95ZPPe30z4aTj9x50H+4+ZzjeA8MEpi7WDq7holOQ/GN3
 FMTIf16xFIHwikVU+k2jUuGfmL3Zh8PQZBHGYmgRwtBaRUspkBTh6PPWSdSe/gC0Pb
 pc/fp9G1VB1Lnd+LjxYVF5VJivjuIzVvqWGGegas=
Date: Fri, 27 Nov 2020 14:45:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <X8EC6BL98dm+u+8C@kroah.com>
References: <20201127131735.28280-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127131735.28280-1-amelie.delaunay@st.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@st.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 1/1 RESEND] usb: typec: stusb160x: fix
 power-opmode property with typec-power-opmode
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

On Fri, Nov 27, 2020 at 02:17:35PM +0100, Amelie Delaunay wrote:
> Device tree property is named typec-power-opmode, not power-opmode.
> 
> Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/stusb160x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Now applied, sorry for missing it before.

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
