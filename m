Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0E31C9527
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 17:34:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67F33C3F958;
	Thu,  7 May 2020 15:34:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A12DC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 15:34:43 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 42CE6207DD;
 Thu,  7 May 2020 15:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588865681;
 bh=su42LeOpkqoZ9FpxsWpq/u+jVkw8iFswKLvseMb3xkM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MqGpj3R284gvc+wtAR2/E8G9RRNEz2VSI1EmoFaWXTzSSeWiZDJdSZcqH/orgGZNM
 3pkvM6V9zWFMFBzg4693wAFXpMM2ctlEy2EsbY5B+vZJw8t6/fpY7TJ9244gxU6VEc
 Fb+U+CjMoscYeEsuPnqsNI5TqcV6qAG9GVikqy+w=
Date: Thu, 7 May 2020 17:34:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Message-ID: <20200507153439.GA1919950@kroah.com>
References: <20200420170204.24541-1-mani@kernel.org>
 <20200507140750.GA2019@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507140750.GA2019@Mani-XPS-13-9360>
Cc: devicetree@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com, robh+dt@kernel.org,
 linux-serial@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/2] Add CTS/RTS gpio support to STM32
	UART
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

On Thu, May 07, 2020 at 07:37:50PM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> On Mon, Apr 20, 2020 at 10:32:02PM +0530, mani@kernel.org wrote:
> > From: Manivannan Sadhasivam <mani@kernel.org>
> > 
> > Hello,
> > 
> > This patchset adds CTS/RTS gpio support to STM32 UART controller.
> > Eventhough the UART controller supports using dedicated CTS/RTS gpios,
> > sometimes we need to use different set of gpios for flow control.
> > 
> > This is necessary for the upcoming STM32MP1 based board called Stinger96
> > IoT-Box. On that board, a bluetooth chip is connected to one of the UART
> > controller but the CTS/RTS lines got swapped mistakenly. So this patchset
> > serves as a workaround for that hardware bug and also supports the
> > usecase of using any gpio for CTS/RTS functionality. As per the sugggestion
> > provided by Andy for v1, I've now switched to mctrl_gpio driver.
> > 
> > This patchset has been validated with Stinger96 IoT-Box connected to Murata
> > WiFi-BT combo chip.
> > 
> 
> Are you planning to take this series for 5.8?

I had to wait for the DT protion to be reviewed before I could do
anything.  Give me some time, if it looks ok, it will go into 5.8.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
