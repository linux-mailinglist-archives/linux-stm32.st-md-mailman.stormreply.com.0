Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2722C664F
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Nov 2020 14:08:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80E70C56631;
	Fri, 27 Nov 2020 13:08:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53B6FC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 13:08:02 +0000 (UTC)
Received: from localhost (82-217-20-185.cable.dynamic.v4.ziggo.nl
 [82.217.20.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E987B21D7A;
 Fri, 27 Nov 2020 13:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1606482480;
 bh=yEWT8yD9oRORktPdkDenJyadykuE0kyiolVtHRsxdHM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e/9RMs/Lk0qJsHgGqlYAZGfhW6KFi6eOV7v7iVF3ePVpFnnquSxjK1RhOq2MAuEkW
 IV5t58M2RC/DOyoaFuh/4L3lhM80uteriqBgjg0CBsA3pMWxJiKB2/kqZallMfq4ty
 KwAcpyjbizESECkuTvlATzYqGroK1lDPu9FldFKg=
Date: Fri, 27 Nov 2020 14:07:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <X8D6LgTHMpk2gph9@kroah.com>
References: <20201106165805.31534-1-amelie.delaunay@st.com>
 <20201106165805.31534-4-amelie.delaunay@st.com>
 <e97a537a-9c7e-cd98-8ffa-93abae087128@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e97a537a-9c7e-cd98-8ffa-93abae087128@st.com>
Cc: devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Badhri Jagan Sridharan <badhri@google.com>, Rob Herring <robh+dt@kernel.org>,
 Jun Li <lijun.kernel@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 3/5] usb: typec: stusb160x: fix
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

On Fri, Nov 27, 2020 at 02:01:29PM +0100, Amelie DELAUNAY wrote:
> Hi Greg,
> 
> gentle reminder for this patch, lost in the middle of a DT series (DT part
> already in stm32-next).

Odd, I don't see this anymore, can you resend just this one so I can
apply it directly?

thanks,

greg k-h

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
