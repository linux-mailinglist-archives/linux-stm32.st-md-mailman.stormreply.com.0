Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4832C2B5D
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 16:32:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59E7BC56630;
	Tue, 24 Nov 2020 15:32:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C143FC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 15:32:49 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AOFWFUL031036; Tue, 24 Nov 2020 16:32:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=STMicroelectronics;
 bh=Ypt08g8yC5E1a0xePLAiZgQfojweHehBCCzNvuLtWM8=;
 b=ct7IcYWFG9R1S++YtI/eB2Q8vNwL6mXtwZlS2wUZq07usEjhSZD7BLNSBiVxQgI0YE6H
 50lJkKkHklPp1rD9O+aZhvbEGPFdmniLjpQjP4Wns0NEuLQEUlLdm7z7cUWH8Fg/t5oR
 /Wf+o7sMQr29/Ks6YbiDniNXGqF/tWNDE3u9i72WtV4mVxe6DXg50Y4OcKG7DMkLXl6u
 cHalXrkDGDXFofZnexU1DdnXaJ+A6K7Namw3ZmD3tbzRNbmXo4srOuXSqDWpWAMwoZPK
 xRA8Uys5hcX8RKXplwdNcgGh0HO9ZvL+Gfj39jTMBSkm8L37ycix4du1ZtEdtuAdqnWi mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y05h898p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 16:32:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7000F10002A;
 Tue, 24 Nov 2020 16:32:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 562A52568E0;
 Tue, 24 Nov 2020 16:32:32 +0100 (CET)
Received: from [10.129.7.42] (10.75.127.50) by SFHDAG1NODE3.st.com
 (10.75.127.3) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Nov
 2020 16:32:30 +0100
Message-ID: <e6cd5bdc3b50dedc4b751f86b8769dad6219591e.camel@st.com>
From: Antonio Borneo <antonio.borneo@st.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>
Date: Tue, 24 Nov 2020 16:31:40 +0100
In-Reply-To: <20201124151716.GG1551@shell.armlinux.org.uk>
References: <20201124143848.874894-1-antonio.borneo@st.com>
 <4684304a-37f5-e0cd-91cf-3f86318979c3@gmail.com>
 <20201124151716.GG1551@shell.armlinux.org.uk>
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_04:2020-11-24,
 2020-11-24 signatures=0
Cc: Andrew Lunn <andrew@lunn.ch>, Salil Mehta <salil.mehta@huawei.com>,
 netdev@vger.kernel.org, linuxarm@huawei.com, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Yonglong Liu <liuyonglong@huawei.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] net: phy: fix auto-negotiation in case of
	'down-shift'
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

On Tue, 2020-11-24 at 15:17 +0000, Russell King - ARM Linux admin wrote:
> On Tue, Nov 24, 2020 at 04:03:40PM +0100, Heiner Kallweit wrote:
> > Am 24.11.2020 um 15:38 schrieb Antonio Borneo:
> > > If the auto-negotiation fails to establish a gigabit link, the phy
> > > can try to 'down-shift': it resets the bits in MII_CTRL1000 to
> > > stop advertising 1Gbps and retries the negotiation at 100Mbps.
> > > 
> > I see that Russell answered already. My 2cts:
> > 
> > Are you sure all PHY's supporting downshift adjust the
> > advertisement bits? IIRC an Aquantia PHY I dealt with does not.
> > And if a PHY does so I'd consider this problematic:
> > Let's say you have a broken cable and the PHY downshifts to
> > 100Mbps. If you change the cable then the PHY would still negotiate
> > 100Mbps only.
> 
> From what I've seen, that is not how downshift works, at least on
> the PHYs I've seen.
> 
> When the PHY downshifts, it modifies the advertisement registers,
> but it also remembers the original value. When the cable is
> unplugged, it restores the setting to what was previously set.

In fact, at least rtl8211f is able to recover the original settings and
returns to 1Gbps once a decent cable gets plugged-in.

> 
> It is _far_ from nice, but the fact is that your patch that Antonio
> identified has broken previously working support, something that I
> brought up when I patched one of the PHY drivers that was broken by
> this very same problem by your patch.

The idea to fix it for a general case was indeed triggered by the fact that
before commit 5502b218e001 this was the norm. I considered it as a
regression.

> 
> That said, _if_ the PHY has a way to read the resolved state rather
> than reading the advertisement registers, that is what should be
> used (as I said previously) rather than trying to decode the
> advertisement registers ourselves. That is normally more reliable
> for speed and duplex.
> 

Wrt rtl8211f I don't have info other then the public datasheet, and there I
didn't found any way other than reading the advertisement register.

I have read the latest comment from Heiner. I will check aqr107!

Thanks
Antonio

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
