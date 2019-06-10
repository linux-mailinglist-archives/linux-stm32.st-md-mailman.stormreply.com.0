Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9873157E8B
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64EDDC57B64
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B105BCF2083
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 16:48:10 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B062F21721;
 Mon, 10 Jun 2019 16:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560185289;
 bh=3q0wdBIBloAaKbF30NNBcupNXjug5nIS2FnWZbNAe2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xewsbSbPxHoWDdWHAHP9sZybWLjLS7IliCL/Tc6Tya2fNau5BlSCNVvB6IKoCpTq3
 nE3MNfKlGZxuUduGprJf6rfo062bFn4e5pHJjgqdOPwN4qbdnRNCn0qsBcnFphAAka
 Jj1oP+oNoGSk4SxkQw6qOq0HqoIckotX3VhDXWvc=
Date: Mon, 10 Jun 2019 18:48:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Erwan Le Ray <erwan.leray@st.com>
Message-ID: <20190610164807.GA25660@kroah.com>
References: <1559638519-6128-1-git-send-email-erwan.leray@st.com>
 <1559638519-6128-5-git-send-email-erwan.leray@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1559638519-6128-5-git-send-email-erwan.leray@st.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:46 +0000
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 04/10] serial: stm32: add pm_runtime
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

On Tue, Jun 04, 2019 at 10:55:13AM +0200, Erwan Le Ray wrote:
> Use pm_runtime for clock management.
> 
> Signed-off-by: Bich Hemon <bich.hemon@st.com>
> Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

Does not apply to my tree :(


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
