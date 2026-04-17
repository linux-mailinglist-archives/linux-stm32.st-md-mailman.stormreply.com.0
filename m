Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDXPFE7d4WklzQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2026 09:12:14 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA371417C1D
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2026 09:12:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 543E1C87ECF;
	Fri, 17 Apr 2026 07:12:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0A40C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2026 07:12:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 31E1C1A32FE;
 Fri, 17 Apr 2026 07:12:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F3C4F60497;
 Fri, 17 Apr 2026 07:12:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 722BA10460946; 
 Fri, 17 Apr 2026 09:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776409931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=IBacLVtaDD+BG01rHO7esJaLs6bAfvaO0ht5I5JeJ5A=;
 b=1qZcnU3FfRAWiLLrD9RvQE+7jqFv5N4MZhKuMyPs+eKII4hMWEOQgP0ZKUhr7VlDVEQXQl
 +r63/8FS6j054YsoP9zacr6dF9+AX2D2U1plFSffabMCcn6XjMmjJx7SQ85e4sNdjhb72a
 Fd1NB40UEspXATaGNYE+s3Sbumr8TA7M0bwLbfy9rvwJUXc6jqko3Lv8fZZCqAfZJOso11
 s8NAL8gvRFvyKD6KhFa9IdrxzYweb+RhIi37cX+rrpborQe1GGPL0mILxVpNLoX8OBph6g
 +FFRILrQPDXucWndO02cJI09Jvzk1QsnCHlrf8mUsxi7P6Wo5x/wl6CC0P7rJQ==
Message-ID: <680c384c-135f-44cd-a2cd-7e4fd0ec4bf7@bootlin.com>
Date: Fri, 17 Apr 2026 09:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
 <5987484.DvuYhMxLoT@steina-w> <aeC-tc2CooYDoBok@shell.armlinux.org.uk>
 <2410317.ElGaqSPkdT@steina-w> <aeDSTIS9-TDSihbX@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aeDSTIS9-TDSihbX@shell.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 5/6] net: stmmac: move PHY
 handling out of __stmmac_open()/release()
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[lunn.ch,vger.kernel.org,st-md-mailman.stormreply.com,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:alexander.stein@ew.tq-group.com,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:-];
	NEURAL_SPAM(0.00)[0.072];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid]
X-Rspamd-Queue-Id: AA371417C1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 16/04/2026 14:13, Russell King (Oracle) wrote:
> On Thu, Apr 16, 2026 at 02:02:53PM +0200, Alexander Stein wrote:
>> Hi Russel,
>>
>> Am Donnerstag, 16. April 2026, 12:49:25 CEST schrieb Russell King (Oracle):
>>> On Thu, Apr 16, 2026 at 08:20:13AM +0200, Alexander Stein wrote:
>>>> Am Mittwoch, 15. April 2026, 14:59:32 CEST schrieb Russell King (Oracle):
>>>>> On Wed, Apr 15, 2026 at 08:08:40AM +0200, Alexander Stein wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Am Dienstag, 23. September 2025, 13:26:19 CEST schrieb Russell King (Oracle):
>>>>>>> Move the PHY attachment/detachment from the network driver out of
>>>>>>> __stmmac_open() and __stmmac_release() into stmmac_open() and
>>>>>>> stmmac_release() where these actions will only happen when the
>>>>>>> interface is administratively brought up or down. It does not make
>>>>>>> sense to detach and re-attach the PHY during a change of MTU.
>>>>>>
>>>>>> Sorry for coming up now. But I recently noticed this commit breaks changing
>>>>>> the MTU on i.MX8MP. Once I simply change the MTU I run into some DMA error:
>>>>>> $ ip link set dev end1 mtu 1400
>>>>>> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-0
>>>>>> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-1
>>>>>> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-2
>>>>>> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-3
>>>>>> imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-4
>>>>>> imx-dwmac 30bf0000.ethernet end1: Link is Down
>>>>>> imx-dwmac 30bf0000.ethernet end1: Failed to reset the dma
>>>>>> imx-dwmac 30bf0000.ethernet end1: stmmac_hw_setup: DMA engine initialization failed
>>>>>
>>>>> This basically means that a clock is missing. Please provide more
>>>>> information:
>>>>>
>>>>> - what kernel version are you using?
>>>>
>>>> Currently I am using v6.18.22.
>>>> $ ethtool -i end1
>>>> driver: st_gmac
>>>> version: 6.18.22
>>>> firmware-version: 
>>>> expansion-rom-version: 
>>>> bus-info: 30bf0000.ethernet
>>>> supports-statistics: yes
>>>> supports-test: no
>>>> supports-eeprom-access: no
>>>> supports-register-dump: yes
>>>> supports-priv-flags: no
>>>>
>>>>> - has EEE been negotiated?
>>>>
>>>> No. It is marked as not supported
>>>>
>>>> $ ethtool --show-eee end1
>>>> EEE settings for end1:
>>>>         EEE status: not supported
>>>>
>>>>> - does the problem persist when EEE is disabled?
>>>>
>>>> As EEE is not supported the problem occurs even with EEE disabled.
>>>>
>>>>> - which PHY is attached to stmmac?
>>>>
>>>> It is a TI DP83867.
>>>>
>>>> imx-dwmac 30bf0000.ethernet eth1: PHY [stmmac-1:03] driver [TI DP83867] (irq=136)
>>>>
>>>>> - which PHY interface mode is being used to connect the PHY to stmmac?
>>>>
>>>> For this interface
>>>>> phy-mode = "rgmii-id";
>>>> is set.
>>>>
>>>> In case it is helpful. My platform is arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
>>>> Thanks for assisting. If there a further questions, don't hesitate to ask.
>>>
>>> Thanks.
>>>
>>> So, as best I can determine at the moment, we end up with the following
>>> sequence:
>>>
>>> stmmac_change_mtu()
>>>  __stmmac_release()
>>>   phylink_stop()
>>>    phy_stop()
>>>     phy->state = PHY_HALTED
>>>     _phy_state_machine() returns PHY_STATE_WORK_SUSPEND
>>>     _phy_state_machine_post_work()
>>>      phy_suspend()
>>>       genphy_suspend()
>>>        phy_set_bits(phydev, MII_BMCR, BMCR_PDOWN)
>>>
>>> With the DP83867, this causes most of the PHY to be powered down, thus
>>> stopping the clocks, and this causes the stmmac reset to time out.
>>>
>>> Prior to this commit, we would have called phylink_disconnect_phy()
>>> immediately after phylink_stop(), but I can see nothing that would
>>> be affected by this change there (since that also calls
>>> phy_suspend(), but as the PHY is already suspended, this becomes a
>>> no-op.)
>>>
>>> However, __stmmac_open() would have called stmmac_init_phy(), which
>>> would reattach the PHY. This would have called phy_init_hw(), 
>>> resetting the PHY, and phy_resume() which would ensure that the
>>> PDOWN bit is clear - thus clocks would be running.
>>>
>>> As a hack, please can you try calling phylink_prepare_resume()
>>> between the __stmmac_release() and __stmmac_open() in
>>> stmmac_change_mtu(). This should resume the PHY, thus restoring the
>>> clocks necessary for stmmac to reset.
>>
>> I tried the following patch. This works as you suspected.
> 
> Brilliant, thanks for proving the theory why it broke.
> 
> I'll have a think about the best way to solve this, because
> phylink_prepare_resume() is supposed to be paired with phylink_resume()
> and that isn't the case here.
> 
> Please bear with me as my availability for looking at the kernel is
> very unpredictable at present (family health issues.)

FWIW I am able to reproduce this with imx8mp + ksz9131

I can give this a try as Russell isn't available.

Maxime

> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
