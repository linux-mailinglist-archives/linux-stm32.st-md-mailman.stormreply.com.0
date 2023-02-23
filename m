Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8455C6A0780
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Feb 2023 12:37:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37126C6A5F8;
	Thu, 23 Feb 2023 11:37:30 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DEE9C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Feb 2023 11:37:29 +0000 (UTC)
Received: from maxwell ([213.61.141.186]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis) id
 1Mr8SG-1ohIIB3HAU-00oBky; Thu, 23 Feb 2023 12:37:05 +0100
References: <87y1oq5es0.fsf@henneberg-systemdesign.com>
 <Y/XbXwKYpy3+pTah@corigine.com>
 <87lekp66ko.fsf@henneberg-systemdesign.com> <Y/ZY/o5HvNCPLfFg@lunn.ch>
User-agent: mu4e 1.8.14; emacs 28.2
From: Jochen Henneberg <jh@henneberg-systemdesign.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Thu, 23 Feb 2023 12:34:18 +0100
In-reply-to: <Y/ZY/o5HvNCPLfFg@lunn.ch>
Message-ID: <87v8js4nqa.fsf@henneberg-systemdesign.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Tp18kdHUx4peZI5q9H44bLg0H5sfi0/5HbgR2C4BrUBu9c6GFih
 KLg1c7spaS/bksijW33N/vG/iMR9WCkKBCbbOoIEO7N4GZOUJUNQNhqGSe98dmnTwY3UJ8l
 VXaM+iUCPtxGrcciIOIUIrrmlmnmEvvtbLms227JsVsHimqHfOeue4yq4erQzYRaM7PJ3KC
 VBW7GDdmnDuWaZ+yWTcrg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6/GP2YKieoI=;s72evEBC3vLskuzAwIujN9nVreW
 bj+zhsX7z84myEV/hIJdLRxvEB3QHwx0LEwK3Wsc5oL4WOhbAHq2/Rh/wiAlAPLONtofcIKlU
 ub5U2e5i/ptYOZN3lETfF7fV360W7+G/ThzQmWeb67wXpN4/HihFWGsW8oBSh00JORJkEAigk
 lovHkbt0PbkeHG3Hkn4LimIjhcG+Ggz4A/pROiDTmQbNkZmyRgVRi3cHPYbWDhPvN4dp+R5fd
 prKk4ZPVQv98+qW9FIIviV2TBz4Z6fp/N1Gq7Pl9y7LBat1A7qYZ/rywWN1Xz4B2FSZ2WRJLG
 r+cDm1xdvDo3qb/22PMAquz1Bq/GCW3iPsqV4xbsS3sgn7xCMUDqlvg35kBH562jcDbFCb15g
 rVQHXG7vd++U8wNJBuMHva55Hi/YsBShC0+8eBSo695bbrHhdBVtXgg+76pOe9ienVU6HZS9V
 TJh+aTocr+nROMozuLwuPB7ZHGERePLaLp0diKiB8uSjzER7M69jASmEiCaMawuxAiLv/aL3p
 DrKKCsJBZ+fJIPidKPoctWjSsa1ZpBiCO2iLRdnRniTTT648KYC8XmDzgCDXAgR9mlWR6WKzT
 kW2kW9b6rUz3IJk63vqvuTKVEujiWSL/7EAHF4B4F0chKTaw9OactTyaUgbvnpBGb1hE4z/FC
 HPvLoCnLOymTAI7voPetQkSkVeaic8qbrHzWKu2ZDg==
Cc: linux-kernel@vger.kernel.org, Simon Horman <simon.horman@corigine.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net V3] net: stmmac: Premature loop
 termination check was ignored
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


Andrew Lunn <andrew@lunn.ch> writes:

> On Wed, Feb 22, 2023 at 04:49:55PM +0100, Henneberg - Systemdesign wrote:
>> 
>> Simon Horman <simon.horman@corigine.com> writes:
>> 
>> > On Wed, Feb 22, 2023 at 08:38:28AM +0100, Jochen Henneberg wrote:
>> >> 
>> >> The premature loop termination check makes sense only in case of the
>> >> jump to read_again where the count may have been updated. But
>> >> read_again did not include the check.
>> >> 
>> >> Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
>> >
>> > This commit was included in v5.13
>> >
>> >> Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
>> >
>> > While this one was included in v5.4
>> >
>> > It seems to me that each of the above commits correspond to one
>> > of the two hunks below. I don't know if that means this
>> > patch should be split in two to assist backporting.
>> >
>> 
>> I was thinking about this already but the change was so trivial that I
>> hesitated to split it into two commits. I wanted I will surely change
>> this.
>
> The advantage of splitting is that it makes back porting easy. Both
> parts are needed for 6.1 and 5.15. 5.10 only needs the fix for
> ec222003bd94. It if does not easily apply to 5.10 it could get
> dropped. By splitting it, the backporting probably happens fully
> automated, no human involved.

Understood. Will do the split and send two new patches. I will not
continue with version upcounting and not send a patch series but two
completly independent patches.

Jochen

>
> 	Andrew


-- 
Henneberg - Systemdesign
Jochen Henneberg
Loehnfeld 26
21423 Winsen (Luhe)
--
Fon: +49 172 160 14 69
Url: https://www.henneberg-systemdesign.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
