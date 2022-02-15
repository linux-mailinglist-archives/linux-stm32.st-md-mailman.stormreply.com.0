Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9FD4B7407
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Feb 2022 18:19:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2774C5F1F9;
	Tue, 15 Feb 2022 17:19:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38FB9C23E53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Feb 2022 17:19:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EDEE960F69;
 Tue, 15 Feb 2022 17:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD143C340EB;
 Tue, 15 Feb 2022 17:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644945563;
 bh=+n6mRRBEYWRJAd6xR7iQWKIB+Wl/GVSfhc9EU4PluQ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JjF7ZVnX9OMxBAIgrWHui3/2VLDtgcJF5du3s1ed48kTCTZdfqvCcT4ai8AGVVKea
 kKqvO1K4VR8WN3RT6H59DMHGQ/HwxhNNN2/UKjajgLMYelGR9kHKle+VuzQKVyWpiM
 A0UqbTJ3lL5BqdxZT36RoxRrPEpVD6RmJyU3PfiY=
Date: Tue, 15 Feb 2022 18:19:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <Ygvgl1SXevlyzz8t@kroah.com>
References: <1644923059-3619-1-git-send-email-fabrice.gasnier@foss.st.com>
 <Yguy5OMW477VmMuv@kroah.com>
 <dab7c8fe-0cf5-66a6-bf84-25fe84b4a221@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dab7c8fe-0cf5-66a6-bf84-25fe84b4a221@foss.st.com>
Cc: linux-usb@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, hminas@synopsys.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] usb: dwc2: drd: fix soft connect when
 gadget is unconfigured
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

On Tue, Feb 15, 2022 at 04:42:46PM +0100, Fabrice Gasnier wrote:
> On 2/15/22 3:04 PM, Greg KH wrote:
> > On Tue, Feb 15, 2022 at 12:04:19PM +0100, Fabrice Gasnier wrote:
> >> When the gadget driver hasn't been (yet) configured, and the cable is
> >> connected to a HOST, the SFTDISCON gets cleared unconditionally, so the
> >> HOST tries to enumerate it.
> >> At the host side, this can result in a stuck USB port or worse. When
> >> getting lucky, some dmesg can be observed at the host side:
> >>  new high-speed USB device number ...
> >>  device descriptor read/64, error -110
> >>
> >> Fix it in drd, by checking the enabled flag before calling
> >> dwc2_hsotg_core_connect(). It will be called later, once configured,
> >> by the normal flow:
> >> - udc_bind_to_driver
> >>  - usb_gadget_connect
> >>    - dwc2_hsotg_pullup
> >>      - dwc2_hsotg_core_connect
> >>
> >> Fixes: 17f934024e84 ("usb: dwc2: override PHY input signals with usb role switch support")
> >> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> >> ---
> >> Changes in v2:
> >> - Fix build error: 'struct dwc2_hsotg' has no member named 'enabled';
> >>   as reported by the kernel test robot.
> >>   https://lore.kernel.org/all/202202112236.AwoOTtHO-lkp@intel.com/
> >>   Add dwc2_is_device_enabled() macro to handle this.
> >> ---
> >>  drivers/usb/dwc2/core.h | 2 ++
> >>  drivers/usb/dwc2/drd.c  | 6 ++++--
> >>  2 files changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> >> index 8a63da3..8a7751b 100644
> >> --- a/drivers/usb/dwc2/core.h
> >> +++ b/drivers/usb/dwc2/core.h
> >> @@ -1418,6 +1418,7 @@ void dwc2_hsotg_core_connect(struct dwc2_hsotg *hsotg);
> >>  void dwc2_hsotg_disconnect(struct dwc2_hsotg *dwc2);
> >>  int dwc2_hsotg_set_test_mode(struct dwc2_hsotg *hsotg, int testmode);
> >>  #define dwc2_is_device_connected(hsotg) (hsotg->connected)
> >> +#define dwc2_is_device_enabled(hsotg) ((hsotg)->enabled)
> > 
> > Why the extra ()?  dwc2_is_device_connected does not have it, so this
> > one probably should not either, right?
> 
> Hi Greg,
> 
> I was wondering the same, checkpatch complains without it:
> 
> CHECK: Macro argument 'hsotg' may be better as '(hsotg)' to avoid
> precedence issues

checkpatch is wrong here, this is a structure pointer, not anything you
could ever use that could be evaluated any other way.

> I can remove the extra () in a v3 if you wish ?

Please do.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
