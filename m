Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 140C42AD3B1
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Nov 2020 11:26:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D49F5C3FAE2;
	Tue, 10 Nov 2020 10:26:28 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71D6CC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Nov 2020 10:26:27 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kcQr3-00005S-9h; Tue, 10 Nov 2020 11:26:25 +0100
To: Rob Herring <robh@kernel.org>
References: <20201104113932.30702-1-a.fatoum@pengutronix.de>
 <20201109163733.GA1404197@bogus>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <decb0b4e-e6bf-98c5-df77-6b5f2405ae7f@pengutronix.de>
Date: Tue, 10 Nov 2020 11:26:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201109163733.GA1404197@bogus>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] dt-bindings: arm: stm32: lxa,
 stm32mp157c-mc1: add extra SiP compatible
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

Hello Rob,

On 11/9/20 5:37 PM, Rob Herring wrote:
> On Wed, Nov 04, 2020 at 12:39:31PM +0100, Ahmad Fatoum wrote:
>> I know that bindings and device tree patches should be separate. Does
>> this apply here as well? Should I split the dts change into a follow-up
>> commit? 
> 
> Yes.
> 
>> Is it ok that dtbs_check will report an intermittent breakage?
> 
> If the binding comes first, it won't break.
> 
> But generally, 'dtbs_check' being warning free is not yet a requirement. 
> That will probably first have to be per platform.

here the old binding is deleted, so between the patches, there will be
a dtbs_check warning, which is why I asked. I've now split it up with
binding first.

>> +          - const: oct,stm32mp15xx-osd32
> 
> 'oct' is not docuemnted in vendor-prefixes.yaml.

Huh, I only checked whether it's in use, not if it's documented.
I just sent out a v2 with your points addressed.

Thanks for review,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
