Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C37B4237F8
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Oct 2021 08:28:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C30F7C5AB80;
	Wed,  6 Oct 2021 06:28:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8951DC5719C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Oct 2021 06:28:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DDA760EC0;
 Wed,  6 Oct 2021 06:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633501681;
 bh=spg2FfB33eWRaZlMimWllWmYIhAbe/hDa0jC2sb1vWI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nu0KSdos8srKS5PIPAOZZNp8J/2y5CPh/+dnqB2466tL4XJzMDHY0vH2W7eGUsOYc
 CwnIoKUKrM8wQ76l6MJw2Q38dpQZHYi605sGDZ27T+ryGez1rmoQ5JHaX7o8kI0A+i
 sD8TBOVJACa3H17k+oxP6iQHDCcOoJIHajMgs3ro=
Date: Wed, 6 Oct 2021 08:27:59 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Message-ID: <YV1B7/yP2L+0L1sQ@kroah.com>
References: <1631692473-8732-1-git-send-email-fabrice.gasnier@foss.st.com>
 <1631692473-8732-2-git-send-email-fabrice.gasnier@foss.st.com>
 <a183ddf9-c578-0b45-1aa2-4fcd1fbf17eb@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a183ddf9-c578-0b45-1aa2-4fcd1fbf17eb@synopsys.com>
Cc: "balbi@kernel.org" <balbi@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 1/3] usb: dwc2: add otg_rev and otg_caps
 information for gadget driver
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

On Fri, Oct 01, 2021 at 11:10:19AM +0000, Minas Harutyunyan wrote:
> On 9/15/2021 11:54 AM, Fabrice Gasnier wrote:
> > Currently the dwc2 doesn't fill in the 'otg_caps' of usb_gadget structure.
> > When registering a gadget device (e.g. via configfs), the
> > usb_otg_descriptor_init() checks the 'otg_caps' and 'otg_rev'. It defaults
> > to HNP and SRP bmAttributes if unspecified. There may be a mismatch with
> > what's being set in dwc2 params structure. This result in the descriptors
> > to be miss-configured in this case.
> > 
> > So add an option to setup 'otg_caps' and 'otg_rev' in the params. It's
> > then provided to the gadget struct. These parameters can then be tuned
> > for each platform. In case it's not set, it will default to current
> > behavior.
> > Also add option to setup these from the device tree by calling
> > of_usb_update_otg_caps(). This provides support for standard properties
> > such as "otg-rev", "hnp-disable" and "srp-disable" (see usb-drd.yaml).
> > 
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Acked-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
> 

Looks like this commit breaks the build on some configurations:
	https://lore.kernel.org/r/000000000000b01f1505cda8e03c@google.com

So I'll go drop this and the 2/3 patch from my tree.  Please fix up and
resend.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
