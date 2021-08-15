Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D9D3ECA52
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Aug 2021 18:55:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 553C7C57B7A;
	Sun, 15 Aug 2021 16:55:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A796C57B5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Aug 2021 16:55:04 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 152A561208;
 Sun, 15 Aug 2021 16:54:57 +0000 (UTC)
Date: Sun, 15 Aug 2021 17:57:56 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210815175756.5e627c3d@jic23-huawei>
In-Reply-To: <d72159ab7ebfe607d86c0ab472979e8eca6f16a0.1628511445.git.vilhelm.gray@gmail.com>
References: <cover.1628511445.git.vilhelm.gray@gmail.com>
 <d72159ab7ebfe607d86c0ab472979e8eca6f16a0.1628511445.git.vilhelm.gray@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, Dan Carpenter <dan.carpenter@oracle.com>,
 kernel@pengutronix.de, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v15 09/13] counter: Implement
 signalZ_action_component_id sysfs attribute
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

On Mon,  9 Aug 2021 21:37:34 +0900
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> The Generic Counter chrdev interface expects users to supply component
> IDs in order to select Synapses for requests. In order for users to know
> what component ID belongs to which Synapse this information must be
> exposed. The signalZ_action_component_id attribute provides a way for
> users to discover what component ID belongs to the respective Synapse.
> 
> Cc: Gwendal Grignou <gwendal@chromium.org>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: David Lechner <david@lechnology.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---

>  Contact:	linux-iio@vger.kernel.org
> diff --git a/drivers/counter/counter-sysfs.c b/drivers/counter/counter-sysfs.c
> index dbb507c9da11..11bef9f8190f 100644
> --- a/drivers/counter/counter-sysfs.c
> +++ b/drivers/counter/counter-sysfs.c
> @@ -393,7 +393,6 @@ static int counter_avail_attr_create(struct device *const dev,
>  	struct counter_attribute *counter_attr;
>  	struct device_attribute *dev_attr;
>  
> -	/* Allocate Counter attribute */

Trivial, but this is an unrelated change and shouldn't be in this patch (it's just noise).

>  	counter_attr = devm_kzalloc(dev, sizeof(*counter_attr), GFP_KERNEL);
>  	if (!counter_attr)
>  		return -ENOMEM;
> @@ -535,6 +534,46 @@ static int counter_name_attr_create(struct device *const dev,
>  	return 0;
>  }
>  
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
