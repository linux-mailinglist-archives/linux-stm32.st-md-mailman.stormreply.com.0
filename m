Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C15FAB15FB3
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 13:48:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E778C30883;
	Wed, 30 Jul 2025 11:48:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7817C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jul 2025 08:46:17 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8YNat014089;
 Tue, 29 Jul 2025 10:45:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 dZOnwyJc/z92LBdcHXh09X96k4RSZO3Wfpl7wZweE1U=; b=XwF5dllEtECZLCeq
 JJifgyRlhmk9xDJChmramDEt0vbuK5xkHgtWAt+3NgJRIN5ptXyhNVShV476LLg4
 Ee384LrKR+nfpswuEJva/XjMRNXgsvo8hbbP8LVl9MEDHrSmFyqzQawtuzsnCBjW
 3tndnxRP71fnGUcb/gyVjYA66+Zh5ibkl7EA3Dwq1WXEiz+S+B4vFuf6ZYMSZY4a
 q2laWBj7+d7G208HtTSG+/dDfiFNciLpIqJn7mK7GVivJFGpcouiB626sSwu1a+Y
 57NhNXArM0o9iq4tAasVLMKdxTWdv5qOCH4m8r6AcB4fgaYCSQk3rJK517Rg2EFg
 7ivAsw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4858k51a3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jul 2025 10:45:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 53DFD4004D;
 Tue, 29 Jul 2025 10:44:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8DA065F4E65;
 Tue, 29 Jul 2025 10:43:33 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Jul
 2025 10:43:32 +0200
Message-ID: <77229e46-6466-4cd4-9b3b-d76aadbe167c@foss.st.com>
Date: Tue, 29 Jul 2025 10:43:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ33-006KDR-Nj@rmk-PC.armlinux.org.uk>
 <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
 <aIe5SqLITb2cfFQw@shell.armlinux.org.uk>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <aIe5SqLITb2cfFQw@shell.armlinux.org.uk>
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Mailman-Approved-At: Wed, 30 Jul 2025 11:48:10 +0000
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 6/7] net: stmmac: add helpers
 to indicate WoL enable status
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 7/28/25 19:54, Russell King (Oracle) wrote:
> On Mon, Jul 28, 2025 at 07:28:01PM +0200, Andrew Lunn wrote:
>>> +static inline bool stmmac_wol_enabled_mac(struct stmmac_priv *priv)
>>> +{
>>> +	return priv->plat->pmt && device_may_wakeup(priv->device);
>>> +}
>>> +
>>> +static inline bool stmmac_wol_enabled_phy(struct stmmac_priv *priv)
>>> +{
>>> +	return !priv->plat->pmt && device_may_wakeup(priv->device);
>>> +}
>>
>> I agree this is a direct translation into a helper.
>>
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>
>> I'm guessing at some point you want to change these two
>> helpers. e.g. at some point, you want to try getting the PHY to do the
>> WoL, independent of !priv->plat->pmt?
>>
>>> -	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
>>> +	if (stmmac_wol_enabled_phy(priv))
>>>   		phylink_speed_down(priv->phylink, false);
>>
>> This might be related to the next patch. But why only do speed down
>> when PHY is doing WoL? If the MAC is doing WoL, you could also do a
>> speed_down.
> 
> No idea, but that's what the code currently does, and, as ever with
> a cleanup series, I try to avoid functional changes in cleanup series.
> 
> Also, bear in mind that I can't test any of this.
> 
> We haven't yet been successful in getting WoL working in mainline. It
> _seems_ that the Jetson Xaiver NX platform should be using PHY mode,
> but the Realtek PHY driver is definitely broken for WoL. Even with
> that hacked, and along with other fixes that I've been given, I still
> can't get the SoC to wake up via WoL. In fact, the changes to change
> DT to specify the PHY interrupt as being routed through the PM
> controller results in normal PHY link up/down interrupts no longer
> working.
> 
> I'd like someone else to test functional changes!
> 

Hello Russel,

First of all, thank you for taking the time to improve this code.
What exactly do you mean by hacking? Forcing !priv->plat->pmt?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
