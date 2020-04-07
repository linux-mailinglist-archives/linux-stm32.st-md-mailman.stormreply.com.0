Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 902CB1A13CC
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Apr 2020 20:37:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3210AC36B0B;
	Tue,  7 Apr 2020 18:37:55 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BBB3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Apr 2020 18:37:54 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48xbkT1tn5z1ryBQ;
 Tue,  7 Apr 2020 20:37:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48xbkT1CzNz1qqkn;
 Tue,  7 Apr 2020 20:37:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id MBWHwyARyIjv; Tue,  7 Apr 2020 20:37:51 +0200 (CEST)
X-Auth-Info: GMtWvY1vsAnPbZyuvgi6peZ/WnkPB8n6VGIYUQnWXnY=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue,  7 Apr 2020 20:37:51 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200401132237.60880-1-marex@denx.de>
 <20200401132237.60880-22-marex@denx.de>
 <20200406072242.GG2937@Mani-XPS-13-9360>
 <59d1cc85-a65e-d2bf-4591-0828cf7b8390@denx.de>
Message-ID: <f952f1ad-53bb-7b85-caad-2174a4333a2c@denx.de>
Date: Tue, 7 Apr 2020 20:37:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <59d1cc85-a65e-d2bf-4591-0828cf7b8390@denx.de>
Content-Language: en-US
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V4 21/22] ARM: dts: stm32: Add bindings
	for USB on AV96
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

On 4/6/20 1:08 PM, Marek Vasut wrote:
> On 4/6/20 9:22 AM, Manivannan Sadhasivam wrote:
>> On Wed, Apr 01, 2020 at 03:22:36PM +0200, Marek Vasut wrote:
>>> Fill in the bindings for USB host and gadget on AV96.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>
>> I can't get the USB B-Micro OTG port to work with this patch. Do I need to
>> enable any configs other than PHY and USB DWC2 drivers?
> 
> Only the DWC2 GADGET (and possibly host, for dual-role) and some gadget
> implementation (e.g. gadget zero).

I think I see what doesn't work for you.

It seems the following works on next:
power on -> plug in USB stick (or any other USB device) -> unplug ->
plug in usb host (e.g. PC)

But this does not:
power on -> plug in usb host (e.g. PC)
 - the PC is not detected

Did that ^ ever work for you before ? I suspect this is a bug in the
DWC2 driver. The OTG operation there is known to be flaky at best.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
