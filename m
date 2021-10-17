Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1307743097B
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Oct 2021 15:51:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB8DFC5C847;
	Sun, 17 Oct 2021 13:51:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4958BC597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Oct 2021 13:51:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D46461027;
 Sun, 17 Oct 2021 13:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1634478704;
 bh=wJArX8ewuoelcOM089foeU0E8LxBl4M7aRz9fvqueNw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BhXRwrmqyiUM3WRs8L1qda973z8Z3zVvIVtVapURG6io1+iA1xxt7uNRbZLGNcEzU
 yAcnJtEl3vN9HOOWs8UEYWCEHF+oM0roScDnXQQS2jrodW3uN0dCdvXh6zxd3OOPuE
 c3pXxNuNi35IWUHhgfdE54ORfkgHC8NyDu5cPcF0=
Date: Sun, 17 Oct 2021 15:51:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <YWwqbmSoLFxiKDTa@kroah.com>
References: <cover.1632884256.git.vilhelm.gray@gmail.com>
 <a6c81b2f1f5d0b8d59b1ebe4f0fed04914b07547.1632884256.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a6c81b2f1f5d0b8d59b1ebe4f0fed04914b07547.1632884256.git.vilhelm.gray@gmail.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, Dan Carpenter <dan.carpenter@oracle.com>,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v17 5/9] counter: Implement
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

On Wed, Sep 29, 2021 at 12:16:02PM +0900, William Breathitt Gray wrote:
> +static ssize_t counter_comp_id_show(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
> +{
> +	const size_t id = (size_t)to_counter_attribute(attr)->comp.priv;
> +
> +	return sprintf(buf, "%zu\n", id);

sysfs_emit()?

> +}
> +

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
