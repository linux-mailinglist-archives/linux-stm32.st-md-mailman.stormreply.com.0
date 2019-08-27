Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEEC9E9E1
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2019 15:48:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56CD6C35E01;
	Tue, 27 Aug 2019 13:48:30 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A71DC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2019 13:48:28 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 70A72537;
 Tue, 27 Aug 2019 13:48:26 +0000 (UTC)
Date: Tue, 27 Aug 2019 07:48:25 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Gerald BAEZA <gerald.baeza@st.com>
Message-ID: <20190827074825.64a28e88@lwn.net>
In-Reply-To: <1566908347-92201-1-git-send-email-gerald.baeza@st.com>
References: <1566908347-92201-1-git-send-email-gerald.baeza@st.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] Documentation: add link to stm32mp157 docs
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

On Tue, 27 Aug 2019 12:19:32 +0000
Gerald BAEZA <gerald.baeza@st.com> wrote:

> Link to the online stm32mp157 documentation added
> in the overview.
> 
> Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
> ---
>  Documentation/arm/stm32/stm32mp157-overview.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/arm/stm32/stm32mp157-overview.rst b/Documentation/arm/stm32/stm32mp157-overview.rst
> index f62fdc8..8d5a476 100644
> --- a/Documentation/arm/stm32/stm32mp157-overview.rst
> +++ b/Documentation/arm/stm32/stm32mp157-overview.rst
> @@ -14,6 +14,12 @@ It features:
>  - Standard connectivity, widely inherited from the STM32 MCU family
>  - Comprehensive security support
>  
> +Resources
> +---------
> +
> +Datasheet and reference manual are publicly available on ST website:
> +.. _STM32MP157: https://www.st.com/en/microcontrollers-microprocessors/stm32mp157.html
> +

Adding the URL is a fine idea.  But you don't need the extra syntax to
create a link if you're not going to actually make a link out of it.  So
I'd take the ".. _STM32MP157:" part out and life will be good.

Thanks,

jon
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
