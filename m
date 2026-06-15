Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 40KRB5+vL2oaEgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 09:54:07 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB62368457F
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 09:54:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72E03C1A97C;
	Mon, 15 Jun 2026 07:54:06 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06BB6C3F95E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2026 07:54:04 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1wZ28k-0006Kb-3t; Mon, 15 Jun 2026 09:53:50 +0200
Message-ID: <f0b7d0a0-9b75-4d63-bc1a-f0891c86b2b9@pengutronix.de>
Date: Mon, 15 Jun 2026 09:53:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: David Laight <david.laight.linux@gmail.com>
References: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
 <20260611204341.147f1afb@pumpkin>
 <b4fd25b6-52e3-4b5e-8440-69545bce43e8@pengutronix.de>
 <20260612075342.6615d66c@pumpkin>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20260612075342.6615d66c@pumpkin>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] ARM: dts: stm32: lxa: change
 stdout-path baud rate from 9600 to 115200
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:kernel@pengutronix.de,m:robh@kernel.org,m:conor+dt@kernel.org,m:alexandre.torgue@st.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mkl@pengutronix.de,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:l.goehrs@pengutronix.de,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:davidlaightlinux@gmail.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[a.fatoum@pengutronix.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,st.com,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[a.fatoum@pengutronix.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email,pengutronix.de:mid,pengutronix.de:email,pengutronix.de:url,pengutronix.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB62368457F

Hello David,

On 6/12/26 8:53 AM, David Laight wrote:
> On Thu, 11 Jun 2026 22:33:18 +0200
> Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> 
>> Hi David,
>>
>> On 6/11/26 21:43, David Laight wrote:
>>> On Thu, 11 Jun 2026 20:12:32 +0200
>>> Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>>   
>>>> The LXA boards are the only STM32 boards that set stdout-path = &uart*
>>>> instead of explicitly specifying a baud rate.
>>>>
>>>> This would mean the default of 9600 is used, but it goes unnoticed when
>>>> booting normally as barebox fixes up a console= line that includes a
>>>> baud rate.
>>>>
>>>> When EFI booting GRUB however, GRUB will not pass along the console=
>>>> line and thus the board ends up with a 9600 baud Linux console,
>>>> confusing users.  
>>>
>>> Is it possible to determine the current baud rate (by reading the hardware
>>> register) and default to that value.
>>> Then if grub has initialised the uart the kernel will use the same
>>> baud rate.  
>>
>> I think so, yes. In addition to the register divider configuration, one
>> would need the input clock rate as well, but that's not a problem.
>>
>> Do you know if any drivers already do this?
> 
> I've seen it done somewhere, certainly x86, but possibly NetBSD.
> That would have been preserving the baud rate set by the bios.
> You don't want the baud rate changing half way through the boot sequence.

I agree in general, but in this case here, the BIOS defaults to 115200:

https://github.com/linux-automation/meta-lxatac/blob/wrynose/meta-lxatac-bsp/recipes-bsp/barebox/files/lxatac/defconfig#L171
https://elixir.bootlin.com/barebox/v2026.06.0/source/common/console.c#L349

Cheers,
Ahmad

> 
> 	David
> 
>>
>> Nevertheless, I would like the LXA device trees changed, even if only
>> to align them with all other existing STM32 device trees.
>>
>> Cheers,
>> Ahmad
>>
>>
>>>
>>> 	David
>>>   
>>>>
>>>> This series fixes this. As the device trees were added at different
>>>> times, they are fixed each in a separate commit with its own Fixes: tag.
>>>>
>>>> ---
>>>> Ahmad Fatoum (3):
>>>>       ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 to 115200
>>>>       ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 to 115200
>>>>       ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600 to 115200
>>>>
>>>>  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 2 +-
>>>>  arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts        | 2 +-
>>>>  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 2 +-
>>>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>>> ---
>>>> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
>>>> change-id: 20260611-lxa-stdout-path-baudrate-7cf454cdae07
>>>>
>>>> Best regards,
>>>> --  
>>>> Ahmad Fatoum <a.fatoum@pengutronix.de>
>>>>
>>>>  
>>>
>>>   
>>
>>
> 
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
